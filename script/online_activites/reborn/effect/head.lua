--------[话说代码应该具有建筑学的美感]--------
-----------------------------------------------
--脚本名称:灵魄和灵能附着head脚本             |  
--脚本功能:灵魄和灵能公共变量和函数集合       |
--代码开发人:刘宇斌                           |
--代码开发时间:2009-12-28                     |
--代码主要修改记录:                           |
-----------------------------------------------
DEBUG = 0;
Include("\\script\\online_activites\\reborn\\effect\\strings.lua");
Include("\\script\\lib\\globalfunctions.lua");

VIE_201005_REBORN_TASKTEMP_WeaponIndexSaved = 153;                     --保存当前手中武器的索引

---------------------------------------------------------------------------------
--资质判断条件                                                                  |
--[1] 铁骨  武器强化度            [ 8 =< n <= 10  ]                             |
--[2] 落霞  等级                  [     n >= 95   ]                             |
--[3] 百战  pk值                  [      10       ]                             |
--[4] 灼日  武器强化度            [ 11 =< n <= 12 ]                             |
--[5] 俊逸  声望或师门贡献度      [    n >= 15000 ]                             |
--[6] 桃李  武器强化度            [    n = 13     ]                             |
--[7] 名宿  先锋                                                                |
--[8] 凌霄  将军                                                                |
--[9] 焚云  武器强化度            [    n = 14     ]                             |
--[10]断蛟  元帅                                                                |
--[11]星奕  城主                                                                |
--[12]破军  武器强化度            [    n = 15     ]                             |
--[13]豪门  转生                  [     一转      ]                             |
--                                                                              |
--翻译信息                                                                      |
--武器强化度：    weaponLv              先锋：    pioneer                       |
--门派排名：      schoolRank            将军：    general                       |
--pk值：          pkValue               元帅：    marshal                       |
--声望：          popularity            城主：    cityMaster                    |
--师门贡献度：    schoolContribute      印章：    seal                          |
--------------------------------------------------------------------------------- 
VIE_201005_REBORN_TB_WeaponEffectInfo = {
--{灵魄名, 灵魄外观等级说明信息, 灵魄需要的资质说明信息, 灵魄等级, 灵魄存在时间(天), 判断资质字符串}
--{"铁骨", "铁骨,淡蓝光芒(1级灵魄)", "手中武器强化度在<color=yellow>8<color>和<color=yellow>10<color>之间", 1, 30, 
-- "return weapon_level_chk({8,10})"} 
    [1]  = { VIE_201005_REBORN_TB_WeaponEffectInfo_STR_1[1], VIE_201005_REBORN_TB_WeaponEffectInfo_STR_2[1], 
             VIE_201005_REBORN_TB_WeaponEffectInfo_STR_3[1], 1, 30,"return VIE_201005_REBORN_GF_WeaponLvChk({8, 10})"},
             
    [2]  = { VIE_201005_REBORN_TB_WeaponEffectInfo_STR_1[2], VIE_201005_REBORN_TB_WeaponEffectInfo_STR_2[2], 
             VIE_201005_REBORN_TB_WeaponEffectInfo_STR_3[2], 2, 30,"return VIE_201005_REBORN_GF_PlayerLvChk()"},
             
    [3]  = { VIE_201005_REBORN_TB_WeaponEffectInfo_STR_1[3], VIE_201005_REBORN_TB_WeaponEffectInfo_STR_2[3], 
             VIE_201005_REBORN_TB_WeaponEffectInfo_STR_3[3], 2, 7, "return VIE_201005_REBORN_GF_PKValueChk(10)"},
             
    [4]  = { VIE_201005_REBORN_TB_WeaponEffectInfo_STR_1[4], VIE_201005_REBORN_TB_WeaponEffectInfo_STR_2[4], 
             VIE_201005_REBORN_TB_WeaponEffectInfo_STR_3[4], 2, 30,"return VIE_201005_REBORN_GF_WeaponLvChk({11,12})"},
             
    [5]  = { VIE_201005_REBORN_TB_WeaponEffectInfo_STR_1[5], VIE_201005_REBORN_TB_WeaponEffectInfo_STR_2[5], 
             VIE_201005_REBORN_TB_WeaponEffectInfo_STR_3[5], 2, 30,"return VIE_201005_REBORN_GF_PopOrContriChk()"},
             
    [6]  = { VIE_201005_REBORN_TB_WeaponEffectInfo_STR_1[6], VIE_201005_REBORN_TB_WeaponEffectInfo_STR_2[6], 
             VIE_201005_REBORN_TB_WeaponEffectInfo_STR_3[6], 2, 30,"return VIE_201005_REBORN_GF_WeaponLvChk({13,13})"},
             
    [7]  = { VIE_201005_REBORN_TB_WeaponEffectInfo_STR_1[7], VIE_201005_REBORN_TB_WeaponEffectInfo_STR_2[7], 
             VIE_201005_REBORN_TB_WeaponEffectInfo_STR_3[7], 2, 30,"return VIE_201005_REBORN_GF_PioneerChk()"},
             
    [8]  = { VIE_201005_REBORN_TB_WeaponEffectInfo_STR_1[8], VIE_201005_REBORN_TB_WeaponEffectInfo_STR_2[8], 
             VIE_201005_REBORN_TB_WeaponEffectInfo_STR_3[8], 3, 30,"return VIE_201005_REBORN_GF_GeneralChk()"},
             
    [9]  = { VIE_201005_REBORN_TB_WeaponEffectInfo_STR_1[9], VIE_201005_REBORN_TB_WeaponEffectInfo_STR_2[9], 
             VIE_201005_REBORN_TB_WeaponEffectInfo_STR_3[9], 3, 30,"return VIE_201005_REBORN_GF_WeaponLvChk({14,14})"},
             
    [10] = { VIE_201005_REBORN_TB_WeaponEffectInfo_STR_1[10],VIE_201005_REBORN_TB_WeaponEffectInfo_STR_2[10], 
             VIE_201005_REBORN_TB_WeaponEffectInfo_STR_3[10],3, 30,"return VIE_201005_REBORN_GF_MarshalChk()"},
             
    [11] = { VIE_201005_REBORN_TB_WeaponEffectInfo_STR_1[11],VIE_201005_REBORN_TB_WeaponEffectInfo_STR_2[11], 
             VIE_201005_REBORN_TB_WeaponEffectInfo_STR_3[11],3, 30,"return VIE_201005_REBORN_GF_CityMasterChk()"},
             
    [12] = { VIE_201005_REBORN_TB_WeaponEffectInfo_STR_1[12],VIE_201005_REBORN_TB_WeaponEffectInfo_STR_2[12], 
             VIE_201005_REBORN_TB_WeaponEffectInfo_STR_3[12],4, 30,"return VIE_201005_REBORN_GF_WeaponLvChk({15,15})"},
             
    [13] = { VIE_201005_REBORN_TB_WeaponEffectInfo_STR_1[13],VIE_201005_REBORN_TB_WeaponEffectInfo_STR_2[13], 
             VIE_201005_REBORN_TB_WeaponEffectInfo_STR_3[13],4, 30,"return VIE_201005_REBORN_GF_RebornStateChk()"},
};

