library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter_gen is
	generic (
		VALUE_WIDTH : NATURAL
	);

	port (
		clk : in STD_LOGIC;

		clr : in STD_LOGIC;
		value : in STD_LOGIC_VECTOR ((VALUE_WIDTH-1) downto 0);

		ovf : out STD_LOGIC
	);
end counter_gen;

architecture counter_gen_arch of counter_gen is
	signal count : STD_LOGIC_VECTOR ((VALUE_WIDTH-1) downto 0) := (others => '0');
begin
	process (clk, clr, value)
	begin
		if (clr = '1') then
			ovf <= '0';
			count <= (others => '0');
		elsif (rising_edge(clk)) then
			if (count <= value) then
				count <= count + '1';
			end if;

			if ((count + 1) >= value) then
				ovf <= '1';
			else
				ovf <= '0';
			end if;
		end if;
	end process;
end counter_gen_arch;
