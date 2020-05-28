/*
 * ethernet.c
 *
 *  Created on: Apr 15, 2020
 *      Author: A90282
 */
#include "ethernet.h"
#include "crc.h"
#include <sys/alt_cache.h>
#include <system.h>
#include <altera_avalon_timer.h>
#include "iioscope.h"

static network_ctx_t network_ctx __attribute__((aligned (4)));

uint16_t swap16(uint16_t value)
{
   return ((value >> 8) | (value << 8));
}

uint32_t swap32(uint32_t value)
{
   // inp: d3 d2 d1 d0
   // out: d0 d1 d2 d3
   return ((value << 24) & (0xff000000)) | ((value << 8) & 0x00ff0000) | ((value > 8) & 0x0000ff00) | ((value >> 24) & 0x000000ff);
}


// Create a receive frame
//volatile unsigned char rx_frame[16384] = { 0 };

//alt_sgdma_descriptor eth1_rx_descriptor;


void tse_mmd_writereg(np_tse_mac *pmac, alt_u32 mdio, alt_u32 mmd_addr, alt_u32 mmd_reg, alt_u32 mmd_value)
{
   IOWR_ALTERA_TSEMAC_MDIO(pmac, mdio, 0x0d, mmd_addr);
   IOWR_ALTERA_TSEMAC_MDIO(pmac, mdio, 0x0e, mmd_reg);
   IOWR_ALTERA_TSEMAC_MDIO(pmac, mdio, 0x0d, mmd_addr | 0x4000);
   IOWR_ALTERA_TSEMAC_MDIO(pmac, mdio, 0x0e, 0x0001);
}

uint32_t tse_mmd_readreg(np_tse_mac *pmac, alt_u32 mdio, alt_u32 mmd_addr, alt_u32 mmd_reg)
{
   uint32_t result;

   IOWR_ALTERA_TSEMAC_MDIO(pmac, mdio, 0x0d, mmd_addr);
   IOWR_ALTERA_TSEMAC_MDIO(pmac, mdio, 0x0e, mmd_reg);
   IOWR_ALTERA_TSEMAC_MDIO(pmac, mdio, 0x0d, mmd_addr | 0x8000);
   result = IORD_ALTERA_TSEMAC_MDIO(pmac, mdio, 0x0e);


   return result;
}


void phy_ethernet_reset(uint32_t reset)
{
   uint32_t direction = IORD_ALTERA_AVALON_PIO_DIRECTION(GPIO_BASE);
   IOWR_ALTERA_AVALON_PIO_DIRECTION(GPIO_BASE, direction | (1<<31));

   if(reset == 0)
   {
      IOWR_ALTERA_AVALON_PIO_SET_BITS(GPIO_BASE, (1<<31));
      usleep(1000); // 10ms
   }
   else
   {
      usleep(1000); // 10ms
      IOWR_ALTERA_AVALON_PIO_CLEAR_BITS(GPIO_BASE, (1<<31));
   }
}

/** Function pointer to read the link status from the PHY specific status register
  * Use this function pointer if the PHY is using different format to store link information in PHY specific status register
  * The above _location variable will not be used if this function pointer is not NULL
  * Table below show the format of the return value required by TSE driver PHY detection
  * ----------------------------------------------------------------------------------
  * |  BIT  | Value: Description                                                     |
  * ----------------------------------------------------------------------------------
  * | 31-17 | Reserved                                                               |
  * |   16  | 1: Error:Invalid speed read from PHY                                   |
  * | 15- 4 | Reserved                                                               |
  * |    3  | 1: 10 Mbps link                                                        |
  * |    2  | 1: 100 Mbps link                                                       |
  * |    1  | 1: 1000 Mbps link                                                      |
  * |    0  | 1: Full Duplex                    0: Half Duplex                       |
  * ----------------------------------------------------------------------------------
  */
static alt_u32 link_status_read(np_tse_mac *pmac)
{
   alt_u32 result = 0;
   alt_u32 status;

   status = IORD(&pmac->mdio0, 1);
   if(status == 0xffff)
   {
      result = (1 << 16);
   }
   else
   {
      result |= ((result & (1<<8)) == (1<<8)) ? (1<<0) : 0x00000000;

      switch(((result >> 13) | (result >> 5)) & 0x3)
      {
         case 0x00:
            result |= (1<<3);
            break;
         case 0x01:
            result |= (1<<2);
            break;
         case 0x02:
            result |= (1<<1);
            break;
      }

   }
   return result;
}

alt_32 phy_cfg(np_tse_mac *pmac)
{
   alt_32 result = 0;

   result = IORD(&pmac->mdio0, 1);
   result |= 0x00000001;
   IOWR(&pmac->mdio0, 1, result);
   usleep(10000);
   result &= (~0x00000001);
   IOWR(&pmac->mdio0, 1, result);

   return result;
}

void hw_ethernet_reset(void)
{
   alt_tse_phy_profile profile;

   sprintf(profile.name, "%s", "Microchip KSZ9031MNX");
   profile.model_number = 1;
   profile.revision_number = 2;
   profile.link_status_read = link_status_read;
   profile.phy_cfg = phy_cfg;
}

void ethernet_configure(uint32_t ctx)
{
   /*
   ctx->ethernet_straps[0].auto_negotiation = 1;
   ctx->ethernet_straps[0].broadcast_off = 0;
   ctx->ethernet_straps[0].config = 0x00;
   ctx->ethernet_straps[0].duplex = 1;
   ctx->ethernet_straps[0].iso = 0;
   ctx->ethernet_straps[0].nand_tree = 0;
   ctx->ethernet_straps[0].phy_address = 0x00;
   ctx->ethernet_straps[0].speed = 1;

   ctx->ethernet_straps[1].auto_negotiation = 1;
   ctx->ethernet_straps[1].broadcast_off = 0;
   ctx->ethernet_straps[1].config = 0x00;
   ctx->ethernet_straps[1].duplex = 1;
   ctx->ethernet_straps[1].iso = 0;
   ctx->ethernet_straps[1].nand_tree = 0;
   ctx->ethernet_straps[1].phy_address = 0x00;
   ctx->ethernet_straps[1].speed = 1;
   */
}

