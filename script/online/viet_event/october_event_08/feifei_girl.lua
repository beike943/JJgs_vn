--File name:	feifei_girl.lua
--Describe:		·Æ·Æ¹ÃÄïnpc½Å±¾
--Create Date:	2008-09-26
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\october_event_08\\oct_event_head.lua");
Include("\\script\\lib\\globalfunctions.lua")

g_szLogTitle = "Ho¹t ®éng th¸ng 10 : ".."Phi Phi C« N­¬ng"						--´Ë´¦·ÖÎª2¶ÎÖ»ÊÇÎªÁË²»Ôö¼ÓÐÂµÄ·­Òë
g_szInfoHead = "<color=green>".."Phi Phi C« N­¬ng".."<color>: "

g_tbItem = 
{
	--		Ãû³Æ				G1	G2		G3		ÊýÁ¿	Ê±¼äÏÞÖÆ	Ð¡ÈçÒâÊýÁ¿
	[1] = {" Tam Thanh hoµn",				2,	1,		1097,	1,		30,		1},
	[2] = {" H¾c Ngäc §o¹n Tôc Cao (tiÓu)",		2,	1,		489,	1,		30,		1},
	[3] = {" V¹n VËt Quy Nguyªn §¬n (tiÓu)",		2,	1,		495,	1,		30,		1},
	[4] = {" Sinh Sinh Hãa T¸n (tiÓu)",		2,	1,		483,	1,		30,		1},
	[5] = {" Qu©n C«ng bµi",				2,	1,		9997,	1,		7,		1},
	[6] = {" Thiªn Hµ MËt tÞch",				0,	107,	64,		1,		-1,		2},
	[7] = {" Tö Hµ MËt tÞch",				0,	107,	65,		1,		-1,		4},
	[8] = {" ThÇn hµnh b¶o ®iÓn",				0,	200,	40,		1,		30,		5},
	[9] = {" Ph¸o hoa ®­a tin",				2,	1,		203,	1,		30,		5},
	[10] = {" Lôc L©m Lang Yªn",			2,	1,		1014,	1,		30,		6},
	[11] = {" Thñy Hoµng BÝ ChiÕu",			2,	1,		1047,	1,		30,		6},
	[12] = {" Uyªn ¦¬ng Kim Ti B¹c",			2,	1,		1048,	1,		30,		6},
	[13] = {" Chiªm Y Phæ",				0,	107,	66,		1,		-1,		8},
	[14] = {" C¸i ThÕ Anh Hµo",	2,	1,		1042,	1,		30,		10},
	[15] = {" §Çu thµnh biÓu",				2,	1,		9978,	1,		7,		10},
	[16] = {" Huy hiÖu chiÕn c«ng (huy hoµng)",			2,	1,		9977,	1,		7,		10},
	[17] = {" Phong lÖnh-cao cÊp",		2,	1,		1018,	1,		30,		12},
	[18] = {" Sæ tay sèng",			2,	19,		1,		1,		7,		20},
	[19] = {" ChiÕn ThÇn hoµn",				2,	1,		1005,	1,		7,		25},
	[20] = {" Thiªn Th¹ch linh th¹ch",			2,	1,		1068,	1,		7,		400},
	[21] = {" B¶n vÏ ®óc t¹o thÇn khÝ",		2,	1,		1086,	10,		-1,		450},
	[22] = {" Kim Cang Phôc Ma kinh",			0,	107,	1,		1,		-1,		500},
	[23] = {" TiÒm Long MËt tÞch",			0,	107,	3,		1,		-1,		500},
	[24] = {" V« TrÇn MËt tÞch",			0,	107,	5,		1,		-1,		500},
	[25] = {" Thiªn La MËt TÞch",			0,	107,	7,		1,		-1,		500},
	[26] = {" Nh­ ý MËt TÞch",			0,	107,	9,		1,		-1,		500},
	[27] = {" BÝch H¶i Phæ",				0,	107,	11,		1,		-1,		500},
	[28] = {" Hçn §én MËt tÞch",			0,	107,	13,		1,		-1,		500},
	[29] = {" Quý Thiªn MËt tÞch",			0,	107,	15,		1,		-1,		500},
	[30] = {" HuyÒn ¶nh MËt tÞch",			0,	107,	17,		1,		-1,		500},
	[31] = {" Qu©n Tö MËt tÞch",			0,	107,	19,		1,		-1,		500},
	[32] = {" TrÊn Qu©n MËt tÞch",			0,	107,	21,		1,		-1,		500},
	[33] = {" Xuyªn V©n MËt tÞch",			0,	107,	23,		1,		-1,		500},
	[34] = {" U Minh Quû Lôc",			0,	107,	25,		1,		-1,		500},
	[35] = {" Linh Cæ MËt tÞch",			0,	107,	27,		1,		-1,		500},
}

