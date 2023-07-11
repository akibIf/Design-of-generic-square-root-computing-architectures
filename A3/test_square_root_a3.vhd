LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.numeric_std.ALL;


ENTITY test_square_root_a3 IS
	generic(
		n : integer :=32 );
END test_square_root_a3;

architecture a1 of test_square_root_a3 is   
	
	signal N_in : unsigned(2*n-1 downto 0) ;	
	signal results : unsigned(n-1 downto 0);

begin


UUT : entity work.square_root(a3)
		port map(
			N_in		=> N_in,
			results		=> results
		);


N_in <= to_unsigned(1, 2*n),
	(2=> '1', others => '0') after 500 ns,
	(16=> '1', others => '0') after 1500 ns,
	(18=> '1', others => '0') after 2000 ns,
	(20=> '1', others => '0') after 2500 ns,
	(48=> '1', others => '0') after 3000 ns,
	(63=> '1', others => '0') after 3500 ns;

end architecture a1 ;