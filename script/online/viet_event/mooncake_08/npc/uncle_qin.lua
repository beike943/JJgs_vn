--File name:	uncle_qin.lua
--Describe:		ÖÐÇï»î¶¯ÇØ´óÊånpcÎÄ¼þ
--Create Date:	2008-08-22
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\mooncake_08\\mooncake_head.lua")
Include("\\script\\lib\\globalfunctions.lua")

g_szLogTitle = "Ho¹t ®éng trung thu : ".."TÇn §¹i Thóc"		--´Ë´¦·ÖÎª2¶ÎÖ»ÊÇÎªÁË²»Ôö¼ÓÐÂµÄ·­Òë
g_szInfoHead = "<color=green>TÇn ®¹i thóc<color>: "


g_tbItem = 
{
	--		Ãû³Æ		G1	G2	G3		ÊýÁ¿
	[1] = {" §éc Phong thÝch",	2,	1,	176,	8	},
	[2] = {" Gi¸p x¸c phiÕn",	2,	1,	177,	8	},
	[3] = {" Khª S¬n chÝ",2,	1,	98,	8	},
	[4] = {" Vâ sÜ yªu ®¸i",	2,	1,	174,	8	},
	[5] = {" ¢m d­¬ng kÝnh",	2,	1,	294,	8	},
	[6] = {" Nh©m Méc Bµi",	2,	1,	83,		8	},
	[7] = {" Vâ sÜ ®ao",	2,	1,	173,	8	},
	[8] = {" §¹i Cang ®ao",	2,	1,	295,	6	},
	[9] = {" R¨ng Tinh Tinh",	2,	1,	296,	6	},
	[10] = {" V¶y Kú L©n",	2,	1,	106,	6	},
	[11] = {" Phï Ên",		2,	1,	302,	6	},
	[12] = {" Thuèc næ",	2,	1,	298,	6	},
	[13] = {" Háa ¶nh ThÇn ®ao",	2,	1,	178,	6	},
	[14] = {" G¨ng tay",	2,	1,	303,	6	},
	[15] = {" Tµn kiÕm",		2,	1,	299,	6	},
	[16] = {" Linh T¶n",		2,	1,	185,	6	},
	[17] = {" §µ La tr­îng",	2,	1,	305,	6	},
	[18] = {" Linh CÇm",		2,	1,	186,	6	},
	[19] = {" PhËt Kinh",		2,	1,	304,	6	},
	[20] = {" Linh §Þch",		2,	1,	187,	6	},
}

g_tbOption = {}

function main()
	if is_mooncake_viet_open() == 0 then
		return
	end
	exchange_confirm()
end

function exchange_confirm()
	local selTab = {
				"T¹i h¹ muèn ®æi vËt phÈm thu thËp lÊy tói nguyªn liÖu/exchange_talk",
				"Ta chØ ®Õn xem thö/no",
				}
	Say(g_szInfoHead.."Tõ 05-09-2008 ®Õn 24:00 ngµy 05-10-2008, ng­êi ch¬i cã thÓ ®¸nh qu¸i ®Ó thu thËp nguyªn liÖu lµm b¸nh trung thu (xem chi tiÕt trªn trang chñ).",getn(selTab),selTab);
end

function exchange_talk()
	if GetLevel() < 60 then
		Say(g_szInfoHead.."§¼ng cÊp kh«ng ®ñ ®Ó ®æi nguyªn liÖu.", 0)
		return
	end
	local i = 0
	local nTableSize = getn(g_tbItem)
	for i = 1, nTableSize do
		g_tbOption[i] = g_tbItem[i][5]..g_tbItem[i][1].." = 1 "..format("Bao nguyªn liÖu/#exchange_prize(%d)", i)
	end
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
	Say(g_szInfoHead.."Tõ 05-09-2008 ®Õn 24:00 ngµy 05-10-2008, ng­êi ch¬i cã thÓ ®¸nh qu¸i ®Ó thu thËp nguyªn liÖu lµm b¸nh trung thu (xem chi tiÕt trªn trang chñ).",getn(selTab),selTab);
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
	Say(g_szInfoHead.."Tõ 05-09-2008 ®Õn 24:00 ngµy 05-10-2008, ng­êi ch¬i cã thÓ ®¸nh qu¸i ®Ó thu thËp nguyªn liÖu lµm b¸nh trung thu (xem chi tiÕt trªn trang chñ).",getn(selTab),selTab);
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
	Say(g_szInfoHead.."Tõ 05-09-2008 ®Õn 24:00 ngµy 05-10-2008, ng­êi ch¬i cã thÓ ®¸nh qu¸i ®Ó thu thËp nguyªn liÖu lµm b¸nh trung thu (xem chi tiÕt trªn trang chñ).",getn(selTab),selTab);
end

function exchange_talk_4()
	local selTab = {
				g_tbOption[17],
				g_tbOption[18],
				g_tbOption[19],
				g_tbOption[20],
				"Xem trang tr­íc/exchange_talk_3",
				"KÕt thóc ®èi tho¹i/no",
				}
	Say(g_szInfoHead.."Tõ 05-09-2008 ®Õn 24:00 ngµy 05-10-2008, ng­êi ch¬i cã thÓ ®¸nh qu¸i ®Ó thu thËp nguyªn liÖu lµm b¸nh trung thu (xem chi tiÕt trªn trang chñ).",getn(selTab),selTab);
end

function exchange_prize(nType)
	local nTableSize = getn(g_tbItem)
	if nType >= 1 and nType <= nTableSize then
		if GetItemCount(g_tbItem[nType][2],g_tbItem[nType][3],g_tbItem[nType][4]) < g_tbItem[nType][5] then
			Say(g_szInfoHead.."VËt phÈm "..g_tbItem[nType][1].." h×nh nh­ kh«ng ®ñ ",1,"ThËt ng¹i qu¸, ®Ó ta kiÓm tra l¹i!/no");
			return
		else
			if gf_Judge_Room_Weight(1, 20) == 0 then
				Talk(1,"",g_szInfoHead.."Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!");
				return
			end;
			if DelItem(g_tbItem[nType][2],g_tbItem[nType][3],g_tbItem[nType][4],g_tbItem[nType][5]) == 1 then
				add_item_ex("Bao nguyªn liÖu",2,1,30016,1);
			else
				Say(g_szInfoHead.."Thêi gian sö dông"..g_tbItem[nType][1].."  H×nh nh­ kh«ng ®ñ ",1,"ThËt ng¹i qu¸, ®Ó ta kiÓm tra l¹i!/no");
				return
			end
		end
		
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] function exchange_prize(nType), parameter nType error, nType = "..nType);
	end
end


function add_item_ex(szItemName, genre, detail, particular, nItemNum)
	local nRetCode = 0;
	nRetCode = AddItem(genre, detail, particular, nItemNum);
	if nRetCode == 1 then
		Msg2Player("B¹n nhËn ®­îc  "..nItemNum.." c¸i "..szItemName);
		WriteLogEx(szLogTrungThuName,"®æi nguyªn liÖu",nItemNum,szItemName)
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName.." Failed, return value = "..nRetCode);
	end
end

function no()
end