--//材料信息
--{ 大类, 副类, 详细类别, 模板名 }
VIE_201005_REBORN_TB_MaterialInfo = {
    [1] = {2, 1, 3330, VIE_201005_REBORN_STR_MaterialInfo[1]},  --一闪妖煌
    [2] = {2, 1, 3331, VIE_201005_REBORN_STR_MaterialInfo[2]},  --三耀龙爔
    [3] = {2, 1, 3332, VIE_201005_REBORN_STR_MaterialInfo[3]},  --渡月辰砂
    [4] = {2, 1, 3333, VIE_201005_REBORN_STR_MaterialInfo[4]},  --焚光辰砂
    [5] = {2, 1, 3334, VIE_201005_REBORN_STR_MaterialInfo[5]},  --斩星辰砂
    [6] = {2, 1, 3204, VIE_201005_REBORN_STR_MaterialInfo[6]},  --五彩珑髓
    [7] = {2, 1, 3205, VIE_201005_REBORN_STR_MaterialInfo[7]},  --七炫瑬纹
    [8] = {2, 5, 7   , VIE_201005_REBORN_STR_MaterialInfo[8]},  --七级鉴定符
    [9] = {2, 1, 1000, VIE_201005_REBORN_STR_MaterialInfo[9]},  --磐龙璧
};
 
