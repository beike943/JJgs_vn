--File name:	xmas_notify_pouch.lua
--Describe:		½õÄÒ´óÊÂ¼ş½Å±¾
--Item ID:		2,1,30045
--Create Date:	2008-11-18
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\xmas_08\\xmas_func.lua")
Include("\\script\\lib\\globalfunctions.lua")


g_szLogTitle = "Giang Sinh 2008"		--´Ë´¦·ÖÎª2¶ÎÖ»ÊÇÎªÁË²»Ôö¼ÓĞÂµÄ·­Òë

g_tbMap = 
{
	[100] = QZ_LUCK_BOX_NUM_XMAS_VIET,
	[200] = BJ_LUCK_BOX_NUM_XMAS_VIET,
	[300] = CD_LUCK_BOX_NUM_XMAS_VIET,
}


function OnUse()
	if is_xmas_08_viet_open() == 0 then
		return
	end

	if GetTask(GAIN_STAR_08_XMAS_VIET) == 0 then
		if GetLevel() >= 50 then
			if gf_Judge_Room_Weight(1, 20) == 0 then
				Msg2Player("Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!")
				return
			end
			
			add_item_ex( {"Ng«i Sao Gi¸ng Sinh",	2,	1,	30044,	1} )
			SetTask(GAIN_STAR_08_XMAS_VIET, 1)
		end
	end
	local selTab = {
			"Gi¸ng Sinh Êm ¸p Cïng B¨ng Nhi./#xmas_08_info_viet(1)",
			"Quµ TÆng Cña C©y Th«ng./#xmas_08_info_viet(2)",
			"Truy T×m C©y Th«ng./#xmas_08_info_viet(3)",
			"Vui Gi¸ng Sinh Cïng Nhau NhËn Th­ëng./#xmas_08_info_viet(4)",
			"S¾c Mµu Ph¸o Hoa./#xmas_08_info_viet(5)",
			"NhËn hép quµ may m¾n (Vui gi¸ng sinh cïng nhau nhËn th­ëng)/obtain_lucky_box",
			"KÕt thóc ®èi tho¹i/no"
			}
	
	Say("Gi¸ng sinh l¹i vÒ trªn toµn câi Vâ L©m. Nhµ nhµ, ng­êi ng­êi ®ang rén rµng chµo ®ãn 1 ®ªm gi¸ng sinh an lµnh bªn ng­êi th©n cña m×nh. Ho¹t ®éng gi¸ng sinh b¾t ®Çu tõ 06-12-2008 ®Õn 04-01-2009, c¸c vŞ cã thÓ t×m hiÓu th«ng tin chi tiÕt sù kiÖn nh­ sau:\n",getn(selTab),selTab);
