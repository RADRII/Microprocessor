library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX32_1_32TB is
end MUX32_1_32TB;

architecture Behavioral of MUX32_1_32TB is
    component MUX32_1_32 is
        port(
               S : in STD_LOGIC;
               InData, RData : in STD_LOGIC_VECTOR(31 downto 0);
               DataOut : out STD_LOGIC_VECTOR(31 downto 0)
             );
    end component;
    
    signal S : STD_LOGIC;
    signal InData : STD_LOGIC_VECTOR (31 downto 0);
    signal RData : STD_LOGIC_VECTOR (31 downto 0);
    signal DataOut : STD_LOGIC_VECTOR (31 downto 0);
    
begin
UUT: MUX32_1_32 port map(S => S, InData => InData, RData => RData, DataOut => DataOut);
     Multi232_run : process
        begin
            InData <= "11111111111111110000000000000000";
            RData  <= "00000000000000001111111111111111";
            wait for 10ns;
            S <= '1';
            wait for 10ns;
            S <= '0';
            
        end process;
end Behavioral;