--//附加灵魄需要的材料
--{ 金币数, 一闪妖煌数, MATERIAL_INFO行数 }
VIE_201005_REBORN_TB_SoulEffectCostInfo = {
    [1] =  { 100 , 15, 1 },   --铁骨
    [2] =  { 200 , 20, 1 },   --落霞
    [3] =  { 100 , 8 , 1 },   --百战
    [4] =  { 200 , 20, 1 },   --灼日
    [5] =  { 200 , 20, 1 },   --俊逸
    [6] =  { 200 , 20, 1 },   --桃李
    [7] =  { 200 , 20, 1 },   --名宿
    [8] =  { 500 , 15, 6 },   --凌霄
    [9] =  { 500 , 15, 6 },   --焚云
    [10]=  { 2000, 25, 6 },   --断蛟
    [11]=  { 2000, 25, 6 },   --星奕
    [12]=  { 2000, 25, 6 },   --破军
    [13]=  { 2000, 25, 6 },   --豪门
};

--//外装蕴灵消耗表
--[1] [2] [3] [4]代表每一级属性的消耗
--金子数, { {VIE_201005_REBORN_TB_MaterialInfo, 个数}, {VIE_201005_REBORN_TB_MaterialInfo, 个数}, ……}
VIE_201005_REBORN_TB_ClothEffectCostInfo = {
    [1] = {50 , {{1, 25}, {8, 4 }}           },
    [2] = {100, {{2, 5 }, {8, 8 }}           },
    [3] = {100, {{6, 2 }, {8, 16}, {9, 5 }}  },
    [4] = {100, {{7, 1 }, {9, 10}, {8, 30}}  },
}
--//灵魄对应的灵能信息
--{ 加生命等级, 加全属性等级 } 生命每一级加500，全属性每一级加3
VIE_201005_REBORN_TB_SoulPowerInfo = {
    [1] =  { 1 , 1 },   --铁骨
    [2] =  { 2 , 2 },   --落霞
    [3] =  { 2 , 2 },   --百战
    [4] =  { 2 , 2 },   --灼日
    [5] =  { 2 , 2 },   --俊逸
    [6] =  { 2 , 2 },   --桃李
    [7] =  { 2 , 2 },   --名宿
    [8] =  { 3 , 3 },   --凌霄
    [9] =  { 3 , 3 },   --焚云
    [10]=  { 3 , 3 },   --断蛟
    [11]=  { 3 , 3 },   --星奕
    [12]=  { 4 , 4 },   --破军
    [13]=  { 4 , 4 },   --豪门
};

