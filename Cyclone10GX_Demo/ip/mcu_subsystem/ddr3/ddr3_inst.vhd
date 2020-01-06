	component ddr3 is
		port (
			global_reset_n                 : in    std_logic                      := 'X';             -- reset_n
			pll_ref_clk                    : in    std_logic                      := 'X';             -- clk
			oct_rzqin                      : in    std_logic                      := 'X';             -- oct_rzqin
			mem_ck                         : out   std_logic_vector(0 downto 0);                      -- mem_ck
			mem_ck_n                       : out   std_logic_vector(0 downto 0);                      -- mem_ck_n
			mem_a                          : out   std_logic_vector(15 downto 0);                     -- mem_a
			mem_ba                         : out   std_logic_vector(2 downto 0);                      -- mem_ba
			mem_cke                        : out   std_logic_vector(0 downto 0);                      -- mem_cke
			mem_cs_n                       : out   std_logic_vector(0 downto 0);                      -- mem_cs_n
			mem_odt                        : out   std_logic_vector(0 downto 0);                      -- mem_odt
			mem_reset_n                    : out   std_logic_vector(0 downto 0);                      -- mem_reset_n
			mem_we_n                       : out   std_logic_vector(0 downto 0);                      -- mem_we_n
			mem_ras_n                      : out   std_logic_vector(0 downto 0);                      -- mem_ras_n
			mem_cas_n                      : out   std_logic_vector(0 downto 0);                      -- mem_cas_n
			mem_dqs                        : inout std_logic_vector(3 downto 0)   := (others => 'X'); -- mem_dqs
			mem_dqs_n                      : inout std_logic_vector(3 downto 0)   := (others => 'X'); -- mem_dqs_n
			mem_dq                         : inout std_logic_vector(31 downto 0)  := (others => 'X'); -- mem_dq
			mem_dm                         : out   std_logic_vector(3 downto 0);                      -- mem_dm
			local_cal_success              : out   std_logic;                                         -- local_cal_success
			local_cal_fail                 : out   std_logic;                                         -- local_cal_fail
			emif_usr_reset_n               : out   std_logic;                                         -- reset_n
			emif_usr_clk                   : out   std_logic;                                         -- clk
			amm_ready_0                    : out   std_logic;                                         -- waitrequest_n
			amm_read_0                     : in    std_logic                      := 'X';             -- read
			amm_write_0                    : in    std_logic                      := 'X';             -- write
			amm_address_0                  : in    std_logic_vector(25 downto 0)  := (others => 'X'); -- address
			amm_readdata_0                 : out   std_logic_vector(255 downto 0);                    -- readdata
			amm_writedata_0                : in    std_logic_vector(255 downto 0) := (others => 'X'); -- writedata
			amm_burstcount_0               : in    std_logic_vector(6 downto 0)   := (others => 'X'); -- burstcount
			amm_byteenable_0               : in    std_logic_vector(31 downto 0)  := (others => 'X'); -- byteenable
			amm_readdatavalid_0            : out   std_logic;                                         -- readdatavalid
			mmr_slave_waitrequest_0        : out   std_logic;                                         -- waitrequest
			mmr_slave_read_0               : in    std_logic                      := 'X';             -- read
			mmr_slave_write_0              : in    std_logic                      := 'X';             -- write
			mmr_slave_address_0            : in    std_logic_vector(9 downto 0)   := (others => 'X'); -- address
			mmr_slave_readdata_0           : out   std_logic_vector(31 downto 0);                     -- readdata
			mmr_slave_writedata_0          : in    std_logic_vector(31 downto 0)  := (others => 'X'); -- writedata
			mmr_slave_burstcount_0         : in    std_logic_vector(1 downto 0)   := (others => 'X'); -- burstcount
			mmr_slave_beginbursttransfer_0 : in    std_logic                      := 'X';             -- beginbursttransfer
			mmr_slave_readdatavalid_0      : out   std_logic                                          -- readdatavalid
		);
	end component ddr3;

	u0 : component ddr3
		port map (
			global_reset_n                 => CONNECTED_TO_global_reset_n,                 --   global_reset_n.reset_n
			pll_ref_clk                    => CONNECTED_TO_pll_ref_clk,                    --      pll_ref_clk.clk
			oct_rzqin                      => CONNECTED_TO_oct_rzqin,                      --              oct.oct_rzqin
			mem_ck                         => CONNECTED_TO_mem_ck,                         --              mem.mem_ck
			mem_ck_n                       => CONNECTED_TO_mem_ck_n,                       --                 .mem_ck_n
			mem_a                          => CONNECTED_TO_mem_a,                          --                 .mem_a
			mem_ba                         => CONNECTED_TO_mem_ba,                         --                 .mem_ba
			mem_cke                        => CONNECTED_TO_mem_cke,                        --                 .mem_cke
			mem_cs_n                       => CONNECTED_TO_mem_cs_n,                       --                 .mem_cs_n
			mem_odt                        => CONNECTED_TO_mem_odt,                        --                 .mem_odt
			mem_reset_n                    => CONNECTED_TO_mem_reset_n,                    --                 .mem_reset_n
			mem_we_n                       => CONNECTED_TO_mem_we_n,                       --                 .mem_we_n
			mem_ras_n                      => CONNECTED_TO_mem_ras_n,                      --                 .mem_ras_n
			mem_cas_n                      => CONNECTED_TO_mem_cas_n,                      --                 .mem_cas_n
			mem_dqs                        => CONNECTED_TO_mem_dqs,                        --                 .mem_dqs
			mem_dqs_n                      => CONNECTED_TO_mem_dqs_n,                      --                 .mem_dqs_n
			mem_dq                         => CONNECTED_TO_mem_dq,                         --                 .mem_dq
			mem_dm                         => CONNECTED_TO_mem_dm,                         --                 .mem_dm
			local_cal_success              => CONNECTED_TO_local_cal_success,              --           status.local_cal_success
			local_cal_fail                 => CONNECTED_TO_local_cal_fail,                 --                 .local_cal_fail
			emif_usr_reset_n               => CONNECTED_TO_emif_usr_reset_n,               -- emif_usr_reset_n.reset_n
			emif_usr_clk                   => CONNECTED_TO_emif_usr_clk,                   --     emif_usr_clk.clk
			amm_ready_0                    => CONNECTED_TO_amm_ready_0,                    --       ctrl_amm_0.waitrequest_n
			amm_read_0                     => CONNECTED_TO_amm_read_0,                     --                 .read
			amm_write_0                    => CONNECTED_TO_amm_write_0,                    --                 .write
			amm_address_0                  => CONNECTED_TO_amm_address_0,                  --                 .address
			amm_readdata_0                 => CONNECTED_TO_amm_readdata_0,                 --                 .readdata
			amm_writedata_0                => CONNECTED_TO_amm_writedata_0,                --                 .writedata
			amm_burstcount_0               => CONNECTED_TO_amm_burstcount_0,               --                 .burstcount
			amm_byteenable_0               => CONNECTED_TO_amm_byteenable_0,               --                 .byteenable
			amm_readdatavalid_0            => CONNECTED_TO_amm_readdatavalid_0,            --                 .readdatavalid
			mmr_slave_waitrequest_0        => CONNECTED_TO_mmr_slave_waitrequest_0,        -- ctrl_mmr_slave_0.waitrequest
			mmr_slave_read_0               => CONNECTED_TO_mmr_slave_read_0,               --                 .read
			mmr_slave_write_0              => CONNECTED_TO_mmr_slave_write_0,              --                 .write
			mmr_slave_address_0            => CONNECTED_TO_mmr_slave_address_0,            --                 .address
			mmr_slave_readdata_0           => CONNECTED_TO_mmr_slave_readdata_0,           --                 .readdata
			mmr_slave_writedata_0          => CONNECTED_TO_mmr_slave_writedata_0,          --                 .writedata
			mmr_slave_burstcount_0         => CONNECTED_TO_mmr_slave_burstcount_0,         --                 .burstcount
			mmr_slave_beginbursttransfer_0 => CONNECTED_TO_mmr_slave_beginbursttransfer_0, --                 .beginbursttransfer
			mmr_slave_readdatavalid_0      => CONNECTED_TO_mmr_slave_readdatavalid_0       --                 .readdatavalid
		);

