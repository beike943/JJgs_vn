Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\viet_event\\nationality\\head.lua");

BHTA6_LOG_TITLE = "Bang Hoi Tinh Anh 6"
BHTA6_MAX_USE = 2400
BHTA6_MAX_USE_WEEK = 800
BHTA6_RECEIVE_EXP = 250000

tb_bhta6_weeks =
{
	[1] = 111010,
	[2] = 111017,
	[3] = 111024,
}

bhta6 =
{
	fileName = "data/bhta6.txt",
	count = 0,
	listFormat = "(.+)	(.+)",
	tList = {},
}

if strlower(strsub(getenv("os") or "",1,3)) == 'win' then
	bhta6.fileName = "data\\bhta6.txt"
else
	bhta6.fileName = "data/bhta6.txt"
end

function bhta6:load()
	local pf = openfile(self.fileName, "r")
	if not pf then 
		bhta6:save()
		return
	end
	
	local str =""	
	self.count  = 0
	self.tList = {}
	while 1 do
		str = read(pf, "*l")
		if not str then break end
		local _,_,szTongName, nVoted = strfind(str, self.listFormat)
		self.count = self.count + 1
		self.tList[self.count] = {tostring(szTongName), tonumber(nVoted)}
	end

	closefile(pf);
end

function bhta6:save()
	local pf = openfile(self.fileName, "w")
	if not pf then return end

	for i = 1, getn(self.tList) do
		write(pf, format("%s	%d\n", self.tList[i][1], self.tList[i][2]))
	end
	closefile(pf);
end

function bhta6:register()
	self:load()
	local szNation = get_nationality_name(GetGlbValue(GLB_TSK_SERVER_ID))
	tinsert(self.tList, {GetTongName(), 0})
	self:save()
	gf_WriteLogEx(BHTA6_LOG_TITLE, szNation.." - bang héi "..GetTongName().." ®¨ng ký thµnh c«ng")
	Talk(1,"","C¸c h¹ ®· ®¨ng ký thi ®Êu thµnh c«ng cho bang héi "..GetTongName())
	Msg2Player("§¨ng ký thi ®Êu thµnh c«ng cho bang héi "..GetTongName())
	AddGlobalNews("Chóc mõng ®¹i hiÖp <color=yellow>"..GetName().."<color> ®· b¸o danh <color=yellow>Bang Héi Tinh Anh lÇn 6<color> thµnh c«ng.")
end

function bhta6:vote(nID, nQuantity, nType)
	local szNation = get_nationality_name(GetGlbValue(GLB_TSK_SERVER_ID))
	local szTongName = self.tList[nID][1]
	self.tList[nID] = {szTongName, nQuantity}
	
	self:save()
	if nType == 1 then
		gf_WriteLogEx(BHTA6_LOG_TITLE, szNation.." - b×nh chän Hoa Hång PhÊn", nQuantity, szTongName)
	else
		gf_WriteLogEx(BHTA6_LOG_TITLE, szNation.." - b×nh chän Hoa Hång Vµng", nQuantity, szTongName)
	end
	Talk(1,"","Tæng ®iÓm b×nh chän cña bang héi "..szTongName.." hiÖn t¹i lµ:  "..nQuantity)
	Msg2Player("Tæng ®iÓm b×nh chän cña bang héi "..szTongName.." hiÖn t¹i lµ:  "..nQuantity)
end

function show_list5()
	bhta6:load()
	local szNation = get_nationality_name(GetGlbValue(GLB_TSK_SERVER_ID))
	local tSay = {}
	local szHeader = "<color=green>Long Hæ Sø<color>: §©y lµ kÕt qu¶ b×nh chän tÝnh ®Õn thêi ®iÓm hiÖn t¹i cña "..szNation..":"
	for i = 1, getn(bhta6.tList) do
		tinsert(tSay, bhta6.tList[i][1].." ("..bhta6.tList[i][2].." ®iÓm Hoa Hång)/do_nothing")
	end
	
	Say(szHeader, getn(tSay), tSay)
end