--//可以蕴灵的外装列表
--[小衣柜的外装、大衣柜的外装、元旦服装、趴趴客栈装、圣诞装]
VIE_201005_REBORN_TB_SuitCanAddEffect = {
    {0,108,514}, {0,108,515}, {0,108,516}, {0,108,517},
    {0,108,518}, {0,108,519}, {0,108,520}, {0,108,521}, {0,108,522}, 
    {0,108,523}, {0,108,524}, {0,108,525}, {0,108,526}, {0,108,527}, 
    {0,108,528}, {0,108,529}, {0,108,1  }, {0,108,2  }, {0,108,3  },
    {0,108,4  }, {0,108,5  }, {0,108,6  }, {0,108,7  }, {0,108,8  }, 
    {0,108,9  }, {0,108,10 }, {0,108,11 }, {0,108,12 }, {0,108,13 }, 
    {0,108,14 }, {0,108,15 }, {0,108,16 }, {0,108,17 }, {0,108,18 },
    {0,108,19 }, {0,108,20 }, {0,108,21 }, {0,108,22 }, {0,108,23 }, 
    {0,108,24 }, {0,108,25 }, {0,108,26 }, {0,108,27 }, {0,108,28 }, 
    {0,108,29 }, {0,108,30 }, {0,108,31 }, {0,108,32 }, {0,108,33 }, 
    {0,108,34 }, {0,108,35 }, {0,108,36 }, {0,108,37 }, {0,108,38 }, 
    {0,108,39 }, {0,108,40 }, {0,108,41 }, {0,108,42 }, {0,108,43 }, 
    {0,108,44 }, {0,108,45 }, {0,108,46 }, {0,108,47 }, {0,108,48 },
    {0,108,49 }, {0,108,50 }, {0,108,51 }, {0,108,52 }, {0,108,53 }, 
    {0,108,54 }, {0,108,55 }, {0,108,56 }, {0,108,57 }, {0,108,58 }, 
    {0,108,59 }, {0,108,60 }, {0,108,61 }, {0,108,62 }, {0,108,63 }, 
    {0,108,64 }, {0,108,65 }, {0,108,66 }, {0,108,67 }, {0,108,68 }, 
    {0,108,69 }, {0,108,70 }, {0,108,71 }, {0,108,72 }, 
                                           {0,108,139}, {0,108,140},
    {0,108,141}, {0,108,142}, {0,108,195}, {0,108,196}, {0,108,197}, 
    {0,108,198}, {0,108,510}, {0,108,511}, {0,108,512}, {0,108,513},

    {0,109,514}, {0,109,515}, {0,109,516}, {0,109,517},
    {0,109,518}, {0,109,519}, {0,109,520}, {0,109,521}, {0,109,522}, 
    {0,109,523}, {0,109,524}, {0,109,525}, {0,109,526}, {0,109,527}, 
    {0,109,528}, {0,109,529}, {0,109,1  }, {0,109,2  }, {0,109,3  }, 
    {0,109,4  }, {0,109,5  }, {0,109,6  }, {0,109,7  }, {0,109,8  }, 
    {0,109,9  }, {0,109,10 }, {0,109,11 }, {0,109,12 }, {0,109,13 }, 
    {0,109,14 }, {0,109,15 }, {0,109,16 }, {0,109,17 }, {0,109,18 },
    {0,109,19 }, {0,109,20 }, {0,109,21 }, {0,109,22 }, {0,109,23 }, 
    {0,109,24 }, {0,109,25 }, {0,109,26 }, {0,109,27 }, {0,109,28 }, 
    {0,109,29 }, {0,109,30 }, {0,109,31 }, {0,109,32 }, {0,109,33 }, 
    {0,109,34 }, {0,109,35 }, {0,109,36 }, {0,109,37 }, {0,109,38 }, 
    {0,109,39 }, {0,109,40 }, {0,109,41 }, {0,109,42 }, {0,109,43 }, 
    {0,109,44 }, {0,109,45 }, {0,109,46 }, {0,109,47 }, {0,109,48 },
    {0,109,49 }, {0,109,50 }, {0,109,51 }, {0,109,52 }, {0,109,53 }, 
    {0,109,54 }, {0,109,55 }, {0,109,56 }, {0,109,57 }, {0,109,58 }, 
    {0,109,59 }, {0,109,60 }, {0,109,61 }, {0,109,62 }, {0,109,63 },
    {0,109,64 }, {0,109,65 }, {0,109,66 }, {0,109,67 }, {0,109,68 }, 
    {0,109,69 }, {0,109,70 }, {0,109,71 }, {0,109,72 }, 
                                           {0,109,185}, {0,109,186},
    {0,109,187}, {0,109,188}, {0,109,255}, {0,109,256}, {0,109,257},
    {0,109,258}, {0,109,510}, {0,109,511}, {0,109,512}, {0,109,513},

    {0,110,514}, {0,110,515}, {0,110,516}, {0,110,517},
    {0,110,518}, {0,110,519}, {0,110,520}, {0,110,521}, {0,110,522},
    {0,110,523}, {0,110,524}, {0,110,525}, {0,110,526}, {0,110,527},
    {0,110,528}, {0,110,529}, {0,110,1  }, {0,110,2  }, {0,110,3  }, 
    {0,110,4  }, {0,110,5  }, {0,110,6  }, {0,110,7  }, {0,110,8  },
    {0,110,9  }, {0,110,10 }, {0,110,11 }, {0,110,12 }, {0,110,13 },
    {0,110,14 }, {0,110,15 }, {0,110,16 }, {0,110,17 }, {0,110,18 },
    {0,110,19 }, {0,110,20 }, {0,110,21 }, {0,110,22 }, {0,110,23 },
    {0,110,24 }, {0,110,25 }, {0,110,26 }, {0,110,27 }, {0,110,28 },
    {0,110,29 }, {0,110,30 }, {0,110,31 }, {0,110,32 }, {0,110,33 },
    {0,110,34 }, {0,110,35 }, {0,110,36 }, {0,110,37 }, {0,110,38 },
    {0,110,39 }, {0,110,40 }, {0,110,41 }, {0,110,42 }, {0,110,43 },
    {0,110,44 }, {0,110,45 }, {0,110,46 }, {0,110,47 }, {0,110,48 },
    {0,110,49 }, {0,110,50 }, {0,110,51 }, {0,110,52 }, {0,110,53 },
    {0,110,54 }, {0,110,55 }, {0,110,56 }, {0,110,57 }, {0,110,58 },
    {0,110,59 }, {0,110,60 }, {0,110,61 }, {0,110,62 }, {0,110,63 },
    {0,110,64 }, {0,110,65 }, {0,110,66 }, {0,110,67 }, {0,110,68 },
    {0,110,69 }, {0,110,70 }, {0,110,71 }, {0,110,72 }, 
                                           {0,110,81 }, {0,110,82 },
    {0,110,83 }, {0,110,84 }, {0,110,85 }, {0,110,86 }, {0,110,87 },
    {0,110,88 }, {0,110,510}, {0,110,511}, {0,110,512}, {0,110,513},
};

