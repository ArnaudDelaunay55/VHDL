library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplexeur4_1 is 
    port(Sel : in bit_vector(1 downto 0);
        A, B, C, D : in bit;
        S : out bit);
 end multiplexeur4_1;
 
architecture flow of multiplexeur4_1 is 
signal S0, S1, S2, S3 :bit;
begin 
    S0 <= not(Sel(1)) and not(Sel(0)) and A;
    S1 <= not(Sel(1)) and Sel(0) and B;
    S2 <= Sel(1) and not(Sel(0)) and C;
    S3 <= Sel(1) and Sel(0) and D;
    S <= S0 or S1 or S2 or S3;
end flow;

architecture flow_with of multiplexeur4_1 is 
begin
    S <= A when (Sel = "00") else
        B when (Sel ="01") else
        C when (Sel = "10") else
        D;
end flow_with;

architecture flow of multiplexeur4_1 is
begin
    with Sel select
    S <= A when "00",
    B when "01",
    C when "10",
    D when others; 
end flow;

architecture flow_elseif of multiplexeur4_1 is
begin
    mux:process(A,B,C,D)
    begin
        if Sel = "00" then
            S <= A;
        elsif Sel = "01" then
            S <= B;
        elsif Sel = "10" then
            S <= C;
        else
            S <= D;
        end if;
     end process;
end flow_elseif;