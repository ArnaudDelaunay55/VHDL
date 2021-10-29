


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity testbench is
-- Port ( );
end testbench;

architecture Behavioral of testbench is

    component generateur is
        Port (tp: in std_logic_vector(19 downto 0);
              vm: in std_logic_vector(9 downto 0);
              rst, clk: in std_logic;
              vs: out std_logic_vector(9 downto 0);
              vc: out std_logic);
    end component;
    
signal clk_i: std_logic:='0';
signal tp_i: std_logic_vector(19 downto 0);
signal vm_i: std_logic_vector(9 downto 0);
signal rst_i: std_logic;
signal vs_i: std_logic_vector(9 downto 0);
signal vc_i: std_logic;    
    
begin

inst1: generateur
    port map(tp => tp_i, clk => clk_i, vm => vm_i, rst => rst_i, vs => vs_i, vc => vc_i);
    clk_i <= not clk_i after 5ns;
p1: process
    begin
    tp_i <= (others => '0');
    rst_i <= '1';
    wait for 10ns;
    rst_i <= '0';
    --tp_i <= (1 => '1', others => '0');
    --wait for 50ns;
    --tp_i <= (2 => '1', others => '0');
    --wait for 50ns; 
    --tp_i <= (3 => '1', others => '0');
    --wait for 100ns;    
    tp_i <= (2 => '1', others => '0');
    wait for 100ns;
    wait; 
    end process;

end Behavioral;
