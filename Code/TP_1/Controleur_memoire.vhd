library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Controleur_memoire is
    Port (ready,read_write,H,rst : in STD_LOGIC;
    oe,we : out STD_LOGIC);
end Controleur_memoire;

architecture Behavioral of Controleur_memoire is
type defEtat is (Idle,Decision,Write,Read);
signal etat : defEtat;
begin

    p1:process(H,rst)

    begin
        if rst = '1' then
        etat <= Idle;
        oe <= '0';
        we <= '0';
        elsif H'event and H = '1' then
            case etat is
            when Idle => 
                oe <= '0';
                we <= '0';
                if ready = '1' then
                    etat <= Decision;
                 end if;
            when Decision =>
                oe <= '0';
                we <= '0';
                if read_write = '1' then
                    etat <= Read;
                elsif read_write = '0' then
                    etat <= Write;
                end if;
            when Write =>
                oe <= '0';
                we <= '1';
                if ready = '1' then
                    etat <= Idle;
                end if;
            when Read =>
                oe <= '1';
                we <= '0';
                if ready = '1' then
                    etat <= Idle;
                end if;
            end case;
        end if;
    end process p1;

end Behavioral;

architecture deux_process of Controleur_memoire is
type defEtat is (Idle,Decision,Write,Read);
signal etat,etat_next : defEtat;
begin
    p2:process(H,rst)
    begin
        etat_next <= etat;
        oe <= '0';
        we <= '0';
            case etat is
                when Idle => 
                    oe <= '0';
                    we <= '0';
                    if ready = '1' then
                        etat <= Decision;
                    end if;
                when Decision =>
                    oe <= '0';
                    we <= '0';
                    if read_write = '1' then
                        etat <= Read;
                    elsif read_write = '0' then
                        etat <= Write;
                    end if;
                when Write =>
                    oe <= '0';
                    we <= '1';
                    if ready = '1' then
                        etat <= Idle;
                    end if;
                when Read =>
                    oe <= '1';
                    we <= '0';
                    if ready = '1' then
                        etat <= Idle;
                    end if;
                end case;
    end process p2;
    
    p3:process(rst,H)
    begin
    if rst = '1' then
        etat <= Idle;
        oe <= '0';
        we <= '0';
    elsif H'event and H = '1' then
        etat <= etat_next;
    end if;          
    
    end process p3;

end deux_process;
