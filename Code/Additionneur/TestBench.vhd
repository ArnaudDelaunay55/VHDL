library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TestBench is
end TestBench;

architecture sin of TestBench is
-- declaration des composants
component additionneur is
    generic(Tps,Tpc : time := 0ns);
    Port ( A,B : in STD_LOGIC;
    Cin : in STD_LOGIC := '0';
    Sout : out STD_LOGIC;
    Cout : out STD_LOGIC);
end component;
-- Les signaux (files) à déclarer
signal A,B,Cin : STD_LOGIC;
signal Sout_f,Cout_f : STD_LOGIC;
signal Sout_s,Cout_s : STD_LOGIC;
signal Sout_b,Cout_b : STD_LOGIC;
for inst_flow : additionneur
    use entity work.additionneur(flow);
for inst_struct : additionneur
        use entity work.additionneur(structural);
for inst_behv : additionneur
            use entity work.additionneur(behavior);
begin
--Instancier mon composant à tester
inst_flow: additionneur
    port map(A => A,
    B => B, 
    Cin => Cin, 
    Sout => Sout_f,
    Cout => Cout_f);
inst_struct: additionneur
        port map(A => A, 
        B => B, 
        Cin => Cin, 
        Sout => Sout_s,
        Cout => Cout_s);
inst_behv: additionneur
            port map(A => A,
            B => B, 
            Cin => Cin, 
            Sout => Sout_b,
            Cout => Cout_b);
-- Générer les stimuli
Cin <= '0', '1' after 30ns;
A <= '0', '1' after 5ns,'0' after 20ns;
B <= '0', '1' after 5ns, '0' after 10ns, '1' after 40ns, '0' after 45ns;
end sin;
