library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ControlMemoryTB is
end ControlMemoryTB;

architecture Behavioral of ControlMemoryTB is

component ControlMemory
 Port(Code_In : in STD_LOGIC_VECTOR(16 downto 0);
        NA : out STD_LOGIC_VECTOR(16 downto 0);
        MS : out STD_LOGIC_VECTOR(2 downto 0);
        MC, IL, PI, PL, TD, TA, TB, MB, MD, RW, MM, MW, RV, RC, RN, RZ, FL : out STD_LOGIC;
        FS : out STD_LOGIC_VECTOR(4 downto 0));
end component;

signal Code_In, NA : STD_LOGIC_VECTOR(16 downto 0);
signal MS : STD_LOGIC_VECTOR(2 downto 0);
signal MC, IL, PI, PL, TD, TA, TB, MB, MD, RW, MM, MW, RV, RC, RN, RZ, FL : STD_LOGIC;
signal FS :STD_LOGIC_VECTOR(4 downto 0);

begin
UUT: ControlMemory port map(Code_In => Code_In, NA => NA, MS => MS, MC => MC, IL => IL, PI => PI, PL => PL, TD => TD, TA => TA, TB => TB, 
                MB => MB, MD => MD, RW => RW, MM => MM, MW => MW, RV => RV, RC => RC, RN => RN, RZ => RZ, FL => FL, FS => FS);
    CM_run : process
    begin
        Code_In <= "00000000000000000";
        Wait for 10ns;
        Code_In <= "00000000000000001";
        Wait for 10ns;
        Code_In <= "00000000000000010";
        Wait for 10ns;
        Code_In <= "00000000000000011";
        Wait for 10ns;
        Code_In <= "00000000000000100";
        Wait for 10ns;
        Code_In <= "00000000000000101";
        Wait for 10ns;
        Code_In <= "00000000000000110";
        Wait for 10ns;
        Code_In <= "00000000000000111";
        Wait for 10ns;
        Code_In <= "00000000000001000";
        Wait for 10ns;
        Code_In <= "00000000000001001";
        Wait for 10ns;
        Code_In <= "00000000000001010";
        Wait for 10ns;
        Code_In <= "00000000000001011";
        Wait for 10ns;
        Code_In <= "00000000000001100";
        Wait for 10ns;
    end process;
end Behavioral;
