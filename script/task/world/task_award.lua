
-- ====================== ÎÄ¼þÐÅÏ¢ ======================
-- Edited by lizhi
-- 2005-8-15 14:21
-- ======================================================
Include("\\script\\lib\\globalfunctions.lua")
Trinket_Attribute = {
    11,12,13,14,41,42,79,80
};
--£¨·Ï³ý£©±£Áô×ö²Î¿¼ÓÃ
Exp_Award_List = {
    
    Level_10 = {
        easy = 100,
        normal = 100,
        hard = 100,
        hell = 100,
        xn_step_1 = 150,
        xn_step_2 = 350
    },
    
    Level_12 = {
        easy = 147,
        normal = 176,
        hard = 220,
        hell = 352
    },
    
    Level_14 = {
        easy = 257,
        normal = 309,
        hard = 386,
        hell = 617
    },
    
    Level_16 = {
        easy = 394,
        normal = 472,
        hard = 591,
        hell = 945
    },

    Level_18 = {
        easy = 555,
        normal = 666,
        hard = 833,
        hell = 1332
    },
    
    Level_20 = {
        easy = 725,
        normal = 870,
        hard = 1087,
        hell = 1739,
        xn_step_1 = 500,
        xn_step_2 = 2000
    },
    
    Level_21 = {
        easy = 815,
        normal = 978,
        hard = 1223,
        hell = 1956
    },
    
    Level_22 = {
        easy = 917,
        normal = 1101,
        hard = 1376,
        hell = 2201
    },
    
    Level_24 = {
        easy = 1161,
        normal = 1393,
        hard = 1741,
        hell = 2786
    },
    
    Level_25 = {
        easy = 1306,
        normal = 1567,
        hard = 1959,
        hell = 3134
    },
    
    Level_26 = {
        easy = 1469,
        normal = 1763,
        hard = 2204,
        hell = 3526
    },
    
    Level_28 = {
        easy = 1859,
        normal = 2231,
        hard = 2789,
        hell = 4462
    },
    
    Level_30 = {
        easy = 2353,
        normal = 2824,
        hard = 3530,
        hell = 5647,
        xn_step_1 = 1200,
        xn_step_2 = 1500,
        xn_step_3 = 3300
    },
    
    Level_31 = {
        easy = 1271,
        normal = 1588,
        hard = 2647,
        hell = 3177
    },
    
    Level_32 = {
        easy = 1429,
        normal = 1787,
        hard = 2978,
        hell = 3574
    },
    
    Level_34 = {
        easy = 1809,
        normal = 2261,
        hard = 3769,
        hell = 4523
    },
    
    Level_35 = {
        xn_step_1 = 6000
    },
    
    Level_36 = {
        easy = 2290,
        normal = 2862,
        hard = 4770,
        hell = 5724
    },

    Level_38 = {
        easy = 2898,
        normal = 3622,
        hard = 6074,
        hell = 7245
    },
        
    Level_40 = {
        easy = 3668,
        normal = 4585,
        hard = 7641,
        hell = 9169,
        xn_step_1 = 500,
        xn_step_2 = 500,
        xn_step_3 = 3000,
        xn_step_4 = 6000
    },

    Level_45 = {
        easy = 6609,
        normal = 8262,
        hard = 13770,
        hell = 16524,
        xn_step_1 = 3750,
        xn_step_2 = 8750
    },

    Level_50 = {
        easy = 11910,
        normal = 14888,
        hard = 24813,
        hell = 29776,
        xn_step_1 = 10000,
        xn_step_2 = 750,
        xn_step_3 = 12500,
        xn_step_4 = 6750
    },
    
    Level_55 = {
        xn_step_1 = 5000,
        xn_step_2 = 30000
    },
    
    Level_58 = {
        xn_step_1 = 2500,
        xn_step_2 = 7500
    },
    
    Level_60 = {
        xn_step_1 = 15000,
        xn_step_2 = 35000
    },
    
    Level_61 = {
        xn_step_1 = 150000
    },
    
   	Level_62 = {
        xn_step_1 = 7500,
        xn_step_2 = 7500,
        xn_step_3 = 10000
    },
    
   	Level_63 = {
        xn_step_1 = 10000,
        xn_step_2 = 25000
    },
    
    Level_65 = {
				xn_step_1 = 75000
    },
    
    Level_70 = {
				xn_step_1 = 325000
    },
    
    Level_75 = {
        xn_step_1 = 40000,
        xn_step_2 = 160000
    },
    
   	Level_76 = {
        xn_step_1 = 250000,
        xn_step_2 = 250000
    },
    
		Level_80 = {
        xn_step_1 = 1000000
    },
    
   	Level_81 = {
        xn_step_1 = 200000,
        xn_step_2 = 300000,
        xn_step_3 = 1500000
    },
    
    --------------------------------Î÷±±ÈÎÎñ¾­Ñé½±Àø-------------------------------
    
    Award_XB_01 = {
    	Easy = 25000,
    },
    
    Award_XB_02 = {
    	Easy = 50000,
    },
    
    Award_XB_03 = {
    	Easy = 62500,
    },
    
    Award_XB_04 = {
    	Easy = 75000,
    },
    
    Award_XB_05 = {
    	Easy = 25000,
    },
    
    Award_XB_06 = {
    	Easy = 500000,
    },
    
    Award_XB_07 = {
    	Easy = 62500,
    },
    
    Award_XB_08 = {
    	Easy = 25000,
    },
    
    Award_XB_09 = {
    	Easy = 25000,
    },
    
    Award_XB_10 = {
    	Easy = 25000,
    },
    
    Award_XB_11 = {
    	Easy = 750000,
    },
    
    Award_XB_12 = {
    	Easy = 100000,
    },
    
    Award_XB_13 = {
    	Easy = 100000,
    },
    
    Award_XB_14 = {
    	Easy = 25000,
    },
    
    Award_XB_15 = {
    	Easy = 750000,
    },
    
    Award_XB_16 = {
    	Easy = 25000,
    },
    
    Award_XB_17 = {
    	Easy = 50000,
    },
    
    Award_XB_18 = {
    	Easy = 25000,
    },
    
    Award_XB_19 = {
    	Easy = 87500,
    },
    
    Award_XB_20 = {
    	Easy = 100000,
    },
    
    Award_XB_21 = {
    	Easy = 125000,
    },
    
    Award_XB_22 = {
    	Easy = 25000,
    },
    
    Award_XB_23 = {
    	Easy = 25000,
    },
    
    Award_XB_24 = {
    	Easy = 125000,
    },
    
    Award_XB_25 = {
    	Easy = 125000,
    },
    
    Award_XB_26 = {
    	Easy = 750000,
    },
    
    Award_XB_27 = {
    	Easy = 25000,
    },
    
    Award_XB_28 = {
    	Easy = 250000,
    },
    
    Award_XB_29 = {
    	Easy = 1000000,
    },
    
    Award_XB_30 = {
    	Easy = 150000,
    },
    
    Award_XB_31 = {
    	Easy = 500000,
    },
    
    Award_XB_32 = {
    	Easy = 500000,
    },
    
    Award_XB_33 = {
    	Easy = 500000,
    },
    
    Award_XB_34 = {
    	Easy = 1250000,
    },
    
    Award_XB_35 = {
    	Easy = 25000,
    },
    
    Award_XB_36 = {
    	Easy = 250000,
    },
    
    Award_XB_37 = {
    	Easy = 300000,
    },
    
    Award_XB_38 = {
    	Easy = 125000,
    },
    
    Award_XB_39 = {
    	Easy = 125000,
    },
    
    Award_XB_40 = {
    	Easy = 75000,
    },
    
    Award_XB_41 = {
    	Easy = 250000,
    },
    
    Award_XB_42 = {
    	Easy = 25000,
    },
    
    Award_XB_43 = {
    	Easy = 250000,
    },
    
    Award_XB_44 = {
    	Easy = 1250000,
    },
    
    Award_XB_45 = {
    	Easy = 25000,
    },
    
    Award_XB_46 = {
    	Easy = 25000,
    },
    
    Award_XB_47 = {
    	Easy = 1000000,
    },
    
    Award_XB_48 = {
    	Easy = 375000,
    },
    
    Award_XB_49 = {
    	Easy = 1250000,
    },
    
    Award_XB_50 = {
    	Easy = 25000,
    },
    
    Award_XB_51 = {
    	Easy = 1250000,
    },
    
    Award_XB_52 = {
    	Easy = 1250000,
    },
    
    Award_XB_53 = {
    	Easy = 1250000,
    },
    
    Award_XB_54 = {
    	Easy = 2500000,
    },
    
    Award_XB_55 = {
    	Easy = 5000000,
    },
    
    Award_XB_56 = {
    	Easy = 25000,
    },
    
    Award_XB_57 = {
    	Easy = 750000,
    },
    
    Award_XB_58 = {
    	Easy = 25000,
    },
    
    Award_XB_59 = {
    	Easy = 750000,
    },
    
    Award_XB_60 = {
    	Easy = 25000,
    },
    
    Award_XB_61 = {
    	Easy = 750000,
    },
    
    Award_XB_62 = {
    	Easy = 250000,
    },
    
    Award_XB_63 = {
    	Easy = 1000000,
    },
    
    Award_XB_64 = {
    	Easy = 1250000,
    },
   
};

