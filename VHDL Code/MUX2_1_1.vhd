library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX2_1_1 is
    Port( A, B, S : in STD_LOGIC;
          O : out STD_LOGIC);         
end MUX2_1_1;

architecture Behavioral of MUX2_1_1 is
begin
    with S select
    O <= A after 5ns when '0',
         B after 5ns when '1',
         '0' after 5ns when others;
end Behavioral;