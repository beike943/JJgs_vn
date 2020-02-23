Include("\\script\\lib\\globalfunctions.lua");
TB_GUINSECT_INFO = 
{
	[1] = 
	{
		["name"] = "虫蛊",
		[1] = {"幼蛊",1},
	},
	[2] = 
	{
		["name"] = "毒蛊",
		[1] = {"毒蛊",2},	
		[2] = {"猛毒蛊",3},	
		[3] = {"毒妖蛊",4},
		[4] = {"妖蛊",14},
		[5] = {"食妖蛊",15},	
		[6] = {"妖皇蛊",16},
	},
	[3] = 
	{
		["name"] = "血蛊",
		[1] = {"血蛊",5},	
		[2] = {"嗜血蛊",6},	
		[3] = {"血精蛊",7},	
		[4] = {"幻蛊",20},	
		[5] = {"冰幻蛊",21},	
		[6] = {"忘仙蛊",22},	
	},
	[4] = 
	{
		["name"] = "灵蛊",
		[1] = {"心蛊",17},	
		[2] = {"蚀心蛊",18},	
		[3] = {"心煞蛊",19},	
		[4] = {"香蛊",8},	
		[5] = {"迷香蛊",9},	
		[6] = {"醒醐蛊",10},	
		[7] = {"灵蛊",26},	
		[8] = {"玲珑蛊",27},	
		[9] = {"七彩小仙蛊",28},		
	},
	[5] = 
	{
		["name"] = "尸蛊",
		[1] = {"尸蛊",11},	
		[2] = {"三尸蛊",12},	
		[3] = {"鬼王蛊",13},	
		[4] = {"蠺蛊",23},	
		[5] = {"血蠶蛊",24},	
		[6] = {"金蠶蛊",25},	
		[7] = {"魔蛊",29},	
		[8] = {"幽影蛊",30},
		[9] = {"无影魔蛊",31},	
	},
}

GU_INSECT_ID1 = 2;	--蛊的物品ID1
GU_INSECT_ID2 = 17;	--蛊的物品ID2

TSK_BASE_ID = 2201;	--2201至2240共４０个变量
TSK_BASE_ID_LAST = 2240;--拥有的最后一个任务变量
TSK_TEMP_ID = 126;	--记录取出的蛊的ID，这个变量和麻将箱子的临时变量是一样的，不过可以重用

MAX_SEL_PER_PAGE = 5;	--每页最大显示数量

g_szInfoHeader = "<color=green>泰光<color>: ";

function OnUse()
	local selTab = {
				"取出蛊虫/get_guinsect",
				"把蛊虫放入鼎里/put_guinsect",
				"查看鼎里的蛊虫数量/nothing",
				}
	Say(g_szInfoHeader.."这座山峰下蕴涵着各种蛊虫,你愿意往深山里抓,还是想深挖?",getn(selTab),selTab);
end;
--取出蛊
function get_guinsect()
	local selTab = {};
	local nGuInsectNum = 0;
	for i=1,getn(TB_GUINSECT_INFO) do
		nGuInsectNum = get_guinsect_num(i);
		tinsert(selTab,TB_GUINSECT_INFO[i]["name"].."("..nGuInsectNum.."只)/#select_guinsect("..i..")");
	end;
	tinsert(selTab,"\n暂时不取出/OnUse");
	Say(g_szInfoHeader.."你想要取出蛊虫吗？",getn(selTab),selTab);
end;
--选择蛊
function select_guinsect(nType)
	list_page(1,nType);
end;
--列出可供选择的蛊
function list_page(nPageNum,nType)
	local tbSelTab = get_select_list(nType);
	local nRecordCount = getn(TB_GUINSECT_INFO[nType]);
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
		tinsert(selTab,tbSelTab[i]);
	end;
	local szCmdStr = "";
	if nPageNum ~= 1 then
		szCmdStr = "上一页/#list_page("..(nPageNum-1)..","..nType..")";
		tinsert(selTab,szCmdStr);
	end;
	if nPageNum ~= ceil(nRecordCount/MAX_SEL_PER_PAGE) then
		szCmdStr = "下一页/#list_page("..(nPageNum+1)..","..nType..")";
		tinsert(selTab,szCmdStr);	
	end;
	tinsert(selTab,"\n暂时不取出/get_guinsect");
	Say(g_szInfoHeader.."你要取什么虫子？",getn(selTab),selTab);
end;
--获得选项数据
function get_select_list(nType)
	local tbSelTab = {};
	local nCurNum = 0;
	local nGuInsectID = 0;
	local nTaskID = 0;
	for i=1,getn(TB_GUINSECT_INFO[nType]) do
		nGuInsectID = TB_GUINSECT_INFO[nType][i][2];
		nTaskID = TSK_BASE_ID+nGuInsectID-1;
		nCurNum = GetTask(nTaskID);
		szCmdStr = gf_FormatStringLength(TB_GUINSECT_INFO[nType][i][1],10).."("..nCurNum.."只)/#input_guinsect_num("..nType..","..i..","..nCurNum..")";
		tinsert(tbSelTab,szCmdStr);
	end;
	return tbSelTab;
end;
--输入取出数量
function input_guinsect_num(nType,nDetailType,nCurNum)
	local nGuInsectID = TB_GUINSECT_INFO[nType][nDetailType][2];
	local szGuInsectName = TB_GUINSECT_INFO[nType][nDetailType][1];
	if nCurNum <= 0 then
		Talk(1,"get_guinsect",g_szInfoHeader.."你的蛊鼎里没有虫子<color=yellow>"..szGuInsectName.."<color>.");
		return 0;
	end;
	SetTaskTemp(TSK_TEMP_ID,nGuInsectID);
	nCurNum = min(nCurNum,15000);	--最多一次取９００只
	AskClientForNumber("get_guinsect_callback",1,nCurNum,"输入取出数量:");
