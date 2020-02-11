Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\viet_event\\nationality\\head.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua");

BHTA4_LOG_TITLE = "Bang Hoi Tinh Anh 4"

bhta4 =
{
	fileName = "data/bhta4.txt",
	count = 0,
	listFormat = "(.+)	(.+)",
	tList = {},
}

if strlower(strsub(getenv("os") or "",1,3)) == 'win' then
	bhta4.fileName = "data\\bhta4.txt"
else
	bhta4.fileName = "data/bhta4.txt"
end

function bhta4:load()
	local pf = openfile(self.fileName, "r")
	if not pf then 
		bhta4:save()
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

function bhta4:save()
	local pf = openfile(self.fileName, "w")
	if not pf then return end

	for i = 1, getn(self.tList) do
		write(pf, format("%s	%d\n", self.tList[i][1], self.tList[i][2]))
	end
	closefile(pf);
end

function bhta4:register()
	self:load()
	local szNation = get_nationality_name(GetGlbValue(GLB_TSK_SERVER_ID))
	tinsert(self.tList, {GetTongName(), 0})
	self:save()
	gf_WriteLogEx(BHTA4_LOG_TITLE, szNation.." - bang héi "..GetTongName().." ®¨ng ký thµnh c«ng")
	Talk(1,"","C¸c h¹ ®· ®¨ng ký thi ®Êu thµnh c«ng cho bang héi "..GetTongName())
	Msg2Player("§¨ng ký thi ®Êu thµnh c«ng cho bang héi "..GetTongName())
	AddGlobalNews("Chóc mõng ®¹i hiÖp <color=yellow>"..GetName().."<color> ®· b¸o danh <color=yellow>Bang Héi Tinh Anh lÇn 4<color> thµnh c«ng.")
end

function bhta4:vote(nID, nQuantity, nType)
	local szNation = get_nationality_name(GetGlbValue(GLB_TSK_SERVER_ID))
	local szTongName = self.tList[nID][1]
	self.tList[nID] = {szTongName, nQuantity}
	
	self:save()
	if nType == 1 then
		gf_WriteLogEx(BHTA4_LOG_TITLE, szNation.." - b×nh chän Hoa Hång §á", nQuantity, szTongName)
	else
		gf_WriteLogEx(BHTA4_LOG_TITLE, szNation.." - b×nh chän Hoa Hång PhÊn", nQuantity, szTongName)
	end
	Talk(1,"","C¸c h¹ ®· b×nh chän "..nQuantity.." ®iÓm Hoa Hång cho bang héi "..szTongName)
	Msg2Player("B×nh chän "..nQuantity.." ®iÓm Hoa Hång cho bang héi "..szTongName)
end

function show_list()
	bhta4:load()
	local szNation = get_nationality_name(GetGlbValue(GLB_TSK_SERVER_ID))
	local tSay = {}
	local szHeader = "<color=green>Long Hæ Sø<color>: §©y lµ kÕt qu¶ b×nh chän tÝnh ®Õn thêi ®iÓm hiÖn t¹i cña "..szNation..":"
	for i = 1, getn(bhta4.tList) do
		tinsert(tSay, bhta4.tList[i][1].." ("..bhta4.tList[i][2].." ®iÓm Hoa Hång)/do_nothing")
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
			Talk(1,"","<color=green>Long Hæ Sø<color>: C¸c h¹ ph¶i gia nhËp m«n ph¸i råi míi cã thÓ ®¨ng ký thi ®Êu.")
			return 0
		end
		if GetLevel() < 77 then
			Talk(1,"","<color=green>Long Hæ Sø<color>: §¼ng cÊp 77 trë lªn míi ®­îc phÐp ®¨ng ký thi ®Êu.")
			return 0
		end
		if GetItemCount(2, 1, 537) < 48 then
			Talk(1,"","<color=green>Long Hæ Sø<color>: LÖ phÝ ®¨ng ký thi ®Êu lµ 48 Tö Kim Hång Bao (cã vµng), c¸c h¹ h×nh nh­ ch­a mang ®ñ trong ng­êi.")
			return 0
		end
	elseif nType == 2 then
		if gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) ~= GetGlbValue(GLB_TSK_SERVER_ID) then
			Talk(1,"","<color=green>Long Hæ Sø<color>: C¸c h¹ kh«ng ph¶i lµ ng­êi thuéc b¶n quèc, kh«ng thÓ tham gia b×nh chän.")
			return 0
		end
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

function bhta4_register()
	bhta4:load()
	if requirement_check(1) == 0 then
		return
	end
	if DelItem(2, 1, 537, 48) == 1 then
		bhta4:register()
	end
end

