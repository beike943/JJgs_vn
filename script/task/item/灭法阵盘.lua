Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")

Mfzp_Npc_index_1 = 0;
Mfzp_Npc_index_2 = 0;
Mfzp_Npc_index_3 = 0;
Mfzp_Npc_index_4 = 0;

function OnUse(nIndex)
	if tGtTask:check_cur_task(80) ~= 1 then
		return 0;
	end
	if BigGetItemCount(2,0,30050) >= 1 then
		return 0;
	end
	if GetTrigger(1520*2) ~= 0 or GetTrigger(3008*2) ~= 0 then
		return 0;
	end
	local nMap,nX,nY = GetWorldPos();
	if nMap ~= 509 then
		Talk(1,"","N¬i nµy kh«ng thÓ dïng ®¹o cô nµy");
		return 0;
	end
--	if GetMapTaskTemp(nMap,Map_Glb_Valve9) >= 1 then
--		Talk(1,"","ÒÑ¾­ÓÐÍæ¼ÒÔÚ×ö´ËÈÎÎñ£¬ÉÔºóÔÙÊÔ");
--		return 0;
--	end
	if (GetNpcName(Mfzp_Npc_index_1) == "¦ng Linh") or
			(GetNpcName(Mfzp_Npc_index_2) == "Long Linh") or
			(GetNpcName(Mfzp_Npc_index_3) == "Ph­îng Linh") or
			(GetNpcName(Mfzp_Npc_index_4) == "Hæ Linh") then
		Talk(1,"","§· cã ng­êi lµm nhiÖm vô nµy, h·y chê chót");
		return 0;
	end
	RemoveTrigger(GetTrigger(1520*2));
	RemoveTrigger(GetTrigger(3008*2));
--	SetMapTaskTemp(nMap,Map_Glb_Valve9,1);
	NewWorld(509,1456,3371);
	SetTask(Task_id_015,0);
	CastState("state_dispear",100,18*40);
	CreateTrigger(1,1520,1520*2);
	ContinueTimer(GetTrigger(1520*2));
	CreateTrigger(3,3008,3008*2);
	DoWait(103,104,40);
	SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex),936,0,0,18*5);
	SetItemUseLapse(nIndex,18*60*3);
	local npcIndex = CreateNpc("§èi tho¹i víi Trung ¦ng","¦ng Linh",509,1453,3368);
	Mfzp_Npc_index_1 = npcIndex;
	SetNpcLifeTime(npcIndex,50);
end

function deal_rezult()
	--if DelItem(2,0,30049,GetItemCount(2,0,30049)) == 1 then
	if GetTask(Task_id_015) >= 40 then
		if BigGetItemCount(2,0,30050) == 0 then
			AddItem(2,0,30050,1);
			Msg2Player("GhÐp thµnh c«ng Tø Linh DiÖt Ph¸p TrËn Bµn");
		end
	else
		Msg2Player("GhÐp Tø Linh DiÖt Ph¸p TrËn Bµn thÊt b¹i");
	end
	--end
end

function OnTimer()
	SetTask(Task_id_015,GetTask(Task_id_015)+1);
	local nMap,nX,nY = GetWorldPos();
	if nMap ~= 509 then
		SetTask(Task_id_015,45);
	end
	local nTimes = GetTask(Task_id_015);
