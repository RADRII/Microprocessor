library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC is
    Port( Extend_In : in STD_LOGIC_VECTOR(31 downto 0);
          Reset, PL, PI, Clk : in STD_LOGIC;
          Address_Out : out STD_LOGIC_VECTOR(31 downto 0));
end PC;

architecture Behavioral of PC is
component Register32_bit
    Port( InData : in STD_LOGIC_VECTOR (31 downto 0);
          Load : in STD_LOGIC;
          Clk : in STD_LOGIC;
          OutData : out STD_LOGIC_VECTOR (31 downto 0));
end component;
component MUX32_1_32
    Port ( 
            S : in STD_LOGIC;
            InData : in STD_LOGIC_VECTOR(31 downto 0);  
            RData : in STD_LOGIC_VECTOR(31 downto 0);
            DataOut : out STD_LOGIC_VECTOR(31 downto 0));
end component;
component ALU
    Port( A, B : in STD_LOGIC_VECTOR(31 downto 0);
          Sct : in STD_LOGIC_VECTOR(3 downto 0);
          V,C : out STD_LOGIC;
          G : out STD_LOGIC_VECTOR(31 downto 0));
end component;

signal To_Store, Stored_Address, AC_To_Mux  : STD_LOGIC_VECTOR(31 downto 0);
signal Reg_Load : STD_LOGIC;
signal ALU_Controller : STD_LOGIC_VECTOR(3 downto 0);

begin
    Reg: Register32_bit port map(InData => To_Store, Load => Reg_Load, Clk => Clk, OutData => Stored_Address);
    A: ALU port map(A => Stored_Address, B => Extend_In, Sct => ALU_Controller, V => open, C => open, G => AC_To_Mux);
    Mux: MUX32_1_32 port map(S => Reset, InData => AC_To_Mux, RData => x"00000000", DataOut => To_Store);
   
    Reg_Load <= PL or PI or Reset after 5ns;
    ALU_Controller <= "00" & PL & PI after 5ns;
    Address_Out <= Stored_Address after 5ns;
    
end Behavioral;