// Transmit Frame function: Here we have defined and initialized the transmit functions and used for transmission of data via 'tx_frame' function
void tx_ethernet_isr (void *context)
{
   /*
   network_ctx_t * net;
   uint32_t dma_fill_level, value;
   net = (network_ctx_t*)context;
   dma_fill_level = IORD_ALTERA_MSGDMA_CSR_WR_FILL_LEVEL(net->dma_tx_dev);
   dma_fill_level &= 0x0000ffff;
   if(dma_fill_level == 0)
   {
      value = IORD_ALTERA_MSGDMA_CSR_CONTROL(net->dma_tx_dev->csr_base);
      value |= ALTERA_MSGDMA_CSR_STOP_DESCRIPTORS_MASK;
      IOWR_ALTERA_MSGDMA_CSR_CONTROL(net->dma_tx_dev->csr_base, value);
   }
   */
}


//////////////////////////////////////////////////////////////////////////////////
// DMA RX ISR Receiver function
void rx_ethernet_isr (void *context)
{
   /*
   //alt_irq_context cpu_sr;
   uint32_t bytes, count, error, idx_wr, idx_st;
   network_ctx_t *ctx = (network_ctx_t*)context;
   //uint32_t rwseq;

   idx_wr = ctx->rx_descriptor_idx_wr;
   idx_st = ctx->rx_descriptor_idx_st;

   count = IORD_ALTERA_MSGDMA_CSR_FILL_LEVEL(ctx->dma_rx_dev);
   while(count)
   {
      bytes = IORD_ALTERA_MSGDMA_BYTES_TANSFERRED(ctx->dma_rx_dev);
      error = IORD_ALTERA_MSGDMA_RESPONSE_STATUS(ctx->dma_rx_dev);
      //rwseq = IORD_ALTERA_MSGDMA_CSR_SEQ_NUMBER(ctx->dma_rx_dev);

      if(error == 0)
      {
         if(bytes > ETHERNET_BUF_SIZE)
         {
            printf("Error: in RX ISR len is too long (0x%x)\n", bytes);
         }
         else
         {
            if(((idx_wr + 1) & (ETHERNET_BUF_NUM-1)) != idx_st)
            {
               ctx->rx_frame_transferred[idx_wr] = bytes;
               idx_wr++;
               idx_wr &= (ETHERNET_BUF_NUM-1);
            }
            else
            {
               printf("Error FIFO buffer overflow\n");
               break;
            }
         }
      }
      else
      {
         // error
         printf("RX DMA Error\n");
      }
      count--;
   }
   ctx->rx_descriptor_idx_wr = idx_wr;
   */
}
//////////////////////////////////////////////////////////////////////////////////
uint32_t rx_dma_rearm(network_ctx_t *ctx)
{
   uint32_t result = 0, counter = 0, status, limit, dma_rx_seq, idx_wr;
   uint32_t error, bytes;
   // check FIFO in MAC device, if not full then insert new descriptors
   status = IORD_ALTERA_MSGDMA_CSR_STATUS(ctx->dma_rx_dev->csr_base);
   if((status & ALTERA_MSGDMA_CSR_DESCRIPTOR_BUFFER_FULL_MASK) == 0x00)
   {
      status = IORD_ALTERA_MSGDMA_CSR_WR_FILL_LEVEL(ctx->dma_rx_dev);
      status >>= 16;
      status &= 0x00000ff;

      // no of available space for new descriptors
      limit = ETHERNET_BUF_NUM - status - 1;

      dma_rx_seq  = ctx->dma_rx_seq;
      idx_wr      = ctx->rx_descriptor_idx_wr;

      while(limit > 0)
      {
         result = alt_msgdma_construct_extended_st_to_mm_descriptor(
               ctx->dma_rx_dev,
               &(ctx->rx_descriptor[idx_wr]),
               (alt_u32*)(&(ctx->rx_frame[idx_wr * ETHERNET_BUF_SIZE])),
               ETHERNET_BUF_SIZE,
               ALTERA_MSGDMA_DESCRIPTOR_CONTROL_ERROR_IRQ_MASK |
               ALTERA_MSGDMA_DESCRIPTOR_CONTROL_END_ON_EOP_MASK,
               dma_rx_seq, 0, 0);

         if(result == 0)
         {
            result = alt_msgdma_extended_descriptor_async_transfer(ctx->dma_rx_dev, &(ctx->rx_descriptor[idx_wr]));
            if(result == 0)
            {
               status = IORD_ALTERA_MSGDMA_CSR_WR_FILL_LEVEL(ctx->dma_rx_dev);
               status >>= 16;
               status &= 0x00000ff;

               counter++;
               dma_rx_seq++;
               dma_rx_seq &= 0x0000ffff;

               idx_wr++;
               idx_wr &= (ETHERNET_BUF_NUM-1);
            }
         }
         limit--;
      }
      if(counter > 0)
      {
         ctx->rx_descriptor_idx_wr  = idx_wr;
         ctx->dma_rx_seq            = dma_rx_seq;
      }
   }
   status = IORD_ALTERA_MSGDMA_CSR_STATUS(ctx->dma_rx_dev->csr_base);

   result = counter;

   return result;
}

uint32_t tx_dma_rearm(network_ctx_t *ctx)
{
   int result = 0;
   uint32_t count;
   count = IORD_ALTERA_MSGDMA_CSR_WR_FILL_LEVEL(ctx->dma_tx_dev);

   if(count == 0)
   {
      ctx->tx_descriptor_idx_rd = ctx->tx_descriptor_idx_wr;
   }
   else
   {
      ctx->tx_descriptor_idx_rd = (ctx->tx_descriptor_idx_wr - count) & (ETHERNET_BUF_NUM-1);
   }

   return result;
}


void arp_initialise(uint32_t handle)
{
   network_ctx_t *ctx = (network_ctx_t*)handle;
   uint32_t i;
   ctx->sm_arp = SM_ARP_IDLE;

   for(i = 0; i < ARP_TABLE_NUM; i++)
   {
      ctx->arp_ipv4_table[i].enabled = 0;
   }
}

void udp_initialise (uint32_t handle)
{

}

