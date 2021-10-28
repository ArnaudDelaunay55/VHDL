library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testBench is
--  Port ( );
end testBench;

architecture Behavioral of testBench is
signal ready_i,read_write_i,rst_i : STD_LOGIC;
signal H_i : STD_LOGIC := '0';

component Controleur_memoire is
    Port (ready,read_write,H,rst : in STD_LOGIC;
    oe,we : out STD_LOGIC);
end component; 
begin
    controleur: controleur_memoire
        port map(ready => ready_i, read_write => read_write_i, H => H_i, rst=> rst_i);
        
 H_i <= not H_i after 10 ns;
 
 stimuli : process
 begin
    
    rst_i <= '1'; wait for 5 ns;
    rst_i <= '0'; wait for 5 ns;
    
     wait for 50 ns;
    
    ready_i <= '1'; wait for 5 ns;
    ready_i <= '0'; wait for 5 ns;
    
    wait for 50 ns;
    
    read_write_i <= '1'; wait for 5 ns;
    read_write_i <= '0'; wait for 5 ns;
    
    wait for 50 ns;
    
    ready_i <= '1'; wait for 5 ns;
    ready_i <= '0'; wait for 5 ns;
    wait for 50 ns;
    
    -----
    rst_i <= '1'; wait for 5 ns;
    rst_i <= '0'; wait for 5 ns;
    
    wait for 50 ns;
    
    ready_i <= '1'; wait for 5 ns;
    ready_i <= '0'; wait for 5 ns;
        
    wait for 50 ns;
    
    read_write_i <= '0'; wait for 5 ns;
    
    wait for 50 ns;
    
    ready_i <= '1'; wait for 5 ns;
    ready_i <= '0'; wait for 5 ns;
    wait for 50 ns;
    
 end process stimuli;
end Behavioral;
