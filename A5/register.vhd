----------------------------------------
--------- Register ---------------------
-------- Architecure  ------------------
----------------------------------------


LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.ALL;

entity reg is 

	generic (n : integer := 32);
	port (
	input_register: in unsigned(2*n-1 downto 0);
	output_register: out unsigned (2*n-1 downto 0);
	init_value: in unsigned(2*n-1 downto 0);
	ld_signal: in std_logic;
	init: in std_logic;
	clk: in std_logic);
	
end reg;

architecture register1 of reg is
begin

process (clk)

begin
	if rising_edge(clk) then 

		if init 		= '1' then
			
			output_register <= init_value;

		else 
		
			if ld_signal = '1' then
			
				output_register <= input_register;
			
			end if;
		
		end if;

	end if;
	
end process;	
	
end register1;



