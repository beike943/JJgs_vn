--==============================================================================
--create by xiongyizhi
--describe: TaskIDs in this table will be reset zero everyday
--因使用触发器和登录判断能每次省下记录日期的TaskID，
--故需要“每天重置”的TaskID名可记录在此，该表将会被两个地方reset
--    一是登录时判断上次登录不是今天则reset
--    二是玩家身上有触发器判断是否跨天了，跨天则reset
--TaskID由\script\online_activites\task_values.lua 定义,该表仅需每次在表最后写下TaskID名字
--重置函数定义于\script\online_activites\daily_reset.lua 
--==============================================================================

VET_TB_DAILY_RESET_TASKID = {
    [1] = VET_201012_03_FIRE_TIMES, --2010年圣诞，晚冬取暖，记录玩家当天参与活动次数 ，定义于\script\online_activites\task_values.lua
 --   [2] = VET_201012_04_PLANT_4_SOUL_TREE_COUNT, ----四灵树，记录种下树的当天种下树的数量，定义于\script\online_activites\task_values.lua
 --   [3] = VET_201012_04_AWRAD_4_SOUL_FRUIT_COUNT, ----四灵树，记录种下树的当天上交水果的数量，定义于\script\online_activites\task_values.lua
};