function requirement_check(nType)
	if nType == 1 then
		if IsTongMaster() == 0 then
			Talk(1,"","<color=green>Long Hæ Sø<color>: ChØ cã bang chñ míi ®­îc ®¨ng ký, h×nh nh­ c¸c h¹ hiÖn t¹i ch­a ph¶i lµ bang chñ.")
			return 0
		end
		if GetTongLevel() < 5 then
			Talk(1,"","<color=green>Long Hæ Sø<color>: Bang héi cña c¸c h¹ ch­a ®ñ ®¼ng cÊp ®Ó ®¨ng ký thi ®Êu, yªu cÇu ph¶i cã bang héi cÊp 5 trë lªn.")
			return 0
		end
		if gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) ~= GetGlbValue(GLB_TSK_SERVER_ID) then
			Talk(1,"","<color=green>Long Hæ Sø<color>: C¸c h¹ kh«ng ph¶i lµ ng­êi thuéc b¶n quèc, kh«ng thÓ ®¨ng ký thi ®Êu.")
			return 0
		end
		if IsRegisted() == 1 then
			Talk(1,"","<color=green>Long Hæ Sø<color>: Bang héi cña c¸c h¹ ®· ®¨ng ký thi ®Êu råi.")
			return 0
		end
		if GetPlayerRoute() == 0 then
			Talk(1,"","<color=green>Long Hæ Sø<color>: Bang Chñ ph¶i gia nhËp m«n ph¸i råi míi cã thÓ ®¨ng ký thi ®Êu.")
			return 0
		end
		if GetLevel() < 77 then
			Talk(1,"","<color=green>Long Hæ Sø<color>: Bang Chñ ph¶i cã ®¼ng cÊp 77 trë lªn míi ®­îc phÐp ®¨ng ký thi ®Êu.")
			return 0
		end
		if GetItemCount(2, 1, 537) < 48 then
			Talk(1,"","<color=green>Long Hæ Sø<color>: LÖ phÝ ®¨ng ký thi ®Êu lµ 48 Tö Kim Hång Bao (cã vµng), c¸c h¹ h×nh nh­ ch­a mang ®ñ trong ng­êi.")
			return 0
		end
	elseif nType == 2 then
--		if gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) ~= GetGlbValue(GLB_TSK_SERVER_ID) then
--			Talk(1,"","<color=green>Long Hæ Sø<color>: C¸c h¹ kh«ng ph¶i lµ ng­êi thuéc b¶n quèc, kh«ng thÓ tham gia b×nh chän.")
--			return 0
--		end
		if GetPlayerRoute() == 0 then
			Talk(1,"","<color=green>Long Hæ Sø<color>: C¸c h¹ ph¶i gia nhËp m«n ph¸i råi míi cã thÓ tham gia b×nh chän.")
			return 0
		end
		if GetLevel() < 77 then
			Talk(1,"","<color=green>Long Hæ Sø<color>: §¼ng cÊp 77 trë lªn míi ®­îc phÐp tham gia b×nh chän.")
			return 0
		end
	end
	return 1
end

function bhta6_register()
	bhta6:load()
	if requirement_check(1) == 0 then
		return
	end
	if DelItem(2, 1, 537, 48) == 1 then
		bhta6:register()
	end
end

function bhta6_vote()
	if requirement_check(2) == 0 then
		return
	end
	bhta6:load()
	local szNation = get_nationality_name(GetGlbValue(GLB_TSK_SERVER_ID))
	if bhta6.count == 0 then
		Talk(1,"","<color=green>Long Hæ Sø<color>: HiÖn t¹i ch­a cã bang héi nµo ®¨ng ký thi ®Êu t¹i "..szNation)
		return
	end
	local tSay = {}
	local szHeader = "<color=green>Long Hæ Sø<color>: C¸c h¹ h·y b×nh chän bang héi m×nh yªu thÝch b»ng c¸c lo¹i Hoa Hång. Hoa Hång dïng ®Ó b×nh chän cã thÓ kiÕm ®­îc th«ng qua hoµn thµnh nhiÖm vô Tµi Nguyªn ChiÕn, më Tói H¹t Gièng, trång c©y B¸t Nh· nhá, nhiÖm vô Vâ L©m Sø Gi¶, më r­¬ng S¸t Thñ §­êng vµ sö dông Ng«i Sao May M¾n."
	
	for i = 1, getn(bhta6.tList) do
		tinsert(tSay, format("Ta muèn b×nh chän cho bang héi %s/#bhta6_choose(%d)", tostring(bhta6.tList[i][1]), tonumber(i)))
	end
	
	tinsert(tSay, "Ta chØ ghÐ ngang/do_nothing")
	
	Say(szHeader, getn(tSay), tSay)
