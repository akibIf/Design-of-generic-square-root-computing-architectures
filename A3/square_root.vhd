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

     N_in    	: in unsigned(2*n-1 downto 0);	-- input X
     results 	: out unsigned(n-1 downto 0)		-- Final result
 );
 end square_root;
 
 
 
