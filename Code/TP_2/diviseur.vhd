


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;



entity diviseur is

    Port (rst,clk: in std_logic;
          tp: in std_logic_vector (19 downto 0);
          clk_out: out std_logic);
    
end diviseur;

architecture Behavioral of diviseur is
        

	   signal t : std_logic_vector (19 downto 0); --init à zéro
	   
begin
        process_diviseur: process(rst,clk)
            begin                
            if rst = '1' then
                t <= tp;
            elsif clk'event and clk = '1' then
                if t = 0 then
                    t <= tp;
                else
                    t <= t-1;
                end if;    
            end if;             
        end process;
        
        process_reg: process(t)
            begin
            if t = 0 then
                clk_out <= '1';
            else
                clk_out <= '0';
            end if;            
        end process;
end Behavioral;