g_tbOption = {}

function main()
	if is_oct_event_viet_open() == 0 then
		return
	end

	local i = 0
	local nTableSize = getn(g_tbItem)
	for i = 1, nTableSize do
		g_tbOption[i] = g_tbItem[i][7].." TiÓu Nh­ ý".." = "..g_tbItem[i][5]..g_tbItem[i][1]..format("/#exchange_prize(%d)", i)
	end

	exchange_talk()
end

function exchange_talk()
	local selTab = {
				g_tbOption[1],
				g_tbOption[2],
				g_tbOption[3],
				g_tbOption[4],
				g_tbOption[5],
				g_tbOption[6],
				"Xem trang sau/exchange_talk_2",
				"KÕt thóc ®èi tho¹i/no",
				}
	Say(g_szInfoHead.."Tõ 10-10-2008 ®Õn 24:00 20-10-2008. C¸c vâ l©m nh©n sÜ sö dông vËt phÈm TiÓu Nh­ ý ®Ó ®æi nh÷ng vËt phÈm sau ®©y:",getn(selTab),selTab);
end

function exchange_talk_2()
	local selTab = {
				g_tbOption[7],
				g_tbOption[8],
				g_tbOption[9],
				g_tbOption[10],
				g_tbOption[11],
				"Xem trang tr­íc/exchange_talk",
				"Xem trang sau/exchange_talk_3",
				"KÕt thóc ®èi tho¹i/no",
				}
	Say(g_szInfoHead.."Tõ 10-10-2008 ®Õn 24:00 20-10-2008. C¸c vâ l©m nh©n sÜ sö dông vËt phÈm TiÓu Nh­ ý ®Ó ®æi nh÷ng vËt phÈm sau ®©y:",getn(selTab),selTab);
end

function exchange_talk_3()
	local selTab = {
				g_tbOption[12],
				g_tbOption[13],
				g_tbOption[14],
				g_tbOption[15],
				g_tbOption[16],
				"Xem trang tr­íc/exchange_talk_2",
				"Xem trang sau/exchange_talk_4",
				"KÕt thóc ®èi tho¹i/no",
				}
	Say(g_szInfoHead.."Tõ 10-10-2008 ®Õn 24:00 20-10-2008. C¸c vâ l©m nh©n sÜ sö dông vËt phÈm TiÓu Nh­ ý ®Ó ®æi nh÷ng vËt phÈm sau ®©y:",getn(selTab),selTab);
end

function exchange_talk_4()
	local selTab = {
				g_tbOption[17],
				g_tbOption[18],
				g_tbOption[19],
				g_tbOption[20],
				g_tbOption[21],
				"Xem trang tr­íc/exchange_talk_3",
				"Xem trang sau/exchange_talk_5",
				"KÕt thóc ®èi tho¹i/no",
				}
	Say(g_szInfoHead.."Tõ 10-10-2008 ®Õn 24:00 20-10-2008. C¸c vâ l©m nh©n sÜ sö dông vËt phÈm TiÓu Nh­ ý ®Ó ®æi nh÷ng vËt phÈm sau ®©y:",getn(selTab),selTab);
