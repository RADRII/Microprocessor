library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IR is
    Port(Instruction : in STD_LOGIC_VECTOR(31 downto 0);
         IL, Clk : in STD_LOGIC;
         Opcode : out STD_LOGIC_VECTOR(16 downto 0);
         DR, SA, SB : out STD_LOGIC_VECTOR(4 downto 0));
end IR;

architecture Behavioral of IR is
begin
 process(Clk)
   begin
       if(rising_edge(Clk)) then
          if(IL = '1') then
              Opcode <= Instruction(31 downto 15) after 5ns;
              DR <= Instruction(14 downto 10) after 5ns;
              SA <= Instruction(9 downto 5) after 5ns;
              SB <= Instruction(4 downto 0) after 5ns;
         end if;
     end if;
   end process;

end Behavioral;
