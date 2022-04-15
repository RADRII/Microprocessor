library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Processor is
    Port(Clk, Reset : in STD_LOGIC;
         RP00,RP01,RP02,RP03,RP04,RP05,RP06,RP07,RP08,RP09,RP10,RP11,RP12,RP13,RP14,RP15,
         RP16,RP17,RP18,RP19,RP20,RP21,RP22,RP23,RP24,RP25,RP26,RP27,RP28,RP29,RP30,RP31,RP32 : out STD_LOGIC_VECTOR(31 downto 0));
end Processor;

architecture Behavioral of Processor is
component Extend
    Port(DR, SB : in STD_LOGIC_VECTOR(4 downto 0);
         Data_Out : out STD_LOGIC_VECTOR(31 downto 0));
end component;

component FunctionalUnit is
    Port( A,B : in STD_LOGIC_VECTOR(31 downto 0);
          GSct : in STD_LOGIC_VECTOR(3 downto 0);
          HSct : in STD_LOGIC_VECTOR(1 downto 0);
          MF : in STD_LOGIC;
          V,C,N,Z : out STD_LOGIC;
          O : out STD_LOGIC_VECTOR(31 downto 0));     
end component;

component IR
 Port(Instruction : in STD_LOGIC_VECTOR(31 downto 0);
        IL, Clk : in STD_LOGIC;
        Opcode : out STD_LOGIC_VECTOR(16 downto 0);
        DR, SA, SB : out STD_LOGIC_VECTOR(4 downto 0));
end component;

component MUX32_1_32 is
   port(
         S : in STD_LOGIC;
         InData, RData : in STD_LOGIC_VECTOR(31 downto 0);
         DataOut : out STD_LOGIC_VECTOR(31 downto 0)
        );
end component;

component MUXS
    Port( NZVC : in STD_LOGIC_VECTOR(3 downto 0);
          MS : in STD_LOGIC_VECTOR(2 downto 0);
          O : out STD_LOGIC);
end component;

component PC 
    Port( Extend_In : in STD_LOGIC_VECTOR(31 downto 0);
          Reset, PL, PI, Clk : in STD_LOGIC;
          Address_Out : out STD_LOGIC_VECTOR(31 downto 0));
end component;

component Register32_bitSystem 
    Port( DSelect, MuxA, MuxB : in STD_LOGIC_VECTOR (4 downto 0);
          Clk, LEnable, TD, TA, TB : in STD_LOGIC;
          InData : in STD_LOGIC_VECTOR (31 downto 0);
          DataA, DataB : out STD_LOGIC_VECTOR (31 downto 0);
          RP00,RP01,RP02,RP03,RP04,RP05,RP06,RP07,RP08,RP09,RP10,RP11,RP12,RP13,RP14,RP15,
          RP16,RP17,RP18,RP19,RP20,RP21,RP22,RP23,RP24,RP25,RP26,RP27,RP28,RP29,RP30,RP31,RP32 : out STD_LOGIC_VECTOR(31 downto 0));
end component;

component VZNC
     Port(V,Z,N,C,FL, Clk : in STD_LOGIC;
        Reset : in STD_LOGIC_VECTOR(3 downto 0);
        NZVC : out STD_LOGIC_VECTOR(3 downto 0));
end component;

component ZeroFill
    Port(SB : in STD_LOGIC_VECTOR(4 downto 0);
         Data_Out : out STD_LOGIC_VECTOR(31 downto 0));
end component;

component CAR 
    Port(Code : in STD_LOGIC_VECTOR(16 downto 0);
         S, Clk, Reset : in STD_LOGIC;
         Code_Out : out STD_LOGIC_VECTOR(16 downto 0));
end component;

component MUX17_1_17 
    Port(A, B : in STD_LOGIC_VECTOR(16 downto 0);
         S : in STD_LOGIC;
         O : out STD_LOGIC_VECTOR(16 downto 0));
end component;

component ControlMemory 
    Port(Code_In : in STD_LOGIC_VECTOR(16 downto 0);
         NA : out STD_LOGIC_VECTOR(16 downto 0);
         MS : out STD_LOGIC_VECTOR(2 downto 0);
         MC, IL, PI, PL, TD, TA, TB, MB, MD, RW, MM, MW, RV, RC, RN, RZ, FL : out STD_LOGIC;
         FS : out STD_LOGIC_VECTOR(4 downto 0));
end component; 

component MemoryM 
    Port(Data_In, Address : in STD_LOGIC_VECTOR(31 downto 0);
         MW : in STD_LOGIC;
         Data_Out : out STD_LOGIC_VECTOR(31 downto 0));
end component;

