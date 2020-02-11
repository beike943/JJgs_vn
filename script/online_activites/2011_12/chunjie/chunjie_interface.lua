--by liubo
--°×ÏÈÉú½Å±¾½Ó¿Ú
--´º½Ú¸±»î¶¯
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\head\\activity_normal_head_string.lua")
Include("\\script\\misc\\taskmanager.lua")

ACTIVIY_GOODS_NUM = 68 --ÎïÆ·ÊýÁ¿
--externds old taskid
--don't to modify this value by SetTask
VET_201112_GET_TAG_TASKID = 2778
VET_201112_USED_NUM_TASKID = 2779
--server globle value
g_201112_Globle_Value = 2012
-------------------------------------
--Relay ¹²ÏíÊý¾Ý¿â¼ÇÂ¼½á¹¹
Record_Struct = {
	szKey = "spring_festival",
	nKey1 = 0,
	nKey2 = 0,
	nSortType = 0,
	itemkey = "missionaries1",
}
thisFilePath = "\\script\\online_activites\\2011_12\\chunjie\\chunjie_interface.lua"
-------------------------------------
--½±Àø±í
VET_201112_CHUNJIE_AWARD = {
	{3, 2345, 8880000, 1},
  {1, 6879, "Ngo¹i trang tÕt xu©n",{
 			{{"Trang phôc xu©n chuÈn",{0,109,113,1}},{"Trang phôc xu©n kh«i ng«",{0,109,114,1}},{"Trang phôc xu©n KiÒu n÷",{0,109,116,1}},{"Trang phôc xu©n gîi c¶m",{0,109,115,1}},}, --1Ïî
 			}, 30*24*3600, 1},
 	{1, 345, "Ngo¹i trang tÕt xu©n",{
 			{{"Trang phôc xu©n chuÈn",{0,109,113,1}},{"Trang phôc xu©n kh«i ng«",{0,109,114,1}},{"Trang phôc xu©n KiÒu n÷",{0,109,116,1}},{"Trang phôc xu©n gîi c¶m",{0,109,115,1}},}, --1Ïî
 			}, 0, 1},
 	{1, 345, "Niªn thó", {0, 105, 33, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
  {1, 39, "Thiªn Cang LÖnh", {2, 95, 204, 1}, 0},
  {1, 47, "§«ng Ph­¬ng Long Ch©u", {0, 102, 24, 1, 1, -1, -1, -1, -1, -1, -1}, 0},
}

tSTRING_NPC = "<color=green>B¹ch tiªn sinh: <color>"
tSTRING_TABLE = {
	[1] = "Trong thêi gian event, ng­êi ch¬i ®· nhËn phÇn th­ëng cuèi trong ho¹t ®éng mõng tÕt xu©n cã thÓ nhËn ®­îc phÇn th­ëng N¨m Míi C¸t T­êng t¹i B¹ch Tiªn Sinh. PhÇn th­ëng N¨m Míi C¸t T­ëng chØ giíi h¹n trong <color=green>%d<color> phÇn.",
	[2] = "NhËn phÇn th­ëng n¨m míi c¸t t­êng",
	[3] = "KiÓm tra sè quµ cßn l¹i",
	[4] = "Lêi chóc phóc tõ thiªn chóa!",
	[5] = "Tho¸t",
	[6] = "PhÇn th­ëng ®· ph¸t hÕt <color=green>%d<color> phÇn, thËt ®¸ng tiÕc, b¹n ®· ®Õn trÔ.",
	[7] = "ThiÕu hiÖp vÉn ch­a nhËn phÇn th­ëng cuèi cña ho¹t ®éng tÕt xu©n, sè l­îng hiÖn t¹i ®· sö dông ®­îc <color=green>%d<color>/<color=green>%d<color>",
	[8] = "Sè liÖu ghi nhËn ch­a ®Õn, h·y quay l¹i sau.",
	[9] = "Sè l­îng phÇn th­ëng cßn l¹i <color=green>%d<color> phÇn.",
	[10] = "Xin chóc mõng <%s> ®· nhËn ®­îc phÇn quµ ®Æc biÖt mïa tÕt xu©n, sè quµ cßn l¹i <%d> phÇn.",
	[11] = "ThiÕu hiÖp ®· nhËn quµ tÕt xu©n c¸t t­êng nµy råi.",
}

VET_201112_CHUNJIE_TASK = TaskManager:Create(10,1)
VET_201112_CHUNJIE_TASK.FLAG = 1

---------------------------------
--interface table
--use "tinsert"
CHUNJIE_GETFINALAWARD = tSTRING_TABLE[2].."/get_201112_final_award";
CHUNJIE_GETUSENUM = tSTRING_TABLE[3].."/get_201112_usable_num";
CHUNJIE_EXIT = tSTRING_TABLE[5].."/do_nothing";
--for example :
--Include("this File")
function get_final_top()
	local tbSay = {};
	local nSaySize = 0;
	local szSayHead = "Phóc nh­ §«ng H¶i - Thä Tû Nam S¬n"
--	-----interface---------
--	local nStart = MkTime(2012,1,13,0,0,0);
--	local nEnd = MkTime(2012,1,16,0,0,0);
--	local nNowTime = GetTime();
--	if nNowTime >= nStart and nNowTime <= nEnd then
	local nDate = tonumber(date("%Y%m%d"))
 	if nDate >= 20120113 and nDate <= 20120115 then
		tinsert(tbSay,CHUNJIE_GETFINALAWARD);
		tinsert(tbSay,CHUNJIE_GETUSENUM);
		tinsert(tbSay,CHUNJIE_EXIT);
	else
		tinsert(tbSay,tSTRING_TABLE[4]);
	end

	nSaySize = getn(tbSay);
	Say(szSayHead, nSaySize, tbSay);
end
----------------------------------
function get_201112_final_award()
	if gf_CheckEventDateEx(51) ~= 1 then
		Talk(1,"","Event ®· hÕt h¹n!")
		return 0;
	end
	local nStart = MkTime(2012,1,13,0,0,0);
	local nEnd = MkTime(2012,1,16,0,0,0);
	local nNowTime = GetTime();
	if nNowTime < nStart or nNowTime > nEnd then
		Talk(1,"","Event ®· hÕt h¹n!")
		return 0;
	end	
	--·ÃÎÊ¹²ÏíÊý¾Ý¿â
	if GetGlbValue(g_201112_Globle_Value) == 0 then
		ApplyRelayShareData(Record_Struct.szKey,Record_Struct.nKey1,Record_Struct.nKey2,thisFilePath,"callback_modifydata")
	end
	-----------------
	local nPoint = GetGlbValue(g_201112_Globle_Value)
	if nPoint == 0 then return 0 end
	--ÊÇ·ñ³¬³öÁË½±ÀøÊýÁ¿
	if nPoint >= ACTIVIY_GOODS_NUM + 1 then
		Talk(1,"",tSTRING_NPC..format(tSTRING_TABLE[6],ACTIVIY_GOODS_NUM))
		return 0
	end
	--ÊÇ·ñÒÑÁìÈ¡ÖÕ¼«½±Àø
	if GetTask(VET_201112_GET_TAG_TASKID) ~= 1 then
		Talk(1,"",tSTRING_NPC..format(tSTRING_TABLE[7],GetTask(VET_201112_USED_NUM_TASKID),CLASS_ACTIVITY.tbPrizeItemInfo[1].nItemUseTimesMax))
		return 0
	end
	--ÊÇ·ñÒÑ¾­ÁìÈ¡¹ý
	if VET_201112_CHUNJIE_TASK:GetTask(VET_201112_CHUNJIE_TASK.FLAG) == 1 then
		Talk(1,"",tSTRING_NPC..tSTRING_TABLE[11])
		return 0
	end
	--±³°ü¿Õ¼ä
	if gf_Judge_Room_Weight(1,30," ") ~= 1 then
        Talk(1,"",tSTRING_NPC.."Kh«ng gian hµnh trang kh«ng ®ñ")
		return 0
  end
	--¸ø½±Àø
	gf_EventGiveRandAward(VET_201112_CHUNJIE_AWARD,10000,1,"Hoat dong thang 1 nam 2012","§ua phÇn th­ëng TÕt")
	SetGlbValue(g_201112_Globle_Value,nPoint+1)
	AddRelayShareData(Record_Struct.szKey,Record_Struct.nKey1,Record_Struct.nKey2, thisFilePath,"do_nothing",Record_Struct.nSortType,Record_Struct.itemkey,"d",nPoint+1)
	Msg2Global(format(tSTRING_TABLE[10],GetName(),ACTIVIY_GOODS_NUM-nPoint))
	VET_201112_CHUNJIE_TASK:SetTask(VET_201112_CHUNJIE_TASK.FLAG,1)
end

function get_201112_usable_num()
	if gf_CheckEventDateEx(51) ~= 1 then
		Talk(1,"","Event ®· hÕt h¹n!")
		return 0;
	end
	local nStart = MkTime(2012,1,13,0,0,0);
	local nEnd = MkTime(2012,1,16,0,0,0);
	local nNowTime = GetTime();
	if nNowTime < nStart or nNowTime > nEnd then
		Talk(1,"","Event ®· hÕt h¹n!")
		return 0;
	end
	--·ÃÎÊ¹²ÏíÊý¾Ý¿â
	if GetGlbValue(g_201112_Globle_Value) == 0 then
		ApplyRelayShareData(Record_Struct.szKey,Record_Struct.nKey1,Record_Struct.nKey2,thisFilePath,"callback_modifydata")
	end
	-----------------
	local nPoint = GetGlbValue(g_201112_Globle_Value)
	if nPoint == 0 then return 0 end
	Talk(1,"",tSTRING_NPC..format(tSTRING_TABLE[9],ACTIVIY_GOODS_NUM-nPoint+1))
end

function callback_modifydata(szKey, nKey1, nKey2, nCount, _szkey, _nkey1, _nkey2)
	if szKey == "" then
		szKey, nKey1, nKey2 = _szkey, _nkey1, _nkey2
	end	
	if nCount == 0 then
		-- Ã»ÓÐ¼ÇÂ¼
		AddRelayShareData(szKey, nKey1, nKey2, thisFilePath, "do_nothing",Record_Struct.nSortType,Record_Struct.itemkey,"d",1)
	end	
	local nPoint, nRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, Record_Struct.itemkey)
	SetGlbValue(g_201112_Globle_Value,nPoint)
	--ÕâÀïµÄRelayÊý¾ÝÊÇËæÊ±±ä»¯µÄ£¬ËùÒÔÒªÉ¾³ýGamesvrÕâ±ßµÄ¸±±¾¼ÇÂ¼
	DelRelayShareDataCopy(szKey, nKey1, nKey2)
end

function do_nothing()
end