function bhta4_vote()
	if requirement_check(2) == 0 then
		return
	end
	bhta4:load()
	local szNation = get_nationality_name(GetGlbValue(GLB_TSK_SERVER_ID))
	if bhta4.count == 0 then
		Talk(1,"","<color=green>Long Hæ Sø<color>: HiÖn t¹i ch­a cã bang héi nµo ®¨ng ký thi ®Êu t¹i "..szNation)
		return
	end
	local tSay = {}
	local szHeader = "<color=green>Long Hæ Sø<color>: C¸c h¹ h·y b×nh chän bang héi m×nh yªu thÝch b»ng c¸c lo¹i Hoa Hång. Hoa Hång dïng ®Ó b×nh chän cã thÓ kiÕm ®­îc th«ng qua hoµn thµnh nhiÖm vô Tµi Nguyªn ChiÕn, më Tói H¹t Gièng, trång c©y B¸t Nh· nhá vµ sö dông N÷ Oa B¶o H¹p."
	
	for i = 1, getn(bhta4.tList) do
		tinsert(tSay, format("Ta muèn b×nh chän cho bang héi %s/#bhta4_choose(%d)", tostring(bhta4.tList[i][1]), tonumber(i)))
	end
	
	tinsert(tSay, "Ta chØ ghÐ ngang/do_nothing")
	
	Say(szHeader, getn(tSay), tSay)
end

function bhta4_choose(nID)	
	local tSay = {}
	local szHeader = "<color=green>Long Hæ Sø<color>: C¸c h¹ muèn b×nh chän b»ng lo¹i hoa hång nµo?"
	
	tinsert(tSay, format("Dïng Hoa Hång §á/#bhta4_confirm_vote(%d, 1)", nID))
	tinsert(tSay, format("Dïng Hoa Hång PhÊn/#bhta4_confirm_vote(%d, 2)", nID))
	tinsert(tSay, "Ta chØ ghÐ ngang/do_nothing")
	
	Say(szHeader, getn(tSay), tSay)
end

function bhta4_confirm_vote(nID, nType)
	SetTaskTemp(TSK_TMP_BHTA4_VOTE, 0)
	SetTaskTemp(TSK_TMP_BHTA4_VOTE, GetTaskTemp(TSK_TMP_BHTA4_VOTE) + nType)
	SetTaskTemp(TSK_TMP_BHTA4_VOTE, GetTaskTemp(TSK_TMP_BHTA4_VOTE) + (nID * 10))
	AskClientForNumber("do_vote", 1, 999, "Sè Hoa Hång:")
end

function do_vote(nCount)
	if nCount == nil then
		return
	end
	local nQuantity = tonumber(nCount)
	if nQuantity < 1 or nQuantity > 999 then
		Talk(1, "", "Sè l­îng nhËp vµo kh«ng hîp lÖ, xin vui lßng nhËp l¹i!")
		return
	end
	bhta4:load()
	local nType = mod(GetTaskTemp(TSK_TMP_BHTA4_VOTE), 10)
	local nID = floor(GetTaskTemp(TSK_TMP_BHTA4_VOTE) / 10)
	SetTaskTemp(TSK_TMP_BHTA4_VOTE, 0)
	if nType == 1 then
		if GetItemCount(2, 0, 1162) < nCount then
			Talk(1,"","<color=green>Long Hæ Sø<color>: HiÖn c¸c h¹ kh«ng mang ®ñ Hoa Hång ®á ®Ó tham gia b×nh chän.")
			return
		end
		if DelItem(2, 0, 1162, nCount) == 1 then
			nCount = bhta4.tList[nID][2] + nCount
			bhta4:vote(nID, nCount, nType)
		end
	elseif nType == 2 then
		if GetItemCount(2, 0, 1164) < nCount then
			Talk(1,"","<color=green>Long Hæ Sø<color>: HiÖn c¸c h¹ kh«ng mang ®ñ Hoa Hång phÊn ®Ó tham gia b×nh chän.")
			return
		end
		if DelItem(2, 0, 1164, nCount) == 1 then
			nCount = bhta4.tList[nID][2] + (nCount * 10)
			bhta4:vote(nID, nCount, nType)
		end
	end
end

function bhta4_exchange_rose()
	AskClientForNumber("bhta4_confirm_exchange_rose", 1, 999, "Sè Hoa Hång PhÊn:")
end

function bhta4_confirm_exchange_rose(nCount)
	if nCount == nil then
		return
	end
	local nQuantity = tonumber(nCount)
	if nQuantity < 1 or nQuantity > 999 then
		Talk(1, "", "Sè l­îng nhËp vµo kh«ng hîp lÖ, xin vui lßng nhËp l¹i!")
		return
	end
	if GetItemCount(2, 0, 1162) < nQuantity * 5 then
		Talk(1,"","<color=green>Long Hæ Sø<color>: HiÖn c¸c h¹ kh«ng mang ®ñ Hoa Hång ®á ®Ó ®æi.")
		return
	end
	if GetItemCount(2, 1, 30230) < nQuantity * 2 then
		Talk(1,"","<color=green>Long Hæ Sø<color>: HiÖn c¸c h¹ kh«ng mang ®ñ  Xu ®Ó ®æi.")
		return
	end
	if DelItem(2, 0, 1162, nQuantity * 5) == 1 and DelItem(2, 1, 30230, nQuantity * 2) == 1 then
		gf_AddItemEx2({2, 0, 1164, nQuantity}, "Hoa Hång phÊn", BHTA4_LOG_TITLE, "®æi hoa hång")
	end
end

function IsRegisted()
	bhta4:load()
	local szTongName = GetTongName()
	for i = 1, getn(bhta4.tList) do
		if szTongName == bhta4.tList[i][1] then
			return 1
		end
	end
	return 0
end

function do_nothing()

end