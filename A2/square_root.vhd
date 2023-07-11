-------------------------------------------------------------------------------------
-- Project: Design of generic square root computing architectures on FPGA using VHDL
--===================================================================================
-- square root's entity
------------------------------------------------------------------------------------
 
 
 library IEEE;
 use IEEE.STD_LOGIC_1164.ALL;
 use IEEE.numeric_std.ALL;

 entity square_root is

 generic (n : integer := 32) ;

 port ( 
	 clk			: in std_logic;						-- clock signal
	 reset		: in std_logic;						-- reset signal
    start  	: in std_logic;							-- Start signal to start the operation
    N_in    	: in unsigned(2*n-1 downto 0);	-- input X
    results 	: out unsigned(n-1 downto 0)		-- Final result
    finished 	: out std_logic						-- Finished signal
 );
 end square_root;
 
 
