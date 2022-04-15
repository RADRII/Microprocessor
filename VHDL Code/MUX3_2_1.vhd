library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX3_2_1 is
    Port(
           Left, Same, Right : in STD_LOGIC;
           S : in STD_LOGIC_VECTOR(1 downto 0);
           BitOut : out STD_LOGIC);
end MUX3_2_1;

architecture Behavioral of MUX3_2_1 is
begin
    with S select
    BitOut <= Same after 5ns when "00",
              Right after 5ns when "10",
              Left after 5ns when "01",
              '0' after 5ns when others;
end Behavioral;
