--by liubo
--Î÷Ñó´«½ÌÊ¿½Å±¾
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\head\\activity_normal_head_string.lua")
Include("\\script\\online_activites\\2011_11\\string.lua")
Include("\\script\\misc\\taskmanager.lua")
ACTIVIY_GOODS_NUM = 100 --ÎïÆ·ÊýÁ¿
--externds old taskid
--don't to modify this value by SetTask
VET_201111_GET_TAG_TASKID = 2783
VET_201111_USED_NUM_TASKID = 2784
--server globle value
g_Globle_Value = 2011
-------------------------------------
--Relay ¹²ÏíÊý¾Ý¿â¼ÇÂ¼½á¹¹
Record_Struct = {
	szKey = "activity_shengdan",
	nKey1 = 0,
	nKey2 = 0,
	nSortType = 0,
	itemkey = "missionaries",
}
thisFilePath = "\\script\\online_activites\\2011_11\\activity_02\\missionaries_npc.lua"
-------------------------------------
--½±Àø±í
VET_201111_SHENGDAN_AWARD = {
	{1, 39, "TuÇn Léc", {0, 105, 35, 1, 1, -1, -1, -1, -1, -1, -1}, 60 * 24 * 3600},
	{1, 58, "Trang trÝ Gi¸ng sinh",{{{"Nãn gi¸ng sinh chuÈn", {0,108,109,1}},{"Nãn gi¸ng sinh kh«i ng«", {0,108,110,1}},{"Nãn gi¸ng sinh gîi c¶m", {0,108,112,1}},{"Nãn gi¸ng sinh nhá", {0,108,111,1}}},
						{{"Th­îng y gi¸ng sinh chuÈn", {0,109,109,1}},{"Gi¸ng sinh kh«i ng«", {0,109,110,1}},{"Th­¬ng y gi¸ng sinh gîi c¶m", {0,109,112,1}},{"Th­¬ng y gi¸ng sinh KiÒu n÷", {0,109,111,1}}},
						{{"H¹ y Gi¸ng sinh chuÈn", {0,110,73,1}},{"Trang phôc gi¸ng sinh kh«i ng«", {0,110,74,1}},{"H¹ y gi¸ng sinh n÷ gîi c¶m", {0,110,76,1}},{"Gi¸ng sinh KiÒu n÷", {0,110,75,1}}},
						},60 * 24 * 3600, 1},
	{1, 3, "Trang trÝ Gi¸ng sinh",{{{"Nãn gi¸ng sinh chuÈn", {0,108,109,1}},{"Nãn gi¸ng sinh kh«i ng«", {0,108,110,1}},{"Nãn gi¸ng sinh gîi c¶m", {0,108,112,1}},{"Nãn gi¸ng sinh nhá", {0,108,111,1}}},
						{{"Th­îng y gi¸ng sinh chuÈn", {0,109,109,1}},{"Gi¸ng sinh kh«i ng«", {0,109,110,1}},{"Th­¬ng y gi¸ng sinh gîi c¶m", {0,109,112,1}},{"Th­¬ng y gi¸ng sinh KiÒu n÷", {0,109,111,1}}},
						{{"H¹ y Gi¸ng sinh chuÈn", {0,110,73,1}},{"Trang phôc gi¸ng sinh kh«i ng«", {0,110,74,1}},{"H¹ y gi¸ng sinh n÷ gîi c¶m", {0,110,76,1}},{"Gi¸ng sinh KiÒu n÷", {0,110,75,1}}},
						},0, 1},
}

VET_201111_NISSIONARIES_TASK = TaskManager:Create(3,4)
VET_201111_NISSIONARIES_TASK.FLAG = 1

function main()
	--ÊÇ·ñ¿ªÆô»î¶¯ÅÐ¶Ï
	if gf_CheckEventDateEx(48) ~= 1 then
		Say(tSTRING_MISSIONARIES_NPC..tSTRING_MISSIONARIES_TABLE[4],1,tSTRING_MISSIONARIES_TABLE[5].."/do_nothing")
		return 0
		--ClearRelayShareData(Record_Struct.szKey,Record_Struct.nKey1,Record_Struct.nKey2, thisFilePath, "")
	end
	local nDate = tonumber(date("%Y%m%d"))
 	if nDate >= 20111216 and nDate <= 20111218 then
		Say(tSTRING_MISSIONARIES_NPC..format(tSTRING_MISSIONARIES_TABLE[1],ACTIVIY_GOODS_NUM),3,tSTRING_MISSIONARIES_TABLE[2].."/get_final_award",tSTRING_MISSIONARIES_TABLE[3].."/get_usable_num",tSTRING_MISSIONARIES_TABLE[5].."/do_nothing")
	elseif nDate >= 20111223 and nDate <= 20111231 then
		Say(tSTRING_MISSIONARIES_NPC,3,"Ta muèn mua 1 bé ngo¹i trang Noel gi¸ 100 vµng /buy_ngoaitrang","Ta muèn mua 1 thó c­ìi TuÇn Léc gi¸ 100 vµng /buy_thucuoi",tSTRING_MISSIONARIES_TABLE[5].."/do_nothing")
	else
		Say(tSTRING_MISSIONARIES_NPC..tSTRING_MISSIONARIES_TABLE[4],1,tSTRING_MISSIONARIES_TABLE[5].."/do_nothing")
	end
	
end

