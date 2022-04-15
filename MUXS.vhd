library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUXS is
    Port( NZVC : in STD_LOGIC_VECTOR(3 downto 0);
          MS : in STD_LOGIC_VECTOR(2 downto 0);
          O : out STD_LOGIC);
end MUXS;

architecture Behavioral of MUXS is 
begin
    O <= '0' after 5ns when MS = "000" else
         '1' after 5ns when MS = "001" else
         NZVC(0) after 5ns when MS = "010" else
         NZVC(1) after 5ns when MS = "011" else
         NZVC(2) after 5ns when MS = "100" else
         NZVC(3) after 5ns when MS = "101" else
         not NZVC(0) after 5ns when MS = "110" else
         not NZVC(2) after 5ns;
end Behavioral;