static inline int32_t mac_compare(mac_addr_t *addr1, mac_addr_t *addr2)
{
   int32_t result = 0;
   if((addr1->address[0] == addr2->address[0]) &&
   (addr1->address[1] == addr2->address[1]) &&
   (addr1->address[2] == addr2->address[2]) &&
   (addr1->address[3] == addr2->address[3]) &&
   (addr1->address[4] == addr2->address[4]) &&
   (addr1->address[5] == addr2->address[5]))
   {
      result = 1;
   }
   return result;
}

void tcp_ip_process_stack (uint32_t handle)
{
   void *ptr;
   uint32_t bytes, error, count, status, idx_rd;
   eth_hdr_t *eth_hdr;
   network_ctx_t *ctx = (network_ctx_t*)handle;

   status = IORD_ALTERA_MSGDMA_CSR_STATUS(ctx->dma_rx_dev->csr_base);

   // response buffer is not empty
   if((status & ALTERA_MSGDMA_CSR_RESPONSE_BUFFER_EMPTY_MASK) != ALTERA_MSGDMA_CSR_RESPONSE_BUFFER_EMPTY_MASK)
   {
      idx_rd = ctx->rx_descriptor_idx_rd;
      count = IORD_ALTERA_MSGDMA_CSR_FILL_LEVEL(ctx->dma_rx_dev);
      if(count > 0)
      {
         while(count)
         {
            bytes = IORD_ALTERA_MSGDMA_BYTES_TANSFERRED(ctx->dma_rx_dev);
            error = IORD_ALTERA_MSGDMA_RESPONSE_STATUS(ctx->dma_rx_dev);

            ////////////////////////////////////////////////////////////////////////////
            // processing frame
            if(bytes >= (64+ETHERNET_HEADER_MAC_REMOVE-4))
            {
               if(bytes < ETHERNET_BUF_SIZE)
               {
                  ptr = (void*)(&(ctx->rx_frame[idx_rd * ETHERNET_BUF_SIZE + ETHERNET_HEADER_MAC_REMOVE]));
                  alt_dcache_flush(ptr, bytes);
                  eth_hdr = (eth_hdr_t*)ptr;

                  //if(eth_hdr->destination)

                  switch(eth_hdr->type)
                  {
                     // ARP packet
                     case LEW2BEW(0x0806):
                        ctx->sm_ethernet_stack = SM_ETH_STACK_ARP;
                        status = arp_process_rx(ctx, eth_hdr, bytes - ETHERNET_HEADER_MAC_REMOVE);
                        break;

                     // IP packet
                     case LEW2BEW(0x0800):
                        if(mac_compare(&(eth_hdr->destination), &(ctx->local_device_info.mac_addr)))
                        {
                           ctx->sm_ethernet_stack = SM_ETH_STACK_IP;
                           status = ip_process_rx(ctx, eth_hdr, bytes - ETHERNET_HEADER_MAC_REMOVE);
                        }
                        break;

                     // unknown packet
                     default:
                        status = 0;
                        break;
                  }
               }
               else
               {
                  // error
                  printf("Error: length is invalid (0x%x)\n", bytes);
               }
            }
            else
            {
               printf("Short frame: %d\n", bytes);
            }
            ////////////////////////////////////////////////////////////////////////////
            count--;
            idx_rd = ((idx_rd + 1) & (ETHERNET_BUF_NUM - 1));
         }
         ctx->rx_descriptor_idx_rd = idx_rd;
      }
   }
}




static int32_t tx_send(void *ctx, uint8_t *buffer, uint32_t len)
{
   uint8_t *__restrict ptr;
   uint32_t idx_wr, idx_rd, i, fcs, padding = 0, dma_tx_seq;
   network_ctx_t *net = (network_ctx_t*)ctx;
   int32_t result = 0;

   idx_wr         = net->tx_descriptor_idx_wr;
   idx_rd         = net->tx_descriptor_idx_rd;
   dma_tx_seq     = net->dma_tx_seq;

   if(((idx_wr + 1) & (ETHERNET_BUF_NUM-1)) != idx_rd)
   {
      ptr         = &(net->tx_frame[idx_wr * ETHERNET_BUF_SIZE]);

      for(i = 0; i < ETHERNET_HEADER_MAC_REMOVE; i ++)
      {
         ptr[i] = 0;
      }
      ptr += ETHERNET_HEADER_MAC_REMOVE;

      memcpy(ptr, buffer, len);
      if(len < 60)
      {
         padding = 60 - len;
         memset(ptr+len, 0x00, padding);
         len = 60;
      }

      fcs = fcs_crc32(ptr, len);

      ptr[len++] = ((uint8_t)(fcs >> 0))  & 0xff;
      ptr[len++] = ((uint8_t)(fcs >> 8))  & 0xff;
      ptr[len++] = ((uint8_t)(fcs >> 16)) & 0xff;
      ptr[len++] = ((uint8_t)(fcs >> 24)) & 0xff;

      result = alt_msgdma_construct_extended_mm_to_st_descriptor(
            net->dma_tx_dev,
            &(net->tx_descriptor[idx_wr]),
            (alt_u32*)(&(net->tx_frame[idx_wr * ETHERNET_BUF_SIZE])),
            len + 2,
            ALTERA_MSGDMA_DESCRIPTOR_CONTROL_GENERATE_SOP_MASK |
            ALTERA_MSGDMA_DESCRIPTOR_CONTROL_GENERATE_EOP_MASK |
            ALTERA_MSGDMA_DESCRIPTOR_CONTROL_TRANSFER_COMPLETE_IRQ_MASK,
            dma_tx_seq, 0, 0);

      if(result == 0)
      {
         alt_dcache_flush(((void*)(&(net->tx_frame[idx_wr * ETHERNET_BUF_SIZE]))), (alt_u32)(len+2));
         result = alt_msgdma_extended_descriptor_async_transfer(net->dma_tx_dev, &(net->tx_descriptor[idx_wr]));
         if(result == 0)
         {
            idx_wr = ((idx_wr + 1) & (ETHERNET_BUF_NUM - 1));
            net->tx_descriptor_idx_wr = idx_wr;
         }
      }
   }
   else
   {
      result = -1;
   }

   return result;
}

