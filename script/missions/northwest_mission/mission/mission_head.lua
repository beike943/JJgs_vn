--ÎÄ¼şÃû³Æ£ºÎ÷±±Çø¹Ø¿¨missionÍ·ÎÄ¼ş
--ÎÄ¼ş¹¦ÄÜ£ºÎ÷±±Çø¹Ø¿¨missionµÄÍ·ÎÄ¼ş£¬Ö÷Òª×ömissionµÄÕûºÏ´¦Àí
--²ß»®ÈË£º³Â¹«×Ó
--´úÂë¿ª·¢ÈË£º´å³¤
--´úÂë¿ª·¢Ê±¼ä£º2007-08-06
--´úÂëĞŞ¸Ä¼ÇÂ¼£º
--±¸×¢£ºÎÒ²»ÉÏÌìÌÃ£¬Ë­ÉÏÌìÌÃ£¿
--¹«¹²±äÁ¿¶¨ÒåÇø
--mission timer
Include("\\script\\lib\\globalfunctions.lua")
Timmer_ID = 67				--¼ÆÊ±Æ÷ID
Frame_per_second = 18						--·şÎñÆ÷Ã¿ÃëÖ¡Êı=18
Timer_interval = 10 * Frame_per_second		--µ÷ÓÃµÄÃëÊı
Timmer_loop_num = 194						--×Ü¼ÆÑ­»·µÄ´ÎÊı

--¹«¹²±äÁ¿¶¨ÒåÇø
Mission_step_taskID = 1
TB_mission_step_value = {10,15,20,25,30}

MS_ID = 39									--missionµÄid
--MS_ID×ÜµÄÊ¹ÓÃÇé¿ö£¨1-9ÎªËùÓĞMSÍ¨ÓÃ10ÒÔºó¸÷¸öMS×ÔĞĞ·ÖÅä£©
MS_STATE_ID = 1						--mission×´Ì¬µÄ´æ´¢id
MS_STATE_DIFF_ID = 2				--µ±Ç°ÊÇµÚ¼¸¹ØµÄid
MS_PLAYER_NUM = 3					--´æ·Å½øÈëÍæ¼ÒµÄÊıÁ¿
MS_DIFF = 4								--´æ·Åµ±Ç°¹Ø¿¨Ä£Ê½£¨1ÎªÆÕÍ¨£¬2Îª¸´ÔÓ£©
MS_TIMMER_LOOP_ID = 5			--¼ÆÊ±Æ÷µÄÊıÁ¿´æ·ÅÎ»ÖÃ

MS_BOSS_KILL_NUM = 11			--µÚÎå¹ØÉ±ËÀbossµÄÊıÁ¿
MS_BOSS_INDEX_ID = 12			--bossË÷Òı´æ·ÅÎ»ÖÃ
MS_DRAGON_FOX_NUM = 13		--Íæ¼ÒÉ±ËÀĞ¡¹Ö/ÑªÄ§ÈËÊıÁ¿´æ·ÅÎ»ÖÃ
MS_BLOOD_MONSTER_NUM = 14 --ÑªÄ§ÈËµÄÊıÁ¿
--20-25±£´æbossË÷Òı
MS_BOSS_INDEX_1 = 21
MS_BOSS_INDEX_2 = 22
MS_BOSS_INDEX_3 = 23
MS_BOSS_INDEX_4 = 24
MS_BOSS_INDEX_5 = 25
--mission×´Ì¬ID
MS_state_unuse = 0
MS_state_wait_start = 1
MS_state_running = 2
MS_state_wait_end = 3
--triggerÊ¹ÓÃID
Trigger_ID = 1110
Trigger_save_ID = 904
Tb_stage_npc_name = {"§Ö Tö C«n L«n","Thñ mé nh©n","Thñ Mé T­íng Qu©n","D­îc thÊt thñ vÖ","Ngò Hµnh TrËn Sø","B¹ch Thiªn Thµnh"}
--2008-06-12£ºÌí¼Ó
Npc_name_city = "<color=green>MËt th¸m §¹i Tèng T©y Vùc<color>: "
TaskID_miss_login_diff = 1426
--end
Stage_count = getn(Tb_stage_npc_name)
Stage_info = {}
for i = 1,Stage_count do
	--¹Ø¿¨ĞÅÏ¢
	Stage_info[i] = {}
	--¹Ø¿¨º¯ÊıĞÅÏ¢
	Stage_info[i] .Timmer_function = {}
end
--Ã¿¹ØÊ±¼ä½ø¶ÈÌõµÄÊıÁ¿
Tb_stage_time_bar_num = {2,4,2,2,2,3}
--Ğ¡¹ÖÊıÁ¿ÏŞÖÆ
Tb_devil_num_max = {0,20,20,40,25,20}
--´³¹ØÌõ¼şÏà¹Ø¹«¹²±äÁ¿
	--½øÈë¹Ø¿¨×îµÍµÈ¼¶
	Stage_player_level_min = 85
	--´³¹ØÈËÊıÏŞÖÆ
	team_member_chk = {3,5}
	--½øÈë¹Ø¿¨µÄPK×î´óÖµ
	Mission_PK_max = 3
	--Ã¿ÖÜ½øÈë¹â¿¨µÄ´ÎÊıÏŞÖÆ
	Mission_week_seq_TaskID = 1422
	Mission_login_times_TaskID = 1423
	Mission_login_times_per_week = 10
	--Á÷ÅÉÃû³Æ
	Tb_route_name = {
		[0] = "Ch÷ tr¾ng",
		[1] = "ThiÕu L©m",
		[2] = "ThiÕu L©m tôc gia",
		[3] = "ThiÕu L©m thiÒn t¨ng",
		[4] = "ThiÕu L©m vâ t¨ng",
		[5] = "§­êng M«n",
		[6] = "§­êng M«n",
		[7] = "Nga My",
		[8] = "Nga My phËt gia",
		[9] = "Nga My tôc gia",
		[10] = "C¸i Bang",
		[11] = "C¸i Bang TÜnh y",
		[12] = "C¸i Bang ¤ Y",
		[13] = "Vâ §ang",
		[14] = "Vâ §ang ®¹o gia",
		[15] = "Vâ §ang tôc gia",
		[16] = "D­¬ng M«n",
		[17] = "D­¬ng M«n th­¬ng Kş",
		[18] = "D­¬ng M«n Cung Kş",
		[19] = "Ngò §éc",
		[20] = "Tµ hiÖp",
		[21] = "Cæ s­",
	}
--npcÃû³Æ
for i = 1,6 do
	Stage_info[i].npc_name = "<color=green>"..Tb_stage_npc_name[i].."<color>: "
end
--½øÈë¹Ø¿¨ĞèÒªµÄtaskid
Stage_info.task_ID = {2031,68,"NhiÖm vô T©y b¾c-Hoµng Sa L¹c M¹c"}
--npcÖ÷¶Ô»°
Stage_info[1].main_dialog = {Stage_info[1].npc_name.."Ng­¬i lµ ai? §Êt nµy cã dŞ thó, v« cïng nguy hiÓm, nÕu kh«ng cã viÖc g× th× mau mau ®i ®i.",
							Stage_info[1].npc_name.."Cæ D­¬ng Thó bŞ d­îc lùc cña háa luyÖn kim ®¬n lµm træi dËy tİnh khİ hung ¸c, trèn t¹i n¬i ®©y, xem ra nã ®ang høng chŞu mïi vŞ ®au khæ."	
							}
Stage_info[1].no_task_dialog = Stage_info[1].npc_name.."Ng­¬i lµ ai? <color=yellow>Cæ D­¬ng dŞ thó<color> ®· xuÊt hiÖn, t¹m thêi phong táa ®éng nµy, n¬i ®©y rÊt nguy hiÓm, nÕu kh«ng cã viÖc g× th× mau ®i ®i."					--ÎŞÈÎÎñÊ±ºòµÄ¶Ô»°
Stage_info[1].finish_task_dialog = Stage_info[1].npc_name.."V« cïng c¶m kİch b»ng h÷u t­¬ng trî, Cæ D­¬ng thó ®· bŞ thu phôc, trong MËt ®éng t¹m thêi kh«ng kh¸c th­êng. NÕu Cæ D­¬ng thó l¹i cã hµnh ®éng kh¸c l¹. Xin nhê b»ng h÷u gióp ®ì!"
Stage_info[1].stage_name = "Cæ D­¬ng MËt ®éng"											--stageÃû³Æ
Stage_info[1].ground_sel_dialog = {
	{Stage_info[1].npc_name.."NÕu nay cã hµo kiÖt thu phôc Cæ D­¬ng dŞ thó, nhµ ng­¬i ®Õn ®©y thö mét phen?",Stage_info[1].npc_name.."NÕu nay cã <color=yellow>5<color> ®éi nh©n m· thö thu phôc Cæ D­¬ng dŞ thó, ®· ®ñ søc ®èi phã. Xin ®îi mét l¸t."},
	{Stage_info[1].npc_name.."RÊt nhiÒu cao thñ t×m ®­îc Bİch Dao Thanh T©m §¬n, nh­ng muèn Cæ D­¬ng Thó ngoan ngoan phôc dïng e r»ng ph¶i tèn c«ng søc. Ng­¬i muèn ®Õn ®ã kh«ng?",Stage_info[1].npc_name.."Sè ng­êi ®Õn Cæ D­¬ng §éng ®· ®Çy, khi kh¸c h·y quay l¹i!"},
}
Stage_info[1].log_in_dialog = {"Ta ph¶i d¾t ®éi ®i thu phôc Cæ D­¬ng thó","Ta muèn dÉn ®éi cøu Cæ D­¬ng Thó",}
Stage_info[1].map ={{1100,1200},{1300,1400,1500}}								--¿ªÆôµÄ5¸ö¹Ø¿¨¶ÔÓ¦µÄmap_id 
--´³¹ØÌõ¼ş
Stage_info[1].stage_background =  {	Stage_info[1].npc_name.."<color=yellow>Cæ D­¬ng ®éng<color> nghe ®ån cã <color=yellow>DŞ thó<color> trÊn thñ. Cæ D­¬ng thó tuy cã søc m¹nh phi th­êng, nh­ng còng chØ ë ®éng. Tªn ph¶n ®å <color=yellow>Phi Th­êng §¹o Nh©n<color>lßng d¹ hiÓm ¸c, ı muèn lîi dông thó nµy g©y häa cho nh©n gian. Cæ D­¬ng thó phôc d­íi Háa luyÖn Kim ®¬n ®· trë nªn hung ¸c, ta nhËn lÖnh s­ phô t¹m thêi phong Ên trong MËt ®éng, nh­ng l¹i bŞ th­¬ng nªn ch­a thÓ diÖt trõ qu¸i thó. Nh­ng nhÊt ®Şnh ph¶i diÖt trõ nã...",
																Stage_info[1].npc_name.."<color=yellow>Cæ D­¬ng Thó<color> tr­íc ®ã bŞ thu phôc, lóc dÉn vÒ C«n L«n ®· thoi thãp. §­îc <color=green>Mai s­ thóc<color> ch÷a trŞ. <color=green>Mai s­ thóc<color> ®­a phÇn lín háa luyÖn kim ®¬n vµo trong ng­êi linh thó, gi÷ l¹i C«n L«n ®Ó hÊp thu tinh hoa trêi ®Êt. Kh«ng ®Ó <color=yellow>Cæ D­¬ng Thó<color> r¬i vµo Táa Yªu Th¸p, yªu khİ trong th¸p cã thÓ khiÕn linh thó béc ph¸t tİnh khİ hung d÷, <color=yellow>Cæ D­¬ng Thó<color> d­êng nh­ ®ang ph¶i chŞu sù ®au ®ín tét cïng, ch­a s¸t th­¬ng mét ai ®· lÉn trèn vµo trong ®éng nµy."
									}
Stage_info[1].stage_condition = {	Stage_info[1].npc_name.."Cæ D­¬ng dŞ thó uy lùc v« song, cÇn <color=yellow>3 ®Õn 5 ng­êi cña c¸c m«n ph¸i kh¸c<color> hîp lùc míi cã thÓ thu phôc. NÕu ®· biÕt râ gèc tİch cña Cæ D­¬ng dŞ thó, cã thÓ t×m hiÓu c¸ch thu phôc nã qua <color=yellow>s­ huynh DiÖp Tö Thu<color> cña bæn ph¸i, mang tİn vËt cña s­ huynh <color=yellow>C«n L«n TrÊn Yªu phï<color> vµ <color=yellow>§µo Méc KiÕm<color> tíi, ta sÏ yªn t©m ®Ó ng­¬i vµo ®éng thu phôc dŞ qu¸i.",
															Stage_info[1].npc_name.."Cæ D­¬ng Thó tİnh khİ ph¸t t¸c, nÕu muèn cøu nã cÇn:\n  <color=green>1<color>. <color=yellow>§éi tr­ëng tæ ®éi 3-5 ng­êi<color>, <color=red>tÊt c¶ thµnh viªn <color> cÇn lµm <color=yellow>nhiÖm vô T©y b¾c-Hoµng Sa L¹c M¹c<color>\n  <color=green>2<color>. Trªn ng­êi ®éi tr­ëng ph¶i cã <color=yellow>Bİch Dao Thanh T©m §¬n<color>.\n  <color=green>3<color>. Trong ®éi kh«ng ®­îc cã ng­êi <color=yellow>vâ c«ng l­u ph¸i gièng nhau<color>."}					--¹Ø¿¨µÄ±³¾°½éÉÜ