Money_Award_List = {
    
    Level_10 = {
        easy = 100,
        normal = 100,
        hard = 100,
        hell = 100,
        xn_step_1 = 100,
        xn_step_2 = 100
    },
    
    Level_12 = {
        easy = 73,
        normal = 88,
        hard = 110,
        hell = 176
    },
    
    Level_14 = {
        easy = 129,
        normal = 154,
        hard = 193,
        hell = 309
    },
    
    Level_16 = {
        easy = 197,
        normal = 236,
        hard = 295,
        hell = 472
    },
    
    Level_18 = {
        easy = 278,
        normal = 333,
        hard = 416,
        hell = 666
    },
    
    Level_20 = {
        easy = 362,
        normal = 435,
        hard = 543,
        hell = 870,
        xn_step_1 = 400, 
        xn_step_2 = 500
    },
    
    Level_21 = {
        easy = 408,
        normal = 489,
        hard = 611,
        hell = 978
    },
    
    Level_22 = {
        easy = 459,
        normal = 550,
        hard = 688,
        hell = 1101
    },
    
    Level_24 = {
        easy = 580,
        normal = 696,
        hard = 871,
        hell = 1393
    },
    
    Level_25 = {
        easy = 653,
        normal = 783,
        hard = 979,
        hell = 1567
    },
    
    Level_26 = {
        easy = 735,
        normal = 881,
        hard = 1102,
        hell = 1763
    },
    
    Level_28 = {
        easy = 930,
        normal = 1116,
        hard = 1394,
        hell = 2231
    },
    
    Level_30 = {
        easy = 1177,
        normal = 1412,
        hard = 1765,
        hell = 2824,
        xn_step_1 = 1521,
        xn_step_2 = 2000,
        xn_step_3 = 2134
    },
    
    Level_31 = {
        easy = 635,
        normal = 794,
        hard = 1324,
        hell = 1588
    },

    Level_32 = {
        easy = 715,
        normal = 893,
        hard = 1489,
        hell = 1787
    },
    
    Level_34 = {
        easy = 905,
        normal = 1131,
        hard = 1885,
        hell = 2261
    },
    
    Level_35 = {
        xn_step_1 = 2000
    },
    
    Level_36 = {
        easy = 1145,
        normal = 1431,
        hard = 2385,
        hell = 2862
    },
    
    Level_38 = {
        easy = 1449,
        normal = 1811,
        hard = 3019,
        hell = 3622
    },
    
    Level_40 = {
        easy = 1834,
        normal = 2292,
        hard = 3821,
        hell = 4585,
        xn_step_1 = 1834,
        xn_step_2 = 1952,
        xn_step_3 = 2046,
        xn_step_4 = 3152
    },
    
    Level_45 = {
        easy = 3305,
        normal = 4131,
        hard = 3885,
        hell = 8262,
        xn_step_1 = 3500,
        xn_step_2 = 4500
    },
    
    Level_50 = {
        easy = 5955,
        normal = 7444,
        hard = 12407,
        hell = 14888,
        xn_step_1 = 5124,
        xn_step_2 = 3210,
        xn_step_3 = 10964,
        xn_step_4 = 16234
    },
    
    Level_55 = {
        xn_step_1 = 6534,
        xn_step_2 = 11532
    },
    
    Level_58 = {
        xn_step_1 = 6531,
        xn_step_2 = 11030
    },    

    Level_60 = {
        xn_step_1 = 6372,
        xn_step_2 = 15315
    },
    
    Level_61 = {
        xn_step_1 = 12311
    },
    
    Level_62 = {
        xn_step_1 = 5673,
        xn_step_2 = 5500,
        xn_step_3 = 9432
    },
    
  	Level_63 = {
        xn_step_1 = 5964,
        xn_step_2 = 8347
    },

    Level_65 = {
				xn_step_1 = 13216
    },
    
    Level_70 = {
				xn_step_1 = 14312
    },
    
    Level_75 = {
        xn_step_1 = 8000,
        xn_step_2 = 20000
    },
    
   	Level_76 = {
        xn_step_1 = 8634,
        xn_step_2 = 18324
    },
    
    Level_80 = {
        xn_step_1 = 23411,
    },
    
    Level_81 = {
        xn_step_1 = 13400,
        xn_step_2 = 16543,
        xn_step_3 = 26784
    },
    
    --------------------------------Î÷±±ÈÎÎñJXB½±Àø-------------------------------
    
    Award_XB_01 = {
    	Easy = 0,
    },
    
    Award_XB_02 = {
    	Easy = 0,
    },
    
    Award_XB_03 = {
    	Easy = 0,
    },
    
    Award_XB_04 = {
    	Easy = 0,
    },
    
    Award_XB_05 = {
    	Easy = 0,
    },
    
    Award_XB_06 = {
    	Easy = 25000,
    },
    
    Award_XB_07 = {
    	Easy = 0,
    },
    
    Award_XB_08 = {
    	Easy = 0,
    },
    
    Award_XB_09 = {
    	Easy = 0,
    },
    
    Award_XB_10 = {
    	Easy = 0,
    },
    
    Award_XB_11 = {
    	Easy = 37500,
    },
    
    Award_XB_12 = {
    	Easy = 0,
    },
    
    Award_XB_13 = {
    	Easy = 0,
    },
    
    Award_XB_14 = {
    	Easy = 0,
    },
    
    Award_XB_15 = {
    	Easy = 37500,
    },
    
    Award_XB_16 = {
    	Easy = 0,
    },
    
    Award_XB_17 = {
    	Easy = 0,
    },
    
    Award_XB_18 = {
    	Easy = 0,
    },
    
    Award_XB_19 = {
    	Easy = 0,
    },
    
    Award_XB_20 = {
    	Easy = 0,
    },
    
    Award_XB_21 = {
    	Easy = 0,
    },
    
    Award_XB_22 = {
    	Easy = 0,
    },
    
    Award_XB_23 = {
    	Easy = 0,
    },
    
    Award_XB_24 = {
    	Easy = 0,
    },
    
    Award_XB_25 = {
    	Easy = 0,
    },
    
    Award_XB_26 = {
    	Easy = 37500,
    },
    
    Award_XB_27 = {
    	Easy = 0,
    },
    
    Award_XB_28 = {
    	Easy = 0,
    },
    
    Award_XB_29 = {
    	Easy = 50000,
    },
    
    Award_XB_30 = {
    	Easy = 0,
    },
    
    Award_XB_31 = {
    	Easy = 0,
    },
    
    Award_XB_32 = {
    	Easy = 0,
    },
    
    Award_XB_33 = {
    	Easy = 0,
    },
    
    Award_XB_34 = {
    	Easy = 62500,
    },
    
    Award_XB_35 = {
    	Easy = 0,
    },
    
    Award_XB_36 = {
    	Easy = 0,
    },
    
    Award_XB_37 = {
    	Easy = 0,
    },
    
    Award_XB_38 = {
    	Easy = 0,
    },
    
    Award_XB_39 = {
    	Easy = 0,
    },
    
    Award_XB_40 = {
    	Easy = 0,
    },
    
    Award_XB_41 = {
    	Easy = 0,
    },
    
    Award_XB_42 = {
    	Easy = 0,
    },
    
    Award_XB_43 = {
    	Easy = 0,
    },
    
    Award_XB_44 = {
    	Easy = 62500,
    },
    
    Award_XB_45 = {
    	Easy = 0,
    },
    
    Award_XB_46 = {
    	Easy = 0,
    },
    
    Award_XB_47 = {
    	Easy = 50000,
    },
    
    Award_XB_48 = {
    	Easy = 0,
    },
    
    Award_XB_49 = {
    	Easy = 62500,
    },
    
    Award_XB_50 = {
    	Easy = 0,
    },
    
    Award_XB_51 = {
    	Easy = 62500,
    },
    
    Award_XB_52 = {
    	Easy = 62500,
    },
    
    Award_XB_53 = {
    	Easy = 0,
    },
    
    Award_XB_54 = {
    	Easy = 0,
    },
    
    Award_XB_55 = {
    	Easy = 125000,
    },
    
    Award_XB_56 = {
    	Easy = 0,
    },
    
    Award_XB_57 = {
    	Easy = 37500,
    },
    
    Award_XB_58 = {
    	Easy = 0,
    },
    
    Award_XB_59 = {
    	Easy = 37500,
    },
    
    Award_XB_60 = {
    	Easy = 0,
    },
    
    Award_XB_61 = {
    	Easy = 37500,
    },
    
    Award_XB_62 = {
    	Easy = 0,
    },
    
    Award_XB_63 = {
    	Easy = 50000,
    },
    
    Award_XB_64 = {
    	Easy = 62500,
    },
        
};

