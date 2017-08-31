VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3e"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL B_REG3
        SIGNAL B_REG2_IN
        SIGNAL B_REG1
        SIGNAL B_REG0_IN
        SIGNAL B_REG2
        SIGNAL B_REG1_IN
        SIGNAL B_REG3_IN
        SIGNAL B_REG0
        SIGNAL CarryOut
        SIGNAL FF_CARRY_INPUT
        SIGNAL CarryIn
        SIGNAL B3_NOT_SIG
        SIGNAL B2_NOT_SIG
        SIGNAL B3
        SIGNAL B2
        SIGNAL B1
        SIGNAL B0
        SIGNAL B1_NOT_SIG
        SIGNAL B0_NOT_SIG
        SIGNAL Load
        SIGNAL B3_MUX_OUT
        SIGNAL B2_MUX_OUT
        SIGNAL B1_MUX_OUT
        SIGNAL B0_MUX_OUT
        SIGNAL CLK
        SIGNAL Mode
        SIGNAL A_REG3_IN
        SIGNAL A_REG3
        SIGNAL A_REG2_IN
        SIGNAL A_REG2
        SIGNAL A_REG1_IN
        SIGNAL A_REG1
        SIGNAL A_REG0_IN
        SIGNAL A_REG0
        SIGNAL Sum
        SIGNAL A3
        SIGNAL A2
        SIGNAL A1
        SIGNAL A0
        PORT Input B3
        PORT Input B2
        PORT Input B1
        PORT Input B0
        PORT Input Load
        PORT Input CLK
        PORT Input Mode
        PORT Output A_REG3
        PORT Output A_REG2
        PORT Output A_REG1
        PORT Output A_REG0
        PORT Input A3
        PORT Input A2
        PORT Input A1
        PORT Input A0
        BEGIN BLOCKDEF fd
            TIMESTAMP 2000 1 1 10 10 10
            RECTANGLE N 64 -320 320 -64 
            LINE N 0 -128 64 -128 
            LINE N 0 -256 64 -256 
            LINE N 384 -256 320 -256 
            LINE N 80 -128 64 -144 
            LINE N 64 -112 80 -128 
        END BLOCKDEF
        BEGIN BLOCKDEF FullAdder
            TIMESTAMP 2015 5 3 19 48 50
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            LINE N 320 -160 384 -160 
            LINE N 320 -32 384 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF m2_1
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 96 -64 96 -192 
            LINE N 256 -96 96 -64 
            LINE N 256 -160 256 -96 
            LINE N 96 -192 256 -160 
            LINE N 176 -32 96 -32 
            LINE N 176 -80 176 -32 
            LINE N 0 -32 96 -32 
            LINE N 320 -128 256 -128 
            LINE N 0 -96 96 -96 
            LINE N 0 -160 96 -160 
        END BLOCKDEF
        BEGIN BLOCKDEF inv
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -32 64 -32 
            LINE N 224 -32 160 -32 
            LINE N 64 -64 128 -32 
            LINE N 128 -32 64 0 
            LINE N 64 0 64 -64 
            CIRCLE N 128 -48 160 -16 
        END BLOCKDEF
        BEGIN BLOCK B3_REG_MUX m2_1
            PIN D0 B_REG0
            PIN D1 B3_MUX_OUT
            PIN S0 Load
            PIN O B_REG3_IN
        END BLOCK
        BEGIN BLOCK A3_REG_MUX m2_1
            PIN D0 Sum
            PIN D1 A3
            PIN S0 Load
            PIN O A_REG3_IN
        END BLOCK
        BEGIN BLOCK A2_REG_MUX m2_1
            PIN D0 A_REG3
            PIN D1 A2
            PIN S0 Load
            PIN O A_REG2_IN
        END BLOCK
        BEGIN BLOCK A1_REG_MUX m2_1
            PIN D0 A_REG2
            PIN D1 A1
            PIN S0 Load
            PIN O A_REG1_IN
        END BLOCK
        BEGIN BLOCK FA FullAdder
            PIN A A_REG0
            PIN B B_REG0
            PIN Cin CarryIn
            PIN F Sum
            PIN Cout CarryOut
        END BLOCK
        BEGIN BLOCK B3_MUX m2_1
            PIN D0 B3
            PIN D1 B3_NOT_SIG
            PIN S0 Mode
            PIN O B3_MUX_OUT
        END BLOCK
        BEGIN BLOCK B2_MUX m2_1
            PIN D0 B2
            PIN D1 B2_NOT_SIG
            PIN S0 Mode
            PIN O B2_MUX_OUT
        END BLOCK
        BEGIN BLOCK B0_MUX m2_1
            PIN D0 B0
            PIN D1 B0_NOT_SIG
            PIN S0 Mode
            PIN O B0_MUX_OUT
        END BLOCK
        BEGIN BLOCK A0_REG_MUX m2_1
            PIN D0 A_REG1
            PIN D1 A0
            PIN S0 Load
            PIN O A_REG0_IN
        END BLOCK
        BEGIN BLOCK FF_B2 fd
            PIN C CLK
            PIN D B_REG2_IN
            PIN Q B_REG2
        END BLOCK
        BEGIN BLOCK B2_REG_MUX m2_1
            PIN D0 B_REG3
            PIN D1 B2_MUX_OUT
            PIN S0 Load
            PIN O B_REG2_IN
        END BLOCK
        BEGIN BLOCK FF_B3 fd
            PIN C CLK
            PIN D B_REG3_IN
            PIN Q B_REG3
        END BLOCK
        BEGIN BLOCK B0_REG_MUX m2_1
            PIN D0 B_REG1
            PIN D1 B0_MUX_OUT
            PIN S0 Load
            PIN O B_REG0_IN
        END BLOCK
        BEGIN BLOCK FF_B1 fd
            PIN C CLK
            PIN D B_REG1_IN
            PIN Q B_REG1
        END BLOCK
        BEGIN BLOCK B1_REG_MUX m2_1
            PIN D0 B_REG2
            PIN D1 B1_MUX_OUT
            PIN S0 Load
            PIN O B_REG1_IN
        END BLOCK
        BEGIN BLOCK FF_Carry fd
            PIN C CLK
            PIN D FF_CARRY_INPUT
            PIN Q CarryIn
        END BLOCK
        BEGIN BLOCK FF_CARRY_MUX m2_1
            PIN D0 CarryOut
            PIN D1 Mode
            PIN S0 Load
            PIN O FF_CARRY_INPUT
        END BLOCK
        BEGIN BLOCK NOT_B3 inv
            PIN I B3
            PIN O B3_NOT_SIG
        END BLOCK
        BEGIN BLOCK NOT_B2 inv
            PIN I B2
            PIN O B2_NOT_SIG
        END BLOCK
        BEGIN BLOCK NOT_B1 inv
            PIN I B1
            PIN O B1_NOT_SIG
        END BLOCK
        BEGIN BLOCK NOT_B0 inv
            PIN I B0
            PIN O B0_NOT_SIG
        END BLOCK
        BEGIN BLOCK FF_A1 fd
            PIN C CLK
            PIN D A_REG1_IN
            PIN Q A_REG1
        END BLOCK
        BEGIN BLOCK FF_A2 fd
            PIN C CLK
            PIN D A_REG2_IN
            PIN Q A_REG2
        END BLOCK
        BEGIN BLOCK FF_A3 fd
            PIN C CLK
            PIN D A_REG3_IN
            PIN Q A_REG3
        END BLOCK
        BEGIN BLOCK FF_A0 fd
            PIN C CLK
            PIN D A_REG0_IN
            PIN Q A_REG0
        END BLOCK
        BEGIN BLOCK FF_B0 fd
            PIN C CLK
            PIN D B_REG0_IN
            PIN Q B_REG0
        END BLOCK
        BEGIN BLOCK B1_MUX m2_1
            PIN D0 B1
            PIN D1 B1_NOT_SIG
            PIN S0 Mode
            PIN O B1_MUX_OUT
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 7040 5440
        INSTANCE FF_B2 2080 2768 R0
        INSTANCE FF_B1 2768 2768 R0
        BEGIN BRANCH B_REG1
            WIRE 3152 2512 3216 2512
        END BRANCH
        INSTANCE B1_REG_MUX 2720 2512 R270
        BEGIN BRANCH B_REG2
            WIRE 2464 2512 2560 2512
        END BRANCH
        BEGIN BRANCH B_REG1_IN
            WIRE 2592 2128 2752 2128
            WIRE 2752 2128 2752 2512
            WIRE 2752 2512 2768 2512
            WIRE 2592 2128 2592 2192
        END BRANCH
        INSTANCE B3_REG_MUX 1280 2480 R270
        BEGIN BRANCH B_REG3_IN
            WIRE 1152 2128 1344 2128
            WIRE 1344 2128 1344 2512
            WIRE 1344 2512 1392 2512
            WIRE 1152 2128 1152 2160
        END BRANCH
        BEGIN BRANCH B_REG0
            WIRE 960 2064 960 2480
            WIRE 960 2480 1120 2480
            WIRE 960 2064 3872 2064
            WIRE 3872 2064 3872 2512
            WIRE 3872 2064 4064 2064
            WIRE 3856 2512 3872 2512
        END BRANCH
        BEGIN BRANCH FF_CARRY_INPUT
            WIRE 4448 2480 4656 2480
            WIRE 4656 2464 4656 2480
        END BRANCH
        INSTANCE FF_B3 1392 2768 R0
        BEGIN BRANCH B2_NOT_SIG
            WIRE 1936 3296 1936 3312
        END BRANCH
        BEGIN BRANCH B0
            WIRE 3248 3296 3248 3568
            WIRE 3248 3568 3312 3568
            WIRE 3312 3568 3440 3568
            WIRE 3312 3536 3312 3568
        END BRANCH
        INSTANCE FF_A2 2080 1696 R0
        INSTANCE FF_A3 1392 1696 R0
        INSTANCE FF_A1 2768 1696 R0
        INSTANCE FF_A0 3472 1696 R0
        INSTANCE FF_B0 3472 2768 R0
        BEGIN BRANCH B2
            WIRE 1872 3296 1872 3568
            WIRE 1872 3568 1936 3568
            WIRE 1936 3568 2064 3568
            WIRE 1936 3536 1936 3568
        END BRANCH
        BEGIN BRANCH B1
            WIRE 2592 3296 2592 3568
            WIRE 2592 3568 2656 3568
            WIRE 2656 3568 2768 3568
            WIRE 2656 3552 2656 3568
        END BRANCH
        BEGIN BRANCH B3_NOT_SIG
            WIRE 1216 3296 1216 3328
        END BRANCH
        INSTANCE NOT_B3 1248 3552 R270
        BEGIN BRANCH B3
            WIRE 1152 3296 1152 3568
            WIRE 1152 3568 1216 3568
            WIRE 1216 3568 1376 3568
            WIRE 1216 3552 1216 3568
        END BRANCH
        INSTANCE NOT_B2 1968 3536 R270
        INSTANCE B2_MUX 2032 3296 R270
        INSTANCE NOT_B1 2688 3552 R270
        BEGIN BRANCH B1_NOT_SIG
            WIRE 2656 3296 2656 3328
        END BRANCH
        BEGIN BRANCH B0_NOT_SIG
            WIRE 3312 3296 3312 3312
        END BRANCH
        INSTANCE NOT_B0 3344 3536 R270
        INSTANCE B0_MUX 3408 3296 R270
        BEGIN BRANCH B3_MUX_OUT
            WIRE 1184 2480 1184 2976
        END BRANCH
        BEGIN BRANCH B2_MUX_OUT
            WIRE 1904 2512 1904 2976
        END BRANCH
        BEGIN BRANCH B1_MUX_OUT
            WIRE 2624 2512 2624 2960
            WIRE 2624 2960 2624 2976
        END BRANCH
        BEGIN BRANCH B0_MUX_OUT
            WIRE 3280 2512 3280 2976
        END BRANCH
        INSTANCE B3_MUX 1312 3296 R270
        INSTANCE B1_MUX 2752 3296 R270
        BEGIN BRANCH Mode
            WIRE 1280 3296 1280 3760
            WIRE 1280 3760 2000 3760
            WIRE 2000 3760 2720 3760
            WIRE 2720 3760 3376 3760
            WIRE 3376 3760 5008 3760
            WIRE 5008 3760 5472 3760
            WIRE 2000 3296 2000 3760
            WIRE 2720 3296 2720 3760
            WIRE 3376 3296 3376 3760
            WIRE 4688 2096 5008 2096
            WIRE 5008 2096 5008 3760
            WIRE 4688 2096 4688 2144
        END BRANCH
        BEGIN BRANCH CarryOut
            WIRE 4448 2128 4624 2128
            WIRE 4624 2128 4624 2144
        END BRANCH
        INSTANCE FF_CARRY_MUX 4784 2144 M90
        BEGIN BRANCH A_REG3_IN
            WIRE 1248 1344 1248 1440
            WIRE 1248 1440 1392 1440
        END BRANCH
        BEGIN BRANCH A_REG3
            WIRE 1728 672 1792 672
            WIRE 1792 672 1792 1040
            WIRE 1792 1040 1792 1440
            WIRE 1792 1040 1904 1040
            WIRE 1776 1440 1792 1440
        END BRANCH
        BEGIN BRANCH A_REG2_IN
            WIRE 1936 1360 1936 1440
            WIRE 1936 1440 2080 1440
        END BRANCH
        BEGIN BRANCH A_REG2
            WIRE 2416 672 2480 672
            WIRE 2480 672 2480 1040
            WIRE 2480 1040 2480 1440
            WIRE 2480 1040 2592 1040
            WIRE 2464 1440 2480 1440
        END BRANCH
        BEGIN BRANCH A_REG1_IN
            WIRE 2624 1360 2624 1440
            WIRE 2624 1440 2768 1440
        END BRANCH
        BEGIN BRANCH A_REG1
            WIRE 3104 672 3168 672
            WIRE 3168 672 3168 1040
            WIRE 3168 1040 3168 1440
            WIRE 3168 1040 3296 1040
            WIRE 3152 1440 3168 1440
        END BRANCH
        BEGIN BRANCH A_REG0_IN
            WIRE 3328 1360 3328 1440
            WIRE 3328 1440 3472 1440
        END BRANCH
        BEGIN BRANCH A3
            WIRE 1280 848 1280 1008
            WIRE 1280 1008 1280 1024
        END BRANCH
        BEGIN BRANCH A2
            WIRE 1968 848 1968 1040
        END BRANCH
        BEGIN BRANCH A1
            WIRE 2656 848 2656 1040
        END BRANCH
        BEGIN BRANCH A0
            WIRE 3360 848 3360 1040
        END BRANCH
        BEGIN BRANCH Load
            WIRE 1248 2480 1248 2896
            WIRE 1248 2896 1968 2896
            WIRE 1968 2896 2688 2896
            WIRE 2688 2896 3344 2896
            WIRE 3344 2896 5248 2896
            WIRE 1344 912 2032 912
            WIRE 2032 912 2032 1040
            WIRE 2032 912 2720 912
            WIRE 2720 912 2720 1040
            WIRE 2720 912 3424 912
            WIRE 3424 912 3424 1040
            WIRE 3424 912 5248 912
            WIRE 5248 912 5248 2144
            WIRE 5248 2144 5248 2896
            WIRE 5248 2144 5520 2144
            WIRE 1344 912 1344 1024
            WIRE 1968 2512 1968 2896
            WIRE 2688 2512 2688 2896
            WIRE 3344 2512 3344 2896
            WIRE 4752 2144 5248 2144
        END BRANCH
        IOMARKER 5520 2144 Load R0 60
        IOMARKER 1376 3568 B3 R0 60
        IOMARKER 2064 3568 B2 R0 60
        IOMARKER 2768 3568 B1 R0 60
        IOMARKER 3440 3568 B0 R0 60
        BEGIN INSTANCE FA 4064 2160 R0
        END INSTANCE
        BEGIN BRANCH A_REG0
            WIRE 3808 672 3872 672
            WIRE 3872 672 3872 1440
            WIRE 3872 1440 3872 2000
            WIRE 3872 2000 4064 2000
            WIRE 3856 1440 3872 1440
        END BRANCH
        INSTANCE A1_REG_MUX 2752 1040 M90
        BEGIN BRANCH Sum
            WIRE 960 1008 960 1040
            WIRE 960 1040 960 1808
            WIRE 960 1808 4464 1808
            WIRE 4464 1808 4464 2000
            WIRE 960 1008 1216 1008
            WIRE 1216 1008 1216 1024
            WIRE 4448 2000 4464 2000
            BEGIN DISPLAY 960 1040 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        INSTANCE A2_REG_MUX 2064 1040 M90
        INSTANCE A0_REG_MUX 3456 1040 M90
        IOMARKER 5472 3760 Mode R0 60
        IOMARKER 1968 848 A2 R270 60
        IOMARKER 2656 848 A1 R270 60
        IOMARKER 3360 848 A0 R270 60
        IOMARKER 5536 1712 CLK R0 60
        IOMARKER 1728 672 A_REG3 R180 60
        BEGIN BRANCH B_REG0_IN
            WIRE 3248 2128 3424 2128
            WIRE 3424 2128 3424 2512
            WIRE 3424 2512 3472 2512
            WIRE 3248 2128 3248 2192
        END BRANCH
        INSTANCE B0_REG_MUX 3376 2512 R270
        BEGIN BRANCH B_REG2_IN
            WIRE 1872 2128 2032 2128
            WIRE 2032 2128 2032 2512
            WIRE 2032 2512 2080 2512
            WIRE 1872 2128 1872 2192
        END BRANCH
        BEGIN BRANCH B_REG3
            WIRE 1776 2512 1840 2512
        END BRANCH
        INSTANCE B2_REG_MUX 2000 2512 R270
        BEGIN BRANCH CLK
            WIRE 1376 1568 1392 1568
            WIRE 1376 1568 1376 1712
            WIRE 1376 1712 2080 1712
            WIRE 2080 1712 2768 1712
            WIRE 2768 1712 3472 1712
            WIRE 3472 1712 4880 1712
            WIRE 4880 1712 4880 2800
            WIRE 4880 1712 5536 1712
            WIRE 1376 2640 1392 2640
            WIRE 1376 2640 1376 2800
            WIRE 1376 2800 2080 2800
            WIRE 2080 2800 2768 2800
            WIRE 2768 2800 3472 2800
            WIRE 3472 2800 4448 2800
            WIRE 4448 2800 4880 2800
            WIRE 2080 1568 2080 1712
            WIRE 2080 2640 2080 2800
            WIRE 2768 1568 2768 1712
            WIRE 2768 2640 2768 2800
            WIRE 3472 1568 3472 1712
            WIRE 3472 2640 3472 2800
            WIRE 4448 2608 4448 2800
            BEGIN DISPLAY 1376 2640 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH CarryIn
            WIRE 4048 2128 4064 2128
            WIRE 4048 2128 4048 2480
            WIRE 4048 2480 4064 2480
            BEGIN DISPLAY 4048 2128 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE FF_Carry 4448 2736 M0
        INSTANCE A3_REG_MUX 1376 1024 M90
        IOMARKER 1280 848 A3 R270 60
        IOMARKER 2416 672 A_REG2 R180 60
        IOMARKER 3104 672 A_REG1 R180 60
        IOMARKER 3808 672 A_REG0 R180 60
    END SHEET
END SCHEMATIC
