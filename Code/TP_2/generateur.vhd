
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity generateur is
    Port (tp: in std_logic_vector(19 downto 0);
          vm: in std_logic_vector(9 downto 0);
          rst, clk: in std_logic;
          vs: out std_logic_vector(9 downto 0);
          vc: out std_logic);
end generateur;

architecture Behavioral of generateur is

type defEtat is (avant_plus,arriere_plus,avant_moins,arriere_moins);
signal etat, etat_next :defEtat;
type signe is (plus,moins);
signal etat_signe: signe;


    component diviseur is
    
        Port (rst,clk: in std_logic;
              tp: in std_logic_vector (19 downto 0);
              clk_out: out std_logic);       
    end component;

    component geneOnde is
        Port (vm: in std_logic_vector(9 downto 0);
              rst, clk: in std_logic;
              vs: out std_logic_vector(9 downto 0);
              vc: out std_logic);
    end component;

    
    
    signal clk_div: std_logic;
begin

diviseur1: diviseur

port map(rst => rst, clk => clk, tp => tp, clk_out => clk_div);
 
geneOnde1: geneOnde
port map(vm => vm, rst => rst, clk => clk_div, vs => vs, vc => vc);
      
end Behavioral;