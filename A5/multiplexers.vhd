----------------------------------------
-------- Multiplexers ------------------
-------- Architecure  ------------------
----------------------------------------



LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.ALL;

entity multiplexers is 
	generic (n : integer := 32);
	port (
	In_1			: in unsigned(2*n-1 downto 0);
	In_2 			: in unsigned(2*n-1 downto 0);
	In_3 			: in unsigned(2*n-1 downto 0);
	mux_select  : in std_logic_vector(1 downto 0);
	S_mux 	   : out unsigned (2*n-1 downto 0));
	
end multiplexers;

architecture mux1 of multiplexers is

begin
	
	S_mux <= In_1 when mux_select = "00" else In_2 when mux_select = "01" else In_3;

end mux1;



