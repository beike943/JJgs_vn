--
-- ½£ÏÀÇéÔµÍøÂç°æ2
-- xmas_head.lua
-- 2007Ô½ÄÏÊ¥µ®»î¶¯ npc½Å±¾
-- 2007-12-12
-- by wuwei1
--

----
Include("\\script\\lib\\globalfunctions.lua");

TASKID_XMAS_PLANT_DATE	= nil;	-- ×î½üÖÖÊ÷ÈÕÆÚ
TASKID_XMAS_PLANT_COUNT	= nil;	-- ±¾ÈÕÖÖÊ÷ÊýÁ¿
TASKID_XMAS_TREEINDEX	= nil;	-- Ê÷npc index
TASKID_XMAS_PLANTTIME	= nil;	-- µ±Ç°ÖÖÊ÷Ê±¼ä
TASKID_XMAS_TREE_GROW	= 1558;	-- µ±Ç°Ê÷µÈ¼¶
TASKID_XMAS_TREE_SCOR	= 1559;	-- µÈÇ°Ê÷·ÖÊýE
TASKID_XMAS_TREE_TYPE	= 1560;	-- Ê÷ÖÖÀà
TASKID_XMAS_JH_GIFT		= 1561;	-- ÖÖ×ÓÁìÈ¡ÈÕÆÚ
TASKID_XMAS_LAST_WATER_TIME = 1562; --ÉÏÒ»´Î½½Ë®Ê±¼ä

XMAS_TREE_TYPE			= nil;
XMAS_TREE_NAME			= nil;	-- Ê÷Ãû×Ö
XMAS_PLANT_TREE_LIMIT	= nil;	-- Ã¿ÈÕÖÖÊ÷ÏÞÖÆ
XMAS_GATHER_TIME		= nil;	-- ÊÕ»ñÊ±¼ä
XMAS_GATHER_SCORE_LIMIT	= nil;	-- ×îÐ¡½±Àø·ÖÊý

XMAS_WATER_TIME 		= nil;	-- ½½Ë®Ê±¼ä

XMAS_TREELIFETIME = 60*25;	-- 25·ÖÖÖ


XMAS_TYPE_JH = 1;
XMAS_TYPE_ML = 2;
txmas_tree_mode = nil;

xmas_items = 
{
	["Nh¸nh th«ng gi¸o héi"] =			{2,	0,	573},
	["VËt tr.trÝ th«ng GH"] =		{2,	0,	577},
	["VËt trang trÝ 1"] =		{2,	0,	578},
	["VËt trang trÝ 2"] =		{2,	0,	579},
	["VËt trang trÝ 3"] =		{2,	0,	580},
	["VËt trang trÝ 4"] =		{2,	0,	581},
	["Nh¸nh th«ng mü lÖ"] =		{2,	0,	574},
	["Nh¸nh th«ng ®Ñp"] =		{2,	0,	575},
	["Nh¸nh th«ng BH"] =			{2,	0,	576},
	["VËt tr.trÝ th«ng BH 1"] =	{2,	0,	582},
	["VËt tr.trÝ th«ng BH 2"] =	{2,	0,	583},
	["VËt tr.trÝ th«ng BH 3"] =	{2,	0,	584},
}

tTreeItem = {
	--ID,			NAME,		, SCORE
	{2,	0,	577, "VËt tr.trÝ th«ng GH", 8},
	{2,	0,	578, "VËt trang trÝ 1", 1},
	{2,	0,	579, "VËt trang trÝ 2", 2},
	{2,	0,	580, "VËt trang trÝ 3", 3},
	{2,	0,	581, "VËt trang trÝ 4", 4}
};

xmas_npc_mode = {
	{
		"C©y Gi¸ng sinh 1c",
		"C©y Gi¸ng sinh 1b",
		"C©y Gi¸ng sinh 1a",
	},
	{
		"C©y Gi¸ng sinh 4c",
		"C©y Gi¸ng sinh 4b",
		"C©y Gi¸ng sinh 4a",
	}
};

Xmas_tree_SFX_table = {
	{946,937,940,943},
	{947,938,941,944},
	{948,939,942,945},
	{948,939,942,945},
};

