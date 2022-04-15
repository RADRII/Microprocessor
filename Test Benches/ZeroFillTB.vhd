library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ZeroFillTB is
end ZeroFillTB;

architecture Behavioral of ZeroFillTB is
component ZeroFill
    Port(SB : in STD_LOGIC_VECTOR(4 downto 0);
         Data_Out : out STD_LOGIC_VECTOR(31 downto 0));
end component;

signal SB : STD_LOGIC_VECTOR(4 downto 0);
signal Data_Out : STD_LOGIC_VECTOR(31 downto 0);

begin
    UUT: ZeroFill port map(SB => SB, Data_Out => Data_Out);
    Zero_Run : process
    begin
        SB <= "00000";
        wait for 10ns;
        SB <= "11111";
        wait for 10ns;
    end process;  
end behavioral;