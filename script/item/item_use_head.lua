--½Å±¾¹¦ÄÜ£º½£Íø2Ô½ÄÏ°æÎïÆ·Ê¹ÓÃ²¿·Ö¹¦ÄÜÍ³Ò»´¦Àí
--¹¦ÄÜÉè¼Æ£º´å³¤
--¹¦ÄÜ¿ª·¢£º´å³¤
--¿ª·¢Ê±¼ä£º2011-4-19
--ÐÞ¸Ä¼ÇÂ¼£º
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\class\\ktabfile.lua")
--Êý¾Ý¶ÁÈ¡
SZ_INI_FILE_WAY="\\settings\\item\\item_use_add.ini"
g_objItemUseRule = ff_GetIniFileObj(SZ_INI_FILE_WAY)
if g_objItemUseRule:Open() ~= 1 then
	gf_WriteLog("SystemError","load ini file error! file path:"..SZ_INI_FILE_WAY)
end
SkeyMain ="MainInfo"
SkeyItemInfo ="tItemInfo"
tPrizeName = g_objItemUseRule:GetTable(SkeyMain,"tPrizeName")
--ÁÙÊ±ÈÎÎñ±äÁ¿¶¨Òå
nTaskTempId_UseItem1 = 247
nTaskTempId_UseItem2 = 248
--¹«¹²±äÁ¿¶¨Òå
sClew = "<color=green>Nh¾c nhë<color>: sö dông 1 <color=green>%s<color> cã thÓ nhËn ®­îc"
sUseDtmAsk = "X¸c ®Þnh sö dông %s?"
sUseDtmSel = "Sö dông %s/use_dtm"
sOutDiaSel = "§Ó ta nghÜ l¹i/no"
sUseNumInput = "Sö dông bao nhiªu %s?"
--===¹«¹²Âß¼­
function OnUse(nItemIndex)
	local nItemSeq,tItemInfo = 0,{}
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIndex)
	for j = 1,1000 do
		tItemInfo = g_objItemUseRule:GetMixTable(SkeyMain,SkeyItemInfo..tostring(j))
		if tItemInfo == nil then
			break
		elseif tItemInfo[1][1] == nGenre and tItemInfo[1][2] == nDetail and tItemInfo[1][3] == nParticular then
			nItemSeq = j
			break
		end
	end
	if nItemSeq == 0 then
		return
	end
	SetTaskTemp(nTaskTempId_UseItem1,nItemSeq)
	SetTaskTemp(nTaskTempId_UseItem2,nItemIndex)
	local sSayMain = ""
	if tItemInfo[3] == nil then
		sSayMain = "<color=green>"..tItemInfo[2][2]..tPrizeName[tItemInfo[2][1]][1]..tPrizeName[tItemInfo[2][1]][2].."<color>."
	else
		dostring("return "..tItemInfo[3][1].."()")
	end
	local tUseItemSay = {
		format(sClew..sSayMain,tItemInfo[1][4]),
		format(sUseDtmAsk,tItemInfo[1][4]),
		format(sUseDtmSel,tItemInfo[1][4]),
		sOutDiaSel
	}
	Say(tUseItemSay[1]..tUseItemSay[2],2,tUseItemSay[3],tUseItemSay[4])
end
--ÊýÁ¿ÊäÈë
function use_dtm()
	local tItemInfo = get_item_info()
	local nItemCount = GetItemCount(tItemInfo[1][1],tItemInfo[1][2],tItemInfo[1][3])
	if nItemCount <= 0 then
		return
	elseif nItemCount == 1 then
		use_deal(1)
	else
		AskClientForNumber("use_deal", 1,nItemCount, format("Sö dông bao nhiªu %s?",tItemInfo[1][4]))
	end
end
--Ê¹ÓÃ´¦Àí
function use_deal(nItemNum)
	local nItemSeq = GetTaskTemp(nTaskTempId_UseItem1)
	local tItemInfo = get_item_info()
	if nItemNum == 1 then
		local nItemIndex = GetTaskTemp(nTaskTempId_UseItem2)
		if DelItemByIndex(nItemIndex,1) == 1 then
			gf_EventGiveCustomAward(tItemInfo[2][1],(tItemInfo[2][2]*nItemNum),1,"Sö dông vËt phÈm",tItemInfo[1][4].."x"..nItemNum)
		end
	elseif DelItem(tItemInfo[1][1],tItemInfo[1][2],tItemInfo[1][3],nItemNum) == 1 then
		gf_EventGiveCustomAward(tItemInfo[2][1],(tItemInfo[2][2]*nItemNum),1,"Sö dông vËt phÈm",tItemInfo[1][4].."x"..nItemNum)
	end
end
--»ñÈ¡ÎïÆ·¶ÔÓ¦ÐÅÏ¢
function get_item_info()
	local nItemSeq = GetTaskTemp(nTaskTempId_UseItem1)
	return g_objItemUseRule:GetMixTable(SkeyMain,SkeyItemInfo..tostring(nItemSeq))
end
function no()
end
