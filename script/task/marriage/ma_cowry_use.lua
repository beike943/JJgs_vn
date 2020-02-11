--½Å±¾Ãû³Æ£º½á»é¶şÆÚÈÎÎñ±¦ÎïÊ¹ÓÃ½Å±¾
--½Å±¾¹¦ÄÜ£º½á»é¶şÆÚµÄ¸÷ÖÖÍè×ÓµÄÊ¹ÓÃ£¬·ÖÎªÁ½¸ö·½ÃæÒ»¸öÊÇÔö¼ÓÍ¬ĞÄÖµ£¬Ò»¸öÏà¹ØµÄ¼¼ÄÜµÄÑ§Ï°ºÍÉı¼¶
--²ß»®ÈË£ºÌúÑò
--´úÂë¿ª·¢ÈË£º´å³¤
--´úÂë¿ª·¢Ê±¼ä£º2007-04-27
--´úÂëĞŞ¸Ä¼ÇÂ¼£º
	Same_heart_value_TaskID = 2015			--Í¬ĞÄÖµ
	Same_heart_value_max = 5000				--Í¬ĞÄÖµÉÏÏŞ
	Same_heart_value_max_TaskID = 2023		--Í¬ĞÄÖµÉÏÏŞid
	Ma_skill_level_max = 5					--»éÒö¼¼ÄÜÉÏÏŞ
	--±¦Îï¶ÔÓ¦¼¼ÄÜĞÅÏ¢
	Tb_ma_skill = {}
	Tb_ma_skill[581] = {867,5,"§iÖp LuyÕn"}		--¼¼ÄÜ´úºÅ¡¢Ãû³Æ£¬ÔİÊ±Ìæ´ú
	Tb_ma_skill[582] = {867,5,"§iÖp LuyÕn"}		--¼¼ÄÜ´úºÅ¡¢Ãû³Æ£¬ÔİÊ±Ìæ´ú
	Tb_ma_skill[577] = {865,4,"T­¬ng T­"}			--¼¼ÄÜ´úºÅ¡¢Ãû³Æ£¬ÔİÊ±Ìæ´ú
	Tb_ma_skill[578] = {865,4,"T­¬ng T­"}			--¼¼ÄÜ´úºÅ¡¢Ãû³Æ£¬ÔİÊ±Ìæ´ú
	Tb_ma_skill[579] = {866,5,"Hãa ®iÖp"}			--¼¼ÄÜ´úºÅ¡¢Ãû³Æ£¬ÔİÊ±Ìæ´ú
	Tb_ma_skill[580] = {866,5,"Hãa ®iÖp"}			--¼¼ÄÜ´úºÅ¡¢Ãû³Æ£¬ÔİÊ±Ìæ´ú
	--±¦ÎïĞÅÏ¢
	Tb_goods_compose = {}
	Tb_goods_compose[573] = {"§ång T©m Hoµn","Sö dông trŞ §ång t©m t¨ng <color=yellow>125<color> ®iÓm!"}
	Tb_goods_compose[574] = {"§¹i §ång T©m Hoµn","Sö dông trŞ §ång t©m t¨ng <color=yellow>300<color> ®iÓm!"}
	Tb_goods_compose[575] = {"§ång T©m ®¬n","Ng­êi sö dông TrŞ sè ®ång t©m tèi ®a t¨ng <color=yellow>125<color> ®iÓm!"}
	Tb_goods_compose[576] = {"§¹i §ång T©m ®¬n","Ng­êi sö dông TrŞ sè ®ång t©m tèi ®a t¨ng <color=yellow>300<color> ®iÓm!"}
	Tb_goods_compose[577] = {"T­ t­ëng b¶n quyÓn","Ng­êi sö dông cã thÓ <color=yellow>häc hái: kü n¨ng truyÒn tèng<color>!"}
	Tb_goods_compose[578] = {"T­ t­ëng tµn quyÓn","Ng­êi sö dông cã thÓ <color=yellow>t¨ng cÊp: kü n¨ng truyÒn tèng<color>!"}
	Tb_goods_compose[579] = {"Hãa §iÖp b¶n quyÓn","MËt ®å L­u tinh"}
	Tb_goods_compose[580] = {"Hãa §iÖp tµn quyÓn","Ng­êi sö dông cã thÓ <color=yellow>t¨ng cÊp kü n¨ng håi sinh<color>!"}
	Tb_goods_compose[581] = {"§iÖp LuyÕn b¶n quyÓn","Ng­êi sö dông cã thÓ <color=yellow>häc hái kü n¨ng gióp ®ì<color>!"}
	Tb_goods_compose[582] = {"§iÖp LuyÕn tµn quyÓn","Ng­êi sö dông cã thÓ <color=yellow>th¨ng cÊp kü n¨ng gióp ®ì<color>!"}