--	if nTimes == 1 then
--		local npcIndex = CreateNpc("¶Ô»°ÖÐÓ¥","Ó¥Áé",509,1453,3368);
--		Mfzp_Npc_index_1 = npcIndex;
--		SetNpcLifeTime(npcIndex,50);
--	end
	if nTimes == 2 then
		SetCurrentNpcSFX(Mfzp_Npc_index_1,904,0,0,18*3);
	end
	if nTimes == 3 then
		NpcChat(Mfzp_Npc_index_1,"GÇn ®©y bËn rén trõng bÞ bän ¸c ®å s¸t h¹i b¸ch tÝnh.");
	end
	if nTimes == 5 then
		SetCurrentNpcSFX(Mfzp_Npc_index_1,956,0,0,18*5);
		NpcChat(Mfzp_Npc_index_1,"T¹i h¹ ®ang ®Þnh nghØ ng¬i chót, t¹i sao c¸c h¹ ®Õn lµm phiÒn vËy?");
		SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex),959,0,0,18*35);
	end
	if nTimes ==  7 then
		NpcChat(Mfzp_Npc_index_1,"T¹i h¹ sÏ khiÕn c¸c h¹ dë sèng dë chÕt.");
	end

	if nTimes == 11 then
		local npcIndex = CreateNpc("§èi tho¹i víi Trung Long","Long Linh",509,1459,3374);
		Mfzp_Npc_index_2 = npcIndex;
		SetNpcLifeTime(npcIndex,50);
	end
	if nTimes == 12 then
		SetCurrentNpcSFX(Mfzp_Npc_index_2,904,0,0,18*3);
	end
	if nTimes == 13 then
		NpcChat(Mfzp_Npc_index_2,"C¸c h¹ lµ ai? t¹i h¹ vµ c¸c h¹ kh«ng thï kh«ng o¸n, t¹i sao b¾t t¹i h¹ ®i?")
	end
	if nTimes == 15 then
		SetCurrentNpcSFX(Mfzp_Npc_index_2,955,0,0,18*5);
		NpcChat(Mfzp_Npc_index_2,"T¹i h¹ ®Þnh ®i cøu d©n chóng nh­ng giê kh«ng kÞp n÷a råi.")
	end
	if nTimes == 17 then
		NpcChat(Mfzp_Npc_index_2,"Ng­¬i g©y ra bao ®iÒu ¸c, nhÊt ®Þnh sÏ bÞ b¸o øng.");
	end

	if nTimes == 21 then
		local npcIndex = CreateNpc("§èi tho¹i Trung Ph­îng","Ph­îng Linh",509,1459,3368);
		Mfzp_Npc_index_3 = npcIndex;
		SetNpcLifeTime(npcIndex,50);
	end
	if nTimes == 22 then
		SetCurrentNpcSFX(Mfzp_Npc_index_3,904,0,0,18*3);
	end
	if nTimes == 23 then
		NpcChat(Mfzp_Npc_index_3,"T¹i h¹ lu«n muèn b¶o vÖ b¸ t¸nh, t¹i sao c¸c h¹ tµn nhÉn nh­ thÕ, c­íp ®i tù do cña t¹i h¹.");
	end
	if nTimes == 26 then
		SetCurrentNpcSFX(Mfzp_Npc_index_3,958,0,0,18*5);
		NpcChat(Mfzp_Npc_index_3,"CÇu xin c¸c h¹, ®õng b¾t t¹i h¹ ®i, ®õng b¾t t¹i h¹ ®i…");
	end

	if nTimes == 31 then
		local npcIndex = CreateNpc("§èi tho¹i Trung Hæ","Hæ Linh",509,1453,3374);
		Mfzp_Npc_index_4 = npcIndex;
		SetNpcLifeTime(npcIndex,50);
	end
	if nTimes == 32 then
		SetCurrentNpcSFX(Mfzp_Npc_index_4,904,0,0,18*3);
	end
	if nTimes == 33 then
		NpcChat(Mfzp_Npc_index_4,"C¸c vÞ anh hïng hµo kiÖt ®ang chiÕn ®Êu anh dòng trªn chiÕn tr­êng, t¹i h¹ vèn héi ngé cïng ch­ vÞ, nh­ng c¸c h¹ ®· chia c¾t.");
	end
	if nTimes == 35 then
		SetCurrentNpcSFX(Mfzp_Npc_index_4,957,0,0,18*5);
		NpcChat(Mfzp_Npc_index_4,"Nh­ng c¸c h¹ ®· chia c¾t, kh«ng biÕt hä sèng chÕt ra sao.");
	end
	if nTimes == 37 then
		NpcChat(Mfzp_Npc_index_4,"H·y ®Òn m¹ng ®i!");
	end
	if nTimes == 38 then
		SetCurrentNpcSFX(Mfzp_Npc_index_1,913,0,0,18*3);
		SetCurrentNpcSFX(Mfzp_Npc_index_2,913,0,0,18*3);
		SetCurrentNpcSFX(Mfzp_Npc_index_3,913,0,0,18*3);
		SetCurrentNpcSFX(Mfzp_Npc_index_4,913,0,0,18*3);
	end
	if nTimes == 40 then
		SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex),912,0,0,18*5);
--		SetMapTaskTemp(nMap,Map_Glb_Valve9,0);
--		RemoveTrigger(GetRunningTrigger());
--		RemoveTrigger(GetTrigger(3008*2));
--		SetNpcLifeTime(Mfzp_Npc_index_1,0);
--		SetNpcLifeTime(Mfzp_Npc_index_2,0);
--		SetNpcLifeTime(Mfzp_Npc_index_3,0);
--		SetNpcLifeTime(Mfzp_Npc_index_4,0);
--		Mfzp_Npc_index_1 = 0;
--		Mfzp_Npc_index_2 = 0;
--		Mfzp_Npc_index_3 = 0;
--		Mfzp_Npc_index_4 = 0;
	end
	if nTimes > 40 then
--		SetMapTaskTemp(509,Map_Glb_Valve9,0);
		RemoveTrigger(GetRunningTrigger());
		RemoveTrigger(GetTrigger(3008*2));
		SetNpcLifeTime(Mfzp_Npc_index_1,0);
		SetNpcLifeTime(Mfzp_Npc_index_2,0);
		SetNpcLifeTime(Mfzp_Npc_index_3,0);
		SetNpcLifeTime(Mfzp_Npc_index_4,0);
		if nMap == 509 and BigGetItemCount(2,0,30050) == 0 then
			AddItem(2,0,30050,1);
			Msg2Player("GhÐp thµnh c«ng Tø Linh DiÖt Ph¸p TrËn Bµn");
		end
--		Mfzp_Npc_index_1 = 0;
--		Mfzp_Npc_index_2 = 0;
--		Mfzp_Npc_index_3 = 0;
--		Mfzp_Npc_index_4 = 0;
	end
end

function Leave_Game()
--		SetMapTaskTemp(509,Map_Glb_Valve9,0);
		RemoveTrigger(GetRunningTrigger());
		RemoveTrigger(GetTrigger(1520*2));
		SetNpcLifeTime(Mfzp_Npc_index_1,0);
		SetNpcLifeTime(Mfzp_Npc_index_2,0);
		SetNpcLifeTime(Mfzp_Npc_index_3,0);
		SetNpcLifeTime(Mfzp_Npc_index_4,0);
--		Mfzp_Npc_index_1 = 0;
--		Mfzp_Npc_index_2 = 0;
--		Mfzp_Npc_index_3 = 0;
--		Mfzp_Npc_index_4 = 0;
end