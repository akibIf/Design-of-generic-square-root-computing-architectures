---------------------------------------------------------------------
--	Behavioral approach
-- Architecture A1
-- The algorithm based on Newton’s method
---------------------------------------------------------------------

architecture a1 of square_root is
	type statetype is (idle, init, compute, finish); -- 4 states are being used to identify the  newton methods
	signal next_state, present_state : statetype;

begin
   process(clk, reset, start, present_state)
	-- 2 new variable has been declared for the purpose of the computation
	variable recent_x : unsigned(2*n-1 downto 0) ;
	variable next_x   : unsigned(2*n-1 downto 0) ; 

	begin 
		if(reset='0') then
			present_state <= idle;			

		elsif(clk'event and clk='1') then
			
				case present_state is 
					
					when idle =>
					
						if (start = '1') then
							next_state <= init;
						else
							next_state <= idle;
						end if;
							
							
					when init => 				 
						
						recent_x := (0 => '1', others => '0'); 	-- Xn has been initialized 
						next_x := (others => '0');						-- Xn+1 has been initialized
						next_state <= compute;							-- transferring to a next state 
						
					when compute =>
						
						next_x := (recent_x + (N_in/recent_x))/2;
							
							if (recent_x = next_x) then  	-- When two successive computation has similar values
								next_state <= finish;
								
							else
								next_state <= compute;
								recent_x := next_x;
								
							end if;

							
					when finish =>
				
						if start = '1' then
							results <= next_x(31 downto 0); -- right shifed final results last 32 digits
							next_state <= finish;

						else
							next_state <= idle;
						end if;	
			
				end case;			
				
				present_state <= next_state;

		end if;
	
	end process;
finished <= '1' when present_state = finish else '0';

end a1;

