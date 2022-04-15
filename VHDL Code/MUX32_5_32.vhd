library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX32_5_32 is
    Port(
          R00,R01,R02,R03,R04,R05,R06,R07,R08,R09,R10,R11,R12,R13,R14,R15,R16,R17,R18,R19,R20,R21,R22,R23,R24,R25,R26,R27,R28,R29,R30,R31,R32 : in STD_LOGIC_VECTOR(31 downto 0);
          S : in STD_LOGIC_VECTOR (4 downto 0);
          T : in STD_LOGIC;
          DataOut : out STD_LOGIC_VECTOR (31 downto 0));
end MUX32_5_32;

architecture Behavioral of MUX32_5_32 is
begin
    DataOut <= R32 after 5ns when T = '1' else
               R00 after 5ns when T = '0' and S = "00000" else
               R01 after 5ns when T = '0' and S = "00001" else
               R02 after 5ns when T = '0' and S = "00010" else
               R03 after 5ns when T = '0' and S = "00011" else
               R04 after 5ns when T = '0' and S = "00100" else
               R05 after 5ns when T = '0' and S = "00101" else
               R06 after 5ns when T = '0' and S = "00110" else
               R07 after 5ns when T = '0' and S = "00111" else
               R08 after 5ns when T = '0' and S = "01000" else
               R09 after 5ns when T = '0' and S = "01001" else
               R10 after 5ns when T = '0' and S = "01010" else
               R11 after 5ns when T = '0' and S = "01011" else
               R12 after 5ns when T = '0' and S = "01100" else
               R13 after 5ns when T = '0' and S = "01101" else
               R14 after 5ns when T = '0' and S = "01110" else
               R15 after 5ns when T = '0' and S = "01111" else
               R16 after 5ns when T = '0' and S = "10000" else
               R17 after 5ns when T = '0' and S = "10001" else
               R18 after 5ns when T = '0' and S = "10010" else
               R19 after 5ns when T = '0' and S = "10011" else
               R20 after 5ns when T = '0' and S = "10100" else
               R21 after 5ns when T = '0' and S = "10101" else
               R22 after 5ns when T = '0' and S = "10110" else
               R23 after 5ns when T = '0' and S = "10111" else
               R24 after 5ns when T = '0' and S = "11000" else
               R25 after 5ns when T = '0' and S = "11001" else
               R26 after 5ns when T = '0' and S = "11010" else
               R27 after 5ns when T = '0' and S = "11011" else
               R28 after 5ns when T = '0' and S = "11100" else
               R29 after 5ns when T = '0' and S = "11101" else
               R30 after 5ns when T = '0' and S = "11110" else
               R31 after 5ns when T = '0' and S = "11111" else
               "00000000000000000000000000000000" after 5ns;
               
end Behavioral;
