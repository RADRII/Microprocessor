library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LogicCircuit is
    Port( A, B, S0, S1 : in STD_LOGIC;
          O : out STD_LOGIC);
end LogicCircuit;

architecture Behavioral of LogicCircuit is
signal S : STD_LOGIC_VECTOR(1 downto 0);

begin
    S(0) <= S0;
    S(1) <= S1;

    with S select
    O <= (A and B) after 5ns when "00",
         (A or B) after 5ns when "01",
         (A xor B) after 5ns when "10",
         (not A) after 5ns when "11",
         '0' after 5ns when others;
end Behavioral;