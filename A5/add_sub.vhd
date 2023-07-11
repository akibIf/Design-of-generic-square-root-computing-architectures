----------------------------------------
-------- Adder & Subtractor -----------
--======================================
-------- Architecure  ------------------
----------------------------------------


LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.numeric_std.ALL;

entity add_sub is 

	generic (n : integer := 32);

	port (
	A: in unsigned(2*n-1 downto 0);
	B : in unsigned(2*n-1 downto 0);
	add_sub_select : in std_logic;
	S : out signed (2*n downto 0));
	
end add_sub;

architecture adder_subtractor of add_sub is
	begin

		S <= resize(signed(A+B), S'length) when add_sub_select = '1' else resize(signed(A)-signed(B), S'length);

	end adder_subtractor;