void net_deinitialize(network_ctx_t *ctx)
{
   //alt_uncached_free(ctx->rx_frame);
   //alt_uncached_free(ctx->tx_frame);
   //alt_uncached_free(ctx->rx_frame_transferred);
   //alt_uncached_free(ctx->tx_frame_transferred);
}

void net_initialize(uint32_t handle)
{
   network_ctx_t *ctx = (network_ctx_t*)handle;
   memset((void*)handle, 0, sizeof(network_ctx));

   ctx->tx_send                                 = tx_send;
   ctx->local_device_info.ip_addr.addr32        = 0x690aa8c0;
   ctx->local_device_info.mac_addr.address[0]   = 0x00;
   ctx->local_device_info.mac_addr.address[1]   = 0x1c;
   ctx->local_device_info.mac_addr.address[2]   = 0x23;
   ctx->local_device_info.mac_addr.address[3]   = 0x17;
   ctx->local_device_info.mac_addr.address[4]   = 0x4a;
   ctx->local_device_info.mac_addr.address[5]   = 0xcb;


   ctx->ip_mask.mask32                          = 0xffffff00;
   ctx->gw_ip_addr.addr32                       = 0xc0a80801;

   ctx->sm_ethernet_stack                       = SM_ETH_STACK_IDLE;

   ctx->mtu                                     = 1518;

   memset(&ctx->sockets_items, 0, sizeof(ctx->sockets_items));
}


// validation if incoming arp request should be processed or dropped
static int32_t arp_packet_check(network_ctx_t *ctx, arp_packet_t *arp_packet)
{
   int32_t result = 0;
   if(arp_packet->arp_hdr.target_ip_addr.addr32 == ctx->local_device_info.ip_addr.addr32)
   {
      result = 1;
   }
   return result;
}


static int32_t arp_process_rx(network_ctx_t *ctx, void *buffer, uint32_t len)
{
   int32_t result = 0;
   uint32_t tx_len = 0, i;
   char out[2048];
   arp_packet_t *arp_packet = (arp_packet_t*)buffer;
   arp_packet_t *arp_reply = (arp_packet_t*)out;

   if(arp_packet_check(ctx, arp_packet) == 1)
   {
      switch(arp_packet->arp_hdr.op_code)
      {
         case ARP_REQUEST:
            // send back ARP response
            memcpy(arp_reply->eth_hdr.destination.address, arp_packet->eth_hdr.source.address, 6);
            memcpy(arp_reply->eth_hdr.source.address, ctx->local_device_info.mac_addr.address, 6);

            arp_reply->eth_hdr.type = LEW2BEW(0x0806);
            arp_reply->arp_hdr.hw_type = arp_packet->arp_hdr.hw_type;
            arp_reply->arp_hdr.mac_addr_len = MAC_ADDR_LENGTH;
            arp_reply->arp_hdr.op_code = 0x0200;
            arp_reply->arp_hdr.protocol = arp_packet->arp_hdr.protocol;
            arp_reply->arp_hdr.protocol_len = IP_ADDR_LENGTH;

            arp_reply->arp_hdr.sender_ip_addr.addr32 = ctx->local_device_info.ip_addr.addr32;
            memcpy(arp_reply->arp_hdr.sender_mac_addr.address, ctx->local_device_info.mac_addr.address, 6);

            arp_reply->arp_hdr.target_ip_addr.addr32 = arp_packet->arp_hdr.sender_ip_addr.addr32;
            memcpy(arp_reply->arp_hdr.target_mac_addr.address, arp_packet->eth_hdr.source.address, 6);
            memset(arp_reply->data, 0, 32);

            tx_len = sizeof(arp_packet_t);
            if(ctx->tx_send)
            {
               result = ctx->tx_send((void*)ctx, (uint8_t*)arp_reply, tx_len);
            }
            arp_register(ctx, arp_packet->eth_hdr.source, arp_packet->arp_hdr.sender_ip_addr.addr32);
            break;

         case ARP_REPLY:
            for(i = 0; i < SOCKET_MAX_ITEMS; i++)
            {
               if(ctx->sockets_items[i].enabled == 1)
               {
                  if(ctx->sockets_items[i].socket.arp_request == 1)
                  {
                     if(ctx->sockets_items[i].socket.destination.ip_addr.addr32 == arp_packet->arp_hdr.sender_ip_addr.addr32)
                     {
                        ctx->sockets_items[i].enabled = 0;
                        ctx->sockets_items[i].socket.destination.mac_addr = arp_packet->eth_hdr.source;
                        break;
                     }
                  }
               }
            }
            break;
      }
   }

   return result;
}

uint16_t icmp_checksum(icmp_hdr_t *icmp_hdr, uint32_t len)
{
   register uint8_t *ptr = ((uint8_t*)icmp_hdr);
   register uint32_t result = 0, i, carry;

   for(i = 4; i < len; i++)
   {
      result += (i%2==1) ? ((uint32_t)ptr[i]) : (((uint32_t)ptr[i]) << 8);
   }
   result += ((uint32_t)ptr[0]) << 8;
   result += ((uint32_t)ptr[1]);


   while(result & 0xffff0000)
   {
      carry = ((result >> 16) & 0x0000ffff);
      result &= 0x0000ffff;
      result += carry;
   }
   result = (0x0000ffff - result) & 0x0000ffff;
   return (uint16_t)result;
}

static uint16_t checksum16(void *ptr, uint32_t len)
{
   uint32_t result = 0;
   register uint32_t value = 0, carry = 0;
   register uint32_t i = 0;
   register uint8_t *buf = (uint8_t*)ptr;
   for(i = 0; i < len; i+=2)
   {
      if(i == 10) continue;
      value +=  ((((uint32_t)buf[i]) << 8) | ((uint32_t)buf[i+1]));
   }

   while(value & 0xffff0000)
   {
      carry = ((value >> 16) & 0x0000ffff);
      value &= 0x0000ffff;
      value += carry;
   }
   result = (0x0000ffff - value) & 0x0000ffff;

   return (uint16_t)result;
}


