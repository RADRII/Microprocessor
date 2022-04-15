library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUXSTB is
end MUXSTB;

architecture Behavioral of MUXSTB is 
component MUXS
    Port( NZVC : in STD_LOGIC_VECTOR(3 downto 0);
          MS : in STD_LOGIC_VECTOR(2 downto 0);
          O : out STD_LOGIC);
end component;

signal  NZVC : STD_LOGIC_VECTOR(3 downto 0);
signal  MS : STD_LOGIC_VECTOR(2 downto 0);
signal O : STD_LOGIC;

begin
UUT: MUXS port map(NZVC => NZVC, MS => MS, O => O);
    MUX_run : process
    begin
        NZVC <= "1010";
        MS <= "000";
        wait for 10ns; --Expecting O = 0
        MS <= "001";
        wait for 10ns; --Expecting O = 1
        MS <= "010";
        wait for 10ns; --Expecting O = 0
        MS <= "011";
        wait for 10ns; --Expecting O = 1
        MS <= "100";
        wait for 10ns; --Expecting O = 0
        MS <= "101";
        wait for 10ns; --Expecting O = 1
        MS <= "110";
        wait for 10ns; --Expecting O = 1
        MS <= "111";
        wait for 10ns; --Expecting O = 1
        
    end process;
end behavioral;