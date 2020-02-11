--=============================================
--create by xiongyizhi 2010.11.2
--describe:越南版2010年 四灵树 头文件
--related files: 
--=============================================

Include("\\script\\online_activites\\task_values.lua");--任务变量头文件
Include("\\script\\online_activites\\2010_12\\activites_04\\strings.lua");--活动字符串
Include("\\script\\lib\\globalfunctions.lua");--公共函数文件

VET_201012_01_EVENT_NUMBER = 22;--在活动表上的编号是22 ，即使该活动没有用到表内时间，为方便查询还是占了个坑

VET_4_SOUL_TREE_BEGIN_TIME = 0; --start time
VET_4_SOUL_TREE_END_TIME = 2015123000; --end time
VET_201012_04_TREE_SCRIPT = "\\script\\online_activites\\2010_12\\activites_04\\npc\\tree_npc.lua" --point to tree NPC script

VET_4_SOUL_MAX_EXCHANGE_TIMES = 1; --max exchange award,should be the same as pet level.
VET_4_SOUL_MAX_EXCHANGE_EXP = 100000000; -- max exp per day
VET_4_SOUL_MAX_PLANT_TIMES = 32;--max tree plant award,should be the same as pet level.

VET_4_TB_PLANT_MAP = {301, 203, 108};

--base condition check,pass return 1,else return 0
function base_check() 
    if GetLevel() < 73 then	--or GetPlayerRoute() == 0 or GetReputation() < 3000 or GetTask(336) < 4000
        Talk(1, "", VET_201012_04_NPC_TALK_STRINGS[15]);
        return 0;
    else
        return 1;
    end
end
