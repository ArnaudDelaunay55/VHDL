library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- ici le composant à tester est une porte ET

entity testbench is
end testbench;

architecture Behavioral of testbench is
component generateur is
     port (TP : in STD_LOGIC_VECTOR(19 downto 0);
     VM : in STD_LOGIC_VECTOR(9 downto 0);
    RST,H : in STD_LOGIC;
    VC : out STD_LOGIC;
    VS : in STD_LOGIC_VECTOR(9 downto 0));
end component;

signal RST_i : STD_LOGIC;
signal H_i : STD_LOGIC := '0';
Signal TP_i : STD_LOGIC_VECTOR(19 downto 0);
Signal VM_i : STD_LOGIC_VECTOR(9 downto 0);
Signal VS_i : STD_LOGIC_VECTOR(9 downto 0);
signal VC_i : STD_LOGIC:= '0';

begin
insti : generateur
port map(TP => TP_i,
        VM => VM_i,
        RST => RST_i,
        H => H_i,
        VC => VC_i,
        VS => VS_i);
        H_i <= NOT H_i after 1us;


p1: process
    begin
    tp_i <= (others => '0');
    rst_i <= '1';
    wait for 10ns;
    rst_i <= '0';
    vm_i <= (others => '0');
    --tp_i <= (1 => '1', others => '0');
    --wait for 50ns;
    --tp_i <= (2 => '1', others => '0');
    --wait for 50ns;
    --tp_i <= (3 => '1', others => '0');
    --wait for 100ns;    
    tp_i <= (2 => '1', others => '0');
    wait for 200us;
    tp_i <= (0 => '1', others => '0');
    wait;
    end process;
 
  
end Behavioral;