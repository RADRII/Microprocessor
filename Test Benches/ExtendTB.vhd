library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ExtendTB is
end ExtendTB;

architecture Behavioral of ExtendTB is
component Extend
    Port(DR, SB : in STD_LOGIC_VECTOR(4 downto 0);
         Data_Out : out STD_LOGIC_VECTOR(31 downto 0));
end component;

signal DR, SB : STD_LOGIC_VECTOR(4 downto 0);
signal Data_Out : STD_LOGIC_VECTOR(31 downto 0);

begin
UUT: Extend port map (DR => DR, SB => SB, Data_Out => Data_Out);
    Extend_run : process
    begin
        DR <= "10000";
        SB <= "00001";
        wait for 5ns; 
        DR <= "01111";
        wait for 5ns;
    end process;
end Behavioral;
