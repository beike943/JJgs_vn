
tDropNum = {5,4,3,2,1,1,1,1}

Include("\\script\\gongcheng\\city_manage\\manage_head.lua")
Include("\\script\\gongcheng\\personal_task\\task_head.lua")

function tong_task_killed()
	local npcIndex, npcTemplete, npcName = GetTriggeringUnit()
	local nMulti = 2
	if npcName == "Binh sÜ Håi Phong tr¹i" then
		return
	elseif npcName == "Tinh anh Håi Phong tr¹i" then
		nMulti = 1
	elseif npcName == "Thèng lÜnh Håi Phong tr¹i" then
		nMulti = 5
	end

	local tItem = {2,0,764}
	local nTeamSize = GetTeamSize()
	if nTeamSize == 0 or nTeamSize == 1 then	-- Ã»×é¶Ó»òÕß¾ÍÒ»¸öÈË
		player_task_clear()
		map_task(npcName)
		local nDLCount, nSJCount, nJHCount, nSJCountView = CustomDataRead("tongcitywar_person_task")
		if nDLCount < 600 then
			local nDrop = tDropNum[1] * nMulti
			local nDiff = nDrop + nDLCount - 600
			if nDiff > 0 then
				nDrop = nDrop - nDiff
			end
			
			if GetFreeItemRoom() > 0 then
				AddItem(tItem[1],tItem[2],tItem[3],nDrop)
				CustomDataSave("tongcitywar_person_task", "dddd", nDLCount+nDrop, nSJCount, nJHCount, nSJCountView)
				if nDiff > 0 then
					Msg2Player("ChiÕm thµnh trong tuÇn b¹n ®· thu ®uîc 600 §Şch Binh Hé Gi¸p, kh«ng thÓ lÊy nhiÒu h¬n n÷a.")
				end
			end
		else
			Msg2Player("ChiÕm thµnh trong tuÇn b¹n ®· thu ®uîc 600 §Şch Binh Hé Gi¸p, kh«ng thÓ lÊy nhiÒu h¬n n÷a.")
		end
	else
		local nKillMapID = GetWorldPos()
		local nOldPlayer = PlayerIndex
		for i=1, nTeamSize do
			PlayerIndex = GetTeamMember(i)
			if PlayerIndex > 0 then
				player_task_clear()
				map_task(npcName)
				local nMapID = GetWorldPos()
				if IsPlayerDeath() == 0 and nKillMapID == nMapID then
					local nDLCount, nSJCount, nJHCount, nSJCountView = CustomDataRead("tongcitywar_person_task")
					if nDLCount < 600 then
						local nDrop = tDropNum[nTeamSize] * nMulti
						local nDiff = nDrop + nDLCount - 600
						if nDiff > 0 then
							nDrop = nDrop - nDiff
						end
						if GetFreeItemRoom() > 0 then
							AddItem(tItem[1],tItem[2],tItem[3],nDrop)
							CustomDataSave("tongcitywar_person_task", "dddd", nDLCount+nDrop, nSJCount, nJHCount, nSJCountView)
							if nDiff > 0 then
								Msg2Player("ChiÕm thµnh trong tuÇn b¹n ®· thu ®uîc 600 §Şch Binh Hé Gi¸p, kh«ng thÓ lÊy nhiÒu h¬n n÷a.")
							end
						end
					else
						Msg2Player("ChiÕm thµnh trong tuÇn b¹n ®· thu ®uîc 600 §Şch Binh Hé Gi¸p, kh«ng thÓ lÊy nhiÒu h¬n n÷a.")
					end
				end
			end
		end
	end
end

function map_task(npcName)
	local nTask1, _11, _12, nTask2, _21, _22, nDate = CustomDataRead("tongcitywar_person_map_task")
	if nTask1 == nil then
		return
	end
	local nNow = tonumber(date("%y%j"))
	if nNow > nDate then		-- ÇåÀíµô×òÌìµÄÈÎÎñ
		CustomDataSave("tongcitywar_person_map_task", "ddddddd", 0, 0, 0, 0, 0, 0, nNow)
		return
	end
	
	if npcName == "Thñ vÖ tr¹i ngùa" then
		if nTask1 == 1 and _11 == 0 then
			_11 = 1
			if _12 == 0 then
				Msg2Player("B¹n ®· tiªu diÖt Thñ vÖ tr¹i ngùa, cßn ph¶i tiªu diÖt Thñ vÖ kho l­¬ng míi cã thÓ hoµn thµnh nhiÖm vô nµy")
			else
				Msg2Player("B¹n ®· tiªu diÖt Thñ vÖ tr¹i ngùa")
			end
		end
	elseif npcName == "Thñ vÖ kho l­¬ng" then
		if nTask1 == 1 and _12 == 0 then
			_12 = 1
			if _11 == 0 then
				Msg2Player("B¹n ®· tiªu diÖt Thñ vÖ kho l­¬ng, cßn ph¶i tiªu diÖt Thñ vÖ tr¹i ngùa!")
			else
				Msg2Player("B¹n ®· tiªu diÖt Thñ vÖ kho l­¬ng")
			end
		end
	elseif npcName == "Thñ vÖ Kho¸ng tr­êng" then
		if nTask2 == 1 and _21 == 0 then
			_21 = 1
			if _22 == 0 then
				Msg2Player("B¹n ®· tiªu diÖt Thñ vÖ Kho¸ng tr­êng, cßn ph¶i tiªu diÖt Thñ vÖ Méc tr­êng!")
			else
				Msg2Player("B¹n ®· tiªu diÖt Thñ vÖ Kho¸ng tr­êng")
			end
		end
	elseif npcName == "Thñ vÖ Méc tr­êng" then
		if nTask2 == 1 and _22 == 0 then
			_22 = 1
			if _21 == 0 then
				Msg2Player("B¹n ®· tiªu diÖt Thñ vÖ Méc tr­êng, cßn ph¶i tiªu diÖt Thñ vÖ Kho¸ng tr­êng!")
			else
				Msg2Player("B¹n ®· tiªu diÖt Thñ vÖ Méc tr­êng")
			end
		end
	else
		return
	end
	
	CustomDataSave("tongcitywar_person_map_task", "ddddddd", nTask1,_11,_12,nTask2,_21,_22,nDate)
	if nTask1 == 1 and _11 == 1 and _12 == 1 and (npcName == "Thñ vÖ tr¹i ngùa" or npcName == "Thñ vÖ kho l­¬ng") then
		Msg2Player("B¹n ®· hoµn thµnh nhiÖm vô tiªu diÖt Thñ vÖ tr¹i ngùa vµ Thñ vÖ kho l­¬ng")
	elseif nTask2 == 1 and _21 == 1 and _22 == 1 and (npcName == "Thñ vÖ Kho¸ng tr­êng" or npcName == "Thñ vÖ Méc tr­êng") then
		Msg2Player("B¹n ®· hoµn thµnh nhiÖm vô tiªu diÖt Thñ vÖ Kho¸ng tr­êng vµ Thñ vÖ Méc tr­êng")
	end
end

function Enter_Map()
	RemoveTrigger(GetRunningTrigger())
	init_fight()
end

function Leave_Map()
	RemoveTrigger(GetRunningTrigger())
	uninit_fight()
end