end

function exchange_talk_5()
	local selTab = {
				g_tbOption[22],
				g_tbOption[23],
				g_tbOption[24],
				g_tbOption[25],
				g_tbOption[26],
				"Xem trang tr­íc/exchange_talk_4",
				"Xem trang sau/exchange_talk_6",
				"KÕt thóc ®èi tho¹i/no",
				}
	Say(g_szInfoHead.."Tõ 10-10-2008 ®Õn 24:00 20-10-2008. C¸c vâ l©m nh©n sÜ sö dông vËt phÈm TiÓu Nh­ ý ®Ó ®æi nh÷ng vËt phÈm sau ®©y:",getn(selTab),selTab);
end

function exchange_talk_6()
	local selTab = {
				g_tbOption[27],
				g_tbOption[28],
				g_tbOption[29],
				g_tbOption[30],
				g_tbOption[31],
				"Xem trang tr­íc/exchange_talk_5",
				"Xem trang sau/exchange_talk_7",
				"KÕt thóc ®èi tho¹i/no",
				}
	Say(g_szInfoHead.."Tõ 10-10-2008 ®Õn 24:00 20-10-2008. C¸c vâ l©m nh©n sÜ sö dông vËt phÈm TiÓu Nh­ ý ®Ó ®æi nh÷ng vËt phÈm sau ®©y:",getn(selTab),selTab);
end

function exchange_talk_7()
	local selTab = {
				g_tbOption[32],
				g_tbOption[33],
				g_tbOption[34],
				g_tbOption[35],
				"Xem trang tr­íc/exchange_talk_6",				
				"KÕt thóc ®èi tho¹i/no",
				}
	Say(g_szInfoHead.."Tõ 10-10-2008 ®Õn 24:00 20-10-2008. C¸c vâ l©m nh©n sÜ sö dông vËt phÈm TiÓu Nh­ ý ®Ó ®æi nh÷ng vËt phÈm sau ®©y:",getn(selTab),selTab);
end

function exchange_prize(nType)
	local nTableSize = getn(g_tbItem)
	if nType >= 1 and nType <= nTableSize then
		if GetItemCount(2, 1, 30030) < g_tbItem[nType][7] then
			Say(g_szInfoHead.."§¹i hiÖp mang kh«ng ®ñ TiÓu Nh­ ý!",1,"V©ng! T¹i h¹ sÏ quay l¹i sau khi cã ®ñ nguyªn liÖu!/no");
			return
		else
			if gf_Judge_Room_Weight(1, 120) == 0 then
				Talk(1,"",g_szInfoHead.."Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!");
				return
			end;
			if DelItem(2, 1, 30030, g_tbItem[nType][7]) == 1 then
				add_item_ex(g_tbItem[nType]);
			else
				Say(g_szInfoHead.."§¹i hiÖp mang kh«ng ®ñ TiÓu Nh­ ý!",1,"V©ng! T¹i h¹ sÏ quay l¹i sau khi cã ®ñ nguyªn liÖu!/no");
				return
			end
		end
		
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] function exchange_prize(nType), parameter nType error, nType = "..nType);
	end
end

function add_item_ex(tItem)
	local nRetCode,nItemIdx = AddItem(tItem[2],tItem[3],tItem[4],tItem[5]);
	if nRetCode == 1 then
		if tItem[6] > 0 then
			SetItemExpireTime(nItemIdx, tItem[6]*24*3600)
		end
		Msg2Player("B¹n nhËn ®­îc  "..tItem[5].." c¸i "..tItem[1]);
		WriteLogEx("Hoat Dong Thang 10","Phi Phi C« N­¬ng",tItem[5],tItem[1])		
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..tItem[5].." c¸i "..tItem[1].." Failed, return value = "..nRetCode);
	end
end


function no()
end
