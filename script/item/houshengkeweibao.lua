Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\faction\\faction_equipment.lua");

--=========================================================================================
MAX_SEL_PER_PAGE = 5;	--一页最大显示数量
g_szPacketName = "后生可畏包";	--包的名字
g_nNeedRoom = 4;
g_nNeedWeight = 400;	
g_tbItem = 
{		--	ID1,ID2,ID3,名字,选项描述
	[1]  = {0,2,2500,"青犊剑","青犊剑(峨眉佛家，武当道家)"},
	[2]  = {0,5,2500,"青犊棍","青犊棍(丐帮污衣，少林俗家)"},
	[3]  = {0,0,2500,"青犊手","青犊手(少林武宗，丐帮净衣)"},
	[4]  = {0,1,2500,"青犊针","青犊针(唐门)"},
	[5]  = {0,3,2500,"青犊刀","青犊刀(少林俗家)"},
	[6]  = {0,8,2500,"青犊杖","青犊杖(少林禅宗)"},
	[7]  = {0,10,2500,"青犊琴","青犊琴(峨眉俗家)"},
	[8]  = {0,9,2500,"青犊笔","青犊笔(武当俗家)"},
	[9]  = {0,6,2500,"青犊枪","青犊枪(杨门枪骑)"},
	[10]  = {0,4,2500,"青犊弓","青犊弓(杨门弓骑)"},
	[11]  = {0,7,2500,"青犊刃","青犊刃(五毒邪侠)"},
	[12]  = {0,11,2500,"青犊爪","青犊爪(五毒蛊师)"},
}
--=========以下代码无须改动================================================================
function OnUse(nItemIdx)
	list_item(1,getn(g_tbItem),nItemIdx);
end;

function list_item(nPageNum,nRecordCount,nItemIdx)
	local tbItemTab = get_item_list(nItemIdx);
	local GetMaxItemCountPerPage = function(nPN,nRC)	--这个函数是用来获得当前页数的最大显示项目数的
		local nCount = nRC-(nPN-1)*MAX_SEL_PER_PAGE;
		if nCount >= MAX_SEL_PER_PAGE then
			return MAX_SEL_PER_PAGE
		else
			return mod(nCount,MAX_SEL_PER_PAGE);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nRecordCount);
	local nCurStartIndex = (nPageNum-1)*MAX_SEL_PER_PAGE+1;
	local selTab = {};
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,tbItemTab[i]);
	end;
	if nPageNum ~= 1 then
		tinsert(selTab,format("\n上一页/#list_item(%d,%d,%d)",nPageNum-1,nRecordCount,nItemIdx));
	end;
	if nPageNum ~= ceil(nRecordCount/MAX_SEL_PER_PAGE) then
		tinsert(selTab,format("\n下一页/#list_item(%d,%d,%d)",nPageNum+1,nRecordCount,nItemIdx));	
	end;
	tinsert(selTab,"\n关闭");
	Say("您想要打开<color=yellow>"..g_szPacketName.."<color>吗?选择您需要的武器",getn(selTab),selTab);
end

function get_item_list(nItemIdx)
	local tSelTab = {};
	for i=1,getn(g_tbItem) do
		tinsert(tSelTab,format(g_tbItem[i][5].."/#add_item(%d,%d)",i,nItemIdx));
	end;
	return tSelTab;
end;

function add_item(nIdx,nItemIdx)
	local selTab = {
				format("同意/#add_item_confirm(%d,%d)",nIdx,nItemIdx),
				"再想想/nothing",
				}
	Say("您想要选择<color=yellow>"..g_tbItem[nIdx][4].."<color>这个武器吗？",getn(selTab),selTab);
end;

function add_item_confirm(nIdx,nItemIdx)
	if gf_JudgeRoomWeight(g_nNeedRoom,g_nNeedWeight) == 0 then
		Talk(1,"","没有足够的背包空间或负重力，请调整后再从新打开"..g_szPacketName.."!");
		return 0;
	end;
	local nRetCode = 0;
	if DelItemByIndex(nItemIdx,1) == 1 then
		give_equip(nIdx);
		WriteLog("["..g_szPacketName.."]:"..GetName().."打开1袋");
	end;
end;

function give_equip(nIdx)
	local nBody = GetBody();
	local nRetCode = 0;
	nRetCode = AddItem(0,103,2500+nBody-1,1,1,-1,-1,-1,-1,-1,-1,0,6);
	if nRetCode == 1 then
		Msg2Player("你获得一件青犊帽");
	else
		WriteLog("["..g_szPacketName.."错误]:"..GetName().."Nh薾 Thanh чc M筼 c? l鏸, nRetCode:"..nRetCode)
	end;
	nRetCode = AddItem(0,100,2500+nBody-1,1,1,-1,-1,-1,-1,-1,-1,0,6);
	if nRetCode == 1 then
		Msg2Player("你获得一件青犊衣");
	else
		WriteLog("["..g_szPacketName.."错误]:"..GetName().."Nh薾 Thanh чc Y c? l鏸, nRetCode:"..nRetCode)
	end;
	nRetCode = AddItem(0,101,2500+nBody-1,1,1,-1,-1,-1,-1,-1,-1,0,6);
	if nRetCode == 1 then
		Msg2Player("你获得一件青犊装");
	else
		WriteLog("["..g_szPacketName.."错误]:"..GetName().."Nh薾 頲 Thanh чc Trang c? l鏸, nRetCode:"..nRetCode)
	end;
	nRetCode = AddItem(g_tbItem[nIdx][1],g_tbItem[nIdx][2],g_tbItem[nIdx][3],1,1,-1,-1,-1,-1,-1,-1,0,6)
	if nRetCode == 1 then
		Msg2Player("你获得"..g_tbItem[nIdx][4]);
	else
		WriteLog("["..g_szPacketName.."错误]:"..GetName().."获取"..g_tbItem[nIdx][4].."c? l鏸, nRetCode:"..nRetCode)
	end;
end;
