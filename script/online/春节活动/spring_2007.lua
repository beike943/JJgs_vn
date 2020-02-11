--½Å±¾¹¦ÄÜ£º2007Äê´º½Ú»î¶¯
--½Å±¾¿ª·¢£ºÕÔ¹ó´º
--½Å±¾Éæ¼°ÈÎÎñID£º±äÁ¿£º1275-£¬Ö÷±äÁ¿£º
Include("\\script\\online\\zgc_public_fun.lua")
--2007Äê´º½Ú»î¶¯TaskID¼ÇÂ¼
TaskID_spring2007_pig_color =976
TaskID_spring2007_pig_sex = 977
TaskID_spring2007_pig_level = 978
TaskID_spring2007_pig_feedtime = 979
TaskID_spring2007_pig_handtime = 980
TaskID_spring2007_pig_borntotal = 981
TaskID_spring2007_pig_bornseq = 982
TaskID_spring2007_pig_bornnumtoday = 983
TaskID_spring2007_pig_backcode1 = 984
TaskID_spring2007_pig_backcode2 = 985
--2007Äê´º½Ú»î¶¯Ê±¼äÇøÓò
spring_2007_date_min = 13552
spring_2007_date_max = 13569
--***************************ÎïÆ·Ê¹ÓÃÖ÷º¯Êı****************************
function OnUse(goods_index)
	if Zgc_pub_action_level_chk() ~= 1 then		--µÈ¼¶ÅĞ¶Ï
		return
	end
	if zspring_2007_date_chk() ~= 1 then		--»î¶¯Ê±¼äÅĞ¶Ï
		return
	end
	local goods_id = GetItemParticular(goods_index)
	Msg2Player(goods_id)
	if goods_id >= 546 and goods_id <= 551 then		--Öí±¦±¦
		--test
		--ĞŞ¸ÄÎª²âÊÔÆäÏÖÔÚÊÇ·ñÓĞ¸ú³èÎï
		if GetTask(TaskID_spring2007_pig_color) == nil or GetTask(TaskID_spring2007_pig_color) == 0 then
			pig_baby_use(goods_id)
		else
			Talk(1,"end_dialog","Ng­¬i ®· cã Pet råi, muèn gäi l¹i Pet míi ph¶i dïng XXX phãng thİch!")
		end
	elseif goods_id == 552 then						--ÊÍ·ÅÖí±¦±¦µÀ¾ß
		Say("Dïng vËt phÈm <color=red>phãng thİch<color> pet, sau ®ã gäi l¹i pet míi.",
		2,
		"§æi/pig_delete_chk",
		"§Ó ta suy nghÜ l¹i/end_dialog")
	elseif goods_id == 553 then						--ÑøÖí±¦µä			--test:ÕâÀïÅĞ¶Ï²»×ã¡£ÓĞÎÊÌâ¡£
		local dialog_pig = {}				--ÖíÊÇ·Å»¹ÊÇÊÕµÄ¶Ô»°
		if GetFollower() == 0 then
			dialog_pig[1] = "Ta muèn ®­a thó c­ng/pig_out"
			dialog_pig[2] = "Rêi khái/end_dialog"
		else
			local follower_name = GetNpcName(GetFollower())
			if  follower_name ~= "§æng Ca Minh" and follower_name ~= "Chung ThŞ" then
				dialog_pig[1] = "Ta muèn thu håi thó c­ng/pig_in"
				local pig_level = GetTask(978)
				if pig_level ~= 4 then
					local pig_foods = {"10 b¸nh ng«","20 mµn thÇu"," 50 B¸nh xÕp"}
					dialog_pig[2] = "Ta muèn ch¨m sãc thó c­ng (cÇn"..pig_foods[pig_level]..")/pig_feed"
				else
					dialog_pig[2] = "Ta cÇn thó c­ng/pig_use"
				end
			else
				Talk(1,"end_dialog","Hoµn thµnh nhiÖm vô"..follower_name.."míi cã thÓ gäi thó c­ng")
				return
			end
			dialog_pig[3] = "Ta cÇn ®Æt tªn cho thó c­ng/pig_rename"
			dialog_pig[4] = "Rêi khái/end_dialog"
		end
		Say("Xin lùa chän nh÷ng ®éng t¸c cho thó c­ng:",
			getn(dialog_pig),
			dialog_pig
		)
	end	
