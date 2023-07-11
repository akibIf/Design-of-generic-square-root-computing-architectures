architecture a3_trial of square_root is
	type regtype is array (0 to n) of unsigned (2*n-1 downto 0);
	type regtype1 is array (0 to n-1) of unsigned (2*n-1 downto 0);

	signal X :	regtype ;
	signal V :	regtype ;
	signal Z :	regtype ;
	signal Z_temp :	regtype1 ;
	signal Z_div_2 :	regtype1 ;
	signal compare :	unsigned(n-1 downto 0) ;

begin 

	Z(n) <= (others => '0');
	
	loop1: for j in n downto 1 generate
            V(j) <= (2*j-2 => '1', others =>'0');
        end generate loop1;
	  V(0) <= (others =>'0');
	  
  loop2: for i in n-1 downto 0 generate
		Z_temp(i) <= Z(i+1) + V(i+1);
		Z_div_2(i) <= Z(i+1) / 2;
		compare(i) <= '1'when X(i+1) >= Z_temp(i) else '0';
		X(i) <= X(i+1) - Z_temp(i) when compare(i) = '1' else X(i+1);
		Z(i) <= Z_div_2(i) + V(i+1) when compare(i) = '1' else Z_div_2(i);

  end generate loop2;
  
  process(clk)
  begin
  if (rising_edge(clk)) then              -- Addition of the clock signal to the architecture for freq. computation
		X(n) 	<= N_in;								-- Receieving input in each clock cycle.
		results <= Z(0)(n-1 downto 0);		-- Final result is being collected from the Z register.
	end if ;
	end process; 	
	  

end a3_trial;