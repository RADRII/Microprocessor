library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PCTB is
end PCTB;

architecture Behavioral of PCTB is
component PC 
    Port( Extend_In : in STD_LOGIC_VECTOR(31 downto 0);
          Reset, PL, PI, Clk : in STD_LOGIC;
          Address_Out : out STD_LOGIC_VECTOR(31 downto 0));
end component;

signal Extend_In, Address_Out : STD_LOGIC_VECTOR(31 downto 0);
signal Reset,PL,PI : STD_LOGIC;
signal Clk : STD_LOGIC:= '0';

begin
UUT: PC port map (Extend_In => Extend_In, Reset => Reset, PL => PL, PI => PI, Clk => Clk, Address_Out => Address_Out);
    Clk <= not CLk after 400ns; 
    PC_Run : Process
    begin
        Reset <= '1';
        PL <= '0';
        PI <= '0';
        Extend_In <= x"00010000";
        wait for 800ns; --Address_Out should be all zeroes
        Reset <= '0';
        PL <= '1';
        wait for 800ns; --Address_Out should be x"00010000";
        PL <= '0';
        PI <= '1';
        wait for 4000ns; --Address_Out should increment every 5ns
    end process;
end behavioral;