Reputation_Award_List = {

    Level_10 = {
        easy = 0,
        normal = 2,
        hard = 4,
        hell = 6,
        xn_step_1 = 0,
        xn_step_2 = 2
    },
    
    Level_12 = {
        easy = 1,
        normal = 3,
        hard = 5,
        hell = 7
    },
    
    Level_14 = {
        easy = 1,
        normal = 3,
        hard = 5,
        hell = 7
    },
    
    Level_16 = {
        easy = 1,
        normal = 3,
        hard = 5,
        hell = 7
    },
    
    Level_18 = {
        easy = 1,
        normal = 3,
        hard = 5,
        hell = 7
    },
    
    Level_20 = {
        easy = 1,
        normal = 3,
        hard = 5,
        hell = 7,
        xn_step_1 = 2,
        xn_step_2 = 3
    },
    
    Level_21 = {
        easy = 1,
        normal = 3,
        hard = 5,
        hell = 7
    },
    
    Level_22 = {
        easy = 1,
        normal = 3,
        hard = 5,
        hell = 7
    },

    Level_24 = {
        easy = 1,
        normal = 3,
        hard = 5,
        hell = 7
    },
    
    Level_25 = {
        easy = 1,
        normal = 3,
        hard = 5,
        hell = 7
    },

    Level_26 = {
        easy = 1,
        normal = 3,
        hard = 5,
        hell = 7
    },
    
    Level_28 = {
        easy = 1,
        normal = 3,
        hard = 5,
        hell = 7
    },
    
    Level_30 = {
        easy = 1,
        normal = 3,
        hard = 5,
        hell = 7,
        xn_step_1 = 3,
        xn_step_2 = 4,
        xn_step_3 = 2
    },

    Level_31 = {
        easy = 1,
        normal = 3,
        hard = 5,
        hell = 7
    },
    
    Level_32 = {
        easy = 1,
        normal = 3,
        hard = 5,
        hell = 7
    },
    
    Level_34 = {
        easy = 1,
        normal = 3,
        hard = 5,
        hell = 7
    },
    
    Level_35 = {
        xn_step_1 = 2,
    },
    
    Level_36 = {
        easy = 2,
        normal = 4,
        hard = 6,
        hell = 8
    },
    
    Level_38 = {
        easy = 2,
        normal = 4,
        hard = 6,
        hell = 8
    },
    
    Level_40 = {
        easy = 2,
        normal = 4,
        hard = 6,
        hell = 8,
        xn_step_1 = 2,
        xn_step_2 = 3,
        xn_step_3 = 4,
        xn_step_4 = 2
    },
    
    Level_45 = {
        easy = 2,
        normal = 4,
        hard = 6,
        hell = 8,
       	xn_step_1 = 3,
        xn_step_2 = 5
    },

    Level_50 = {
        easy = 3,
        normal = 5,
        hard = 7,
        hell = 9,
        xn_step_1 = 4,
        xn_step_2 = 2,
        xn_step_3 = 3,
        xn_step_4 = 5
    },
    
    Level_55 = {
        xn_step_1 = 2,
        xn_step_2 = 6
    },
    
    Level_58 = {
        xn_step_1 = 3,
        xn_step_2 = 5
    },
    
    Level_60 = {
        xn_step_1 = 4,
        xn_step_2 = 6
    },
    
    Level_61 = {
        xn_step_1 = 5,
    },
    
    Level_62 = {
        xn_step_1 = 2,
        xn_step_2 = 2,
        xn_step_3 = 5
    },
    
    Level_63 = {
        xn_step_1 = 3,
        xn_step_2 = 5,
    },
    
    Level_65 = {
				xn_step_1 = 7,
    },
    
    Level_70 = {
				xn_step_1 = 7
    },
    
    Level_75 = {
        xn_step_1 = 3,
        xn_step_2 = 8
    },
    
   	Level_76 = {
        xn_step_1 = 5,
        xn_step_2 = 7
    },
    
    Level_80 = {
        xn_step_1 = 10,
    },
    
    Level_81 = {
        xn_step_1 = 5,
        xn_step_2 = 8,
        xn_step_3 = 11
    },
    
    --------------------------------Î÷±±ÈÎÎñÉùÍû½±Àø-------------------------------
    
    Award_XB_01 = {
    	Easy = 2.5,
    },
    
    Award_XB_02 = {
    	Easy = 5,
    },
    
    Award_XB_03 = {
    	Easy = 6,
    },
    
    Award_XB_04 = {
    	Easy = 7.5,
    },
    
    Award_XB_05 = {
    	Easy = 2.5,
    },
    
    Award_XB_06 = {
    	Easy = 25,
    },
    
    Award_XB_07 = {
    	Easy = 6,
    },
    
    Award_XB_08 = {
    	Easy = 2.5,
    },
    
    Award_XB_09 = {
    	Easy = 2.5,
    },
    
    Award_XB_10 = {
    	Easy = 2.5,
    },
    
    Award_XB_11 = {
    	Easy = 25,
    },
    
    Award_XB_12 = {
    	Easy = 10,
    },
    
    Award_XB_13 = {
    	Easy = 10,
    },
    
    Award_XB_14 = {
    	Easy = 2.5,
    },
    
    Award_XB_15 = {
    	Easy = 25,
    },
    
    Award_XB_16 = {
    	Easy = 2.5,
    },
    
    Award_XB_17 = {
    	Easy = 2.5,
    },
    
    Award_XB_18 = {
    	Easy = 2.5,
    },
    
    Award_XB_19 = {
    	Easy = 9,
    },
    
    Award_XB_20 = {
    	Easy = 10,
    },
    
    Award_XB_21 = {
    	Easy = 12.5,
    },
    
    Award_XB_22 = {
    	Easy = 2.5,
    },
    
    Award_XB_23 = {
    	Easy = 2.5,
    },
    
    Award_XB_24 = {
    	Easy = 12.5,
    },
    
    Award_XB_25 = {
    	Easy = 12.5,
    },
    
    Award_XB_26 = {
    	Easy = 25,
    },
    
    Award_XB_27 = {
    	Easy = 2.5,
    },
    
    Award_XB_28 = {
    	Easy = 12.5,
    },
    
    Award_XB_29 = {
    	Easy = 25,
    },
    
    Award_XB_30 = {
    	Easy = 12.5,
    },
    
    Award_XB_31 = {
    	Easy = 25,
    },
    
    Award_XB_32 = {
    	Easy = 25,
    },
    
    Award_XB_33 = {
    	Easy = 25,
    },
    
    Award_XB_34 = {
    	Easy = 25,
    },
    
    Award_XB_35 = {
    	Easy = 2.5,
    },
    
    Award_XB_36 = {
    	Easy = 12.5,
    },
    
    Award_XB_37 = {
    	Easy = 12.5,
    },
    
    Award_XB_38 = {
    	Easy = 12.5,
    },
    
    Award_XB_39 = {
    	Easy = 12.5,
    },
    
    Award_XB_40 = {
    	Easy = 7.5,
    },
    
    Award_XB_41 = {
    	Easy = 12.5,
    },
    
    Award_XB_42 = {
    	Easy = 2.5,
    },
    
    Award_XB_43 = {
    	Easy = 12.5,
    },
    
    Award_XB_44 = {
    	Easy = 25,
    },
    
    Award_XB_45 = {
    	Easy = 2.5,
    },
    
    Award_XB_46 = {
    	Easy = 2.5,
    },
    
    Award_XB_47 = {
    	Easy = 25,
    },
    
    Award_XB_48 = {
    	Easy = 12.5,
    },
    
    Award_XB_49 = {
    	Easy = 25,
    },
    
    Award_XB_50 = {
    	Easy = 2.5,
    },
    
    Award_XB_51 = {
    	Easy = 25,
    },
    
    Award_XB_52 = {
    	Easy = 25,
    },
    
    Award_XB_53 = {
    	Easy = 0,
    },
    
    Award_XB_54 = {
    	Easy = 0,
    },
    
    Award_XB_55 = {
    	Easy = 25,
    },
    
    Award_XB_56 = {
    	Easy = 2.5,
    },
    
    Award_XB_57 = {
    	Easy = 25,
    },
    
    Award_XB_58 = {
    	Easy = 2.5,
    },
    
    Award_XB_59 = {
    	Easy = 25,
    },
    
    Award_XB_60 = {
    	Easy = 2.5,
    },
    
    Award_XB_61 = {
    	Easy = 25,
    },
    
    Award_XB_62 = {
    	Easy = 12.5,
    },
    
    Award_XB_63 = {
    	Easy = 25,
    },
    
    Award_XB_64 = {
    	Easy = 25,
    },
        
};

