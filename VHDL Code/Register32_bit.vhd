library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Register32_bit is
    Port( InData : in STD_LOGIC_VECTOR (31 downto 0);
          Load : in STD_LOGIC;
          Clk : in STD_LOGIC;
          OutData : out STD_LOGIC_VECTOR (31 downto 0));
end Register32_bit;

architecture Behavioral of Register32_bit is
begin
    process(Clk)
    begin
        if(rising_edge(Clk)) then
           if(Load = '1') then
               OutData <= InData after 5ns;
          end if;
      end if;
    end process;
end Behavioral;

