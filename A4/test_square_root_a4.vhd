LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.numeric_std.ALL;


ENTITY test_square_root_a4 IS
	generic(
		n : integer :=32 );
END test_square_root_a4;

architecture a1 of test_square_root_a4 is   
	

	signal clk : std_logic 		:=	'0';	 	
	signal reset : std_logic	:=	'0';
	signal start : std_logic;	 		
	signal N_in : unsigned(2*n-1 downto 0);	
	signal results : unsigned(n-1 downto 0):= (others => '0');
	signal finished : std_logic := '0';	

begin


UUT : entity work.square_root(a4_trial)
		port map(
			reset 		=> reset,
			clk 			=> clk,
			start 	   => start,
			N_in			=> N_in,
			results		=> results,
			finished		=> finished
		);

reset <= '0', '1' after 20 ns;
start <= '0', '1' after 40 ns, '0' after 350 ns;

------clock process--------
---------------------------
process 
begin

  clk <= '0';
  
	for i in 1 to 200 loop
		clk <= not clk;
		wait for 10 ns;
		clk <= not clk;
		wait for 10 ns;
	end loop;
	
	wait;
	
end process;

	
N_in <= 
	(2=> '1', others => '0') after 0 ns,
	(16=> '1', others => '0') after 100 ns,
	(18=> '1', others => '0') after 200 ns,
	(20=> '1', others => '0') after 300 ns,
	(48=> '1', others => '0') after 400 ns,
	(63=> '1', others => '0') after 500 ns;	
		

end architecture a1 ;