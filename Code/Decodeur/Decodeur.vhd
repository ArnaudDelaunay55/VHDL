library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Decodeur is
    generic(Tps,Tpc : time := 0ns);
    port(E0,E1,E2 : in  STD_LOGIC;
    S0,S1,S2,S3,S4,S5 : out STD_LOGIC);
end Decodeur;

architecture Decodeur_A of Decodeur is
begin
    S0 <= (not E0) and (not E1) and (not E2);
    S1 <= (E0) and (not E1) and (not E2);
    S2 <= (not E0) and (E1) and (not E2);
    S3 <= (E0) and (E1) and (not E2);
    S4 <= (not E0) and (not E1) and (E2);
    S5 <= (E0) and (not E1) and (E2);
end Decodeur_A;
