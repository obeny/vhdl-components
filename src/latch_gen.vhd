library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity latch_gen is
	generic (
		BUS_WIDTH : NATURAL
	);
	port (
		a : in STD_LOGIC_VECTOR ((BUS_WIDTH-1) downto 0);
		z : out STD_LOGIC_VECTOR ((BUS_WIDTH-1) downto 0);
		n_le : in STD_LOGIC
	);
end latch_gen;

architecture latch_gen_arch of latch_gen is
begin
	z <= a when n_le = '1';
end latch_gen_arch;
