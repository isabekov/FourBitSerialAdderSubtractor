VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3e"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL XLXN_1
        SIGNAL A
        SIGNAL B
        SIGNAL Cin
        SIGNAL XLXN_5
        SIGNAL XLXN_6
        SIGNAL F
        SIGNAL Cout
        PORT Input A
        PORT Input B
        PORT Input Cin
        PORT Output F
        PORT Output Cout
        BEGIN BLOCKDEF xor2
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 64 -64 
            LINE N 0 -128 60 -128 
            LINE N 256 -96 208 -96 
            ARC N -40 -152 72 -40 48 -48 44 -144 
            ARC N -24 -152 88 -40 64 -48 64 -144 
            LINE N 128 -144 64 -144 
            LINE N 128 -48 64 -48 
            ARC N 44 -144 220 32 208 -96 128 -144 
            ARC N 44 -224 220 -48 128 -48 208 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF and2
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 64 -64 
            LINE N 0 -128 64 -128 
            LINE N 256 -96 192 -96 
            ARC N 96 -144 192 -48 144 -48 144 -144 
            LINE N 144 -48 64 -48 
            LINE N 64 -144 144 -144 
            LINE N 64 -48 64 -144 
        END BLOCKDEF
        BEGIN BLOCKDEF or2
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 64 -64 
            LINE N 0 -128 64 -128 
            LINE N 256 -96 192 -96 
            ARC N 28 -224 204 -48 112 -48 192 -96 
            ARC N -40 -152 72 -40 48 -48 48 -144 
            LINE N 112 -144 48 -144 
            ARC N 28 -144 204 32 192 -96 112 -144 
            LINE N 112 -48 48 -48 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 xor2
            PIN I0 B
            PIN I1 A
            PIN O XLXN_1
        END BLOCK
        BEGIN BLOCK XLXI_2 xor2
            PIN I0 Cin
            PIN I1 XLXN_1
            PIN O F
        END BLOCK
        BEGIN BLOCK XLXI_3 and2
            PIN I0 B
            PIN I1 A
            PIN O XLXN_5
        END BLOCK
        BEGIN BLOCK XLXI_4 and2
            PIN I0 Cin
            PIN I1 XLXN_1
            PIN O XLXN_6
        END BLOCK
        BEGIN BLOCK XLXI_5 or2
            PIN I0 XLXN_5
            PIN I1 XLXN_6
            PIN O Cout
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_1 944 784 R0
        INSTANCE XLXI_2 1312 816 R0
        INSTANCE XLXI_3 944 1168 R0
        INSTANCE XLXI_4 1280 1072 R0
        INSTANCE XLXI_5 1552 1104 R0
        BEGIN BRANCH XLXN_1
            WIRE 1200 688 1280 688
            WIRE 1280 688 1312 688
            WIRE 1280 688 1280 944
        END BRANCH
        BEGIN BRANCH A
            WIRE 816 656 880 656
            WIRE 880 656 944 656
            WIRE 880 656 880 1040
            WIRE 880 1040 944 1040
        END BRANCH
        BEGIN BRANCH B
            WIRE 816 720 912 720
            WIRE 912 720 944 720
            WIRE 912 720 912 1104
            WIRE 912 1104 944 1104
        END BRANCH
        BEGIN BRANCH Cin
            WIRE 816 848 1248 848
            WIRE 1248 848 1248 1008
            WIRE 1248 1008 1280 1008
            WIRE 1248 752 1248 848
            WIRE 1248 752 1312 752
        END BRANCH
        IOMARKER 816 656 A R180 28
        IOMARKER 816 720 B R180 28
        IOMARKER 816 848 Cin R180 28
        BEGIN BRANCH XLXN_5
            WIRE 1200 1072 1504 1072
            WIRE 1504 1040 1552 1040
            WIRE 1504 1040 1504 1072
        END BRANCH
        BEGIN BRANCH XLXN_6
            WIRE 1536 976 1552 976
        END BRANCH
        BEGIN BRANCH F
            WIRE 1568 720 1584 720
            WIRE 1584 720 1840 720
        END BRANCH
        BEGIN BRANCH Cout
            WIRE 1808 1008 1840 1008
        END BRANCH
        IOMARKER 1840 1008 Cout R0 28
        IOMARKER 1840 720 F R0 28
    END SHEET
END SCHEMATIC
