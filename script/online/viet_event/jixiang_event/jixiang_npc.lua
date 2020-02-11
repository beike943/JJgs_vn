--File name:	jixiang_npc.lua
--Describe:		¼ªÏéÐ¡°ü»î¶¯npc½Å±¾
--Create Date:	2008-06-24
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\jixiang_event\\jixiang_head.lua");
Include("\\script\\lib\\globalfunctions.lua")

g_LogTitle = "C¸t t­êng th¹ch : ".."§æi";		--´Ë´¦·ÖÎª2¶ÎÖ»ÊÇÎªÁË²»Ôö¼ÓÐÂµÄ·­Òë

g_tBookList =
{
	[2] = {"Kim Cang Phôc Ma kinh",0,	107,	1,	1},
	[3] = {"V« TrÇn MËt tÞch",	0,	107,	5,	1},
	[4] = {"TiÒm Long MËt tÞch",	0,	107,	3,	1},
	[6] = {"Thiªn La MËt TÞch",	0,	107,	7,	1},
	[8] = {"Nh­ ý MËt TÞch",	0,	107,	9,	1},
	[9] = {"BÝch H¶i Phæ",	0,	107,	11,	1},
	[11] = {"Hçn §én MËt tÞch",	0,	107,	13,	1},
	[12] = {"Quý Thiªn MËt tÞch",	0,	107,	15,	1},
	[14] = {"HuyÒn ¶nh MËt tÞch",	0,	107,	17,	1},
	[15] = {"Qu©n Tö MËt tÞch",	0,	107,	19,	1},
	[17] = {"TrÊn Qu©n MËt tÞch",	0,	107,	21,	1},
	[18] = {"Xuyªn V©n MËt tÞch",	0,	107,	23,	1},
	[20] = {"U Minh Quû Lôc",	0,	107,	25,	1},
	[21] = {"Linh Cæ MËt tÞch",	0,	107,	27,	1},
}

g_tItemList =
{
	--		Ãû³Æ			G1	G2	G3	ÊýÁ¿	¼ªÏéÊ¯ÊýÁ¿	¸ºÖØ
	[1] = {"Tam Thanh hoµn",		2,	1,	1097,	1,	1,		1},
	[2] = {"B¶o r­¬ng Tµng KiÕm y gi¸p",	2,	1,	1060,	1,	10,		1},
	[3] = {"B¶o r­¬ng Tµng KiÕm vò khÝ",	2,	1,	1063,	1,	20,		1},
	[4] = {"Phiªu Vò",			0,	105,15,		1,	30,		10},
	[5] = {"B¶o r­¬ng Tµng KiÕm trang søc",	2,	1,	1062,	1,	80,		1},
	[6] = {"Huy hiÖu chiÕn c«ng (huy hoµng)",	2,	1,	9977,	1,	100,	1},
	[7] = {"B¶o r­¬ng Tµng KiÕm hoa khè",	2,	1,	1061,	1,	150,	1},
	[8] = {"B¶o r­¬ng Tµng KiÕm ®Çu qu¸n",	2,	1,	1059,	1,	200,	1},
	[9] = {"Thiªn Th¹ch linh th¹ch",		2,	1,	1068,	1,	400,	1},
	[10] = {"§Çu thµnh biÓu",		2,	1,	9978,	1,	500,	1},
}

function main()
	if is_jixiang_event_viet_open() == 0 then
		return
	end
	exchange_talk()
end

