module mcu_subsystem_cpu_0 (
		input  wire        clk,                                 //                       clk.clk
		input  wire        reset_n,                             //                     reset.reset_n
		input  wire        reset_req,                           //                          .reset_req
		output wire [31:0] d_address,                           //               data_master.address
		output wire [3:0]  d_byteenable,                        //                          .byteenable
		output wire        d_read,                              //                          .read
		input  wire [31:0] d_readdata,                          //                          .readdata
		input  wire        d_waitrequest,                       //                          .waitrequest
		output wire        d_write,                             //                          .write
		output wire [31:0] d_writedata,                         //                          .writedata
		input  wire        d_readdatavalid,                     //                          .readdatavalid
		output wire        debug_mem_slave_debugaccess_to_roms, //                          .debugaccess
		output wire [31:0] i_address,                           //        instruction_master.address
		output wire        i_read,                              //                          .read
		input  wire [31:0] i_readdata,                          //                          .readdata
		input  wire        i_waitrequest,                       //                          .waitrequest
		input  wire        i_readdatavalid,                     //                          .readdatavalid
		input  wire [31:0] irq,                                 //                       irq.irq
		output wire        debug_reset_request,                 //       debug_reset_request.reset
		input  wire [8:0]  debug_mem_slave_address,             //           debug_mem_slave.address
		input  wire [3:0]  debug_mem_slave_byteenable,          //                          .byteenable
		input  wire        debug_mem_slave_debugaccess,         //                          .debugaccess
		input  wire        debug_mem_slave_read,                //                          .read
		output wire [31:0] debug_mem_slave_readdata,            //                          .readdata
		output wire        debug_mem_slave_waitrequest,         //                          .waitrequest
		input  wire        debug_mem_slave_write,               //                          .write
		input  wire [31:0] debug_mem_slave_writedata,           //                          .writedata
		input  wire        A_ci_multi_done,                     // custom_instruction_master.done
		input  wire [31:0] A_ci_multi_result,                   //                          .multi_result
		output wire [4:0]  A_ci_multi_a,                        //                          .multi_a
		output wire [4:0]  A_ci_multi_b,                        //                          .multi_b
		output wire [4:0]  A_ci_multi_c,                        //                          .multi_c
		output wire        A_ci_multi_clk_en,                   //                          .clk_en
		output wire        A_ci_multi_clock,                    //                          .clk
		output wire        A_ci_multi_reset,                    //                          .reset
		output wire        A_ci_multi_reset_req,                //                          .reset_req
		output wire [31:0] A_ci_multi_dataa,                    //                          .multi_dataa
		output wire [31:0] A_ci_multi_datab,                    //                          .multi_datab
		output wire [7:0]  A_ci_multi_n,                        //                          .multi_n
		output wire        A_ci_multi_readra,                   //                          .multi_readra
		output wire        A_ci_multi_readrb,                   //                          .multi_readrb
		output wire        A_ci_multi_start,                    //                          .start
		output wire        A_ci_multi_writerc,                  //                          .multi_writerc
		input  wire [31:0] E_ci_combo_result,                   //                          .result
		output wire [4:0]  E_ci_combo_a,                        //                          .a
		output wire [4:0]  E_ci_combo_b,                        //                          .b
		output wire [4:0]  E_ci_combo_c,                        //                          .c
		output wire [31:0] E_ci_combo_dataa,                    //                          .dataa
		output wire [31:0] E_ci_combo_datab,                    //                          .datab
		output wire        E_ci_combo_estatus,                  //                          .estatus
		output wire [31:0] E_ci_combo_ipending,                 //                          .ipending
		output wire [7:0]  E_ci_combo_n,                        //                          .n
		output wire        E_ci_combo_readra,                   //                          .readra
		output wire        E_ci_combo_readrb,                   //                          .readrb
		output wire        E_ci_combo_writerc                   //                          .writerc
	);
endmodule

