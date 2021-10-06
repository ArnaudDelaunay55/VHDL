library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Demi_additionneur is
    generic(Tp : time := 2.5ns);
    Port ( A,B : in STD_LOGIC;
    Sout : out STD_LOGIC;
    Cout : out STD_LOGIC);
end Demi_additionneur;


architecture demi_additionneur_A of demi_additionneur is
begin
    Sout <= A xor B after Tp;
    Cout <= A and B after Tp;
end demi_additionneur_A;