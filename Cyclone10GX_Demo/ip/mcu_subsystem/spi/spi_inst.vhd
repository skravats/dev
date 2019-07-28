	component spi is
		port (
			clk           : in  std_logic                     := 'X';             -- clk
			reset_n       : in  std_logic                     := 'X';             -- reset_n
			data_from_cpu : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			data_to_cpu   : out std_logic_vector(15 downto 0);                    -- readdata
			mem_addr      : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- address
			read_n        : in  std_logic                     := 'X';             -- read_n
			spi_select    : in  std_logic                     := 'X';             -- chipselect
			write_n       : in  std_logic                     := 'X';             -- write_n
			irq           : out std_logic;                                        -- irq
			MISO          : in  std_logic                     := 'X';             -- MISO
			MOSI          : out std_logic;                                        -- MOSI
			SCLK          : out std_logic;                                        -- SCLK
			SS_n          : out std_logic_vector(7 downto 0)                      -- SS_n
		);
	end component spi;

	u0 : component spi
		port map (
			clk           => CONNECTED_TO_clk,           --              clk.clk
			reset_n       => CONNECTED_TO_reset_n,       --            reset.reset_n
			data_from_cpu => CONNECTED_TO_data_from_cpu, -- spi_control_port.writedata
			data_to_cpu   => CONNECTED_TO_data_to_cpu,   --                 .readdata
			mem_addr      => CONNECTED_TO_mem_addr,      --                 .address
			read_n        => CONNECTED_TO_read_n,        --                 .read_n
			spi_select    => CONNECTED_TO_spi_select,    --                 .chipselect
			write_n       => CONNECTED_TO_write_n,       --                 .write_n
			irq           => CONNECTED_TO_irq,           --              irq.irq
			MISO          => CONNECTED_TO_MISO,          --         external.MISO
			MOSI          => CONNECTED_TO_MOSI,          --                 .MOSI
			SCLK          => CONNECTED_TO_SCLK,          --                 .SCLK
			SS_n          => CONNECTED_TO_SS_n           --                 .SS_n
		);

