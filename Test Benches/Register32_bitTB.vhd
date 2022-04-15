library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register32TB is
end Register32TB;

architecture Behavioral of Register32TB is
    component Register32_bit
    Port( InData : in STD_LOGIC_VECTOR (31 downto 0);
              Load : in STD_LOGIC;
              Clk : in STD_LOGIC;
              OutData : out STD_LOGIC_VECTOR (31 downto 0));
     end component;
     signal InData : STD_LOGIC_VECTOR (31 downto 0);
     signal Load : STD_LOGIC;
     signal Clk : STD_LOGIC:= '0';
     signal  OutData : STD_LOGIC_VECTOR (31 downto 0);
     
begin
UUT: Register32_bit port map (InData => InData, Load => Load, Clk => Clk, OutData => OutData);
    Clk <= not CLk after 5ns; 
    Reg32_run: process
    begin
    InData <= "11111111111111110000000000000000";
    Load <= '1';
    wait for 10ns;
    InData <= "00000000000000001111111111111111";
    Load <= '0';
    wait for 10ns;
    Load <= '1';
    wait for 10ns;
 end process;
end Behavioral;