end
function xmas_08_info_viet(nType)
	local selTab =
	{
		{
		"Ho¹t ®éng Gi¸ng Sinh Êm ¸p Cïng B¨ng Nhi diÔn ra tõ ngµy 06-12-2008 ®Õn 24:00 ngµy 04-01-2009. Trong thêi gian ho¹t ®éng, c¸c vŞ vâ l©m nh©n sÜ cã thÓ th«ng qua ®¸nh qu¸i vµ tham gia c¸c tİnh n¨ng trong game ®Ó thu thËp Hép Quµ Gi¸ng Sinh. Më c¸c Hép quµ gi¸ng sinh ®Ó thu thËp c¸c nguyªn liÖu cÇn thiÕt, ®èi tho¹i víi NPC B¨ng Nhi ®Ó ®æi lÊy c¸c Hép Quµ, më c¸c hép quµ sÏ nhËn ®­îc phÇn th­ëng. RÊt nhiÒu phÇn th­ëng ®ang chê quı vŞ!.",
		},
		
		{
		"Ho¹t ®éng Quµ TÆng C©y Th«ng diÔn ra tõ 06-12-2008 ®Õn 24:00 04-01-2009. trong thêi gian sù kiÖn, tÊt c¶ c¸c tµi kho¶n ®­îc t¹o míi trong thêi gian nµy cã nh©n vËt ®¹t cÊp 55, ®iÓm s­ m«n lín h¬n 1200, danh väng lín h¬n 600, ®iÓm Tµng KiÕm lín h¬n 1000 vµ ®iÓm c«ng tr¹ng Tèng Liªu lín h¬n 500 th× cã thÓ ®Õn ®èi tho¹i víi NPC C©y Th«ng GI¸ng Sinh ®Ó nhËn Long HuyÕt Hoµn vµ 1 Hép Quµ. Sö dông Long HuyÕt Hoµn ®Ó ®¹t ngay cÊp ®é 73, sö dông Hép Quµ ®Ó së h÷u 1 trong nh÷ng trang bŞ Tµng KiÕm 8x.",
		},
			
		{
		"Ho¹t ®éng Truy T×m C©y Th«ng diÔn ra vµo c¸c ngµy thø s¸u, thø b¶y vµ chñ nhËt hµng tuÇn, tõ ngµy 06-12-2008 ®Õn 24:00 ngµy 04-01-2009. Mçi ngµy cã 4 ®ît xuÊt hiÖn c©y th«ng trªn c¸c b¶n ®å (13:30, 14:00, 19:00, 22:30) c¸c vŞ vâ l©m nh©n sÜ h·y dïng vËt phÈm C©y KÑo Gi¸ng Sinh (cã b¹n t¹i NPC B¨ng Nhi) ®Ó trang trİ c¸c c©y th«ng ®­îc ph©n bæ trªn c¸c b¶n ®å chØ ®Şnh. Mçi ngµy chØ cã thÓ trang trİ 10 c©y th«ng. H·y nhí bËt chøc n¨ng chiÕn ®Êu(F9) lªn nhĞ!",
		},
			
		{
		"Ho¹t ®éng vui gi¸ng sinh cïng nhau nhËn th­ëng diÔn ra vµo c¸c ngµy thø 7 chñ nhËt tõ 06-12-2008 ®Õn 24:00 04-01-2009. Mçi ngµy tõ 13:300 ®Õn 14:30 (1 tiÕng), tÊt c¶ vâ l©m nh©n sü cã thÓ th«ng qua cÈm nang ®¹i sù kiÖn hoÆc ®èi tho¹i víi NPC C©y Th«ng Gi¸ng Sinh (6 ®¹i thµnh thŞ) th× cã thÓ thu ®­îc Hép Quµ May M¾n. Ngoµi ra mçi ngµy sÏ cã 1 nh©n vËt ®­îc lùa chän ngÉu nhiªn ®Ó trao tÆng phÇn quµ ®Æc biÖt, ®æi hép quµ ®Æc biÖt ë NPC Gi¸o SÜ.",
		},
			
		{
		"Ho¹t ®éng Ph¸o Hoa diÔn ra vµo c¸c ngµy thø 6, thø 7 vµ chñ nhËt hµng tuÇn ngµy 06-12-2008 ®Õn 24:00 04-01-2008. Trong thêi gian tõ 13:00 ®Õn 15:00, c¸c vŞ vâ l©m nh©n sÜ cã thÓ ®Õn NPC Th­¬ng Nh©n T©y Vùc ®Ó nhËn 10 Ph¸o Hoa, sö dông ph¸o hoa ®Ó nhËn phÇn th­ëng, chØ cã thÓ sö dông tèi ®a 10 ph¸o hoa trong 1 ngµy. Ngoµi ra, c¸c vŞ vâ l©m nh©n sÜ cßn cã c¬ héi së h÷u nh÷ng bé ngo¹i trang ®Ñp m¾t khi tham gia ®èt ph¸o hoa.",
		},
	}

	Say(selTab[nType][1], 1, "Ta muèn xem ho¹t ®éng kh¸c/OnUse" );
end