end

function bhta6_choose(nID)	
	local tSay = {}
	local szHeader = "<color=green>Long Hæ Sø<color>: C¸c h¹ muèn b×nh chän b»ng lo¹i hoa hång nµo?"
	
	tinsert(tSay, format("Dïng Hoa Hång PhÊn/#bhta6_confirm_vote(%d, 1)", nID))
	tinsert(tSay, format("Dïng Hoa Hång Vµng/#bhta6_confirm_vote(%d, 2)", nID))
	tinsert(tSay, "Ta chØ ghÐ ngang/do_nothing")
	
	Say(szHeader, getn(tSay), tSay)
end

function bhta6_confirm_vote(nID, nType)
	SetTaskTemp(TSK_TMP_BHTA6_VOTE, 0)
	SetTaskTemp(TSK_TMP_BHTA6_VOTE, GetTaskTemp(TSK_TMP_BHTA6_VOTE) + nType)
	SetTaskTemp(TSK_TMP_BHTA6_VOTE, GetTaskTemp(TSK_TMP_BHTA6_VOTE) + (nID * 10))
	AskClientForNumber("do_vote", 1, 999, "Sè Hoa Hång:")
end

function do_vote(nCount)
	local nDate = tonumber(date("%y%m%d"))
	if nDate > 111023 then
		Talk(1, "", "Thêi h¹n b×nh chän Bang Héi Tinh Anh 6 ®· hÕt!")
		return
	end
	if nCount == nil then
		return
	end
	local nQuantity = tonumber(nCount)
	if nQuantity < 1 or nQuantity > 999 then
		Talk(1, "", "Sè l­îng nhËp vµo kh«ng hîp lÖ, xin vui lßng nhËp l¹i!")
		return
	end
	bhta6:load()
	local nType = mod(GetTaskTemp(TSK_TMP_BHTA6_VOTE), 10)
	local nID = floor(GetTaskTemp(TSK_TMP_BHTA6_VOTE) / 10)
	SetTaskTemp(TSK_TMP_BHTA6_VOTE, 0)
	if nType == 1 then
		if GetItemCount(2, 0, 1164) < nCount then
			Talk(1,"","<color=green>Long Hæ Sø<color>: HiÖn c¸c h¹ kh«ng mang ®ñ Hoa Hång PhÊn ®Ó tham gia b×nh chän.")
			return
		end
		if DelItem(2, 0, 1164, nCount) == 1 then
			nCount = bhta6.tList[nID][2] + nCount
			bhta6:vote(nID, nCount, nType)
		end
	elseif nType == 2 then
		if GetItemCount(2, 1, 30255) < nCount then
			Talk(1,"","<color=green>Long Hæ Sø<color>: HiÖn c¸c h¹ kh«ng mang ®ñ Hoa Hång Vµng ®Ó tham gia b×nh chän.")
			return
		end
		if DelItem(2, 1, 30255, nCount) == 1 then
			bhta6_get_exp(nCount)
			local nWeekUse = mod(GetTask(TSK_BHTA6_2E8), 1000)
			if nWeekUse >= BHTA6_MAX_USE_WEEK then
				local nWasteCount = floor(GetTask(TSK_BHTA6_2E8) / 10000)
				if nWasteCount == 0 then
					nCount = bhta6.tList[nID][2] + (nCount * 15)
				else
					local nRemainCount = nCount - nWasteCount
					nCount = bhta6.tList[nID][2] + ((nWasteCount * 15) + (nRemainCount * 10))
				end
			else
					nCount = bhta6.tList[nID][2] + (nCount * 10)
			end
			bhta6:vote(nID, nCount, nType)
		end
	end
end

-- Sö dông hoa hång vµng file CNDSK
function UseYellowRose()
	AskClientForNumber("DoVoteYellow", 1, 999, "Sè Hoa Hång Vµng.")
end