Stage_info[1].task_goods = {
	{	
		{2,0,704,1,"C«n Lu©n trÊn yªu phï"},
		{2,0,759,1,"C«n Lu©n §µo méc kiÕm"},
	},
	{	
		{2,0,1031,1,"Bİch Dao Thanh T©m §¬n"},
	}
}	--´³¹ØĞèÒªÎïÆ·
Stage_info[1].task_ID = {2032,17}													--´³¹ØÊ±¶ÔÓ¦µÄID
Stage_info[1].in_coordinate = {1584,3223}											--½øÈë¶ÔÓ¦×ø±ê
Stage_info[1].out_coordinate = {512,2061,3414}										--´«³öµÄµØÍ¼¼°×ø±ê
Stage_info[1].cannot_log_reason = {
	{	Stage_info[1].npc_name.."Cæ D­¬ng Thó uy lùc kinh ng­êi, søc mét ng­êi kh«ng thÓ ®èi phã, cÇn ph¶i dÉn theo <color=yellow>3-5 ng­êi luyÖn theo h­íng kh¸c nhau vµ ®­îc ®éi tr­ëng dÉn d¾t<color> h½n ®Õn ®©y!",
		Stage_info[1].npc_name.."Cæ D­¬ng dŞ thó uy lùc ®¸ng sî, ta ®­îc ®¹i s­ bæn ph¸i dÆn dß, ë ®©y phong táa ®éng huyÖt, kh«ng cho ai ®Õn gÇn, tr¸nh lµm bŞ th­¬ng ng­êi v« téi. NÕu ng­¬i kh«ng ®i t×m s­ huynh <color=yellow>DiÖp Tö Thu<color>, t×m hiÓu c¸ch thu phôc dŞ qu¸i, mang theo tİn vËt <color=yellow>§µo Méc KiÕm<color> vµ <color=yellow>TrÊn Yªu phï<color> thu phôc Cæ D­¬ng thó cña s­ huynh råi tíi thö xem thÕ nµo!",
		Stage_info[1].npc_name.."Cæ D­¬ng Thó uy lùc v« song <color=yellow>nÕu ®ång ®éi ch­a biÕt thùc lùc cña linh thó<color>, ngang nhiªn x«ng vµo, e r»ng nguy hiÓm ®Õn tİnh m¹ng, khuyªn ng­¬i mau mau rêi khái.",
		Stage_info[1].npc_name.."CÇn ph¶i cã <color=yellow>ng­êi vâ c«ng tinh th«ng c¸c m«n ph¸i kh¸c nhau<color> hiÖp lùc hîp t¸c míi cã thÓ quy phôc Cæ D­¬ng thó, nÕu kh«ng ng­¬i ph¶i lµm thÕ nµo?"
	},
	{	Stage_info[1].npc_name.."Cæ D­¬ng Thó hiÖn rÊt hung bao, ph¶i häp søc <color=yellow>3-5 ng­êi<color>. (Nh¾c nhë: ",
		Stage_info[1].npc_name.."Cæ D­¬ng Thó bŞ kİch thİch d­îc lùc trong ng­êi, Mai s­ thóc c¨n dÆn cÇn dïng <color=yellow>Bİch Dao Thanh T©m §¬n<color> tõ tõ hãa gi¶i d­îc lùc trong ng­êi míi ®­îc.",
		Stage_info[1].npc_name.."C¸c ng­êi ch­a biÕt râ lai lŞch cña Cæ D­¬ng Thó, tèt nhÊt kh«ng nªn vµo trong. (Nh¾c nhë: <color=yellow>Thµnh viªn trong ®éi ph¶i hoµn thµnh nhiÖm vô T©y b¾c-Hoµng Sa L¹c M¹c<color>)",
		Stage_info[1].npc_name.."Cæ D­¬ng Thó rÊt hung b¹o, <color=yellow>ph¶i biÕt vâ c«ng cña c¸c m«n ph¸i kh¸c nhau<color>, ®ång t©m hîp søc míi cã thÓ chiÕn th¾ng."
	},
	{	Npc_name_city.."Muèn ®¸nh b¹i <color=yellow>Cæ D­¬ng Thó<color> víi søc lùc c¸c ng­¬i e r»ng kh«ng ®ñ, mau kªu ®éi tr­ëng dÉn theo <color=yellow>3-5 ng­êi cÊp 85 trë lªn<color> míi mong chÕ ngù næi tİnh hung b¹o cña <color=yellow>Cæ D­¬ng Thó<color>.",
		Npc_name_city.."<color=yellow>Cæ D­¬ng Thó<color> tİnh khİ bÊt th­êng, nh­ng <color=green>Mai BÊt Dung<color> ®· luyÖn chÕ ra <color=yellow>Bİch Dao Thanh T©m §¬n<color> cã thÓ gi¶m tİnh hung bao cña <color=yellow>Cæ D­¬ng Thó<color>, nÕu c¸c ng­¬i kh«ng cã <color=yellow>Bİch Dao Thanh T©m §¬n<color> th× ®õng miÔn c­ìng. T¹i sao <color=yellow>Cæ D­¬ng Thó<color> l¹i nh­ vËy µ? µi! Ph¶i ®Õn <color=yellow>Cæ D­¬ng §éng<color> ®iÒu tra th«i.",
		Npc_name_city.."H×nh nh­ c¸c ng­êi ch­a ®i hÕt T©y vùc, ch­a t×m hiÓu kü n¬i ®ã. Ta e ®­êng ®Õn Cæ D­¬ng §éng c¸c ng­¬i cßn kh«ng biÕt, lµm xong <color=yellow>nhiÖm vô T©y b¾c-Hoµng Sa L¹c M¹c<color> h½n ®Õn ®©y.",
		Npc_name_city.."Trong ®éi cã ng­êi vâ c«ng <color=yellow>l­u ph¸i gièng nhau<color>, kh«ng thÓ ®èi phã víi <color=yellow>Cæ D­¬ng Thó<color>.",
	},
}		--ÎŞ·¨½øÈë¹Ø¿¨µÄÔ­Òò¶Ô»°
Stage_info[1].boss_chat = {			--bossº°»°
	"§i th«i! NÕu kh«ng ng­¬i sÏ gÆp ph¶i næi khæ nh­ ta…",
	"Nh÷ng sinh linh d¹i dét, lµm sao cã thÓ v­ît qua tù nhiªn!",
	"§i th«i! NÕu kh«ng bŞ nuèt chöng b©y giê!",
	"Rêi khái ®©y th«i mäi ng­êi, sau nµy ®õng bao giê ®Æt ch©n ®Õn ®©y n÷a!",
	"§i nhanh!... Ng­¬i vèn kh«ng nªn tíi ®©y!",
}
Stage_info[1].stage_start_msg ="Ng­êi ngùa ®· vµo Cæ D­¬ng MËt ®éng, Cæ D­¬ng thó sÏ tØnh l¹i trong sau 1 phót, mäi ng­êi chuÈn bŞ t­ thÕ s½n sµng nghªnh chiÕn."
Stage_info[1].stage_start_talk = "Do mét sè tia s¸ng cña kho¸ng th¹ch ph¸t ra, khiÕn trong ®éng ¸nh lªn mµu ®á nh­ m¸u. Xung quanh hoang tµn ®æ n¸t, x¸c ng­êi chÊt ®èng, bÊt luËn <color=yellow>Ng­êi ®µo kho¸ng thÇn bİ<color> hay <color=yellow>Li Long Háa Hå<color> bªn ngoµi ®Òu thÊy ®­îc vÕt tİch ®ã. Bän ng­êi t×m b¶o vËt muèn x«ng vµo trong ®éng nh­ng hä kh«ng ngê r»ng <color=yellow>Cæ D­¬ng Thó<color> bŞ <color=yellow>háa luyÖn kim ®¬n<color> dµy vß, trë nªn hung ¸c, <color=yellow>Cæ D­¬ng Thó<color> nhËp vµo nh÷ng ai x©m ph¹m. Cµng nhiÒu sinh vËt trong ®éng cµng thu hót nhiÒu <color=yellow>HuyÕt Ma Nh©n<color>."
Stage_info[1].boss_crt_msg = " Cæ D­¬ng Thó trÊn thñ MËt ®éng ®· hiÖn th©n! Ph¶i tiªu diÖt ®­îc nã trong 30 phót, nÕu kh«ng hµnh ®éng lÇn nµy sÏ thÊt b¹i. "
Stage_info[1].stage_end_msg = "Hµnh ®éng thu phôc Cæ D­¬ng Thó lÇn nµy ®· hoµn thµnh, sau ®ã sÏ ®­a c¸c vŞ ®Õn bªn ngoµi MËt ®éng. Xin ®õng nãng. "
Stage_info[1].stage_start_time_bar = "Cæ D­¬ng Thó hiÖn th©n (®Õm ng­îc)"
Stage_info[1].boss_crt_time_bar = "Thu phôc Cæ D­¬ng Thó (®Õm ng­îc)"
Stage_info[1].stage_end_time_bar = "Khu vùc ®­îc dÉn ®Õn, (®Õm ng­îc)"
---------------------------------------------------»ªÀöµÄ·Ö¸îÏß---------------------------------------
Stage_info[2].main_dialog = {Stage_info[2].npc_name.."To gan! §øng l¹i. §©y lµ Hoµng L¨ng MËt §¹o, ng­êi l¹ kh«ng ®­îc ®Õn gÇn, nÕu kh«ng sÏ bŞ TrÊn Mé Linh Thó trõng ph¹t nghiªm!",
							Stage_info[2].npc_name.."To gan! Bªn trong ®Çy rÉy c¹m bÉy, nÕu muèn sèng h·y mau chãng rêi khái!"	
							}
Stage_info[2].no_task_dialog = 	Stage_info[2].npc_name.."To gan! §øng l¹i. §©y lµ Hoµng L¨ng MËt §¹o, ng­êi l¹ kh«ng ®­îc ®Õn gÇn, nÕu kh«ng sÏ nhËn ®­îc hËu qu¶ kh«n l­êng. "					--ÎŞÈÎÎñÊ±ºòµÄ¶Ô»°
Stage_info[2].finish_task_dialog = Stage_info[2].npc_name.."Ai ®¸m tiªu diÖt TrÊn Mé Linh Thó! Nh©n lóc ta ch­a næi giËn, mau cót ®i, nÕu kh«ng thÇn h«n ngµn n¨m ta ®©y sÏ kh«ng bu«ng tha. "
Stage_info[2].stage_name = "Hoµng L¨ng MËt ®¹o"											--stageÃû³Æ
Stage_info[2].ground_sel_dialog = {
	{Stage_info[2].npc_name.."§øng l¹i! Phİa tr­íc cã TrÊn Mé Linh Thó canh gi÷, c­¬ng quyÕt vµo MËt ®¹o chØ cã chÕt!",Stage_info[2].npc_name.."§øng l¹i! Phİa tr­íc cã TrÊn Mé Linh Thó canh gi÷, c¸c ®­êng ®i vµo MËt ®¹o ®· ®ãng. "},
	{Stage_info[2].npc_name.."Cã b¶n lÜnh th× cø më xem TrÊn Mé Linh Thó cã tha ng­¬i kh«ng!",Stage_info[2].npc_name.."C¬ quan chuyÓn ®éng, phong táa mËt ®¹o."},
}
Stage_info[2].log_in_dialog = {"Ta ph¶i dÉn ®ång ®éi ®i tiªu diÖt TrÊn Mé Thó. ","Ta ph¶i dÉn ®ång ®éi ®i tiªu diÖt TrÊn Mé Thó. ",}
Stage_info[2].map = {{1101,1201},{1301,1401,1501}}									--¿ªÆôµÄ5¸ö¹Ø¿¨¶ÔÓ¦µÄmap_id
Stage_info[2].stage_background = {	Stage_info[2].npc_name.."N¬i ®©y vèn dÜ long m¹ch, xung quanh bè trİ theo h×nh cöu cung, trªn d­íi 2 tÇng, cã TrÊn Mé Linh Thó canh gi÷, ngang nhiªn x«ng vµo ¾t giÕt kh«ng tha!",
																Stage_info[2].npc_name.."N¬i ®©y vèn dÜ long m¹ch, xung quanh bè trİ theo h×nh cöu cung, trªn d­íi 2 tÇng, cã TrÊn Mé Linh Thó canh gi÷, ngang nhiªn x«ng vµo ¾t giÕt kh«ng tha!"
									}
Stage_info[2].stage_condition = {	Stage_info[2].npc_name.."N¬i ta yªn nghÜ, kh«ng ®­îc x©m ph¹m, ngang nhiªn x«ng vµo ¾t giÕt kh«ng tha! NÕu cã ai dÉn theo <color=yellow>3-5 ng­êi<color> x«ng vµo ®©y vµ ph¸ 4 huyÖt phong thñy, TrÊn Mé Linh Thó sÏ trõng trŞ hä. Nh­ng chóng kh«ng giÕt 1,2 ng­êi x«ng vµo, ch­a ph¸ 4 huyÖt phong thñy, <color=yellow>kh«ng giÕt nh÷ng ng­êi cã vâ c«ng l­u ph¸i gièng nhau<color>",
															Stage_info[2].npc_name.."TrÊn Mé Linh Thó chØ tÊn c«ng tõ <color=yellow>3-5 ng­êi cã vâ c«ng l­u ph¸i kh¸c nhau<color>, c¬ quan mËt ®¹o ®· më, nÕu cã b¶n lÜnh më mËt ®¹o ®· khãa, linh thó sÏ kh«ng tha."}					--´³¹ØÌõ¼ş
