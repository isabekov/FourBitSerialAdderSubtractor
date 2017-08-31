--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 10.1
--  \   \         Application : ISE
--  /   /         Filename : FourBitSerialAdderSubtractorSimulation.vhw
-- /___/   /\     Timestamp : Sat Dec 27 13:10:02 2014
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: FourBitSerialAdderSubtractorSimulation
--Device: Xilinx
--

library UNISIM;
use UNISIM.Vcomponents.ALL;
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE STD.TEXTIO.ALL;

ENTITY FourBitSerialAdderSubtractorSimulation IS
END FourBitSerialAdderSubtractorSimulation;

ARCHITECTURE testbench_arch OF FourBitSerialAdderSubtractorSimulation IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT FourBitSerialAdderSubtractor
        PORT (
            A0 : In std_logic;
            A1 : In std_logic;
            A2 : In std_logic;
            A3 : In std_logic;
            B0 : In std_logic;
            B1 : In std_logic;
            B2 : In std_logic;
            B3 : In std_logic;
            CLK : In std_logic;
            Load : In std_logic;
            Mode : In std_logic;
            A_REG0 : Out std_logic;
            A_REG1 : Out std_logic;
            A_REG2 : Out std_logic;
            A_REG3 : Out std_logic
        );
    END COMPONENT;

    SIGNAL A0 : std_logic := '0';
    SIGNAL A1 : std_logic := '0';
    SIGNAL A2 : std_logic := '0';
    SIGNAL A3 : std_logic := '0';
    SIGNAL B0 : std_logic := '0';
    SIGNAL B1 : std_logic := '0';
    SIGNAL B2 : std_logic := '0';
    SIGNAL B3 : std_logic := '0';
    SIGNAL CLK : std_logic := '0';
    SIGNAL Load : std_logic := '0';
    SIGNAL Mode : std_logic := '0';
    SIGNAL A_REG0 : std_logic := '0';
    SIGNAL A_REG1 : std_logic := '0';
    SIGNAL A_REG2 : std_logic := '0';
    SIGNAL A_REG3 : std_logic := '0';

    constant PERIOD : time := 200 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 100 ns;

    BEGIN
        UUT : FourBitSerialAdderSubtractor
        PORT MAP (
            A0 => A0,
            A1 => A1,
            A2 => A2,
            A3 => A3,
            B0 => B0,
            B1 => B1,
            B2 => B2,
            B3 => B3,
            CLK => CLK,
            Load => Load,
            Mode => Mode,
            A_REG0 => A_REG0,
            A_REG1 => A_REG1,
            A_REG2 => A_REG2,
            A_REG3 => A_REG3
        );

        PROCESS    -- clock process for CLK
        BEGIN
            WAIT for OFFSET;
            CLOCK_LOOP : LOOP
                CLK <= '0';
                WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
                CLK <= '1';
                WAIT FOR (PERIOD * DUTY_CYCLE);
            END LOOP CLOCK_LOOP;
        END PROCESS;

        PROCESS
            BEGIN
                -- -------------  Current Time:  185ns
                WAIT FOR 185 ns;
                A0 <= '1';
                A1 <= '1';
                B0 <= '1';
                Load <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  385ns
                WAIT FOR 200 ns;
                Load <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  1385ns
                WAIT FOR 1000 ns;
                Load <= '1';
                Mode <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  1585ns
                WAIT FOR 200 ns;
                Load <= '0';
                -- -------------------------------------
                WAIT FOR 2615 ns;

            END PROCESS;

    END testbench_arch;

