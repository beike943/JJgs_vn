--脚本功能：剑网2越南版物品使用部分功能统一处理
--功能设计：村长
--功能开发：村长
--开发时间：2011-4-19
--修改记录：
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\class\\ktabfile.lua")
--数据读取
SZ_INI_FILE_WAY="\\settings\\item\\item_use_add.ini"
g_objItemUseRule = ff_GetIniFileObj(SZ_INI_FILE_WAY)
if g_objItemUseRule:Open() ~= 1 then
	gf_WriteLog("SystemError","load ini file error! file path:"..SZ_INI_FILE_WAY)
end
SkeyMain ="MainInfo"
SkeyItemInfo ="tItemInfo"
tPrizeName = g_objItemUseRule:GetTable(SkeyMain,"tPrizeName")
--临时任务变量定义
nTaskTempId_UseItem1 = 247
nTaskTempId_UseItem2 = 248
--公共变量定义
sClew = "<color=green>提示<color>:使用1个<color=green>%s<color>可以得到"
sUseDtmAsk = "确定使用%s?"
sUseDtmSel = "使用%s/use_dtm"
sOutDiaSel = "让我想想/no"
sUseNumInput = "使用多少个%s?"
--===公共逻辑
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
--数量输入
function use_dtm()
	local tItemInfo = get_item_info()
	local nItemCount = GetItemCount(tItemInfo[1][1],tItemInfo[1][2],tItemInfo[1][3])
	if nItemCount <= 0 then
		return
	elseif nItemCount == 1 then
		use_deal(1)
	else
		AskClientForNumber("use_deal", 1,nItemCount, format("使用多少个 %s?",tItemInfo[1][4]))
	end
end
--使用处理
function use_deal(nItemNum)
	local nItemSeq = GetTaskTemp(nTaskTempId_UseItem1)
	local tItemInfo = get_item_info()
	if nItemNum == 1 then
		local nItemIndex = GetTaskTemp(nTaskTempId_UseItem2)
		if DelItemByIndex(nItemIndex,1) == 1 then
			gf_EventGiveCustomAward(tItemInfo[2][1],(tItemInfo[2][2]*nItemNum),1,"使用物品",tItemInfo[1][4].."x"..nItemNum)
		end
	elseif DelItem(tItemInfo[1][1],tItemInfo[1][2],tItemInfo[1][3],nItemNum) == 1 then
		gf_EventGiveCustomAward(tItemInfo[2][1],(tItemInfo[2][2]*nItemNum),1,"使用物品",tItemInfo[1][4].."x"..nItemNum)
	end
end
--获取物品对应信息
function get_item_info()
	local nItemSeq = GetTaskTemp(nTaskTempId_UseItem1)
	return g_objItemUseRule:GetMixTable(SkeyMain,SkeyItemInfo..tostring(nItemSeq))
end
function no()
end
