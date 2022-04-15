# Microprocessor
This code implements a Microprogrammed Instruction Set Processor with 33 registers, it was created in VHDL using Vivado 2020.1
The available instructions include but are not limited to: ADI, LD, SR, INC, NOT, ADD, unconditional jump, and conditionalbranch (only one condition).

![Diagram](https://github.com/RADRII/Microprocessor/blob/main/Images/Diagram.png?raw=true)
The structure of the microprocessor follows this schematic. 

### To run the microprocessor, you must have Vivado. Clone the repository and open a new Vivado project with these settings:
Project Type: RTL Project
Add Sources: All the files within the cloned folder
Also select: "Copy sources into project", Target language: "VHDL", and Simulator language: "VHDL"
Add Constraints: No constraints necessary
Default Part: select xa7s6cpga196-2l (doesn't matter)
New Project Summary

Then each of the testbenches for the system can be run individually to see its functionality with the full microprocessor being the processor.vhd file.