function obtain_lucky_box()
	local nWeek = tonumber(date("%w"))
	if nWeek ~= 6 and nWeek ~= 0 then
		Say("C¸c h¹ vÉn ch­a ®ñ ®iÒu kiÖn lÜnh th­ëng",1,"KÕt thóc ®èi tho¹i/no")
		return
	end

	local nTime = tonumber(date("%H%M"))
	if nTime < 930 or nTime >= 1033 then
		Say("C¸c h¹ vÉn ch­a ®ñ ®iÒu kiÖn lÜnh th­ëng",1,"KÕt thóc ®èi tho¹i/no")
		return
	end
	
	local nDate = tonumber(date("%Y%m%d"))
	if nDate > GetTask(LUCK_BOX_DATE_08_XMAS_VIET) then
		SetTask(LUCK_BOX_DATE_08_XMAS_VIET, nDate)
		SetTask(LUCK_BOX_NUM_08_XMAS_VIET, 0)
		SetTask(LUCK_BOX_TURN_08_XMAS_VIET, 0)
	end
	
	if GetTask(LUCK_BOX_NUM_08_XMAS_VIET) >= 6 then
		Say("Mçi ngµy mçi nh©n vËt chØ cã thÓ nhËn 6 hép quµ may m¾n.",1,"KÕt thóc ®èi tho¹i/no")
		return
	end

	local tTime =
	{
		{930,938},
		{939,947},
		{948,956},
		{957,1005},
		{1006,1014},
		{1015,1023},
		{1024,1032},
	}
	local nTurn = 0
	local nTurnNum = getn(tTime)
	for i = 1, nTurnNum do
		if nTime >= tTime[i][1] and nTime <= tTime[i][2] then
			nTurn = i
			break
		end
	end
	if GetTask(LUCK_BOX_TURN_08_XMAS_VIET) == nTurn then
		Say("C¸c h¹ vÉn ch­a ®ñ ®iÒu kiÖn lÜnh th­ëng",1,"KÕt thóc ®èi tho¹i/no")
		return
	else
		if gf_Judge_Room_Weight(1, 20) == 0 then
			Msg2Player("Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!")
			return
		end

		add_item_ex( {"Hép Quµ May M¾n",	2,	1,	30038,	1} )
		SetTask(LUCK_BOX_TURN_08_XMAS_VIET, nTurn)
		SetTask(LUCK_BOX_NUM_08_XMAS_VIET, GetTask(LUCK_BOX_NUM_08_XMAS_VIET)+1 )

		local nMapID = GetWorldPos()
		if GetGlbValue(AWARD_MAP_IDX_XMAS_VIET) == nMapID then
			if GetGlbValue(AWARD_TURN_XMAS_VIET) == nTurn then
				SetGlbValue(g_tbMap[nMapID], GetGlbValue(g_tbMap[nMapID])+1)
				if GetGlbValue(g_tbMap[nMapID]) == 68 then
					add_item_ex( {"Hép Quµ §Æc BiÖt",	2,	1,	30037,	1} )
				end
			end
		end
	end
end

function add_item_ex(tItem)
	local szItemName = tItem[1]
	local G, D, P = tItem[2], tItem[3], tItem[4]
	local nItemNum = tItem[5]
	local nRetCode = 0

	nRetCode = AddItem(G, D, P, nItemNum)
	if nRetCode == 1 then
		Msg2Player("B¹n nhËn ®­îc  "..nItemNum.." c¸i "..szItemName..", VÉn cßn rÊt nhiÒu phÇn th­ëng ®ang chê b¹n, xin mêi h·y tiÕp tôc tham gia ho¹t ®éng.");
		WriteLogEx(g_szLogTitle, "CÈm Nang §¹i Sù KiÖn", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "CÈm Nang §¹i Sù KiÖn", "", "", "", "", "Thu ®­îc thÊt b¹i, ".."AddItem return value = "..nRetCode)
	end
end

function no()
end



