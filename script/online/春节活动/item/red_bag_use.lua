--½Å±¾Ãû³Æ£ºĞÂÄê»î¶¯ºì°üÊ¹ÓÃ½Å±¾
--½Å±¾¹¦ÄÜ£ºÊ¹ÓÃ½ğÖíĞ¡¸£´ü¡¢½ğÖíĞ¡ºì°ü¡¢½ğÖí´óºì°ü»»È¡Ïà¹ØµÄ»î¶¯½±Àø
--²ß»®ÈË£º°¢ËÉ
--´úÂë±àĞ´ÈË£ºÕÔ¹ó´º
--´úÂë±àĞ´Ê±¼ä£º2007-01-31
--ĞŞ¸Ä¼ÇÂ¼£º
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı
--=========================¹«¹²±äÁ¿¶¨ÒåÇø========================
prize_list = {
	{627,"Tói tiÓu phóc Kim Tr­",1180000,180000,18,120},
	{628,"TiÓu Hång Bao Kim Tr­",0.01,5,10,1},
	{629,"§¹i Hång Bao Kim Tr­",0.015,8,15,1,240,1,50}
}
--==========================½Å±¾Ö÷Âß¼­Çø=========================
--**************************ÎïÆ·Ê¹ÓÃÖ÷º¯Êı********************
function OnUse(goods_index)
	local goods_id = GetItemParticular(goods_index)
	local goods_diff = 0
	for i = 1, getn(prize_list) do
		if prize_list[i][1] == goods_id then
			goods_diff = i
			break
		end
	end
	Say("Dïng <color=green>"..prize_list[goods_diff][2].."<color> cã thÓ ®æi phÇn th­ëng t­¬ng øng, ®ång ı chø?",
		2,
		"§æi"..prize_list[goods_diff][2].."/#goods_use_det("..goods_diff..")",
		"§Ó ta suy nghÜ l¹i/end_dialog")
end
--******************************½±Àø·¢·Å**********************
function goods_use_det(goods_diff)
	if GetItemCount(2,0,prize_list[goods_diff][1]) == 0 then		--ÎïÆ·¼ì²â
		Talk(1,"","Xin x¸c nhËn trong tói hµnh lang cña b¹n cã <color=green>"..prize_list[goods_diff][2].."<color>!")
		return
	end
	if Zgc_pub_goods_add_chk(3,100) ~= 1 then						--°ü¹ü¸ºÖØ/¿Õ¼ä¼ì²â
		return
	end
	if DelItem(2,0,prize_list[goods_diff][1],1) ~= 1 then			--É¾³ıÎïÆ·¼ì²â
		Talk(1,"","Xin x¸c nhËn trong tói hµnh lang cña b¹n cã <color=green>"..prize_list[goods_diff][2].."<color>!")
		return		
	end
	if goods_diff == 1 then
		--½¡¿µ¾­Ñé×ª¾­Ñé
		local player_level = GetLevel()
		local exp_num = player_level * player_level * player_level
		ModifyExp(exp_num)
		Msg2Player("Chóc mõng b¹n sö dông"..prize_list[goods_diff][2].."NhËn ®­îc "..exp_num.." ®iÓm kinh nghiÖm!")
		--Ôö¼ÓÉùÍû
		ModifyReputation(prize_list[1][5],0)
		--Ôö¼Ó°×¾ÔÊ¹ÓÃÊ±¼ä
		SetTask(2501,(GetTask(2501)+prize_list[1][6]))
		Msg2Player("B¹n nhËn ®­îc 2 giê sö dông B¹ch c©u!")
	else
		if goods_diff == 3 then
			--Ôö¼Ó°×¾ÔÊ¹ÓÃÊ±¼ä
			SetTask(2501,(GetTask(2501)+prize_list[goods_diff][7]))
			Msg2Player("B¹n nhËn ®­îc 4 giê sö dông B¹ch c©u!")
			--ÃØ¼®Ôö¼Ó
			local ran_num = random(1,100)
			if ran_num == 37 then
				local add_flag = AddItem(0,107,155,1)
				if add_flag == 1 then
					Msg2Player("Chóc mõng b¹n nhËn ®­îc ngò hµnh mËt tŞch!")
					Msg2SubWorld("Ng­êi ch¬i:"..GetName().."Sö dông "..prize_list[goods_diff][2].."NhËn ®­îc MËt tŞch ngò hµnh!")
				else
					WriteLog("Ho¹t ®éng t©n niªn sö dông Kim Tr­ §¹i Hång Bao: Ng­êi ch¬i:"..GetName().."T¨ng [MËt tŞch ngò hµnh] thÊt b¹i, täa ®é thÊt b¹i:"..add_flag)
				end
			elseif ran_num <= 50 then
				Faction_book_add(goods_diff)
			end
		elseif goods_diff == 2 then
			Earn(80000)
		end
		local exp_num = floor(Zgc_pub_player_uplevel_num_rtn(1) * prize_list[goods_diff][3])
		ModifyExp(exp_num)
		Msg2Player("Chóc mõng b¹n sö dông"..prize_list[goods_diff][2].."NhËn ®­îc "..exp_num.." ®iÓm kinh nghiÖm!")
		local iron_num = random(prize_list[goods_diff][4],prize_list[goods_diff][5])
		local add_flag = AddItem(2,2,8,iron_num)
		if add_flag == 1 then
			Msg2Player("Chóc mõng b¹n nhËn ®­îc "..iron_num.." s¾t!")
		end
		local weapon_id =random(375,(375+11))
		add_flag = AddItem(2,1,weapon_id,prize_list[goods_diff][6])
		if add_flag == 1 then
			Msg2Player("B¹n nhËn ®­îc mãn vò khİ!")
		end
		spring2007_spring_goods_add()
	end
end
--**********************Ê¦ÃÅÃØ¼®Ôö¼Ó**************************
function Faction_book_add(goods_diff)
	local book_name = {"Kim Cang Phôc Ma kinh","TiÒm Long MËt tŞch","V« TrÇn MËt tŞch","Thiªn La MËt TŞch","Nh­ ı MËt TŞch","Bİch H¶i Phæ","Hçn §én MËt tŞch",
						"Quı Thiªn MËt tŞch","HuyÒn ¶nh MËt tŞch","Qu©n Tö MËt tŞch","TrÊn Qu©n MËt tŞch","Xuyªn V©n MËt tŞch","U Minh Quû Lôc","Linh Cæ MËt tŞch"}
	local book_seq = random(1,getn(book_name))
	local book_id = ((book_seq - 1) * 2) + 1
	local add_flag = AddItem(0,107,book_id,1)
	if add_flag == 1 then
		Msg2Player("Chóc mõng b¹n nhËn ®­îc "..book_name[book_seq].."!")
		Msg2SubWorld("Ng­êi ch¬i:"..GetName().."Sö dông "..prize_list[goods_diff][2].."NhËn ®­îc "..book_name[book_seq].."!")
	else
		WriteLog("Ho¹t ®éng t©n niªn sö dông Kim Tr­ §¹i Hång Bao: Ng­êi ch¬i:"..GetName().."T¨ng"..book_name[book_seq].." thÊt b¹i, kı hiÖu:"..add_flag)
	end
	return
end
