library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ZeroDetect32 is
    Port( Data : in STD_LOGIC_VECTOR(31 downto 0);
          DataOut : out STD_LOGIC);
end ZeroDetect32;

architecture Behavioral of ZeroDetect32 is
begin
    DataOut <= not(Data(0) or Data(1) or Data(2) or Data(3) or Data(4) or Data(5) or Data(6) or Data(7) or Data(8) or Data(9) or
               Data(10) or Data(11) or Data(12) or Data(13) or Data(14) or Data(15) or Data(16) or Data(17) or Data(18) or Data(19) or
               Data(20) or Data(21) or Data(22) or Data(23) or Data(24) or Data(25) or Data(26) or Data(27) or Data(28) or Data(29) or
               Data(30) or Data(31)) after 5ns;
end Behavioral;
