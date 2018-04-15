library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mux_1_of_n_gen is
	generic (
		BUS_WIDTH : NATURAL;
		SEL_WIDTH : NATURAL
	);
	port (
		a : in STD_LOGIC_VECTOR ((BUS_WIDTH-1) downto 0);
		s : in STD_LOGIC_VECTOR ((SEL_WIDTH-1) downto 0);

		z : out STD_LOGIC
	);
end mux_1_of_n_gen;

architecture mux_1_of_n_gen_arch of mux_1_of_n_gen is
begin
		z <= a(to_integer(unsigned(s)));
end mux_1_of_n_gen_arch;