static int32_t icmp_process(network_ctx_t *ctx, icmp_packet_t *packet, uint32_t len, icmp_packet_t* out)
{
   int32_t result = 0;
   switch(packet->icmp_hdr.type)
   {
      // echo request
      case 8:
         out->icmp_hdr.type = 0;
         out->icmp_hdr.code = 0;
         out->icmp_hdr.id = packet->icmp_hdr.id;
         out->icmp_hdr.sequence = packet->icmp_hdr.sequence;
         memcpy(out->data, packet->data, len - sizeof(icmp_packet_t) + sizeof(icmp_hdr_t));
         out->icmp_hdr.checksum = LEW2BEW(icmp_checksum(&out->icmp_hdr, (len - sizeof(icmp_packet_t) + sizeof(icmp_hdr_t))));
         result = 8 + (len - sizeof(icmp_packet_t));

         arp_register(ctx, packet->eth_hdr.source, packet->ipv4_hdr.sender_ip_addr.addr32);
         break;
   }
   return result;
}

static int32_t udp_process_rx(network_ctx_t *ctx, eth_udp_packet_t *packet, uint32_t len)
{
   uint32_t i;
   for(i = 0; i < SOCKET_MAX_ITEMS; i ++)
   {
      if(ctx->sockets_items[i].enabled != 0)
      {
         if(ctx->sockets_items[i].socket.src_port == packet->udp_hdr.dst_port)
         {
            if(ctx->sockets_items[i].socket.rx_cb)
            {
               (*ctx->sockets_items[i].socket.rx_cb)((uint8_t*)packet, len);
            }
         }
      }
   }
   return 0;
}

static int32_t ip_process_rx(network_ctx_t *ctx, void *buffer, uint32_t len)
{
   int32_t result = 0;
   uint8_t buf[1600];
   ipv4_packet_t *ipv4_packet = (ipv4_packet_t*)buffer;
   ipv4_packet_t *ipv4_respon = (ipv4_packet_t*)buf;
   icmp_packet_t *icmp;
   eth_udp_packet_t *udp;

   switch(ipv4_packet->ipv4_hdr.protocol)
   {
      // ICMP
      case 0x01:
         icmp = (icmp_packet_t*)buf;
         result = icmp_process(ctx, (icmp_packet_t*)ipv4_packet, len, icmp);
         break;

      // UDP
      case 0x11:
         udp = (eth_udp_packet_t*)buffer;
         result = udp_process_rx(ctx, udp, len);
         break;

      default:
         //ipv4_packet->ipv4_hdr
         break;
   }

   if(result > 0)
   {
      /////////////////////////////////////////////////////////////
      // ethernet header
      memcpy(ipv4_respon->eth_hdr.destination.address, ipv4_packet->eth_hdr.source.address, MAC_ADDR_LENGTH);
      memcpy(ipv4_respon->eth_hdr.source.address, ipv4_packet->eth_hdr.destination.address, MAC_ADDR_LENGTH);
      ipv4_respon->eth_hdr.type = ipv4_packet->eth_hdr.type;

      /////////////////////////////////////////////////////////////
      // IPv4 header
      ipv4_respon->ipv4_hdr.version = ipv4_packet->ipv4_hdr.version;
      ipv4_respon->ipv4_hdr.hdr_len = ipv4_packet->ipv4_hdr.hdr_len;
      ipv4_respon->ipv4_hdr.type = ipv4_packet->ipv4_hdr.type;
      ipv4_respon->ipv4_hdr.len = ipv4_packet->ipv4_hdr.len;
      ipv4_respon->ipv4_hdr.identification = ipv4_packet->ipv4_hdr.identification;
      ipv4_respon->ipv4_hdr.flags = ipv4_packet->ipv4_hdr.flags;
      ipv4_respon->ipv4_hdr.ttl = ipv4_packet->ipv4_hdr.ttl;
      ipv4_respon->ipv4_hdr.protocol = ipv4_packet->ipv4_hdr.protocol;
      ipv4_respon->ipv4_hdr.sender_ip_addr = ipv4_packet->ipv4_hdr.target_ip_addr;
      ipv4_respon->ipv4_hdr.target_ip_addr = ipv4_packet->ipv4_hdr.sender_ip_addr;

      ipv4_respon->ipv4_hdr.checksum = 0;
      ipv4_respon->ipv4_hdr.checksum = BEW2LEW(checksum16(&ipv4_respon->ipv4_hdr, sizeof(ipv4_hdr_t)));


      if(ctx->tx_send)
      {
         result = ctx->tx_send((void*)ctx, buf, result + sizeof(ipv4_packet_t)); // icmp len + eth hdr + ipv4 hdr
      }
   }

   return result;
}

uint16_t udp_checksum(eth_udp_packet_t *ipv4_packet)
{
   uint32_t result = 0, len, idx;
   len = BEW2LEW(ipv4_packet->udp_hdr.len);
   result += ((uint32_t)ipv4_packet->ipv4_hdr.sender_ip_addr.addr8[0]) << 8;
   result += ((uint32_t)ipv4_packet->ipv4_hdr.sender_ip_addr.addr8[1]);
   result += ((uint32_t)ipv4_packet->ipv4_hdr.sender_ip_addr.addr8[2]) << 8;
   result += ((uint32_t)ipv4_packet->ipv4_hdr.sender_ip_addr.addr8[3]);

   result += ((uint32_t)ipv4_packet->ipv4_hdr.target_ip_addr.addr8[0]) << 8;
   result += ((uint32_t)ipv4_packet->ipv4_hdr.target_ip_addr.addr8[1]);
   result += ((uint32_t)ipv4_packet->ipv4_hdr.target_ip_addr.addr8[2]) << 8;
   result += ((uint32_t)ipv4_packet->ipv4_hdr.target_ip_addr.addr8[3]);

   result += BEW2LEW((uint32_t)ipv4_packet->udp_hdr.dst_port);

   result += BEW2LEW((uint32_t)ipv4_packet->udp_hdr.src_port);

   result += ipv4_packet->ipv4_hdr.protocol;
   result += len;
   result += len;

   len -= sizeof(udp_hdr_t);
   idx = 0;
   while(idx < len)
   {
      if(idx %2 == 0)
      {
         result += ((uint32_t)ipv4_packet->data[idx]) << 8;
      }
      else
      {
         result += ((uint32_t)ipv4_packet->data[idx]);
      }
      idx++;
   }

   while((result & 0xFFFF0000) != 0)
   {
      result = (result & 0x0000FFFF) + ((result >> 16) & 0x0000FFFF);
   }
   result = 0xFFFF - result;

   return (uint16_t)result;
}