--  TÝnh n¨ng sö dông  hoa hång vµng cho bang héi kh«ng tham gia ®¨ng ký cuéc chiÕn hoa hång
function DoVoteYellow(nCount)
	if CheckTongJoinRoseWar() ~= 1 then
		Talk(1,"","Quèc gia cña c¸c h¹ kh«ng ®­îc ®æi hoa hång vµng t¹i ®©y, h·y tham gia b×nh chän Bang Héi Tinh Anh 5 ë Long Hæ Sø!")
		return
	end
	local nQuantity = tonumber(nCount)
	if nQuantity < 1 or nQuantity > 999 then
		Talk(1, "", "Sè l­îng nhËp vµo kh«ng hîp lÖ, xin vui lßng nhËp l¹i!")
		return
	end
	if GetItemCount(2, 1, 30255) < nCount then
			Talk(1,""," HiÖn c¸c h¹ kh«ng mang ®ñ ".. nCount .." Hoa Hång Vµng ®Ó ®æi ®iÓm kinh nghiÖm.")
			return
	end
	
	local nYellowUsed = GetTask(TSK_BHTA6_6E8)
	if nYellowUsed >= BHTA6_MAX_USE then
		Msg2Player("C¸c h¹ ®· sö dông tíi giíi h¹n 600 triÖu ®iÓm kinh nghiÖm!")
		return 
	end
	
	if nYellowUsed + nCount > BHTA6_MAX_USE then
		Msg2Player("C¸c h¹ kh«ng thÓ nhËn nhiÒu h¬n 600 triÖu ®iÓm kinh nghiÖm. Xin vui lßng nhËp sè l­îng nhá h¬n!")
		return
	end
	
	if DelItem(2, 1, 30255, nCount) == 1 then
		GetExpOddServer(nCount)
	end
end

function bhta6_exchange_rose()
	AskClientForNumber("bhta6_confirm_exchange_rose", 1, 999, "Sè Hoa Hång Vµng:")
end

function bhta6_confirm_exchange_rose(nCount)
	if nCount == nil then
		return
	end
	local nQuantity = tonumber(nCount)
	if nQuantity < 1 or nQuantity > 999 then
		Talk(1, "", "Sè l­îng nhËp vµo kh«ng hîp lÖ, xin vui lßng nhËp l¹i!")
		return
	end
	if GetItemCount(2, 0, 1164) < nQuantity * 5 then
		Talk(1,"","<color=green>Long Hæ Sø<color>: HiÖn c¸c h¹ kh«ng mang ®ñ Hoa Hång PhÊn ®Ó ®æi.")
		return
	end
	if GetItemCount(2, 1, 30230) < nQuantity * 2 then
		Talk(1,"","<color=green>Long Hæ Sø<color>: HiÖn c¸c h¹ kh«ng mang ®ñ  Xu ®Ó ®æi.")
		return
	end
	if DelItem(2, 0, 1164, nQuantity * 5) == 1 and DelItem(2, 1, 30230, nQuantity * 2) == 1 then
		gf_AddItemEx2({2, 1, 30255, nQuantity}, "Hoa Hång Vµng", BHTA6_LOG_TITLE, "®æi hoa hång")
	end
end

function bhta6_exchange_rose2()
	AskClientForNumber("bhta6_confirm_exchange_rose2", 1, 999, "Sè Hoa Hång Vµng:")
end

function bhta6_confirm_exchange_rose2(nCount)
	if nCount == nil then
		return
	end
	local nQuantity = tonumber(nCount)
	if nQuantity < 1 or nQuantity > 999 then
		Talk(1, "", "Sè l­îng nhËp vµo kh«ng hîp lÖ, xin vui lßng nhËp l¹i!")
		return
	end
	if GetItemCount(2, 0, 1164) < (nQuantity * 5) then
		Talk(1,"","<color=green>Long Hæ Sø<color>: HiÖn c¸c h¹ kh«ng mang ®ñ Hoa Hång PhÊn ®Ó ®æi.")
		return
	end
	if GetCash() < (nQuantity * 70000)  then
		Talk(1,"","<color=green>Long Hæ Sø<color>: HiÖn c¸c h¹ kh«ng mang ®ñ  vµng ®Ó ®æi.")
		return
	end
	if DelItem(2, 0, 1164, nQuantity * 5) == 1 and Pay(nQuantity * 70000) == 1 then
		gf_AddItemEx2({2, 1, 30255, nQuantity}, "Hoa Hång Vµng", BHTA6_LOG_TITLE, "®æi hoa hång")
	end
