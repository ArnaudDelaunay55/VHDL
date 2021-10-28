library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity diviseur is
    port (TP : in STD_LOGIC_VECTOR(19 downto 0);
    RST,H : in STD_LOGIC;
    clk_div : out STD_LOGIC);
end diviseur;

architecture Behavioral of diviseur is
signal t : STD_LOGIC_VECTOR(19 downto 0);
begin

p1: process(H,RST)
    begin
        if RST = '1' then
            t <= TP;
        elsif H'event and H = '1' then
            if t = 0 then 
                t <= TP;
            else 
                t <= t-1;
            end if;
        end if;
    end process;

p2:process(t)
    begin
        if t = 0 then 
            clk_div <= '1';
        else
            clk_div <= '0';
        end if;
   end process;
   
end Behavioral;

