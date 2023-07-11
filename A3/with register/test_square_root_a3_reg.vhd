LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.numeric_std.ALL;
use IEEE.math_real.all;


ENTITY test_square_root_a3 IS
	generic(
		n : integer :=32 );
END test_square_root_a3;

architecture a1 of test_square_root_a3 is   
	signal clk 		: std_logic :='0' ;	
	signal N_in 	: unsigned(2*n-1 downto 0) ;	
	signal results : unsigned(n-1 downto 0);


begin

UUT : entity work.square_root(a3_trial)
		port map(
			clk 		=> clk,
			N_in		=> N_in,
			results	=> results
		);

clk <= not clk after 10 ns;

N_in <= to_unsigned(1, 2*n),
	(2=> '1', others => '0') after 500 ns,
	(16=> '1', others => '0') after 1500 ns,
	(18=> '1', others => '0') after 2000 ns,
	(20=> '1', others => '0') after 2500 ns,
	(48=> '1', others => '0') after 3000 ns,
	(63=> '1', others => '0') after 3500 ns;
end architecture a1 ;