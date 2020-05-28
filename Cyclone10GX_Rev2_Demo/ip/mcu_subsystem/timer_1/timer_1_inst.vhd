	component timer_1 is
		port (
			clk        : in  std_logic                     := 'X';             -- clk
			reset_n    : in  std_logic                     := 'X';             -- reset_n
			address    : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- address
			writedata  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			readdata   : out std_logic_vector(15 downto 0);                    -- readdata
			chipselect : in  std_logic                     := 'X';             -- chipselect
			write_n    : in  std_logic                     := 'X';             -- write_n
			irq        : out std_logic                                         -- irq
		);
	end component timer_1;

	u0 : component timer_1
		port map (
			clk        => CONNECTED_TO_clk,        --   clk.clk
			reset_n    => CONNECTED_TO_reset_n,    -- reset.reset_n
			address    => CONNECTED_TO_address,    --    s1.address
			writedata  => CONNECTED_TO_writedata,  --      .writedata
			readdata   => CONNECTED_TO_readdata,   --      .readdata
			chipselect => CONNECTED_TO_chipselect, --      .chipselect
			write_n    => CONNECTED_TO_write_n,    --      .write_n
			irq        => CONNECTED_TO_irq         --   irq.irq
		);