Stage_info[2].task_goods = {
	{},
	{	
		{2,0,1032,1,"Håi Long s¸ch"}
	}
}												--´³¹ØĞèÒªÎïÆ·
Stage_info[2].task_ID = {2031,25}												--´³¹ØÊ±¶ÔÓ¦µÄID
Stage_info[2].in_coordinate = {1599,3224}										--½øÈë¶ÔÓ¦×ø±ê
Stage_info[2].out_coordinate = {513,1591,3192}									--´«³öµÄµØÍ¼¼°×ø±ê
Stage_info[2].cannot_log_reason = {	--ÎŞ·¨½øÈë¹Ø¿¨µÄÔ­Òò¶Ô»°
	{	Stage_info[2].npc_name.."TrÊn Mé Linh Thó kh«ng tÊn c«ng 1,2 ng­êi, cßn kh«ng mau rêi khái! Nh­ng nÕu cã tõ <color=yellow>3-5 ng­êi x«ng vµo<color>, linh thó sÏ kh«ng tha.",
		Stage_info[2].npc_name.."N¬i ta yªn nghØ, kh«ng ®­îc x©m ph¹m! ",
		Stage_info[2].npc_name.."N¬i ta yªn nghØ, kh«ng ®­îc x©m ph¹m! <color=yellow>Nh÷ng ai kh«ng biÕt ®©y lµ mé cña ta mµ v« t×nh x«ng vµo, ta sÏ tha téi chÕt<color>, cßn kh«ng mau rêi khái!",
		Stage_info[2].npc_name.."N¬i ta yªn nghØ, kh«ng ®­îc x©m ph¹m! <color=yellow>(Nh¾c nhë: Trong ®éi cã ng­êi cïng m«n ph¸i, kh«ng ®­îc vµo Hoµng L¨ng MËt ®¹o.<color>",
		},
	{	Stage_info[2].npc_name.."N¬i ta yªn nghØ, kh«ng ®­îc x©m ph¹m! TrÊn Mé Linh Thó chØ tÊn c«ng <color=yellow>3 -5 ng­êi<color> ngang nhiªn x«ng vµo. (Nh¾c nhë: ",
		Stage_info[2].npc_name.."N¬i ta yªn nghØ, kh«ng ®­îc x©m ph¹m! (Nh¾c nhë: muèn ph¸ c¬ quan bªn trong, cÇn ph¶i dïng <color=yellow>Håi Long S¸ch<color> cña kÎ c­íp mé)",
		Stage_info[2].npc_name.."N¬i ta yªn nghØ, kh«ng ®­îc x©m ph¹m! Nh¾c nhë: <color=yellow>Thµnh viªn trong ®éi cÇn ph¶i hoµn thµnh nhiÖm vô T©y b¾c-Hoµng Sa L¹c M¹c<color>)",
		Stage_info[2].npc_name.."N¬i ta yªn nghØ, kh«ng ®­îc x©m ph¹m! (Nh¾c nhë: Thµnh viªn trong ®éi <color=yellow>vâ c«ng l­u ph¸i kh«ng ®­îc gièng nhau<color>)",
		},
	{	Npc_name_city.."<color=yellow>TrÊn Mé Thó<color> canh gi÷ mËt ®¹o, muèn ®èi phã <color=yellow>TrÊn Mé Thó<color> cÇn ®éi tr­êng mêi tõ <color=yellow>3-5 ng­êi cÊp 85 trë lªn<color>, nÕu kh«ng chØ cã chÕt trong ®©y.",
		Npc_name_city.."Qua ®iÒu tra <color=yellow>Hoµng L¨ng mËt ®¹o<color> liªn th«ng víi Hoµng L¨ng tÇng 1,2, nh­ng c¬ quan ®· bŞ ph¸, muèn më ph¶i cã <color=yellow>Håi Long S¸ch<color>, c¸c ng­¬i thö ®i t×m nh÷ng tªn c­íp mé hái thö.",
		Npc_name_city.."H×nh nh­ c¸c ng­¬i ch­a ®i hÕt T©y vùc, ch­a t×m hiÓu kü n¬i ®ã. <color=yellow>TrÊn Mé Thó<color> trong <color=yellow>Hoµng L¨ng mËt ®¹o<color> kh«ng dÔ ®èi phã, c¸c ng­êi hoµn thµnh <color=yellow>nhiÖm vô T©y b¾c-Hoµng Sa L¹c M¹c<color> h½n ®Õn ®©y.",
		Npc_name_city.."Trong ®éi cã thµnh viªn vâ c«ng l­u ph¸i gièng nhau, kh«ng thÓ ®èi phã <color=yellow>TrÊn Mé Thó<color>.",
	},
}	
Stage_info[2].boss_chat = {
	"Ta ®©y trÊn gi÷ n¬i ®©y, ai d¸m lµm cµn! ",
	"Bän ng­êi ngu muéi kia, ®Ó ta tiÔn c¸c ng­¬i xuèng suèi vµng! ",
	"Phµm nh÷ng ai kh«ng biÕt, ®õng b­íc vµo!. ",
	"Ta cho dï cã chÕt còng trÊn gi÷ ë ®©y!",
	"Hån ph¸ch c¸c ng­¬i ®ang run sî tr­íc ta! ",
}
Stage_info[2].stage_start_msg ="Nhãm ng­êi ngùa c¸c b¹n ®· vµo Hoµng L¨ng MËt ®¹o, TrÊn Mé Thó trÊn gi÷ MËt ®¹o sÏ tØnh l¹i sau 1 phót n÷a ®Ó truy ®uæi nh÷ng ng­êi vµo mé, mäi ng­êi ph¶i lu«n trong t­ thÕ chiÕn ®Êu!"
Stage_info[2].stage_start_talk = "<color=yellow>Håi Long S¸ch<color> qu¶ nhiªn lµ lîi h¹i. Tuy mËt ®¹o th«ng víi tÇng trªn tÇng d­íi, nh­ng <color=green>TÇn Thñy Hoµng<color> vÉn kh«ng l¬ lµ. <color=yellow>TrÊn Mé Thó<color> lÉn Hoµng L¨ng cßn nhiÒu ®iÒu huyÒn bİ. Xem ra <color=yellow>TrÊn Mé Thó<color> dÔ dµng ®èi phã gièng nh­ mËt ®¹o lµm mª hoÆc nh÷ng kÎ c­íp mé. <color=yellow>TrÊn Mé Thó<color> canh gi÷ l¨ng mé träng ®Şa, víi tİnh c¸ch cña <color=green>TÇn Thñy Hoµng<color> sao kh«ng l¾p ®Æt c¬ quan!? <color=yellow>TrÊn Mé Thó<color> vµ c¬ quan trong mé nhÊt ®Şnh cã liªn quan víi nhau."
Stage_info[2].boss_crt_msg = "TrÊn Mé Thó ®· xuÊt hiÖn! Trong vßng 30 phót ph¶i tiªu diÖt ®­îc nã, nÕu kh«ng hµnh ®éng vµo L¨ng mé lÇn nµy sÏ thÊt b¹i. "
Stage_info[2].stage_end_msg = "LÇn thu phôc TrÊn Mé Thó nµy ®· kÕt thóc. Xin ®îi gi©y l¸t sÏ dÉn c¸c vŞ ra ngoµi MËt ®¹o. "
Stage_info[2].stage_start_time_bar = "TrÊn Mé Thó xuÊt hiÖn (®Õm ng­îc)"
Stage_info[2].boss_crt_time_bar = "§¸nh b¹i TrÊn Mé Thó (®Õm ng­îc)"
Stage_info[2].stage_end_time_bar = "Khu vùc ®­îc dÉn ®Õn, (®Õm ng­îc)"
---------------------------------------------------Æ®ÒİµÄ·Ö¸îÏß---------------------------------------
Stage_info[3].main_dialog = {Stage_info[3].npc_name.."N¬i ta yªn nghÜ, kh«ng ®­îc x©m ph¹m, ngang nhiªn x«ng vµo ¾t giÕt kh«ng tha!",
							Stage_info[3].npc_name.."Ngang nhiªn x«ng vµo ¾t giÕt kh«ng tha!"	
							}
Stage_info[3].no_task_dialog = 	Stage_info[3].npc_name.."Ngang nhiªn x«ng vµo ¾t giÕt kh«ng tha!"
Stage_info[3].finish_task_dialog = Stage_info[3].npc_name.."Mau rêi khái ®©y, sè ng­¬i ch­a tËn! NÕu cßn quay l¹i lµ tù t×m ®­êng chÕt, kh«ng gÆp may nh­ vËy n÷a ®©u! "
Stage_info[3].stage_name = "Hoµng L¨ng mé thÊt"											--stageÃû³Æ
Stage_info[3].ground_sel_dialog = {
	{Stage_info[3].npc_name.."Ngang nhiªn x«ng vµo ¾t giÕt kh«ng tha!",Stage_info[3].npc_name.."Ngang nhiªn x«ng vµo ¾t giÕt kh«ng tha!"},
	{Stage_info[3].npc_name.."Ngang nhiªn x«ng vµo Quû T­íng Qu©n giÕt kh«ng tha!",Stage_info[3].npc_name.."Ngang nhiªn x«ng vµo ¾t ph¶i tr¶ gi¸, cöa mËt thÊt ®· ®ãng, kh«ng ai cã thÓ më ra!"},
}
Stage_info[3].log_in_dialog = {"Ta ph¶i dÉn ®ång ®éi ®i tiªu diÖt Quû T­¬ng §Çu","Ta ph¶i dÉn ®ång ®éi ®i tiªu diÖt Quû T­¬ng §Çu",}
Stage_info[3].map = {{1102,1202},{1302,1402,1502}}									--¿ªÆôµÄ5¸ö¹Ø¿¨¶ÔÓ¦µÄmap_id
Stage_info[3].stage_background = {Stage_info[3].npc_name.."N¬i ®©y vèn dÜ long m¹ch, cÊt gi÷ nhiÒu ch©u b¸u quı hiÕm, vµng b¹c nhiÒu v« sè kÓ! Cã TrÊn mé t­íng qu©n canh gi÷, Quû T­íng Qu©n nghiªm ngÆt b¶o vÖ, canh gi÷ kho b¸u.",
									Stage_info[3].npc_name.."N¬i ®©y vèn dÜ long m¹ch, cÊt gi÷ nhiÒu ch©u b¸u quı hiÕm, vµng b¹c nhiÒu v« sè kÓ! NÕu ai ®ã ngang nhiªn x©m ph¹m, Quû T­íng Qu©n sÏ trõng trŞ hä."
									}
Stage_info[3].stage_condition = { 					--´³¹ØÌõ¼ş
	Stage_info[3].npc_name.."Ngang nhiªn x«ng vµo ¾t giÕt kh«ng tha! Nh­ng <color=yellow>Quû T­íng Qu©n khèng giÕt 1,2 ng­êi x©m ph¹m, kh«ng giÕt nh÷ng ai cã vâ c«ng l­u ph¸i gièng nhau<color>",
	Stage_info[3].npc_name.."Ngang nhiªn x«ng vµo ¾t giÕt kh«ng tha! Quû T­íng Qu©n kh«ng giÕt 1,2 ng­êi x©m ph¹m, cßn kh«ng mau rêi khái!"
}
Stage_info[3].task_goods = {
	{},
	{
		{2,0,1033,1,"To¸i Th¹ch ChÊn"}
	}
}												--´³¹ØĞèÒªÎïÆ·
Stage_info[3].task_ID = {2031,27}												--´³¹ØÊ±¶ÔÓ¦µÄID
Stage_info[3].in_coordinate = {1590,3230}										--½øÈë¶ÔÓ¦×ø±ê
Stage_info[3].out_coordinate = {514,1728,2869}									--´«³öµÄµØÍ¼¼°×ø±ê
Stage_info[3].cannot_log_reason = {
	{
		Stage_info[3].npc_name.."Ngang nhiªn x«ng vµo ¾t giÕt kh«ng tha! Quû T­íng Qu©n kh«ng tÊn c«ng 1,2 ng­êi. <color=yellow>nÕu d¸m dÉn theo tõ 3-5 ng­êi<color>, Quû T­íng Qu©n sÏ kh«ng tha.",
		Stage_info[3].npc_name.."Ngang nhiªn x«ng vµo ®©y giÕt ¾t kh«ng tha! Kh«n hån mau rêi khái ®©y! ",
		Stage_info[3].npc_name.."Ngang nhiªn x«ng vµo ¾t giÕt kh«ng tha! Nh÷ng ai kh«ng biÕt, v« t×nh x©m ph¹m <color=yellow>nhanh chãng rêi khái n¬i ®©y.<color>",
		Stage_info[3].npc_name.."Ngang nhiªn x«ng vµo ®©y giÕt ¾t kh«ng tha! Kh«n hån mau rêi khái ®©y! <color=yellow>(Nh¾c nhë: Trong ®éi cã ng­êi cïng chuyªn m«n kh«ng ®­îc vµo Hoµng L¨ng MËt §¹o)<color>",
	},
	{
		Stage_info[3].npc_name.."Ngang nhiªn x«ng vµo ¾t giÕt kh«ng tha! Quû T­íng Qu©n chØ ®èi phã tõ <color=yellow>3-5 ng­êi<color> (Nh¾c nhë: ",
		Stage_info[3].npc_name.."Ngang nhiªn x«ng vµo ¾t giÕt kh«ng tha! Nh¾c nhë: Trªn ng­êi ®éi tr­ëng ph¶i cã <color=yellow>To¸i th¹ch chÊn<color>)",
		Stage_info[3].npc_name.."Ngang nhiªn x«ng vµo ¾t giÕt kh«ng tha! (Nh¾c nhë: <color=yellow>Thµnh viªn trong ®éi cÇn ph¶i hoµn thµnh nhiÖm vô T©y b¾c-Hoµng Sa L¹c M¹c<color>)",
		Stage_info[3].npc_name.."Ngang nhiªn x«ng vµo ¾t giÕt kh«ng tha! (Nh¾c nhë: Thµnh viªn trong ®éi <color=yellow>vâ c«ng l­u ph¸i kh«ng ®­îc gièng nhau<color>)",
	},
	{	Npc_name_city.."<color=yellow>Quû T­íng Qu©n<color> lóc cßn sèng theo phß TÇn Thñy Hoµng nam chinh b¾c ph¹t, nhÊt thèng thiªn h¹, sau khi TÇn Thñy Hoµng chÕt còng ch«n theo, c¸c ng­¬i ngang nhiªn x«ng vµo, nÕu trong ®éi kh«ng cã tõ <color=yellow>3-5 ng­êi cÊp 85 trë lªn<color> th× sao ®¸nh l¹i quû v­¬ng.",
		Npc_name_city.."Th¹ch m«n cña <color=yellow>Hoµng L¨ng mËt thÊt<color> ®· ®ãng, <color=yellow>To¸i th¹ch chÊn<color> cã thÓ ph¸ hñy mét lèi nhá ®i vµo, c¸c ng­¬i muèn vµo bªn trong ph¶i mang theo <color=yellow>To¸i th¹ch chÊn<color>.",
		Npc_name_city.."H×nh nh­ c¸c ng­êi ch­a ®i hÕt T©y vùc, ch­a t×m hiÓu kü n¬i ®ã. Uy lùc cña <color=yellow>Quû T­íng Qu©n<color> e r»ng c¸c ng­êi ch­a thÊy, mau hoµn thµnh <color=yellow>nhiÖm vô T©y b¾c-Hoµng Sa L¹c M¹c<color> h½n ®Õn ®©y.",
		Npc_name_city.."Trong ®éi cã thµnh viªn <color=yellow>vâ c«ng l­u ph¸i gièng nhau<color>, nh­ vËy sÏ mÊt ®i c¬ héi ®èi phã víi <color=yellow>Quû T­íng Qu©n<color>.",
	}
}	--ÎŞ·¨½øÈë¹Ø¿¨µÄÔ­Òò¶Ô»°
Stage_info[3].boss_chat = {
	"Kho b¸u vua ta, ai d¸m ®µo trém?",
	"Ng­êi tham lam v« tri ®Òu ph¶i tiªu tan tr­íc b¶n t­íng lÜnh! ",
	"d¸m quÊy rÇy n¬i ta yªn nghØ, giÕt kh«ng thÓ! ",
	"§Ó ta tiÔn c¸c ng­¬i xuèng ©m tµo ®Şa phñ! ",
	"Ta sÏ trõng ph¹t nh÷ng kÎ d¸m vµo mé! ",
}
Stage_info[3].stage_start_msg ="Nhãm ng­êi ngùa c¸c ng­¬i ®· vµo Hoµng L¨ng MËt §¹o, Quû T­¬ng §Çu sÏ tØnh l¹i trong vßng 1 phót n÷a ®Ó truy s¸t nh÷ng ai x«ng vµo mé, c¸c ng­¬i ph¶i lu«n trong tr¹ng th¸i chiÕn ®Êu! "
Stage_info[3].stage_start_talk = "Sau khi dïng <color=yellow>To¸i th¹ch chÊn<color>, tr­íc khi vµo mËt thÊt, kh«ng nghÜ n¬i ®©y cã c¹m bÉy, TÇn Thñy Hoµng còng cho r»ng víi søc m¹nh cña <color=yellow>Quû T­íng Qu©n<color> ®ñ ®Ó b¶o vÖ l¨ng mé. Tuy mËt thÊt kh«ng ®Æt c¬ quan, nh­ng ®· x©m ph¹m vµo mé TÇn Thñy Hoµng, theo quy t¾c cña kÎ c­íp mé ph¶i ë <color=yellow>gãc ®«ng nam<color> ®èt mét c©y <color=yellow>®Ìn cÇy<color>. Nh­ng víi uy lùc cña <color=yellow>Quû T­íng Qu©n<color> e r»ng lµnh İt d÷ nhiÒu."
Stage_info[3].boss_crt_msg = "Quû T­¬ng §Çu ®· xuÊt hiÖn! Trong vßng 30 phót ph¶i tiªu diÖt ®­îc nã, nÕu kh«ng hµnh ®éng lÇn nµy sÏ thÊt b¹i."
Stage_info[3].stage_end_msg = "LÇn thu phôc Quû T­¬ng §Çu ®· hoµn thµnh. Xin ®îi gi©y l¸t sÏ dÉn c¸c vŞ ra bªn ngoµi mËt ®¹o. "
Stage_info[3].stage_start_time_bar = "Quû T­¬ng §Çu xuÊt hiÖn (®Õm ng­îc)"
Stage_info[3].boss_crt_time_bar = "§¸nh b¹i Quû T­¬ng §Çu ®Õm ng­îc"
Stage_info[3].stage_end_time_bar = "Khu vùc ®­îc dÉn ®Õn, (®Õm ng­îc)"
---------------------------------------------------äìÈ÷µÄ·Ö¸îÏß---------------------------------------
Stage_info[4].main_dialog = {	
	Stage_info[4].npc_name.."Ng­¬i lµ ai? D­îc V­¬ng ®éng lµ l·nh ®Şa cña D­îc V­¬ng chñ nh©n ta, ng­êi l¹ kh«ng ®­îc b­íc vµo. LuyÖn ®¬n ®éng lµ cÊm ®Şa, ai muèn vµo ph¶i b­íc qua x¸c cu¶ ta! ",
	Stage_info[4].npc_name.."Ng­¬i lµ ai? D­îc V­¬ng chñ nh©n ta gäi ta lµ D­îc Nh©n th«ng minh, canh gi÷ LuyÖn ®¬n ®éng! Chñ nh©n ta s¾p luyÖn thµnh ®ao th­¬ng bÊt nhËp, sao ng­¬i cã thÓ ®¸nh l¹i."	
							}