function setup_global_value(ntype)
	TASKID_XMAS_JH_GIFT		= 1562
	
	if ntype == XMAS_TYPE_JH then
		TASKID_XMAS_PLANT_DATE	= 1550
		TASKID_XMAS_PLANT_COUNT	= 1551
		TASKID_XMAS_TREEINDEX	= 1552
		TASKID_XMAS_PLANTTIME	= 1557	--
		
		XMAS_TREE_NAME			= "C©y th«ng gi¸o héi"
		XMAS_PLANT_TREE_LIMIT	= 1;
		XMAS_GATHER_TIME		= 17;
		XMAS_GATHER_SCORE_LIMIT	= 20;
		
		XMAS_WATER_TIME = {{5,10,15}, 2}
		txmas_tree_mode = xmas_npc_mode[1];
	elseif ntype == XMAS_TYPE_ML then
		TASKID_XMAS_PLANT_DATE	= 1554
		TASKID_XMAS_PLANT_COUNT	= 1555
		TASKID_XMAS_TREEINDEX	= 1556
		TASKID_XMAS_PLANTTIME	= 1557
		
		XMAS_TREE_NAME			= "C©y th«ng mü lÖ"
		XMAS_PLANT_TREE_LIMIT	= 4;
		XMAS_GATHER_TIME		= 16;
		XMAS_GATHER_SCORE_LIMIT	= 3;
		
		XMAS_WATER_TIME = {{5,7,9,11,13,15}, 1}
		txmas_tree_mode = xmas_npc_mode[2];
	--else	
	--	print("[xmas]: type error!\n");
	end
end

function xmas_v07_is_open()
	local nDate = tonumber(date("%Y%m%d"));
	if nDate >= 20071222 and nDate <= 20080106 then
		return 1;
	else
		return 0;
	end
end

function Get_Time_String(nSecond)
	local nDay = 0;
	local nHour = 0;
	local nMin = 0;
	local nSec = 0;
	local sTime = "";
	nDay = floor(nSecond/(60*60*24));
	if nDay > 0 then
		sTime = sTime..nDay.."Thiªn";
	end;
	nHour = floor(mod(nSecond/(60*60),24));
	if nHour > 0 then
		sTime = sTime..nHour.."h ";
	end;
	nMin = floor(mod(nSecond/60,60));
	if nMin > 0 then
		sTime = sTime..nMin.." phót ";
	end;
	nSec = mod(nSecond,60);
	if nSec >= 0 then
		sTime = sTime..nSec.." Gi©y ";
	end;
	return sTime;
end;

function nothing()

end;

function clear_xmas_state()
	local nTreeIdx = GetTask(TASKID_XMAS_TREEINDEX);
	SetNpcLifeTime(nTreeIdx,0);
	SetNpcScript(nTreeIdx,"");
	SetTask(TASKID_XMAS_TREEINDEX,	0);
	SetTask(TASKID_XMAS_PLANTTIME,	0);
end

function is_jh_xmas_tree()
	local nNpcIdx = GetTargetNpc();
	if nNpcIdx == 0 or nNpcIdx == nil then 
		WriteLog("[xmas_head]:"..GetName().."GetTargetNpc trÞ tr¶ vÒ sai");
		return -1;
	end
	if nNpcIdx ~= GetTask(TASKID_XMAS_TREEINDEX) then
		WriteLog("[xmas_head]:"..GetName().."GetTargetNpc != TASKID_XMAS_TREEINDEX");
		return -1;
	end
	local sName = GetName();
	local nNameLen = strlen(sName);
	local npcName = GetTargetNpcName();
	if sName ~= strsub(npcName,1,nNameLen) then
		WriteLog("[xmas_head]:"..GetName().."Tªn c©y kh«ng khíp");
		return -1;
	end
	if GetTime() - GetTask(TASKID_XMAS_PLANTTIME) > XMAS_TREELIFETIME 
		or GetTask(TASKID_XMAS_PLANTTIME) == 0 
	then
		WriteLog("[xmas_head]:"..GetName().."Thêi gian trång kh«ng ®óng");
		return -1;
	end
	if GetTask(TASKID_XMAS_TREE_TYPE) == 1 then
		return 1;
	else
		return 0;
	end
end

function give_work_award()
	local taward = {
		{ {2,	0,	574, 1, 1}, "Nh¸nh th«ng mü lÖ",},
		{ {2,	0,	578, 1, 1}, "VËt trang trÝ 1",},
		{ {2,	0,	579, 1, 1}, "VËt trang trÝ 2",},
		{ {2,	0,	580, 1, 1}, "VËt trang trÝ 3",},
		{ {2,	0,	581, 1, 1}, "VËt trang trÝ 4",},
	};
	local r = random(1,100);
	local awardtype = 0;
	if r <= 15 then
		awardtype = 1;
	elseif r <= 45 then
		awardtype = 2;
	elseif r <= 70 then
		awardtype = 3;
	elseif r <= 90 then
		awardtype = 4;
	else
		awardtype = 5;
	end
	
	gf_SetLogCaption("xmas");
	gf_AddItemEx( taward[awardtype][1], taward[awardtype][2]);
	gf_SetLogCaption("");
end
