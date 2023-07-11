---------------------------------------------------
------------ Test Bench ---------------------------
------------ Architecture 1------------------------
--=================================================



LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.numeric_std.ALL;


ENTITY test_square_root IS
	generic(
		n : integer :=32 );
END test_square_root;

architecture test of test_square_root is   

	signal clk : std_logic :='0' ;	 	
	signal reset : std_logic;
	signal start : std_logic ;	 		
	signal N_in : unsigned(2*n-1 downto 0) ;	
	signal results : unsigned(n-1 downto 0) ;
	signal finished : std_logic := '0' ;	 		

	

begin


UUT : entity work.square_root(a1)
		port map(
			reset 	=> reset,
			clk 	=> clk,
			start		=> start,
			N_in		=> N_in,
			results		=> results,
			finished		=> finished

		);


reset <= '0', '1' after 50 ns;
 
start <= '0', '1' after 100 ns, '0' after 2000 ns, '1' after 2200 ns;

------------- clock process ---------------
process 
begin
  clk <= '0';
	for i in 1 to 200 loop
		clk <= not clk;
		wait for 50 ns;
		clk <= not clk;
		wait for 50 ns;
	end loop;
	wait;
end process;

N_in <= (6 => '1', others => '0' ), ( 8 => '1',  others => '0') after 2010 ns;



end architecture test ;