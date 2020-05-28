/*
 * ethernet.h
 *
 *  Created on: Apr 15, 2020
 *      Author: A90282
 */

#ifndef ETHERNET_H_
#define ETHERNET_H_

#include <system.h>
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <sys/alt_timestamp.h>

#include <altera_msgdma.h>
#include <altera_msgdma_descriptor_regs.h>  //include the sgdma descriptor
#include <altera_msgdma_csr_regs.h>         //include the sgdma registers
#include <altera_msgdma_prefetcher_regs.h>
#include <altera_msgdma_response_regs.h>
#include <altera_avalon_pio_regs.h>
#include <altera_eth_tse.h>
#include <altera_eth_tse_regs.h>
#include <altera_avalon_tse.h>
#include <altera_avalon_i2c.h>
#include <altera_avalon_spi.h>
#include <sys/alt_stdio.h>
#include <sys/alt_irq.h>
#include <altera_avalon_timer_regs.h>

#define APP_STARTUP_DELAY_S   5
#define ALTERA_TSEMAC_CMD_DISABLE_READ_TIMEOUT_MSK           (0x00000001 << 27)

#define ETHERNET_HEADER_MAC_REMOVE     2
#define ETHERNET_BUF_NUM               128
#define ETHERNET_BUF_SIZE              1600
#define ARP_TABLE_NUM                  32
#define SOCKET_MAX_ITEMS               8

#define ETHERNET_PROTOCOL_ARP    0x0800
#define ARP_OPCODE_REQUEST       0x0001
#define ARP_OPCODE_RESPONSE      0x0002

//----- PROTOCOL DEFINITIONS -----
#define IPV4_PROTOCOL_UDP        0x11
#define IPV4_PROTOCOL_ICMP       0x01
#define IPV4_PROTOCOL_IGMP       0x02
#define IPV4_PROTOCOL_GGP        0x03


//----- ETHERNET PACKET DEFINITIONS -----
#define ETHERNET_HARDWARE_TYPE   0x0001
#define ETHERNET_TYPE_ARP        0x0806
#define ETHERNET_TYPE_IP         0x0800

/* mSGDMA response register map */
#define MSGDMA_RESP_BYTES_TRANSFERRED  0x00
#define MSGDMA_RESP_STATUS             0x04

#define MSGDMA_CSR_RW_FILL_LEVEL       0x08     /* 31:16 - write fill level */
                                                /* 15:00 - read fill level */
#define MSGDMA_CSR_RESP_FILL_LEVEL     0x0c     /* response FIFO fill level */

#define MSGDMA_CSR_SEQUENCE_NUMBER     0x10     /* read/write sequence number */


#define MAC_ADDR_LENGTH          6
#define IP_ADDR_LENGTH           4

void phy_ethernet_reset();
void hw_ethernet_reset(void);

alt_32 phy_cfg(np_tse_mac *pmac);

void rx_ethernet_isr (void *context);
void tx_ethernet_isr (void *context);


typedef enum _ARP_STATE
{
   SM_ARP_IDLE,
   SM_ARP_SEND_REPLY
} ARP_STATE;

//----- STACK STATE MACHINE STATES -----
typedef enum _ETH_STACK_STATE
{
   SM_ETH_STACK_IDLE,
   SM_ETH_STACK_ARP,
   SM_ETH_STACK_IP,
   SM_ETH_STACK_ICMP,
   SM_ETH_STACK_ICMP_REPLY,
   SM_ETH_STACK_UDP,
   SM_ETH_STACK_TCP

} ETH_STACK_STATE;

typedef void (*ethernet_rx_cb)(uint8_t *buffer, uint32_t len);

typedef struct _ethernet_strap_t
{
   unsigned char phy_address;
   unsigned char duplex;
   unsigned char config;
   unsigned char iso;
   unsigned char speed;
   unsigned char auto_negotiation;
   unsigned char broadcast_off;
   unsigned char nand_tree;
}__attribute__((packed, aligned(1))) ethernet_strap_t;

typedef struct _mac_addr_t
{
   unsigned char address[MAC_ADDR_LENGTH];
}__attribute__((packed, aligned(1))) mac_addr_t;

typedef union _ip_addr_t
{
   uint8_t addr8[IP_ADDR_LENGTH];
   uint32_t addr32;
}__attribute__((packed, aligned(1))) ip_addr_t;

typedef union _ip_addr_mask_t
{
   uint8_t mask8[IP_ADDR_LENGTH];
   uint32_t mask32;
}__attribute__((packed, aligned(1))) ip_addr_mask_t;

typedef struct _eth_hdr_t
{
   mac_addr_t destination;
   mac_addr_t source;
   uint16_t   type;
} __attribute__((packed, aligned(1))) eth_hdr_t;

