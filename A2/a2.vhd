---------------------------------------------------------------------
-----------------	Behavioral approach -------------------------------
----------------- Architecture A2 -----------------------------------
----------------- The algorithm based on iterative algorithm --------
---------------------------------------------------------------------

architecture a2 of square_root is
	type statetype is (idle, init, compute, finish);
	signal next_state, present_state : statetype;

begin
   process(clk, reset, start, present_state)
	-- 3 new variable has been declared for the purpose of the computation
	 variable V : unsigned(2*n-1 downto 0) ; 
	 variable Z: unsigned(2*n-1 downto 0) ;
	 variable N_dup: unsigned(2*n-1 downto 0) ;

	variable i: integer ;

	begin 
		if(reset='0') then
			present_state <= idle;

		elsif(clk'event and clk='1') then
			
				case present_state is 
					
					when idle =>
					
						if (start 		= '1') then
							next_state <= init;
						else
							next_state <= idle;
						end if;
							
							
					when init => 
					
						V 		:= (2*n-2 => '1', others => '0'); 	-- Initialization of V
						Z 		:= (others => '0');						-- Initialization of Z
						i 		:= n;											-- Initialization of i
						N_dup := N_in;										-- Copy of the initial input
						next_state <= compute;
			
					when compute =>
				
						if i /= 0 then
							Z := Z+V ;
							
							If signed((N_dup - Z))>= 0 then		-- Comparing between N_dup and Z
								N_dup := N_dup - Z ;					
								Z 		:= Z + V ;
							Else
								Z 		:= Z-V ;
							End If ;
							
						Z := Z/2 ;
						V := V/4 ;
						i := i - 1 ;
						next_state	  <= compute;
					
						else 
							next_state <= finish;
							results 	  <= Z(31 downto 0);
						end if;

					
					when finish =>
				
						if start = '1' then				
							next_state <= finish;
			 
						else
							next_state <= idle;
						end if;	
			
				end case;			
				
				present_state <= next_state;

		end if;
	
	end process;
finished <= '1' when present_state = finish else '0';

end a2;