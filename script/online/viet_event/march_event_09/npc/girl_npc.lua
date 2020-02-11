--File name:	girl_npc.lua
--Describe:		¸¾Å®½Ú»î¶¯Çí¶ùnpc½Å±¾
--Create Date:	2009-02-18
--Author:		chenbenqian

Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\viet_event\\march_event_09\\march_event_func.lua")

g_szLogTitle = "Event thang 3"			--´Ë´¦·ÖÎª2¶ÎÖ»ÊÇÎªÁË²»Ôö¼ÓÐÂµÄ·­Òë
g_szInfoHead = "<color=green>".."Quúnh Nhi TiÓu Th­".."<color>: "

g_tbItem = 
{
	--		Ãû×Ö		ID1,ID2,	ID3,	ÊýÁ¿ ÆÚÏÞ
	[1] = {"Hoa hång ®á",	0,	108,	117,	1,	14},
	[2] = {"Hoa hång phÊn",	0,	108,	118,	1,	14},
	[3] = {"Hoa hång vµng",	0,	108,	119,	1,	14},
	[4] = {"Hoa hång ®á",	0,	108,	120,	1,	14},
	[5] = {"Hoa hång phÊn",	0,	108,	121,	1,	14},
	[6] = {"Hoa hång vµng",	0,	108,	122,	1,	14},
	[7] = {"Tñ ¸o",		2,	1,		30070,	1,	14},
}


function main()
	if is_women_0308_09_viet_open() == 0 then
		Talk(1,"",g_szInfoHead.."Ho¹t ®éng  quèc tÕ phô n÷ ®· kÕt thóc");
		return
	end
	local selTab = {
				"T¹i h¹ ®Õn ®Ó nhËn th­ëng.!/want_award",
				"Ta chØ ®Õn xem thö/no",
				}
	Say(g_szInfoHead.."Nh»m chµo mõng ngµy Quèc TÕ Phô N÷, tÊt c¶ c¸c nh©n vËt n÷ ®¹t cÊp ®é 40 trë lªn cã thÓ ®Õn gÆp Quúnh Nhi TiÓu Th­ ®Ó nhËn quµ tÆng..\nHo¹t ®éng chØ diÔn ra trong 3 ngµy: tõ ngµy 06 ®Õn 24:00 ngµy 08-03-2009.",getn(selTab),selTab);
end

function want_award()
	if GetSex() ~= 2 then
		Say(g_szInfoHead.."ChØ cã nh©n vËt n÷ míi nhËn ®­îc phÇn th­ëng!",1,"KÕt thóc ®èi tho¹i/no");
		return
	end
	if GetLevel() < 40 then
		Say(g_szInfoHead.."C« n­¬ng ch­a ®ñ cÊp ®é ®Ó nhËn quµ tÆng lÇn nµy. H·y cè g¾ng lªn nhÐ!",1,"V©ng! T¹i h¹ sÏ quay l¹i sau khi cã ®ñ nguyªn liÖu!!/no");
		return
	end
	if GetPlayerRoute() == 0 then
		Say(g_szInfoHead.."Ho¹t ®éng nµy yªu cÇu ng­êi ch¬i ph¶i gia nhËp vµo m«n ph¸i.",1,"KÕt thóc ®èi tho¹i/no");
		return
	end
	if GetTask(GAIN_AWARD_09_WOMEN_0308_VIET) == 1 then
		Say(g_szInfoHead.."C« n­¬ng ®· nhËn phÇn th­ëng råi, kh«ng thÓ nhËn thªm ®­îc n÷a. HÑn gÆp l¹i nhÐ!",1,"KÕt thóc ®èi tho¹i/no");
		return
	end
	if gf_Judge_Room_Weight(2,20) == 0 then
		Say(g_szInfoHead.."Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!",1,"KÕt thóc ®èi tho¹i/no");
		return
	end
	give_award();
end

function give_award()
	local nRandom = random(1,3)
	if GetBody() == 3 then
		add_item_ex(g_tbItem[nRandom])
	elseif GetBody() == 4 then
		add_item_ex(g_tbItem[nRandom+3])
	end
	add_item_ex(g_tbItem[7])
	SetTask(GAIN_AWARD_09_WOMEN_0308_VIET, 1)
end

function add_item_ex(tItem)
	local szItemName = tItem[1]
	local G, D, P = tItem[2], tItem[3], tItem[4]
	local nItemNum = tItem[5]
	local nRetCode = 0
	local nItemIdx = 0

	nRetCode, nItemIdx = AddItem(G, D, P, nItemNum)
	if nRetCode == 1 then
		if tItem[6] > 0 then
			SetItemExpireTime(nItemIdx, tItem[6]*24*3600)
		end
		Msg2Player("B¹n nhËn ®­îc  "..nItemNum.." c¸i "..szItemName);
		WriteLogEx(g_szLogTitle, "Quúnh Nhi", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName(), "Thu ®­îc thÊt b¹i, ".."AddItem return value = "..nRetCode)
	end
end


function no()

end

