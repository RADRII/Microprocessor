library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IRTB is
end IRTB;

architecture Behavioral of IRTB is
component IR
 Port(Instruction : in STD_LOGIC_VECTOR(31 downto 0);
        IL, Clk : in STD_LOGIC;
        Opcode : out STD_LOGIC_VECTOR(16 downto 0);
        DR, SA, SB : out STD_LOGIC_VECTOR(4 downto 0));
end component;

signal Clk : STD_LOGIC:= '0';
signal Instruction : STD_LOGIC_VECTOR(31 downto 0);
signal IL : STD_LOGIC;
signal Opcode : STD_LOGIC_VECTOR(16 downto 0);
signal DR, SA, SB : STD_LOGIC_VECTOR(4 downto 0);

begin
UUT: IR port map(Instruction => Instruction, IL => IL, Clk => Clk, Opcode => Opcode, DR => DR, SA => SA, SB => SB);
    Clk <= not CLk after 5ns; 
    IR_Run : Process
    begin
        Instruction <= "00000000000000000111110000011111";
        IL <= '0';
        wait for 10ns;
        IL <= '1';
        wait for 10ns;

    end process;
end Behavioral;
