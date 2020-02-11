--File name:	girl_npc.lua
--Describe:		Ê¥µ®½Ú»î¶¯±ù¶ùnpcÎÄ¼þ
--Create Date:	2008-11-18
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\xmas_08\\xmas_func.lua")
Include("\\script\\lib\\globalfunctions.lua")

g_szLogTitle = "Giang Sinh 2008"			--´Ë´¦·ÖÎª2¶ÎÖ»ÊÇÎªÁË²»Ôö¼ÓÐÂµÄ·­Òë
g_szInfoHead = "<color=green>".."B¨ng Nhi".."<color>: "

g_szFileName = "girl_npc.lua"			--ÎÄ¼þÃû


g_tbOldItem = 
{
	--		Ãû×Ö		ID1,ID2,ID3,	ÊýÁ¿
	[1] = {"Ví Gi¸ng Sinh",	2,	1,	30041,	6,	},
	[2] = {"Chu«ng Gi¸ng Sinh",	2,	1,	30042,	3,	},
	[3] = {"Nh¸nh Th«ng Gi¸ng Sinh",	2,	1,	30040,	1,	},
	[4] = {"C©y KÑo Gi¸ng Sinh",	2,	1,	30043,	1,	},
	[5] = {"Ng«i Sao Gi¸ng Sinh",	2,	1,	30044,	1,	},
}

g_tbNewItem = 
{
	--		Ãû×Ö		ID1,ID2,ID3,	ÊýÁ¿
	[1] = {"Hép Quµ Xanh",	2,	1,	30033,	1,	},
	[2] = {"Hép Quµ §á",	2,	1,	30034,	1,	},
}

function main()
	if is_xmas_08_viet_open() == 0 then
		return
	end
	local selTab = {
				"§æi 1 Hép Quµ Xanh/#want_exchange(1)",
				"§æi 1 Hép Quµ §á/#want_exchange(2)",
				"Mua C©y KÑo Gi¸ng Sinh (1 c©y kÑo = 50 b¹c)/bug_sugar",
				"NhËn vËt phÈm cÈm nang ®¹i sù kiÖn/give_pouch",
				"Ta chØ ®Õn xem thö/no",
				}
	Say(g_szInfoHead.."Ho¹t ®éng gi¸ng sinh n¨m nay diÔn ra tõ 06-12-2008 ®Õn 24:00 04-01-2009. Trong thêi gian ho¹t ®éng, c¸c vÞ vâ l©m nh©n sü th«ng qua ®¸nh qu¸i vµ c¸c chøc n¨ng ®Ó thu ®­îc hép quµ gi¸ng sinh, më hép quµ gi¸ng sinh  sÏ thu ®­îc Hép Quµ Xanh vµ Hép Quµ §á. \nC¸c h¹ muèn ®æi lo¹i quµ nµo?",getn(selTab),selTab);
end

function bug_sugar()
	if GetCash() < 5000 then
		Say(g_szInfoHead.."§¹i hiÖp kh«ng ®ñ ng©n l­îng trªn ng­êi råi!",1,"ThËt lµ ng¹i qu¸! T¹i h¹ xin c¸o tõ./no")
		return
	end
	if gf_Judge_Room_Weight(1,20) == 0 then
		Talk(1,"",g_szInfoHead.."Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!")
		return
	end
	if pay_ex(5000) == 1 then
		add_item_ex(g_tbOldItem[4])
	else
		Say(g_szInfoHead.."§¹i hiÖp kh«ng ®ñ ng©n l­îng trªn ng­êi råi!",1,"ThËt lµ ng¹i qu¸! T¹i h¹ xin c¸o tõ./no")
		return
	end
	main()
end

function give_pouch()
	if GetItemCount(2, 1, 30045) > 0 then
		Say(g_szInfoHead.."§¹i hiÖp ®· cã mét c¸i råi, kh«ng thÓ nhËn tiÕp ®­îc n÷a!",1,"KÕt thóc ®èi tho¹i/no")
		return
	end
	if gf_Judge_Room_Weight(1,20) == 0 then
		Talk(1,"",g_szInfoHead.."Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!")
		return
	end
	add_item_ex( {"CÈm Nang §¹i Sù KiÖn",	2,	1,	30045,	1} )
end

function want_exchange(nType)
	local selTab = {
				format("§ång ý ®æi /#exchange_box(%d)", nType),
				"Ta chØ ®Õn xem thö/no",
				}
	if nType == 1 then
		Say(g_szInfoHead.."\n  6 Ví Gi¸ng Sinh + 3 Chu«ng Gi¸ng Sinh + 1 Nh¸nh Th«ng Gi¸ng Sinh + 1 C©y KÑo Gi¸ng Sinh = 1 Hép Quµ Xanh",getn(selTab),selTab);
	elseif nType == 2 then
		Say(g_szInfoHead.."\n 6 Ví Gi¸ng Sinh + 3 Chu«ng Gi¸ng Sinh + 1 Nh¸nh Th«ng Gi¸ng Sinh + 1 Ng«i Sao Gi¸ng Sinh = 1 Hép Quµ §á",getn(selTab),selTab);
	else
		WriteLogEx(g_szLogTitle, "NULL", "NULL", "NULL", "NULL", GetTongName(), "function want_exchange(nType) in file "..g_szFileName..", parameter nType error, nType = "..nType)
	end