--chest ¶ÔÓ¦ ÒÂ·þ
--legs ¶ÔÓ¦ ¿ã×Ó
--head ¶ÔÓ¦ Ã±×Ó
--trinket ¶ÔÓ¦ ÊÎÆ·
--ÀïÃæÌîÐ´µÄÄÚÈÝÊÇbaseµÄÊý×Ö£¬Îª±ê×¼ÄÐ£¬ÆäËûµÄÌåÐÎÇ°Á½Î»Êý×ÖÏàÍ¬
--×îºóÒ»Î»+18
--±ÈÈç±ê×¼ÄÐÊÇ 0 100 3£¬¿ýÎàÄÐ¾ÍÊÇ0 100 21£¬ÐÔ¸ÐÅ®Îª 0 100 39£¬½¿Ð¡Å®Îª 0 100 57
--ÊÎÆ·³ýÍâ
Equipment_Award_List = {
    
    Level_10 = {
        chest = {0, 100, 3},
        trinket = {
            {0, 102, 6},
            {0, 102, 16}
        }
    },
    
    Level_11 = {
        chest = {0, 100, 4}
    },
    
    Level_13 = {
        head = {0, 103, 3}
    },
    
    Level_14 = {
        head = {0, 103, 4}
    },
    
    Level_15 = {
        legs = {0, 101, 3},
        trinket = {
            {0, 102, 12},
            {0, 102, 2}
        }
    },
    
    Level_16 = {
        legs = {0, 101, 4}
    },
    
    Level_18 = {
        chest = {0, 100, 5}
    },
    
    Level_19 = {
        chest = {0, 100, 6}
    },
    
    Level_20 = {
        trinket = {
            {0, 102, 7},
            {0, 102, 17}
        }
    },
    
    Level_21 = {
        head = {0, 103, 5}
    },
    
    Level_23 = {
        legs = {0, 101, 5}
    },
    
    Level_25 = {
        trinket = {
            {0, 102, 13},
            {0, 102, 3}
        }
    },
    
    Level_27 = {
        chest = {0, 100, 7}
    },
    
    Level_28 = {
        chest = {0, 100, 8}
    },
    
    Level_30 = {
        trinket = {
            {0,102,8},
            {0,102,18}
        },
        head = {0, 103, 7}
    },
    
    Level_31 = {
        head = {0, 103, 8}
    },
    
    Level_32 = {
        legs = {0,101,7}
    },
    
    Level_33 = {
        legs = {0,101,8}
    },
    
    Level_35 = {
        trinket = {
            {0,102,14},
            {0,102,4}
        },
        chest = {0,100,9}
    },
    
    Level_36 = {
        chest = {0,100,10}
    },

    Level_38 = {
        head = {0,103,9}
    },
    
    Level_39 = {
        head = {0,103,10}
    },
    
    Level_40 = {
        trinket = {
            {0,102,9},
            {0,102,19}
        },
        legs = {0,101,9}
    },
    
    Level_41 = {
        legs = {0,101,10}
    },
    
    Level_44 = {
        chest = {0,100,11},
    },
    
    Level_45 = {
        chest = {0,100,12}
    },
    
    Level_47 = {
        head = {0,103,11}
    },
    
    Level_49 = {
        legs = {0,101,11}
    },
    
    Level_52 = {
        chest = {0,100,13}
    },
    
    Level_55 = {
        head = {0,103,13}
    },
    
    Level_57 = {
        legs = {0,101,16}
    },

    Level_61 = {
        chest = {0,100,15}
    },
    
    Level_64 = {
        head = {0,103,15}
    },
    
    Level_65 = {
        head = {0,103,16}
    },    
    
    Level_66 = {
        legs = {0,101,15}
    }, 
    
    Level_70 = {
    		chest = {0,100,17},
        legs = {0,101,17}
    },
    
    Level_71 = {
    		chest = {0,100,18}
    },
    
    Level_72 = {
        head = {0,103,17}
    },
    
    Level_73 = {
        head = {0,103,18}
    },
    
    Level_74 = {
        legs = {0,101,17}
    },
    
    Level_75 = {
        legs = {0,101,18}
    }
};