end
--*************************Öí±¦±¦µÄÊ¹ÓÃ********************************
function pig_baby_use(goods_id)						--Öí±¦±¦µÄÊ¹ÓÃ
	if goods_id == 546 then
		Say("Sö dông vËt phÈm nµy cã thÓ gäi ®­îc thó c­ng mµu s¾c tïy ı, ng­¬i ®ång ı chø?",
		2,
		"Ta ®ång ı/#pig_create(0,0,"..goods_id..")",		--ĞÔ±ğ¡¢ÑÕÉ«¡¢ÎïÆ·Ë÷Òı
		"§Ó ta suy nghÜ l¹i/end_dialog")		
	elseif goods_id == 547 then
		Say("Sö dông vËt phÈm nµy cã thÓ gäi H¾c tr­, ng­¬i ®ång ı chø?",
		2,
		"Ta ®ång ı/#pig_create(1,0,"..goods_id..")",
		"§Ó ta suy nghÜ l¹i/end_dialog")
	elseif goods_id == 548 then
		Say("Sö dông vËt phÈm nµy cã thÓ gäi ®­îc B¹ch tr­, ng­¬i ®ång ı chø?",
		2,
		"Ta ®ång ı/#pig_create(2,0,"..goods_id..")",
		"§Ó ta suy nghÜ l¹i/end_dialog")
	elseif goods_id == 549 then
		Say("Sö dông vËt phÈm nµy cã thÓ gäi thó c­ng _H¾c tr­, ng­¬i ®ång ı sö dông kh«ng?",
		3,
		"Ta muèn gäi thó c­ng_H¾c Tr­ (bè)/#pig_create(1,1,"..goods_id..")",
		"Ta muèn gäi thó c­ng_H¾c Tr­ (mÑ)/#pig_create(1,2,"..goods_id..")",
		"§Ó ta suy nghÜ l¹i/end_dialog")
	elseif goods_id == 550 then
		Say("sö dông vËt phÈm nµy cã thÓ gäi thó c­ng_B¹ch tr­, ng­¬i ®ång ı chø?",
		3,
		"Ta muèn gäi thó c­ng_B¹ch Tr­ (bè)/#pig_create(2,1,"..goods_id..")",
		"Ta muèn gäi thó c­ng_B¹ch Tr­ (mÑ)/#pig_create(2,2,"..goods_id..")",
		"§Ó ta suy nghÜ l¹i/end_dialog")
	elseif goods_id == 551 then
		Say("Sö dông vËt phÈm nµy cã thÓ gäi ®­îc Hoµng kim tr­, ng­¬i ®ång ı chø?",
		3,
		"Ta muèn gäi Hoµng kim tr­ (bè)/#pig_create(3,1,"..goods_id..")",
		"Ta muèn gäi Hoµng kim tr­ (mÑ)/#pig_create(3,2,"..goods_id..")",
		"§Ó ta suy nghÜ l¹i/end_dialog")
	end
end
--*****************************Î¹ÑøÖí±¦±¦******************************
function pig_feed()
	local feed_distance = (GetTime() - GetTask(TaskID_spring2007_pig_feedtime))
	if feed_distance < 3600 then
		Talk(1,"end_dialog","Ng­¬i muèn cho thó c­ng béi thùc µ? Cßn"..Zgc_pub_time_sec_change(feed_distance,1).." míi cã thÓ cho ¨n!")
		return
	end
	local pig_level = GetTask(TaskID_spring2007_pig_level)
	local pig_foods = {	{1,1,1,10,"10","B¸nh Ng«"},
						{1,1,3,20,"20","Mµn thÇu"},
						{1,1,4,50," 50 ","B¸nh xÕp"}}
	if GetItemCount(pig_foods[pig_level][1],pig_foods[pig_level][2],pig_foods[pig_level][3]) < pig_foods[pig_level][4] then
		Talk(1,"end_dialog","<color=red>"..pig_foods[pig_level][6].." H×nh nh­ kh«ng ®ñ "..pig_foods[pig_level][5].."µ?")
		return
	end
	if DelItem(pig_foods[pig_level][1],pig_foods[pig_level][2],pig_foods[pig_level][3],pig_foods[pig_level][4]) ~= 1 then
		Talk(1,"end_dialog","<color=red>"..pig_foods[pig_level][6].." H×nh nh­ kh«ng ®ñ "..pig_foods[pig_level][5].."µ?")
		return		
	else
		SetTask(978,(pig_level + 1))
		pig_create_rtn(GetNpcName(GetFollower()))
	end
end
--*************************Öí±¦±¦µÄ´´½¨********************************
function pig_create(pig_color,pig_sex,goods_id)
	SetTask(TaskID_spring2007_pig_color,pig_color)			--ÖíµÄÑÕÉ«
	SetTask(TaskID_spring2007_pig_sex,pig_sex)			--ÖíµÄĞÔ±ğ
	SetTask(TaskID_spring2007_pig_level,1)					--ÖíµÄµÈ¼¶
	SetTaskTemp(165,goods_id)
	--ÏÈÉ¾³ıÄ¿Ç°µÄ¸ú³è£¬È»ºóÌí¼ÓĞÂµÄ¸ú³è£¬²¢ÔÚ976ÖĞ¼ÇÂ¼ÏÂ¸ú³èĞÅÏ¢
	AskClientForString("pig_create_rtn","",0,16,"Xin nhËp tªn cña thó c­ng")
