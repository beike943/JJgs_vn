--File name:	city_xmas_tree_npc.lua
--Describe:		Ê¥µ®Ê÷(³ÇÊÐ)npc½Å±¾
--Create Date:	2008-11-18
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\xmas_08\\xmas_func.lua")
Include("\\script\\lib\\globalfunctions.lua")

g_szLogTitle = "Giang Sinh 2008"				--´Ë´¦·ÖÎª2¶ÎÖ»ÊÇÎªÁË²»Ôö¼ÓÐÂµÄ·­Òë
g_szInfoHead = "<color=green>".."C©y th«ng gi¸o héi".."<color>: "


g_tbMap = 
{
	[100] = QZ_LUCK_BOX_NUM_XMAS_VIET,
	[200] = BJ_LUCK_BOX_NUM_XMAS_VIET,
	[300] = CD_LUCK_BOX_NUM_XMAS_VIET,
}

function main()
	if is_xmas_08_viet_open() == 0 then
		return
	end
	local selTab = {				
				"NhËn LÔ Hép vµ Long HuyÕt Hoµn/obtain_new_xmas_box",
				"NhËn hép quµ may m¾n (Vui gi¸ng sinh cïng nhau nhËn th­ëng)/obtain_lucky_box",
				"Ta chØ ®Õn xem thö/no",
				}
	Say(g_szInfoHead.."Ho¹t ®éng Quµ TÆng  C©y Th«ng Gi¸ng Sinh diÔn ra tõ ngµy 06-12-2008 ®Õn 24:00 ngµy 04-01-2009. Trong thêi gian sù kiÖn, tÊt c¶ c¸c tµi kho¶n ®­îc t¹o míi trong thêi gian nµy cã nh©n vËt ®¹t cÊp 55 trë lªn, ®iÓm s­ m«n lín h¬n 1200, ®iÓm danh väng lín h¬n 600, ®iÓm tÝch lòy Tµng KiÕm lín h¬n 1000 vµ ®iÓm tÝch lòy c«ng tr¹ng Tèng Liªu lín h¬n 500 th× cã thÓ ®Õn ®èi tho¹i víi NPC C©y Th«ng Gi¸ng Sinh ®Ó nhËn vËt phÈm Long HuyÕt Hoµn vµ 1 Hép Quµ.",getn(selTab),selTab);
end


function obtain_new_xmas_box()

	if GetTask(GAIN_PILL_08_XMAS_VIET) == 1 then
		Say(g_szInfoHead.."§¹i hiÖp ®· nhËn råi, kh«ng thÓ tiÕp tôc nhËn ®­îc n÷a!",1,"ThËt lµ ng¹i qu¸! T¹i h¹ xin c¸o tõ./no")
		return
	end
	
	if GetTask(GAIN_NEW_BOX_08_XMAS_VIET) == 1 then
		Say(g_szInfoHead.."§¹i hiÖp ®· nhËn råi, kh«ng thÓ tiÕp tôc nhËn ®­îc n÷a!",1,"ThËt lµ ng¹i qu¸! T¹i h¹ xin c¸o tõ./no")
		return
	end
	
	if is_could_award() == 0 then
		Say(g_szInfoHead.."C¸c h¹ vÉn ch­a ®ñ ®iÒu kiÖn lÜnh th­ëng",1,"ThËt lµ ng¹i qu¸! T¹i h¹ xin c¸o tõ./no")
		return
	end
	
	if gf_Judge_Room_Weight(2,40) == 0 then
		Talk(1,"",g_szInfoHead.."Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!")
		return
	end
	if GetExtPoint(4) == 1 then
		if PayExtPoint(4,1) == 1 then
			if GetExtPoint(4) == 0 then		
				local nRetCode, nItemIdx = add_item_ex( {"Long HuyÕt hoµn",	2,	1,	1002,	1} )
				SetTask(GAIN_PILL_08_XMAS_VIET, 1)
				if nRetCode == 1 then
					SetItemExpireTime(nItemIdx, 7*24*3600)		
				end
				
				nRetCode = add_item_ex( {"Hép quµ",	2,	1,	30035,	1} )
				SetTask(GAIN_NEW_BOX_08_XMAS_VIET, 1)
				if nRetCode == 1 then
					Say(g_szInfoHead.."RÊt tèt! Ng­êi ®· ®¹t cÊp 55 råi sao? §©y lµ phÇn quµ cña ng­¬i, h·y mau mau sö dông, kh«ng khÐo l¹i hÕt h¹n sö dông.",1,"§a t¹ c©y th«ng gi¸ng sinh/no")
				end
			end
		end
	end
end


function obtain_lucky_box()
	local nWeek = tonumber(date("%w"))
	if nWeek ~= 6 and nWeek ~= 0 then
		Say(g_szInfoHead.."C¸c h¹ vÉn ch­a ®ñ ®iÒu kiÖn lÜnh th­ëng",1,"KÕt thóc ®èi tho¹i/no")
		return
	end

	local nTime = tonumber(date("%H%M"))
	if nTime < 930 or nTime >= 1033 then
		Say(g_szInfoHead.."C¸c h¹ vÉn ch­a ®ñ ®iÒu kiÖn lÜnh th­ëng",1,"KÕt thóc ®èi tho¹i/no")
		return
	end

	local nDate = tonumber(date("%Y%m%d"))
	if nDate > GetTask(LUCK_BOX_DATE_08_XMAS_VIET) then
		SetTask(LUCK_BOX_DATE_08_XMAS_VIET, nDate)
		SetTask(LUCK_BOX_NUM_08_XMAS_VIET, 0)
		SetTask(LUCK_BOX_TURN_08_XMAS_VIET, 0)
	end
	
	if GetTask(LUCK_BOX_NUM_08_XMAS_VIET) >= 6 then
		Say(g_szInfoHead.."Mçi ngµy mçi nh©n vËt chØ cã thÓ nhËn 6 hép quµ may m¾n.",1,"KÕt thóc ®èi tho¹i/no")
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
		Say(g_szInfoHead.."C¸c h¹ vÉn ch­a ®ñ ®iÒu kiÖn lÜnh th­ëng",1,"KÕt thóc ®èi tho¹i/no")
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
	local nItemIdx = 0

	nRetCode, nItemIdx = AddItem(G, D, P, nItemNum)
	if nRetCode == 1 then
		Msg2Player("B¹n nhËn ®­îc  "..nItemNum.." c¸i "..szItemName..", VÉn cßn rÊt nhiÒu phÇn th­ëng ®ang chê b¹n, xin mêi h·y tiÕp tôc tham gia ho¹t ®éng.");
		WriteLogEx(g_szLogTitle, "C©y Th«ng Gi¸ng Sinh", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "C©y Th«ng Gi¸ng Sinh", "", "", "","", "Thu ®­îc thÊt b¹i, ".."AddItem return value = "..nRetCode)
	end
	return nRetCode, nItemIdx
end


function is_could_award()
	if GetCreateTime() < 1228406400 or GetCreateTime() >= 1231084800 then
		return 0
	end
	if GetExtPoint(4) ~=1 then
		return 0
	end
	if GetLevel() < 55 then
		return 0
	end
	if GetReputation() <= 600 then
		return 0
	end
	if GetTask(336) <= 1200 then
		return 0
	end
	if GetTask(1801) <= 1000 then
		return 0
	end
	if abs(GetTask(701)) <= 500 then
		return 0
	end
	return 1
end


function no()
end