Stage_info[4].no_task_dialog = 	Stage_info[4].npc_name.."Ng­¬i lµ ai? D­îc V­¬ng ®éng lµ l·nh ®Şa cña D­îc V­¬ng chñ nh©n ta, kh«ng ®­îc b­íc vµo, mau quay vÒ, chñ nh©n ta sÏ kh«ng truy cøu. Lóc ra kh«ng ®­îc ®éng vµo bÊt cø th¶o d­îc nµo trong ®éng! "
Stage_info[4].finish_task_dialog = Stage_info[4].npc_name.."Ta nhËn ra ng­¬i råi, ®Õn ®©y lµm g×? Mau cót ®i, ®õng hßng lõa ®­îc ta! "
Stage_info[4].stage_name = "LuyÖn ®¬n ®éng"											--stageÃû³Æ
Stage_info[4].ground_sel_dialog = {
	{Stage_info[4].npc_name.."D­îc V­¬ng ®éng lµ l·nh ®Şa cña D­îc V­¬ng chñ nh©n ta, LuyÖn ®¬n ®éng lµ cÊm ®Şa, mau cót ®i, nÕu kh«ng hËu qu¶ kh«n l­êng. ",Stage_info[4].npc_name.."D­îc V­¬ng ®éng lµ l·nh ®Şa cña D­îc V­¬ng chñ nh©n ta, LuyÖn ®¬n ®éng lµ cÊm ®Şa, chñ nh©n ta ®· trë vÒ råi, kh«ng ®­îc b­íc vµo LuyÖn ®¬n ®éng. Ng­¬i lµ ai? D¸m gi¶ m¹o lµ chñ ta!",},
	{Stage_info[4].npc_name.."LuyÖn ®¬n ®éng vèn lµ cÊm ®Şa, ta lµ D­îc Nh©n th«ng minh, th¹ch m«n nµy ta ®Èy kh«ng lªn, ng­¬i cã giái th× h·y ®Èy cho ta xem!",Stage_info[4].npc_name.."LuyÖn ®¬n ®éng vèn lµ cÊm ®Şa, ta nhËn ra ng­¬i, ®õng hßng vµo trong."},
}
Stage_info[4].log_in_dialog = {"Ta muèn dÉn theo ®ång ®éi vµo LuyÖn ®¬n ®éng. ","Ta muèn dÉn theo ®ång ®éi vµo LuyÖn ®¬n ®éng. "}
Stage_info[4].map = {{1103,1203},{1303,1403,1503}}									--¿ªÆôµÄ5¸ö¹Ø¿¨¶ÔÓ¦µÄmap_id
Stage_info[4].stage_background = {Stage_info[4].npc_name.."D­îc V­¬ng chñ nh©n ta lµ ng­êi rÊt th«ng minh, trong D­îc V­¬ng ®éng cã mu«n vµn kú hoa dŞ th¶o. LuyÖn ®¬n ®éng lµ cÊm ®Şa, bÊt cø ai còng kh«ng ®­îc, ®õng hßng gi¶ m¹o chñ nh©n qua mÆt ta!. ",
									Stage_info[4].npc_name.."Trong D­îc V­¬ng ®éng chÊt ®Çy d­îc liÖu, hoa cá l¹ trång kh¾p n¬i, lµ n¬i thÇn tiªn dµnh tÆng cho D­îc V­¬ng. Kh«ng biÕt ng­êi nµo d¸m hñy mét nöa sè hoa cá trong ®éng, may chñ nh©n lĞn giÊu ®i D­îc Nh©n Th¶o, ®Ó sau nµy dïng ®Õn. Ta phông mÖnh canh gi÷ n¬i ®©y, chØ cã ta míi më ®­îc c¸nh cöa nµy."
									}
