library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity testbench is
end testbench;

architecture Behavioral of testbench is
-- declaration des composants
component Decodeur is
    generic(Tps,Tpc : time := 0ns);
    port(E0,E1,E2 : in  STD_LOGIC;
    S0,S1,S2,S3,S4,S5 : out STD_LOGIC);
end component;
-- Les signaux (files) à déclarer
signal E0,E1,E2,S0,S1,S2,S3,S4,S5 : STD_LOGIC;
begin
--Instancier mon composant à tester
inst1: Decodeur
    generic map(Tps => 0ns)
    port map(E0 => E0, 
    E1 => E1, 
    E2 => E2, 
    S0 => S0, 
    S1 => S1, 
    S2 => S2, 
    S3 => S3, 
    S4 => S4, 
    S5 => S5);
-- Générer les stimuli
-- E0 <= '1' after 0ns, '1' after 10ns, '1' after 60ns, '0' after 95ns ;
-- E1 <= '1' after 0ns, '0' after 10ns, '0' after 60ns, '0' after 95ns ;
-- E2 <= '0' after 0ns, '0' after 10ns, '1' after 60ns, '0' after 95ns ;

-- version comportementale

test:process
begin
--valeur 3
E0 <= '1';
E1 <= '1';
E2 <= '0';
-- attente 10 ns
wait for 10 ns;
--valeur 1
E0 <= '1';
E1 <= '0';
E2 <= '0';
-- attente 50 ns
wait for 50 ns;
--valeur 5
E0 <= '1';
E1 <= '0';
E2 <= '1';
-- attente 35 ns
wait for 35 ns;
--valeur 0
E0 <= '0';
E1 <= '0';
E2 <= '0';

wait;
end process test;


end Behavioral;
