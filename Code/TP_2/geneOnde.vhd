
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;
Library work;
use work.ONDES_PKG.all;

entity geneOnde is
    Port (vm: in std_logic_vector(9 downto 0);
          rst, clk: in std_logic;
          vs: out std_logic_vector(9 downto 0);
          vc: out std_logic);
end geneOnde;

architecture Behavioral of geneOnde is

    type defEtat is (avant_plus,arriere_plus,avant_moins,arriere_moins);
    signal etat, etat_next :defEtat;
    type signe is (plus,moins);
    signal etat_signe: signe;
    signal i: natural range 0 to 128;
    signal i_next: natural range 0 to 128;
    signal v_i: std_logic_vector(9 downto 0);
    signal v_max: std_logic_vector(9 downto 0);

begin
    
    v_i <= vm + SINUS_ROM(i) when etat_signe <= plus else
           vm - SINUS_ROM(i);
    
    vs <=  v_max when (v_i > v_max) else
          -v_max when (v_i < v_max) else
           v_i;      
  
    vc <= '1' when etat_signe <= plus else
          '0';          
    
    process1: process(vm,etat,rst,i)
        
        begin
        
            etat_next <= etat;
            i_next <= i;
                
            case etat is
            when avant_plus =>
                i_next <= i_next+1;
                etat_signe <= plus;
                if i_next=128 then
                    etat_next <= arriere_plus;
                end if;   
            when arriere_plus =>
                i_next <= i_next-1;
                etat_signe <= plus;
                if i_next=0 then
                    etat_next <= avant_moins;
                end if;   
            when avant_moins =>
                i_next <= i_next+1;
                etat_signe <= moins;
                if i_next=128 then
                    etat_next <= arriere_moins;
                end if;
            when arriere_moins =>
                i_next <= i_next-1;
                etat_signe <= moins;
                if i_next = 0 then
                    etat_next <= avant_plus;
                end if;           
        end case; 
    end process;
    
    Reg: process(rst,clk)
    
        begin
        if rst = '1' then
            i <= 0;
            etat <= avant_plus;
        elsif clk'event and clk = '1' then
            etat <= etat_next;
            i <= i_next;
        end if;        
    end process;
        
end Behavioral;
