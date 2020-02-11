--File name:transport_out_BJ.lua
--Describe:É¨Ä¹´«ËÍÈË£¨´«³ö£©
--Create Date:2006-3-16
--Author:yanjun
--½Å±¾ĞŞ¸Ä¼ÇÂ¼£º
--2007ÄêÇåÃ÷½Ú»î¶¯ĞŞ¸Ä¡£
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı
LeavePointTab = {	--¼ÇÂ¼´ÓÁêÄ¹³öÀ´Ê±µÄ×ø±ê
			[1] = {100,1453,2812},	--ÈªÖİ¡¡»ÆÏÀÚ£
			[2] = {200,1170,2834},	--ãê¾©¡¡º«ÏÀÚ£
			[3] = {300,1640,3531},	--³É¶¼¡¡ĞùÔ¯ÏÀÚ£
			}
--================================ÒÔÏÂÊÇÈ«¾Ö±äÁ¿=======================================
tomb_sweep_2007_start_goodsID = 675
tomb_sweep_2007_task_finish_count = 853
tomb_sweep_2007_task_reel_date_seq = 855			--ÈÎÎñµÄÈÕÆÚĞòÊı
tomb_sweep_2007_task_reel_num = 856					--¿ÉÍê³ÉµÄÈÎÎñÊıÁ¿
tomb_sweep_2007_task_reel_diff = 857				--µ±Ç°µÄÈÎÎñÖÖÀà
tomb_sweep_2007_task_reel_step = 858				--µ±Ç°ÈÎÎñ²½Öè£¨É±¹Ö£©
task_reel_table = {
	--ÈÎÎñÀàĞÍ(£¨1¡¢ÎªÉ±¹Ö£»2ÎªÊÕ¼¯£©-Íê³É±êÖ¾-¹ÖÎïÃû³Æ-¹ÖÎïÊıÁ¿-½±Àø°Ù·Ö¼¸ÂÊ-½±Àø±¶Êı-Ëæ»ú¼ÀÆ·ÊıÁ¿--ËµÃ÷
	{1,"C«n ®å",1205,5,10,900,""},
	--ÈÎÎñÀàĞÍ-ÊÕ¼¯ÎïÆ·ÖÖÀà-ÈÎÎñ½±Àø°Ù·Ö¼¸ÂÊ-ÈÎÎñ½±Àø±¶Êı-Ëæ»ú¼ÀÆ·Êı-ÊÕ¼¯µÄÎïÆ·Ãû³Æ-ÊÕ¼¯µÄÎïÆ·´óÀà-¸±Àà-Ğ¡Àà-ÊıÁ¿--ËµÃ÷
	{2,1,10,5,2,"Hæ vÜ",2,1,19,20,""},
	{1,"XÊu xa",1206,16,3,901,""},
	{2,2,20,2.5,2,"Linh Chu t¬",2,2,54,10,"Da gÊu",2,2,20,10,""},
	{2,2,30,1.7,2,"BÇu r­îu da dª",2,1,60,10,"Kim Thoa",2,1,41,10,""},
	{2,2,40,1.25,2,"Thiªn Lang y",0,100,15,1,"Minh Quang gi¸p",0,100,51,1,""},
	{2,2,50,1,2,"Gi¸p x¸c phiÕn",2,1,177,10,"Khª S¬n chİ",2,1,98,10,""},
	{1,"Xi Háa tr­ëng l·o",1207,65,0.75,902,""},
	{2,2,80,0.65,2,"HuyÒn thiÕt Träng KiÕm",0,2,26,1,"Ph¸ Thiªn kİch",0,6,107,1,""},
	{1,"Tiªu Tiªn Tö",1208,100,0.5,903,""}
	}
--========================================º¯ÊıÖ÷Âß¼­Çø=====================================
--***********************************¶Ô»°Ö÷º¯Êı****************************
function main()
	local task_diff = GetTask(tomb_sweep_2007_task_reel_diff)
	local selTab = {}
	if task_diff == nil or task_diff == 0 then
		selTab = {
				"Xin ®­a ta vÒ!/#gohome(2)",
				"T×m hiÓu ho¹t ®éng TiÕt Thanh Minh./tomb_sweep_2007_inf",
				"MÖt qu¸! Cho ngåi nghØ chót ®·!/end_dialog",
				}
	else
		selTab = {
				"Xin ®­a ta vÒ!/#gohome(2)",
				"NhËn phÇn th­ëng./get_teel_task_prize",
				"Hñy nhiÖm vô./teel_task_release",
				"T×m hiÓu ho¹t ®éng TiÕt Thanh Minh./tomb_sweep_2007_inf",
				"MÖt qu¸! Cho ngåi nghØ chót ®·!/end_dialog",
				}
	end
	Say("§a t¹!"..Zgc_pub_sex_name().."®Õn b¸i tÕ mé chñ nh©n, cã cÇn tiÓu nh©n ®­a ngµi vÒ kh«ng?",getn(selTab),selTab);
end
--*******************************´«»ØÈı´óÖ÷³Ç*****************************
function gohome(MapIndex)
	NewWorld(LeavePointTab[MapIndex][1],LeavePointTab[MapIndex][2],LeavePointTab[MapIndex][3]);
end
--********************************ÈÎÎñ½±Àø»»È¡****************************
function get_teel_task_prize()
	--ÔÚ»î¶¯ÆÚ¼äÓĞĞ§
	if tomb_sweep_2007_date_chk() ~= 1 then				
		Talk(1,"","TiÕt Thanh Minh ®· qua,"..Zgc_pub_sex_name().."NÕu cã lßng n¨m sau nhí ®Õn cóng b¸i!")
		return
	end
	--Íæ¼Ò¸ºÖØ¼ì²â
	if Zgc_pub_goods_add_chk(2,10) ~= 1 then
		return
	end
	--ÈÎÎñ´ÎÊı¼ì²â
	local reel_task_date_seq_save = GetTask(tomb_sweep_2007_task_reel_date_seq)
	local reel_task_num_save = GetTask(tomb_sweep_2007_task_reel_num)
	local date_seq_now = zgc_pub_day_turn(1)	
	if reel_task_date_seq_save >= date_seq_now and reel_task_num_save == 0 then
		Talk(1,"","MËt ®å Thanh Minh mçi ngµy chØ cã thÓ hoµn thµnh <color=yellow>1<color> lÇn, ng­¬i cã thÓ d¹o phè mua <color=yellow>giÊy cóng tÕ<color> ®Ó t¨ng sè lÇn hoµn thµnh!")
		return
	end
	
	local task_diff = GetTask(tomb_sweep_2007_task_reel_diff)
	--ÈÎÎñ¼ì²â
	if task_diff == 0 or task_diff == nil then
		Talk(1,"","Tr­íc mé tiªn nh©n kh«ng ®­îc nãi bËy"..Zgc_pub_sex_name().."B»ng h÷u nhËn nhiÖm vô khi nµo?")
		return
	end
	--ÈÎÎñ¾íÖá¼ì²â
	if GetItemCount(2,0,(tomb_sweep_2007_start_goodsID + task_diff -1)) < 1 then
		Talk(1,"","Ng­¬i kh«ng mang theo mËt ®å nhiÖm vô!")
		return
	end
	if task_reel_table[task_diff][1] == 1 then			--É±¹ÖÈÎÎñ
		if GetTask(tomb_sweep_2007_task_reel_step) ~= 1 then
			Talk(1,"","<color=green>Hµn Gia nh©n<color>:"..Zgc_pub_sex_name().."kh«ng ®­îc nãi bËy tr­íc mé tiªn nh©n, lµm xong nhiÖm vô míi ®Õn ®©y!")
			return
		end
	else
		--ÎïÆ·ÓµÓĞ¼ì²â
		for i = 1,task_reel_table[task_diff][2] do
			local add_num = (i - 1) * 5
			if task_reel_table[task_diff][10+add_num] ~= 1 then
				if GetItemCount(task_reel_table[task_diff][7+add_num],task_reel_table[task_diff][8+add_num],task_reel_table[task_diff][9+add_num]) < task_reel_table[task_diff][10+add_num] then
					Talk(1,"","Xin kiÓm tra trªn ng­êi mang ®ñ <color=yellow>"..task_reel_table[task_diff][6+add_num].."<color>!")
					return
				end
			else
				if GetItemCount(task_reel_table[task_diff][7+add_num],task_reel_table[task_diff][8+add_num],task_reel_table[task_diff][9+add_num]) < task_reel_table[task_diff][10+add_num] then
					Talk(1,"","Xin kiÓm tra trªn ng­êi mang ®ñ <color=yellow>"..task_reel_table[task_diff][6+add_num].."<color>!")
					return
				--ÊÕ×°±¸Ê±ÎªÁË·ÀÖ¹ÊÕ´í£¬¶àÓÚÊÕµÄ¼şÊıÒ»ÂÉ²»ÊÕ¡£
				elseif GetItemCount(task_reel_table[task_diff][7+add_num],task_reel_table[task_diff][8+add_num],task_reel_table[task_diff][9+add_num]) > task_reel_table[task_diff][10+add_num] then
					Talk(1,"","Ng­¬i"..task_reel_table[task_diff][6+add_num].."d­ ra <color=yellow>1<color> c¸i, l·o phu kh«ng thÓ nhËn.")
					return
				end
			end
		end
	end
	local player_level = GetLevel()
	local exp_chg_num = floor(player_level*player_level*player_level*player_level/100)
	prize_exp_add()
end
--*******************************¾­Ñé×ª¾­Ñé***************************
function prize_exp_add()
	local task_finish_count = GetTask(tomb_sweep_2007_task_finish_count)
	local task_diff = GetTask(tomb_sweep_2007_task_reel_diff)
	if task_reel_table[task_diff][1] == 2 then
		--ÎïÆ·É¾³ı¼ì²â
		for i = 1,task_reel_table[task_diff][2] do
			local add_num = (i - 1) * 5
			if DelItem(task_reel_table[task_diff][7+add_num],task_reel_table[task_diff][8+add_num],task_reel_table[task_diff][9+add_num],task_reel_table[task_diff][10+add_num]) ~= 1 then
				Talk(1,"","Xin kiÓm tra trªn ng­êi mang ®ñ <color=yellow>"..task_reel_table[task_diff][6+add_num].."<color>")
				return
			end
		end
	end
	--ÈÎÎñ¾íÖáÉ¾³ı¼ì²â
	if DelItem(2,0,(tomb_sweep_2007_start_goodsID + task_diff -1),1) ~= 1 then
		Talk(1,"","H×nh nh­ mËt ®å nhiÖm vô cña ng­¬i kh«ng ®óng!")
		return
	end
	--¾­Ñé×ª¾­Ñé
	local player_level = GetLevel()
	local exp_num = floor(player_level*player_level*player_level*player_level/100)
	local prize_times = 1
	if task_reel_table[task_diff][1] == 1 and random(1,100) <= task_reel_table[task_diff][4] then			--É±¹ÖÈÎÎñ
		prize_times =(1+ task_reel_table[task_diff][5])
	elseif task_reel_table[task_diff][1] == 2 and random(1,100) <= task_reel_table[task_diff][3] then
		prize_times = (1+ task_reel_table[task_diff][4])
	end
	if task_finish_count == 14 then
		prize_times = (prize_times +9)
		Talk(1,"","§©y lµ lÇn "..Zgc_pub_sex_name().."thø <color=yellow>15<color> hoµn thµnh nhiÖm vô mËt ®å,"..Zgc_pub_sex_name().." nhËn ®­îc phÇn th­ëng kinh nghiÖm gÊp 10 lÇn.")
	end
		exp_num = floor(exp_num*prize_times)
		ModifyExp(exp_num)
		Msg2Player("Chóc mõng b¹n nhËn ®­îc "..exp_num.." ®iÓm kinh nghiÖm!")	
	--ÈÎÎñÍê³É´¦Àí
		--Êı¾İ»ñÈ¡
	if task_reel_table[task_diff][1] == 1 then				--Èç¹ûÊÇÉ±¹ÖÈÎÎñÔòÉ¾³ıÉ±¹Ö´¥·¢Æ÷
		RemoveTrigger(GetTrigger(task_reel_table[task_diff][6]))
	end
	local reel_task_date_seq_save = GetTask(tomb_sweep_2007_task_reel_date_seq)
	local reel_task_num_save = GetTask(tomb_sweep_2007_task_reel_num)
	local date_seq_now = zgc_pub_day_turn(1)
	--Êı¾İ±£´æ
	if reel_task_date_seq_save < date_seq_now then
		SetTask(tomb_sweep_2007_task_reel_date_seq,date_seq_now)
		SetTask(tomb_sweep_2007_task_reel_num,0)
	elseif reel_task_date_seq_save == date_seq_now and reel_task_num_save > 0 then
		SetTask(tomb_sweep_2007_task_reel_num,(reel_task_num_save-1))
	elseif reel_task_date_seq_save > date_seq_now then
		SetTask(tomb_sweep_2007_task_reel_date_seq,date_seq_now)
		SetTask(tomb_sweep_2007_task_reel_num,0)
	end
	--Íê³É´ÎÊı
	if task_finish_count == nil then
		SetTask(tomb_sweep_2007_task_finish_count,1)
	else
		SetTask(tomb_sweep_2007_task_finish_count,(task_finish_count+1))
	end
	SetTask(tomb_sweep_2007_task_reel_diff,0)
	SetTask(tomb_sweep_2007_task_reel_step,0)
end
--**********************************ÈÎÎñÈ¡Ïû******************************
function teel_task_release()
	local task_diff = GetTask(tomb_sweep_2007_task_reel_diff)
	if task_diff == 0 or task_diff == nil then
		Talk(1,"","Tr­íc mé tiªn nh©n kh«ng ®­îc nãi bËy"..Zgc_pub_sex_name().."Ng­¬i ch­a nhËn qua nhiÖm vô nªn kh«ng thÓ hñy!")
		return
	elseif task_diff >= 1 and task_diff <= 10 then
		Say("MËt ®å nµy"..Zgc_pub_sex_name().."ng­êi h÷u duyªn míi cã, ng­¬i thËt sù muèn hñy kh«ng?",
		2,
		"§óng/task_release_dtm",
		"§Ó ta suy nghÜ l¹i/end_dialog"
		)
	else			--Êı¾İ³ö´íµÄÇé¿ö
		SetTask(tomb_sweep_2007_task_reel_diff,0)
	end
end
--********************************ÈÎÎñÊı¾İÇå³ı*******************************
function task_release_dtm()
	local task_diff = GetTask(tomb_sweep_2007_task_reel_diff)
	if task_reel_table[task_diff][1] == 1 then				--Èç¹ûÊÇÉ±¹ÖÈÎÎñÔòÉ¾³ıÉ±¹Ö´¥·¢Æ÷
		RemoveTrigger(GetTrigger(task_reel_table[task_diff][6]))
	end
	SetTask(tomb_sweep_2007_task_reel_diff,0)
	Msg2Player("B¹n ®· hñy nhiÖm vô Thanh Minh!")
end
--********************************»î¶¯ÏêÇéÃèÊö*******************************
function tomb_sweep_2007_inf()
	Talk(2,"tomb_sweep_2007_inf_1",
	"\n Thêi gian diÔn ra ho¹t ®éng: <color=yellow>30/3 - 8/4<color>. \n Trong TiÕt Thanh Minh viÖc t¶o mé lµ chñ yÕu, ta cÇn cóng b¸i c¸c vŞ nh­ <color=yellow>Chu ®¹i hiÖp, Hµn ®¹i hiÖp, Hiªn Viªn ®¹i hiÖp<color>.",
	"\n Trong TiÕt Thanh Minh mçi ngµy ®Õn bÊt kú mé phÇn cóng b¸i <color=yellow>1<color> lÇn b»ng c¸ch <color=yellow>v¸i l¹y<color> lµ ®­îc. Do"..Zgc_pub_sex_name().."thµnh t©m nhËn ®­îc mËt ®å nhiÖm vô cña thñ l¨ng nh©n."
	)
end
function tomb_sweep_2007_inf_1()
	Talk(2,"","\n Hoµn thµnh nhiÖm vô <color=yellow>Hµn gia nh©n<color>. Mang <color=yellow>mËt ®å<color> ®Õn <color=yellow>Hµn gia nh©n<color> nhËn <color=yellow>phÇn th­ëng kinh nghiÖm<color> nhÊt ®Şnh.",
		"\n Hoµn thµnh <color=yellow>15<color> lÇn <color=yellow>mËt ®å Thanh Minh<color> nhËn ®­îc phÇn th­ëng gÊp <color=yellow>10 lÇn<color>."
)
end