library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- ici le composant à tester est une porte ET

entity testBenchGeneOnde is
end testBenchGeneOnde;

architecture Behavioral of testBenchGeneOnde is
component generateur is
    port (TP : in STD_LOGIC_VECTOR(19 downto 0);
    RST,H : in STD_LOGIC;
    clk_div : out STD_LOGIC);
end component;

signal RST_i, clk_div_i : STD_LOGIC;
signal H_i : STD_LOGIC := '0';
Signal TP_i : STD_LOGIC_VECTOR(19 downto 0);

begin
insti : generateur
port map(TP => TP_i,
        RST => RST_i,
        H => H_i,
        clk_div => clk_div_i);
        H_i <= NOT H_i after 1us;

p1: process
begin
    TP_i <= (others => '0');
    RST_i <= '1';
    wait for 25us;
    
    --1er bit a 1, reste 0
    TP_i <= (0 => '1', others => '0');
    RST_i <= '0';
    wait for 25us;
    
    --2eme bit a 1, reste 0
    TP_i <= (1 => '1', others => '0');
    wait for 25us;
    
    --3eme bit a 1, reste 0
    TP_i <= (2 => '1', others => '0');
    wait for 25us;
    
    wait;
    
end process;
  
end Behavioral;