Stage_info[4].stage_condition ={ 						--´³¹ØÌõ¼ş
	Stage_info[4].npc_name.."D­îc V­¬ng chñ nh©n ta lµ ng­êi anh minh nhÊt, D­îc V­¬ng ®éng vµ LuyÖn ®¬n ®éng lµ cÊm ®Şa cña ng­êi, ta phông mÖnh trÊn gi÷ ë ®©y, kh«ng dÔ dµng g× bŞ qua mÆt ®©u! Cho nªn <color=yellow>Ng­¬i dÉn 3-5 ng­êi ®Õn lµm lo¹n<color>, D­îc V­¬ng chñ nh©n ta sÏ kh«ng tha! <color=yellow>Kh«ng biÕt th× kh«ng cã téi<color>, mau ®i tr­íc khi ta ®æi ı!",
	Stage_info[4].npc_name.."\n1. §éi tr­ëng dÉn theo <color=yellow>3-5 ng­êi<color>, <color=red>tÊt c¶ thµnh viªn<color> ®Òu ph¶i <color=yellow>hoµn thµnh nhiÖm vô T©y b¾c-Hoµng Sa L¹c M¹c<color>).\n2. §éi tr­ëng mang theo <color=yellow>Tİch D­¬ng Tinh Hoa<color>, <color=yellow>Tİch D­¬ng Tinh Hoa<color> thËt lµ khñng khiÕp...\n3. Trong ®éi kh«ng ®­îc cã <color=yellow>ng­êi vâ c«ng l­u ph¸i gièng nhau<color>."
}
Stage_info[4].task_goods = {						--´³¹ØĞèÒªÎïÆ·
	{
		{2,0,760,1,"Dung m¹o D­îc V­¬ng"}
	},
	{
		{2,0,1034,1,"Tİch D­¬ng Tinh Hoa"}
	}
}
Stage_info[4].task_ID = {2031,47}												--´³¹ØÊ±¶ÔÓ¦µÄID
Stage_info[4].in_coordinate = {1599,3218}										--½øÈë¶ÔÓ¦×ø±ê
Stage_info[4].out_coordinate = {510,1573,2863}									--´«³öµÄµØÍ¼¼°×ø±ê
Stage_info[4].cannot_log_reason = {
	{
		Stage_info[4].npc_name.."D­îc V­¬ng ®éng lµ l·nh ®Şa cña D­îc V­¬ng chñ nh©n ta, LuyÖn ®¬n ®éng lµ cÊm ®Şa, kh«ng ®­îc vµo! <color=yellow>NÕu ng­¬i dÉn 3-5 ng­êi ®Õn lµm lo¹n<color>, D­îc V­¬ng chñ nh©n ta sÏ ®İch th©n ra tay.",
		Stage_info[4].npc_name.."D­îc V­¬ng ®éng lµ l·nh ®Şa cña D­îc V­¬ng chñ nh©n ta, LuyÖn ®¬n ®éng chØ cã chñ nh©n ta míi ®­îc vµo, <color=yellow>Ng­¬i kh«ng ph¶i D­îc V­¬ng<color>, d¸m g¹t ta? <color=yellow>(Nh¾c nhë: cã thÓ gi¶ d¹ng D­îc V­¬ng ®Ó qua)<color>",
		Stage_info[4].npc_name.."LuyÖn ®¬n ®éng vèn lµ cÊm ®Şa, chñ nh©n kh«ng tr¸ch <color=yellow>nh÷ng ai v« t×nh x©m ph¹m<color>, tha cho c¸c ng­¬i kh«ng biÕt ®©y lµ n¬i ë cña D­îc V­¬ng, cßn kh«ng mau rêi khái!",
		Stage_info[4].npc_name.."LuyÖn ®¬n ®éng lµ cÊm ®Şa, c¸c ng­¬i d¸m ®ªn quÊy nhiÔu? <color=yellow>Cã ng­êi cïng vâ c«ng l­u ph¸i<color>, c¸c ng­oi kh«ng ®¸ng ®Ó D­îc V­¬ng chñ nh©n ta ra tay!",
	},
	{
		Stage_info[4].npc_name.."Ta ®­îc chñ nh©n cho canh gi÷ LuyÖn ®¬n ®éng, kh«ng cã <color=yellow>3-5 ng­êi<color> th× ®õng hßng vµo trong. (Nh¾c nhë: ",
		Stage_info[4].npc_name.."H×nh nh­ c¸c ng­¬i kh«ng biÕt uy lùc cña D­îc Nh©n. (Nh¾c nhë: Trªn ng­êi ®éi tr­ëng cÇn ph¶i mang theo <color=yellow>Tİch D­¬ng Tinh Hoa<color>)",
		Stage_info[4].npc_name.."LuyÖn ®¬n ®éng vèn lµ cÊm ®Şa, bän c¸c ng­¬i kh«ng biÕt sao. (Nh¾c nhë: <color=yellow>Thµnh viªn trong ®éi cÇn ph¶i hoµn thµnh nhiÖm vô T©y b¾c-Hoµng Sa L¹c M¹c<color>)",
		Stage_info[4].npc_name.."Trong ®éi c¸c ng­¬i cã ng­êi vâ c«ng l­u ph¸i gièng nhau, ®õng hßng g¹t ta. (Nh¾c nhë: Thµnh viªn trong ®éi <color=yellow>vâ c«ng l­u ph¸i kh«ng ®­îc gièng nhau<color>)",
	},
	{	Npc_name_city.."Ta ®iÒu tra ®­îc <color=green>D­îc V­¬ng<color> míi chÕ ra nhiÒu <color=yellow>D­îc Nh©n<color> dïng ®Ó b¶o vÖ «ng ta, khã cã thÓ tiÕp cËn, nÕu ®éi tr­ëng mêi ®­îc tõ <color=yellow>3-5 ng­êi cÊp 85 trë lªn<color> míi cã hy väng ®¸nh th¾ng.",
		Npc_name_city.."D­îc Nh©n sî nhÊt lµ rÔ c©y cña vïng sa m¹c, tõ rÔ c©y lÊy ra <color=yellow>Tİch D­¬ng Tinh Hoa<color>, chØ cÇn <color=yellow>D­îc Nh©n Th¶o<color> ch¹m ph¶i lµ tiªu tan, nh­ vËy mÊy <color=yellow>D­îc Nh©n<color> sao tr¸nh khái c¸i chÕt, c¸c ng­¬i cã kh«ng?",
		Npc_name_city.."H×nh nh­ c¸c ng­êi ch­a ®i hÕt T©y vùc, ch­a t×m hiÓu kü n¬i ®ã. Kh«ng n¾m râ t×nh h×nh trong ®éng, còng kh«ng biÕt nh­îc ®iÓm cña D­îc Nh©n Th¶o, ngang nhiªn x«ng vµo chØ cã t×m c¸i chÕt, c¸c ng­¬i hoµn thµnh <color=yellow>nhiÖm vô T©y b¾c-Hoµng Sa L¹c M¹c<color> h½n ®Õn ®©y.",
		Npc_name_city.."Trong ®éi c¸c ng­¬i cã ng­êi <color=yellow>vâ c«ng l­u ph¸i gièng nhau<color>, sao cã thÓ ®èi phã víi bän <color=yellow>D­îc Nh©n<color>?",
	},
}		--ÎŞ·¨½øÈë¹Ø¿¨µÄÔ­Òò¶Ô»°
Stage_info[4].boss_chat = {
	"To gan, d¸m ®Õn lµm cµn ë LuyÖn ®¬n ®éng, ta sÏ cho c¸c ng­¬i cã ®i mµ kh«ng cã vÒ!",
	"Khæ ®au, thï hËn, sinh l·o bÖnh tö, thiªn h¹ chóng sinh kh«ng chèng l¹i ®­îc.",
	"§Õn ®©y råi, ta sÏ thay ®æi x¸c thŞt yÕu ®uèi cña c¸c ng­¬i!",
	"§îi ta biÕn c¸c ng­¬i thµnh D­îc Nh©n, sèng dë chÕt dë.",
	"L©u råi kh«ng thÊy nhiÒu ng­êi sèng nh­ thÕ nµy, ta sÏ gi¶i tho¸t cho c¸c ng­¬i!",
}
Stage_info[4].stage_start_msg ="Ng­êi ngùa c¸c ng­¬i ®· vµo LuyÖn ®¬n ®éng, mét phót n÷a D­îc V­¬ng sÏ xuÊt hiÖn ®Ó b¾t c¸c ng­¬i chÕ thµnh d­îc nh©n, "
Stage_info[4].stage_start_talk = "D­îc Nh©n canh gi÷ qu¶ nhiªn hiÖu qu¶. LuyÖn ®¬n ®éng cµng lóc cµng nguy hiÓm, chØ lµ thªm vµi c¸i lß luyÖn ®¬n. Mïi cña than vµ th¶o d­îc trén lÉn, ngöi vµo g©y khã chŞu. Kh«ng biÕt <color=green>D­îc V­¬ng<color> ®· nghiªn cøu ra chiªu g× míi, <color=yellow>D­îc Nh©n Th¶o ®· lîi h¹i, nay D­îc Nh©n cßn lîi h¹i h¬n<color>, <color=green>D­îc V­¬ng<color> còng ch­a võa lßng. Xem ra <color=green>D­îc V­¬ng<color> cßn trång thªm nhiÒu D­îc Nh©n Th¶o."
Stage_info[4].boss_crt_msg = "D­îc V­¬ng cña LuyÖn ®¬n ®éng ®· xuÊt hiÖn! Ph¶i tiªu diÖt ®­îc h¾n trong vßng 30 phót!"
Stage_info[4].stage_end_msg = "Thu phôc D­îc V­¬ng ®· hoµn thµnh. Xin ®îi gi©y l¸t sÏ dÉn c¸c vŞ ®Õn bªn ngoµi LuyÖn ®¬n ®éng."
Stage_info[4].stage_start_time_bar = "D­îc V­¬ng xuÊt hiÖn (®Õm ng­îc)"
Stage_info[4].boss_crt_time_bar = "§¸nh b¹i D­îc V­¬ng ®Õm ng­îc"
Stage_info[4].stage_end_time_bar = "Khu vùc ®­îc dÉn ®Õn, (®Õm ng­îc)"
---------------------------------------------------¿ÉÁ¯µÄ·Ö¸îÏß---------------------------------------
Stage_info[5].main_dialog = {	
	Stage_info[5].npc_name.."Ngò hµnh trËn vèn lµ cæ m¸y trinh s¸t, Ngò Hµnh Sø ®¶m nhËn nhiÖm vô ®Æc biÖt, chuyªn truy s¸t nh÷ng kÎ t¹o ph¶n!",
	Stage_info[5].npc_name.."N¬i ®©y thuéc NhÊt PhÈm §­êng, phİa tr­íc ®· bè trİ Ngò Hµnh TrËn, c¸c ng­¬i cßn kh«ng nhanh chãng rêi khái!"	
}
Stage_info[5].no_task_dialog = 	Stage_info[5].npc_name.."Ngò Hµnh Gi¶, NhËt Kim Méc Thñy Háa Thæ; Ngò hµnh trËn gi¶ lµ trËn Kim Méc Thñy Háa Thæ. ViÖc kh«ng liªn quan m×nh, ®õng xem vµo."
Stage_info[5].finish_task_dialog = Stage_info[5].npc_name.."B¹n ®· v­ît qua Ngò hµnh trËn? Hay l¹i chÊp nhËn luyÖn thøc? Kh«ng thÓ ®­îc, trong thêi gian ng¾n lµm sao luyÖn nhiÒu lÇn? NÕu gióp VÖ Vò ®Ó chÊp nhËn luyÖn thøc th× cã thÓ."
Stage_info[5].stage_name = "Ngò hµnh trËn"												--stageÃû³Æ
Stage_info[5].ground_sel_dialog = {
	{Stage_info[5].npc_name.."Ngò hµnh trËn do nh÷ng ng­êi chøc VÖ Vò trë lªn cung cÊp c¸c lo¹i luyÖn thøc, mçi luyÖn thøc ®Òu lÊy trËn ph¸p m¹nh nhÊt ®Ó ®èi phã, kh«ng ®Ó ı tíi ai! Ng­¬i ph¶i cÈn thËn.",Stage_info[5].npc_name.."Ngò hµnh trËn ®· b¾t ®Çu, trËn ®Şa ®· khai háa. §õng tr¸ch ta kh«ng nh¾c nhë c¸c ng­¬i!"},
	{Stage_info[5].npc_name.."Ngò Hµnh TrËn ®· bµy bè, chŞu chÕt ®i!",Stage_info[5].npc_name.."Ngò Hµnh TrËn ®· bµy bè, nh­ng vÉn cã ng­êi cßn cøng ®Çu h¬n ng­¬i, chŞu chÕt ®i!"},
}
Stage_info[5].log_in_dialog = {"Ta muèn dÉn ®éi x«ng vµo Ngò hµnh trËn","Ta muèn dÉn ®éi x«ng vµo Ngò hµnh trËn",}
Stage_info[5].map = {{1104,1204},{1304,1404,1504}}									--¿ªÆôµÄ5¸ö¹Ø¿¨¶ÔÓ¦µÄmap_id
Stage_info[5].stage_background = {
	Stage_info[5].npc_name.."Ngò Hµnh Sø vèn lµ ®Æc vô cña bæn ®­êng, chuyªn theo dâi nh÷ng ai cã hµnh vi xÊu, Ngò Hµnh TrËn chuyªn truy s¸t nh÷ng kÎ t¹o ph¶n. B×nh th­êng còng cã thÓ dïng lµm n¬i luyÖn binh. NÕu muèn vµo trËn ph¶i mang theo NhÊt PhÈm §­êng LÖnh míi ®­îc.",
	Stage_info[5].npc_name.."Ngò Hµnh Sø vèn lµ ®Æc vô cña bæn ®­êng, Ngò Hµnh TrËn chuyªn truy s¸t ph¶n ®å. Dï cã ch¹y ®Õn ch©n trêi gãc bÓ còng khã tho¸t khái sù truy s¸t. C¸c h¹ qu¶ nhiªn ch¸n sèng, d¸m ngang nhiªn x©m ph¹m."
}
Stage_info[5].stage_condition ={					--´³¹ØÌõ¼ş
	Stage_info[5].npc_name.."Ngò Hµnh TrËn vèn lµ cæ m¸y trinh s¸t, Ngò Hµnh Sø ®¶m nhËn tr¸ch nhiÖm ®Æc vô, ai còng vâ nghÖ cao c­êng. Muèn thö vµo trËn, chøc vŞ İt nhÊt ph¶i b»ng Vò VÖ, <color=yellow>cã NhÊt PhÈm §­êng lÖnh<color>. Cßn kh«ng <color=yellow>triÖu tËp søc m¹nh 3-5 ng­êi<color> míi cã thÓ vµo trong. NÕu trong nhãm cã ng­êi <color=yellow>kh«ng biÕt Ngò Hµnh TrËn, vâ c«ng l­u ph¸i gièng nhau th× xin mêi vÒ!<color>",
	Stage_info[5].npc_name.."N¬i ®©y thuéc NhÊt PhÈm §­êng, muèn gÆp Ngò Hµnh Sø, cÇn ph¶i: \n1. §éi tr­ëng dÉn theo <color=yellow>3-5 ng­êi<color>, vµ <color=red>tÊt c¶ thµnh viªn<color> ®Òu ph¶i hoµn thµnh <color=yellow>nhiÖm vô T©y b¾c-Hoµng Sa L¹c M¹c<color>).\n2. §éi tr­ëng mang theo <color=yellow>Ngò Hµnh Kú Phiªn<color>, nÕu kh«ng Ngò Hµnh Sø kh«ng chŞu tiÕp kiÕn.\n3. Trong ®éi <color=yellow>kh«ng ®­îc cã ng­êi vâ c«ng l­u ph¸i gièng nhau<color>."
}
Stage_info[5].task_goods = {						--´³¹ØĞèÒªÎïÆ·
	{
		{2,0,755,1,"NhÊt PhÈm Th¸c B¹t LÖnh"}
	},
	{
		{2,0,1035,1,"Ngò Hµnh Kú Phiªn"}
	}
}
Stage_info[5].task_ID = {2031,58}												--´³¹ØÊ±¶ÔÓ¦µÄID
Stage_info[5].in_coordinate = {1603,3228}										--½øÈë¶ÔÓ¦×ø±ê
Stage_info[5].out_coordinate = {506,1318,2720}									--´«³öµÄµØÍ¼¼°×ø±ê
Stage_info[5].cannot_log_reason = {			--ÎŞ·¨½øÈë¹Ø¿¨µÄÔ­Òò¶Ô»°
	{	
		Stage_info[5].npc_name.."Víi søc cña ng­¬i Ngò Hµnh TrËn Sø kh«ng cho thİ luyÖn ®©u. <color=yellow>CÇn dÉn theo 3-5 ng­êi<color> míi cã thÓ ®èi phã víi Ngò Hµnh Sø.",
		Stage_info[5].npc_name.."NÕu muèn vµo trËn tu luyÖn, cÊp trªn sÏ cho b¹n <color=yellow>NhÊt PhÈm §­êng LÖnh<color>, dïng ®Ó vµo trong trËn.",
		Stage_info[5].npc_name.."C¸c ng­¬i <color=yellow>ch­a thÊu hiÓu Ngò Hµnh TrËn<color>, kh«ng nªn tïy tiÖn x«ng vµo, tr¸nh mang häa vµo th©n.",
		Stage_info[5].npc_name.."Ng­êi muèn thö Ngò hµnh trËn <color=yellow>kh«ng ®­îc cã ng­êi trïng vâ c«ng l­u ph¸i<color>, nÕu kh«ng Ngò Hµnh Sø sÏ kh«ng cho vµo!",
	},
	{
		Stage_info[5].npc_name.."Kh«ng nªn xem th­êng Ngò Hµnh TrËn, nÕu c¸c h¹ ®· cã Ngò Hµnh Kú Phiªn, th× h·y dÉn theo <color=yellow>3-5 ng­êi<color> (Nh¾c nhë: ",
		Stage_info[5].npc_name.."NÕu muèn hy sinh còng kh«ng nªn chän lóc nµy! (Nh¾c nhë: Trªn ng­êi ®éi tr­ëng ph¶i cã <color=yellow>Ngò Hµnh Kú Phiªn<color>)",
		Stage_info[5].npc_name.."H×nh nh­ ng­¬i ch­a nghe danh Ngò Hµnh TrËn, mau vÒ ®i! (Nh¾c nhë: <color=yellow>Thµnh viªn trong ®éi cÇn ph¶i hoµn thµnh nhiÖm vô T©y b¾c-Hoµng Sa L¹c M¹c<color>)",
		Stage_info[5].npc_name.."H×nh nh­ c¸c ng­¬i cã ng­êi vâ c«ng l­u ph¸i gièng nhau. (Nh¾c nhë: Thµnh viªn trong ®éi <color=yellow>vâ c«ng l­u ph¸i kh«ng ®­îc gièng nhau<color>)",
	},
	{	Npc_name_city.."<color=green>Ngò Hµnh Sø<color> lîi dông ®¹o lı sinh kh¾c cña Ngò Hµnh TrËn biÕn hãa, nÕu kh«ng chíp thêi c¬ hµnh ®éng ngay th× khã c«ng ph¸, v× vËy ®éi tr­ëng ph¶i mêi ®ñ <color=yellow>3-5 ng­êi cÊp 85 trë lªn<color> hîp søc míi cã hy väng.",
		Npc_name_city.."<color=yellow>Ngò Hµnh TrËn<color> ®­îc NhÊt PhÈm §­êng dïng lµm n¬i huÊn luyÖn s¸t thñ, kh«ng thÓ tïy tiÖn vµo trong, cÇn ph¶i mang theo <color=yellow>Ngò Hµnh Kú Phiªn<color>.",
		Npc_name_city.."H×nh nh­ c¸c ng­êi ch­a ®i hÕt T©y vùc, ch­a t×m hiÓu kü n¬i ®ã. E r»ng c¸c ng­¬i ch­a biÕt c¸ch ph¸ Ngò Hµnh TrËn, hy sinh v« İch lµm chi, mau hoµn thµnh <color=yellow>nhiÖm vô T©y b¾c-Hoµng Sa L¹c M¹c<color> h½n ®Õn ®©y.",
		Npc_name_city.."<color=yellow>Ngò Hµnh TrËn<color> nãi lªn søc m¹nh tËp thÓ, c¸c ng­¬i cã ng­êi vâ c«ng <color=yellow>l­u ph¸i gièng nhau<color>, kh«ng thÓ vµo trong.",
	},
}
Stage_info[5].boss_chat = {
	"C¸c ng­¬i muèn chŞu chÕt thay h¾n?",
	"Cho ng­¬i biÕt thÕ nµo lµ trËn ph¸p m¹nh nhÊt!",
	"HËu qu¶ xem th­êng Ngò Hµnh TrËn",
	"Nçi sî h·i ®ang bao trïm lªn c¸c ng­¬i!!",
	"ChŞu chÕt thay cho Th¸c B¹t Ho»ng, còng chØ lµ lao vµo chç chÕt mµ th«i!",
}
Stage_info[5].stage_start_msg ="Ng­êi ngùa c¸c ng­¬i ®· vµo Ngò hµnh trËn, Ngò VŞ TrËn Sø sÏ xuÊt hiÖn mét phót n÷a, c¸c ng­¬i ph¶i chuÈn bŞ tinh thÇn ®Ó ph¸ trËn! "
Stage_info[5].stage_start_talk = "<color=yellow>Ngò Hµnh TrËn<color> dùa theo t­¬ng sinh t­¬ng kh¾c cña ngò hµnh. Mçi mét <color=green>Ngò Hµnh Sø<color> ®Òu cã thÓ m­în sù t­¬ng sinh t­¬ng kh¾c ®ã ph¸t huy mét søc m¹nh thÇn bİ, nÕu phèi hîp thªm Ngò Hµnh TrËn th× søc m¹nh kinh ng­êi. Muèn ph¸ Ngò Hµnh Sø, Ngò Hµnh TrËn lµ mÊu chèt. Ngò hµnh kh«ng chØ theo t­¬ng sinh t­¬ng kh¾c, <color=green>Ngò Hµnh Sø<color> cßn phèi hîp ph­¬ng vŞ bªn trong cña Ngò Hµnh TrËn, nÕu n¾m ®­îc sù biÕn ®æi th× may ra cã c¬ héi sèng sãt. Ghi nhí\n<color=red>Sinh<color>: <color=yellow>Kim sinh Thñy, Thñy sinh Méc, Méc sinh Háa, Háa sinh Thæ, Thæ sinh Kim<color>\n<color=red>Kh¾c<color>: <color=yellow>Kim kh¾c Méc, Méc kh¾c Thæ, Thæ kh¾c Thñy, Thñy kh¾c Háa, Háa kh¾c Kim<color>"
Stage_info[5].boss_crt_msg = "Ngò hµnh trËn sø ®· xuÊt hiÖn vµ bè trËn Ngò Hµnh! Trong vßng 30 phót ph¶i tiªu diÖt h¾n, nÕu kh«ng sÏ thÊt b¹i! "
Stage_info[5].stage_end_msg = "V­ît trËn ®· hoµn thµnh. Xin ®îi gi©y l¸t sÏ dÉn c¸c vŞ ®Õn bªn ngoµi Ngò hµnh trËn"
Stage_info[5].stage_start_time_bar = "Ngò Hµnh Sø xuÊt hiÖn (®Õm ng­îc)"
Stage_info[5].boss_crt_time_bar = "§¸nh b¹i Ngò Hµnh Sø ®Õm ng­îc"
Stage_info[5].stage_end_time_bar = "Khu vùc ®­îc dÉn ®Õn, (®Õm ng­îc)"
---~~~~~~~~~~~~~~~~~~~~~Åó¿ËµÄ·Ö¸îÏß~~~~~~~~~~~~~~~~~~~~~~~
Stage_info[6].main_dialog = {
	Stage_info[6].npc_name.."Cuèi Sa m¹c khã ph©n biÖt ®­îc ngµy hay ®ªm, nguy hiÓm tø bÒ, cã Hoan T­îng mª hoÆc lßng ng­êi. Ng­¬i muèn ®Õn Cuèi Sa m¹c, cßn ta kh«ng muèn. Nh­ng nÕu c¸c ng­¬i cã b¶o vËt tÆng, ta sÏ nghØ l¹i.",
	Stage_info[6].npc_name.."GÇn ®©y sa m¹c næi phong ba b·o t¸p, kh«ng thÓ vµo trong. C¸c h¹ muèn ®Õn ®ã ­? Nh­ng b·o c¸t ®· thæi mÊt ph­¬ng h­íng, ta còng kh«ng thÓ ®Õn ®ã."	
	}
