library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity pwm_gen is
	generic (
		RESOLUTION : NATURAL
	);
	port (
		clk : in STD_LOGIC;

		pol : in STD_LOGIC;

		topval : in STD_LOGIC_VECTOR ((RESOLUTION-1) downto 0);
		fill : in STD_LOGIC_VECTOR ((RESOLUTION-1) downto 0);

		z : out STD_LOGIC
	);
end pwm_gen;

architecture pwm_gen_arch of pwm_gen is
	signal s_z : STD_LOGIC := '0';
begin
	proc_pwm : process (clk, pol, topval, fill)
		variable counter : NATURAL := 0;
	begin
		if (rising_edge(clk)) then
			if (counter > to_integer(unsigned(topval))) then
				counter := 0;
			end if;

			if (counter <= to_integer(unsigned(fill))) then
				s_z <= '1';
			else
				s_z <= '0';
			end if;

			counter := counter + 1;
		end if;
	end process;

	z <= s_z xor pol;
end pwm_gen_arch;
