--=============================================
--create by zhangming 2010.6.18
--describe:Ô½ÄÏ°æ2010Äê7ÔÂ»î¶¯1 »ìÔª¹¦4³É½Å±¾ÎÄ¼þ
--=============================================

Include("\\script\\online_activites\\2010_07\\activites_01\\head.lua");--»î¶¯Í·ÎÄ¼þ
Include("\\script\\online_activites\\2010_07\\activites_01\\item\\item_hunyuan.lua");--»î¶¯Í·ÎÄ¼þ
Include("\\script\\online\\chuyen_sinh\\translife_head.lua")  -- ChuyÓn sinh VN

--g_szItemSayHead = gf_FixColor(VET_201007_01_TB_ITEM_LIST[17][1], 2, 1);

function OnUse(nItemIdx)
	if GetTranslifeCount() < 2 then
		Talk(1,"","Ph¶i luyÖn thµnh Hçn Nguyªn C«ng thµnh thø 4 míi cã thÓ sö dông vËt phÈm nµy")
		return
	end

    local tSay = {}
    local szHeader = "Chóc mõng c¸c h¹ ®· ®¹t ®Õn ®Ønh cao cña Hçn Nguyªn C«ng thµnh thø 4, h·y chän phÇn th­ëng hç trî :"
   	tinsert(tSay, "N©ng cÊp thó c­ìi Kú L©n (cÇn 1 Phiªu Vò + 100 vµng)/do_bonus")
   	tinsert(tSay, "Tho¸t/do_nothing")
   	
   	Say(szHeader, getn(tSay), tSay)
end

function do_bonus()
	if GetLevel() < 98 then
		Talk(1,"","§¼ng cÊp 98 trë lªn míi cã thÓ sö dông chøc n¨ng nµy!")
		return
	end
	if GetCash() < 1000000 then
		Talk(1,"","Ch­a ®ñ ng©n l­îng ®Ó ®æi!")
		return
	end
	if gf_JudgeRoomWeight(2, 300) == 0 then
		Talk(1,"","Hµnh trang kh«ng ®ñ chç trèng hoÆc ®é nÆng, vui lßng s¾p xÕp l¹i!")
		return
	end
	local nG, nD, nP  = GetPlayerEquipInfo(10)
	local nItemIdx = GetPlayerEquipIndex(10)
	if nItemIdx ==0 then
		Talk(1,"","B¹n ph¶i trang bÞ ngùa míi cã thÓ ®æi ®­îc!")
		return
	end
	if nG ~= 0 or nD ~= 105 or nP ~= 15 then
		Talk(1,"","B¹n ph¶i trang bÞ Phiªu Vò míi cã thÓ ®æi ®­îc!")
		return
	end
	local horse_time_limit = 30 * 24 * 3600
	local nExpireTime = GetItemExpireTime(nItemIdx)
	if nExpireTime <= 0 or nExpireTime == nil then
		nExpireTime = horse_time_limit
	end
	
	if DelItemByIndex(nItemIdx, -1) == 1 and Pay(1000000) == 1 then	
		local nOk, nItemIndex = AddItem(0, 105, 33, 1, 1, 3, 403)
		if nOk == 1 then
			SetItemStatus(nItemIndex, 0, 1)
			SetItemExpireTime(nItemIndex, nExpireTime)
		end
		Msg2Player("NhËn ®­îc thó c­ìi Kú L©n.")
		gf_WriteLogEx("Ho tro Chuyen Sinh 2", "®æi Kú L©n")
	end
end

function do_nothing()
	
end