signal MC, IL, PI ,PL, TD, TA, TB, MB, MD, RW, MM, MW, RV, RC, RN, RZ, FL, V, Z, N, C, MF: STD_LOGIC;
signal MUXS_To_CAR : STD_LOGIC;
signal MS : STD_LOGIC_VECTOR(2 downto 0);
signal VCNZ_To_MUXS, ResetVCNZ, GSct : STD_LOGIC_VECTOR(3 downto 0);
signal FS, DR, SA, SB : STD_LOGIC_VECTOR(4 downto 0);
signal HSct : STD_LOGIC_VECTOR(1 downto 0);
signal NA, MUXC_To_CAR, CAR_To_CM, IR_To_MUXC : STD_LOGIC_VECTOR(16 downto 0);
signal Extend_To_PC, PC_To_MUXM, Memory_Out, ZeroFill_To_MUXB, BusA, Register_To_MUXB, MUXB_Out, Function_To_MUXD, BusD, MUXM_To_Memory : STD_LOGIC_VECTOR(31 downto 0);

begin
Ext: Extend port map(DR => DR, SB => SB, Data_Out => Extend_To_PC);
PC0: PC port map(Extend_In => Extend_To_PC, PL => PL, PI => PI, Reset => Reset ,Clk => Clk, Address_Out => PC_To_MUXM);
MUXS0: MUXS port map(NZVC => VCNZ_To_MUXS, MS => MS, O => MUXS_To_CAR);
MUXC: MUX17_1_17 port map(A => IR_To_MUXC, B => NA, S => MC, O =>MUXC_To_CAR);
IR0: IR port map(Instruction => Memory_Out, IL => IL, Clk => Clk, Opcode => IR_To_MUXC, DR => DR, SA => SA, SB => SB);
ZeroFill0: ZeroFill port map(SB => SB, Data_Out => ZeroFill_To_MUXB);
CAR0: CAR port map(Code => MUXC_To_CAR, S => MUXS_To_CAR, Clk => Clk, Reset => Reset, Code_Out => CAR_To_CM);
ControlMemory0: ControlMemory port map(Code_In => CAR_To_CM, NA => NA, MS => MS, MC => MC, IL => IL, PI => PI, PL => PL
                                    , TD => TD, TA => TA, TB => TB, MB => MB, MD => MD, RW => RW, MM => MM, MW => MW
                                    , RV => RV, RC => RC, RN => RN, RZ => RZ, FL => FL, FS => FS);
VCNZ0: VZNC port map(V => V, N => N, Z => Z, C => C, FL => FL, Clk => Clk, Reset => ResetVCNZ, NZVC => VCNZ_To_MUXS);
RegSys: Register32_bitSystem port map(DSelect => DR, MuxA => SA, MuxB => SB, Clk => Clk, LEnable => RW, TD => TD, TA => TA,
                                   TB => TB, InData => BusD, DataA => BusA, DataB => Register_To_MUXB,
                                   RP00 => RP00, RP01 => RP01, RP02 => RP02, RP03 => RP03, RP04 => RP04, RP05 => RP05, RP06 => RP06, RP07 => RP07, RP08 => RP08, RP09 => RP09, RP10 => RP10, RP11 => RP11, RP12 => RP12, RP13 => RP13, RP14 => RP14, RP15 => RP15, RP16 => RP16, RP17 => RP17, RP18 => RP18, RP19 => RP19, RP20 => RP20, RP21 => RP21, RP22 => RP22, RP23 => RP23, RP24 => RP24, RP25 => RP25, RP26 => RP26, RP27 => RP27, RP28 => RP28, RP29 => RP29, RP30 => RP30, RP31 => RP31, RP32 => RP32);
MUXB: MUX32_1_32 port map(S => MB, InData => Register_To_MUXB, RData => ZeroFill_To_MUXB, DataOut => MUXB_Out);
MUXM: MUX32_1_32 port map(S => MM, InData => BusA, RData => PC_To_MUXM, DataOut => MUXM_To_Memory);
MUXD: MUX32_1_32 port map(S => MD, InData => Function_To_MUXD, RData => Memory_Out, DataOut => BusD);
Func: FunctionalUnit port map(A => BusA, B => MUXB_Out, GSct => GSct, HSct => HSct, MF => MF, V => V, C => C, N => N, Z => Z, O => Function_To_MUXD);
Mem: MemoryM port map(Data_In => MUXB_Out, Address => MUXM_To_Memory, MW => MW, Data_Out => Memory_Out);

GSct <= FS(3) & FS(2) & FS(1) & FS(0);
HSct <= FS(3) & FS(2);
MF <= FS(4);
ResetVCNZ <= RV & RC & RN & RZ;

end behavioral; 
