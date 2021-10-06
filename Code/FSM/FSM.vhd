library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FSM is
    PORT (clk : in STD_LOGIC;
          a : in STD_LOGIC;
          b : in STD_LOGIC;
          rst : in STD_LOGIC;
          S : out STD_Logic); 
end FSM;

architecture flow of FSM is  
begin
    fsm: process(rst, clk)
        type defEtat is (E0, E1, E2);
        variable etat : defEtat;
        begin 
        if rst = '1' then 
            etat := E0;
            s <= '1';
        elsif clk'event and clk = '1' then -- Detection du front montant
            case etat is 
                when E0 => 
                    s <= '1';
                    if a = '1' and b = '1'then 
                        etat := E1;
                    end if;
                when E1 =>
                    s <= '0';
                    if a = '0' then 
                        etat := E2;
                    end if;
                when E2 =>
                    s <= '1';
                    if b = '0' then 
                        etat := E0;
                    end if;
            end case;
        end if;
    end process;

end flow;


architecture flow_sig of FSM is  
type defEtat is (E0, E1, E2);
signal etat : defEtat;

begin

    fsm: process(rst, clk)

        begin 
        if rst = '1' then 
            etat <= E0;
            s <= '1';
        elsif clk'event and clk = '1' then 
            case etat is 
                when E0 => 
                    s <= '1';
                    if a = '1' and b = '1'then 
                        etat <= E1;
                    end if;
                when E1 =>
                    s <= '0';
                    if a = '0' then 
                        etat <= E2;
                    end if;
                when E2 =>
                    s <= '1';
                    if b = '0' then 
                        etat <= E0;
                    end if;
            end case;
        end if;
    end process;

end flow_sig;


architecture flow_sig_2 of FSM is  
type defEtat is (E0, E1, E2);
signal etat,etat_nxt : defEtat;

begin

Comb1_2: process(a,b,etat)
    begin
    -- valeur par defaut
        etat_nxt <= etat;
        s <= '0';
        case etat is
            when E0 =>
                s<= '1';
                if a = '1' and b = '1'then
                    etat_nxt <= E1;
                end if;
            when E1 =>
                 s <= '0';
                if a = '0' then
                    etat_nxt <= E2;
                end if;
            when E2 =>
                s <= '1';
                if b = '0' then
                    etat_nxt <= E0;
                end if;
        end case;
    end process;
    
    Reg: process(rst, clk)
        begin
        if rst = '1' then 
            etat <= E0;
        elsif clk'event and clk = '1' then
            etat <= etat_nxt;
        end if;
    end process;




end flow_sig_2;
