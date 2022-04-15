library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DatapathTB is
end DatapathTB;

architecture Behavioral of DatapathTB is
component Datapath is
    Port( DataIn, ConstantIn : in STD_LOGIC_VECTOR(31 downto 0);
          Clk: in STD_LOGIC;
          Control: in STD_LOGIC_VECTOR(22 downto 0);
          AddressOut, DataOut : out STD_LOGIC_VECTOR(31 downto 0);
          V, C, N, Z : out STD_LOGIC);
end component;

signal ConstantIn, DataIn, AddressOut, DataOut : STD_LOGIC_VECTOR(31 downto 0);
signal V, C, N, Z : STD_LOGIC;
signal Control : STD_LOGIC_VECTOR(22 downto 0);
signal Clk : STD_LOGIC:= '0';

begin
UUT: Datapath port map(ConstantIn=>ConstantIn, DataIn=>DataIn, Clk=>Clk, Control => Control, 
         AddressOut=>AddressOut, DataOut=>DataOut, V=>V, C=>C, N=>N, Z=>Z);
    Clk <= not CLk after 350ns;  
    DP_Run : process
    begin
        Control <= "00000000000000000000011";
        DataIn <= x"FFFFFFFE";
        wait for 700ns; -- put xFFFFFFFE into reg 0.
        
        Control <= "00001000000000000000001";
        wait for 700ns; -- transfer reg 0 to reg1 (FFFFFFFE)
        Control <= "00010000010000000000101";
        wait for 700ns; -- calc reg1 +1 and put in reg2 (FFFFFFFF)
        Control <= "00011000010000010001001";
        ConstantIn <= x"00000001";
        wait for 700ns; -- calc reg1 + constant and put in reg3, (FFFFFFFF)
        Control <= "00100000010000010001101";
        wait for 700ns; -- calc reg1 + constant + 1 and put in reg4 (00000000)
        Control <= "00101000010000010010001";
        wait for 700ns; -- calc reg1 + 1's comp constant and put in reg5 (FFFFFFFC)
        Control <= "00110000010000010010101";
        wait for 700ns; -- calc reg1 + 2's comp constant and put in reg6 (FFFFFFFD)
        Control <= "00111000010000010011001";
        wait for 700ns; -- calc reg1 - 1 and put in reg7 (FFFFFFFD)
        Control <= "01000000010000010011101";
        wait for 700ns; -- transger reg1 to reg8 (FFFFFFFE)
        
        Control <= "01001000010000010100001";
        wait for 700ns; --  calc reg1 ^ constant and put into reg9 (00000000)
        Control <= "01010000010000010101001";
        wait for 700ns; --  calc reg1 or constant and put into reg10 (FFFFFFFF)
        Control <= "01011000010000010110001";
        wait for 700ns; --  calc reg1 xor constant and put into reg11 (FFFFFFF)
        Control <= "01100000010000010111001";
        wait for 700ns; --  calc not reg1 and put into reg12 (00000001)
        
        Control <= "01101000010000101000001";
        wait for 700ns; --  transfer reg1 to reg13 (FFFFFFFE)
        Control <= "01110000010000101010001";
        wait for 700ns; --  shift reg1 right and put into reg14 (7FFFFFFF)
        Control <= "01111000010000101100001";
        wait for 700ns; --  shift reg1 right and put into reg15 (FFFFFFFC)
        
        --double checking
        Control <= "00000000000000100000000";
        wait for 700ns; --output reg0 to addressout and reg1 to dataout
        Control <= "00000000100001100000000";
        wait for 700ns; --output reg2 to addressout and reg3 to dataout
        Control <= "00000001000010100000000";
        wait for 700ns; --output reg4 to addressout and reg5 to dataout
        Control <= "00000001100011100000000";
        wait for 700ns; --output reg6 to addressout and reg7 to dataout
        Control <= "00000010000100100000000";
        wait for 700ns; --output reg8 to addressout and reg9 to dataout
        Control <= "00000010100101100000000";
        wait for 700ns; --output reg10 to addressout and reg11 to dataout
        Control <= "00000011000110100000000";
        wait for 700ns; --output reg12 to addressout and reg13 to dataout
        Control <= "00000011100111100000000";
        wait for 700ns; --output reg14 to addressout and reg15 to dataout
        
    end process;
end Behavioral;