Stage_info[6].no_task_dialog = 	Stage_info[6].npc_name.."Sa m¹c réng lín, nguy hiÓm trïng trïng, cã Hoan T­îng mª hoÆc lßng ng­êi. C¸c ng­¬i ®i ®i, ®õng ®Õn quÊy nhiÔu."
Stage_info[6].finish_task_dialog = Stage_info[6].npc_name..": Sù hoang v¾ng cña Cuèi Sa m¹c ng­¬i còng hiÓu, sù ®¸ng sî cña ¶o ¶nh Sa M¹c, ng­¬i còng l·nh gi¸o qua, kh«ng cã b¶o tµng , l¹i cã kÎ ®Şch m¹nh, ®Õn lµm g×? Ta kh«ng thÓ dÉn ng­¬i ®i ®­îc."
Stage_info[6].stage_name = "Cuèi Sa m¹c"												--stageÃû³Æ
Stage_info[6].ground_sel_dialog = {
	{Stage_info[6].npc_name.."NÕu ta dÉn ng­¬i ®Õn Cuèi Sa m¹c, ph¶i tÆng ta b¶o vËt cã gi¸ t­¬ng ®­¬ng nÕu kh«ng miÔn bµn. Ng­¬i cã b¶o vËt kh«ng?",Stage_info[6].npc_name.."Ta còng muèn dÉn ng­¬i ®Õn Cuèi Sa m¹c, nh­ng mäi ng· ®­êng ®Òu ®· bŞ giã sa m¹c lÊp kİn. Chi b»ng ®Ó b¶o vËt ë chç ta, ®õng ®Õn ®ã n÷a, kh«ng ph¶i hay h¬n sao?"},
	{Stage_info[6].npc_name.."B·o c¸t ®· thæi mÊt ph­¬ng h­íng, khuyªn ng­¬i kh«ng nªn ®Õn ®ã.",Stage_info[6].npc_name.."B·o c¸t cã quan hÖ g× víi tËn cïng sa m¹c? NhÊt ®Şnh ph¶i ®Õn ®ã sao? Ta ch­a muèn chÕt ®©u."},
}
Stage_info[6].log_in_dialog = {"Ta muèn dÉn ®éi vµo Cuèi Sa m¹c","Ta muèn dÉn ®éi vµo Cuèi Sa m¹c",}
Stage_info[6].map = {{1105,1205},{1305,1405,1505}}									--¿ªÆôµÄ5¸ö¹Ø¿¨¶ÔÓ¦µÄmap_id
Stage_info[6].stage_background = {Stage_info[6].npc_name.."Phông T­êng , sa m¹c réng lín v« h¹n, kh«ng biÕt vïi lÊp bao nhiªu di tİch cæ quèc. NhiÒu ng­êi vÉn ®Õn t×m kho b¸u mÆc dï n¬i ®©y nguy hiÓm bèn bÒ, cßn cã ¶o ¶nh sa m¹c, nguy c¬ bŞ giã m¹c ch«n vïi.",
									Stage_info[6].npc_name.."Th× ra c¸c h¹ cã la bµn, nhê ng­êi ®Õn ®ã ng¨n chÆn b·o c¸t"
								}
