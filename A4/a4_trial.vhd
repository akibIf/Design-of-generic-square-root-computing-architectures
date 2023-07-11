--------------------------------------------------------
--------------------------------------------------------
--- A pipelined architecture for sqrt (architecture 4)--
--------------------------------------------------------
--------------------------------------------------------

architecture a4_trial of square_root is
type registerType is array (0 to n) of unsigned(2*n-1 downto 0);
type registerType2 is array (0 to n-1) of unsigned(2*n-1 downto 0);

signal X      	   : registerType;  	-- A signal which is being used to receieve the input signal 
signal V          : registerType;	-- An useful signal for the purpose of the computation
signal Z          : registerType; 	-- An useful signal for final results
signal Z_temp     : registerType2;	-- A signal to store the computation values
signal Z_div_2    : registerType2;	-- A signal to store the 1 bit shifted values

signal N_out      : registerType2;
signal Z_out 		: registerType2;	-- An useful signal (resister) to store final results

-- Signal to control the computation  
signal start_shift		: unsigned(n downto 0); 
signal compare 			: unsigned(n-1 downto 0);

begin
   
------ combinatorial Part to establish pipeline architecture----------------
----------------------------------------------------------------------------
	V_generation: for j in n downto 1 generate
	
							V(j) <= (2*j-2 => '1', others => '0');
	
					  end generate;
				
	V(0) <= (others => '0'); -- Instantiation of first V register
	
-------------- The functionality has already been discussed in the Architecture A3 ----------	
	generating_final_output: for i in n-1 downto 0 generate
										
										Z_temp(i)        <= Z(i+1) + V(i+1);
										Z_div_2(i)       <= Z(i+1)/2;
										compare(i)   	  <= '1' when X(i+1) >= Z_temp(i) else '0';
										N_out(i) 		  <= X(i+1) - Z_temp(i) when compare(i) = '1' else X(i+1);
										Z_out(i)   		  <= Z_div_2(i) + V(i+1) when  compare(i) = '1' else Z_div_2(i);
										
									 end generate;
		
------ Sequential Part to establish pipeline architecture ----------------
---------------------------------------------------------------------------
process(clk,reset,start)
begin

	if(reset = '0') then
			
		start_shift(n) <= '0';    									-- Instantiating the shifted start signal to 0
		
		reset_loop:for i in n-1 downto 0 loop
		
							X(i)  			<= (others => '0');
							Z(i) 				<= (others => '0');
							start_shift(i)	<= '0';
		
						end loop;
		
		results   		<= (others => '0');
		finished 		<= '0';
		
	elsif(rising_edge(clk)) then
 
		start_shift(n) <= start;  --'start_shift' signal is assigned to start signal
		
		start_shift_loop: for i in n-1 downto 0 loop
		
									start_shift(i) <= start_shift(i+1); --start_shift is shifted 1 bit left
		
								end loop;
						
		finished 	   <= start_shift(0); -- when the last start_shift happens, then the process is finished 
					
	----- Signal has been initated from the testbench -----------
	
		if (start_shift(n) = '1') then
		
			 X(n)    <= N_in;
			 Z(n)    <= (others => '0');
			 
		end if;
		
		
		final_pipelining: for i in n-1 downto 0 loop
		
									if (start_shift(i) = '1') then
									
										X(i)    <= N_out(i);
										Z(i)    <= Z_out(i);
									
									end if;
								
								end loop;
			
	-- Final Output Signal
	
		if (start_shift(0) = '1') then
	
			results 	<= Z_out(0)(n-1 downto 0);
		
		end if;
		
	end if;
	
end process;

end a4_trial; 

	
			
			
			
			
			
			
		
	
						
	
	
	
	
	
	
	
	
	
	
	
	
	