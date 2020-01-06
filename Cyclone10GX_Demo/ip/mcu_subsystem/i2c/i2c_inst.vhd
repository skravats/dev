	component i2c is
		generic (
			FIFO_DEPTH      : integer := 4;
			FIFO_DEPTH_LOG2 : integer := 2
		);
		port (
			clk       : in  std_logic                     := 'X';             -- clk
			rst_n     : in  std_logic                     := 'X';             -- reset_n
			intr      : out std_logic;                                        -- irq
			addr      : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- address
			read      : in  std_logic                     := 'X';             -- read
			write     : in  std_logic                     := 'X';             -- write
			writedata : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			readdata  : out std_logic_vector(31 downto 0);                    -- readdata
			sda_in    : in  std_logic                     := 'X';             -- sda_in
			scl_in    : in  std_logic                     := 'X';             -- scl_in
			sda_oe    : out std_logic;                                        -- sda_oe
			scl_oe    : out std_logic                                         -- scl_oe
		);
	end component i2c;

	u0 : component i2c
		generic map (
			FIFO_DEPTH      => INTEGER_VALUE_FOR_FIFO_DEPTH,
			FIFO_DEPTH_LOG2 => INTEGER_VALUE_FOR_FIFO_DEPTH_LOG2
		)
		port map (
			clk       => CONNECTED_TO_clk,       --            clock.clk
			rst_n     => CONNECTED_TO_rst_n,     --       reset_sink.reset_n
			intr      => CONNECTED_TO_intr,      -- interrupt_sender.irq
			addr      => CONNECTED_TO_addr,      --              csr.address
			read      => CONNECTED_TO_read,      --                 .read
			write     => CONNECTED_TO_write,     --                 .write
			writedata => CONNECTED_TO_writedata, --                 .writedata
			readdata  => CONNECTED_TO_readdata,  --                 .readdata
			sda_in    => CONNECTED_TO_sda_in,    --       i2c_serial.sda_in
			scl_in    => CONNECTED_TO_scl_in,    --                 .scl_in
			sda_oe    => CONNECTED_TO_sda_oe,    --                 .sda_oe
			scl_oe    => CONNECTED_TO_scl_oe     --                 .scl_oe
		);

