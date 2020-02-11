-- Function to read/write data into text file
-- Created by Chimc
-- Created date 07/06/2012
Include("\\script\\lib\\globalfunctions.lua");

LIB_Award = {
	szLogTitle = "",
	szLogAction = "",
}


---------------------- Award
--tbAwardTemplate = {
--	nFail = 1
--	item = {
--			{gdp = {g1, d1, p1, nCount}, nExpired = 7*24*60*60, nDinhhon = 1, name="item name"} 
--			{gpd = {g2,d2,p2, nCount}},
--	},
--	task = {{TaskID, nValue}, {TaskID, nValue}},
--	nChankhi = 10,
--	nQuancong = 1000,
--	nDanhvong = 10,
--	nExp = 1000000,
--	nSumon = 5,
--	nGold = 1000000,
--}
function LIB_Award:Award(tbAwardList)
--	local nResult = 0
	-- Award Kinh Nghiem
	if type(tbAwardList["nExp"])=="number" then
		if  tbAwardList["nExp"] > (2000000000 - GetExp()) then
			Talk(1,"", "§iÓm kinh nghiÖm cã thÓ v­ît qu¸ 2 tû, c¸c h¹ h·y sö dông bít kinh nghiÖm ®ang cã ®Ó nhËn thªm")
			return 0
		end
		ModifyExp(tbAwardList["nExp"])
		Msg2Player("§iÓm kinh nghiÖm t¨ng thªm " .. tbAwardList["nExp"] .. ".")
		if self.szLogTitle ~= "" then
			gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nExp"], "Kinh nghiÖm")
		end
	end
	-- Award Item
	if type(tbAwardList["item"])=="table" then
		local tbItemSet = tbAwardList["item"]
		for i=1,getn(tbItemSet) do
			-- AddItem
			local nRet, nItemIdx = 0, 0
			if getn(tbItemSet[i]["gdp"])>3 then
				local tbItem = {0, 0, 0, 1, 1, -1, -1, -1, -1, -1, -1, -1, 0, 0}
				for j=1,14 do
					tbItem[j] = tbItemSet[i]["gdp"][j] or tbItem[j]
				end
				nRet, nItemIdx = AddItem(tbItem[1], tbItem[2], tbItem[3], tbItem[4], tbItem[5], tbItem[6], tbItem[7], tbItem[8], tbItem[9], tbItem[10], tbItem[11], tbItem[12], tbItem[13], tbItem[14]);
			end
			
			if nRet == 1 then
				--Talk(1,"","Item name: " .. tbItemSet[i]["name"])
				--Talk(1,"","Log Title: " .. self.szLogTitle)
				Msg2Player("B¹n nhËn ®­îc " .. tbItemSet[i]["gdp"][4] .. " " .. tbItemSet[i]["name"] .. ".")
				-- WriteLog
				if self.szLogTitle ~= "" then
					gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbItemSet[i]["gdp"][4], tbItemSet[i]["name"])
				end
				
				-- Set Expired date
				if type(tbItemSet[i]["nExpired"])=="number" then
					SetItemExpireTime(nItemIdx, tbItemSet[i]["nExpired"])
				end
				-- Set dinh hon
				if type(tbItemSet[i]["nDinhhon"])=="number" then
					Msg2Player("Set dinh hon: -- " .. tbItemSet[i]["nDinhhon"])
					if tbItemSet[i]["nDinhhon"] == 7 then
						SetItemSpecialAttr(nItemIdx, "DING7", 1)
					else
						SetItemSpecialAttr(nItemIdx, "DING10", 1)
					end
				end
			end
		end
	end
-- Award Task
	if type(tbAwardList["task"])=="table" then
		local tbTaskSet = tbAwardList["task"]
		for i=1,getn(tbTaskSet) do
			SetTask(tbTaskSet[i][1], GetTask(tbTaskSet[i][1]) + tbTaskSet[i][2])
			if type(tbTaskSet[i][3]) == "string" then
				Msg2Player(tbTaskSet[i][3] .. " t¨ng thªm " .. tbTaskSet[i][2] .. ".")
			end
			if self.szLogTitle ~= "" then
				gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbTaskSet[i][2], "Task " .. tbTaskSet[i][1])
			end
		end
	end