end
--****************************ÊÕ»ØÖí±¦±¦*******************************
function pig_in()
	KillFollower()
	Talk(1,"end_dialog","Thó c­ng cña b¹n ®· thu håi, cã thÓ më B¶o §iÓn ra ®Ó gäi l¹i.")
end
--****************************·Å³öÖí±¦±¦*******************************
function pig_out()
	AskClientForString("pig_create_rtn","",0,16,"Xin nhËp tªn cña thó c­ng")
end
--****************************Öí±¦±¦ÖØĞÂÃüÃû***************************
function pig_rename()
	AskClientForString("pig_create_rtn","",0,16,"Xin nhËp l¹i tªn thó c­ng")
end
--****************************Öí±¦±¦µÄ´´½¨»Øµ÷*************************
function pig_create_rtn(pig_name)
	--if GetNpcName(GetFollower()) ~= "" then			--test
	--	Talk(1,"end_dialog","ÄúÄ¿Ç°ÒÑ¾­ÓĞÁËÒ»¸ö¸ú³è£¬ÇëÍê³ÉÈÎÎñºóÔÙÕÙ»½Öí±¦±¦£¡")
	--	return
	--end
	--**************************Ãû×Ö¹ıÂË****************************
	local pigname_forbid_chr = {"CÇu","B¸","Qu©n","L«i","Qu©n","Kim S¬n","chİn","TuyÖt","JS","§æng Ca Minh","Chung ThŞ"}
	for i = 1,getn(pigname_forbid_chr) do
		local startS,endS = strfind(pig_name,pigname_forbid_chr[i])
		if startS then
			Talk(1,"pig_rename","Tªn cña thó c­ng kh«ng ®óng, xin nhËp l¹i!")
			return
		end
	end
	local pig_color = GetTask(TaskID_spring2007_pig_color)
	local pig_sex = GetTask(TaskID_spring2007_pig_sex)
	local pig_level = GetTask(TaskID_spring2007_pig_level)
	local goods_id = GetTaskTemp(165)
	if DelItem(2,0,goods_id,1) ~= 1 then					--ÅĞ¶ÏÉ¾³ıµÀ¾ßÊÇ·ñ³É¹¦
		Talk(1,"end_dialog","Xin x¸c nhËn trong hµnh trang cña b¹n cã thó c­ng <color=red>TiÓu Tr­<color>!")
		return
	end
	local pig_table = {			--ËÄ¸öµÈ¼¶µÄÖí
		{{"S¸t thñ10","S¸t thñ11"},{"S¸t thñ12","S¸t thñ13"},{"S¸t thñ14","S¸t thñ15"}},
		{{"S¸t thñ20","S¸t thñ21"},{"S¸t thñ22","S¸t thñ23"},{"S¸t thñ24","S¸t thñ25"}},
		{{"S¸t thñ30","S¸t thñ31"},{"S¸t thñ32","S¸t thñ33"},{"S¸t thñ34","S¸t thñ35"}},
		{{"S¸t thñ40","S¸t thñ41"},{"S¸t thñ42","S¸t thñ43"},{"S¸t thñ44","S¸t thñ45"}},
	}
	if pig_sex == 0 then
		pig_sex = random(1,2)
	end
	if pig_color == 0 then
		pig_color = random(1,2)
	end
	SetTask(976,pig_color)
	SetTask(977,pig_sex)
	SetTask(979,GetTime())
	SummonNpc(pig_table[pig_level][pig_color][pig_sex],pig_name)
end
--**************************Öí±¦±¦µÄÉ¾³ıÌáÊ¾***************************
function pig_delete_chk()
	Say("B¹n x¸c ®Şnh sö dông vËt phÈm nµy?",
	2,
	"§æi/pig_delete_determine",
	"§Ó ta suy nghÜ l¹i/end_dialog"
	)
end
--**************************Öí±¦±¦µÄÉ¾³ı*******************************
function pig_delete_determine()
	if GetItemCount(2,0,552) == 0 then
		Talk(1,"end_dialog","Xin x¸c nhËn b¹n cã XXX!")  --test
		return
	end
	if DelItem(2,0,552,1) ~= 1 then
		Talk(1,"end_dialog","Xin x¸c nhËn b¹n cã XXX!")  --test
		return		
	end
	--É¾³ı¸ú³è
	KillFollower()
	for i = 974,979 do
		SetTask(i,0)
	end