typedef struct _ipv4_hdr_t
{
   uint8_t hdr_len : 4;
   uint8_t version : 4;
   uint8_t type;
   uint16_t len;
   uint16_t identification;
   uint16_t flags;
   uint8_t ttl;
   uint8_t protocol;
   uint16_t checksum;
   ip_addr_t sender_ip_addr;
   ip_addr_t target_ip_addr;
}__attribute__((packed, aligned(1))) ipv4_hdr_t;

typedef struct _icmp_hdr_t
{
   uint8_t type;
   uint8_t code;
   uint16_t checksum;
   uint16_t id;
   uint16_t sequence;
}__attribute__((packed, aligned(1))) icmp_hdr_t;

typedef struct _icmp_packet_t
{
   eth_hdr_t eth_hdr;
   ipv4_hdr_t ipv4_hdr;
   icmp_hdr_t icmp_hdr;
   uint8_t data[0];
}__attribute__((packed, aligned(1))) icmp_packet_t;

typedef struct _ipv4_packet_t
{
   eth_hdr_t eth_hdr;
   ipv4_hdr_t ipv4_hdr;
   uint8_t data[0];
}__attribute__((packed, aligned(1))) ipv4_packet_t;



typedef struct _udp_hdr_t
{
   uint16_t src_port;
   uint16_t dst_port;
   uint16_t len;
   uint16_t checksum;
}__attribute__((packed, aligned(1))) udp_hdr_t;

typedef struct _eth_udp_packet_t
{
   eth_hdr_t  eth_hdr;
   ipv4_hdr_t ipv4_hdr;
   udp_hdr_t  udp_hdr;
   uint8_t data[0];
} __attribute__((packed, aligned(1))) eth_udp_packet_t;



#define ICMP_HEADER_LENGTH       8
#define ICMP_ECHO_REQUEST        8
#define ICMP_ECHO_REPLY          0

#define ARP_REQUEST              0x0100
#define ARP_REPLY                0x0200

typedef struct _arp_hdr_t
{
   uint16_t hw_type;
   uint16_t protocol;
   uint8_t  mac_addr_len;
   uint8_t  protocol_len;
   uint16_t op_code;
   mac_addr_t sender_mac_addr;
   ip_addr_t  sender_ip_addr;
   mac_addr_t target_mac_addr;
   ip_addr_t  target_ip_addr;
}__attribute__((packed, aligned(1))) arp_hdr_t;

void tse_mmd_writereg(np_tse_mac *pmac, alt_u32 mdio, alt_u32 mmd_addr, alt_u32 mmd_reg, alt_u32 mmd_value);
uint32_t tse_mmd_readreg(np_tse_mac *pmac, alt_u32 mdio, alt_u32 mmd_addr, alt_u32 mmd_reg);

typedef struct _device_info_t
{
   mac_addr_t mac_addr;
   ip_addr_t  ip_addr;
}__attribute__((packed, aligned(4))) device_info_t;

typedef struct _arp_device_item_t
{
   device_info_t device_info;
   uint8_t enabled;
   uint32_t time;
} __attribute__((packed, aligned(4))) arp_device_item_t;

typedef struct _arp_packet_t
{
   eth_hdr_t eth_hdr;
   arp_hdr_t arp_hdr;
   uint8_t data[0];
}__attribute__((packed, aligned(1))) arp_packet_t;


typedef struct _ipv4_socket_t
{
   uint32_t       net_ctx;
   device_info_t  destination;
   uint16_t       eth_type;
   uint8_t        ipv4_type;
   uint32_t       send_cnt;
   uint8_t        version : 4;
   uint8_t        hdr_len : 4;
   uint16_t       src_port;
   uint16_t       dst_port;
   uint8_t        protocol;
   uint32_t       repeat_limit;
   uint8_t        arp_request;
   uint8_t        ready;
   ethernet_rx_cb rx_cb;
}__attribute__((packed, aligned(1))) ipv4_socket_t;

typedef struct _ipv4_socket_item_t
{
   ipv4_socket_t socket;
   uint8_t enabled;
}__attribute__((packed, aligned(4))) ipv4_socket_item_t;

