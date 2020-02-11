--File name:npc_qmtransportout.lua
--Describe:É¨Ä¹´«ËÍÈË£¨´«³ö£©
--Create Date:2006-3-16
--Author:yanjun
--½Å±¾ĞŞ¸Ä¼ÇÂ¼£º
--2007ÄêÇåÃ÷½Ú»î¶¯ĞŞ¸Ä¡£
--2008ÄêÇåÃ÷½Ú»î¶¯ĞŞ¸Ä¡£byMoxian
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı
Include("\\script\\online\\qingming08\\head_qingming.lua")
Include("\\script\\lib\\lingshi_head.lua")
--================================ÒÔÏÂÊÇÈ«¾Ö±äÁ¿=======================================

tomb_sweep_2007_start_goodsID = 675
tomb_sweep_2008_task_reel_completed = 1849		--ÒÑÍê³ÉµÄÈÎÎñÊı
tomb_sweep_2008_task_reel_date_seq = 1852			--ÈÎÎñµÄÈÕÆÚĞòÊı
--tomb_sweep_2008_task_reel_date_seqÕâÊÇ¼ÇÂ¼Ã¿ÌìÈÎÎñ´ÎÊıÊÇ·ñ¸üĞÂÓÃµÄ
tomb_sweep_2008_task_reel_num = 1853					--¿ÉÍê³ÉµÄÈÎÎñÊıÁ¿
tomb_sweep_2008_task_reel_diff = 1854				--µ±Ç°µÄÈÎÎñÖÖÀà
tomb_sweep_2008_task_reel_step = 1855				--µ±Ç°ÈÎÎñ²½Öè£¨É±¹Ö£©
task_reel_table = {
	--ÈÎÎñÀàĞÍ(£¨1¡¢ÎªÉ±¹Ö£»2ÎªÊÕ¼¯£»3ÎªÁéÊ¯£©-¹ÖÎïÃû³Æ-´¥·¢Æ÷ID-½±Àø°Ù·Ö¼¸ÂÊ-½±Àø±¶Êı-·µ»ØµÄ´¥·¢Æ÷Ë÷Òı--ËµÃ÷
	{1,"C«n ®å",1205,5,11,900,"    TiÕt Thanh Minh ®· ®Õn, chç ta cã mét sè mËt ®å nhiÖm vô dµnh cho nh÷ng ai thµnh t©m cóng b¸i.\n    <color=yellow>Néi dung nhiÖm vô<color>: Ngoµi thµnh cã nh÷ng tªn <color=yellow>C«n ®å<color> lµm h¹i b¸ t¸nh, giÕt <color=yellow>30<color> tªn sau ®ã quay vÒ <color=yellow>Thñ l¨ng mé<color> phôc mÖnh.\n   <color=yellow>PhÇn th­ëng nhiÖm vô: x¸c suÊt 95%<color> nh©n ®«i <color=yellow>®iÓm søc kháe chuyÓn thµnh kinh nghiÖm<color> hoÆc <color=yellow>5%<color> x¸c suÊt gÊp <color=yellow>11<color> lÇn ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm."},
	--ÈÎÎñÀàĞÍ-ÊÕ¼¯ÎïÆ·ÖÖÀà¸öÊı-ÈÎÎñ½±Àø°Ù·Ö¼¸ÂÊ-ÈÎÎñ½±Àø±¶Êı-Ëæ»ú¼ÀÆ·Êı-ÊÕ¼¯µÄÎïÆ·Ãû³Æ-ÊÕ¼¯µÄÎïÆ·´óÀà-¸±Àà-Ğ¡Àà-ÊıÁ¿--ËµÃ÷<color>
	{2,1,10,6,2,"Hæ vÜ",2,1,19,20,"    TiÕt Thanh Minh ®· ®Õn, chç ta cã mét sè mËt ®å nhiÖm vô dµnh cho nh÷ng ai thµnh t©m cóng b¸i.\n    <color=yellow>Néi dung nhiÖm vô: §u«i hæ<color> lµm thuèc cã thÓ ®iÒu trŞ c¸c bÖnh tËt, thu thËp <color=yellow>20<color> <color=yellow>®u«i hæ<color> sau ®ã quay vÒ <color=yellow>Thñ l¨ng mé<color> phôc mÖnh.\n   <color=yellow>PhÇn th­ëng nhiÖm vô: x¸c suÊt 90%<color> nh©n ®«i <color=yellow>®iÓm søc kháe chuyÓn thµnh kinh nghiÖm<color> hoÆc <color=yellow>10%<color> x¸c suÊt gÊp <color=yellow>6<color> lÇn ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm."},
	{1,"Quan sø",1206,16,4,901,"    TiÕt Thanh Minh ®· ®Õn, chç ta cã mét sè mËt ®å nhiÖm vô dµnh cho nh÷ng ai thµnh t©m cóng b¸i.\n    <color=yellow>Néi dung nhiÖm vô: Quan sø<color> ë <color=yellow>D­¬ng Trung ®éng<color> hµ hiÕp b¸ t¸nh, gi¸o huÊn <color=yellow>30<color> tªn sau ®ã quay vÒ <color=yellow>Thñ l¨ng mé<color> phôc mÖnh.\n   <color=yellow>PhÇn th­ëng nhiÖm vô: x¸c suÊt 84%<color> nh©n ®«i <color=yellow>®iÓm søc kháe chuyÓn thµnh kinh nghiÖm<color> hoÆc <color=yellow>16%<color> x¸c suÊt gÊp <color=yellow>4<color> lÇn ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm."},
	--ÈÎÎñÀàĞÍ-ÊÕ¼¯ÎïÆ·ÖÖÀà¸öÊı-ÈÎÎñ½±Àø°Ù·Ö¼¸ÂÊ-ÈÎÎñ½±Àø±¶Êı-Ëæ»ú¼ÀÆ·Êı-ÊÕ¼¯µÄÁéÊ¯Ãû³Æ-ÊÕ¼¯µÄÁéÊ¯ÊıÁ¿-ÊÕ¼¯µÄÁéÊ¯ÊıÁ¿µÄÈÎÎñ±äÁ¿-ËµÃ÷
	{3,1,20,3.5,2,"Linh th¹ch cÊp 1",4,SYS_TSK_LINGSHI_ONE,"    TiÕt Thanh Minh ®· ®Õn, chç ta cã mét sè mËt ®å nhiÖm vô dµnh cho nh÷ng ai thµnh t©m cóng b¸i.\n    <color=yellow>Néi dung nhiÖm vô<color>: HiÖn triÒu ®×nh cÇn mét sè vËt liÖu, thu thËp <color=yellow>4 Linh th¹ch cÊp 1<color> sau ®ã quay vÒ <color=yellow>Thñ l¨ng mé<color> phôc mÖnh.\n   <color=yellow>PhÇn th­ëng nhiÖm vô: x¸c suÊt 80%<color> nh©n ®«i <color=yellow>®iÓm søc kháe chuyÓn thµnh kinh nghiÖm<color> hoÆc <color=yellow>20%<color> x¸c suÊt gÊp <color=yellow>3.5<color> lÇn ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm."},
	{2,2,30,2.7,2,"BÇu r­îu da dª",2,1,60,10,"Kim Thoa",2,1,41,10,"    TiÕt Thanh Minh ®· ®Õn, chç ta cã mét sè mËt ®å nhiÖm vô dµnh cho nh÷ng ai thµnh t©m cóng b¸i.\n    <color=yellow>Néi dung nhiÖm vô<color>: HiÖn triÒu ®×nh cÇn mét sè vËt liÖu, ®Õn <color=yellow>KiÕm M«n Quan<color> thu thËp 10 <color=yellow>bÇu r­îu da dª<color>, ®Õn <color=yellow>KiÕm C¸c thôc ®¹o<color> thu thËp 10 <color=yellow>Kim Thoa<color> sau ®ã quay vÒ Thñ l¨ng mé <color>phôc mÖnh.\n   <color=yellow>PhÇn th­ëng nhiÖm vô: x¸c suÊt 70%<color> nh©n ®«i <color=yellow>®iÓm søc kháe chuyÓn thµnh kinh nghiÖm<color> hoÆc <color=yellow>30%<color> x¸c suÊt gÊp <color=yellow>2.7<color> lÇn ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm."},
	{3,2,40,2.25,2,"Linh th¹ch cÊp 2",2,SYS_TSK_LINGSHI_TWO,"Linh th¹ch cÊp 3",2,SYS_TSK_LINGSHI_THREE,"    TiÕt Thanh Minh ®· ®Õn, chç ta cã mét sè mËt ®å nhiÖm vô dµnh cho nh÷ng ai thµnh t©m cóng b¸i.\n    <color=yellow>PhÇn th­ëng nhiÖm vô<color>: T×m <color=yellow>2 Linh th¹ch cÊp 2<color>, <color=yellow>2 Linh th¹ch cÊp 3<color> ®Æt vµo Tô Linh ®Ønh sau ®ã quay vÒ <color=yellow>Thñ l¨ng mé<color> phôc mÖnh.\n   <color=yellow>PhÇn th­ëng nhiÖm vô: x¸c suÊt 60%<color> nh©n ®«i <color=yellow>®iÓm søc kháe chuyÓn thµnh kinh nghiÖm<color> hoÆc <color=yellow>40%<color> x¸c suÊt gÊp <color=yellow>2.25<color> lÇn ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm."},
	{2,2,50,2,2,"Gi¸p x¸c phiÕn",2,1,177,10,"Khª S¬n chİ",2,1,98,10,"    TiÕt Thanh Minh ®· ®Õn, chç ta cã mét sè mËt ®å nhiÖm vô dµnh cho nh÷ng ai thµnh t©m cóng b¸i.\n    <color=yellow>Néi dung nhiÖm vô<color>: HiÖn triÒu ®×nh cÇn mét sè vËt liÖu, thu thËp 10 <color=yellow>Gi¸p x¸c phiÕn ë §µo Hoa §¶o<color>, 10 <color=yellow>b¶n ®å rõng nói gèc ë §¹i Th¶o Nguyªn<color> sau ®ã quay vÒ <color=yellow>Thñ l¨ng mé<color> phôc mÖnh.\n   <color=yellow>PhÇn th­ëng nhiÖm vô: x¸c suÊt 50%<color> nh©n ®«i <color=yellow>®iÓm søc kháe chuyÓn thµnh kinh nghiÖm<color> hoÆc <color=yellow>50%<color> x¸c suÊt gÊp <color=yellow>2<color> lÇn ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm."},
	{1,"Cao thñ quan ngo¹i",1207,65,1.75,902,"    TiÕt Thanh Minh ®· ®Õn, chç ta cã mét sè mËt ®å nhiÖm vô dµnh cho nh÷ng ai thµnh t©m cóng b¸i.\n    <color=yellow>Néi dung nhiÖm vô<color>: Cao thñ quan ngo¹i <color=yellow>ë<color> Long M«n trÊn ®¶ th­¬ng b¸ t¸nh, giÕt <color=yellow>30<color> tªn sau ®ã quay vÒ <color=yellow>Thñ l¨ng mé<color> phôc mÖnh.\n   <color=yellow>PhÇn th­ëng nhiÖm vô: x¸c suÊt 35%<color> nh©n ®«i <color=yellow>®iÓm søc kháe chuyÓn thµnh kinh nghiÖm<color> hoÆc <color=yellow>65%<color> x¸c suÊt gÊp <color=yellow>1.75<color> lÇn ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm."},
	{3,1,80,1.65,2,"Linh th¹ch cÊp 4",2,SYS_TSK_LINGSHI_FOUR,"    TiÕt Thanh Minh ®· ®Õn, chç ta cã mét sè mËt ®å nhiÖm vô dµnh cho nh÷ng ai thµnh t©m cóng b¸i.\n    <color=yellow>Néi dung nhiÖm vô<color>: T×m <color=yellow>2 Linh th¹ch cÊp 4<color> ®Æt vµo Tô Linh ®Ønh sau ®ã quay vÒ Thñ l¨ng mé phôc mÖnh.\n   <color=yellow>PhÇn th­ëng nhiÖm vô: x¸c suÊt 45%<color> nh©n ®«i <color=yellow>®iÓm søc kháe chuyÓn thµnh kinh nghiÖm<color> hoÆc <color=yellow>65%<color> x¸c suÊt gÊp <color=yellow>1.65<color> lÇn ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm."},
	{1,"TÇm B¶o Nh©n",1208,100,1.5,903,"    TiÕt Thanh Minh ®· ®Õn, chç ta cã mét sè mËt ®å nhiÖm vô dµnh cho nh÷ng ai thµnh t©m cóng b¸i.\n    <color=yellow>Néi dung nhiÖm vô: ë Sa m¹c mª cung<color> cã <color=yellow>TÇm b¶o nh©n<color> ®¶ th­¬ng kh«ng İt nh©n sÜ giang hå, giÕt <color=yellow>30<color> tªn sau ®ã quay vÒ <color=yellow>Thñ l¨ng mé<color> phôc mÖnh.\n   <color=yellow>PhÇn th­ëng nhiÖm vô: 100%<color> x¸c suÊt gÊp <color=yellow>1.5<color> lÇn ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm."}
	}
--========================================º¯ÊıÖ÷Âß¼­Çø=====================================
--***********************************¶Ô»°Ö÷º¯Êı****************************
function main()
	local task_diff = GetTask(tomb_sweep_2008_task_reel_diff)
	local selTab = {}
	if task_diff == nil or task_diff == 0 then
		selTab = {
				"Xin ®­a ta vÒ!/#gohome("..get_type()..")",
				"T×m hiÓu ho¹t ®éng TiÕt Thanh Minh./tomb_sweep_2007_inf",
				"MÖt qu¸! Cho ngåi nghØ chót ®·!/end_dialog",
				}
	else
		selTab = {
				"Xin ®­a ta vÒ!/#gohome("..get_type()..")",
				"NhËn phÇn th­ëng./get_teel_task_prize",
				"Hñy nhiÖm vô./teel_task_release",
				"T×m hiÓu ho¹t ®éng TiÕt Thanh Minh./tomb_sweep_2007_inf",
				"MÖt qu¸! Cho ngåi nghØ chót ®·!/end_dialog",
				}
	end
	Say("<color=green>"..get_transport_name().."<color>: §a t¹"..Zgc_pub_sex_name().."®Õn b¸i tÕ mé chñ nh©n, cã cÇn tiÓu nh©n ®­a ngµi vÒ kh«ng?",getn(selTab),selTab);
end
--*******************************´«»ØÈı´óÖ÷³Ç*****************************
function gohome(MapIndex)
	NewWorld(LeavePointTab[MapIndex][1],LeavePointTab[MapIndex][2],LeavePointTab[MapIndex][3]);
end
--********************************ÈÎÎñ½±Àø»»È¡****************************
function get_teel_task_prize()
	--ÔÚ»î¶¯ÆÚ¼äÓĞĞ§
	if is_qingming_opened() ~= 1 then				
		Talk(1,"","<color=green>"..get_transport_name().."<color>: TiÕt Thanh Minh ®· qua, "..Zgc_pub_sex_name().."NÕu cã lßng n¨m sau nhí ®Õn cóng b¸i!")
		return
	end
	--Íæ¼Ò¸ºÖØ¼ì²â
	if Zgc_pub_goods_add_chk(2,10) ~= 1 then
		return
	end
	--ÈÎÎñ´ÎÊı¼ì²â
	local reel_task_date_seq_save = GetTask(tomb_sweep_2008_task_reel_date_seq)
	local reel_task_num_save = GetTask(tomb_sweep_2008_task_reel_num)
	local date_seq_now = zgc_pub_day_turn(1)	
	if reel_task_date_seq_save >= date_seq_now and reel_task_num_save == 0 then
		--ÊÕ·ÑÇø¶ş´Î
		local nTemp = 0
		if IS_SHOUFEI == TRUE then
			nTemp = 2
		else
			nTemp = 1
		end
		Talk(1,"","<color=green>"..get_transport_name().."<color>: Vµo tiÕt Thanh Minh, mËt ®å nhiÖm vô mçi ngµy chØ cã thÓ hoµn thµnh <color=yellow>"..nTemp.."<color> lÇn, Ng­¬i cã thÓ vµo Ngù C¸c mua <color=yellow>giÊy cóng tÕ<color> t¨ng sè lÇn hoµn thµnh!")
		return
	end
	
	local task_diff = GetTask(tomb_sweep_2008_task_reel_diff)
	--ÈÎÎñ¼ì²â
	if task_diff == 0 or task_diff == nil then
		Talk(1,"","<color=green>"..get_transport_name().."<color>: Tr­íc mé tiªn nh©n kh«ng ®­îc nãi bËy"..Zgc_pub_sex_name().."B»ng h÷u nhËn nhiÖm vô khi nµo?")
		return
	end
	--ÈÎÎñ¾íÖá¼ì²â
	if GetItemCount(2,0,(tomb_sweep_2007_start_goodsID + task_diff -1)) < 1 then
		Talk(1,"","<color=green>"..get_transport_name().."<color>: Ng­¬i kh«ng mang theo mËt ®å nhiÖm vô!")
		return
	end
	if task_reel_table[task_diff][1] == 1 then			--É±¹ÖÈÎÎñ
		if GetTask(tomb_sweep_2008_task_reel_step) ~= 1 then
			Talk(1,"","<color=green>"..get_transport_name().."<color>: "..Zgc_pub_sex_name().."kh«ng ®­îc nãi bËy tr­íc mé tiªn nh©n, lµm xong nhiÖm vô míi ®Õn ®©y!")
			return
		end
	elseif task_reel_table[task_diff][1] == 2 then    --ÆÕÍ¨ÎïÆ·ÈÎÎñ
		--ÎïÆ·ÓµÓĞ¼ì²â
		for i = 1,task_reel_table[task_diff][2] do
			local add_num = (i - 1) * 5
			if task_reel_table[task_diff][10+add_num] ~= 1 then
				if GetItemCount(task_reel_table[task_diff][7+add_num],task_reel_table[task_diff][8+add_num],task_reel_table[task_diff][9+add_num]) < task_reel_table[task_diff][10+add_num] then
					Talk(1,"","<color=green>"..get_transport_name().."<color>: X¸c nhËn ng­¬i ®· mang ®ñ <color=yellow>"..task_reel_table[task_diff][6+add_num].."<color>!")
					return
				end
			else
				if GetItemCount(task_reel_table[task_diff][7+add_num],task_reel_table[task_diff][8+add_num],task_reel_table[task_diff][9+add_num]) < task_reel_table[task_diff][10+add_num] then
					Talk(1,"","<color=green>"..get_transport_name().."<color>: X¸c nhËn ng­¬i ®· mang ®ñ <color=yellow>"..task_reel_table[task_diff][6+add_num].."<color>!")
					return
				--ÊÕ×°±¸Ê±ÎªÁË·ÀÖ¹ÊÕ´í£¬¶àÓÚÊÕµÄ¼şÊıÒ»ÂÉ²»ÊÕ¡£
				elseif GetItemCount(task_reel_table[task_diff][7+add_num],task_reel_table[task_diff][8+add_num],task_reel_table[task_diff][9+add_num]) > task_reel_table[task_diff][10+add_num] then
					Talk(1,"","<color=green>"..get_transport_name().."<color>: "..task_reel_table[task_diff][6+add_num].."d­ ra <color=yellow>1<color> c¸i, l·o phu kh«ng thÓ nhËn.")
					return
				end
			end
		end
	else --ÁéÊ¯ÈÎÎñ
		for i = 1,task_reel_table[task_diff][2] do
			local add_num = (i - 1) * 3
			if GetTask(task_reel_table[task_diff][8+add_num]) < task_reel_table[task_diff][7+add_num] then
				Talk(1,"","<color=green>"..get_transport_name().."<color>: X¸c nhËn trong Tô Linh ®Ønh cã ®ñ <color=yellow>"..task_reel_table[task_diff][6+add_num].."<color>!")
					return
			end;--if
		end;--for
			
	end
	local player_level = GetLevel()
	local exp_chg_num = 0
	local exp_add_num = 0
	if IS_SHOUFEI == TRUE then--ÅĞ¶ÏÊÕ·ÑÃâ·Ñ
		exp_chg_num = floor(600000*player_level*player_level/(80*80))
		exp_add_num = floor(900000*player_level*player_level/(80*80))
	else
		exp_chg_num = 0
		exp_add_num = floor(1200000*player_level*player_level/(80*80))
	end;
	local task_diff = GetTask(tomb_sweep_2008_task_reel_diff)
	local szProbability = "0%"
	local nExpChgTimes = 0
	local nExpAddTimes = 0
	local n99Lingshi = 1
	local n99Book = 2
	if task_reel_table[task_diff][1] == 1  then			--É±¹ÖÈÎÎñ
		szProbability = task_reel_table[task_diff][4].."%"
		nExpChgTimes = floor(exp_chg_num * (task_reel_table[task_diff][5]))
		nExpAddTimes = floor(exp_add_num * (task_reel_table[task_diff][5]))
		n99Lingshi = floor(task_reel_table[task_diff][5])
		n99Book = floor(2 * task_reel_table[task_diff][5])
	elseif  task_reel_table[task_diff][1] == 2 then
		szProbability = task_reel_table[task_diff][3].."%"
		nExpChgTimes = floor(exp_chg_num * (task_reel_table[task_diff][4]))
		nExpAddTimes = floor(exp_add_num * (task_reel_table[task_diff][4]))
		n99Lingshi = floor(task_reel_table[task_diff][4])
		n99Book = floor(2 * task_reel_table[task_diff][4])
	elseif	task_reel_table[task_diff][1] == 3 then
		szProbability = task_reel_table[task_diff][3].."%"
		nExpChgTimes = floor(exp_chg_num * (task_reel_table[task_diff][4]))
		nExpAddTimes = floor(exp_add_num * (task_reel_table[task_diff][4]))
		n99Lingshi = floor(task_reel_table[task_diff][4])
		n99Book = floor(2 * task_reel_table[task_diff][4])
	end
	--ÊÕ·ÑÇø100Íò½¡¿µ*µÈ¼¶Ë¥¼õ+150Íò¾­Ñé*µÈ¼¶Ë¥¼õ
	if IS_SHOUFEI == TRUE then
		local golden_exp = GetGoldenExp()
		if GetLevel() ~= 99 then
			if golden_exp < exp_chg_num then
				Say("<color=green>"..get_transport_name().."<color>: §iÓm søc kháe hiÖn t¹i cña ng­¬i lµ <color=yellow>"..golden_exp.."<color> ®iÓm, kh«ng ®ñ ®æi <color=yellow>"..exp_chg_num.."<color> ®iÓm, ®ång thêi nhËn ®­îc <color=yellow>"..exp_add_num.."<color> kinh nghiÖm. Cã <color=yellow>"..szProbability.."<color> nhËn ®­îc <color=yellow>"..nExpAddTimes.."<color> kinh nghiÖm. Cã muèn ®æi kh«ng?",
				2,
				"Ta x¸c nhËn/golden_exp_chg",
				"§Ó ta suy nghÜ l¹i/end_dialog")
			else
				Say("<color=green>"..get_transport_name().."<color>: §iÓm søc kháe hiÖn t¹i cña ng­¬i lµ <color=yellow>"..golden_exp.."<color> ®iÓm. Theo ®¼ng cÊp hiÖn t¹i cña ng­¬i, ng­¬i cã thÓ lÊy <color=yellow>"..exp_chg_num.."<color> ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm, ®ång thêi nhËn ®­îc <color=yellow>"..exp_add_num.."<color> kinh nghiÖm. Còng cã <color=yellow>"..szProbability.."<color> lÊy <color=yellow>"..nExpChgTimes.."<color> ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm, ®ång thêi nhËn ®­îc <color=yellow>"..nExpAddTimes.."<color> kinh nghiÖm. Cã muèn ®æi kh«ng?",
				2,
				"Ta x¸c nhËn/golden_exp_chg",
				"§Ó ta suy nghÜ l¹i/end_dialog")
			end	
		else
			Say("<color=green>"..get_transport_name().."<color>: Ng­¬i nhËn ®­îc <color=yellow>2 cuèn Thiªn Thêi Chó Gi¶i, 1 Linh th¹ch cÊp cÊp 1-7, <color>hoÆc<color=yellow>"..szProbability.."<color> x¸c suÊt nhËn <color=yellow>"..n99Book.."<color> cuèn Thiªn Thêi Chó Gi¶i, <color=yellow>"..n99Lingshi.."<color> Linh th¹ch ngÉu nhiªn cÊp 1~7. Cã muèn ®æi kh«ng?",
				2,
				"Ta x¸c nhËn/golden_exp_chg",
				"§Ó ta suy nghÜ l¹i/end_dialog")
		end
	else
		if GetLevel() ~= 99 then
			Say("<color=green>"..get_transport_name().."<color>: HiÖn t¹i kinh nghiÖm nhËn ®­îc cña ng­¬i lµ <color=yellow>"..exp_add_num.."<color> ®iÓm, cã <color=yellow>"..szProbability.."<color> nhËn ®­îc <color=yellow>"..nExpAddTimes.."<color> kinh nghiÖm. Cã muèn ®æi kh«ng?",
				2,
				"Ta x¸c nhËn/golden_exp_chg",
				"§Ó ta suy nghÜ l¹i/end_dialog")
		else
			Say("<color=green>"..get_transport_name().."<color>: Ng­¬i nhËn ®­îc <color=yellow>2 cuèn Thiªn Thêi Chó Gi¶i, 1 Linh th¹ch cÊp cÊp 1-7, <color>hoÆc<color=yellow>"..szProbability.."<color> x¸c suÊt nhËn <color=yellow>"..n99Book.."<color> cuèn Thiªn Thêi Chó Gi¶i, <color=yellow>"..n99Lingshi.."<color> Linh th¹ch ngÉu nhiªn cÊp 1~7. Cã muèn ®æi kh«ng?",
				2,
				"Ta x¸c nhËn/golden_exp_chg",
				"§Ó ta suy nghÜ l¹i/end_dialog")
		end
	end
end
--*******************************½¡¿µ¾­Ñé×ª¾­Ñé***************************
function golden_exp_chg()
	--99¼¶¸ºÖØ¼ì²â
	if GetLevel() == 99 then
		if Zgc_pub_goods_add_chk(4,50) ~= 1 then
			return
		end
	else
		if Zgc_pub_goods_add_chk(3,50) ~= 1 then
			return
		end
	end
	local task_diff = GetTask(tomb_sweep_2008_task_reel_diff)
	if task_reel_table[task_diff][1] == 2 then
		--ÎïÆ·É¾³ı¼ì²â
		for i = 1,task_reel_table[task_diff][2] do
			local add_num = (i - 1) * 5
			if DelItem(task_reel_table[task_diff][7+add_num],task_reel_table[task_diff][8+add_num],task_reel_table[task_diff][9+add_num],task_reel_table[task_diff][10+add_num]) ~= 1 then
				Talk(1,"","<color=green>"..get_transport_name().."<color>: X¸c nhËn ng­¬i ®· mang ®ñ <color=yellow>"..task_reel_table[task_diff][6+add_num].."<color>")
				return
			end
		end
	elseif task_reel_table[task_diff][1] == 3 then
		--ÁéÊ¯É¾³ı
		for i = 1,task_reel_table[task_diff][2] do
			local add_num = (i - 1) * 3
			if GetTask(task_reel_table[task_diff][8+add_num]) < task_reel_table[task_diff][7+add_num] then
				Talk(1,"","<color=green>"..get_transport_name().."<color>: X¸c nhËn trong Tô Linh ®Ønh cã ®ñ <color=yellow>"..task_reel_table[task_diff][6+add_num].."<color>!")
				return
			else
				SetTask(task_reel_table[task_diff][8+add_num],GetTask(task_reel_table[task_diff][8+add_num])-task_reel_table[task_diff][7+add_num]);
			end;--if
		end;--for
	end
	--ÈÎÎñ¾íÖáÉ¾³ı¼ì²â
	if DelItem(2,0,(tomb_sweep_2007_start_goodsID + task_diff -1),1) ~= 1 then
		Talk(1,"","<color=green>"..get_transport_name().."<color>: Nhí mang theo mËt ®å Thanh Minh t­¬ng øng víi nhiÖm vô ng­¬i ®· lµm, nÕu kh«ng l·o phu rÊt khã xö!")
		return
	end
	--¼ÀÆ·Ôö¼Ó
	Talk(1,"","<color=green>"..get_transport_name().."<color>: RÊt c¶m kİch sù cèng hiÕn cña ng­¬i, mét chót lÔ vËt bµy tá t©m ı.")
	if tonumber(date("%y%m%d")) ~= 20080412 then			--×îºóÒ»Ìì²»Ôö¼Ó¼ÀÆ·
		for i = 1,2 do
			AddItem(2,0,random(387,389),1)
		end
	end
	--½¡¿µ¾­Ñé×ª¾­Ñé
	local player_level = GetLevel()
	local golden_exp = GetGoldenExp()
	local exp_chg_num = 0
	local exp_add_num = 0
	if IS_SHOUFEI == TRUE then
		exp_chg_num = floor(600000*player_level*player_level/(80*80))
		exp_add_num = floor(900000*player_level*player_level/(80*80))
	else
		exp_chg_num = 0
		exp_add_num = floor(1200000*player_level*player_level/(80*80))
	end
	if player_level ~= 99 then
		--ÊÕ·ÑÇø100Íò½¡¿µ*µÈ¼¶Ë¥¼õ+150Íò¾­Ñé*µÈ¼¶Ë¥¼õ
		if task_reel_table[task_diff][1] == 1 and random(1,100) <= task_reel_table[task_diff][4] then			--É±¹ÖÈÎÎñ
			exp_chg_num = exp_chg_num * (task_reel_table[task_diff][5])
			exp_add_num = exp_add_num * (task_reel_table[task_diff][5])
		elseif  task_reel_table[task_diff][1] == 2 and  random(1,100) <= task_reel_table[task_diff][3] then
			exp_chg_num = exp_chg_num * (task_reel_table[task_diff][4])
			exp_add_num = exp_add_num * (task_reel_table[task_diff][4])
		elseif	task_reel_table[task_diff][1] == 3 and	random(1,100)	<= task_reel_table[task_diff][3] then
			exp_chg_num = exp_chg_num * (task_reel_table[task_diff][4])
			exp_add_num = exp_add_num * (task_reel_table[task_diff][4])
		end
		if GetTask(tomb_sweep_2008_task_reel_completed) == 7 then--Íê³É8´Î¾íÖáÈÎÎñµÃµ½½±Àøe
			exp_chg_num = exp_chg_num * 5
			exp_add_num = exp_add_num * 5
		end --ifGetTask
		exp_chg_num = floor(exp_chg_num)--ÏòÏÂÈ¡Õû
		if exp_chg_num > golden_exp then
			exp_chg_num = golden_exp
		end
		if IS_SHOUFEI == TRUE then
			if exp_chg_num ~= 0 then
				ModifyGoldenExp(-exp_chg_num)
				ModifyExp(exp_chg_num)
				Msg2Player("Chóc mõng b¹n chuyÓn"..exp_chg_num.." ®iÓm søc kháe chuyÓn thµnh kinh nghiÖm!")
			end
		end
		exp_add_num = floor(exp_add_num)
		ModifyExp(exp_add_num)
		Msg2Player("Chóc mõng b¹n nhËn ®­îc "..exp_add_num.." ®iÓm kinh nghiÖm!")
	else
		local n99Times = 1
		local n99Book = 2
		if task_reel_table[task_diff][1] == 1 and random(1,100) <= task_reel_table[task_diff][4] then			--É±¹ÖÈÎÎñ
			n99Times = task_reel_table[task_diff][5]
		elseif  task_reel_table[task_diff][1] == 2 and  random(1,100) <= task_reel_table[task_diff][3] then
			n99Times = task_reel_table[task_diff][4]
		elseif	task_reel_table[task_diff][1] == 3 and	random(1,100)	<= task_reel_table[task_diff][3] then
			n99Times = task_reel_table[task_diff][4]
		end
		if mod(GetTask(tomb_sweep_2008_task_reel_completed),8) == 7 then--Íê³É8´Î¾íÖáÈÎÎñµÃµ½½±Àøe
			n99Times = 5
			Msg2Player("Do ng­¬i ®· hoµn thµnh 8 lÇn nhiÖm vô, cho nªn nhËn ®­îc phÇn th­ëng gÊp 5 lÇn!")
		end --ifGetTask
		n99Book = floor(n99Book * n99Times)
		if Zgc_pub_goods_add_chk(2,50) == 1 then--ÌìÊ±×¢½â¿ÉÒÔµş¼Ó999±¾
			AddItem(2,1,3210,n99Book)--»ñµÃÌìÊ±×¢½ân99Book±¾
			Msg2Player("B¹n nhËn ®­îc Thiªn Thêi Chó Gi¶i "..n99Book.." quyÓn!")
		end --if zgc_pub_gooods_add_chk
		n99Times = floor(n99Times)
		local nTemp = 1
		for nTemp = 1,n99Times,1 do
			--======»ñµÃËæ»ú1-7ÁéÊ¯1¿Å,»ñµÃ7¼¶ÁéÊ¯µÄ¼¸ÂÊµ÷Õûµ½1/20
			local lvLingShi = 1
			local nRander = random(1,210)
			if nRander <= 120 then
				--1~4¼¶ÁéÊ¯
				lvLingShi = random(1,4)
			elseif nRander <= 203 then
				--5~6¼¶ÁéÊ¯
				lvLingShi = random(5,6)
			else
				lvLingShi = 7
			end
			SetTask(SYS_TSK_LINGSHI_ONE + lvLingShi - 1,GetTask(SYS_TSK_LINGSHI_ONE + lvLingShi - 1)+1)
			Msg2Player("B¹n nhËn ®­îc "..lvLingShi.."(cÊp) Linh Th¹ch!")
		end--for
	end -- lv99
	--ÈÎÎñÍê³É´¦Àí
		--Êı¾İ»ñÈ¡
	if task_reel_table[task_diff][1] == 1 then				--Èç¹ûÊÇÉ±¹ÖÈÎÎñÔòÉ¾³ıÉ±¹Ö´¥·¢Æ÷
		RemoveTrigger(GetTrigger(task_reel_table[task_diff][6]))--ÖØ¸´É¾³ı´¥·¢Æ÷£¿
	end
	local reel_task_date_seq_save = GetTask(tomb_sweep_2008_task_reel_date_seq)
	local reel_task_num_save = GetTask(tomb_sweep_2008_task_reel_num)
	local date_seq_now = zgc_pub_day_turn(1)
	--Êı¾İ±£´æ
	if reel_task_date_seq_save < date_seq_now then
		SetTask(tomb_sweep_2008_task_reel_date_seq,date_seq_now)
		if IS_SHOUFEI == TRUE then
			SetTask(tomb_sweep_2008_task_reel_num,1)
			--Çå¿Õ×òÈÕµÄÈÎÎñ´ÎÊı£¿>.<ÊÕ·ÑÇøÃ¿ÌìÁ½´Î£¬×öÁËÒ»´Î£¬»¹Ê£Ò»´Î
		else
			SetTask(tomb_sweep_2008_task_reel_num,0)
		end
		--tomb_sweep_2008_task_reel_date_seqÕâÊÇ¼ÇÂ¼Ã¿ÌìÈÎÎñ´ÎÊıÊÇ·ñ¸üĞÂÓÃµÄ
	elseif reel_task_date_seq_save >= date_seq_now and reel_task_num_save > 0 then
		SetTask(tomb_sweep_2008_task_reel_num,(reel_task_num_save-1))
	else
		SetTask(tomb_sweep_2008_task_reel_num,0)
	end;
	SetTask(tomb_sweep_2008_task_reel_completed,GetTask(tomb_sweep_2008_task_reel_completed)+1)
	SetTask(tomb_sweep_2008_task_reel_diff,0)
	SetTask(tomb_sweep_2008_task_reel_step,0)
end
--**********************************ÈÎÎñÈ¡Ïû******************************
function teel_task_release()
	local task_diff = GetTask(tomb_sweep_2008_task_reel_diff)
	if task_diff == 0 or task_diff == nil then
		Talk(1,"","<color=green>"..get_transport_name().."<color>: Tr­íc mé tiªn nh©n kh«ng ®­îc nãi bËy"..Zgc_pub_sex_name().."Ng­¬i ch­a nhËn qua nhiÖm vô nªn kh«ng thÓ hñy!")
		return
	elseif task_diff >= 1 and task_diff <= 10 then
		Say("<color=green>"..get_transport_name().."<color>: MËt ®å nµy lµ "..Zgc_pub_sex_name().."ng­êi h÷u duyªn míi cã, ng­¬i thËt sù muèn hñy kh«ng?",
		2,
		"§óng/task_release_dtm",
		"§Ó ta suy nghÜ l¹i/end_dialog"
		)
	else			--Êı¾İ³ö´íµÄÇé¿ö
		SetTask(tomb_sweep_2008_task_reel_diff,0)
	end
end
--********************************ÈÎÎñÊı¾İÇå³ı*******************************
function task_release_dtm()
	local task_diff = GetTask(tomb_sweep_2008_task_reel_diff)
	if task_reel_table[task_diff][1] == 1 then				--Èç¹ûÊÇÉ±¹ÖÈÎÎñÔòÉ¾³ıÉ±¹Ö´¥·¢Æ÷
		RemoveTrigger(GetTrigger(task_reel_table[task_diff][6]))
	end
	SetTask(tomb_sweep_2008_task_reel_diff,0)
	Msg2Player("B¹n ®· hñy nhiÖm vô Thanh Minh!")
end
--********************************»î¶¯ÏêÇéÃèÊö*******************************
function tomb_sweep_2007_inf()
	Talk(2,"tomb_sweep_2007_inf_1",
	"<color=green>"..get_transport_name().."<color>:\n    Thêi gian ho¹t ®éng: <color=yellow>3/4-12/4<color>. \n    Trong TiÕt Thanh Minh viÖc t¶o mé lµ chñ yÕu, ta cÇn cóng b¸i c¸c vŞ nh­ <color=yellow>Hoµng ®¹i hiÖp, Hµn ®¹i hiÖp, Hiªn Viªn ®¹i hiÖp<color>.",
	"<color=green>"..get_transport_name().."<color>:\n    Trong TiÕt Thanh Minh mçi ngµy ®Õn bÊt kú mé phÇn cóng b¸i <color=yellow>1<color> lÇn b»ng c¸ch '<color=yellow>v¸i l¹y<color>' lµ ®­îc. BŞ ®¹i hiÖp khİch lÖ, sÏ khiÕn cho kinh nghiÖm giang hå cña ng­¬i t¨ng kh«ng İt. Cßn cã c¬ héi t¨ng kinh nghiÖm giang hå. NÕu trong thêi gian diÔn ra ho¹t ®éng, thµnh t©m cóng b¸i <color=yellow>8<color> ngµy, sÏ nhËn ®­îc khİch lÖ lín"
	)
end
function tomb_sweep_2007_inf_1()
	Talk(2,"","<color=green>"..get_transport_name().."<color>:\n    Cóng b¸i mçi ngµy cßn nhËn ®­îc nhiÖm vô do <color=yellow>Thñ L¨ng Mé<color> giao. Hoµn thµnh nhiÖm vô mang <color=yellow>mËt ®å<color> giao tr¶ <color=yellow>Thñ L¨ng Mé<color> sÏ nhËn ®­îc phÇn th­ëng <color=yellow>nhÊt ®Şnh<color> vµ <color=yellow>vËt phÈm cóng b¸i<color>.",
		"<color=green>"..get_transport_name().."<color>:\n    VËt phÈm cóng b¸i sö dông tr­íc khi cóng mçi ngµy x¸c suÊt t¨ng kinh nghiÖm giang hå nhËn ®­îc rÊt cao. H«m nay ®· cóng råi kh«ng thÓ sö dông l¹i."
)
end
