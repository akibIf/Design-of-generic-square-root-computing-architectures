-------------------------------------------------------------------------------------
-- Project: Design of generic square root computing architectures on FPGA using VHDL
--===================================================================================
-- square root's entity
------------------------------------------------------------------------------------
 
 
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.numeric_std.ALL;


entity square_root is 
	generic (n : integer := 32);
	port (
	X			: in unsigned(2*n-1 downto 0);
	start	   : in std_logic;
	reset		: in std_logic;
	clk		: in std_logic;
	results	: out unsigned(n-1 downto 0);
	finished : out std_logic);
	
end square_root;
 
