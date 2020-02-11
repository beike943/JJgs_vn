--½Å±¾Ãû³Æ£º2007ÇåÃ÷½Ó»î¶¯ÈÎÎñ¾íÖáµ÷ÓÃ½Å±¾¡£
--½Å±¾¹¦ÄÜ£ºÍæ¼ÒÊ¹ÓÃÈÎÎñ¾íÖá£¬Ôö¼ÓÏà¹ØÈÎÎñ¡£
--²ß»®ÈË£º°¢ËÉ
--´úÂë±àĞ´ÈË£º´å³¤
--´úÂë±àĞ´Ê±¼ä£º2007-03-14
--´úÂëĞŞ¸Ä¼ÇÂ¼£º
Include("\\script\\online\\zgc_public_fun.lua")					--´å³¤µÄ¹«¹²º¯Êı

--========================================Glb±äÁ¿¶¨ÒåÇø====================================
tomb_sweep_2007_start_goodsID = 675
tomb_sweep_2007_task_reel_date_seq = 855			--ÈÎÎñµÄÈÕÆÚĞòÊı
tomb_sweep_2007_task_reel_num = 856					--¿ÉÍê³ÉµÄÈÎÎñÊıÁ¿
tomb_sweep_2007_task_reel_diff = 857				--µ±Ç°µÄÈÎÎñÖÖÀà
tomb_sweep_2007_task_reel_step = 858				--µ±Ç°ÈÎÎñ²½Öè£¨É±¹Ö£©
task_reel_table = {
	--ÈÎÎñÀàĞÍ(£¨1¡¢ÎªÉ±¹Ö£»2ÎªÊÕ¼¯£©-Íê³É±êÖ¾-¹ÖÎïÃû³Æ-´¥·¢Æ÷ID-½±Àø°Ù·Ö¼¸ÂÊ-½±Àø±¶Êı-Ëæ»ú¼ÀÆ·ÊıÁ¿--ËµÃ÷
	{1,"C«n ®å",1205,5,10,900,"    TiÕt Thanh Minh ®· ®Õn,  chç ta cã mét sè mËt ®å nhiÖm vô dµnh cho nh÷ng ai thµnh t©m cóng b¸i. \n <color=yellow>NhiÖm vô<color>:<color> <color=yellow>C«n ®å ngoµi thµnh<color> lµm h¹i b¸ t¸nh,  ®i ®¸nh b¹i <color=yellow>30<color> tªn sau ®ã quay vÒ <color=yellow>Hµn gia nh©n<color> phôc mÖnh. \n <color=yellow>PhÇn th­ëng: 95% c¬ héi nh©n ®«i <color> kinh nghiÖm hoÆc <color=yellow>5%<color> c¬ héi gÊp <color=yellow>11<color> kinh nghiÖm. "},
	--ÈÎÎñÀàĞÍ-ÊÕ¼¯ÎïÆ·ÖÖÀà-ÈÎÎñ½±Àø°Ù·Ö¼¸ÂÊ-ÈÎÎñ½±Àø±¶Êı-Ëæ»ú¼ÀÆ·Êı-ÊÕ¼¯µÄÎïÆ·Ãû³Æ-ÊÕ¼¯µÄÎïÆ·´óÀà-¸±Àà-Ğ¡Àà-ÊıÁ¿--ËµÃ÷<color>
	{2,1,10,5,2,"Hæ vÜ",2,1,19,20,"    TiÕt Thanh Minh ®· ®Õn,  chç ta cã mét sè mËt ®å nhiÖm vô dµnh cho nh÷ng ai thµnh t©m cóng b¸i. \n    <color=yellow>Néi dung nhiÖm vô: ®u«i hæ<color> lµm thuèc cã thÓ trŞ bÖnh hay. H·y thu thËp <color=yellow>20<color> c¸i <color=yellow> ®u«i hæ<color> vµ ®Õn <color=yellow>Thñ L¨ng Nh©n<color> ®Ó phôc mÖnh. \n  <color=yellow>PhÇn th­ëng nhiÖm vô: 90%<color> c¬ héi nh©n <color=yellow>®«i <color>kinh nghiÖm hoÆc <color=yellow>10%<color> c¬ héi nh©n <color=yellow>6<color> kinh nghiÖm."},
	{1,"XÊu xa",1206,16,3,901,"    TiÕt Thanh Minh ®· ®Õn,  chç ta cã mét sè mËt ®å nhiÖm vô dµnh cho nh÷ng ai thµnh t©m cóng b¸i. \n   <color=yellow>Néi dung nhiÖm vô: D­¬ng Trung §éng<color> cã nh÷ng tªn <color=yellow>Quan sø<color>,  hµ hiÕp b¸ t¸nh. H·y ®i gi¸o huÊn ®i gi¸o huÊn <color=yellow>30<color> tªn,  sau ®ã cã thÓ ®Õn <color=yellow>Thñ l¨ng nh©n<color> ®Ó phôc mÖnh.\n    <color=yellow>PhÇn th­ëng nhiÖm vô: nhËn ®­îc 84% c¬ héi<color> <color=yellow> nh©n ®«i <color>kinh nghiÖm hoÆc <color=yellow>16%<color> c¬ héi nh©n <color=yellow>4<color> kinh nghiÖm."},
	{2,2,20,2.5,2,"Linh Chu t¬",2,2,54,10,"Da gÊu",2,2,20,10,"    TiÕt Thanh Minh ®· ®Õn,  chç ta cã mét sè mËt ®å nhiÖm vô dµnh cho nh÷ng ai thµnh t©m cóng b¸i. \n <color=yellow>NhiÖm vô<color>: HiÖn triÒu ®×nh cÇn mét sè vËt liÖu,  ®i thu thËp 10 <color=yellow>Linh Chu t¬<color>,  10 <color=yellow>Da gÊu<color> sau ®ã ®ã quay vÒ <color=yellow>Hµn gia nh©n<color> phôc mÖnh. \n <color=yellow>PhÇn th­ëng:  80% c¬ héi nh©n ®«i <color> kinh nghiÖm hoÆc <color=yellow>20%<color> c¬ héi gÊp <color=yellow>3.5<color> kinh nghiÖm. "},
	{2,2,30,1.7,2,"BÇu r­îu da dª",2,1,60,10,"Kim Thoa",2,1,41,10,"    TiÕt Thanh Minh ®· ®Õn,  chç ta cã mét sè mËt ®å nhiÖm vô dµnh cho nh÷ng ai thµnh t©m cóng b¸i. \n <color=yellow>NhiÖm vô<color>: HiÖn triÒu ®×nh cÇn mét sè vËt liÖu,  ®Õn <color=yellow>KiÕm M«n Quan<color> thu thËp 10 <color=yellow>bÇu r­îu da dª<color>,  ®Õn <color=yellow>KiÕm C¸c thôc ®¹o<color> thu thËp 10 <color=yellow>Kim Thoa<color> sau ®ã quay vÒ Hµn gia nh©n<color> phôc mÖnh. \n <color=yellow>PhÇn th­ëng: 70% c¬ héi nh©n ®«i <color> kinh nghiÖm hoÆc <color=yellow>30%<color> c¬ héi gÊp <color=yellow>2.7<color> kinh nghiÖm. "},
	{2,2,40,1.25,2,"Thiªn Lang y",0,100,15,1,"Minh Quang gi¸p",0,100,51,1,"    TiÕt Thanh Minh ®· ®Õn,  chç ta cã mét sè mËt ®å nhiÖm vô dµnh cho nh÷ng ai thµnh t©m cóng b¸i. \n <color=yellow>NhiÖm vô<color>:T×m 1 <color=yellow>Thiªn Lang y<color> vµ 1 <color=yellow>Minh Quang gi¸p<color> sau ®ã quay vÒ <color=yellow>Thñ l¨ng nh©n<color> phôc mÖnh. \n    <color=yellow>PhÇn th­ëng nhiÖm vô: 60%<color> c¬ héi nh©n ®«i<color=yellow> <color> kinh nghiÖm hoÆc <color=yellow>40%<color> c¬ héi gÊp <color=yellow>2.25<color> lÇn ®iÓm kinh nghiÖm."},
	{2,2,50,1,2,"Gi¸p x¸c phiÕn",2,1,177,10,"Khª S¬n chİ",2,1,98,10,"    TiÕt Thanh Minh ®· ®Õn,  chç ta cã mét sè mËt ®å nhiÖm vô dµnh cho nh÷ng ai thµnh t©m cóng b¸i. \n <color=yellow>NhiÖm vô<color>: HiÖn triÒu ®×nh cÇn mét sè vËt liÖu,  ®i thu thËp 10 <color=yellow>Gi¸p x¸c phiÕn ë §µo Hoa §¶o<color>,  10 <color=yellow>b¶n ®å rõng nói gèc ë §¹i Th¶o Nguyªn<color>,  sau ®ã quay vÒ <color=yellow>Hµn gia nh©n<color> phôc mÖnh. \n    <color=yellow>PhÇn th­ëng: 50%<color> c¬ héi ®­îc nh©n ®«i<color=yellow> <color> kinh nghiÖm vµ <color=yellow>50%<color> c¬ héi nhËn ®­îc gÊp <color=yellow>1.5<color> lÇn ®iÓm kinh nghiÖm."},
	{1,"Xi Háa tr­ëng l·o",1207,65,0.75,902,"    TiÕt Thanh Minh ®· ®Õn,  chç ta cã mét sè mËt ®å nhiÖm vô dµnh cho nh÷ng ai thµnh t©m cóng b¸i. \n <color=yellow>Néi dung nhiÖm vô: Long Nh·n §éng<color> cã tªn <color=yellow>Xi Háa tr­ëng l·o<color> mª hoÆc b¸ t¸nh,  sau khi ®¸nh b¹i <color=yellow>30<color> tªn trong ®ã,  h·y ®Õn <color=yellow>Thñ L¨ng Nh©n<color> ®Ó phôc mÖnh. \n    <color=yellow>PhÇn th­ëng nhiÖm vô: nhËn ®­îc 45% c¬ héi<color> <color=yellow> nh©n ®«i <color>kinh nghiÖm hoÆc <color=yellow>65%<color> c¬ héi nh©n <color=yellow>4<color> kinh nghiÖm."},
	{2,2,80,0.65,2,"HuyÒn thiÕt Träng KiÕm",0,2,26,1,"Ph¸ Thiªn kİch",0,6,107,1,"    TiÕt Thanh Minh ®· ®Õn,  chç ta cã mét sè mËt ®å nhiÖm vô dµnh cho nh÷ng ai thµnh t©m cóng b¸i. \n <color=yellow>Néi dung nhiÖm vô: <color>H·y t×m 1 c¸i chu«i <color=yellow>HuyÒn thiÕt träng kiÕm 1<color> vµ 1 chu«i <color=yellow>Ph¸ Thiªn Kİch 1<color>,  sau ®ã ®Õn gÆp Thñ l¨ng nh©n ®Ó phôc mÖnh. \n    <color=yellow>PhÇn th­ëng nhiÖm vô: 45%<color> c¬ héi nh©n <color=yellow>®«i <color>kinh nghiÖm hoÆc <color=yellow>65%<color> c¬ héi nhËn ®­îc <color=yellow>1.75<color> lÇn kinh nghiÖm."},
	{1,"Tiªu Tiªn Tö",1208,100,0.5,903,"    TiÕt Thanh Minh ®· ®Õn, chç ta cã mét sè mËt ®å nhiÖm vô dµnh cho nh÷ng ai thµnh t©m cóng b¸i. \n <color=yellow>Néi dung nhiÖm vô: Tiªu Tiªn Tö<color> ë <color=yellow>Thanh ¢m ®éng<color> mª hoÆc kh«ng İt nh©n sÜ vâ l©m, ®i ®¸nh b¹i mét trong <color=yellow>30<color> ng­êi sau ®ã quay vÒ <color=yellow>Hµn gia nh©n<color> phôc mÖnh. \n <color=yellow>PhÇn th­ëng: 100%<color> c¬ héi gÊp <color=yellow>1.5<color> kinh nghiÖm."}
	}
--========================================º¯ÊıÖ÷Âß¼­Çø=====================================
--***********************************¾íÖáÊ¹ÓÃÖ÷º¯Êı****************************
function OnUse(goods_index)
	if GetLevel() < 11 then
		Talk(1,"","<color=green>Nh¾c nhë<color>:"..Zgc_pub_sex_name().."cÇn rÌn luyÖn thªm mét thêi gian!")
		return
	end
	local task_reel_diff = (GetItemParticular(goods_index) - tomb_sweep_2007_start_goodsID + 1)
	local task_step_now = GetTask(tomb_sweep_2007_task_reel_diff)
	if task_step_now == 0 or task_step_now == nil then
		Say("B¹n muèn thùc hiÖn b­íc nµo?",
		3,
		"NhËn nhiÖm vô trong mËt ®å/#reel_task_accept("..task_reel_diff..")",
		"Xem néi dung nhiÖm vô/#reel_inf_print("..task_reel_diff..",1)",
		"§ãng nhiÖm vô/end_dialog"
		)
	elseif task_step_now >= 1 and task_step_now <= 10 then
		Say("B¹n muèn thùc hiÖn b­íc nµo?",
		3,
		"Xem nhiÖm vô ®ang lµm/#reel_inf_print("..task_step_now..",2)",
		"Xem néi dung nhiÖm vô/#reel_inf_print("..task_reel_diff..")",
		"§ãng nhiÖm vô/end_dialog"
		)
	else										--·ÀÖ¹Êı¾İ³ö´í
		SetTask(tomb_sweep_2007_task_reel_diff,0)
	end
end
--*********************************¾íÖáÏêÏ¸ĞÅÏ¢²éÑ¯****************************
function reel_inf_print(reel_diff,inq_flag)
	if tomb_sweep_2007_date_chk() ~= 1 then				--ÔÚ»î¶¯ÆÚ¼äÓĞĞ§
		Talk(1,"","Ho¹t ®éng ®· kÕt thóc!")
		return
	end
	Say(task_reel_table[reel_diff][getn(task_reel_table[reel_diff])],
	1,
	"Ta biÕt råi/end_dialog")
end
--************************************½ÓÊÜÈÎÎñ********************************
function reel_task_accept(task_diff)
	--ÔÚ»î¶¯ÆÚ¼äÓĞĞ§
	if tomb_sweep_2007_date_chk() ~= 1 then
		Talk(1,"","Ho¹t ®éng ®· kÕt thóc!")
		return
	end
	--
	--Êı¾İ»ñÈ¡
	local reel_task_date_seq_save = GetTask(tomb_sweep_2007_task_reel_date_seq)
	local reel_task_num_save = GetTask(tomb_sweep_2007_task_reel_num)
	local date_seq_now = zgc_pub_day_turn(1)
	--¿ÉÒÔÍê³ÉµÄÈÎÎñ´ÎÊı¼ì²â
	if reel_task_date_seq_save >= date_seq_now and reel_task_num_save == 0 then
		Talk(1,"","MËt ®å nhiÖm vô TiÕt Thanh Minh mçi ngµy chØ lµm ®­îc <color=yellow>1<color> lÇn, b¹n cã thÓ d¹o phè mua <color=yellow>giÊy cóng tÕ<color> ®Ó t¨ng sè lÇn hoµn thµnh nhiÖm vô!")
		return
	end
	if reel_task_date_seq_save < date_seq_now then
		SetTask(tomb_sweep_2007_task_reel_num,1)
	end
	SetTask(tomb_sweep_2007_task_reel_date_seq,date_seq_now)		--½ñÌìÈÕÆÚĞòÊıĞ´Èë
	SetTask(tomb_sweep_2007_task_reel_diff,task_diff)
	SetTask(tomb_sweep_2007_task_reel_step,0)
	if task_reel_table[task_diff][1] == 1 then						--Èç¹ûÎªÉ±¹ÖÈÎÎñÔò´´½¨É±¹Ö´¥·¢Æ÷
		CreateTrigger(0,task_reel_table[task_diff][3],task_reel_table[task_diff][6])
	end
	Talk(1,"","B¹n ®· nhËn nhiÖm vô thø <color=yellow>"..task_diff.."<color> cã thÓ ®Õn <color=yellow>thñ l¨ng nh©n<color> hñy nhiÖm vô hoÆc nhËn th­ëng! \n NhÊn chuét ph¶i xem néi dung nhiÖm vô!")
end
