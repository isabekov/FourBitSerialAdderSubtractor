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
-- /___/   /\     Timestamp : Sat Dec 27 10:51:06 2014
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: Test
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY FourBitSerialAdderSubtractorSimulation IS
END FourBitSerialAdderSubtractorSimulation;

ARCHITECTURE testbench_arch OF FourBitSerialAdderSubtractorSimulation IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT FourBitSerialAdderSubtractor
        PORT (
            A : In std_logic_vector (3 DownTo 0);
            B : In std_logic_vector (3 DownTo 0);
            CLK : In std_logic;
            Mode : In std_logic;
            Load : In std_logic;
            A_Reg_Out : Out std_logic_vector (3 DownTo 0);
            B_Reg_Out : Out std_logic_vector (3 DownTo 0);
            Sev_Seg_Out : Out std_logic_vector (6 DownTo 0)
        );
    END COMPONENT;

    SIGNAL A : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL B : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL CLK : std_logic := '0';
    SIGNAL Mode : std_logic := '0';
    SIGNAL Load : std_logic := '0';
    SIGNAL A_Reg_Out : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL B_Reg_Out : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL Sev_Seg_Out : std_logic_vector (6 DownTo 0) := "0000000";

    constant PERIOD : time := 200 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 100 ns;

    BEGIN
        UUT : FourBitSerialAdderSubtractor
        PORT MAP (
            A => A,
            B => B,
            CLK => CLK,
            Mode => Mode,
            Load => Load,
            A_Reg_Out => A_Reg_Out,
            B_Reg_Out => B_Reg_Out,
            Sev_Seg_Out => Sev_Seg_Out
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
                Load <= '1';
                A <= "0011";
                B <= "0001";
                -- -------------------------------------
                -- -------------  Current Time:  385ns
                WAIT FOR 200 ns;
                Load <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  1385ns
                WAIT FOR 1000 ns;
                Mode <= '1';
                Load <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  1585ns
                WAIT FOR 200 ns;
                Load <= '0';
                -- -------------------------------------
                WAIT FOR 2615 ns;

            END PROCESS;

    END testbench_arch;

