-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 大理任务NPC蚩火妖妇Script
-- By StarryNight
-- 2005/12/30 PM 13:54

--乙酉年 戊子月 戊子日
--宜: 合帐 裁衣 教牛马 馀事勿取
--忌: 入宅 动土 破土 嫁娶 作灶 造船
--吉神宜趋: 官日 敬安 金匮
--凶神宜忌: 月建 小时 土府 月厌 地火
--五行: 霹雳火  建执位
--彭祖百忌: 戊不受田田主不祥 子不问卜自惹祸殃

-- ======================================================

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\大理\\task_head.lua")
Include("\\script\\task\\world\\大理\\lv10\\task_main.lua");

function OnDeath(index)
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();

    if nMemCount == 0 then -- 玩家未组队
        if GetTask(TASK_DL_LV10_ID) == 2 then
        	SetTask(TASK_DL_LV10_ID, 3);
        	Msg2Player("L蕐 頲 h鉧 n c馻 Tr辬h Qu竛 Chi.");
        	TaskTip("L蕐 頲 h鉧 n c馻 Tr辬h Qu竛 Chi.");
        	AddItem(2,0,363,1,1);--拿到货单
        end;
    else
        for i=1,nMemCount do
            PlayerIndex = GetTeamMember(i);
            local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
            local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
            if GetTask(TASK_DL_LV10_ID) == 2 and nDist >= 0 and nDist <= 50 then
            	SetTask(TASK_DL_LV10_ID, 3);
            	Msg2Player("L蕐 頲 h鉧 n c馻 Tr辬h Qu竛 Chi.");
            	TaskTip("L蕐 頲 h鉧 n c馻 Tr辬h Qu竛 Chi.");
            	AddItem(2,0,363,1,1);--拿到货单
            end;
		end;
		PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
    end;
end;