function exchange_talk()
	local selTab = {
				"1 C¸t T­êng Th¹ch = 1 Tam thanh hoµn/#exchange_prize(1)",
				"10 C¸t T­êng Th¹ch = 1 B¶o r­¬ng tµng kiÕm y gi¸p/#exchange_prize(2)",
				"20 C¸t T­êng Th¹ch = 1 B¶o r­¬ng tµng kiÕm vò khÝ/#exchange_prize(3)",
				"30 C¸t T­êng Th¹ch = 1 ngùa Phiªn Vò/#exchange_prize(4)",
				"80 C¸t T­êng Th¹ch = 1 B¶o r­¬ng tµng kiÕm trang søc/#exchange_prize(5)",
				"100 C¸t T­êng Th¹ch = 1 Huy hiÖu chiÕn c«ng (huy hoµng)/#exchange_prize(6)",
				"Xem trang sau/exchange_talk_2",
				"KÕt thóc ®èi tho¹i/no",
				}
	Say("<color=green>D¹ Th¶o<color>: ".."Tõ 01-08-2008 ®Õn 24:00 10-08-2008, c¸c vÞ ®¹i hiÖp cã thÓ dïng C¸t T­êng Th¹ch ®Ó ®æi nh÷ng phÇn th­ëng d­íi ®©y, cã muèn ®æi phÇn th­ëng b©y giê hay kh«ng?",getn(selTab),selTab);
end

function exchange_talk_2()
	local selTab = {
				"150 C¸t T­êng Th¹ch = 1 B¶o r­¬ng tµng kiÕm hoa khè/#exchange_prize(7)",
				"200 C¸t T­êng Th¹ch = 1 B¶o r­¬ng tµng kiÕm ®Çu qu¸n/#exchange_prize(8)",
				"400 C¸t T­êng Th¹ch = 1 Thiªn th¹ch linh th¹ch/#exchange_prize(9)",
				"500 C¸t T­êng Th¹ch = 1 §Çu thµnh biÓu/#exchange_prize(10)",
				"900 C¸t T­êng Th¹ch = 1 MËt tÞch m«n ph¸i/#exchange_prize(11)",
				"Xem trang tr­íc/exchange_talk",
				"KÕt thóc ®èi tho¹i/no",
				}
	Say("<color=green>D¹ Th¶o<color>: ".."Tõ 01-08-2008 ®Õn 24:00 10-08-2008, c¸c vÞ ®¹i hiÖp cã thÓ dïng C¸t T­êng Th¹ch ®Ó ®æi nh÷ng phÇn th­ëng d­íi ®©y, cã muèn ®æi phÇn th­ëng b©y giê hay kh«ng?",getn(selTab),selTab);
end

function exchange_prize(nType)
	if nType == 11 then
		local nRoute = GetPlayerRoute();
		local tRoutes = {0,1,5,7,10,13,16,19};
		local i = 0;
		for i=1,getn(tRoutes) do
			if nRoute == tRoutes[i] then
				Say("<color=green>D¹ Th¶o<color>: Ph¶i gia nhËp tr­êng ph¸i vâ c«ng míi míi cã thÓ ®æi S­ m«n mËt tÞch.",0);
				return
			end
		end
		give_book_prize(nRoute);
	elseif nType >= 1 and nType <= 10 then

		if GetItemCount(2,1,30015) < g_tItemList[nType][6] then
			Say("<color=green>D¹ Th¶o<color>: C¸t t­êng th¹ch mang theo kh«ng ®ñ.",1,"ThËt ng¹i qu¸, ®Ó ta kiÓm tra l¹i!/no");
			return
		else
			if gf_Judge_Room_Weight( g_tItemList[nType][5], g_tItemList[nType][5] * g_tItemList[nType][7] ) == 0 then
				Talk(1,"","<color=green>D¹ Th¶o<color>: H·y ®¶m b¶o hµnh trang ®ñ chç trèng vµ träng l­îng ®Ó tr¸nh l·ng phÝ kh«ng cÇn thiÕt.");
				return
			end;
			if DelItem(2,1,30015,g_tItemList[nType][6]) == 1 then
				if nType == 4 then		--·­Óð
					add_fanyu(g_tItemList[nType][5], g_tItemList[nType][1]);
				else
					add_item_ex(g_tItemList[nType][1],g_tItemList[nType][2],g_tItemList[nType][3],g_tItemList[nType][4],g_tItemList[nType][5]);
				end
			else
				Say("<color=green>D¹ Th¶o<color>: C¸t t­êng th¹ch mang theo kh«ng ®ñ.",1,"ThËt ng¹i qu¸, ®Ó ta kiÓm tra l¹i!/no");
				return
			end
		end
		
	else
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] function exchange_prize(nType), parameter nType error, nType = "..nType);
	end
