library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock_divider_gen is
	generic (
		DIVIDER : NATURAL
	);
	port (
		clk : in STD_LOGIC;

		clr : in STD_LOGIC;

		z : out STD_LOGIC
	);
end clock_divider_gen;

architecture clock_divider_gen_arch of clock_divider_gen is
	signal s_z : STD_LOGIC := '0';
begin
	proc_clock_divider : process (clk, clr)
		variable counter : NATURAL range 0 to DIVIDER := 0;
	begin
		if (clr = '1') then
			counter := 0;
			s_z <= '0';
		elsif (rising_edge(clk)) then
			counter := counter + 1;
			if ((counter + counter) = DIVIDER) then
				counter := 0;
				s_z <= not s_z;
			end if;
		end if;
	end process;

	z <= s_z;
end clock_divider_gen_arch;
