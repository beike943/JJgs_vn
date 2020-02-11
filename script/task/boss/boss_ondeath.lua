Include("\\script\\online\\newyear08\\newyear08_head.lua");--08Ê¥µ®½Ú
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");

function OnDeath(npcIndex)
	SetNpcLifeTime(npcIndex, 30);
	local npcIndex,npcModel,npcName = GetTriggeringUnit();
	if get_chrims_state() == 1 then
		local nRand = random(1,1000);
		if nRand <= 1000 then
			AddItem(2,1,1192,1);
			Msg2Player("B¹n nhËn ®­îc mét tói lÔ vËt Gi¸ng Sinh");
		end
	end
	if npcName == "B¾c Lôc L©m Minh Chñ" then
		local npcIndex = CreateNpc("B¾c Lôc L©m lÖnh","B¾c Lôc L©m lÖnh",GetNpcWorldPos(npcIndex));
		SetNpcScript(npcIndex,"\\script\\task\\tasklink\\taskitem.lua");
		SetNpcLifeTime(npcIndex,5*60);	--Éú´æÊ±¼ä£º£µ·ÖÖÓ
		-- µÃµ½µ±Ç°µÄnpc×ø±ê
		local nMapID, nWx, nWy = GetNpcWorldPos(npcIndex)
		local nAddX = 0
		local nAddY = 0
		local nTargetNpc = 0
		
		-- call³öÀ´10¸öËæ»úÉ¢ÂäµÄÏä×Ó
		for i = 1, 50 do
			nAddX = random(-30, 30)
			nAddY = random(-30, 30)
			
			nTargetNpc = CreateNpc("Tói cao thñ", "Tói cña B¾c Lôc L©m Minh Chñ", nMapID, nWx + nAddX, nWy + nAddY)
			AddUnitStates(nTargetNpc, 6, GetTime())
			SetNpcLifeTime(nTargetNpc, 600)
			SetNpcScript(nTargetNpc, "\\script\\task\\boss\\boss_baoguo.lua")
		end		
	elseif npcName == "Th­¬ng ThÇn Doanh Thiªn" then
		local npcIndex = CreateNpc("Trôc ¶nh Th­¬ng","Trôc ¶nh Th­¬ng",GetNpcWorldPos(npcIndex));
		SetNpcScript(npcIndex,"\\script\\task\\tasklink\\taskitem.lua");
		SetNpcLifeTime(npcIndex,5*60);	--Éú´æÊ±¼ä£º£µ·ÖÖÓ	
		-- µÃµ½µ±Ç°µÄnpc×ø±ê
		local nMapID, nWx, nWy = GetNpcWorldPos(npcIndex)
		local nAddX = 0
		local nAddY = 0
		local nTargetNpc = 0
		
		-- call³öÀ´10¸öËæ»úÉ¢ÂäµÄÏä×Ó
		for i = 1, 50 do
			nAddX = random(-30, 30)
			nAddY = random(-30, 30)
			
			nTargetNpc = CreateNpc("Tói cao thñ", "Tói cña Th­¬ng ThÇn Doanh Thiªn", nMapID, nWx + nAddX, nWy + nAddY)
			AddUnitStates(nTargetNpc, 6, GetTime())
			SetNpcLifeTime(nTargetNpc, 600)
			SetNpcScript(nTargetNpc, "\\script\\task\\boss\\boss_baoguo.lua")
		end		
	elseif npcName == "L·nh H­¬ng L¨ng" then
		---- NhiÖm vô chuyÓn sinh 5
	local nTeamSize = GetTeamSize()
	if nTeamSize >= 2 then
		local nOldPlayerIdx = PlayerIndex
		for i = 1, nTeamSize do
			PlayerIndex = GetTeamMember(i)
			if GetTask(TRANSLIFE_MISSION_ID) == 35 and GetTask(TRANSLIFE_TASK_5_2) < 1 then 
				SetTask(TRANSLIFE_TASK_5_2,1)
			end
			if GetTask(TRANSLIFE_TASK_5_2) == 1 then
				TaskTip("Hoµn thµnh yªu cÇu cña NhÞ Hoµng Tö §oµn Tè ThuËn tiªu diÖt hån ma L·nh H­¬ng L¨ng  ")
			end
		end
		PlayerIndex = nOldPlayerIdx
	else
		if GetTask(TRANSLIFE_MISSION_ID) == 35 and GetTask(TRANSLIFE_TASK_5_2) < 1 then 
				SetTask(TRANSLIFE_TASK_5_2,1)
		end
		if GetTask(TRANSLIFE_TASK_5_2) == 1 then
				TaskTip("Hoµn thµnh yªu cÇu cña NhÞ Hoµng Tö §oµn Tè ThuËn tiªu diÖt hån ma L·nh H­¬ng L¨ng  ")
		end
	end
		
		local npcIndex = CreateNpc("TuyÖt T×nh Th¹ch","TuyÖt T×nh Th¹ch",GetNpcWorldPos(npcIndex));
		SetNpcScript(npcIndex,"\\script\\task\\tasklink\\taskitem.lua");
		SetNpcLifeTime(npcIndex,5*60);	--Éú´æÊ±¼ä£º£µ·ÖÖÓ	
		-- µÃµ½µ±Ç°µÄnpc×ø±ê
		local nMapID, nWx, nWy = GetNpcWorldPos(npcIndex)
		local nAddX = 0
		local nAddY = 0
		local nTargetNpc = 0
		
		-- call³öÀ´10¸öËæ»úÉ¢ÂäµÄÏä×Ó
		for i = 1, 50 do
			nAddX = random(-30, 30)
			nAddY = random(-30, 30)
			
			nTargetNpc = CreateNpc("Tói cao thñ", "Tói cña L·nh H­¬ng L¨ng", nMapID, nWx + nAddX, nWy + nAddY)
			AddUnitStates(nTargetNpc, 6, GetTime())
			SetNpcLifeTime(nTargetNpc, 600)
			SetNpcScript(nTargetNpc, "\\script\\task\\boss\\boss_baoguo.lua")
		end			
	else
		Talk(1,"","B¹n nh×n xung quanh vÉn kh«ng ph¸t hiÖn g×.");
	end;
end