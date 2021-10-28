library IEEE;
Library work;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;
use work.ONDES_PKG.all;
use IEEE.NUMERIC_STD.ALL;

entity geneOnde is
    port (VM : in STD_LOGIC_VECTOR(9 downto 0);
    RST,clk_div : in STD_LOGIC;
    VS : out STD_LOGIC_VECTOR(9 downto 0);
    VC : out STD_LOGIC
    );
end geneOnde;

architecture Behavioral of geneOnde is

    type defEtat is (avant_plus,arriere_plus,avant_moins,arriere_moins);
    signal etat, etat_next :defEtat;
    signal signe : std_logic;
    signal i: natural range 0 to 128;
    signal i_next: natural range 0 to 128;
    signal v_i: std_logic_vector(10 downto 0);
    signal v_max: std_logic_vector(9 downto 0) := (9 => '1', others => '0');
    
begin

    v_i <= ("0" & VM) + SINUS_ROM(i) when signe <= '1' else
           ("0" & VM) - SINUS_ROM(i);
    
    VS <=  v_max when (v_i > v_max) else
          -v_max when (v_i < v_max) else
           v_i(9 downto 0);      
  
    VC <= '1' when signe <= '1' else
          '0';
    
 
process1: process(etat,i)
begin
    etat_next <= etat;
    i_next <= i;
    signe <= '1';                      
    case etat is
    when avant_plus =>
        i_next <= i+1;
        signe <= '1';
        if i=128 then
            etat_next <= arriere_plus;
        end if;   
    when arriere_plus =>
        i_next <= i-1;
        signe <= '1';
        if i=0 then
            etat_next <= avant_moins;
        end if;   
    when avant_moins =>
        i_next <= i+1;
        signe <= '0';
        if i=128 then
            etat_next <= arriere_moins;
        end if;
    when arriere_moins =>
        i_next <= i-1;
        signe <= '0';
        if i = 0 then
            etat_next <= avant_plus;
        end if;           
    end case; 
end process;
              
Reg: process(rst,clk_div)
begin
    if rst = '1' then
        etat <= avant_plus;
    elsif clk_div'event and clk_div = '1' then
        etat <= etat_next;
        i <= i_next;
    end if;        
end process;
    
end Behavioral;