--//四印信息
--{ 大类, 副类, 详细类别, 模板名 }
VIE_201005_REBORN_TB_RebornStamper = {
    [1] = {0, 0, 0, VIE_201005_REBORN_TB_RebornStamper_STR[1]},  --龙子印
    [2] = {0, 0, 0, VIE_201005_REBORN_TB_RebornStamper_STR[2]},  --凤子印
    [3] = {0, 0, 0, VIE_201005_REBORN_TB_RebornStamper_STR[3]},  --虎子印
    [4] = {0, 0, 0, VIE_201005_REBORN_TB_RebornStamper_STR[4]},  --鹰子印
};

------------------------------------------------------------------------------
--蕴灵属性表                                                                 |
--attr_name : 是魔法属性名                                                   |          
--attr_level: 是游戏中定义魔法属性的级数                                     |
--attr_point: 对应attr_level的每一级的数值                                   |
--id        : item_attribute.txt魔法属性表中的id                             |
--id_Lv     : 对于attr_point指定的数值实际真正的对应id指定属性表中需要的级数 |
------------------------------------------------------------------------------
--//外装属性公共属性(全属性增加)
VIE_201005_REBORN_TB_ClothEffectAttr_Common = {             
    attr_name     = VIE_201005_REBORN_TB_ClothEffectAttr_STR[1],                --所有属性增加
    attr_level    = {1   , 2   , 3   , 4  }, 
    attr_point    = {3   , 6   , 9   , 12 },
    attr_id       = {102 , 102 , 102 , 102},
    attr_id_level = {1   , 2   , 3   , 4  },
};

VIE_201005_REBORN_TB_ClothEffectAttr_Dragon = {
    [6] = {                                                 --帽子
        [1] = {
            attr_name     = VIE_201005_REBORN_TB_ClothEffectAttr_STR[2],        --内外功伤害百分比提高 
            attr_level    = {1   , 2   , 3   , 4  }, 
            attr_point    = {5   , 6   , 7   , 8  },
            attr_id       = {575 , 575 , 575 , 575},
            attr_id_level = {4   , 5   , 6   , 7  },
        },
        [2] = VIE_201005_REBORN_TB_ClothEffectAttr_Common,
    },
    [7] = {                                                 --上衣
        [1] = {
            attr_name     = VIE_201005_REBORN_TB_ClothEffectAttr_STR[3],        --攻击伤害点数增加
            attr_level    = {1   , 2   , 3   , 4  }, 
            attr_point    = {30  , 40  , 50  , 60 },
            attr_id       = {331 , 331 , 331 , 331},
            attr_id_level = {1   , 2   , 3   , 4  },
        },
        [2] = VIE_201005_REBORN_TB_ClothEffectAttr_Common,
    },
    [8] = {                                                 --裤子
        [1] = {
            attr_name     = VIE_201005_REBORN_TB_ClothEffectAttr_STR[4],        --攻击命中点数增加
            attr_level    = {1   , 2   , 3   , 4  }, 
            attr_point    = {150 , 160 , 170 , 180},
            attr_id       = {306 , 306 , 306 , 306},
            attr_id_level = {1   , 2   , 3   , 4  },
        },
        [2] = VIE_201005_REBORN_TB_ClothEffectAttr_Common,
    },
};