Stage_info[6].stage_condition ={ 						--´³¹ØÌõ¼ş
	Stage_info[6].npc_name.."T­¬ng truyÒn Cuèi Sa m¹c cã rÊt nhiÒu b¶o tµng bŞ vïi lÊp, nh­ng l¹i cã ¶o ¶nh Sa M¹c Èn hiÖn ®©u ®ã, mª hoÆc lßng ng­êi. CÇn ta dÉn ®i , ph¶i cã<color=yellow>b¶o vËt gi¸ trŞ t­¬ng ®­¬ng<color> tÆng phe ta . ph¶i cã <color=yellow>3 ®Õn 5 ng­êi<color> lµm b¹n ®ång hµnh, <color=yellow>kh«ng cã ng­êi kh«ng biÕt ¶o ¶nh Sa M¹c<color> vµ <color=yellow>kh«ng cã ai gièng nhau vÒ vâ c«ng l­u ph¸i<color>, c¸c ng­¬i ®ñ ®iÒu kiÖn thİch hîp?",
	Stage_info[6].npc_name.."1. §éi tr­ëng dÉn theo <color=yellow>3-5 ng­êi<color>, vµ nhãm ng­êi nµy ph¶i tõng ®i qua tËn cïng sa m¹c. (<color=yellow>Hoµn thµnh nhiÖm vô T©y b¾c-Hoµng Sa L¹c M¹c<color>).\n2. §éi tr­ëng mang theo <color=yellow>la bµn<color> nÕu kh«ng khã cã thÓ ph©n biÖt h­íng ®i.\n3. Trong ®éi <color=yellow>kh«ng ®­îc cã ng­êi vâ c«ng l­u ph¸i gièng nhau<color>."
}
Stage_info[6].task_goods = {
	{
		{2,0,733,1,"Hoan T­îng Ph¸p Khİ"},
		{2,0,732,1,"Th¸p Phong Yªu"}
	},
	{
		{2,0,1036,1,"La bµn"},
	}
}	--´³¹ØĞèÒªÎïÆ·
Stage_info[6].task_ID = {2031,64}												--´³¹ØÊ±¶ÔÓ¦µÄID
Stage_info[6].in_coordinate = {1578,3242}										--½øÈë¶ÔÓ¦×ø±ê
Stage_info[6].out_coordinate = {506,1552,2667}									--´«³öµÄµØÍ¼¼°×ø±ê
Stage_info[6].cannot_log_reason = {			--ÎŞ·¨½øÈë¹Ø¿¨µÄÔ­Òò¶Ô»°
	{	
		Stage_info[6].npc_name.."TËn cïng sa m¹c rÊt khã ph©n biÖt ph­¬ng h­íng, dÔ g©y ra ¶o gi¸c, cã ®i kh«ng vÒ, c¸c ng­¬i triÖu tËp tõ <color=yellow>3-5 ng­êi<color> h½n ®İ ®Õn ®ã.",
		Stage_info[6].npc_name.."Ng­¬i kh«ng cã g× <color=yellow>cho ta<color>, ta còng kh«ng muèn ®Õn c¸i n¬i qu¸i quû ®ã, tèt h¬n kh«ng nªn ®i!",
		Stage_info[6].npc_name.."<color=yellow>H×nh nh­ c¸c ng­¬i ch­a biÕt ¶o gi¸c sa m¹c lµ g×<color>, nÕu ngang nhiªn ®Õn ®ã, chØ sî nguy hiÓm ®Õn tİnh m¹ng, tèt h¬n kh«ng nªn ®İ!",
		Stage_info[6].npc_name.."Cuèi Sa m¹c c¸ch biÖt víi thÕ giíi bªn ngoµi, nguy hiÓm ®Çy rÉy, l¹i bŞ ®e däa bëi ¶o ¶nh Sa M¹c. <color=yellow>C¸c ng­¬i ph¶i tinh th«ng vâ c«ng c¸c l­u ph¸i<color> hîp lùc cïng nhau, cã ng­êi vâ c«ng l­u ph¸i gièng nhau, lµm sao lËp thµnh hµng ngò?",
	},
	{	
		Stage_info[6].npc_name.."B·o c¸t ®· lµm mÊt h­íng, rÊt khã ®Õn tËn cïng sa m¹c, tèt nhÊt <color=yellow>triÖu tËp 3-5 ng­êi<color>. (Nh¾c nhë: ",
		Stage_info[6].npc_name.."B·o c¸t ®· lµm mÊt h­íng, nÕu cã <color=yellow>la bµn<color> th× hay biÕt mÊy.",
		Stage_info[6].npc_name.."H×nh nh­ c¸c ng­¬i kh«ng biÕt sù nguy hiÓm cña b·o c¸t, mau quay vÒ ®i! (Nh¾c nhë: <color=yellow>Thµnh viªn trong ®éi cÇn ph¶i hoµn thµnh nhiÖm vô T©y b¾c-Hoµng Sa L¹c M¹c<color>)",
		Stage_info[6].npc_name.."TËn cïng sa m¹c c¸ch biÖt víi thÕ giíi bªn ngoµi, bèn bÒ hiÓm nguy, ph¶i cã <color=yellow>ng­êi vâ c«ng l­u ph¸i kh¸c nhau<color> ®ång t©m hîp søc míi cã hy väng.",
	},
	{	Npc_name_city.."TËn cïng sa m¹c ngoµi b·o c¸t ra, <color=yellow>¶o gi¸c sa m¹c<color> lµ thø ®¸ng sî nhÊt, nã biÕn ®æi 5 lo¹i h×nh d¹ng. §éi tr­ëng cÇn triÖu tËp<color=yellow>3-5 ng­êi cÊp 85 trë lªn<color> míi cã hy väng.",
		Npc_name_city.."Con ®­êng ®Õn tËn cïng sa m¹c ®· bŞ b·o c¸t c¶n trë, lµm mÊt ph­¬ng h­íng, ph¶i cã <color=yellow>la bµn<color> míi cã thÓ miÔn c­ìng vµo trong.",
		Npc_name_city.."H×nh nh­ c¸c ng­êi ch­a ®i hÕt T©y vùc, ch­a t×m hiÓu kü n¬i ®ã. Ch­a biÕt c¸ch ®èi phã víi <color=yellow>¶o gi¸c sa m¹c<color>, hoµn thµnh <color=yellow>nhiÖm vô T©y b¾c-Hoµng Sa L¹c M¹c<color> h½n quay l¹i.",
		Npc_name_city.."Trong sè c¸c ng­¬i cã vâ c«ng l­u ph¸i gièng nhau, ph¸ hñy <color=yellow>¶o gi¸c sa m¹c<color> sÏ rÊt khã kh¨n.",
	},
}
Stage_info[6].boss_chat = {
	"chiÕm ®o¹t tÊt c¶ …",
	"chiÕm ®o¹t c¶ thÕ giíi …",
	"Hoan t­îng ta ®©y lµ nçi khiÕp sî cña c¸c ng­¬i!",
	"kh«ng cã trêi cao ®Êt dµy, hçn ®én ®Òu lµ … ",
	"hång hoang … v« khëi … v« diÖt!",
}
Stage_info[6].stage_start_msg ="C¸c ng­¬i ®Õn Cuèi Sa m¹c, ¶o ¶nh Sa M¹c sÏ xuÊt hiÖn trong mét phót n÷a, c¸c ng­¬i ph¶i lu«n trong tr¹ng th¸i chiÕn ®Êu!"
Stage_info[6].stage_start_talk = "<color=yellow>La bµn<color> ë tËn cïng sa m¹c mÊt ®i ®Şnh h­íng. C©y cá xung quanh kh« c»n, nh÷ng bé x­¬ng kh« lÊp lã Èn hiÖn trªn c¸t. B·o c¸t vµ ¶o gi¸c sa m¹c ®· lµm lung lay ı trİ cña nh÷ng ai muèn <color=yellow>t×m kho b¸u<color>, phİa sau b·o c¸t cã thø cã thÓ <color=yellow>ph¸ ¶o gi¸c<color>?"
Stage_info[6].boss_crt_msg = "¶o ¶nh Èn nóp ë Cuèi Sa m¹c ®· xuÊt hiÖn! Ph¶i lµm cho ¶o ¶nh hiÖn nguyªn h×nh trong vßng 30 phót ®Ó tiªu diÖt nguyªn h×nh (con trai) ®ã."
Stage_info[6].stage_end_msg = "V­ît trËn ®· hoµn thµnh. Xin ®îi gi©y l¸t sÏ dÉn c¸c vŞ ®Õn bªn ngoµi Ngò hµnh trËn"
Stage_info[6].stage_start_time_bar = "Hoan T­îng xuÊt hiÖn (®Õm ng­îc)"
Stage_info[6].boss_crt_time_bar = "§¸nh b¹i Hoan T­îng ®Õm ng­îc"
Stage_info[6].stage_end_time_bar = "Khu vùc ®­îc dÉn ®Õn, (®Õm ng­îc)"
--³ÇÊĞ¹Ø¿¨´«ËÍÈË¶Ô»°--
Stage_info.city_mis_dia_main = {
	Npc_name_city.."Ng­êi T©y vùc còng İt lui tíi, ë ®©y cã nhiÒu chç rÊt nguy hiÓm, ta tõng dß hái ®­îc biÕt trong <color=yellow>Cæ D­¬ng §éng<color> cã con <color=yellow>Cæ D­¬ng Thó<color> hung b¹o bªn trong, c¸c ng­¬i cßn muèn ®Õn ®ã sao?",
	Npc_name_city.."<color=yellow>TÇn L¨ng<color> lµ n¬i ch«n cÊt <color=green>TÇn Thñy Hoµng<color>, c¬ quan bªn trong ®· ch«n vïi kh«ng İt nh÷ng tay c­íp mé, ta ®· quan s¸t thÊy bªn trong mé cã <color=yellow>TrÊn Mé Linh Thó<color> rÊt khã ®èi phã, c¸c ng­¬i cßn muèn vµo ­?",
	Npc_name_city.."<color=yellow>Hoµng L¨ng mËt thÊt<color> kh«ng cßn c¬ qu¶n b¶o vÖ, do cã <color=yellow>Quû T­íng Qu©n<color> canh gi÷ bªn trong, <color=yellow>Quû T­íng Qu©n<color> lóc cßn sèng ®· cïng TÇn Thñy Hoµng nam chinh b¾c ph¹t, ra ®ßn hiÓm ¸c, c¸c ng­¬i cßn muèn ®Õn ®ã ­?",
	Npc_name_city.."<color=yellow>D­îc V­¬ng<color> lµ mét nh©n vËt nguy hiÓm, cã ©m m­u ®iÒu khiÓn <color=yellow>D­îc Nh©n<color> nh­ c­¬ng thi dïng ®Ó tÊn c«ng ®¹i Tèng, may ®éc kÕ ch­a thµnh, nh­ng LuyÖn ®¬n ®éng xuÊt hiÖn rÊt nhiÒu <color=yellow>D­îc Nh©n Th¶o<color>, kh«ng biÕt D­îc V­¬ng ®ang gië trß g×, c¸c ng­¬i nªn cÈn thËn!",
	Npc_name_city.."<color=yellow>Ngò Hµnh TrËn<color> kú bİ khã ®o¸n, kh«ng ngê T©y h¹ l¹i cã cao nh©n am hiÓu ngò hµnh, cßn cã thÓ dïng chóng huÊn luyÖn ra Ngò Hµnh Sø, nÕu muèn vµo <color=yellow>Ngò Hµnh TrËn<color> c¸c ng­êi nªn cÈn thËn.",
	Npc_name_city.."T©y vùc n¬i ng­êi ta khiÕp sî ph¶i kÓ ®Õn sa m¹c hoang vu, ë ®ã ®Çy rÉy hiÓm nguy, kÕ ®Õn lµ b·o c¸t ë tËn cïng sa m¹c khiÕn ai nghe ®Õn còng ph¶i khiÕp sî, nã ch«n vïi kh«ng İt kÎ t×m kiÕm <color=yellow>kho b¸u<color>, c¸c ng­¬i cßn muèn ®Õn ®ã ­?",
}
Stage_info.stage_condition_main_dialog = {
	"§Õn <color=yellow>Cæ D­¬ng §éng<color> c¸c vŞ cÇn héi ®ñ ®iÒu kiÖn sau:",
	"Vµo <color=yellow>Hoµng L¨ng mËt ®¹o<color> c¸c vŞ cÇn héi ®ñ ®iÒu kiÖn sau:",
	"Vµo <color=yellow>Hoµng L¨ng mËt thÊt<color> c¸c vŞ cÇn héi ®ñ ®iÒu kiÖn sau:",
	"Vµo <color=yellow>LuyÖn ®¬n ®éng<color>, c¸c vŞ cÇn héi ®ñ ®iÒu kiÖn sau:",
	"Khiªu chiÕn <color=yellow>Ngò Hµnh TrËn<color>, c¸c vŞ cÇn héi ®ñ ®iÒu kiÖn sau:",
	"Muèn ®¸nh tan <color=yellow>¶o gi¸c sa m¹c<color>, c¸c vŞ cÇn héi ®ñ ®iÒu kiÖn sau:",
}
Stage_info.stage_login_clew = {
	"Mét sè tia s¸ng cña kho¸ng th¹ch ph¸t ra, khiÕn <color=yellow>Cæ D­¬ng §éng<color> ¸nh lªn mµu ®á nh­ m¸u. Xung quanh hoang tµn ®æ n¸t, x¸c ng­êi chÊt ®èng, bÊt luËn Ng­êi ®µo kho¸ng thÇn bİ hay <color=yellow>Li Long Háa Hå<color> bªn ngoµi ®Òu thÊy ®­îc vÕt tİch ®ã. Bän ng­êi t×m b¶o vËt muèn x«ng vµo trong ®éng nh­ng hä kh«ng ngê r»ng <color=yellow>Cæ D­¬ng Thó<color> bŞ háa luyÖn kim ®¬n dµy vß, trë nªn hung ¸c, <color=yellow>Cæ D­¬ng Thó<color> nhËp vµo nh÷ng ai x©m ph¹m. Cµng nhiÒu sinh vËt trong ®éng cµng thu hót nhiÒu <color=yellow>HuyÕt Ma Nh©n<color>. C¸c ng­¬i ph¶i cÈn thËn!",
	"<color=yellow>Håi Long S¸ch<color> qu¶ nhiªn lµ lîi h¹i, cã thÓ më mËt ®¹o tÇng trªn tÇng d­íi, <color=yellow>TrÊn Mé Thó<color> lÉn Hoµng L¨ng cßn nhiÒu ®iÒu huyÒn bİ. Xem ra <color=yellow>TrÊn Mé Thó<color> canh gi÷ l¨ng mé träng ®Şa, víi tİnh c¸ch cña <color=green>TÇn Thñy Hoµng<color> sao kh«ng l¾p ®Æt c¬ quan!? TrÊn Mé Thó vµ c¬ quan trong mé nhÊt ®Şnh cã liªn quan víi nhau. T©y vùc ®óng lµ n¬i huyÒn bİ.",
	"<color=yellow>To¸i th¹ch chÊn<color> tr­íc khi dïng ®Ó vµo mËt thÊt, kh«ng nghÜ n¬i ®©y cã c¹m bÉy, <color=green>TÇn Thñy Hoµng<color> còng cho r»ng víi søc m¹nh cña <color=yellow>Quû T­íng Qu©n<color> ®ñ ®Ó b¶o vÖ l¨ng mé. Tuy mËt thÊt kh«ng ®Æt c¬ quan, nh­ng ®· x©m ph¹m vµo mé TÇn Thñy Hoµng, theo quy t¾c cña kÎ c­íp mé ph¶i ë gãc ®«ng nam ®èt mét c©y ®Ìn cÇy. Nh­ng víi uy lùc cña <color=yellow>Quû T­íng Qu©n<color> e r»ng lµnh İt d÷ nhiÒu.",
	"<color=yellow>D­îc Nh©n<color> canh gi÷ qu¶ nhiªn hiÖu qu¶. <color=yellow>LuyÖn ®¬n ®éng<color> cµng lóc cµng nguy hiÓm, chØ lµ thªm vµi c¸i lß luyÖn ®¬n. Mïi cña than vµ th¶o d­îc trén lÉn, ngöi vµo g©y khã chŞu. Kh«ng biÕt <color=green>D­îc V­¬ng<color> ®· nghiªn cøu ra chiªu g× míi, D­îc Nh©n Th¶o ®· lîi h¹i, nay D­îc Nh©n cßn lîi h¹i h¬n, D­îc V­¬ng còng ch­a hµi lßng. Xem ra <color=green>D­îc V­¬ng<color> cßn trång thªm nhiÒu D­îc Nh©n Th¶o.",
	"<color=yellow>Ngò Hµnh TrËn<color> dùa theo t­¬ng sinh t­¬ng kh¾c cña ngò hµnh. Mçi mét <color=yellow>Ngò Hµnh Sø<color> ®Òu cã thÓ m­în sù t­¬ng sinh t­¬ng kh¾c ®ã ph¸t huy mét søc m¹nh thÇn bİ, nÕu phèi hîp thªm Ngò Hµnh TrËn th× søc m¹nh kinh ng­êi. Muèn ph¸ Ngò Hµnh Sø, Ngò Hµnh TrËn lµ mÊu chèt. Ngò hµnh kh«ng chØ theo t­¬ng sinh t­¬ng kh¾c, Ngò Hµnh Sø cßn phèi hîp ph­¬ng vŞ bªn trong cña Ngò Hµnh TrËn, nÕu n¾m ®­îc sù biÕn ®æi th× may ra cã c¬ héi sèng sãt. Ghi nhí\n<color=yellow>Ngò hµnh t­¬ng sinh: Kim sinh Thñy, Thñy sinh Méc, Méc sinh Háa, Háa sinh Thæ, Thæ sinh Kim.\nNgò hµnh t­¬ng kh¾c: Kim kh¾c Méc, Méc kh¾c Thæ, Thæ kh¾c Thñy, Thñy kh¾c Háa, Háa kh¾c Kim<color>",
	"<color=yellow>La bµn<color> chØ ®­êng ë tËn cïng sa m¹c nh­ng ®Õn tËn cïng sa m¹c sÏ mÊt ®i ph­¬ng h­íng. C©y cá xung quanh kh« c»n, nh÷ng bé x­¬ng kh« lÊp lã Èn hiÖn trªn c¸t. B·o c¸t vµ ¶o gi¸c sa m¹c ®· lµm lung lay ı trİ cña nh÷ng kÎ <color=yellow>t×m kho b¸u<color>.",
}
---------------------------------------------------±»ÑË¸îÁËµÄ·Ö¸îÏß----------------
--ÁÙÊ±´¦Àí
--ÆÕÍ¨¹Ø¿¨bossĞÅÏ¢
Tb_normal_boss_info = {
	{
		{"Cæ D­¬ng Thó","Cæ D­¬ng Thó",1618,3207,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"}
	},
	{
		{"TrÊn Mé Thó","TrÊn Mé Thó",1618,3207,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"}
	},
	{
		{"T©y B¾c Quû T­¬ng §Çu","Quû T­íng Qu©n",1612,3210,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"}
	},
	{
		{"D­îc V­¬ng","D­îc V­¬ng",1600,3168,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"}
	},
	{
		{"Ngò Hµnh Sø Kim","Ngò Hµnh Kim Sø",1613,3205,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"},
		{"Ngò Hµnh Sø Thñy","Ngò Hµnh Thñy Sø",1602,3258,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"},
		{"Ngò Hµnh Sø Méc","Ngò Hµnh Méc Sø",1625,3231,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"},
		{"Ngò Hµnh Sø Háa","Ngò Hµnh Háa Sø",1577,3230,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"},
		{"Ngò Hµnh Sø Thæ","Ngò Hµnh Thæ Sø",1592,3203,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"},
	},
	{
		{"Hoan T­îng (T­íng lÜnh t­îng)","Thèng lÜnh t­îng binhHoanT­îng ",1614,3217,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"}
	},
}
--¸´ÔÓ¹Ø¿¨bossĞÅÏ¢
	Tb_Monster_info = {}
	Tb_Monster_info[1] = {
		{"Cæ D­¬ng Thó ¶i 1","Cæ D­¬ng Thó (háa luyÖn)",1599,3195,5},
		{"Cæ D­¬ng Thó ¶i 2","Cæ D­¬ng Thó (nhËp)",1599,3195,5},
		{"¶i ¢m NhËt Sø","¢m NhËt Sø ",1599,3195,350},
		{"¶i Minh NhËt Sø ","Minh NhËt Sø",1599,3195,350},
		{"¶i HuyÕt Ma Nh©n","HuyÕt Ma Nh©n",1599,3195,350},
		{"¶i LiÖt Nhan Li Long ","LiÖt Nhan Li Long",1599,3195,350},
		{"¶i Xİch LuyÖn Háa Hå","Xİch LuyÖn Háa Hå",1599,3195,350},
	}
	Tb_Monster_info[2] = {
		{"TrÊn Mé Trô","",1629,3224,},
		{"TrÊn Mé Trô","",1601,3193,},
		{"TrÊn Mé Trô","",1574,3222,},
		{"TrÊn Mé Trô","",1603,3253,},
		{"¶i TrÊn Mé Thó","TrÊn Mé Thó",1618,3207,},
	}
	Tb_Monster_info[3] = {
		{"Mang nÕn vµ ngän ®uèc (trung)","Ngän ®uèc §«ng B¾c",1638,3224,"","Kh«ng cã nÕn vµ ngän ®uèc","§«ng B¾c TrÊn mé T­íng qu©n","§«ng B¾c TrÊn mé T­íng qu©n",{10,60,100},"Quû tïy tïng","Quû tïy tïng",{{1627,1637},{3214,3234}}},
		{"Mang nÕn vµ ngän ®uèc (®¹i)","Ngäc ®uèc §«ng Nam",1601,3265,"","Kh«ng cã nÕn vµ ngän ®uèc","§«ng Nam TrÊn mé T­íng qu©n","§«ng Nam TrÊn mé T­íng qu©n",{0,20,100},"Quû Kh«i Lçi","Quû Kh«i Lçi",{{1594,1604},{3251,3261}}},
		{"Mang nÕn vµ ngän ®uèc (trung)","Ngän ®uèc T©y Nam",1563,3223,"","Kh«ng cã nÕn vµ ngän ®uèc","T©y Nam TrÊn mé T­íng qu©n","T©y Nam TrÊn mé T­íng qu©n",{10,60,100},"Quû n« béc","Quû n« béc",{{1565,1575},{3212,3232}}},
		{"Mang nÕn vµ ngän ®uèc (tiÓu)","Ngäc ®uèc T©y B¾c",1601,3182,"","Kh«ng cã nÕn vµ ngän ®uèc","T©y B¾c TrÊn mé T­íng qu©n","T©y B¾c TrÊn mé T­íng qu©n",{70,100,0},"Quû ThŞ Tïng","Quû ThŞ Tïng",{{1597,1607},{3183,3193}}},
		{"¶i Quû T­¬ng §Çu","Quû T­íng Qu©n",1600,3221,""},
	}
	Tb_Monster_info[4] = {
		{"¶i D­îc V­¬ng","D­îc V­¬ng",1597,3192},
		{"D­îc Nh©n Th¶o","D­îc Nh©n Th¶o",1597,3192}, 
		{"¶i D­îc Nh©n V­¬ng","D­îc Nh©n"},
	}
	--npcËÀÍö½Å±¾
	TB_Npc_death_script = {}
	TB_Npc_death_script[1] = {
		{"Cæ D­¬ng Thó (háa luyÖn)","stage1_boss_death()"},
		{"¢m NhËt Sø ","stage1_sun_moon_death()"},
		{"Minh NhËt Sø","stage1_sun_moon_death()"},
		{"LiÖt Nhan Li Long","stage1_dragon_fox_death()"},
		{"Xİch LuyÖn Háa Hå","stage1_dragon_fox_death()"}
	}
	TB_Npc_death_script[2] = {
		{"Ph¸ phßng TrÊn mé trô","stage2_pillar_death(1,"},
		{"Gi¸ng c«ng TrÊn mé trô","stage2_pillar_death(2,"},
		{"H­ nh­îc TrÊn mé trô","stage2_pillar_death(3,"},
		{"Gi¶m tèc TrÊn mé trô","stage2_pillar_death(4,"},
		{"§én th©n TrÊn mé trô","stage2_pillar_death(5,"},
		{"§o¹n huyÕt TrÊn mé trô","stage2_pillar_death(6,"},
		{"Håi mÖnh TrÊn mé trô","stage2_pillar_death(7,"},
		{"Håi néi TrÊn mé trô","stage2_pillar_death(8,"},
		{"C­êng c«ng TrÊn mé trô","stage2_pillar_death(9,"},
		{"Ngù thÓ TrÊn mé trô","stage2_pillar_death(10,"},
		{"C­êng lùc TrÊn mé trô","stage2_pillar_death(11,"},
		{"§Ò tèc TrÊn mé trô","stage2_pillar_death(12,"},
		{"TrÊn Mé Thó","stage2_boss_death("},
	}
	TB_Npc_death_script[3] = {
		{"Quû T­íng Qu©n","stage3_boss_death()"},
		{"§«ng B¾c TrÊn mé T­íng qu©n","devil_Gen_death(1)"},
		{"§«ng Nam TrÊn mé T­íng qu©n","devil_Gen_death(2)"},
		{"T©y Nam TrÊn mé T­íng qu©n","devil_Gen_death(3)"},
		{"T©y B¾c TrÊn mé T­íng qu©n","devil_Gen_death(4)"},
		{"Quû tïy tïng","end_dialog()"},
		{"Quû Kh«i Lçi","end_dialog()"},
		{"Quû n« béc","end_dialog()"},
		{"Quû ThŞ Tïng","end_dialog()"},	
		{"Ngän ®uèc §«ng B¾c","player_kill_candler(1)"},
		{"Ngäc ®uèc §«ng Nam","player_kill_candler(2)"},
		{"Ngän ®uèc T©y Nam","player_kill_candler(3)"},
		{"Ngäc ®uèc T©y B¾c","player_kill_candler(4)"},
	}
	TB_Npc_death_script[4] = {
		{"D­îc V­¬ng","stage4_boss_death()"},
		{"D­îc Nh©n","stage4_devil_death()"},
	}
TB_Npc_death_script[5] = {
	{"Kim sø","stage5_element_death(1)"},
	{"Thñy sø","stage5_element_death(2)"},
	{"Méc sø","stage5_element_death(3)"},
	{"Háa sø","stage5_element_death(4)"},
	{"Thæ sø","stage5_element_death(5)"},
}
TB_Npc_death_script[6] = {
	{"HuyÕt Ma Nh©nHoan T­îng ","stage6_shadow_death(1)"},
	{"Quû T­¬ng §ÇuHoan T­îng ","stage6_shadow_death(2)"},
	{"TrÊn mé T­íng qu©nHoan T­îng ","stage6_shadow_death(3)"},
	{"Thèng lÜnh t­îng binhHoanT­îng ","stage6_shadow_death(4)"},
	{"TrÊn Mé ThóHoan T­îng ","stage6_shadow_death(5)"},
	{"Nguyªn h×nh ¶o ¶nh (tÜnh mŞch)","stage6_boss_slience_death()"},
	{"Nguyªn h×nh ¶o ¶nh (thÇn)","stage6_boss_death()"},
}
	--npc¶Ô»°½Å±¾
	--Íæ¼Òtaskid¼ÇÂ¼ÄÚÈİ
	Task_ID_stage_diff = 1252	--¹Ø¿¨Çø·Ö£ºÆÕÍ¨/¸´ÔÓ
	Task_ID_stage_seq = 1253	--¹Ø¿¨ĞòºÅ
	--¹ÖÎïĞÅÏ¢£¬ÔÚ¸÷¸ö¹Ø¿¨ÖĞÊ¹ÓÃ
	Tb_Npc_dialog_info = {}
	Main_Npc_Script_way = "\\script\\missions\\northwest_mission\\stage\\stage_time.lua"
--µÇÂ¼´¥·¢Æ÷µÄ´¦Àí
function player_log_out_pub_deal()
	RemoveTrigger(GetTrigger(Trigger_save_ID))
	for i =1,4 do
		StopTimeGuage(i)
	end
	local mission_diff = GetTask(Task_ID_stage_diff)
	if mission_diff == 2 then
		ForbidChangePK(0)	--½ûÖ¹×ª»»PK×´Ì¬
		SetPKFlag(0,0)		--PK×´Ì¬
		SetCreateTeam(0)
		local stage_seq = GetTask(Task_ID_stage_seq)
		--µÚ¶ş¹Ø³ÆºÅ´¦Àí
		if stage_seq == 2 then
			for i = 11,16 do
				RemoveTitle(60,i)
			end
			for i = 19801228,19801252 do
				RemoveState(i)
			end
		elseif stage_seq == 3 then
			for i = 1038,1040 do
				BigDelItem(2,0,i,BigGetItemCount(2,0,i))
			end
		elseif stage_seq == 4 then
			--µÚËÄ¹Ø³ÆºÅ´¦ÀíºÍ×´Ì¬´¦Àí
			for i = 21,25 do
				RemoveTitle(60,i)
			end
			RemoveState(19801223)
		end
	end
	UseScrollEnable(1)		--½ûÖ¹Ê¹ÓÃ»Ø³Ç·û
	ForbitTrade(0)			--½ûÖ¹½»Ò×
	StallEnable(1)				--½ûÖ¹°ÚÌ¯
	SetDeathPunish(1)		--ÎŞËÀÍö³Í·£
	OpenFriendliness(1)	--Ôö¼ÓºÃ¸Ğ¶È
	gf_ForbidFactionSkill(0)	--ÕòÅÉ¿ÉÒÔÊ¹ÓÃ
	if IsPlayerDeath() == 1 then
		RevivePlayer(0)
	end
	RestoreAll()		--È«²¿»Ø¸´
	SetDeathScript("")
	DelMSPlayer(MS_ID,0)
end
function Ms_on_log_in()
	player_log_out_pub_deal()
	--Íæ¼Ò´«³ö
	local login_diff = GetTask(TaskID_miss_login_diff)
	if login_diff ~= 2 then
		local map_id = GetWorldPos()
		local stage_seq = tonumber(strsub(tostring(map_id),4,4)) + 1
		NewWorld(Stage_info[stage_seq].out_coordinate[1],Stage_info[stage_seq].out_coordinate[2],Stage_info[stage_seq].out_coordinate[3])
	else
		NewWorld(500,1764,3147)
		SetFightState(0)
	end
end
-------------------------------------------------½±Àø¸øÓÚº¯Êı--------------------------------------------
Sever_diff = 2		--(1ÎªÊÕ·ÑÇø¡¢2ÎªÃâ·ÑÇø)
Tb_stage_tichket = {
	{2,0,1031,"Bİch Dao Thanh T©m §¬n"},
	{2,0,1032,"Håi Long s¸ch"},
	{2,0,1033,"To¸i Th¹ch ChÊn"},
	{2,0,1034,"Tİch D­¬ng Tinh Hoa"},
	{2,0,1035,"Ngò Hµnh Kú Phiªn"},
	{2,0,1036,"La bµn"},
	{2,0,1037,"ThiÖp dù tiÖc Long M«n"},
}
Tb_add_mertiral = {
	{2,1,3330,"NhÊt ThiÓm Yªu Hoµng"},
	{2,1,3331,"Tam DiÖu Long Hi"},
	{2,1,3332,"§é NguyÖt ThÇn Sa"},
	{2,1,3333,"PhÇn Quang ThÇn Sa"},
	{2,1,3334,"Tr¶m Tinh ThÇn Sa"},
	{2,1,3204," Ngò Th¸i Lung Tóy"},
	{2,1,3205,"ThÊt HuyÒn TÒ V¨n"},
}
Tb_stage_prize = {
--·şÎñÆ÷-¹Ø¿¨-¶Ó³¤
	{
		{--½¡¿µ×ª¾­Ñé-J-ÔÉÌú-ÁéÊ¯£¨µÈ¼¶ÏÂÉÏÏŞ£¬ÊıÁ¿£©-ÃÅÆ±£¨¼¸ÂÊ¡¢´úºÅ£©-²ÄÁÏ£¨¼¸ÂÊ¡¢ÊıÁ¿¡¢´úºÅ£©
			{2000000,200000,20,{3,4,2},{{10},{5}},{{25,75,100},{2,3,4},{1,1,1}},{},{}},
			{2000000,200000,20,{3,4,2},{{},{}},{{100},{2},{1}},{},{}},
		},
		{
			{2000000,200000,20,{3,4,2},{{10},{3}},{{25,75,100},{2,3,4},{1,1,1}},{},{}},
			{2000000,200000,20,{3,4,2},{{},{}},{{100},{2},{1}},{},{}},
		},
		{
			{3000000,200000,20,{4,5,2},{{10},{6}},{{90,100},{1,2},{2,2}},{{25,75,100},{2,3,4},{3,3,3}},{{100,1,1}}},
			{3000000,200000,20,{4,5,2},{{},{}},{{100},{1},{2}},{{50,100},{1,2},{3,3}},{{100,1,1}}},
		},
		{
			{2000000,200000,20,{3,4,2},{{10},{5}},{{25,75,100},{2,3,4},{1,1,1}},{},{}},
			{2000000,200000,20,{3,4,2},{{},{}},{{100},{2},{1}},{},{}},
		},
		{
			{3000000,200000,20,{4,5,2},{{10},{6}},{{90,100},{1,2},{2,2}},{{25,75,100},{2,3,4},{3,3,3}},{{100,1,1}}},
			{3000000,200000,20,{4,5,2},{{},{}},{{100},{1},{2}},{{50,100},{1,2},{3,3}},{{100,1,1}}},
		},
		{
			{4000000,200000,20,{5,6,2},{{100},{7}},{{50,100},{1,2},{6}},{{25,75,100},{6,7,8},{3,3,3}},{{100,1,1},{5,1,2}}},
			{4000000,200000,20,{5,6,2},{{},{}},{{100},{1},{6}},{{50,100},{3,4},{3,3}},{{100,1,1},{5,1,2}}},
		},
	},
	{
		{--¾­Ñé-J-ÔÉÌú-ÁéÊ¯£¨µÈ¼¶ÏÂÉÏÏŞ£¬ÊıÁ¿£©-ÃÅÆ±£¨¼¸ÂÊ¡¢´úºÅ£©-²ÄÁÏ£¨¼¸ÂÊ¡¢ÊıÁ¿¡¢´úºÅ£©
			{1000000,0,0,{3,4,1},{{10},{5}},{{100},{1},{1}},{},{}},
			{1000000,0,0,{3,4,1},{{},{}},{{100},{1},{1}},{},{}},
		},
		{
			{1000000,0,0,{3,4,1},{{10},{3}},{{100},{1},{1}},{},{}},
			{1000000,0,0,{3,4,1},{{},{}},{{100},{1},{1}},{},{}},
		},
		{
			{2000000,0,0,{4,5,1},{{10},{6}},{{20},{1},{2}},{{100},{1},{3}},{}},
			{2000000,0,0,{4,5,1},{{},{}},{{20},{1},{2}},{{30},{1},{3}},{}},
		},
		{
			{1000000,0,0,{3,4,1},{{10},{5}},{{100},{1},{1}},{},{}},
			{1000000,0,0,{3,4,1},{{},{}},{{100},{1},{1}},{},{}},
		},
		{
			{2000000,0,0,{4,5,1},{{10},{6}},{{20},{1},{2}},{{100},{1},{3}},{}},
			{2000000,0,0,{4,5,1},{{},{}},{{20},{1},{2}},{{30},{1},{3}},{}},
		},
		{
			{3000000,0,0,{5,6,1},{{100},{7}},{{20},{1},{6}},{{50,90,100},{2,3,4},{3,3,3}},{}},
			{3000000,0,0,{5,6,1},{{},{}},{{20},{1},{6}},{{65,100},{1,2},{3,3}},{}},
		},
	},
}
--½±Àø¸øÓè
function Ms_stage_prize()
	--¹Ø¿¨ĞòºÅºÏ·¨ÅĞ¶Ï
	local stage_diff = GetMissionV(MS_STATE_DIFF_ID)
	if stage_diff <= 0 or stage_diff > getn(Tb_stage_prize[Sever_diff]) then
		return
	end
	--ÊÇ·ñ¶Ó³¤
	local is_team_captain = 2
	if GetTeamMember(0) == PlayerIndex then
		is_team_captain = 1
	end
	--¼Ó¾­Ñé
	local exp_num = Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][1]
		--ÊÕ·ÑÇø×ª»»¾­Ñé
	if Sever_diff == 1 then
		exp_num = min((Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][1]/2),GetGoldenExp())
		if exp_num ~= 0 then
			ModifyGoldenExp(-exp_num)
			ModifyExp(exp_num)
			Msg2Player("B¹n ®em "..exp_num.."®iÓm søc kháe ®æi ®iÓm kinh nghiÖm.")
		else
			Msg2Player("§iÓm søc kháe hiÖn t¹i cña b¹n lµ 0, kh«ng thÓ chuyÓn thµnh kinh nghiÖm!")
		end
		--Ãâ·ÑÇø
	end
	ModifyExp(Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][1])
	Msg2Player("B¹n nhËn ®­îc "..Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][1].." ®iÓm kinh nghiÖm!")
	--¼ÓÇ®
	if Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][2] ~= 0 then
		Earn(Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][2])
	end
	--¼ÓÌú
	local add_flag = 0
	if Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][3] ~= 0 then
		 add_flag = AddItem(2,2,8,Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][3]) 
		 if add_flag == 1 then
			Msg2Player("B¹n nhËn ®­îc "..Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][3].." Thiªn Th¹ch!")
		else
			WriteLog("¶i T©y B¾c: PhÇn th­ëng ban cho-ng­êi ch¬i["..GetName().."]t¨ng thªm "..Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][3].." thiªn th¹ch thÊt b¹i, vŞ trİ thÊt b¹i: "..add_flag)
		end
	end
	--Ôö¼ÓÁéÊ¯
	if getn(Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][4]) ~= 0 then
		for i = 1,Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][4][3] do
			local linshi_level = random(Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][4][1],Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][4][2])
			lspf_AddLingShiInBottle(linshi_level,1)
			Msg2Player("B¹n nhËn ®­îc 1 viªn cÊp "..linshi_level.." Linh th¹ch, ®· cho vµo Tô Linh ®Ønh!")
		end
	end
	--Ôö¼ÓÃÅÆ±
	local ran_num = random(100)
	if getn(Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][5] [1]) > 0 then
		for i = 1,getn(Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][5] [1]) do
			if ran_num <= Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][5] [1][i] then
				local ticket_seq = Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][5] [2][i]
				add_flag = AddItem(Tb_stage_tichket[ticket_seq][1],Tb_stage_tichket[ticket_seq][2],Tb_stage_tichket[ticket_seq][3],1)
				if add_flag == 1 then
					Msg2Player("B¹n nhËn ®­îc 1 "..Tb_stage_tichket[ticket_seq][4])
					Zgc_pub_mission_fun(MS_ID,"Msg2Player(\""..GetName().."NhËn ®­îc 1 "..Tb_stage_tichket[ticket_seq][4].."\")")
				else
					WriteLog("¶i T©y B¾c: PhÇn th­ëng ban cho-ng­êi ch¬i["..GetName().."]t¨ng 1"..Tb_stage_tichket[ticket_seq][4].." thÊt b¹i, kı hiÖu:"..add_flag)
				end
				break
			end
		end		
	end
	--Ôö¼Ó²ÄÁÏ
	ran_num = random(100)
	if getn(Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][6] [1]) > 0 then
		for i = 1,getn(Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][6] [1]) do
			if ran_num <= Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][6] [1][i] then
				local mertiral_num = Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][6] [2][i]
				local mertiral_seq = Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][6] [3][i]
				add_flag = AddItem(Tb_add_mertiral[mertiral_seq][1],Tb_add_mertiral[mertiral_seq][2],Tb_add_mertiral[mertiral_seq][3],mertiral_num)
				if add_flag == 1 then
					Msg2Player("B¹n nhËn ®­îc "..mertiral_num.."c¸i"..Tb_add_mertiral[mertiral_seq][4])
					Zgc_pub_mission_fun(MS_ID,"Msg2Player(\""..GetName().."NhËn ®­îc "..mertiral_num.."c¸i"..Tb_add_mertiral[mertiral_seq][4].."\")")
				else
					WriteLog("¶i T©y B¾c: PhÇn th­ëng ban cho-ng­êi ch¬i["..GetName().."]t¨ng thªm "..mertiral_num.."c¸i"..Tb_add_mertiral[mertiral_seq][4].." thÊt b¹i, kı hiÖu:"..add_flag)
				end
				break
			end
		end
	end
	--2008-5-13Ôö¼Ó²ÄÁÏ
	ran_num = random(100)
	if getn(Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][8]) > 0 then
		for i = 1,getn(Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][8]) do
			if ran_num <= Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][8][i][1] then
				local mertiral_num = Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][8] [i][2]
				local mertiral_seq = Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][8] [i][3]
				add_flag = AddItem(Tb_add_mertiral[mertiral_seq][1],Tb_add_mertiral[mertiral_seq][2],Tb_add_mertiral[mertiral_seq][3],mertiral_num)
				if add_flag == 1 then
					Msg2Player("B¹n nhËn ®­îc "..mertiral_num.."c¸i"..Tb_add_mertiral[mertiral_seq][4])
					Zgc_pub_mission_fun(MS_ID,"Msg2Player(\""..GetName().."NhËn ®­îc "..mertiral_num.."c¸i"..Tb_add_mertiral[mertiral_seq][4].."\")")
				else
					WriteLog("¶i T©y B¾c: PhÇn th­ëng ban cho-ng­êi ch¬i["..GetName().."]t¨ng thªm "..mertiral_num.."c¸i"..Tb_add_mertiral[mertiral_seq][4].." thÊt b¹i, kı hiÖu:"..add_flag)
				end
			end
		end
	end
	--½áÊø
	ran_num = random(100)
	if getn(Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][7]) > 0 then
		for i = 1,getn(Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][7] [1]) do
			if ran_num <= Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][7] [1][i] then
				local mertiral_num = Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][7] [2][i]
				local mertiral_seq = Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][7] [3][i]
				add_flag = AddItem(Tb_add_mertiral[mertiral_seq][1],Tb_add_mertiral[mertiral_seq][2],Tb_add_mertiral[mertiral_seq][3],mertiral_num)
				if add_flag == 1 then
					Msg2Player("B¹n nhËn ®­îc "..mertiral_num.."c¸i"..Tb_add_mertiral[mertiral_seq][4])
					Zgc_pub_mission_fun(MS_ID,"Msg2Player(\""..GetName().."NhËn ®­îc "..mertiral_num.."c¸i"..Tb_add_mertiral[mertiral_seq][4].."\")")
				else
					WriteLog("¶i T©y B¾c: PhÇn th­ëng ban cho-ng­êi ch¬i["..GetName().."]t¨ng thªm "..mertiral_num.."c¸i"..Tb_add_mertiral[mertiral_seq][4].." thÊt b¹i, kı hiÖu:"..add_flag)
				end
				break
			end
		end
	end
	--2008-11-10£ºÔö¼ÓÆßìÅöÌÎÆ
	ran_num = random(1000)
	if (ran_num <= 10 and Sever_diff == 1) or  (ran_num <= 5 and Sever_diff == 2) then
		AddItem(2,1,3205,1)
		Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 ThÊt HuyÒn L­u V¨n!")
		Zgc_pub_mission_fun(MS_ID,"Msg2Player(\""..GetName().."NhËn ®­îc 1 ThÊt HuyÒn L­u V¨n!\")")
	end
end