end
--***********************ÉúĞ¡ÖíµÄ´¥·¢º¯Êı******************************
function pig_born_timer()
	local time_distance = GetTime() - GetTask(TaskID_spring2007_pig_handtime)
	if (time_distance + 56) < 600 then			--¸ø½±ÀøµÄÊ±¼ä»¹Ã»ÓĞµ½µÄÇé¿öÏÂ
		return
	end
	if time_distance > 600 then					--¸ø½±ÀøµÄÊ±¼äÒÑ¾­³¬¹ıÁË£¨´íÎóµÄ´¦Àí£©
		RemoveTrigger(GetTrigger(900))
		return
	end
	local player_index_ask = PlayerIndex		--ÉêÇëÈËµÄË÷Òı
	local player_pig_sex_ask = GetTask(TaskID_spring2007_pig_sex)		-- 1Îª¹«£¬2ÎªÄ¸
	local player_pig_level_ask = GetTask(TaskID_spring2007_pig_level)
	local Player_hand_start_time_ask = GetTask(TaskID_spring2007_pig_handtime)
	
	if GetInteractivePlayerIndex() <= 0 then
		RemoveTrigger(GetTrigger(900))
		return
	end
	PlayerIndex = GetInteractivePlayerIndex()	--½ÓÊÜÈËµÄË÷Òı
	local player_index_accept = PlayerIndex		
	local player_pig_sex_accept = GetTask(TaskID_spring2007_pig_sex)
	local player_pig_level_accept = GetTask(TaskID_spring2007_pig_level)
	local Player_hand_start_time_accept = GetTask(TaskID_spring2007_pig_handtime)
	
	PlayerIndex = player_index_ask
	
	if Player_hand_start_time_accept - Player_hand_start_time_ask > 1 then
		RemoveTrigger(GetTrigger(900))
		return
	end
	
	if (player_pig_sex_ask + player_pig_sex_accept) ~= 3 then
		RemoveTrigger(GetTrigger(900))
		return
	end
	if (palyer_pig_level_ask + player_pig_level_accept) ~= 8 then
		RemoveTrigger(GetTrigger(900))
		return
	end
	--ÕÒµ½Ä¸Öí±¦±¦ËùÔÚµÄÍæ¼Ò£¬²¢½øĞĞÊÇ·ñ¿ÉÒÔÔö¼ÓÖíÍŞÍŞµÄÅĞ¶Ï
	if player_pig_sex_accept == 1 then									--ÕÒµ½Ğ¯´øÄ¸Öí±¦±¦µÄÍæ¼Ò£¬ÅĞ¶ÏÉú³öÖíÍŞÍŞµÄÊıÁ¿¡£
		PlayerIndex = player_index_ask
		if GetTask(TaskID_pig_born_date) > zgc_pub_day_turn(1) then
			return
		elseif GetTask(TaskID_pig_born_date) == zgc_pub_day_turn(1) and GetTask(TaskID_pig_born_num_today) >= 2 then
			return
		end
		if GetTask(TaskID_pig_born_num_total) >= 6 then
			return
		end
	end	
	--Ìí¼ÓÇ°¶ÔÄ¸ÖíĞ¯´øÈËµÄÊı¾İ´¦Àí
	if GetTask(TaskID_spring2007_pig_bornseq) < zgc_pub_day_turn(1) then
		SetTask(TaskID_pig_born_date,zgc_pub_day_turn(1))
		SetTask(TaskID_spring2007_pig_bornnumtoday,1)
	else
		SetTask(TaskID_spring2007_pig_bornnumtoday,2)
	end
	SetTask(TaskID_spring2007_pig_borntotal,(GetTask(TaskID_spring2007_pig_borntotal) + 1))
	--ÖíÍŞÍŞµÄÔö¼Ó
	PlayerIndex = player_index_ask
	local pig_ID = random(546,560)
	if random(1,10) > 5 then
		local add_flag = AddItem(2,0,pig_ID,1)
		if add_flag == 1 then
			Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 TiÓu Tr­")
			local player_name = GetName()
			PlayerIndex = player_index_accept
			Msg2Player("Chóc mõng b¹n vµ"..player_name.."NhËn ®­îc 1 TiÓu Tr­!")
		else
			--Ğ´ÈÕÖ¾
		end
	else
		PlayerIndex = player_index_accept
		local player_name = GetName()
		local add_flag = AddItem(2,0,pig_ID,1)
		if add_flag == 1 then
			Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 TiÓu Tr­")
			local player_name = GetName()
			PlayerIndex = player_index_ask
			Msg2Player("Chóc mõng b¹n vµ"..player_name.."NhËn ®­îc 1 TiÓu Tr­!")
		else
			--Ğ´ÈÕÖ¾
		end
	end
	PlayerIndex = player_index_ask
end