--Ë³ÐòÎª»¤ÊÖ,½£,¹÷,°µÆ÷,µ¶,ÇÙ,±Ê,ÕÈ,Ç¹,¹­,×¦,Ë«µ¶
Weapon_Award_List = {
    Level_10 = {
        {0, 0, 3},
        {0, 2, 16},
        {0, 5, 29},
        {0, 1, 42},
        {0, 3, 53},
        {0, 10, 64},
        {0, 9, 75},
        {0, 8, 86},
        {0, 6, 97},
        {0, 4, 108},
        {0, 11,	1},
        {0, 7, 1}
    },
    
    Level_16 = {
        {0, 0, 4},
        {0, 2, 17},
        {0, 5, 30},
        {0, 1, 43},
        {0, 3, 54},
        {0, 10, 65},
        {0, 9, 76},
        {0, 8, 87},
        {0, 6, 98},
        {0, 4, 109},
        {0, 11,	2},
        {0, 7, 2}
    },
    
    Level_22 = {
        {0, 0, 5},
        {0, 2, 18},
        {0, 5, 31},
        {0, 1, 44},
        {0, 3, 55},
        {0, 10, 66},
        {0, 9, 77},
        {0, 8, 88},
        {0, 6, 99},
        {0, 4, 110},
        {0, 11,	3},
        {0, 7, 3}
    },
    
    Level_28 = {
        {0, 0, 6},
        {0, 2, 19},
        {0, 5, 32},
        {0, 1, 45},
        {0, 3, 56},
        {0, 10, 67},
        {0, 9, 78},
        {0, 8, 89},
        {0, 6, 100},
        {0, 4, 111},
        {0, 11,	4},
        {0, 7, 4}
    },
    
    Level_34 = {
        {0, 0, 7},
        {0, 2, 20},
        {0, 5, 33},
        {0, 1, 46},
        {0, 3, 57},
        {0, 10, 68},
        {0, 9, 79},
        {0, 8, 90},
        {0, 6, 101},
        {0, 4, 112},
        {0, 11,	5},
        {0, 7, 5}
    },
    
    Level_40 = {
        {0, 0, 8},
        {0, 2, 21},
        {0, 5, 34},
        {0, 1, 47},
        {0, 3, 58},
        {0, 10, 69},
        {0, 9, 80},
        {0, 8, 91},
        {0, 6, 102},
        {0, 4, 113},
        {0, 11,	6},
        {0, 7, 6}
    },
    
    Level_46 = {
        {0,0,9},
        {0,2,22},
        {0,5,35},
        {0,1,48},
        {0,3,59},
        {0,10,70},
        {0,9,81},
        {0,8,92},
        {0,6,103},
        {0,4,114},
        {0, 11,	7},
        {0, 7, 7}
    },
    
    Level_52 = {
        {0,0,10},
        {0,2,23},
        {0,5,36},
        {0,1,49},
        {0,3,60},
        {0,10,71},
        {0,9,82},
        {0,8,93},
        {0,6,104},
        {0,4,115},
        {0, 11,	8},
        {0, 7, 8}
    },
    
    Level_64 = {
        {0,0,12}, 	
        {0,2,25}, 	
        {0,5,38}, 	
        {0,1,51}, 	
        {0,3,62}, 	
        {0,10,73}, 	
        {0,9,84}, 	
        {0,8,95}, 	
        {0,6,106}, 	
        {0,4,117},
        {0, 11,	10},
        {0, 7, 10} 	
    },
    
    Level_70 = {
        {0,0,13}, 	
        {0,2,26}, 	
        {0,5,39}, 	
        {0,1,52}, 	
        {0,3,63}, 	
        {0,10,74}, 	
        {0,9,85}, 	
        {0,8,96}, 	
        {0,6,107}, 	
        {0,4,118},
        {0, 11,	11},
        {0, 7, 11}
    },
    
  	Level_76 = {
        {0,0,14}, 	
        {0,2,36}, 	
        {0,5,40}, 	
        {0,1,53}, 	
        {0,3,64}, 	
        {0,10,75}, 	
        {0,9,86}, 	
        {0,8,97}, 	
        {0,6,108}, 	
        {0,4,119},        
        {0, 11,	12},
        {0, 7, 12} 	
    }
    
};