uint8_t frame[ETHERNET_BUF_SIZE];

int32_t udp_send(uint32_t handle, uint8_t* buffer, uint32_t len)
{
   network_ctx_t *ctx;
   int32_t result = 0, repeat;
   uint32_t i, tx_len, tx_rest = len, udp_max, idx = 0, fragment;

   ipv4_socket_t *socket = (ipv4_socket_t*)handle;
   eth_udp_packet_t *ipv4_packet = (eth_udp_packet_t*)frame;

   ctx = (network_ctx_t*)(socket->net_ctx);
   udp_max = ctx->mtu - sizeof(eth_udp_packet_t) - 4 - 4;

   tx_rest = len;

   // ethernet header
   ipv4_packet->eth_hdr.destination       = socket->destination.mac_addr;
   ipv4_packet->eth_hdr.source            = ((network_ctx_t*)socket->net_ctx)->local_device_info.mac_addr;
   ipv4_packet->eth_hdr.type              = socket->eth_type;

   // ipv4 header
   ipv4_packet->ipv4_hdr.version          = socket->version;
   ipv4_packet->ipv4_hdr.hdr_len          = socket->hdr_len;
   ipv4_packet->ipv4_hdr.type             = socket->ipv4_type;
   //ipv4_packet->ipv4_hdr.len              = LEW2BEW((sizeof(ipv4_hdr_t) + sizeof(udp_hdr_t) + len));
   ipv4_packet->ipv4_hdr.identification   = 0;
   ipv4_packet->ipv4_hdr.flags            = 0;
   ipv4_packet->ipv4_hdr.ttl              = 0x7f;
   ipv4_packet->ipv4_hdr.protocol         = socket->protocol;
   ipv4_packet->ipv4_hdr.sender_ip_addr   = ((network_ctx_t*)socket->net_ctx)->local_device_info.ip_addr;
   ipv4_packet->ipv4_hdr.target_ip_addr   = socket->destination.ip_addr;
   //ipv4_packet->ipv4_hdr.checksum         = BEW2LEW(checksum16(&ipv4_packet->ipv4_hdr, sizeof(ipv4_hdr_t)));

   // udp header
   ipv4_packet->udp_hdr.src_port          = socket->src_port;
   ipv4_packet->udp_hdr.dst_port          = socket->dst_port;

   if(((network_ctx_t*)socket->net_ctx)->tx_send)
   {
      fragment = 0;
      while(tx_rest > 0)
      {
         tx_len = ((tx_rest > udp_max)? udp_max : tx_rest);
         tx_rest -= tx_len;

         ipv4_packet->data[0] = (fragment >> 24) & 0xff;
         ipv4_packet->data[1] = (fragment >> 16) & 0xff;
         ipv4_packet->data[2] = (fragment >> 8)  & 0xff;
         ipv4_packet->data[3] = (fragment >> 0)  & 0xff;
         fragment++;

         memcpy((ipv4_packet->data + 4), &(buffer[idx]), tx_len);
         idx += tx_len;

         ipv4_packet->ipv4_hdr.len              = LEW2BEW((sizeof(ipv4_hdr_t) + sizeof(udp_hdr_t) + tx_len + 4));
         ipv4_packet->ipv4_hdr.checksum         = BEW2LEW(checksum16(&ipv4_packet->ipv4_hdr, sizeof(ipv4_hdr_t)));
         ipv4_packet->udp_hdr.len               = LEW2BEW(sizeof(udp_hdr_t) + tx_len + 4);

         ipv4_packet->udp_hdr.checksum          = 0;
         ipv4_packet->udp_hdr.checksum          = LEW2BEW(udp_checksum(ipv4_packet));

         repeat = 0;
         while(repeat < socket->repeat_limit)
         {
            result = ((network_ctx_t*)socket->net_ctx)->tx_send((void*)(socket->net_ctx), (uint8_t*)frame, tx_len + sizeof(eth_udp_packet_t) + 4);
            if(result < 0)
            {
               //repeat action
               usleep(100);
               repeat++;
            }
            else
            {
               break;
            }
         }
      }
   }

   return result;
}

static uint32_t mac_addr_compare(mac_addr_t mac_addr1, mac_addr_t mac_addr2)
{
   uint32_t result = 1, i;
   for(i = 0; i < MAC_ADDR_LENGTH; i++)
   {
      if(mac_addr1.address[i] != mac_addr2.address[i])
      {
         result = 0;
         break;
      }
   }
   return result;
}

static int32_t arp_register(network_ctx_t *ctx, mac_addr_t mac_addr, uint32_t ip_addr)
{
   int32_t result = -1;
   uint32_t i, j = -1, found = 0, free = 0;
   for(i = 0; i < ARP_TABLE_NUM; i++)
   {
      if(ctx->arp_ipv4_table[i].enabled == 1)
      {
         if(ctx->arp_ipv4_table[i].device_info.ip_addr.addr32 == ip_addr)
         {
            if(mac_addr_compare(ctx->arp_ipv4_table[i].device_info.mac_addr, mac_addr) == 1)
            {
               found = 1;
               result = i;
               break;
            }
            else
            {
               // rewrite mac address
               ctx->arp_ipv4_table[i].device_info.mac_addr = mac_addr;
               found = 1;
               result = i;
               break;
            }
         }
      }
      else
      {
         if(free == 0)
         {
            free = 1;
            j = i;
         }
      }
   }
   if(found == 0)
   {
      if(free == 1)
      {
         if(j != -1)
         {
            ctx->arp_ipv4_table[j].enabled = 1;
            ctx->arp_ipv4_table[j].device_info.mac_addr = mac_addr;
            ctx->arp_ipv4_table[j].device_info.ip_addr.addr32 = ip_addr;
            result = j;
         }
      }
   }
   return result;
}

uint16_t get_free_port()
{
   uint16_t port = 0;

   return port;
}

void ip_task(uint32_t handle)
{

}