function get_final_award()
	--·ÃÎÊ¹²ÏíÊý¾Ý¿â
	if GetGlbValue(g_Globle_Value) == 0 then
		ApplyRelayShareData(Record_Struct.szKey,Record_Struct.nKey1,Record_Struct.nKey2,thisFilePath,"callback_modifydata")
	end
	-----------------
	local nPoint = GetGlbValue(g_Globle_Value)
	if nPoint == 0 then return 0 end
	--ÊÇ·ñ³¬³öÁË½±ÀøÊýÁ¿
	if nPoint >= ACTIVIY_GOODS_NUM + 1 then
		Talk(1,"",tSTRING_MISSIONARIES_NPC..format(tSTRING_MISSIONARIES_TABLE[6],ACTIVIY_GOODS_NUM))
		return 0
	end
	--ÊÇ·ñÒÑÁìÈ¡ÖÕ¼«½±Àø
	if GetTask(VET_201111_GET_TAG_TASKID) ~= 1 then
		Talk(1,"",tSTRING_MISSIONARIES_NPC..format(tSTRING_MISSIONARIES_TABLE[7],GetTask(VET_201111_USED_NUM_TASKID),CLASS_ACTIVITY.tbPrizeItemInfo[1].nItemUseTimesMax))
		return 0
	end
	--ÊÇ·ñÒÑ¾­ÁìÈ¡¹ý
	if VET_201111_NISSIONARIES_TASK:GetTask(VET_201111_NISSIONARIES_TASK.FLAG) == 1 then
		Talk(1,"",tSTRING_MISSIONARIES_NPC..tSTRING_MISSIONARIES_TABLE[11])
		return 0
	end
	--±³°ü¿Õ¼ä
	if gf_Judge_Room_Weight(3,30," ") ~= 1 then
        Talk(1,"",tSTRING_MISSIONARIES_NPC..tSTRING_201111_TABLE[3])
		return 0
    end
	--¸ø½±Àø
	gf_EventGiveRandAward(VET_201111_SHENGDAN_AWARD,100,1,"Ho¹t ®éng phô event noel","§ua phÇn th­ëng cïng ¤ng Giµ Noel")
	SetGlbValue(g_Globle_Value,nPoint+1)
	AddRelayShareData(Record_Struct.szKey,Record_Struct.nKey1,Record_Struct.nKey2, thisFilePath,"do_nothing",Record_Struct.nSortType,Record_Struct.itemkey,"d",nPoint+1)
	Msg2Global(format(tSTRING_MISSIONARIES_TABLE[10],GetName(),nPoint,ACTIVIY_GOODS_NUM))
	VET_201111_NISSIONARIES_TASK:SetTask(VET_201111_NISSIONARIES_TASK.FLAG,1)
end

function get_usable_num()
	--·ÃÎÊ¹²ÏíÊý¾Ý¿â
	if GetGlbValue(g_Globle_Value) == 0 then
		ApplyRelayShareData(Record_Struct.szKey,Record_Struct.nKey1,Record_Struct.nKey2,thisFilePath,"callback_modifydata")
	end
	-----------------
	local nPoint = GetGlbValue(g_Globle_Value)
	if nPoint == 0 then return 0 end
	Talk(1,"",tSTRING_MISSIONARIES_NPC..format(tSTRING_MISSIONARIES_TABLE[9],nPoint-1,ACTIVIY_GOODS_NUM))
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
	SetGlbValue(g_Globle_Value,nPoint)
	--ÕâÀïµÄRelayÊý¾ÝÊÇËæÊ±±ä»¯µÄ£¬ËùÒÔÒªÉ¾³ýGamesvrÕâ±ßµÄ¸±±¾¼ÇÂ¼
	DelRelayShareDataCopy(szKey, nKey1, nKey2)
end

function do_nothing()
end

function buy_ngoaitrang()
	if gf_Judge_Room_Weight(3, 100, "") == 0 then
		Talk(1, "","Hµnh trang kh«ng ®ñ chç trèng!");
        	return 0;
     end
     if GetCash() < 1000000 then
		Talk(1, "", "B¹n kh«ng ®ñ tiÒn ®Ó mua ngo¹i trang Noel")
		return 0
	end
	if Pay(1000000) == 1 then
		local nbody = GetBody()
		local nNon = VET_201111_SHENGDAN_AWARD[2][4][1][nbody][2]
		local nAo = VET_201111_SHENGDAN_AWARD[2][4][2][nbody][2]
		local nQuan = VET_201111_SHENGDAN_AWARD[2][4][3][nbody][2]
		gf_AddItemEx2(nNon, "Nãn Gi¸ng Sinh","ITEM NOEL", "mua thµnh c«ng 1 nãn gi¸ng sinh", 7 * 24 * 3600 )
		gf_AddItemEx2(nAo, "Aã Gi¸ng Sinh","ITEM NOEL", "mua thµnh c«ng 1 ¸o gi¸ng sinh", 7 * 24 * 3600 )		
		gf_AddItemEx2(nQuan, "QuÇn Gi¸ng Sinh","ITEM NOEL", "mua thµnh c«ng 1 quÇn gi¸ng sinh", 7 * 24 * 3600 )
	end 
end

function buy_thucuoi()
	if gf_Judge_Room_Weight(1, 100, "") == 0 then
		Talk(1, "","Hµnh trang kh«ng ®ñ chç trèng!");
        	return 0;
     end
     if GetCash() < 1000000 then
		Talk(1, "", "B¹n kh«ng ®ñ tiÒn ®Ó mua Thó c­ìi TuÇn Léc")
		return 0
	end
	if Pay(1000000) == 1 then
		gf_AddItemEx2({0, 105, 35, 1, 1, -1, -1, -1, -1, -1, -1}, "TuÇn Léc","ITEM NOEL", "mua thµnh c«ng 1 tuÇn léc", 7 * 24 * 3600 )
	end   
end