library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MUX32_1_32 is
     Port ( 
             S : in STD_LOGIC;
             InData : in STD_LOGIC_VECTOR(31 downto 0);  
             RData : in STD_LOGIC_VECTOR(31 downto 0);
             DataOut : out STD_LOGIC_VECTOR(31 downto 0));
end MUX32_1_32;

architecture Behavioral of MUX32_1_32 is
begin
    DataOut <= InData after 5ns when S = '0' else
               RData after 5ns when S = '1' else
               "00000000000000000000000000000000" after 5ns;
end Behavioral;
