library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity cpt_modulo_2_N is
    generic(N : natural := 4);
    Port ( reset_n,clk : in STD_LOGIC;
    Sout : out STD_LOGIC_vector(N-1 downto 0));
end cpt_modulo_2_N;

architecture synth of cpt_modulo_2_N is
signal Si : STD_LOGIC_vector(N-1 downto 0); -- signale toujours déclarer hors process, toujours dans l'architecture pour un signal interne
begin
    Sout <= Si; -- Sout prend la valeur du signal interne, manipulation de Si au lieu de Sout uniquement car le signale de sortie et lu et réutiliser
    p1:process(reset_n, clk)
    begin
        if reset_n ='0' then
            for i in 0 to N-1 loop
                Si(i) <= '0'; -- '<=' est utiliser pour les signaux, ':=' utiliser pour les variables
            end loop;
        elsif clk'event and clk ='1' then
            Si <= Si + 1; -- on ne peut pas manipuler une sortie, on utilise un signale interne afin de faire de le manipuler dans notre process. 
        end if;       
    end process p1;
end synth;
