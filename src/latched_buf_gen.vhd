library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

-- LATCHED BUFFER
entity latched_buf_gen is
	generic (
		BUS_WIDTH : NATURAL
	);
	port (
		a : inout STD_LOGIC_VECTOR ((BUS_WIDTH-1) downto 0);
		b : inout STD_LOGIC_VECTOR ((BUS_WIDTH-1) downto 0);
		dir : in STD_LOGIC;
		n_le_a : in STD_LOGIC;
		n_oe_b : in STD_LOGIC
	);
end latched_buf_gen;

architecture latched_buf_gen_arch of latched_buf_gen is
	signal s_a_out : STD_LOGIC_VECTOR ((BUS_WIDTH-1) downto 0);
	signal s_b_out : STD_LOGIC_VECTOR ((BUS_WIDTH-1) downto 0);
begin
	out_proc : process (a, b, dir, n_le_a)
	begin
		if (dir = '0') then
			s_a_out <= b;
		else
			if (n_le_a = '1') then
				s_b_out <= a;
			end if;
		end if;
	end process out_proc;

	a <= (others => 'Z') when dir = '1' else s_a_out;
	b <= (others => 'Z') when (dir = '0' or n_oe_b = '1') else s_b_out;
end latched_buf_gen_arch;
