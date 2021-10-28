library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity generateur is
port (TP : in STD_LOGIC_VECTOR(19 downto 0);
     VM : in STD_LOGIC_VECTOR(9 downto 0);
    RST,H : in STD_LOGIC;
    VC : out STD_LOGIC;
    VS : in STD_LOGIC_VECTOR(9 downto 0));
end generateur;

architecture Behavioral of generateur is
   
component diviseur is
    port (TP : in STD_LOGIC_VECTOR(19 downto 0);
    RST,H : in STD_LOGIC;
    clk_div : out STD_LOGIC);
end component;

component geneOnde is
    port (VM : in STD_LOGIC_VECTOR(9 downto 0);
    RST,clk_div : in STD_LOGIC;
    VS : out STD_LOGIC_VECTOR(9 downto 0);
    VC : out STD_LOGIC
    );
end component;

signal RST_i, clk_div_i : STD_LOGIC;
signal H_i : STD_LOGIC := '0';
Signal TP_i : STD_LOGIC_VECTOR(19 downto 0);
Signal VM_i : STD_LOGIC_VECTOR(9 downto 0);

signal VC_i : STD_LOGIC;
Signal VS_i : STD_LOGIC_VECTOR(9 downto 0);

begin
insti : diviseur
port map(TP => TP_i,
        RST => RST_i,
        H => H_i,
        clk_div => clk_div_i);
        
 H_i <= NOT H_i after 1us;
 
insti2 : geneOnde
        port map(VM => VM_i,
                RST => RST_i,
                VS => VS_i,
                VC => VC_i,
                clk_div => clk_div_i);
                          
end Behavioral;

