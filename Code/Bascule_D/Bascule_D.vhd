library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Bascule_D is
    port(clk : in std_logic;
        D : in std_logic;
        Q,Q_n : out std_logic);
end Bascule_D;

architecture Behavioral of Bascule_D is
begin
    test:process(clk)
    begin
        if clk 'event and clk = '1' then
            Q_n <= not D;
            Q <= D;
        end if;
    end process;
end Behavioral;
