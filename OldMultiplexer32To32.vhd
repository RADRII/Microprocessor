
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OldMultiplexer32To32 is
    Port(
          R00,R01,R02,R03,R04,R05,R06,R07,R08,R09,R10,R11,R12,R13,R14,R15,R16,R17,R18,R19,R20,R21,R22,R23,R24,R25,R26,R27,R28,R29,R30,R31 : in STD_LOGIC_VECTOR(31 downto 0);
          S : in STD_LOGIC_VECTOR (4 downto 0);
          DataOut : out STD_LOGIC_VECTOR (31 downto 0));
end OldMultiplexer32To32;

architecture Behavioral of OldMultiplexer32To32 is
begin
    with S select
    DataOut <= R00 after 5ns when "00000",
               R01 after 5ns when "00001",
               R02 after 5ns when "00010",
               R03 after 5ns when "00011",
               R04 after 5ns when "00100",
               R05 after 5ns when "00101",
               R06 after 5ns when "00110",
               R07 after 5ns when "00111",
               R08 after 5ns when "01000",
               R09 after 5ns when "01001",
               R10 after 5ns when "01010",
               R11 after 5ns when "01011",
               R12 after 5ns when "01100",
               R13 after 5ns when "01101",
               R14 after 5ns when "01110",
               R15 after 5ns when "01111",
               R16 after 5ns when "10000",
               R17 after 5ns when "10001",
               R18 after 5ns when "10010",
               R19 after 5ns when "10011",
               R20 after 5ns when "10100",
               R21 after 5ns when "10101",
               R22 after 5ns when "10110",
               R23 after 5ns when "10111",
               R24 after 5ns when "11000",
               R25 after 5ns when "11001",
               R26 after 5ns when "11010",
               R27 after 5ns when "11011",
               R28 after 5ns when "11100",
               R29 after 5ns when "11101",
               R30 after 5ns when "11110",
               R31 after 5ns when "11111",
               "00000000000000000000000000000000" when others;
              
end Behavioral;
