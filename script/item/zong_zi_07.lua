--½Å±¾Ãû³Æ£º07Äê¶ËÎç½Ú½Å±¾
--½Å±¾¹¦ÄÜ£ºôÕ×ÓÊ¹ÓÃ¶ÔÓ¦½Å±¾
--²ß»®ÈË£ºĞ¡ÌìÌì
--´úÂë¿ª·¢ÈË£º´å³¤
--´úÂë¿ª·¢Ê±¼ä£º2007-05-25
--´úÂëĞŞ¸Ä¼ÇÂ¼£º
	Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı
	happy_zong_zi_num_TaskID = 1229
	aixiang_eat_num_TaskID = 1243
	happy_zong_zi_date_TaskID = 1244
--==============================================¹«¹²±äÁ¿¶¨ÒåÇø====================================
	TB_zongzi_use_fun = {}
	TB_zongzi_use_fun[1123] = {"b¸nh İt ng¶i h­¬ng","Cã thÓ nhËn ®­îc <color=yellow>10 v¹n*®¼ng cÊp*®¼ng cÊp/6400<color> ®iÓm kinh nghiÖm.","return zong_zi_exp_chg(100000)"}
	TB_zongzi_use_fun[1124] = {"b¸nh İt ch©n gµ","Cã thÓ t¨ng Sinh lùc tèi ®a <color=yellow>30%<color>, duy tr× <color=yellow>10<color> phót!","return zong_zi_life_add(30,10800)"}
	TB_zongzi_use_fun[1125] = {"b¸nh İt B¸c B¶o","T¨ng toµn bé n¨ng lùc<color=yellow>60<color> ®iÓm, duy tr× <color=yellow>3<color> phót.","return zong_zi_all_add(60,3240)"}
--==============================================¹¦ÄÜÖ÷Âß¼­Çø======================================
function OnUse(goods_index)
	local goods_id = GetItemParticular(goods_index)
	Say("<color=green>Gîi ı <color>: Sö dông <color=yellow>"..TB_zongzi_use_fun[goods_id][1].."<color>"..TB_zongzi_use_fun[goods_id][2].."B¹n cã muèn sö dông kh«ng?",
	2,
	"§æi/#use_dtm("..goods_id..")",
	"§Ó suy nghÜ/end_dialog"
	)
end
function use_dtm(goods_id)
	if GetItemCount(2,1,goods_id) == 0 then
		Talk(1,"","<color=green>Gîi ı <color>: Xin h·y x¸c nhËn b¹n ®· mang theo <color=yellow>"..TB_zongzi_use_fun[goods_id][1].."<color>!")
		return
	end
	dostring(TB_zongzi_use_fun[goods_id][3])
end
--°¬ÏãôÕ×Ó
function zong_zi_exp_chg(exp_chg_num)
	local player_level = GetLevel()
	exp_chg_num = floor(exp_chg_num * player_level * player_level /6400)
	--ÊıÁ¿ÅĞ¶Ï
	local date_save = GetTask(happy_zong_zi_date_TaskID)
	local num_save = GetTask(aixiang_eat_num_TaskID)
	local date_now = zgc_pub_day_turn(1)
	if date_save >= date_now and num_save >= 5 then
		Talk(1,"","<color=green>Gîi ı <color>: <color=yellow>b¸nh İt ng¶i h­¬ng<color> mçi ngµy chØ ®­îc ¨n <color=red>5<color> c¸i!")
		return
	end
	if DelItem(2,1,1123,1) == 1 then
		ModifyExp(exp_chg_num)
		Msg2Player("Chóc mõng b¹n nhËn ®­îc "..exp_chg_num.." ®iÓm kinh nghiÖm!")
		ai_xiang_update()
		return
	else
		Talk(1,"","<color=green>Gîi ı <color>: Xin h·y x¸c nhËn b¹n ®· mang theo <color=yellow>"..TB_zongzi_use_fun[goods_id][1].."<color>!")
		return
	end
end
function ai_xiang_update()
	local date_save = GetTask(happy_zong_zi_date_TaskID)
	local num_save = GetTask(aixiang_eat_num_TaskID)
	local date_now = zgc_pub_day_turn(1)
	if date_save < date_now then
		SetTask(happy_zong_zi_date_TaskID,zgc_pub_day_turn(1))
		SetTask(aixiang_eat_num_TaskID,1)
		SetTask(happy_zong_zi_num_TaskID,0)
		num_save = 0
	else
		SetTask(aixiang_eat_num_TaskID,(num_save + 1))
	end
	Talk(1,"","<color=green>Gîi ı <color>: <color=yellow>b¸nh İt ng¶i h­¬ng<color> mçi ngµy chØ ®­îc sö dông <color=yellow>5<color> lÇn, ®©y lµ lÇn thø <color=yellow>"..(num_save+1).." <color> sö dông <color=yellow>b¸nh İt ng¶i h­¬ng<color>!")
	return
end
--»ğÍÈôÕ×Ó
function zong_zi_life_add(add_num,abidance_time)
	if leitai_chk() ~= 1 then
		return
	end
	if DelItem(2,1,1124,1) ~= 1 then
		Talk(1,"","<color=green>Gîi ı <color>: Xin h·y x¸c nhËn b¹n ®· mang theo <color=yellow>B¸nh İt thŞt n­íng <color>!")
		return
	end
	CastState("state_life_max_percent_add",add_num,abidance_time,1,1124)
end
--°Ë±¦ôÕ×Ó
function zong_zi_all_add(add_num,abidance_time)
	if leitai_chk() ~= 1 then
		return
	end
	if DelItem(2,1,1125,1) ~= 1 then
		Talk(1,"","<color=green>Gîi ı <color>: Xin h·y x¸c nhËn b¹n ®· mang theo <color=yellow>b¸nh İt B¸t B¶o<color>!")
		return
	end
	CastState("state_add_strength",add_num,abidance_time,1,11251)
	CastState("state_add_energy",add_num,abidance_time,1,11252)
	CastState("state_add_vitality",add_num,abidance_time,1,11253)
	CastState("state_add_dexterity",add_num,abidance_time,1,11254)
	CastState("state_add_observe",add_num,abidance_time,1,11255)
end
--ÀŞÌ¨²»ÄÜ³Ô
function leitai_chk()
	local player_map = GetWorldPos()
	if (player_map >= 801 and player_map <= 805) or (player_map >= 810 and player_map <= 838) then
		Talk(1,"","<color=yellow>Gîi ı <color>: L«i ®µi kh«ng thÓ sö dông nh÷ng vËt nµy!")
		return 0
	else
		return 1
	end
end
