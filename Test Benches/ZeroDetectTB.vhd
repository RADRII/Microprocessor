library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ZeroDetect32TB is
end ZeroDetect32TB;

architecture Behavioral of ZeroDetect32TB is
component ZeroDetect32 is
    Port( Data : in STD_LOGIC_VECTOR(31 downto 0);
          DataOut : out STD_LOGIC);
end component;
signal Data : STD_LOGIC_VECTOR(31 downto 0);
signal DataOut : STD_LOGIC;
begin
UUT: ZeroDetect32 port map(Data=>Data, DataOut=>DataOut);
    ZD_Run : process
    begin
        Data <= "00000000000000000000000000000000";
        wait for 10ns;
        Data <= "00000000011100000000000000000000";
        wait for 10ns;
        Data <= "00000000010000000000000000100000";
        wait for 10ns;
    end process;
end Behavioral;
