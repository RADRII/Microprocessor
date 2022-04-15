library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Extend is
    Port(DR, SB : in STD_LOGIC_VECTOR(4 downto 0);
         Data_Out : out STD_LOGIC_VECTOR(31 downto 0));
end Extend;

architecture Behavioral of Extend is
begin
    Data_Out <= DR(4) & DR(4) & DR(4) & DR(4) & DR(4) & DR(4) & DR(4) & DR(4) & 
                DR(4) & DR(4) & DR(4) & DR(4) & DR(4) & DR(4) & DR(4) & DR(4) &
                DR(4) & DR(4) & DR(4) & DR(4) & DR(4) & DR(4) & DR & SB;
end Behavioral;