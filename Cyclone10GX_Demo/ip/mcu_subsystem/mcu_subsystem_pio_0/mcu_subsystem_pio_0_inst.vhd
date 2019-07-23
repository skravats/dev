	component mcu_subsystem_pio_0 is
		port (
			clk        : in  std_logic                     := 'X';             -- clk
			reset_n    : in  std_logic                     := 'X';             -- reset_n
			address    : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- address
			write_n    : in  std_logic                     := 'X';             -- write_n
			writedata  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			chipselect : in  std_logic                     := 'X';             -- chipselect
			readdata   : out std_logic_vector(31 downto 0);                    -- readdata
			in_port    : in  std_logic_vector(31 downto 0) := (others => 'X'); -- in_port
			out_port   : out std_logic_vector(31 downto 0);                    -- out_port
			irq        : out std_logic                                         -- irq
		);
	end component mcu_subsystem_pio_0;

	u0 : component mcu_subsystem_pio_0
		port map (
			clk        => CONNECTED_TO_clk,        --                 clk.clk
			reset_n    => CONNECTED_TO_reset_n,    --               reset.reset_n
			address    => CONNECTED_TO_address,    --                  s1.address
			write_n    => CONNECTED_TO_write_n,    --                    .write_n
			writedata  => CONNECTED_TO_writedata,  --                    .writedata
			chipselect => CONNECTED_TO_chipselect, --                    .chipselect
			readdata   => CONNECTED_TO_readdata,   --                    .readdata
			in_port    => CONNECTED_TO_in_port,    -- external_connection.in_port
			out_port   => CONNECTED_TO_out_port,   --                    .out_port
			irq        => CONNECTED_TO_irq         --                 irq.irq
		);

