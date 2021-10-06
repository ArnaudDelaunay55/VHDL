library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cpt_modulo_2_N is
--  Port ( );
end cpt_modulo_2_N;

architecture Behavioral of cpt_modulo_2_N is
-- Déclaration du composant compteur
component Cpt_modulo is
    generic(N : natural := 4);
    Port ( reset_n,clk : in STD_LOGIC;
    Sout : out STD_LOGIC_vector(N-1 downto 0));
end component;
-- Déclaration des signaux pour l'instanciation du compteur
signal reset_n_i,clk_i : STD_LOGIC;
constant MAX : natural := 6;
signal Sout_i : STD_LOGIC_vector(MAX-1 downto 0);

begin
-- Instanciation du compteur (port map)
    inst: Cpt_modulo
       generic map(N => MAX)
       port map ( reset_n => reset_n_i,
                  clk => clk_i,
                  Sout => Sout_i);
-- Génération clk a 100 Mhz
    clk_i <= not clk_i after 5 ns;
    
-- Process pour le scénario
    p1: process
    begin
    -- reset de 30 ns
    reset_n_i <= '0';
    wait for 300 ns;
    reset_n_i <= '1';
    -- comptage pendant 700 ns
    reset_n_i <= '0';
    wait for 50 ns;
    reset_n_i <= '1';
    -- reset 50 ns
    
    -- comptage pendant 100 ns
    wait for 100 ns;
    wait;
    
    end process p1;
end Behavioral;