--ÎäÆ÷ÊôÐÔ
Weapon_Attribute = {
    Level_52 = {3,14,5,65,5,67},
    Level_70 = {2,85,2,86,-1,-1},
    Level_76 = {1,85,1,86,3,23},
    }
    
--ÎäÆ÷µÈ¼¶¶ÔÓ¦±í
Weapon_Level = {
	[10] = {"Level_10"},
	[16] = {"Level_16"},
	[22] = {"Level_22"},
	[28] = {"Level_28"},
	[34] = {"Level_34"},
	[40] = {"Level_40"},
	[46] = {"Level_46"},
	[52] = {"Level_52"},
	[58] = {"Level_58"},
	[64] = {"Level_64"},
	[70] = {"Level_70"},
	[76] = {"Level_76"},
	[82] = {"Level_82"},
	[88] = {"Level_88"},	
	Level_10 = {10},
	Level_16 = {16},
	Level_22 = {22},
	Level_28 = {28},
	Level_34 = {34},
	Level_40 = {40},
	Level_46 = {46},
	Level_52 = {52},
	Level_58 = {58},
	Level_64 = {64},
	Level_70 = {70},
	Level_76 = {76},
	Level_82 = {82},
	Level_88 = {88},
	}

--×°±¸ÊôÐÔ
Equipment_Attribute = {
		Level_55 = {
    		head = {4,14,2,80,-1,-1},
    },
    Level_64 = {
        head = {4,94,4,97,4,98}
    },
    Level_66 = {
        legs = {3,94,3,97,3,98}
    }, 
    Level_70 = {
    		chest = {2,18,2,19,-1,-1},
        legs = {0,101,17}
    },
    Level_71 = {
    	chest = {3,18,3,19,3,89},
    },
    Level_72 = {
        head = {4,11,2,28,-1,-1}
    },
    Level_74 = {
        legs = {2,13,4,28,-1,-1}
    },
    Level_73 = {
        head = {2,24,2,80,-1,-1}
    },
    Level_75 = {
        legs = {4,41,4,42,2,102}
    },
}

