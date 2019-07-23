// xcvr_data_flow_controller.v

// This file was auto-generated as a prototype implementation of a module
// created in component editor.  It ties off all outputs to ground and
// ignores all inputs.  It needs to be edited to make it do something
// useful.
// 
// This file will not be automatically regenerated.  You should check it in
// to your version control system if you want to keep it.

`timescale 1 ps / 1 ps
module xcvr_data_flow_controller (
		input  wire [7:0]   csr_s0_address,       //             csr_s0.address
		input  wire         csr_s0_read,          //                   .read
		output reg  [31:0]  csr_s0_readdata,      //                   .readdata
		output reg          csr_s0_readdatavalid, //                   .readdatavalid
		input  wire         csr_s0_write,         //                   .write
		input  wire [31:0]  csr_s0_writedata,     //                   .writedata
		output reg          csr_s0_waitrequest,   //                   .waitrequest
		input  wire [63:0]  rx_parallel_data,     //   rx_parallel_data.rx_parallel_data
		output reg  [63:0]  tx_parallel_data,     //   tx_parallel_data.tx_parallel_data
		input  wire         rx_enh_fifo_full,     //   rx_enh_fifo_full.rx_enh_fifo_full
		input  wire         rx_enh_fifo_pfull,    //  rx_enh_fifo_pfull.rx_enh_fifo_pfull
		input  wire         rx_enh_fifo_empty,    //  rx_enh_fifo_empty.rx_enh_fifo_empty
		input  wire         rx_enh_fifo_pempty,   // rx_enh_fifo_pempty.rx_enh_fifo_pempty
		input  wire         tx_enh_fifo_pempty,   // tx_enh_fifo_pempty.tx_enh_fifo_pempty
		input  wire         tx_enh_fifo_empty,    //  tx_enh_fifo_empty.tx_enh_fifo_empty
		input  wire         tx_enh_fifo_pfull,    //  tx_enh_fifo_pfull.tx_enh_fifo_pfull
		input  wire         tx_enh_fifo_full,     //   tx_enh_fifo_full.tx_enh_fifo_full
		output reg [31:0]   avm_m0_address,       //             avm_m0.address
		output wire         avm_m0_read,          //                   .read
		input  wire         avm_m0_waitrequest,   //                   .waitrequest
		input  wire [31:0]  avm_m0_readdata,      //                   .readdata
		input  wire         avm_m0_readdatavalid, //                   .readdatavalid
		output wire         avm_m0_write,         //                   .write
		output wire [31:0]  avm_m0_writedata,     //                   .writedata
		output reg  [2:0]   tx_control,           //         tx_control.tx_control
		input  wire [9:0]   rx_control,           //         rx_control.rx_control
		input  wire         reset,                //                rst.reset
		input  wire         clock,                //                clk.clk
		input  wire         tx_ready,             //           tx_ready.tx_ready
		input  wire         rx_ready,             //           rx_ready.rx_ready
		output reg          rx_irq,               //             irq_rx.irq
		output reg          tx_enh_data_valid,    //  tx_enh_data_valid.tx_enh_data_valid
		output reg          tx_irq,               //             irq_tx.irq
		input  wire         tx_coreclkin,         //       tx_coreclkin.clk
		input  wire         rx_coreclkin,         //       rx_coreclkin.clk
		output reg          rx_enh_fifo_rd_en,    //  rx_enh_fifo_rd_en
		output reg          tx_err_ins,            //  tx_err_ins
		output reg          reset_phy,
		output reg          pll_locked_out,
		input  wire         pll_powerdown_input,
		output reg          atx_pll_powerdown,
		input  wire         atx_pll_locked,
		output reg          rx_set_locktoref,
		output reg          rx_set_locktodata,
		output reg          tx_enh_frame_burst_en,
		output reg [1:0]    tx_enh_frame_diag_status,
		input  wire [1:0]   rx_enh_frame_diag_status,
		output wire [13:0]  unused_tx_control,
		output wire [63:0]  unused_tx_parallel_data,
		output reg          rx_seriallpbken,
		output wire         pll_select
	);

	assign avm_m0_read = 1'b0;

	assign avm_m0_write = 1'b0;

	assign unused_tx_control = 14'b0;
	
	assign unused_tx_parallel_data = 64'b0;
	
	assign pll_select = 1'b0;
//	assign tx_control = 3'b000;


reg tx_fifo_run_reg;
reg rx_fifo_run_reg;
reg [63:0]rx_data_word;


// CSR reg
reg [31:0] dma_addr_base_wr;
reg [31:0] dma_addr_idx_wr;
reg [31:0] dma_addr_size_wr;
reg dma_wr_irq_en;

reg [31:0] dma_addr_base_rd;
reg [31:0] dma_addr_idx_rd;
reg [31:0] dma_addr_size_rd;
reg dma_rd_irq_en;

reg dma_run_rd;
reg dma_run_rd_start;
reg dma_rd_en;
reg dma_wr_en;

integer reset_atx_pll_counter = 0;
integer tx_burst_cnt = 0;



// main process
always @(posedge clock)
begin
	if(reset) begin
		reset_atx_pll_counter	<= 0;
		rx_irq					<= 1'b0;
		tx_irq					<= 1'b0;
		reset_phy				<= 1'b1;
		pll_locked_out			<= 1'b0;
		atx_pll_powerdown		<= 1'b1;
		rx_set_locktoref		<= 1'b0;
		rx_set_locktodata		<= 1'b0;

		// DMA wr
		dma_run_rd_start		<= 1'b0;
		dma_run_rd				<= 1'b0;
		dma_wr_irq_en			<= 1'b0;
		dma_rd_irq_en			<= 1'b0;
		dma_rd_en				<= 1'b0;
		dma_wr_en				<= 1'b0;

		dma_addr_base_wr		<= 32'b0;
		dma_addr_idx_wr			<= 32'b0;
		dma_addr_size_wr		<= 32'b0;
		
		dma_addr_base_rd		<= 32'b0;
		dma_addr_idx_rd			<= 32'b0;
		dma_addr_size_rd		<= 32'b0;

		csr_s0_readdatavalid	<= 1'b0;
		csr_s0_waitrequest		<= 1'b0;
		
		// rx_seriallpbken
		rx_seriallpbken			<= 1'b0;

	end else begin

		if(reset_atx_pll_counter < 1000)
		begin
			reset_atx_pll_counter <= reset_atx_pll_counter + 1;
		end else begin
			atx_pll_powerdown	<= 1'b0;
			
			if(atx_pll_locked) begin
				pll_locked_out	<= 1'b1;
				reset_phy		<= 1'b0;
			end else begin
				pll_locked_out	<= 1'b0;
				reset_phy		<= 1'b1;
			end
		end
		
		
		// avalon - DMA write
		if(dma_run_rd) begin
			//if(dma_addr_idx_wr < dma_addr_size_rd) begin
			//	avm_m0_address		<= dma_addr_base_wr + dma_addr_idx_wr;
			//	dma_addr_idx_wr		<= dma_addr_idx_wr + 1;			
			//end else begin
			//end
		end
		
		/////////////////////////////////////////////////////////
		// avalon - slave - CSR
		// WR
		if(!csr_s0_read && csr_s0_write) begin

			// DMA RD - dma_addr_base_rd
			if(csr_s0_address == 8'h00) begin
				dma_addr_base_rd	<= csr_s0_writedata;
			end

			// DMA RD - dma_addr_idx_rd
			if(csr_s0_address == 8'h01) begin
				dma_addr_idx_rd		<= csr_s0_writedata;
			end

			// DMA RD - dma_addr_size_rd
			if(csr_s0_address == 8'h02) begin
				dma_addr_size_rd		<= csr_s0_writedata;
			end

			// DMA WR - dma_addr_base_wr
			if(csr_s0_address == 8'h03) begin
				dma_addr_base_wr	<= csr_s0_writedata;
			end

			// DMA WR - dma_addr_idx_wr
			if(csr_s0_address == 8'h04) begin
				dma_addr_idx_wr		<= csr_s0_writedata;
			end

			// DMA WR - dma_addr_size_wr
			if(csr_s0_address == 8'h05) begin
				dma_addr_size_wr	<= csr_s0_writedata;
			end

			// DMA CFG
			if(csr_s0_address == 8'h06) begin
				dma_rd_irq_en		<= csr_s0_writedata[0];
				dma_wr_irq_en		<= csr_s0_writedata[1];
				dma_rd_en			<= csr_s0_writedata[2];
				dma_wr_en			<= csr_s0_writedata[3];
				rx_seriallpbken		<= csr_s0_writedata[4];
			end
			
			// DMA RESET
			if((csr_s0_address == 8'h07) && csr_s0_writedata[0]) begin
				dma_addr_base_rd		<= 32'b0;
				dma_addr_idx_rd			<= 32'b0;
				dma_addr_size_rd		<= 32'b0;
				
				reset_atx_pll_counter	<= 0;
				
				rx_irq					<= 1'b0;
				tx_irq					<= 1'b0;
				reset_phy				<= 1'b1;
				pll_locked_out			<= 1'b0;
				atx_pll_powerdown		<= 1'b1;
				rx_set_locktoref		<= 1'b0;
				rx_set_locktodata		<= 1'b0;

				// DMA wr
				dma_run_rd_start		<= 1'b0;
				dma_run_rd				<= 1'b0;
				dma_wr_irq_en			<= 1'b0;
				dma_rd_irq_en			<= 1'b0;
				dma_rd_en				<= 1'b0;
				dma_wr_en				<= 1'b0;

				dma_addr_base_wr		<= 32'b0;
				dma_addr_idx_wr			<= 32'b0;
				dma_addr_size_wr		<= 32'b0;
				
				dma_addr_base_rd		<= 32'b0;
				dma_addr_idx_rd			<= 32'b0;
				dma_addr_size_rd		<= 32'b0;

				csr_s0_readdatavalid	<= 1'b0;
				csr_s0_waitrequest		<= 1'b0;				
			end

			// DMA Start TX
			if((csr_s0_address == 8'h08) && !dma_run_rd) begin
				dma_run_rd_start	<= csr_s0_writedata[0];
			end

		end

		// RD
		if(csr_s0_read && !csr_s0_write) begin
			// DMA RD - dma_addr_base_rd
			if(csr_s0_address == 8'h00) begin
				csr_s0_readdata		<= dma_addr_base_rd;
			end

			// DMA RD - dma_addr_idx_rd
			if(csr_s0_address == 8'h01) begin
				csr_s0_readdata		<= dma_addr_idx_rd;
			end

			// DMA RD - dma_addr_size_rd
			if(csr_s0_address == 8'h02) begin
				csr_s0_readdata		<= dma_addr_size_rd;
			end

			// DMA WR - dma_addr_base_wr
			if(csr_s0_address == 8'h03) begin
				csr_s0_readdata		<= dma_addr_base_wr;
			end

			// DMA WR - dma_addr_idx_wr
			if(csr_s0_address == 8'h04) begin
				csr_s0_readdata		<= dma_addr_idx_wr;
			end

			// DMA WR - dma_addr_size_wr
			if(csr_s0_address == 8'h05) begin
				csr_s0_readdata		<= dma_addr_size_wr;
			end

			// DMA CFG
			if(csr_s0_address == 8'h06) begin
				csr_s0_readdata[4:0]	<= { rx_seriallpbken, dma_wr_en, dma_rd_en, dma_wr_irq_en, dma_rd_irq_en};
				csr_s0_readdata[31:30]	<= { dma_run_rd, dma_run_rd_start };
			end

			csr_s0_readdatavalid	<= 1'b1;

		end

		if(!csr_s0_read && !csr_s0_write) begin
			csr_s0_waitrequest		<= 1'b0;
			csr_s0_readdatavalid	<= 1'b0;
		end


		// DMA reading data and TX
		if(dma_run_rd_start) begin
			dma_run_rd 			<= 1'b1;
			dma_run_rd_start	<= 1'b0;
		end

	end
end

// main process
always @(negedge clock)
	if(reset) begin
	end else begin
	end
begin
end

	
always @(posedge tx_coreclkin)
begin
	if(reset) begin
		tx_fifo_run_reg 			<= 1'b0;
		tx_parallel_data			<= 64'h00000000;
		tx_enh_data_valid			<= 1'b0;
		tx_err_ins					<= 1'b0;
		tx_enh_frame_burst_en		<= 1'b0;
		tx_enh_frame_diag_status	<= 2'b00;
	end else begin
		tx_control					<= 3'b001;

		if(tx_enh_fifo_empty || tx_enh_fifo_pempty) begin
			tx_enh_frame_burst_en	<= 1'b0;
		end
	
		if(!tx_fifo_run_reg && (tx_enh_fifo_empty || tx_enh_fifo_pempty)) begin
			tx_fifo_run_reg		<= 1'b1;
			tx_parallel_data	<= tx_parallel_data + 1;
			tx_enh_data_valid	<= 1'b1;
		end
		
		if(tx_fifo_run_reg) begin
			tx_parallel_data	<= tx_parallel_data + 1;
		end

		if(tx_enh_fifo_full) begin
			tx_fifo_run_reg			<= 1'b0;
			tx_enh_data_valid		<= 1'b0;
			tx_enh_frame_burst_en	<= 1'b1;
		end
	end
end


always @(posedge rx_coreclkin)
begin
	if(reset) begin
		rx_data_word		<= 64'b0;
		rx_enh_fifo_rd_en	<= 1'b0;
	end else begin
		if(rx_enh_fifo_full || rx_enh_fifo_pfull || rx_enh_fifo_pempty || rx_enh_fifo_rd_en) begin
			rx_enh_fifo_rd_en 	<= 1'b1;
		end

		if((rx_control[3:0] == 4'b1001) && (rx_enh_fifo_full || rx_enh_fifo_pfull || rx_enh_fifo_pempty || rx_enh_fifo_rd_en)) begin
			// get data
			rx_data_word	<= rx_parallel_data;
		end

		
		if(rx_enh_fifo_empty) begin
			rx_enh_fifo_rd_en	<= 1'b0;
		end
	end
end

assign avm_m0_writedata = (dma_addr_idx_wr[2] ? rx_data_word[63:32] : rx_data_word[31:0]);

endmodule