end


function add_item_ex(szItemName, genre, detail, particular, nItemNum)
	local nRetCode = 0;
	local nItemIdx = 0;
	nRetCode,nItemIdx = AddItem(genre, detail, particular, nItemNum);
	if nRetCode == 1 then
		SetItemExpireTime(nItemIdx,30*24*3600)	
		Msg2Player("B¹n nhËn ®­îc  "..nItemNum.." c¸i "..szItemName);
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName);
	else
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName.." Failed, return value = "..nRetCode);
	end
end

function add_item_ex3(szItemName, genre, detail, particular, nItemNum)
	local nRetCode = 0;	
	nRetCode = AddItem(genre, detail, particular, nItemNum);
	if nRetCode == 1 then
		Msg2Player("B¹n nhËn ®­îc  "..nItemNum.." c¸i "..szItemName);
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName);
	else
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName.." Failed, return value = "..nRetCode);
	end
end

function give_book_prize(nType)
	if GetItemCount(2,1,30015) < 900 then
		Say("<color=green>D¹ Th¶o<color>: C¸t t­êng th¹ch mang theo kh«ng ®ñ.",1,"ThËt ng¹i qu¸, ®Ó ta kiÓm tra l¹i!/no");
		return
	else
		if gf_Judge_Room_Weight(1,20) == 0 then
			Talk(1,"","<color=green>D¹ Th¶o<color>: H·y ®¶m b¶o hµnh trang ®ñ chç trèng vµ träng l­îng ®Ó tr¸nh l·ng phÝ kh«ng cÇn thiÕt.");
			return
		end;
		if DelItem(2,1,30015,900) == 1 then
			add_item_ex3(g_tBookList[nType][1],g_tBookList[nType][2],g_tBookList[nType][3],g_tBookList[nType][4],g_tBookList[nType][5]);
		else
			Say("<color=green>D¹ Th¶o<color>: C¸t t­êng th¹ch mang theo kh«ng ®ñ.",1,"ThËt ng¹i qu¸, ®Ó ta kiÓm tra l¹i!/no");
			return
		end
	end
end

function give_suipian_prize()
	if GetItemCount(2,1,30015) < 900 then
		Say("<color=green>D¹ Th¶o<color>: C¸t t­êng th¹ch mang theo kh«ng ®ñ.",1,"ThËt ng¹i qu¸, ®Ó ta kiÓm tra l¹i!/no");
		return
	else
		if gf_Judge_Room_Weight(1,50) == 0 then
			Talk(1,"","<color=green>D¹ Th¶o<color>: H·y ®¶m b¶o hµnh trang ®ñ chç trèng vµ träng l­îng ®Ó tr¸nh l·ng phÝ kh«ng cÇn thiÕt.");
			return
		end;
		if DelItem(2,1,30015,900) == 1 then
			add_item_ex("B¶n vÏ ®óc t¹o thÇn khÝ",2,1,1086,10);
		else
			Say("<color=green>D¹ Th¶o<color>: C¸t t­êng th¹ch mang theo kh«ng ®ñ.",1,"ThËt ng¹i qu¸, ®Ó ta kiÓm tra l¹i!/no");
			return
		end
	end
end

function add_fanyu(nItemNum,szItemName)
	local nRetCode = 0;
	local nItemIdx = 0;
	nRetCode, nItemIdx = AddItem(0, 105, 15, nItemNum, 1, -1,-1,-1,-1,-1,-1);
	if nRetCode == 1 then
		SetItemExpireTime(nItemIdx,30*24*3600)				
		Msg2Player("B¹n nhËn ®­îc  "..nItemNum.." c¸i "..szItemName);
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName);
	else
		WriteLog("["..g_LogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName.." Failed, return value = "..nRetCode);
	end
end

function no()
end

