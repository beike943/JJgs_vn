--define文件

--LSB_ACTIVITY_ID = 66; --活动ID
LSB_MAP_TASK_TEMP = 1; --地图变量记录BOSS数目
MAX_BOSS_NUM = 100; --boss数量限制
TIME_ZOOM_DIFF = 57600; --时区差异
LSB_szLogTitle = "Khi猽 chi課 Boss Lng S琻"
Min_Level = 80;

--服务器全局变量
GS_GLOBAL_VALUE1 = 2012; --记录奖励C获得天罡令数目
GS_GLOBAL_VALUE2 = 2013; --记录奖励C获得轩辕装备数目

GS_GLOBAL_VALUE3 = 2014; --记录boss位置

GS_GLOBAL_VALUE4 = 2015; --记录全局数据清理时间

--临时任务变量暂时使用之前的（不受资料片影响）
Sma_Boss_Index = 161;
Mid_Boss_Index = 162; -- 记录中boss和宝箱的Index
Gld_Boss_Index = 163;

--临时任务变量点击箱子
Pre_Click_Time1 = 3089; --宝箱A点击时间
Pre_Click_Time2 = 3090; --宝箱B点击时间

--箱子点击间隔
Click_Space_time = 60; --60s

--boss死亡脚本路径
Sma_Boss_Death_Script = "\\script\\online\\liangshanboss\\npc\\sma_boss_death.lua";
Sma_Boss_Remove_Script = "\\script\\online\\liangshanboss\\npc\\sma_boss_remove.lua";
Mid_Boss_Death_Script = "\\script\\online\\liangshanboss\\npc\\mid_boss_death.lua";
Mid_Boss_Remove_Script = "\\script\\online\\liangshanboss\\npc\\mid_boss_remove.lua";
Gld_Boss_Death_Script = "\\script\\online\\liangshanboss\\npc\\gld_boos_death.lua";
Gld_Boss_Remove_Script = "\\script\\online\\liangshanboss\\npc\\gld_boss_remove.lua";

--宝箱路径
Box_A_Script = "\\script\\online\\liangshanboss\\npc\\box\\box_a.lua"
Box_B_Script = "\\script\\online\\liangshanboss\\npc\\box\\box_b.lua";
Box_C_Script = "\\script\\online\\liangshanboss\\npc\\box\\box_c.lua";
Box_D_Script = "\\script\\online\\liangshanboss\\npc\\box\\box_d.lua";
Box_E_Script = "\\script\\online\\liangshanboss\\npc\\box\\box_e.lua";


--奖励A
Exp_Award_A = 50000;
Box_Num_A = {2,1,30384,10};

--奖励B
Exp_Award_B = 100000;
Box_Num_B = {2,1,30384,20};

--奖励C
Exp_Award_C = 500000;
Box_Num_C = {2,1,30384,40};

--Relay 共享数据库记录结构
--记录当前boss是否存在
Lsb_Record = {
	szKey = "activity_lsb",
	nKey1 = 0,
	nKey2 = 0,
	nSortType = 0,
	itemkey = "lsb_key",
}
--记录玩家找出boss的数目
Lsb_Record2 = {
	szKey = "activity_lsb2",
	nKey1 = 0,
	nKey2 = 0,
	nSortType = 0,
	itemkey = "lsb_key2",
}
--记录全局清理的时间
Lsb_Record3 = {
	szKey = "activity_lsb3",
	nKey1 = 0,
	nKey2 = 0,
	nSortType = 0,
	itemkey = "lsb_key3",
}

--触发器给的物品
Item_Trigger_Drop = {2,1,30392,"Lng S琻 t輓 v藅"};

--黄金大boss死亡刷出箱子个数
GlodBoss_Death_Num = 40;
GlodBoss_Drop_Num = 40;
--
--临时任务变量使用道具
Pre_Click_Time3 = 222;--两个道具共CD

--使用道具间隔
Used_Space_Time = 6;