typedef struct _network_ctx_t
{
   ethernet_strap_t     ethernet_straps[2];
   alt_msgdma_dev       *dma_tx_dev;
   alt_msgdma_dev       *dma_rx_dev;
   uint32_t             dma_rx_seq;
   uint32_t             dma_tx_seq;

   alt_msgdma_extended_descriptor rx_descriptor[ETHERNET_BUF_NUM];
   alt_u32              rx_descriptor_idx_rd;
   alt_u32              rx_descriptor_idx_wr;
   alt_u32              rx_dma_armed;

   alt_msgdma_extended_descriptor tx_descriptor[ETHERNET_BUF_NUM];
   alt_u32              tx_descriptor_idx_rd;
   alt_u32              tx_descriptor_idx_wr;

   // network stack
   device_info_t        local_device_info;
   ip_addr_t            gw_ip_addr;
   ip_addr_mask_t       ip_mask;
   ARP_STATE            sm_arp;
   ETH_STACK_STATE      sm_ethernet_stack;
   arp_device_item_t    arp_ipv4_table[ARP_TABLE_NUM];

   int32_t              (*tx_send)(void *ctx, uint8_t *buffer, uint32_t len);

   uint32_t             mtu;

   // RX/TX buffers
   volatile uint8_t     rx_frame[ETHERNET_BUF_SIZE * ETHERNET_BUF_NUM];
   volatile uint8_t     tx_frame[ETHERNET_BUF_SIZE * ETHERNET_BUF_NUM];
   volatile uint32_t    rx_frame_transferred[ETHERNET_BUF_NUM];
   volatile uint32_t    tx_frame_transferred[ETHERNET_BUF_NUM];
   uint8_t              app_enabled;
   alt_timestamp_type   timestamp;
   alt_timestamp_type   ts_start;
   alt_timestamp_type   app_startup_delay;
   uint32_t             ts_frequency;

   ipv4_socket_item_t   sockets_items[SOCKET_MAX_ITEMS];
}__attribute__((packed, aligned(4))) network_ctx_t;

// public API
void arp_initialise(uint32_t handle);
void udp_initialise (uint32_t handle);
void net_initialize(uint32_t handle);
void tcp_ip_process_stack (uint32_t handle);
void ethernet_configure(uint32_t handle);

void ip_task(uint32_t handle);
int32_t udp_send(uint32_t handle, uint8_t* buffer, uint32_t len);
uint32_t open_socket(ip_addr_t target_ip, uint16_t src_port, uint16_t dst_port, uint8_t protocol, ethernet_rx_cb rx_cb);
void close_socket(uint32_t handle);
uint16_t get_free_port();

uint32_t rx_dma_rearm(network_ctx_t *ctx);
uint32_t tx_dma_rearm(network_ctx_t *ctx);

// private API
static int32_t arp_process_rx(network_ctx_t *ctx, void *buffer, uint32_t len);
static int32_t ip_process_rx(network_ctx_t *ctx, void *buffer, uint32_t len);
static int32_t icmp_process(network_ctx_t *ctx, icmp_packet_t *packet, uint32_t len, icmp_packet_t* out);
static int32_t arp_register(network_ctx_t *ctx, mac_addr_t mac_addr, uint32_t ip_addr);
static int32_t udp_process_rx(network_ctx_t *ctx, eth_udp_packet_t *packet, uint32_t len);

#define IORD_ALTERA_MSGDMA_RESPONSE_STATUS(dev)       IORD_32DIRECT(dev->response_base, MSGDMA_RESP_STATUS)
#define IORD_ALTERA_MSGDMA_BYTES_TANSFERRED(dev)      IORD_32DIRECT(dev->response_base, MSGDMA_RESP_BYTES_TRANSFERRED)
#define IORD_ALTERA_MSGDMA_CSR_FILL_LEVEL(dev)        IORD_32DIRECT(dev->csr_base, MSGDMA_CSR_RESP_FILL_LEVEL)
#define IORD_ALTERA_MSGDMA_CSR_WR_FILL_LEVEL(dev)     IORD_32DIRECT(dev->csr_base, MSGDMA_CSR_RW_FILL_LEVEL)
#define IORD_ALTERA_MSGDMA_CSR_SEQ_NUMBER(dev)        IORD_32DIRECT(dev->csr_base, MSGDMA_CSR_SEQUENCE_NUMBER)

#define LEW2BEW( x )   (( ( (x) << 8 ) | ( (x) & 0xFF00 ) >> 8 ) & 0xFFFF)
#define BEW2LEW( x )   (( ( (x) << 8 ) | ( (x) & 0xFF00 ) >> 8 ) & 0xFFFF)


uint32_t get_net_context();
void register_rx_dma(uint32_t handle, alt_msgdma_dev *dev);
void register_tx_dma(uint32_t handle, alt_msgdma_dev *dev);

static uint32_t get_arp(ip_addr_t target_ip, mac_addr_t *mac_addr);

void ethernet_enable(np_tse_mac *tse, uint32_t enabled);
int ethernet_init(network_ctx_t *ctx, np_tse_mac *tse);
uint32_t phy_init(np_tse_mac *tse, alt_u32 loopback);
void network_task(uint32_t handle);
uint32_t network_init();

static inline int32_t mac_compare(mac_addr_t *addr1, mac_addr_t *addr2);

#endif /* ETHERNET_H_ */