VIE_201005_REBORN_TB_ClothEffectAttr_Phenix = {
    [6] = {                                                 --帽子
        [1] = {
            attr_name     = VIE_201005_REBORN_TB_ClothEffectAttr_STR[5],        --出招概率点数增加 
            attr_level    = {1   , 2   , 3   , 4  }, 
            attr_point    = {2   , 3   , 4   , 5  },
            attr_id       = {27  , 27  , 27  , 27 },
            attr_id_level = {1   , 2   , 3   , 4  },
        },
        [2] = VIE_201005_REBORN_TB_ClothEffectAttr_Common,
    },
    [7] = {                                                 --上衣
        [1] = {
            attr_name     = VIE_201005_REBORN_TB_ClothEffectAttr_STR[3],        --攻击伤害点数增加
            attr_level    = {1   , 2   , 3   , 4  }, 
            attr_point    = {30  , 40  , 50  , 60 },
            attr_id       = {331 , 331 , 331 , 331},
            attr_id_level = {1   , 2   , 3   , 4  },
        },
        [2] = VIE_201005_REBORN_TB_ClothEffectAttr_Common,
    },
    [8] = {                                                 --裤子
        [1] = {
            attr_name     = VIE_201005_REBORN_TB_ClothEffectAttr_STR[6],        --攻击辅助时间百分比提高
            attr_level    = {1   , 2   , 3   , 4  }, 
            attr_point    = {15  , 20  , 25  , 30 },
            attr_id       = {41  , 41  , 41  , 41 },
            attr_id_level = {3   , 4   , 5   , 6  },
        },
       [2] = {
            attr_name     = VIE_201005_REBORN_TB_ClothEffectAttr_STR[8],        --防御辅助时间百分比提高
            attr_level    = {1   , 2   , 3   , 4  }, 
            attr_point    = {15  , 20  , 25  , 30 },
            attr_id       = {42  , 42  , 42  , 42 },
            attr_id_level = {3   , 4   , 5   , 6  },
        },
        [3] = VIE_201005_REBORN_TB_ClothEffectAttr_Common,
    },
};

VIE_201005_REBORN_TB_ClothEffectAttr_Tiger = {
    [6] = {                                                 --帽子
        [1] = {
            attr_name     = VIE_201005_REBORN_TB_ClothEffectAttr_STR[7],        --承受伤害减半概率 
            attr_level    = {1   , 2   , 3   , 4  }, 
            attr_point    = {4   , 7   , 10  , 13 },
            attr_id       = {107 , 107 , 107 , 107},
            attr_id_level = {1   , 2   , 3   , 4  },
        },
        [2] = VIE_201005_REBORN_TB_ClothEffectAttr_Common,
    },
    [7] = {                                                 --上衣
        [1] = {
            attr_name     = VIE_201005_REBORN_TB_ClothEffectAttr_STR[9],        --内外功防御点数增加 
            attr_level    = {1   , 2   , 3   , 4  }, 
            attr_point    = {40  , 40  , 60  , 60 },
            attr_id       = {409 , 409 , 409 , 409},
            attr_id_level = {1   , 1   , 2   , 2  },
        },
        [2] = VIE_201005_REBORN_TB_ClothEffectAttr_Common,
    },
    [8] = {                                                 --裤子
        [1] = {
            attr_name     = VIE_201005_REBORN_TB_ClothEffectAttr_STR[10],       --生命上限百分比增加 
            attr_level    = {1   , 2   , 3   , 4  }, 
            attr_point    = {3   , 5   , 7   , 9  },
            attr_id       = {79  , 79  , 79  , 79 },
            attr_id_level = {1   , 2   , 3   , 4  },
        },
        [2] = {
            attr_name     = VIE_201005_REBORN_TB_ClothEffectAttr_STR[11],       --内力上限百分比增加 
            attr_level    = {1   , 2   , 3   , 4  }, 
            attr_point    = {3   , 5   , 7   , 9  },
            attr_id       = {80  , 80  , 80  , 80 },
            attr_id_level = {1   , 2   , 3   , 4  },
        },
        [3] = VIE_201005_REBORN_TB_ClothEffectAttr_Common,
    },
};

