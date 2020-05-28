	component ethernet is
		port (
			clk_in_clk         : in  std_logic                      := 'X';             -- clk
			avm_waitrequest    : in  std_logic                      := 'X';             -- waitrequest
			avm_readdata       : in  std_logic_vector(255 downto 0) := (others => 'X'); -- readdata
			avm_readdatavalid  : in  std_logic                      := 'X';             -- readdatavalid
			avm_response       : in  std_logic_vector(1 downto 0)   := (others => 'X'); -- response
			avm_burstcount     : out std_logic_vector(7 downto 0);                      -- burstcount
			avm_writedata      : out std_logic_vector(255 downto 0);                    -- writedata
			avm_address        : out std_logic_vector(30 downto 0);                     -- address
			avm_write          : out std_logic;                                         -- write
			avm_read           : out std_logic;                                         -- read
			avm_byteenable     : out std_logic_vector(31 downto 0);                     -- byteenable
			avm_debugaccess    : out std_logic;                                         -- debugaccess
			dma_rx_irq_irq     : out std_logic;                                         -- irq
			dma_tx_irq_irq     : out std_logic;                                         -- irq
			tx_clock_clk       : in  std_logic                      := 'X';             -- clk
			misc_xon_gen       : in  std_logic                      := 'X';             -- xon_gen
			misc_xoff_gen      : in  std_logic                      := 'X';             -- xoff_gen
			misc_magic_wakeup  : out std_logic;                                         -- magic_wakeup
			misc_magic_sleep_n : in  std_logic                      := 'X';             -- magic_sleep_n
			misc_ff_tx_crc_fwd : in  std_logic                      := 'X';             -- ff_tx_crc_fwd
			misc_ff_tx_septy   : out std_logic;                                         -- ff_tx_septy
			misc_tx_ff_uflow   : out std_logic;                                         -- tx_ff_uflow
			misc_ff_tx_a_full  : out std_logic;                                         -- ff_tx_a_full
			misc_ff_tx_a_empty : out std_logic;                                         -- ff_tx_a_empty
			misc_rx_err_stat   : out std_logic_vector(17 downto 0);                     -- rx_err_stat
			misc_rx_frm_type   : out std_logic_vector(3 downto 0);                      -- rx_frm_type
			misc_ff_rx_dsav    : out std_logic;                                         -- ff_rx_dsav
			misc_ff_rx_a_full  : out std_logic;                                         -- ff_rx_a_full
			misc_ff_rx_a_empty : out std_logic;                                         -- ff_rx_a_empty
			mdio_mdc           : out std_logic;                                         -- mdc
			mdio_mdio_in       : in  std_logic                      := 'X';             -- mdio_in
			mdio_mdio_out      : out std_logic;                                         -- mdio_out
			mdio_mdio_oen      : out std_logic;                                         -- mdio_oen
			gmii_gmii_rx_d     : in  std_logic_vector(7 downto 0)   := (others => 'X'); -- gmii_rx_d
			gmii_gmii_rx_dv    : in  std_logic                      := 'X';             -- gmii_rx_dv
			gmii_gmii_rx_err   : in  std_logic                      := 'X';             -- gmii_rx_err
			gmii_gmii_tx_d     : out std_logic_vector(7 downto 0);                      -- gmii_tx_d
			gmii_gmii_tx_en    : out std_logic;                                         -- gmii_tx_en
			gmii_gmii_tx_err   : out std_logic;                                         -- gmii_tx_err
			mii_mii_rx_d       : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- mii_rx_d
			mii_mii_rx_dv      : in  std_logic                      := 'X';             -- mii_rx_dv
			mii_mii_rx_err     : in  std_logic                      := 'X';             -- mii_rx_err
			mii_mii_tx_d       : out std_logic_vector(3 downto 0);                      -- mii_tx_d
			mii_mii_tx_en      : out std_logic;                                         -- mii_tx_en
			mii_mii_tx_err     : out std_logic;                                         -- mii_tx_err
			status_set_10      : in  std_logic                      := 'X';             -- set_10
			status_set_1000    : in  std_logic                      := 'X';             -- set_1000
			status_eth_mode    : out std_logic;                                         -- eth_mode
			status_ena_10      : out std_logic;                                         -- ena_10
			rx_clock_clk       : in  std_logic                      := 'X';             -- clk
			avs_waitrequest    : out std_logic;                                         -- waitrequest
			avs_readdata       : out std_logic_vector(31 downto 0);                     -- readdata
			avs_readdatavalid  : out std_logic;                                         -- readdatavalid
			avs_burstcount     : in  std_logic_vector(4 downto 0)   := (others => 'X'); -- burstcount
			avs_writedata      : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- writedata
			avs_address        : in  std_logic_vector(10 downto 0)  := (others => 'X'); -- address
			avs_write          : in  std_logic                      := 'X';             -- write
			avs_read           : in  std_logic                      := 'X';             -- read
			avs_byteenable     : in  std_logic_vector(3 downto 0)   := (others => 'X'); -- byteenable
			avs_debugaccess    : in  std_logic                      := 'X';             -- debugaccess
			rst_in_reset_n     : in  std_logic                      := 'X'              -- reset_n
		);
	end component ethernet;

	u0 : component ethernet
		port map (
			clk_in_clk         => CONNECTED_TO_clk_in_clk,         --     clk_in.clk
			avm_waitrequest    => CONNECTED_TO_avm_waitrequest,    --        avm.waitrequest
			avm_readdata       => CONNECTED_TO_avm_readdata,       --           .readdata
			avm_readdatavalid  => CONNECTED_TO_avm_readdatavalid,  --           .readdatavalid
			avm_response       => CONNECTED_TO_avm_response,       --           .response
			avm_burstcount     => CONNECTED_TO_avm_burstcount,     --           .burstcount
			avm_writedata      => CONNECTED_TO_avm_writedata,      --           .writedata
			avm_address        => CONNECTED_TO_avm_address,        --           .address
			avm_write          => CONNECTED_TO_avm_write,          --           .write
			avm_read           => CONNECTED_TO_avm_read,           --           .read
			avm_byteenable     => CONNECTED_TO_avm_byteenable,     --           .byteenable
			avm_debugaccess    => CONNECTED_TO_avm_debugaccess,    --           .debugaccess
			dma_rx_irq_irq     => CONNECTED_TO_dma_rx_irq_irq,     -- dma_rx_irq.irq
			dma_tx_irq_irq     => CONNECTED_TO_dma_tx_irq_irq,     -- dma_tx_irq.irq
			tx_clock_clk       => CONNECTED_TO_tx_clock_clk,       --   tx_clock.clk
			misc_xon_gen       => CONNECTED_TO_misc_xon_gen,       --       misc.xon_gen
			misc_xoff_gen      => CONNECTED_TO_misc_xoff_gen,      --           .xoff_gen
			misc_magic_wakeup  => CONNECTED_TO_misc_magic_wakeup,  --           .magic_wakeup
			misc_magic_sleep_n => CONNECTED_TO_misc_magic_sleep_n, --           .magic_sleep_n
			misc_ff_tx_crc_fwd => CONNECTED_TO_misc_ff_tx_crc_fwd, --           .ff_tx_crc_fwd
			misc_ff_tx_septy   => CONNECTED_TO_misc_ff_tx_septy,   --           .ff_tx_septy
			misc_tx_ff_uflow   => CONNECTED_TO_misc_tx_ff_uflow,   --           .tx_ff_uflow
			misc_ff_tx_a_full  => CONNECTED_TO_misc_ff_tx_a_full,  --           .ff_tx_a_full
			misc_ff_tx_a_empty => CONNECTED_TO_misc_ff_tx_a_empty, --           .ff_tx_a_empty
			misc_rx_err_stat   => CONNECTED_TO_misc_rx_err_stat,   --           .rx_err_stat
			misc_rx_frm_type   => CONNECTED_TO_misc_rx_frm_type,   --           .rx_frm_type
			misc_ff_rx_dsav    => CONNECTED_TO_misc_ff_rx_dsav,    --           .ff_rx_dsav
			misc_ff_rx_a_full  => CONNECTED_TO_misc_ff_rx_a_full,  --           .ff_rx_a_full
			misc_ff_rx_a_empty => CONNECTED_TO_misc_ff_rx_a_empty, --           .ff_rx_a_empty
			mdio_mdc           => CONNECTED_TO_mdio_mdc,           --       mdio.mdc
			mdio_mdio_in       => CONNECTED_TO_mdio_mdio_in,       --           .mdio_in
			mdio_mdio_out      => CONNECTED_TO_mdio_mdio_out,      --           .mdio_out
			mdio_mdio_oen      => CONNECTED_TO_mdio_mdio_oen,      --           .mdio_oen
			gmii_gmii_rx_d     => CONNECTED_TO_gmii_gmii_rx_d,     --       gmii.gmii_rx_d
			gmii_gmii_rx_dv    => CONNECTED_TO_gmii_gmii_rx_dv,    --           .gmii_rx_dv
			gmii_gmii_rx_err   => CONNECTED_TO_gmii_gmii_rx_err,   --           .gmii_rx_err
			gmii_gmii_tx_d     => CONNECTED_TO_gmii_gmii_tx_d,     --           .gmii_tx_d
			gmii_gmii_tx_en    => CONNECTED_TO_gmii_gmii_tx_en,    --           .gmii_tx_en
			gmii_gmii_tx_err   => CONNECTED_TO_gmii_gmii_tx_err,   --           .gmii_tx_err
			mii_mii_rx_d       => CONNECTED_TO_mii_mii_rx_d,       --        mii.mii_rx_d
			mii_mii_rx_dv      => CONNECTED_TO_mii_mii_rx_dv,      --           .mii_rx_dv
			mii_mii_rx_err     => CONNECTED_TO_mii_mii_rx_err,     --           .mii_rx_err
			mii_mii_tx_d       => CONNECTED_TO_mii_mii_tx_d,       --           .mii_tx_d
			mii_mii_tx_en      => CONNECTED_TO_mii_mii_tx_en,      --           .mii_tx_en
			mii_mii_tx_err     => CONNECTED_TO_mii_mii_tx_err,     --           .mii_tx_err
			status_set_10      => CONNECTED_TO_status_set_10,      --     status.set_10
			status_set_1000    => CONNECTED_TO_status_set_1000,    --           .set_1000
			status_eth_mode    => CONNECTED_TO_status_eth_mode,    --           .eth_mode
			status_ena_10      => CONNECTED_TO_status_ena_10,      --           .ena_10
			rx_clock_clk       => CONNECTED_TO_rx_clock_clk,       --   rx_clock.clk
			avs_waitrequest    => CONNECTED_TO_avs_waitrequest,    --        avs.waitrequest
			avs_readdata       => CONNECTED_TO_avs_readdata,       --           .readdata
			avs_readdatavalid  => CONNECTED_TO_avs_readdatavalid,  --           .readdatavalid
			avs_burstcount     => CONNECTED_TO_avs_burstcount,     --           .burstcount
			avs_writedata      => CONNECTED_TO_avs_writedata,      --           .writedata
			avs_address        => CONNECTED_TO_avs_address,        --           .address
			avs_write          => CONNECTED_TO_avs_write,          --           .write
			avs_read           => CONNECTED_TO_avs_read,           --           .read
			avs_byteenable     => CONNECTED_TO_avs_byteenable,     --           .byteenable
			avs_debugaccess    => CONNECTED_TO_avs_debugaccess,    --           .debugaccess
			rst_in_reset_n     => CONNECTED_TO_rst_in_reset_n      --     rst_in.reset_n
		);

