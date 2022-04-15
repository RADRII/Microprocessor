library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ZeroFill is
    Port(SB : in STD_LOGIC_VECTOR(4 downto 0);
         Data_Out : out STD_LOGIC_VECTOR(31 downto 0));
end ZeroFill;

architecture Behavioral of ZeroFill is
begin
    Data_Out(0) <= SB(0) after 5ns;
    Data_Out(1) <= SB(1) after 5ns;
    Data_Out(2) <= SB(2) after 5ns;
    Data_Out(3) <= SB(3) after 5ns;
    Data_Out(4) <= SB(4) after 5ns;
    Data_Out(5) <= '0' after 5ns;
    Data_Out(6) <= '0' after 5ns;
    Data_Out(7) <= '0' after 5ns;
    Data_Out(8) <= '0' after 5ns;
    Data_Out(9) <= '0' after 5ns;
    Data_Out(10) <= '0' after 5ns;
    Data_Out(11) <= '0' after 5ns;
    Data_Out(12) <= '0' after 5ns;
    Data_Out(13) <= '0' after 5ns;
    Data_Out(14) <= '0' after 5ns;
    Data_Out(15) <= '0' after 5ns;
    Data_Out(16) <= '0' after 5ns;
    Data_Out(17) <= '0' after 5ns;
    Data_Out(18) <= '0' after 5ns;
    Data_Out(19) <= '0' after 5ns;
    Data_Out(20) <= '0' after 5ns;
    Data_Out(21) <= '0' after 5ns;
    Data_Out(22) <= '0' after 5ns;
    Data_Out(23) <= '0' after 5ns;
    Data_Out(24) <= '0' after 5ns;
    Data_Out(25) <= '0' after 5ns;
    Data_Out(26) <= '0' after 5ns;
    Data_Out(27) <= '0' after 5ns;
    Data_Out(28) <= '0' after 5ns;
    Data_Out(29) <= '0' after 5ns;
    Data_Out(30) <= '0' after 5ns;
    Data_Out(31) <= '0' after 5ns;
end Behavioral;