--ÆäËûÎïÆ·½±Àø
--yuntie:ÔÉÌú
SpecialItemData = {

	YunTie = {2,2,8,"Thiªn th¹ch"}

}

-- QuestLevelÎªÈÎÎñµÈ¼¶
-- DifficultyÎªÈÎÎñÄÑ¶È
-- ItemTypeÎª¸øÓèµÄÎïÆ·ÀàÐÍ
-- ItemLevelÎª¸øÓèµÄÎïÆ·µÈ¼¶
-- 
function GivePlayerAward(QuestLevel, Difficulty, ItemType, ItemLevel, SpecialType, nNum)
    
    --¸øÓè¾­Ñé
    local nExp = Exp_Award_List[QuestLevel][Difficulty] * 2;
    ModifyExp(nExp);
    Msg2Player("B¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm!");
    
    --¸øÓè½ðÇ®
    local nMoney = Money_Award_List[QuestLevel][Difficulty] * 2;
 --   Earn(nMoney);
    
    --¸øÓèÉùÍû
    if Reputation_Award_List[QuestLevel][Difficulty] > 0 then
        local nReputation = Reputation_Award_List[QuestLevel][Difficulty] * 4;
	    ModifyReputation(nReputation, 0);
	end
	
	--¸øÓèÎïÆ·
	if ItemType == "weapon" then
	    GivePlayerWeapon(ItemLevel);
	elseif ItemType ~= nil then
	    GivePlayerEquipment(ItemType, ItemLevel);
	end;
	
	--¸øÓè³ýÎäÆ÷×°±¸ÍâµÄÆäËûÎïÆ·
	if SpecialType ~= nil then
		GiveSpecialItem(SpecialType, nNum);
	end
end;

function GivePlayerWeapon(ItemLevel,Attribute,nType)
    local nRoute = GetPlayerRoute();
    local i, j, k, l, m, n, o, p, q;
    local ntemp;
    if type(ItemLevel) == "number" then 
    	ItemLevel = Weapon_Level[ItemLevel][1]
    end
    if nRoute == 4 or nRoute == 11 then
        i = Weapon_Award_List[ItemLevel][1][1];
        j = Weapon_Award_List[ItemLevel][1][2];
        k = Weapon_Award_List[ItemLevel][1][3];
    elseif nRoute == 8 or nRoute == 14 then
        i = Weapon_Award_List[ItemLevel][2][1];
        j = Weapon_Award_List[ItemLevel][2][2];
        k = Weapon_Award_List[ItemLevel][2][3];
    elseif nRoute == 12 then
        i = Weapon_Award_List[ItemLevel][3][1];
        j = Weapon_Award_List[ItemLevel][3][2];
        k = Weapon_Award_List[ItemLevel][3][3];
    elseif nRoute == 6 then
        i = Weapon_Award_List[ItemLevel][4][1];
        j = Weapon_Award_List[ItemLevel][4][2];
        k = Weapon_Award_List[ItemLevel][4][3];
    elseif nRoute == 9 then
        i = Weapon_Award_List[ItemLevel][6][1];
        j = Weapon_Award_List[ItemLevel][6][2];
        k = Weapon_Award_List[ItemLevel][6][3];
    elseif nRoute == 15 then
        i = Weapon_Award_List[ItemLevel][7][1];
        j = Weapon_Award_List[ItemLevel][7][2];
        k = Weapon_Award_List[ItemLevel][7][3];
    elseif nRoute == 3 then
        i = Weapon_Award_List[ItemLevel][8][1];
        j = Weapon_Award_List[ItemLevel][8][2];
        k = Weapon_Award_List[ItemLevel][8][3];
		elseif nRoute == 17 then
				i = Weapon_Award_List[ItemLevel][9][1];
        j = Weapon_Award_List[ItemLevel][9][2];
        k = Weapon_Award_List[ItemLevel][9][3];
    elseif nRoute == 18 then
				i = Weapon_Award_List[ItemLevel][10][1];
        j = Weapon_Award_List[ItemLevel][10][2];
        k = Weapon_Award_List[ItemLevel][10][3];
    elseif nRoute == 2 and Attribute == nil and nType == nil then
    	ItemLevel = Weapon_Level[ItemLevel][1];
    	Say("Xin tïy ý chän phÇn th­ëng",
    		2,
    		"C«n/#GivePlayerWeapon("..ItemLevel..",999,3)",
    		"§ao/#GivePlayerWeapon("..ItemLevel..",999,5)")
    	return
    elseif nRoute == 2 and Attribute ~= nil and nType == nil then
    	ItemLevel = Weapon_Level[ItemLevel][1];
    	Say("Xin tïy ý chän phÇn th­ëng",
    		2,
    		"C«n/#GivePlayerWeapon("..ItemLevel..","..Attribute..",3)",
    		"§ao/#GivePlayerWeapon("..ItemLevel..","..Attribute..",5)")
    	return
		elseif nRoute == 2 and nType == 3 then
        i = Weapon_Award_List[ItemLevel][3][1];
        j = Weapon_Award_List[ItemLevel][3][2];
        k = Weapon_Award_List[ItemLevel][3][3];
    elseif nRoute == 2 and nType == 5 then
        i = Weapon_Award_List[ItemLevel][5][1];
        j = Weapon_Award_List[ItemLevel][5][2];
        k = Weapon_Award_List[ItemLevel][5][3];
    elseif nRoute == 20 then
				i = Weapon_Award_List[ItemLevel][12][1];
        j = Weapon_Award_List[ItemLevel][12][2];
        k = Weapon_Award_List[ItemLevel][12][3];        
    elseif nRoute == 21 then
				i = Weapon_Award_List[ItemLevel][11][1];
        j = Weapon_Award_List[ItemLevel][11][2];
        k = Weapon_Award_List[ItemLevel][11][3];
    else
        nTemp = random(1,4);
        i = Weapon_Award_List[ItemLevel][nTemp][1];
        j = Weapon_Award_List[ItemLevel][nTemp][2];
        k = Weapon_Award_List[ItemLevel][nTemp][3];
    end;
    
    --½±Àø´øÊôÐÔÎäÆ÷
    if Attribute ~= nil and Attribute ~= 999 then
    	l = Weapon_Attribute[ItemLevel][1];
    	m = Weapon_Attribute[ItemLevel][2];
    	n = Weapon_Attribute[ItemLevel][3];
    	o = Weapon_Attribute[ItemLevel][4];
    	p = Weapon_Attribute[ItemLevel][5];
    	q = Weapon_Attribute[ItemLevel][6];
    else
    	l = -1;
    	m = -1;
    	n = -1;
    	o = -1;
    	p = -1;
    	q = -1;
    end
    
    AddItem(i,j,k,1,1,l,m,n,o,p,q);
    Msg2Player("B¹n nhËn ®­îc 1 mãn vò khÝ.");