VIE_201005_REBORN_TB_ClothEffectAttr_Eagle = {
    [6] = {                                                 --帽子
        [1] = {
            attr_name     = VIE_201005_REBORN_TB_ClothEffectAttr_STR[13],       --攻击无视对方防御概率 
            attr_level    = {1   , 2   , 3   , 4  }, 
            attr_point    = {5   , 5   , 10  , 10 },
            attr_id       = {252 , 252 , 252 , 252},
            attr_id_level = {1   , 1   , 2   , 2  },
        },
        [2] = VIE_201005_REBORN_TB_ClothEffectAttr_Common,
    },
    [7] = {                                                 --上衣
        [1] = {
            attr_name     = VIE_201005_REBORN_TB_ClothEffectAttr_STR[12],        --攻击附带毒伤害点数
            attr_level    = {1   , 2   , 3   , 4  }, 
            attr_point    = {10  , 20  , 30  , 40 },
            attr_id       = {259 , 259 , 259 , 259},
            attr_id_level = {1   , 2   , 3   , 4  },
        },
        [2] = VIE_201005_REBORN_TB_ClothEffectAttr_Common,
    },
    [8] = {                                                 --裤子
        [1] = {
            attr_name     = VIE_201005_REBORN_TB_ClothEffectAttr_STR[4],        --攻击命中点数增加
            attr_level    = {1   , 2   , 3   , 4  }, 
            attr_point    = {150 , 160 , 170 , 180},
            attr_id       = {306 , 306 , 306 , 306},
            attr_id_level = {1   , 2   , 3   , 4  },
        },
        [2] = VIE_201005_REBORN_TB_ClothEffectAttr_Common,
    },
};

VIE_201005_REBORN_TB_ClothEffectAttr_Special = {
    [1] = VIE_201005_REBORN_TB_ClothEffectAttr_Dragon,      --龙子印
    [2] = VIE_201005_REBORN_TB_ClothEffectAttr_Tiger,       --虎子印
    [3] = VIE_201005_REBORN_TB_ClothEffectAttr_Eagle,       --鹰子印
    [4] = VIE_201005_REBORN_TB_ClothEffectAttr_Phenix,      --凤子印
};
--//处理方法：先根据印章(门会种类)选择table，再根据外装位置选择table，然后选择属性等级，然后附上属性

VIE_201005_REBORN_TB_ClothEffectAttr_Normal_Test = {                                 --越南文档没来，随便弄一个属性表进行测试
    [6] = {
        [1] = {
            attr_name     = VIE_201005_REBORN_TB_ClothEffectAttr_STR[4],            --攻击命中点数增加
            attr_level    = {1   , 2   , 3   , 4  }, 
            attr_point    = {150 , 160 , 170 , 180},
            attr_id       = {306 , 306 , 306 , 306},
            attr_id_level = {1   , 2   , 3   , 4  },
        },
        [2] = VIE_201005_REBORN_TB_ClothEffectAttr_Common,
    },
    [7] = {
        [1] = {
            attr_name     = VIE_201005_REBORN_TB_ClothEffectAttr_STR[4],            --攻击命中点数增加
            attr_level    = {1   , 2   , 3   , 4  }, 
            attr_point    = {150 , 160 , 170 , 180},
            attr_id       = {306 , 306 , 306 , 306},
            attr_id_level = {1   , 2   , 3   , 4  },
        },
        [2] = VIE_201005_REBORN_TB_ClothEffectAttr_Common,
    },
    [8] = {
        [1] = {
            attr_name     = VIE_201005_REBORN_TB_ClothEffectAttr_STR[4],            --攻击命中点数增加
            attr_level    = {1   , 2   , 3   , 4  }, 
            attr_point    = {150 , 160 , 170 , 180},
            attr_id       = {306 , 306 , 306 , 306},
            attr_id_level = {1   , 2   , 3   , 4  },
        },
        [2] = VIE_201005_REBORN_TB_ClothEffectAttr_Common,
    },
};

