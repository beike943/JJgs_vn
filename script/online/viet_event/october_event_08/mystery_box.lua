--File name:	mystery_box.lua
--Describe:		ÉñÃØ±¦Ïä½Å±¾
--Item ID:		2,1,30031
--Create Date:	2008-09-26
--Author:		chenbenqian
Include("\\script\\lib\\writelog.lua")

--DATE_FRUIT_ITEM_VIET_END		= 2008102100;		-- ÉñÃØ±¦ÏäÊ¹ÓÃ½áÊøÈÕÆÚ
g_LogTitle = "B¶o r­¬ng ThÇn bÝ";
strLogCaption = "Hoat Dong Thang 10"

g_tPrizeItemList =
{
	--		"Ãû³Æ",		G1,	G2,		G3,		¸ÅÂÊ,	¹Ì¶¨ÊôÐÔ
	[1] = {"M¶nh Thiªn th¹ch",	2,	2,		7,		500,	0},
	[2] = {"Thiªn th¹ch",		2,	2,		8,		900,	0},
	[3] = {"Bång Lai Tiªn Thñy",	2,	1,		1012,	1700,	0},
	[4] = {"Cöu chuyÓn håi hån ®¬n",1,	0,		32,		1320,	0},
	[5] = {"Ch©n thá",	2,	1,		112,	1000,		0},
	[6] = {"Thiªn Hµ MËt tÞch",	0,	107,	64,		1000,		0},
	[7] = {"Tö Hµ MËt tÞch",	0,	107,	65,		500,		0},
	[8] = {"Chiªm Y Phæ",	0,	107,	66,		210,		0},
	[9] = {"TiÓu Th­ Giíi ChØ",	0,	102,	36,		1000,		1},
	[10] = {"Trang Chñ m·o",	0,	103,	91,		50,		1},
	[11] = {"Trang Chñ m·o",	0,	103,	92,		50,		1},
	[12] = {"Trang Chñ m·o",	0,	103,	93,		50,		1},
	[13] = {"Trang Chñ m·o",	0,	103,	94,		50,		1},
	[14] = {"Tæng Qu¶n Ngo¹i trang",	0,	100,	91,		200,		1},
	[15] = {"Tæng Qu¶n Ngo¹i trang",	0,	100,	92,		200,		1},
	[16] = {"Tæng Qu¶n Ngo¹i trang",	0,	100,	93,		200,		1},
	[17] = {"Tæng Qu¶n Ngo¹i trang",	0,	100,	94,		200,		1},
	[18] = {"Tæng Qu¶n khè",	0,	101,	91,		200,		1},
	[19] = {"Tæng Qu¶n khè",	0,	101,	92,		200,		1},
	[20] = {"Tæng Qu¶n khè",	0,	101,	93,		200,		1},
	[21] = {"Tæng Qu¶n khè",	0,	101,	94,		200,		1},
	[22] = {"Tr­ëng L·o ChØ Hoµn",	0,	102,		37,	70,		1},

}


function OnUse(nItemIdx)
--	local nDate = tonumber(date("%Y%m%d%H"));
--	if nDate >= DATE_FRUIT_ITEM_VIET_END then
--		return
--	end

	if DelItemByIndex(nItemIdx,1) == 1 then
		use();
	end;
end;

function use()
	local nRandom = random(1,10000);
	local nBase = 0;
	for i=1, getn(g_tPrizeItemList) do
		nBase = nBase + g_tPrizeItemList[i][5];
		if nRandom <= nBase then
			add_item_ex(g_tPrizeItemList[i]);
			return
		end;
	end;
end;


function add_item_ex(tItem)
	local nRetCode = 0;
	if tItem[6] == 0 then
		nRetCode = AddItem(tItem[2],tItem[3],tItem[4],1);
	elseif tItem[6] == 1 then
		nRetCode = AddItem(tItem[2],tItem[3],tItem[4],1,1,-1,-1,-1,-1,-1,-1);
	end
	if nRetCode == 1 then
		Msg2Player("B¹n nhËn ®­îc 1  "..tItem[1]);		
		WriteLogEx(strLogCaption,"B¶o r­¬ng ThÇn bÝ",1,tItem[1])
	else
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain 1 "..tItem[1].." Failed, return value = "..nRetCode);
	end
end

