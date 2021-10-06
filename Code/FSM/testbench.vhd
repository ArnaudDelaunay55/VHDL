library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity testbench is
--  
end testbench;

architecture sim of testbench is

component FSM is
    PORT (clk : in STD_LOGIC;
          a : in STD_LOGIC;
          b : in STD_LOGIC;
          rst : in STD_LOGIC;
          S : out STD_Logic); 
end component;

signal clk_i : std_logic := '0';
signal rst_i,a_i,b_i,s_i : std_logic;


begin
inst1 : FSM port map(rst => rst_i,
                     clk => clk_i,
                     a => a_i,
                     b => b_i,
                     s => s_i);
--clk de 100 Mhz                     
clk_i <= not clk_i after 5ns;                         

p1 : process
begin
    
    a_i <= '0';
    b_i <= '0';
    
    --Reset pendant 20 ns
        rst_i <= '1';
        wait for 20ns;
        rst_i <= '0';
    
    
    --Attente en E0, durée : 50 ns
        wait for 50 ns;

    
    --Passage en E1, durée : 50 ns
       a_i <= '1';
       b_i <= '1';
       wait for 50 ns;
    --Passage en E2, durée : 50 ns
       a_i <= '0';
       b_i <= '1';
       wait for 50 ns;

    --Passage en E0, durée : 100 ns
        a_i <= '0';
        b_i <= '0';
        wait for 100 ns;
    
    --Passage en E1, durée : 50 ns
        a_i <= '1';
        b_i <= '1';
        wait for 50 ns;
        
     --reset pendant 30 ,ns
        rst_i <= '1';
        wait for 30 ns;
        rst_i <= '0';
        
        wait;

      end process p1;  

end sim;


