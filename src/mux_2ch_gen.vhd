library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2ch_gen is
	generic (
		BUS_WIDTH : NATURAL
	);
	port (
		s : in STD_LOGIC;
		a : in STD_LOGIC_VECTOR ((BUS_WIDTH-1) downto 0);
		b : in STD_LOGIC_VECTOR ((BUS_WIDTH-1) downto 0);
		
		z : out STD_LOGIC_VECTOR ((BUS_WIDTH-1) downto 0)
	);
end mux_2ch_gen;

architecture mux_2ch_gen_arch of mux_2ch_gen is
begin
	z <= a when s = '0' else b;
end mux_2ch_gen_arch;
