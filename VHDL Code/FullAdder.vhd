library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FullAdder is
    Port( X, Y, CIn : in STD_LOGIC;
          Sum, COut : out STD_LOGIC);  
end FullAdder;

architecture Behavioral of FullAdder is
begin
    Sum <= (X xor Y) xor CIn after 5ns;
    COut <= ((X xor Y) and CIn) or (X and Y) after 5ns;
end Behavioral;