--==================================º¯ÊıÖ÷Âß¼­ÇøÓò==================================
function OnUse(goods_index)
	--ÅĞ¶ÏÊÇ·ñ½á»é
	if GetMateName() == nil or GetMateName() == "" then
		Talk(1,"","<color=green>Chó ı<color>: Ch­a kÕt h«n ch­a thÓ sö dông vËt phÈm nµy!")
		return
	end
	local goods_id = GetItemParticular(goods_index)
	Say("<color=green>Gîi ı <color>: Sö dông <color=yellow>"..Tb_goods_compose[goods_id][1].."<color> cã thÓ ®Ó"..Tb_goods_compose[goods_id][2],
	2,
	"§æi/#use_deal("..goods_id..")",
	"§Ó ta suy nghÜ l¹i/end_dialog"
	)
end
--*******************************È·ÈÏÊ¹ÓÃ*************************
function use_deal(goods_id)
	--µÀ¾ßĞ¯´ø¼ì²â
	if GetItemCount(2,1,goods_id) < 1 then
		Talk(1,"","<color=green>Gîi ı <color>: Xin h·y x¸c nhËn b¹n ®· mang theo <color=yellow>"..Tb_goods_compose[goods_id][1].."<color>!")
		return
	end
	--Í¬ĞÄÖµÔö¼ÓµÀ¾ßµÄÊ¹ÓÃ
	if goods_id == 573 or goods_id == 574 then
		local same_heart_value_add_num = 0			--±¾±¦ÎïÔö¼ÓµÄÍ¬ĞÄÖµ
		if goods_id == 573 then
			same_heart_value_add_num = 125
		elseif goods_id == 574 then
			same_heart_value_add_num = 300
		end
		--Í¬ĞÄÖµ¼°ÆäÉÏÏŞ»ñÈ¡
		local same_heart_value_max = GetTask(Same_heart_value_max_TaskID)
		local same_heart_value_now = GetTask(Same_heart_value_TaskID)
		local same_heart_value_dis = same_heart_value_max - same_heart_value_now
		--Í¬ĞÄÖµ³¬¹ıÉÏÏŞ´¦Àí
		if same_heart_value_dis < 0 then
			SetTask(Same_heart_value_TaskID,same_heart_value_max)
			same_heart_value_dis = 0
		end
		--¿ªÊ¼´¦Àí
			--Í¬ĞÄÖµÉÏÏŞ²»¹»Ö±½Ó¼Ó
		if 	same_heart_value_dis >= same_heart_value_add_num then
			if DelItem(2,1,goods_id,1) ~= 1 then
				Talk(1,"","<color=green>Gîi ı <color>: Xin h·y x¸c nhËn b¹n ®· mang theo <color=yellow>"..Tb_goods_compose[goods_id][1].."<color>!")
				return
			else
				local Same_heart_value = (same_heart_value_now + same_heart_value_add_num)
				SetTask(Same_heart_value_TaskID,Same_heart_value)
				Talk(1,"","<color=green>Gîi ı<color>: Chóc mõng b¹n ®· sö dông "..Tb_goods_compose[goods_id][1].."§· t¨ng"..same_heart_value_add_num.." (®iÓm) TrŞ sè ®ång t©m, ®¹t ®­îc <color=yellow>"..Same_heart_value.."<color> ®iÓm!")
			end
		--Í¬ĞÄÖµ´ïµ½ÉÏÏŞÖ±½Ó·µ»Ø
		elseif same_heart_value_dis == 0 then
			Talk(1,"","<color=green>Gîi ı<color>: TrŞ sè ®ång t©m ®· ®¹t tíi : <color=red>"..same_heart_value_max.."<color>®iÓm, kh«ng thÓ sö dông<color=yellow>"..Tb_goods_compose[goods_id][1].."<color>!")
			return
		else
			Say("<color=green>Gîi ı<color>: Giíi h¹n TrŞ sè ®ång t©m hiÖn t¹i lµ <color=red>"..same_heart_value_max.."<color> ®iÓm, sö dông <color=yellow>"..Tb_goods_compose[goods_id][1].."<color> chØ t¨ng <color=yellow>"..same_heart_value_dis.."<color> ®iÓm, sö dông chø?",
			2,
			"§æi/#use_dtm("..goods_id..","..same_heart_value_dis..")",
			"§Ó ta suy nghÜ l¹i/end_dialog"
			)
		end
	--Í¬ĞÄÖµÉÏÏŞÔö¼ÓµÀ¾ßµÄÊ¹ÓÃ
	elseif goods_id == 575 or goods_id == 576 then
		local same_heart_value_max_add_num = 0			--±¾±¦ÎïÔö¼ÓµÄÍ¬ĞÄÖµ
		if goods_id == 575 then
			same_heart_value_max_add_num = 125
		elseif goods_id == 576 then
			same_heart_value_max_add_num = 300
		end
		--Í¬ĞÄÖµÔö¼ÓÉÏÏŞ´¦Àí
		local same_heart_max_value_now = GetTask(Same_heart_value_max_TaskID)
		local same_heart_max_dis_value = Same_heart_value_max - same_heart_max_value_now
			--Í¬ĞÄÖµÉÏÏŞ²»µ½ÉÏÏŞÖ±½Ó¼Ó
		if same_heart_value_max_add_num <= same_heart_max_dis_value then
			if DelItem(2,1,goods_id,1) ~= 1 then
				Talk(1,"","<color=green>Gîi ı <color>: Xin h·y x¸c nhËn b¹n ®· mang theo <color=yellow>"..Tb_goods_compose[goods_id][1].."<color>!")
				return
			else
				local Same_heart_value_max = (same_heart_max_value_now + same_heart_value_max_add_num)
				SetTask(Same_heart_value_max_TaskID,(same_heart_max_value_now + same_heart_value_max_add_num))
				Talk(1,"","<color=green>Gîi ı<color>: Chóc mõng b¹n ®· sö dông "..Tb_goods_compose[goods_id][1].."§· t¨ng"..same_heart_value_max_add_num.."(®iÓm) giíi h¹n TrŞ sè ®ång t©m, ®· ®¹t ®­îc <color=yellow>"..Same_heart_value_max.."<color> ®iÓm!")
			end
			--Í¬ĞÄÖµÒÑ¾­µ½´ïÉÏÏŞ²»ÓÃÉ¾³ıÖ±½Ó·µ»Ø
		elseif same_heart_max_dis_value == 0 then
			Talk(1,"","<color=green>Gîi ı<color>: Giíi h¹n TrŞ sè ®ång t©m ®· ®¹t tíi trŞ cao nhÊt: <color=red>"..same_heart_max_value_now.."<color>®iÓm, kh«ng thÓ sö dông<color=yellow>"..Tb_goods_compose[goods_id][1].."<color>!")
			return
		else
			Say("<color=green>Gîi ı<color>: giíi h¹n TrŞ sè ®ång t©m hiÖn t¹i, trŞ cao nhÊt lµ <color=red>"..same_heart_max_value_now.."<color> ®iÓm, sö dông <color=yellow>"..Tb_goods_compose[goods_id][1].."<color> chØ t¨ng <color=yellow>"..same_heart_max_dis_value.."<color> ®iÓm TrŞ sè ®ång t©m, sö dông chø?",
			2,
			"§æi/#use_dtm("..goods_id..","..same_heart_max_dis_value..")",
			"§Ó ta suy nghÜ l¹i/end_dialog"
			)
		end
	--¼¼ÄÜÑ§Ï°ÎïÆ·
	elseif goods_id == 577 or goods_id == 579 or goods_id == 581 then
		if HaveLearnedSkill(Tb_ma_skill[goods_id][1]) == 1 then
			Talk(1,"","<color=green>Gîi ı<color>: b¹n ®· häc ®­îc: <color=yellow>"..Tb_ma_skill[goods_id][3].."<color>, kh«ng thÓ sö dông mËt ®å nµy!")
			return
		else
			if DelItem(2,1,goods_id,1) ~= 1 then
				Talk(1,"","<color=green>Gîi ı <color>: Xin h·y x¸c nhËn b¹n ®· mang theo <color=yellow>"..Tb_goods_compose[goods_id][1].."<color>!")
				return
			end
			if LearnSkill(Tb_ma_skill[goods_id][1]) == 1 then
				Talk(1,"","<color=green>Gîi ı<color>: Chóc mõng b¹n häc ®­îc '<color=yellow>"..Tb_ma_skill[goods_id][3].."<color>', nhÊn' <color=yellow>F3<color>' më giao diÖn<color=yellow>H«n Nh©n<color> míi cã thÓ sö dông kü n¨ng nµy!")
			else
				WriteLog("Kü n¨ng H«n Nh©n: ng­êi ch¬i ("..GetName()..") sö dông "..Tb_goods_compose[goods_id][1].."häc hái thÊt b¹i!")
			end
		end
	--¼¼ÄÜÉı¼¶ÎïÆ·
	else
		if GetSkillLevel(Tb_ma_skill[goods_id][1]) == 0 then
			Talk(1,"","<color=green>Gîi ı<color>: B¹n ch­a häc ®­îc <color=yellow>"..Tb_ma_skill[goods_id][3].."<color>, kh«ng thÓ sö dông mËt ®å nµy!")
			return
		end
		if GetSkillLevel(Tb_ma_skill[goods_id][1]) >= Tb_ma_skill[goods_id][2] then
			Talk(1,"","<color=green>Gîi ı<color>: HiÖn t¹i ®¼ng cÊp kü n¨ng <color=yellow>"..Tb_ma_skill[goods_id][3].."<color> ®· cao nhÊt, kh«ng thÓ th¨ng cÊp!")
			return
		end
		if DelItem(2,1,goods_id,1) ~= 1 then
			Talk(1,"","<color=green>Gîi ı <color>: Xin h·y x¸c nhËn b¹n ®· mang theo <color=yellow>"..Tb_goods_compose[goods_id][1].."<color>!")
			return
		end
		if LevelUpSkill(Tb_ma_skill[goods_id][1]) == 1 then
			Msg2Player("Chóc mõng b¹n th¨ng cÊp!"..Tb_ma_skill[goods_id][3].. " !")
		else
			WriteLog("Kü n¨ng H«n Nh©n: ng­êi ch¬i ("..GetName()..") sö dông "..Tb_goods_compose[goods_id][1].."th¨ng cÊp thÊt b¹i!")
		end
	end