end;  
      
function GivePlayerEquipment(ItemType, ItemLevel, Attribute)
    local nBody = GetBody();
    local i, j, k, l, m, n, o, p, q;
    --ÊÎÆ·µÈ¼¶Óë×°±¸µÈ¼¶¶ÔÓ¦±í
    local Level_Table = {
        ["Level_10"] = 1,
        ["Level_15"] = 2,
        ["Level_20"] = 2,
        ["Level_25"] = 3,
        ["Level_30"] = 3,
        ["Level_35"] = 4,
        ["Level_40"] = 4,
        ["Level_45"] = 5,
        ["Level_50"] = 5
    };
    
    if ItemType == "trinket" then
        if nBody == 1 or nBody == 2 then
            i = Equipment_Award_List[ItemLevel][ItemType][1][1];
            j = Equipment_Award_List[ItemLevel][ItemType][1][2];
            k = Equipment_Award_List[ItemLevel][ItemType][1][3];
        else
            i = Equipment_Award_List[ItemLevel][ItemType][2][1];
            j = Equipment_Award_List[ItemLevel][ItemType][2][2];
            k = Equipment_Award_List[ItemLevel][ItemType][2][3];
        end;
        local nCount = getn(Trinket_Attribute);
        local nIndex = random(1, nCount);
        if Trinket_Attribute[nIndex] == 13 or Trinket_Attribute[nIndex] == 14 then
            AddItem(i,j,k,1,1,2,Trinket_Attribute[nIndex],0,0,0,0);
        else
            AddItem(i,j,k,1,1,Level_Table[ItemLevel],Trinket_Attribute[nIndex],0,0,0,0);
        end;
        
        Msg2Player("B¹n nhËn ®­îc 1 mãn trang bÞ.");
    elseif ItemType ~= nil then
        i = Equipment_Award_List[ItemLevel][ItemType][1];
        j = Equipment_Award_List[ItemLevel][ItemType][2];
        k = Equipment_Award_List[ItemLevel][ItemType][3];
        
        if Attribute~=nil then
        	l = Equipment_Attribute[ItemLevel][ItemType][1];
    			m = Equipment_Attribute[ItemLevel][ItemType][2];
    			n = Equipment_Attribute[ItemLevel][ItemType][3];
    			o = Equipment_Attribute[ItemLevel][ItemType][4];
    			p = Equipment_Attribute[ItemLevel][ItemType][5];
    			q = Equipment_Attribute[ItemLevel][ItemType][6];
    		else
    			l = -1;
    			m = -1;
    			n = -1;
    			o = -1;
    			p = -1;
    			q = -1;
   			end
        	
        if nBody == 1 then
            k = k;
        elseif nBody == 2 then
            k = k + 18;
        elseif nBody == 3 then
            k = k + 36;
        else
            k = k + 54;
        end;
        AddItem(i,j,k,1,1,l,m,n,o,p,q);
        Msg2Player("B¹n nhËn ®­îc 1 mãn trang bÞ.");
    end;
end;

--ÆäËûÎïÆ·½±Àø
function GiveSpecialItem(nType,nNum)

local i = SpecialItemData[nType][1];
local j = SpecialItemData[nType][2];
local k = SpecialItemData[nType][3];

	AddItem(i,j,k,nNum,1);
	Msg2Player("B¹n nhËn ®­îc "..nNum..SpecialItemData[nType][4]);

end

function DistanceBetweenPoints(MapID1, MapX1, MapY1, MapID2, MapX2, MapY2)
	if MapID1 ~= MapID2 then
		return -1
	else
	    local dx = MapX2 - MapX1;
	    local dy = MapY2 - MapY1;
	    local nDist = (dx * dx + dy * dy)^(1/2);
	    return nDist;
    end;
end;
--2011-3-14:´å³¤Ôö¼ÓÖ÷ÏßÈÎÎñ¾­Ñé½±Àøµ÷Õû
--ÅäÖÃÎÄ¼þÐÅÏ¢
Include("\\script\\class\\ktabfile.lua")
SZ_INI_FILE_WAY = "\\settings\\task\\world_task_exp.ini"
g_objGtaskExp = ff_GetIniFileObj(SZ_INI_FILE_WAY)
if g_objGtaskExp:Open() ~= 1 then
	gf_WriteLog("SystemError","load ini file error! file path:"..SZ_INI_FILE_WAY)
end
--ÈÎÎñ¾­Ñé»ñÈ¡¹Ø¼ü×Ö¶¨Òå
SKeyXinShou="xinshou"
SkeyShiJieChongFu="shijie_chongfu"
SkeyBJShuxin="bianjing_kouzhun_shxing"
SkeyBJKouzhun="bianjing_kouzhun_xiangyang"
SkeyCDFanzhongyan="chengdu_fanzhongyan"
SkeyQZWangyewei="quanzhou_wangyewei"
SkeyYZxiahouqin="yangzhou_xiahouqin"
SkeyFDGC="fengduguicheng"
SkeyDali="dali"
SkeyXibei="xibei"
SkeyTianmenzhen="tianmenzhen"
function GivePlayerExp(sMainTask,sDetailTask)
	local nExpNum=g_objGtaskExp:GetNum(sMainTask,sDetailTask)
	if nExpNum==nil or nExpNum == 0 then
		print("World task:get data of exp wrong:"..sMainTask..","..sDetailTask)
	else
		ModifyExp(nExpNum);
		Msg2Player("B¹n nhËn ®­îc "..nExpNum.." ®iÓm kinh nghiÖm!");		
	end
end