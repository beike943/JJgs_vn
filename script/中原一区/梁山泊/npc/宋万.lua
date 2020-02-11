--npc宋万脚本
--created by lizhi
--2005-8-24 15:25

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnDeath()
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();

    if nMemCount == 0 then -- 玩家未组队
        if GetTask(TASK_JJC) == 18 then
            SetTask(TASK_JJC_BEAT_SW, 2);
           	Msg2Player("Цnh b筰 T鑞g V筺");
           	TaskTip("Цnh b筰 T鑞g V筺");
	    	if GetTask(TASK_JJC_BEAT_SW) == 2 and GetTask(TASK_JJC_BEAT_LL) == 2 and GetTask(TASK_JJC_BEAT_G) == 2 then
		        SetTask(TASK_JJC, 19);
		        SetTask(TASK_JJC_BEAT_SW, 0);
		        SetTask(TASK_JJC_BEAT_LL, 0);
		        SetTask(TASK_JJC_BEAT_G, 0);
		        Msg2Player("Quay l筰 g苝 T鑞g Giang");
		        TaskTip("Quay l筰 g苝 T鑞g Giang");
    		end;
        end;
    else
        for i=1,nMemCount do
            PlayerIndex = GetTeamMember(i);
            local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
            local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
            if GetTask(TASK_JJC) == 18 and nDist >= 0 and nDist <= 50 then
				SetTask(TASK_JJC_BEAT_SW, 2);
				Msg2Player("Цnh b筰 T鑞g V筺");
           		TaskTip("Цnh b筰 T鑞g V筺");
		    	if GetTask(TASK_JJC_BEAT_SW) == 2 and GetTask(TASK_JJC_BEAT_LL) == 2 and GetTask(TASK_JJC_BEAT_G) == 2 then
			        SetTask(TASK_JJC, 19);
			        SetTask(TASK_JJC_BEAT_SW, 0);
			        SetTask(TASK_JJC_BEAT_LL, 0);
			        SetTask(TASK_JJC_BEAT_G, 0);
			        Msg2Player("Quay l筰 g苝 T鑞g Giang");
			        TaskTip("Quay l筰 g苝 T鑞g Giang");
    			end;
            end;
		end;
		PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
    end;
end;