end;
--回调
function get_guinsect_callback(nNum)
	local nGuInsectID = GetTaskTemp(TSK_TEMP_ID);
	local nTaskID = TSK_BASE_ID+nGuInsectID-1;
	local nCurGuInsectNum = GetTask(nTaskID);
	local nType,nDetailType = get_guinsect_info_idx(nGuInsectID);
	if nType == 0 then
		return 0;
	end;
	if gf_JudgeRoomWeight((floor(nNum/1000)+1),10) ~= 1 then
		return 0;
	end;
	local szGuInsectName = TB_GUINSECT_INFO[nType][nDetailType][1];
	if nCurGuInsectNum < nNum then
		Talk(1,"get_guinsect",g_szInfoHeader.."蛊鼎里的数量"..szGuInsectName.."不足"..nNum.."只");
		return 0;
	end;
	AddGuInsectIntoBottle(nGuInsectID,-nNum);
	AddItem(GU_INSECT_ID1,GU_INSECT_ID2,nGuInsectID,nNum);
	Msg2Player("你取出"..nNum.."只"..szGuInsectName);
	select_guinsect(nType);
end;
--根据蛊的ID获得蛊的信息索引
function get_guinsect_info_idx(nID)
	for i=1,getn(TB_GUINSECT_INFO) do
		for j=1,getn(TB_GUINSECT_INFO[i]) do
			if TB_GUINSECT_INFO[i][j][2] == nID then
				return i,j;
			end;
		end;
	end;
	return 0,0;
end;
--获得某类蛊的数量
function get_guinsect_num(nType)
	local nTotalNum = 0;
	local nGuInsectID = 0;
	local nTaskID = 0;
	for i=1,getn(TB_GUINSECT_INFO[nType]) do
		nGuInsectID = TB_GUINSECT_INFO[nType][i][2];
		nTaskID = TSK_BASE_ID+nGuInsectID-1;
		nTotalNum = nTotalNum + GetTask(nTaskID);
	end;
	return nTotalNum;
end;
--存入身上所有的蛊
function put_guinsect()
	local nGuInsectNum = 0;
	local nGuInsectID = 0;
	local nTaskID = 0;
	local szGuInsectName = "";
	for i=1,getn(TB_GUINSECT_INFO) do
		for j=1,getn(TB_GUINSECT_INFO[i]) do
			nGuInsectID = TB_GUINSECT_INFO[i][j][2];
			nTaskID = TSK_BASE_ID+nGuInsectID-1;
			szGuInsectName = TB_GUINSECT_INFO[i][j][1];
			nGuInsectNum = GetItemCount(GU_INSECT_ID1,GU_INSECT_ID2,nGuInsectID);
			if nGuInsectNum > 0 then
				if DelItem(GU_INSECT_ID1,GU_INSECT_ID2,nGuInsectID,nGuInsectNum) == 1 then
					AddGuInsectIntoBottle(nGuInsectID,nGuInsectNum);
					Msg2Player("把这些"..nGuInsectNum.."放到"..szGuInsectName.."鼎里");
				end;
			end;
		end;
	end;
	Say("你把所有的虫子都存到蛊鼎里了！",0);
end;

function nothing()

end;

--=================================================================================
--以下两接口供程序调用
--改变蛊鼎中某种蛊的数量
--nNum为正时是增加，为负时是减少
function AddGuInsectIntoBottle(nID,nNum)
	local nTaskID = TSK_BASE_ID+nID-1;
	if nTaskID > TSK_BASE_ID_LAST then
		print(format("\n*********AddGuInsectIntoBottle(nID=%d,nNum%d) error nID must<=%d ",nID,nNum,TSK_BASE_ID_LAST-TSK_BASE_ID+1))
		return
	end
	local nCur=GetTask(nTaskID)
	local nCurNum = nCur+nNum;
	SetTask(nTaskID,nCurNum);
	SyncGuInsectNumInGuDing(nID,nCurNum);
	return 1;
end;
--从蛊鼎中删除某种蛊
function RemoveGuInsectFromBottle(nID,nNum)
	local nTaskID = TSK_BASE_ID+nID-1;
	local nCurNum = GetTask(nTaskID);
	if nCurNum >= nNum then	--如果鼎里面的数量足够了
		SetTask(nTaskID,nCurNum-nNum);
		SyncGuInsectNumInGuDing(nID,nCurNum-nNum);
		return 1;
	else
		local nGuNumInBag = GetItemCount(GU_INSECT_ID1,GU_INSECT_ID2,nID);	--获得包里面的数量
		if nCurNum + nGuNumInBag >= nNum then	--如果鼎里面加包里面的数量足够
			if DelItem(GU_INSECT_ID1,GU_INSECT_ID2,nID,nNum-nCurNum) == 1 then
				SetTask(nTaskID,0);
				SyncGuInsectNumInGuDing(nID,0);
				return 1;
			else
				return 0;
			end;
		else
			return 0;
		end;
	end;
	return 1;
end;
--获得蛊鼎中和背包中可用的该类蛊虫数量
function GetAvailableGuInsectNum(nID)
	local nTaskID = TSK_BASE_ID+nID-1;
	return GetItemCount(GU_INSECT_ID1,GU_INSECT_ID2,nID) + GetTask(nTaskID);
end;
