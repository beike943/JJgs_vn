--File name:	box_npc.lua
--Describe:		ÉñÃØ±¦Ïänpc½Å±¾
--Create Date:	2009-02-18
--Author:		chenbenqian

Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\viet_event\\march_event_09\\march_event_func.lua")

g_szLogTitle = "Event th¸ng 3"				--´Ë´¦·ÖÎª2¶ÎÖ»ÊÇÎªÁË²»Ôö¼ÓÐÂµÄ·­Òë
g_szInfoHead = "<color=green>".."B¶o r­¬ng ThÇn bÝ".."<color>: "

g_tbItem = 
{
	--		Ãû×Ö		ID1,ID2,	ID3,	ÊýÁ¿
	[1] = {"Kú Th¹ch",		2,	1,		30068,	1,	},
	[2] = {"Ch×a Khãa Vµng",	2,	1,		30069,	1,	},
}


function main()
	if is_march_09_viet_open() == 0 then
		Talk(1,"",g_szInfoHead.."Ho¹t ®éng th¸ng 3 ®· kÕt thóc råi");
		return
	end
	local selTab = {
				"Ta muèn më B¶o R­¬ng/open_box",
				"Ta chØ ®Õn xem thö/no",
				}
	Say(g_szInfoHead.."§Ó më ®­îc ThÇn BÝ B¶o R­¬ng, c¸c h¹ ph¶i mang theo Ch×a Khãa Vµng trªn hµnh trang, mçi lÇn më B¶o R­¬ng sÏ tèn 1 Ch×a Khãa Vµng.\n- Ch×a Khãa Vµng cã b¸n t¹i Ngù C¸c..\n- HoÆc sö dông KÑo S÷a còng cã thÓ thu thËp ®­îc Ch×a Khãa Vµng..",getn(selTab),selTab);
end

function open_box()
	if check_item_count(g_tbItem[2]) == 0 then
		Say(g_szInfoHead.."C¸c h¹ kh«ng mang theo Ch×a Khãa Vµng trªn hµnh trang, h·y kiÓm tra l¹i hµnh trang cña m×nh xem!",1,"KÕt thóc ®èi tho¹i/no");
		return
	end
	if gf_Judge_Room_Weight(1,20) == 0 then
		Say(g_szInfoHead.."Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!",1,"KÕt thóc ®èi tho¹i/no");
		return
	end
	if del_item_ex(g_tbItem[2]) == 1 then
		add_item_ex(g_tbItem[1])
	end
end

function add_item_ex(tItem)
	local szItemName = tItem[1]
	local G, D, P = tItem[2], tItem[3], tItem[4]
	local nItemNum = tItem[5]
	local nRetCode = 0

	nRetCode = AddItem(G, D, P, nItemNum)
	if nRetCode == 1 then
		Msg2Player("B¹n nhËn ®­îc  "..nItemNum.." c¸i "..szItemName);
		WriteLogEx(g_szLogTitle, "B¶o r­¬ng ThÇn bÝ", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName(), "Thu ®­îc thÊt b¹i, ".."AddItem return value = "..nRetCode)
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

function check_item_count(tItem)
	if GetItemCount(tItem[2],tItem[3],tItem[4]) < tItem[5] then
		return 0
	else
		return 1
	end
end


function no()

end

