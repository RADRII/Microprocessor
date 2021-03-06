library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ControlMemory is
    Port(Code_In : in STD_LOGIC_VECTOR(16 downto 0);
         NA : out STD_LOGIC_VECTOR(16 downto 0);
         MS : out STD_LOGIC_VECTOR(2 downto 0);
         MC, IL, PI, PL, TD, TA, TB, MB, MD, RW, MM, MW, RV, RC, RN, RZ, FL : out STD_LOGIC;
         FS : out STD_LOGIC_VECTOR(4 downto 0));
end ControlMemory;

architecture Behavioral of ControlMemory is
type mem_array is array(0 to 255) of std_logic_vector(41 downto 0);

begin

memory_m: process(Code_In)
variable control_mem : mem_array:=(
-- |41           25|24 22| 21| 20| 19| 18| 17| 16| 15| 14| 13  9| 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
-- | Next Address  | MS  | M | I | P | P | T | T | T | M |  FS   | M | R | M | M | R | R | R | R | F |
-- | Next Address  | MS  | C | L | I | L | D | A | B | B |  FS   | D | W | M | W | V | C | N | Z | L |
"00000000000000000"&"001"&'1'&'1'&'1'&'0'&'0'&'0'&'0'&'1'&"00000"&'0'&'1'&'1'&'0'&'0'&'0'&'0'&'0'&'0',--  0 initialize processor
"00000000000000000"&"001"&'1'&'1'&'1'&'0'&'0'&'0'&'0'&'1'&"10000"&'0'&'1'&'1'&'0'&'0'&'0'&'0'&'0'&'0',--  1 Move constant from memory to reg
"00000000000000000"&"001"&'1'&'1'&'1'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'1'&'1'&'0'&'0'&'0'&'0'&'0'&'0',--  2 Move reg to reg 
"00000000000000000"&"001"&'1'&'1'&'1'&'0'&'0'&'0'&'0'&'0'&"00010"&'0'&'1'&'1'&'0'&'0'&'0'&'0'&'0'&'0',--  3 Add two regs and put into dest reg
"00000000000000000"&"001"&'1'&'1'&'1'&'0'&'0'&'0'&'0'&'1'&"00010"&'0'&'1'&'1'&'0'&'0'&'0'&'0'&'0'&'0',--  4 ADI
"00000000000000000"&"001"&'1'&'1'&'1'&'0'&'0'&'0'&'0'&'0'&"01110"&'0'&'1'&'1'&'0'&'0'&'0'&'0'&'0'&'0',--  5 NOT reg
"00000000000000000"&"001"&'1'&'1'&'1'&'0'&'0'&'0'&'0'&'0'&"00001"&'0'&'1'&'1'&'0'&'0'&'0'&'0'&'0'&'0',--  6 INC reg
"00000000000000000"&"001"&'1'&'1'&'1'&'0'&'0'&'0'&'0'&'0'&"00101"&'0'&'0'&'1'&'0'&'0'&'0'&'0'&'0'&'1',--  7 CMP 2 regs
-- |41           25|24 22| 21| 20| 19| 18| 17| 16| 15| 14| 13  9| 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
-- | Next Address  | MS  | M | I | P | P | T | T | T | M |  FS   | M | R | M | M | R | R | R | R | F |
-- | Next Address  | MS  | C | L | I | L | D | A | B | B |  FS   | D | W | M | W | V | C | N | Z | L |
"00000000000001001"&"100"&'1'&'0'&'0'&'1'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'1'&'0'&'0'&'0'&'0'&'0'&'0',--  8 BEQ 
"00000000000001010"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'1'&'0'&'0'&'0'&'0'&'0'&'0',--  9 ^^
"00000000000000000"&"001"&'1'&'1'&'1'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'1'&'0'&'0'&'0'&'0'&'0'&'0',--  a ^^^ gucci
"00000000000001100"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',--  b B (Unconditional)
"00000000000001101"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'1'&'0'&'0'&'0'&'0'&'0'&'0',--  c ^^
"00000000000000000"&"001"&'1'&'1'&'1'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'1'&'0'&'0'&'0'&'0'&'0'&'0',--  d ^^^ gucci
"00000000000001111"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'1'&'1'&'0'&'0'&'0'&'0'&'0'&'0'&'0',--  e LD mem into reg (32 bits)
"00000000000000000"&"001"&'1'&'1'&'1'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'1'&'0'&'0'&'0'&'0'&'0'&'0',--  f ^^
-- |41           25|24 22| 21| 20| 19| 18| 17| 16| 15| 14| 13  9| 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
-- | Next Address  | MS  | M | I | P | P | T | T | T | M |  FS   | M | R | M | M | R | R | R | R | F |
-- | Next Address  | MS  | C | L | I | L | D | A | B | B |  FS   | D | W | M | W | V | C | N | Z | L |
"00000000000000000"&"001"&'1'&'1'&'1'&'0'&'0'&'0'&'0'&'0'&"10100"&'0'&'1'&'1'&'0'&'0'&'0'&'0'&'0'&'0',-- 10 SR reg 1 bit
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 11
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 12
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 13
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 14
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 15
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 16
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 17
-- |41           25|24 22| 21| 20| 19| 18| 17| 16| 15| 14| 13  9| 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
-- | Next Address  | MS  | M | I | P | P | T | T | T | M |  FS  | M | R | M | M | R | R | R | R | F |
-- | Next Address  | MS  | C | L | I | L | D | A | B | B |  FS  | D | W | M | W | V | C | N | Z | L |
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 18
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 19
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 1a
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 1b
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 1c
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 1d
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 1e
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 1f
-- |41           25|24 22| 21| 20| 19| 18| 17| 16| 15| 14| 13  9| 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
-- | Next Address  | MS  | M | I | P | P | T | T | T | M |  FS  | M | R | M | M | R | R | R | R | F |
-- | Next Address  | MS  | C | L | I | L | D | A | B | B |  FS  | D | W | M | W | V | C | N | Z | L |
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 20
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 21
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 22
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 23
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 24
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 25
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 26
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 27
-- |41           25|24 22| 21| 20| 19| 18| 17| 16| 15| 14| 13  9| 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
-- | Next Address  | MS  | M | I | P | P | T | T | T | M |  FS  | M | R | M | M | R | R | R | R | F |
-- | Next Address  | MS  | C | L | I | L | D | A | B | B |  FS  | D | W | M | W | V | C | N | Z | L |
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 28
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 29
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 2a
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 2b
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 2c
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 2d
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 2e
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 2f
-- |41           25|24 22| 21| 20| 19| 18| 17| 16| 15| 14| 13  9| 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
-- | Next Address  | MS  | M | I | P | P | T | T | T | M |  FS  | M | R | M | M | R | R | R | R | F |
-- | Next Address  | MS  | C | L | I | L | D | A | B | B |  FS  | D | W | M | W | V | C | N | Z | L |
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 30
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 31
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 32
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 33
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 34
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 35
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 36
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 37
-- |41           25|24 22| 21| 20| 19| 18| 17| 16| 15| 14| 13  9| 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
-- | Next Address  | MS  | M | I | P | P | T | T | T | M |  FS  | M | R | M | M | R | R | R | R | F |
-- | Next Address  | MS  | C | L | I | L | D | A | B | B |  FS  | D | W | M | W | V | C | N | Z | L |
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 38
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 39
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 3a
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 3b
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 3c
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 3d
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 3e
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 3f
-- |41           25|24 22| 21| 20| 19| 18| 17| 16| 15| 14| 13  9| 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
-- | Next Address  | MS  | M | I | P | P | T | T | T | M |  FS  | M | R | M | M | R | R | R | R | F |
-- | Next Address  | MS  | C | L | I | L | D | A | B | B |  FS  | D | W | M | W | V | C | N | Z | L |
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 40
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 41
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 42
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 43
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 44
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 45
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 46
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 47
-- |41           25|24 22| 21| 20| 19| 18| 17| 16| 15| 14| 13  9| 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
-- | Next Address  | MS  | M | I | P | P | T | T | T | M |  FS  | M | R | M | M | R | R | R | R | F |
-- | Next Address  | MS  | C | L | I | L | D | A | B | B |  FS  | D | W | M | W | V | C | N | Z | L |
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 48
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 49
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 4a
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 4b
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 4c
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 4d
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 4e
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 4f
-- |41           25|24 22| 21| 20| 19| 18| 17| 16| 15| 14| 13  9| 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
-- | Next Address  | MS  | M | I | P | P | T | T | T | M |  FS  | M | R | M | M | R | R | R | R | F |
-- | Next Address  | MS  | C | L | I | L | D | A | B | B |  FS  | D | W | M | W | V | C | N | Z | L |
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 50
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 51
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 52
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 53
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 54
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 55
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 56
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 57
-- |41           25|24 22| 21| 20| 19| 18| 17| 16| 15| 14| 13  9| 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
-- | Next Address  | MS  | M | I | P | P | T | T | T | M |  FS  | M | R | M | M | R | R | R | R | F |
-- | Next Address  | MS  | C | L | I | L | D | A | B | B |  FS  | D | W | M | W | V | C | N | Z | L |
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 58
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 59
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 5a
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 5b
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 5c
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 5d
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 5e
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 5f
-- |41           25|24 22| 21| 20| 19| 18| 17| 16| 15| 14| 13  9| 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
-- | Next Address  | MS  | M | I | P | P | T | T | T | M |  FS  | M | R | M | M | R | R | R | R | F |
-- | Next Address  | MS  | C | L | I | L | D | A | B | B |  FS  | D | W | M | W | V | C | N | Z | L |
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 60
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 61
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 62
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 63
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 64
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 65
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 66
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 67
-- |41           25|24 22| 21| 20| 19| 18| 17| 16| 15| 14| 13  9| 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
-- | Next Address  | MS  | M | I | P | P | T | T | T | M |  FS  | M | R | M | M | R | R | R | R | F |
-- | Next Address  | MS  | C | L | I | L | D | A | B | B |  FS  | D | W | M | W | V | C | N | Z | L |
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 68
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 69
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 6a
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 6b
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 6c
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 6d
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 6e
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 6f
-- |41           25|24 22| 21| 20| 19| 18| 17| 16| 15| 14| 13  9| 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
-- | Next Address  | MS  | M | I | P | P | T | T | T | M |  FS  | M | R | M | M | R | R | R | R | F |
-- | Next Address  | MS  | C | L | I | L | D | A | B | B |  FS  | D | W | M | W | V | C | N | Z | L |
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 70
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 71
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 72
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 73
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 74
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 75
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 76
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 77
-- |41           25|24 22| 21| 20| 19| 18| 17| 16| 15| 14| 13  9| 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
-- | Next Address  | MS  | M | I | P | P | T | T | T | M |  FS  | M | R | M | M | R | R | R | R | F |
-- | Next Address  | MS  | C | L | I | L | D | A | B | B |  FS  | D | W | M | W | V | C | N | Z | L |
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 78
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 79
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 7a
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 7b
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 7c
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 7d
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 7e
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 7f
-- |41           25|24 22| 21| 20| 19| 18| 17| 16| 15| 14| 13  9| 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
-- | Next Address  | MS  | M | I | P | P | T | T | T | M |  FS  | M | R | M | M | R | R | R | R | F |
-- | Next Address  | MS  | C | L | I | L | D | A | B | B |  FS  | D | W | M | W | V | C | N | Z | L |
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 80
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 81
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 82
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 83
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 84
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 85
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 86
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 87
-- |41           25|24 22| 21| 20| 19| 18| 17| 16| 15| 14| 13  9| 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
-- | Next Address  | MS  | M | I | P | P | T | T | T | M |  FS  | M | R | M | M | R | R | R | R | F |
-- | Next Address  | MS  | C | L | I | L | D | A | B | B |  FS  | D | W | M | W | V | C | N | Z | L |
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 88
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 89
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 8a
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 8b
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 8c
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 8d
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 8e
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 8f
-- |41           25|24 22| 21| 20| 19| 18| 17| 16| 15| 14| 13  9| 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
-- | Next Address  | MS  | M | I | P | P | T | T | T | M |  FS  | M | R | M | M | R | R | R | R | F |
-- | Next Address  | MS  | C | L | I | L | D | A | B | B |  FS  | D | W | M | W | V | C | N | Z | L |
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 90
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 91
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 92
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 93
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 94
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 95
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 96
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 97
-- |41           25|24 22| 21| 20| 19| 18| 17| 16| 15| 14| 13  9| 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
-- | Next Address  | MS  | M | I | P | P | T | T | T | M |  FS  | M | R | M | M | R | R | R | R | F |
-- | Next Address  | MS  | C | L | I | L | D | A | B | B |  FS  | D | W | M | W | V | C | N | Z | L |
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 98
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 99
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 9a
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 9b
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 9c
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 9d
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 9e
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- 9f
-- |41           25|24 22| 21| 20| 19| 18| 17| 16| 15| 14| 13  9| 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
-- | Next Address  | MS  | M | I | P | P | T | T | T | M |  FS  | M | R | M | M | R | R | R | R | F |
-- | Next Address  | MS  | C | L | I | L | D | A | B | B |  FS  | D | W | M | W | V | C | N | Z | L |
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- a0
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- a1
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- a2
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- a3
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- a4
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- a5
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- a6
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- a7
-- |41           25|24 22| 21| 20| 19| 18| 17| 16| 15| 14| 13  9| 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
-- | Next Address  | MS  | M | I | P | P | T | T | T | M |  FS  | M | R | M | M | R | R | R | R | F |
-- | Next Address  | MS  | C | L | I | L | D | A | B | B |  FS  | D | W | M | W | V | C | N | Z | L |
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- a8
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- a9
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- aa
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- ab
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- ac
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- ad
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- ae
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- af
-- |41           25|24 22| 21| 20| 19| 18| 17| 16| 15| 14| 13  9| 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
-- | Next Address  | MS  | M | I | P | P | T | T | T | M |  FS  | M | R | M | M | R | R | R | R | F |
-- | Next Address  | MS  | C | L | I | L | D | A | B | B |  FS  | D | W | M | W | V | C | N | Z | L |
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- b0
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- b1
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- b2
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- b3
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- b4
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- b5
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- b6
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- b7
-- |41           25|24 22| 21| 20| 19| 18| 17| 16| 15| 14| 13  9| 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
-- | Next Address  | MS  | M | I | P | P | T | T | T | M |  FS  | M | R | M | M | R | R | R | R | F |
-- | Next Address  | MS  | C | L | I | L | D | A | B | B |  FS  | D | W | M | W | V | C | N | Z | L |
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- b8
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- b9
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- ba
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- bb
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- bc
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- bd
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- be
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- bf
-- |41           25|24 22| 21| 20| 19| 18| 17| 16| 15| 14| 13  9| 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
-- | Next Address  | MS  | M | I | P | P | T | T | T | M |  FS  | M | R | M | M | R | R | R | R | F |
-- | Next Address  | MS  | C | L | I | L | D | A | B | B |  FS  | D | W | M | W | V | C | N | Z | L |
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- c0
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- c1
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- c2
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- c3
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- c4
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- c5
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- c6
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- c7
-- |41           25|24 22| 21| 20| 19| 18| 17| 16| 15| 14| 13  9| 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
-- | Next Address  | MS  | M | I | P | P | T | T | T | M |  FS  | M | R | M | M | R | R | R | R | F |
-- | Next Address  | MS  | C | L | I | L | D | A | B | B |  FS  | D | W | M | W | V | C | N | Z | L |
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- c8
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- c9
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- ca
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- cb
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- cc
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- cd
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- ce
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- cf
-- |41           25|24 22| 21| 20| 19| 18| 17| 16| 15| 14| 13  9| 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
-- | Next Address  | MS  | M | I | P | P | T | T | T | M |  FS  | M | R | M | M | R | R | R | R | F |
-- | Next Address  | MS  | C | L | I | L | D | A | B | B |  FS  | D | W | M | W | V | C | N | Z | L |
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- d0
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- d1
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- d2
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- d3
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- d4
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- d5
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- d6
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- d7
-- |41           25|24 22| 21| 20| 19| 18| 17| 16| 15| 14| 13  9| 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
-- | Next Address  | MS  | M | I | P | P | T | T | T | M |  FS  | M | R | M | M | R | R | R | R | F |
-- | Next Address  | MS  | C | L | I | L | D | A | B | B |  FS  | D | W | M | W | V | C | N | Z | L |
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- d8
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- d9
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- da
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- db
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- dc
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- dd
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- de
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- df
-- |41           25|24 22| 21| 20| 19| 18| 17| 16| 15| 14| 13  9| 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
-- | Next Address  | MS  | M | I | P | P | T | T | T | M |  FS  | M | R | M | M | R | R | R | R | F |
-- | Next Address  | MS  | C | L | I | L | D | A | B | B |  FS  | D | W | M | W | V | C | N | Z | L |
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- e0
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- e1
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- e2
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- e3
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- e4
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- e5
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- e6
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- e7
-- |41           25|24 22| 21| 20| 19| 18| 17| 16| 15| 14| 13  9| 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
-- | Next Address  | MS  | M | I | P | P | T | T | T | M |  FS  | M | R | M | M | R | R | R | R | F |
-- | Next Address  | MS  | C | L | I | L | D | A | B | B |  FS  | D | W | M | W | V | C | N | Z | L |
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- e8
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- e9
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- ea
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- eb
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- ec
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- ed
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- ee
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- ef
-- |41           25|24 22| 21| 20| 19| 18| 17| 16| 15| 14| 13  9| 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
-- | Next Address  | MS  | M | I | P | P | T | T | T | M |  FS  | M | R | M | M | R | R | R | R | F |
-- | Next Address  | MS  | C | L | I | L | D | A | B | B |  FS  | D | W | M | W | V | C | N | Z | L |
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- f0
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- f1
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- f2
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- f3
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- f4
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- f5
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- f6
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- f7
-- |41           25|24 22| 21| 20| 19| 18| 17| 16| 15| 14| 13  9| 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
-- | Next Address  | MS  | M | I | P | P | T | T | T | M |  FS  | M | R | M | M | R | R | R | R | F |
-- | Next Address  | MS  | C | L | I | L | D | A | B | B |  FS  | D | W | M | W | V | C | N | Z | L |
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- f8
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- f9
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- fa
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- fb
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- fc
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- fd
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0',-- fe
"00000000000000000"&"000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&"00000"&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0'&'0' -- ff
);
variable addr : integer;
variable control_out : std_logic_vector(41 downto 0);
begin
addr := conv_integer(unsigned(Code_In));
control_out := control_mem(addr);
FL <= control_out(0);
RZ <= control_out(1);
RN <= control_out(2);
RC <= control_out(3);
RV <= control_out(4);
MW <= control_out(5);
MM <= control_out(6);
RW <= control_out(7);
MD <= control_out(8);
FS <= control_out(13 downto 9);
MB <= control_out(14);
TB <= control_out(15);
TA <= control_out(16);
TD <= control_out(17);
PL <= control_out(18);
PI <= control_out(19);
IL <= control_out(20);
MC <= control_out(21);
MS <= control_out(24 downto 22);
NA <= control_out(41 downto 25);
end process;

end behavioral;