static uint32_t get_arp(ip_addr_t target_ip, mac_addr_t *mac_addr)
{
   uint32_t i;
   uint32_t result = 0;
   for(i = 0; i < ARP_TABLE_NUM; i++)
   {
      if(network_ctx.arp_ipv4_table[i].enabled == 1)
      {
         if(network_ctx.arp_ipv4_table[i].device_info.ip_addr.addr32 == target_ip.addr32)
         {
            //
            *mac_addr = network_ctx.arp_ipv4_table[i].device_info.mac_addr;
            result = 1;
         }
      }
   }
   return result;
}

uint32_t open_socket(ip_addr_t target_ip, uint16_t src_port, uint16_t dst_port, uint8_t protocol, ethernet_rx_cb rx_cb)
{
   uint32_t i, status;
   uint32_t handle = 0;
   mac_addr_t mac_addr;
   for(i = 0; i < SOCKET_MAX_ITEMS; i++)
   {
      if(network_ctx.sockets_items[i].enabled == 0)
      {
         network_ctx.sockets_items[i].socket.net_ctx  = &network_ctx;

         network_ctx.sockets_items[i].socket.dst_port = LEW2BEW(dst_port);
         network_ctx.sockets_items[i].socket.src_port = LEW2BEW(src_port);

         network_ctx.sockets_items[i].socket.protocol = protocol;
         network_ctx.sockets_items[i].socket.version = 4;
         network_ctx.sockets_items[i].socket.hdr_len = 5;
         network_ctx.sockets_items[i].socket.send_cnt = 0;
         network_ctx.sockets_items[i].socket.repeat_limit = 10;
         network_ctx.sockets_items[i].socket.eth_type = 0x0008;
         network_ctx.sockets_items[i].socket.ipv4_type = 0;
         network_ctx.sockets_items[i].socket.destination.ip_addr = target_ip;
         network_ctx.sockets_items[i].socket.rx_cb = rx_cb;
         // check ARP for target
         //
         status = get_arp(target_ip, &mac_addr);
         if(status == 1)
         {
            network_ctx.sockets_items[i].socket.destination.mac_addr = mac_addr;
            network_ctx.sockets_items[i].enabled = 1;
            handle = (uint32_t)(&(network_ctx.sockets_items[i].socket));
         }
         break;
      }
   }

   return handle;
}

void close_socket(uint32_t handle)
{
   uint32_t i;
   for(i = 0; i < SOCKET_MAX_ITEMS; i++)
   {
      if(((uint32_t)&(network_ctx.sockets_items[i].socket)) == handle)
      {
         memset(&(network_ctx.sockets_items[i]), 0, sizeof(ipv4_socket_item_t));
         break;
      }
   }
}

void close_all_sockets()
{
   memset(&network_ctx.sockets_items, 0, sizeof(network_ctx.sockets_items));
}


uint32_t get_net_context()
{
   return (uint32_t)(&network_ctx);
}

void register_rx_dma(uint32_t handle, alt_msgdma_dev *dev)
{
   ((network_ctx_t*)handle)->dma_rx_dev = dev;
}

void register_tx_dma(uint32_t handle, alt_msgdma_dev *dev)
{
   ((network_ctx_t*)handle)->dma_tx_dev = dev;
}

void ethernet_enable(np_tse_mac *tse, uint32_t enabled)
{
   if(enabled == 0)
   {
      phy_ethernet_reset(1);
   }

   tse_mac_SwReset(tse);

   uint32_t value;
   value = IORD_ALTERA_TSEMAC_CMD_CONFIG(tse);
   if(enabled == 0)
   {
      value &= ~(ALTERA_TSEMAC_CMD_TX_ENA_MSK | ALTERA_TSEMAC_CMD_RX_ENA_MSK);
   }
   else
   {
      value |= (ALTERA_TSEMAC_CMD_TX_ENA_MSK | ALTERA_TSEMAC_CMD_RX_ENA_MSK | ALTERA_TSEMAC_CMD_DISABLE_READ_TIMEOUT_MSK);
   }

   IOWR_ALTERA_TSEMAC_CMD_CONFIG(tse, value);

   if(enabled != 0)
   {
      phy_ethernet_reset(0);
   }
}