VIE_201005_REBORN_TB_ClothEffectAttr_Normal = {                                 --注意该表处理流程和上面的不同，详细的参看文档
    [1] = {
        attr_name     = VIE_201005_REBORN_TB_ClothEffectAttr_STR[14],           --力量点数增加
        attr_level    = {1   , 2   , 3   }, 
        attr_point    = {5   , 10  , 15  },
        attr_id       = {246 , 246 , 246 },
        attr_id_level = {1   , 2   , 3   },
    },
    [2] = {
        attr_name     = VIE_201005_REBORN_TB_ClothEffectAttr_STR[15],           --内功点数增加
        attr_level    = {1   , 2   , 3   }, 
        attr_point    = {5   , 10  , 15  },
        attr_id       = {249 , 249 , 249 },
        attr_id_level = {1   , 2   , 3   },
    },
    [3] = {
        attr_name     = VIE_201005_REBORN_TB_ClothEffectAttr_STR[16],           --根骨点数增加
        attr_level    = {1   , 2   , 3   }, 
        attr_point    = {5   , 10  , 15  },
        attr_id       = {245 , 245 , 245 },
        attr_id_level = {1   , 2   , 3   },
    },
    [4] = {
        attr_name     = VIE_201005_REBORN_TB_ClothEffectAttr_STR[17],           --身法点数增加
        attr_level    = {1   , 2   , 3   }, 
        attr_point    = {5   , 10  , 15  },
        attr_id       = {247 , 247 , 247 },
        attr_id_level = {1   , 2   , 3   },
    },
    [5] = {
        attr_name     = VIE_201005_REBORN_TB_ClothEffectAttr_STR[18],           --洞察点数增加
        attr_level    = {1   , 2   , 3   }, 
        attr_point    = {5   , 10  , 15  },
        attr_id       = {248 , 248 , 248 },
        attr_id_level = {1   , 2   , 3   },
    },
};
---------------------------------------------------------------------------------
--资质判断函数集合                                                              |
--[1] 铁骨  武器强化度            8 =< n <= 10                                  |
--[2] 落霞  等级                       n >= 95                                  |
--[3] 百战  pk值                       10                                       |
--[4] 灼日  武器强化度           11 =< n <= 12                                  |
--[5] 俊逸  声望或师门贡献度           n >= 15000                               |
--[6] 桃李  武器强化度                 n = 13                                   |
--[7] 名宿  先锋                                                                |
--[8] 凌霄  将军                                                                |
--[9] 焚云  武器强化度                 n = 14                                   |
--[10]断蛟  元帅                                                                |
--[11]星奕  城主                                                                |
--[12]破军  武器强化度                 n = 15                                   |
--[13]豪门  转生                        一转                                    |
---------------------------------------------------------------------------------
--//武器强化度判断函数
function VIE_201005_REBORN_GF_WeaponLvChk(tbInterval)
    local nWeaponIndex = GetPlayerEquipIndex(2);
    local nEquipLv = GetEquipAttr(nWeaponIndex, 2);
    if nEquipLv >= tbInterval[1] and nEquipLv <= tbInterval[2] then
        return 1;
    end
    return 0;
end

--//等级判断(并且要加入门派)
function VIE_201005_REBORN_GF_PlayerLvChk(nRankRequired)
    if GetLevel() < 95 then 
        return 0;
    end
    if GetPlayerRoute() <= 0 then
        return 0;
    end
    return 1;
end

--//pk值判断
function VIE_201005_REBORN_GF_PKValueChk(nPkRequired)
    local nPkValue = GetPKValue();
    if nPkValue >= nPkRequired then 
        return 1;
    end
    return 0;    
end

--//声望或师门贡献度判断
function VIE_201005_REBORN_GF_PopOrContriChk()
    local nschoolContribute = GetTask(336);
    local nPopularity = GetReputation();
    if nschoolContribute >= 15000 or nPopularity >= 15000 then
        return 1;
    end
    return 0;
end

--//先锋判断
function VIE_201005_REBORN_GF_PioneerChk()
    if abs( GetTask(704) ) == 4 then
        return 1;
    end
    return 0;
end

--//将军判断
function VIE_201005_REBORN_GF_GeneralChk()
    if abs( GetTask(704) ) == 5 or ( GetTask(766) + GetTask(765) ) >= 10 then
        return 1;
    end
    return 0;
end

--//元帅判断
function VIE_201005_REBORN_GF_MarshalChk()
    if abs( GetTask(704) ) == 6 or GetTask(765) >= 15 then
        return 1;
    end
    return 0;
end

--//城主判断
function VIE_201005_REBORN_GF_CityMasterChk()
    local tTitle = {5, 1, 9};
    for i=1, getn(tTitle) do
        if IsTitleExist(51, tTitle[i]) > 0 then
            return 1;
        end
    end
    return 0;
end

--//转生状态判断
--转生的接口是关于越南转生的，程序提供一个接口：GetPlayerRebornParam(nParam)
--nParam = 1 是得到第几转，未转生为0
--nParam = 2 是得到转生的门会，0为无门会，1，2，3，4表示龙虎鹰凤
function VIE_201005_REBORN_GF_RebornStateChk()
    if GetPlayerRebornParam(0) <= 0 then 
        return 0;
    end
    return 1;
end 

--//DEBUG函数
if DEBUG == 1 then
    function GetPlayerRebornParam(nParam)
        if nParam == 1 then
            return 1;
        end
        if nParam == 2 then
            return 1;
        end
    end
end