end

function IsRegisted()
	bhta6:load()
	local szTongName = GetTongName()
	for i = 1, getn(bhta6.tList) do
		if szTongName == bhta6.tList[i][1] then
			return 1
		end
	end
	return 0
end

function bhta6_get_exp(nCount)
	local nWasteCount = floor(GetTask(TSK_BHTA6_2E8) / 10000)
	SetTask(TSK_BHTA6_2E8, GetTask(TSK_BHTA6_2E8) - (nWasteCount * 10000))	
	if GetTask(TSK_BHTA6_6E8) >= BHTA6_MAX_USE then
		Msg2Player("B¹n ®· sö dông tíi 600 triÖu ®iÓm kinh nghiÖm")
		return 
	end
	
	local nDate = tonumber(date("%y%m%d"))
	local nWeek = mod(floor(GetTask(TSK_BHTA6_2E8) / 1000), 10)
	local nGetCount = nCount
	
	if nDate < tb_bhta6_weeks[1] then
		if nWeek ~= 1 then
			SetTask(TSK_BHTA6_2E8, 1000)
		end
	elseif nDate < tb_bhta6_weeks[2] then
		if nWeek ~= 2 then
			SetTask(TSK_BHTA6_2E8, 2000)
		end
	elseif nDate < tb_bhta6_weeks[3] then
		if nWeek ~= 3 then
			SetTask(TSK_BHTA6_2E8, 3000)
		end
	end
	
	local nWeekUse = mod(GetTask(TSK_BHTA6_2E8), 1000)
	
	if nWeekUse >= BHTA6_MAX_USE_WEEK then
		Msg2Player("B¹n ®· sö dông tíi 200 triÖu ®iÓm kinh nghiÖm trong tuÇn")
		return 
	end
	
	local nExp = BHTA6_RECEIVE_EXP * nCount
	if nExp + (nWeekUse * BHTA6_RECEIVE_EXP) > 200000000 then
		nExp = 200000000 - (nWeekUse * BHTA6_RECEIVE_EXP)
		nGetCount = floor(nExp / BHTA6_RECEIVE_EXP)
		nWasteCount = nCount - nGetCount
	end
	
	-- L­u gi¸ trÞ sö dông Hoa Hång Vµng
	SetTask(TSK_BHTA6_2E8, GetTask(TSK_BHTA6_2E8) + nGetCount)
	SetTask(TSK_BHTA6_6E8, GetTask(TSK_BHTA6_6E8) + nGetCount)
	SetTask(TSK_BHTA6_2E8, GetTask(TSK_BHTA6_2E8) + (nWasteCount * 10000))
	ModifyExp(nExp)
	Msg2Player("B¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm")
	gf_WriteLogEx(BHTA6_LOG_TITLE, "b×nh chän b»ng Hoa Hång Vµng nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm")
end

--  KiÓm tra bang héi kh«ng tham gia cuéc chiÕn hoa hång
function CheckTongJoinRoseWar()
	local tbServerBHTA6 =
	{
		22, 23, 24, 55, 60,
	}
	
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local nNationality = gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR)
	
	for i = 1, getn( tbServerBHTA6) do
		if nNation ==  tbServerBHTA6[i] and nNationality == tbServerBHTA6[i] then
			return 1
		end
	end
	return 0
end

function GetExpOddServer(nCount)
	local nYellowUsed = GetTask(TSK_BHTA6_6E8)
	local nRemain = BHTA6_MAX_USE - (nYellowUsed + nCount)
	local nExp = BHTA6_RECEIVE_EXP * nCount
	-- L­u gi¸ trÞ sö dông Hoa Hång Vµng
	SetTask(TSK_BHTA6_6E8, GetTask(TSK_BHTA6_6E8) + nCount)
	ModifyExp(nExp)
	Msg2Player("B¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm. Cßn tiÕp tôc sö dông ®­îc "..nRemain.." Hoa Hång Vµng.")
	gf_WriteLogEx(BHTA6_LOG_TITLE, "b×nh chän b»ng Hoa Hång Vµng nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm ë server kh«ng tham gia")
end

function do_nothing()

end
