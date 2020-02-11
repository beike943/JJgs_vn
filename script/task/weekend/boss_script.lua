--bossµÄ½Å±¾
--created by lizhi
--2005-9-19 17:34

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\WeekEnd\\task_head.lua");

function OnDeath(index)
	--Ö»Òª±»É±ËÀ¾ÍÏûÊ§£¬²»¹ÜÊÇ·ñ±»±¾ÈËÉ±ËÀ
	local npcIndex = tonumber(index);
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();

    --É±µÄbossÊÇÄãÕÙ»½³öÀ´µÄ
    if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó
	    if npcIndex == GetTask(TASK_NPC_INDEX) and npcIndex ~= 0 then
	        --µôÂä£¬°ËØÔÍ¼
	        if random(1, 100) >= 50 then
	        	local nIndex = GetTask(TASK_BOSS_INDEX);
	        	AddItem(boss_drop_table[nIndex][1],boss_drop_table[nIndex][2],boss_drop_table[nIndex][3],1,1);
	        else
	        	AddItem(2, 0, 225, 2, 1);		--½±È¯
	        end;
	        --Èç¹ûÉ±ËÀµÄÊÇÎ÷Ä§£¬Ôò·¢¹«¸æ
	        if GetTask(TASK_BOSS_INDEX) == 9 then
	        	AddGlobalNews(GetName().."Ho¹t ®éng cuèi tuÇn chèng giÆc thµnh c«ng giÕt ®­îc T©y Ma");
	        end;
	        
	        SetTask(TASK_NPC_INDEX, 0);
	        SetTask(TASK_BOSS_INDEX, 0);
			--É¾³ýbossµÄrect´¥·¢Æ÷
			RemoveTrigger(GetTrigger(time_boss_table[2]))
			RemoveTrigger(GetTrigger(rect_boss_table[1][2]));
			RemoveTrigger(GetTrigger(log_boss_table[2]));
	    end;
	else
		for i=1,nMemCount do
            PlayerIndex = GetTeamMember(i);
            local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
            local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
            if npcIndex == GetTask(TASK_NPC_INDEX) and npcIndex ~= 0 and nDist >= 0 and nDist <= 50 then
				--µôÂä£¬°ËØÔÍ¼
				if random(1, 100) >= 50 then
		        	local nIndex = GetTask(TASK_BOSS_INDEX);
		        	AddItem(boss_drop_table[nIndex][1],boss_drop_table[nIndex][2],boss_drop_table[nIndex][3],1,1);
		        else
		        	AddItem(2, 0, 225, 2, 1);		--½±È¯
		        end;
				--Èç¹ûÉ±ËÀµÄÊÇÎ÷Ä§£¬Ôò·¢¹«¸æ
		        if GetTask(TASK_BOSS_INDEX) == 9 then
		        	AddGlobalNews(GetName().."vµ ®ång ®éi trong ho¹t ®éng cuèi tuÇn chèng giÆc thµnh c«ng giÕt ®­îc T©y Ma");
		        end;
		        SetTask(TASK_NPC_INDEX, 0);
		        SetTask(TASK_BOSS_INDEX, 0);
				--É¾³ýbossµÄrect´¥·¢Æ÷
				RemoveTrigger(GetTrigger(time_boss_table[2]))
				RemoveTrigger(GetTrigger(rect_boss_table[1][2]));
				RemoveTrigger(GetTrigger(log_boss_table[2]));
			end;
		end;
	end;
	PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
end;