int ethernet_init(network_ctx_t *ctx, np_tse_mac *tse)
{
   uint32_t value, i;

   // Specify the addresses of the PHY devices to be accessed through MDIO interface
   IOWR_ALTERA_TSEMAC_MDIO_ADDR0(tse, 0x01);
   IOWR_ALTERA_TSEMAC_MDIO_ADDR1(tse, 0x01);

   // Disable read and write transfers and wait
   value = IORD_ALTERA_TSEMAC_CMD_CONFIG(tse);
   value &= ~(ALTERA_TSEMAC_CMD_RX_ENA_MSK | ALTERA_TSEMAC_CMD_TX_ENA_MSK);
   IOWR_ALTERA_TSEMAC_CMD_CONFIG(tse, value);

   usleep(100);

   value = IORD_ALTERA_TSEMAC_CMD_CONFIG(tse);
   if((value & (ALTERA_TSEMAC_CMD_RX_ENA_MSK | ALTERA_TSEMAC_CMD_TX_ENA_MSK)) != 0)
   {
      printf("Error: RX/TX are not disabled\n");
      return -1;
   }

   //MAC FIFO Configuration
   IOWR_ALTERA_TSEMAC_TX_SECTION_EMPTY(tse, ETHERNET_MAC_TRANSMIT_FIFO_DEPTH-16);
   IOWR_ALTERA_TSEMAC_TX_ALMOST_FULL(tse, 3);
   IOWR_ALTERA_TSEMAC_TX_ALMOST_EMPTY(tse, 8);
   IOWR_ALTERA_TSEMAC_RX_SECTION_EMPTY(tse, ETHERNET_MAC_TRANSMIT_FIFO_DEPTH-16);

   IOWR_ALTERA_TSEMAC_RX_ALMOST_FULL(tse, 8);
   IOWR_ALTERA_TSEMAC_RX_ALMOST_EMPTY(tse, 8);

   IOWR_ALTERA_TSEMAC_TX_SECTION_FULL(tse, 16);
   IOWR_ALTERA_TSEMAC_RX_SECTION_FULL(tse, 16);

   IOWR_ALTERA_TSEMAC_MAC_0(tse, 0x17231C00);
   IOWR_ALTERA_TSEMAC_MAC_1(tse, 0x0000CB4A);

   IOWR_ALTERA_TSEMAC_FRM_LENGTH(tse, ctx->mtu);// 6 bytes (dst mac) + 6 bytes (src mac) + 2 bytes (eth type) + 4 bytes (fcs)

   IOWR_ALTERA_TSEMAC_TX_IPG_LENGTH(tse, 12);

   IOWR_ALTERA_TSEMAC_PAUSE_QUANT(tse, 0xffff);

   IOWR_ALTERA_TSEMAC_CMD_CONFIG(tse, 0x00800220);

   usleep(1000);

   IOWR_ALTERA_TSEMAC_CMD_CONFIG(tse, 0x00802220);

   usleep(1000);
   IOWR_ALTERA_TSEMAC_CMD_CONFIG(tse, 0x00800220);

   value = IORD_ALTERA_TSEMAC_CMD_CONFIG(tse);
   i = 0;
   while((value & 0x00800220) != 0x00800220)
   {
      usleep(100);
      value = IORD_ALTERA_TSEMAC_CMD_CONFIG(tse);
      i++;
      if(i >100)
      {
         printf("Error: timeout\n");
         return -1;
      }
   }

   //value |= 0x3;
   value |= 0x8;

   value |= (1<<27);
   value &= ~ALTERA_TSEMAC_CMD_PROMIS_EN_MSK;

   IOWR_ALTERA_TSEMAC_CMD_CONFIG(tse, value);

   usleep(1000);

   value = IORD_ALTERA_TSEMAC_CMD_CONFIG(tse);

   value |= 0x8;
   IOWR_ALTERA_TSEMAC_CMD_CONFIG(tse, value);

   value = IORD_ALTERA_TSEMAC_CMD_CONFIG(tse);

   // additional
   value = IORD_ALTERA_TSEMAC_TX_CMD_STAT(tse);
   value |= (1<<17);
   IOWR_ALTERA_TSEMAC_TX_CMD_STAT(tse, value);

   value = IORD_32DIRECT(tse, 0xd0 * 4);
   value |= (0x8 << 16);
   value |= 0x8;
   IOWR_32DIRECT(tse, 0xd0 * 4, value);

   return 0;
}


uint32_t phy_init(np_tse_mac *tse, alt_u32 loopback)
{
   uint32_t result = 0;

   //uint32_t tse_mmd_readreg(np_tse_mac *pmac, alt_u32 mdio, alt_u32 mmd_addr, alt_u32 mmd_reg)
   result = tse_mmd_readreg(tse, 0, 0, 3);

   result = tse_mmd_readreg(tse, 0, 2, 1);
   result = tse_mmd_readreg(tse, 0, 2, 0);


   //tse_mmd_writereg(np_tse_mac *pmac, alt_u32 mdio, alt_u32 mmd_addr, alt_u32 mmd_reg, alt_u32 mmd_value)
   tse_mmd_writereg(tse, 0, 2, 0, result | (1<<4) | (1<<1));

   result = tse_mmd_readreg(tse, 0, 2, 0);


   result = IORD_32DIRECT(&tse->mdio0, 0);
   if(loopback == 0)
   {
      result &= ~(1<<14);
   }
   else
   {
      result |= (1<<14);
   }
   IOWR_32DIRECT(&tse->mdio0, 0, result);
   result = IORD_32DIRECT(&tse->mdio0, 0);

   return result;
}

uint32_t network_init()
{
   uint32_t                      handle = 0;
   alt_msgdma_dev                *dma_rx_dev;
   alt_msgdma_dev                *dma_tx_dev;
   np_tse_mac                    *tse = (np_tse_mac *)ETHERNET_MAC_BASE;

   IOWR_ALTERA_AVALON_TIMER_CONTROL(TIMER_0_BASE, 0x0000);
   IOWR_ALTERA_AVALON_TIMER_STATUS(TIMER_0_BASE, 0x0000);

   handle = get_net_context();

   // network initialization
   net_initialize(handle);
   arp_initialise(handle);
   udp_initialise(handle);

   ethernet_enable(tse, 0);

   // Open the sgdma receive device
   dma_rx_dev = alt_msgdma_open (ETHERNET_DMA_RX_CSR_NAME);
   dma_tx_dev = alt_msgdma_open (ETHERNET_DMA_TX_CSR_NAME);

   register_rx_dma(handle, dma_rx_dev);
   register_tx_dma(handle, dma_tx_dev);

   // Set interrupts for the sgdma receive device
   alt_msgdma_register_callback(dma_rx_dev, rx_ethernet_isr, ALTERA_MSGDMA_CSR_GLOBAL_INTERRUPT_MASK, handle);
   alt_msgdma_register_callback(dma_tx_dev, tx_ethernet_isr, ALTERA_MSGDMA_CSR_GLOBAL_INTERRUPT_MASK, handle);


   hw_ethernet_reset();
   ethernet_init(handle, tse);
   usleep(1000);
   ethernet_enable(tse, 1);

   // PHY reconfiguration
   phy_init(tse, 0);

   alt_timestamp_start();
   ((network_ctx_t*)handle)->ts_frequency       = alt_timestamp_freq();
   ((network_ctx_t*)handle)->app_startup_delay  = APP_STARTUP_DELAY_S;
   ((network_ctx_t*)handle)->app_startup_delay  *= ((network_ctx_t*)handle)->ts_frequency;
   ((network_ctx_t*)handle)->ts_start           = alt_timestamp();
   iioscope_init();

   return handle;
}


void network_task(uint32_t handle)
{
   network_ctx_t *ctx = (network_ctx_t*)handle;
   uint32_t result;

   // RX DMA
   result = rx_dma_rearm(handle);

   // TX DMA
   result = tx_dma_rearm(handle);

   // processing
   tcp_ip_process_stack(handle);

   //
   ip_task(handle);

   if(ctx->app_enabled == 0)
   {
      ctx->timestamp = alt_timestamp();
      if((ctx->timestamp - ctx->ts_start) > ctx->app_startup_delay)
      {
         ctx->app_enabled = 1;
      }
   }
   else
   {
      iioscope_process(handle);
   }
}