-- Award Chan Khi
	if type(tbAwardList["nChankhi"])=="number" then
		if MeridianGetLevel()>0 then
			local nRet = AwardGenuineQi(tbAwardList["nChankhi"])
			if self.szLogTitle ~= "" and nRet == 1 then
				gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nChaznkhi"], "Ch©n khÝ")
			end
		end
	end
-- Award Quan Cong
	if type(tbAwardList["nQuancong"])=="number" then
		if GetTask(701) ~= 0 then
			if GetTask(701) > 0 then
				SetTask(701, GetTask(701) + tbAwardList["nQuancong"])
			elseif GetTask(701) < 0 then
				SetTask(701, GetTask(701) - tbAwardList["nQuancong"])
			end
			Msg2Player("§iÓm c«ng tr¹ng t¨ng thªm " .. tbAwardList["nQuancong"] .. ".")
			if self.szLogTitle ~= "" then
				gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nQuancong"], "Qu©n c«ng")
			end
		end
	end
-- Award Danh Vong
	if type(tbAwardList["nDanhvong"])=="number" then
		ModifyReputation(tbAwardList["nDanhvong"], 0)
		if self.szLogTitle ~= "" then
			gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nDanhvong"], "Danh väng")
		end
	end
-- Award Su Mon
	if type(tbAwardList["nSumon"])=="number" then
		SetTask(336, GetTask(336) + tbAwardList["nSumon"])
		Msg2Player("§iÓm s­ m«n t¨ng thªm " .. tbAwardList["nSumon"] .. ".")
		if self.szLogTitle ~= "" then
			gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nSumon"], "S­ m«n")
		end
	end
-- Award Gold
	if type(tbAwardList["nGold"])=="number" then
		Earn(tbAwardList["nGold"])
		if self.szLogTitle ~= "" then
			gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nGold"], "Ng©n l­îng")
		end
	end
	return 1
end


function LIB_Award:Punish(tbPunishList)
	-- Punish Item
	if type(tbPunishList["item"])=="table" then
		local tbItemSet = tbPunishList["item"]
		for i=1,getn(tbItemSet) do
			DelItem(tbItemSet[i]["gdp"][1], tbItemSet[i]["gdp"][2], tbItemSet[i]["gdp"][3], tbItemSet[i]["gdp"][4])
			Msg2Player("B¹n bÞ mÊt " .. tbItemSet[i]["gdp"][4] .. " " .. tbItemSet[i]["name"])
			gf_WriteLogEx(self.szLogTitle.." FAIL", "mÊt", tbItemSet[i]["gdp"][4], tbItemSet[i]["name"])
		end
	end
	return 1
end

-------------------- Award by rate
--	tbTemplate = {
--							[1] = {[1] = {Set1}, nRate},
--							[2] = {[1] = {Set2}, nRate},
--						}
function LIB_Award:AwardByRate(tbItemSet)
	if tbItemSet == nil then
		return 0
	end
	local nRateTotal = 10000000
	local nRandom = random(1, nRateTotal)
	local nStep=0
	for i=1, getn(tbItemSet) do
		nStep = nStep + floor(tbItemSet[i]["nRate"] * nRateTotal/100);
		if(nRandom <= nStep) then
			return self:Award(tbItemSet[i][1])
		end
	end
end


function LIB_Award:AwardByBody(tbItemSet)
	if tbItemSet == nil then
		return 0
	end
	local nBody = GetBody()
	return self:Award(tbItemSet[nBody])
end


function LIB_Award:AwardByRoute(tbItemSet)
	if tbItemSet == nil then
		return 0
	end
	local nRoute = GetPlayerRoute()
	return self:Award(tbItemSet[nRoute])
end


--	tbTemplate = {
--							[1] = {{Set1}, nRate},
--							[2] = {{Set2}, nRate},
--						}
function LIB_Award:GetValueByRate(tbValue)
	if tbValue == nil then
		return 0
	end
	local nRateTotal = 10000000
	local nRandom = random(1, nRateTotal)
	local nStep=0
	for i=1, getn(tbValue) do
		nStep = nStep + floor(tbValue[i]["nRate"] * nRateTotal/100);
		if(nRandom <= nStep) then
			return tbValue[i][1]
		end
	end
end