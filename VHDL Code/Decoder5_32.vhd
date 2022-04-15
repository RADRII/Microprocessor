library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder5_32 is
    Port ( 
     DestA : in std_logic_vector(4 downto 0);
     T : in STD_LOGIC;
     DestChoice : out std_logic_vector(31 downto 0));   
end Decoder5_32;

architecture Behavioral of Decoder5_32 is
begin

DestChoice <= "00000000000000000000000000000000" after 5ns when T = '1' else
              "00000000000000000000000000000001" after 5ns when DestA = "00000" and T = '0' else
              "00000000000000000000000000000010" after 5ns when DestA = "00001" and T = '0' else
              "00000000000000000000000000000100" after 5ns when DestA = "00010" and T = '0' else
              "00000000000000000000000000001000" after 5ns when DestA = "00011" and T = '0' else
              "00000000000000000000000000010000" after 5ns when DestA = "00100" and T = '0' else
              "00000000000000000000000000100000" after 5ns when DestA = "00101" and T = '0' else
              "00000000000000000000000001000000" after 5ns when DestA = "00110" and T = '0' else
              "00000000000000000000000010000000" after 5ns when DestA = "00111" and T = '0' else
              "00000000000000000000000100000000" after 5ns when DestA = "01000" and T = '0' else
              "00000000000000000000001000000000" after 5ns when DestA = "01001" and T = '0' else
              "00000000000000000000010000000000" after 5ns when DestA = "01010" and T = '0' else
              "00000000000000000000100000000000" after 5ns when DestA = "01011" and T = '0' else
              "00000000000000000001000000000000" after 5ns when DestA = "01100" and T = '0' else
              "00000000000000000010000000000000" after 5ns when DestA = "01101" and T = '0' else
              "00000000000000000100000000000000" after 5ns when DestA = "01110" and T = '0' else
              "00000000000000001000000000000000" after 5ns when DestA = "01111" and T = '0' else
              "00000000000000010000000000000000" after 5ns when DestA = "10000" and T = '0' else
              "00000000000000100000000000000000" after 5ns when DestA = "10001" and T = '0' else
              "00000000000001000000000000000000" after 5ns when DestA = "10010" and T = '0' else
              "00000000000010000000000000000000" after 5ns when DestA = "10011" and T = '0' else
              "00000000000100000000000000000000" after 5ns when DestA = "10100" and T = '0' else
              "00000000001000000000000000000000" after 5ns when DestA = "10101" and T = '0' else
              "00000000010000000000000000000000" after 5ns when DestA = "10110" and T = '0' else
              "00000000100000000000000000000000" after 5ns when DestA = "10111" and T = '0' else
              "00000001000000000000000000000000" after 5ns when DestA = "11000" and T = '0' else
              "00000010000000000000000000000000" after 5ns when DestA = "11001" and T = '0' else
              "00000100000000000000000000000000" after 5ns when DestA = "11010" and T = '0' else
              "00001000000000000000000000000000" after 5ns when DestA = "11011" and T = '0' else
              "00010000000000000000000000000000" after 5ns when DestA = "11100" and T = '0' else
              "00100000000000000000000000000000" after 5ns when DestA = "11101" and T = '0' else
              "01000000000000000000000000000000" after 5ns when DestA = "11110" and T = '0' else
              "10000000000000000000000000000000" after 5ns when DestA = "11111" and T = '0';
end Behavioral;