end

function exchange_box(nType)
	if nType == 1 then
		if check_item_count(g_tbOldItem[1]) == 0 or check_item_count(g_tbOldItem[2]) == 0 or check_item_count(g_tbOldItem[3]) == 0 or check_item_count(g_tbOldItem[4]) == 0 then
			Say(g_szInfoHead.."Kh«ng ®ñ nguyªn liÖu cÇn thiÕt.",1,"ThËt lµ ng¹i qu¸! T¹i h¹ xin c¸o tõ./no");
			return
		else
			if gf_Judge_Room_Weight(1,20) == 0 then
				Talk(1,"",g_szInfoHead.."Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!");
				return
			end;
			if del_item_ex(g_tbOldItem[1]) == 1 and del_item_ex(g_tbOldItem[2]) == 1 and del_item_ex(g_tbOldItem[3]) == 1 and del_item_ex(g_tbOldItem[4]) == 1 then
				add_item_ex(g_tbNewItem[1])
			else
				Say(g_szInfoHead.."Kh«ng ®ñ nguyªn liÖu cÇn thiÕt.",1,"ThËt lµ ng¹i qu¸! T¹i h¹ xin c¸o tõ./no");
				return
			end
		end
	elseif nType == 2 then
		if check_item_count(g_tbOldItem[1]) == 0 or check_item_count(g_tbOldItem[2]) == 0 or check_item_count(g_tbOldItem[3]) == 0 or check_item_count(g_tbOldItem[5]) == 0 then
			Say(g_szInfoHead.."Kh«ng ®ñ nguyªn liÖu cÇn thiÕt.",1,"ThËt lµ ng¹i qu¸! T¹i h¹ xin c¸o tõ./no");
			return
		else
			if gf_Judge_Room_Weight(1,20) == 0 then
				Talk(1,"",g_szInfoHead.."Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!");
				return
			end;
			if del_item_ex(g_tbOldItem[1]) == 1 and del_item_ex(g_tbOldItem[2]) == 1 and del_item_ex(g_tbOldItem[3]) == 1 and del_item_ex(g_tbOldItem[5]) == 1 then
				add_item_ex(g_tbNewItem[2])
			else
				Say(g_szInfoHead.."Kh«ng ®ñ nguyªn liÖu cÇn thiÕt.",1,"ThËt lµ ng¹i qu¸! T¹i h¹ xin c¸o tõ./no");
				return
			end
		end
	else
		WriteLogEx(g_szLogTitle, "NULL", "NULL", "NULL", "NULL", GetTongName(), "function exchange_box(nType) in file "..g_szFileName..", parameter nType error, nType = "..nType)
	end
	main()
end


function add_item_ex(tItem)
	local szItemName = tItem[1]
	local G, D, P = tItem[2], tItem[3], tItem[4]
	local nItemNum = tItem[5]
	local nRetCode = 0

	nRetCode = AddItem(G, D, P, nItemNum)
	if nRetCode == 1 then
		Msg2Player("B¹n nhËn ®­îc  "..nItemNum.." c¸i "..szItemName);
		WriteLogEx(g_szLogTitle, "B¨ng Nhi", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "B¨ng Nhi", "", "", "", "", "Thu ®­îc thÊt b¹i, ".."AddItem return value = "..nRetCode)
	end
end

function del_item_ex(tItem)
	local szItemName = tItem[1]
	local G, D, P = tItem[2], tItem[3], tItem[4]
	local nItemNum = tItem[5]
	local nRetCode = 0
	
	nRetCode = DelItem(G, D, P, nItemNum)
	if nRetCode == 1 then
		return 1
	else
		WriteLogEx(g_szLogTitle, "Trõ vËt phÈm ", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName(), "Trõ vËt phÈm thÊt b¹i, ".."DelItem return value = "..nRetCode)
		return 0
	end
end

function pay_ex(nNum)
	local nRetCode = 0;
	nRetCode = Pay(nNum)
	if nRetCode == 1 then
		return 1
	else
		WriteLogEx(g_szLogTitle, format("Pay(%d)", nItemNum), nItemNum, "NULL", "NULL", GetTongName(), format("Pay(%d)", nItemNum).." Failed, return value = "..nRetCode)
		return 0
	end
end

function check_item_count(tItem)
	if GetItemCount(tItem[2],tItem[3],tItem[4]) < tItem[5] then
		return 0
	else
		return 1
	end
end

function no()
end

