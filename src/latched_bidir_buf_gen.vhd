library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity latched_bidir_buf_gen is
	generic (
		BUS_WIDTH : NATURAL
	);
	port (
		a : inout STD_LOGIC_VECTOR ((BUS_WIDTH-1) downto 0);
		b : inout STD_LOGIC_VECTOR ((BUS_WIDTH-1) downto 0);
		dir : in STD_LOGIC;
		n_le_a : in STD_LOGIC;
		n_le_b : in STD_LOGIC;
		n_oe_a : in STD_LOGIC;
		n_oe_b : in STD_LOGIC
	);
end latched_bidir_buf_gen;

architecture latched_bidir_buf_gen_arch of latched_bidir_buf_gen is
	signal s_a_out : STD_LOGIC_VECTOR ((BUS_WIDTH-1) downto 0);
	signal s_b_out : STD_LOGIC_VECTOR ((BUS_WIDTH-1) downto 0);
begin
	s_a_out <= b when (dir = '0' and n_le_b = '1');
	s_b_out <= a when (dir = '1' and n_le_a = '1');

	a <= s_a_out when (dir = '0' and n_oe_a = '0') else (others => 'Z');
	b <= s_b_out when (dir = '1' and n_oe_b = '0') else (others => 'Z');
end latched_bidir_buf_gen_arch;
