library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX17_1_17 is
    Port(A, B : in STD_LOGIC_VECTOR(16 downto 0);
         S : in STD_LOGIC;
         O : out STD_LOGIC_VECTOR(16 downto 0));
end MUX17_1_17;

architecture Behavioral of MUX17_1_17 is
begin
    O <= A after 5ns when S = '1' else
         B after 5ns when S = '0';

end Behavioral;