end
--******************************Í¬ĞÄÖµ²»×ãµÄÊ±ºòµÄ´¦Àí******************************
function use_dtm(goods_id,add_num)
	--ÎïÆ·Ğ¯´ø¼ì²â
	if GetItemCount(2,1,goods_id) == 0 then
		Talk(1,"","<color=green>Gîi ı <color>: Xin h·y x¸c nhËn b¹n ®· mang theo <color=yellow>"..Tb_goods_compose[goods_id][1].."<color>!")
		return
	end
	--ÎïÆ·É¾³ı¼ì²â
	if DelItem(2,1,goods_id,1) ~= 1 then
		Talk(1,"","<color=green>Gîi ı <color>: Xin h·y x¸c nhËn b¹n ®· mang theo <color=yellow>"..Tb_goods_compose[goods_id][1].."<color>!")
		return
	end
	--Í¨¹ı¼ì²âºóÍ¬ĞÄÖµ»òÍ¬ĞÄÖµÉÏÏŞÔö¼õ
	if goods_id == 573 or goods_id == 574 then
		local Same_heart_value = (GetTask(Same_heart_value_TaskID) + add_num)
		SetTask(Same_heart_value_TaskID,Same_heart_value)
		Talk(1,"","<color=green>Gîi ı<color>: Chóc mõng b¹n ®· sö dông "..Tb_goods_compose[goods_id][1].."§· t¨ng"..add_num.." (®iÓm) TrŞ sè ®ång t©m, ®¹t ®­îc <color=yellow>"..Same_heart_value.."<color> ®iÓm!")
	else
		local Same_heart_value_max = (GetTask(Same_heart_value_max_TaskID) + add_num)
		SetTask(Same_heart_value_max_TaskID,Same_heart_value_max)
		Talk(1,"","<color=green>Gîi ı<color>: Chóc mõng b¹n ®· sö dông "..Tb_goods_compose[goods_id][1].."§· t¨ng"..add_num.."(®iÓm) giíi h¹n TrŞ sè ®ång t©m, ®· ®¹t ®­îc <color=yellow>"..Same_heart_value_max.."<color> ®iÓm!")
	end
end
