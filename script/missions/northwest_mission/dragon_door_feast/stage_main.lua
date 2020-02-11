--½Å±¾Ãû³Æ£ºÎ÷±±Çø¹Ø¿¨µÚÆß¹Ø
--½Å±¾¹¦ÄÜ£ºÎ÷±±Çø¹Ø¿¨µÚÆß¹ØÖ÷½Å±¾£¬°üº¬NPC¶Ô»°¡¢Á÷³Ì¡¢½±ÀøµÈµÈ
--¹¦ÄÜ²ß»®ÈË£º³Â¹«×Ó
--¹¦ÄÜ¿ª·¢ÈË£º´å³¤
--¹¦ÄÜ²âÊÔÈË£ºÑó´Ğ
--¹¦ÄÜ¿ª·¢Ê±¼ä£º2007-12-19
--´úÂëĞŞ¸Ä¼ÇÂ¼£º
Include("\\script\\lib\\missionfunctions.lua")
Include("\\script\\missions\\northwest_mission\\dragon_door_feast\\mission_head.lua")
Include("\\script\\missions\\northwest_mission\\zgc_mission_pub_fun.lua")
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı
Include("\\script\\lib\\lingshi_head.lua");

--bossÑªÁ¿¶ÔÓ¦º¯Êı
Tb_boss_life_step = {0.9,0.7,0.5,0.3,0.1}
feast_npc_script_way = "\\script\\missions\\northwest_mission\\\dragon_door_feast\\stage_main.lua"
--Ğ¡¹ÖÊıÁ¿
feast_devil_num = 50
Tb_feast_npc_info = {
	{"Lı Nguyªn Kh¸nh","Lı Nguyªn Kh¸nh",1651,3149,feast_npc_script_way},
	{"NhÊt PhÈm §­êng T©n BŞ","NhÊt PhÈm §­êng T©n BŞ",1633,3178,feast_npc_script_way,feast_devil_num},
	{"NhÊt PhÈm §­êng Thİch Kh¸ch","NhÊt PhÈm §­êng Thİch Kh¸ch",1633,3178,feast_npc_script_way,feast_devil_num},
	{"NhÊt PhÈm §­êng Phi Hé","NhÊt PhÈm §­êng Phi Hé",1633,3178,feast_npc_script_way,feast_devil_num},
	{"NhÊt PhÈm §­êng Hæ Dùc","NhÊt PhÈm §­êng Hæ Dùc",1633,3178,feast_npc_script_way,feast_devil_num},
	{"NhÊt PhÈm §­êng Vò VÖ","NhÊt PhÈm §­êng Vò VÖ",1633,3178,feast_npc_script_way,feast_devil_num},
	{"M©m cç","YÕn tiÖc",1634,3180,feast_npc_script_way,120},
}
--npcË²¼äÒÆ¶¯Î»ÖÃ
Tb_npc_newpos = {
	{1657,3153},{1600,3153},{1601,3213},{1665,3212},
	{1682,3187},{1632,3134},{1632,3180},{1615,3170},
	{1654,3199},{1577,3191},{1633,3237},
}
Tb_npc_newpos_dialog = {
	"Nghe danh trung nguyªn Kú M«n ThuÉn Gi¸p uyªn b¸c tinh th«ng. Nay rÊt may m¾n ®­îc tiÕp chiªu NghŞch Kú M«n nµy!",
	"Xem khinh c«ng cña vâ l©m trung nguyªn cã b× kŞp chiªu Kú Quü Bé Ph¹t cña NghŞch Kú M«n hay kh«ng?!",
	"C¸c vŞ th©n thñ bÊt phµm, cã thÓ tiÕp chiªu NghŞch Kú M«n Chi ThuËt cña ta!",
}
--npc¶Ô»°
Tb_boss_step_dialog = {
	--¿ªÊ¼
	{	"<color=green>Lı Nguyªn Kh¸nh<color>: Hoan nghªnh c¸c vŞ quang l©m, h«m nay c¸c h¹ cã ı mêi kh¸ch, buæi yÕn tiÖc nµy nh»m th¾t chÆt mèi th©m t×nh, mäi ©n o¸n xin h·y bá qua cho.",
		"<color=green>Lı Nguyªn Kh¸nh<color>: TÇn l¨ng vµ D­îc Nh©n ®éng binh biÕn, <color=green>Th¸c B¹t ho»ng<color> ph¶n béi, ®· khiÕn cho c¸c h¹ trë thµnh nh©n vËt ®Çu n·o d­íi ThiÕt Chu LÖnh cña bæn ®­êng, h«m nay gÆp mÆt qu¶ nhiªn danh bÊt h­ truyÒn.",
		"<color=green>Lı Nguyªn Kh¸nh<color>: C¸c h¹ cã thÓ tiªu diªu tù t¹i d­íi ThiÕt Chu LÖnh, t¹i h¹ sau khi nghe danh véi vµng ®Õn trung nguyªn, hy väng kh«ng bá c«ng lÇn nµy. Giê ®· cã thÓ diÖn kiÕn anh hïng, chiªu ®·i s¬ sµi, mong ®­îc l­îng thø!",
		"<color=green>Lı Nguyªn Kh¸nh<color>: Thñ h¹ cña bæn ®­êng ®Òu lµ nh÷ng tªn bÊt tµi mong c¸c h¹ ®õng c­êi, ®Ó l©u sÏ lì viÖc, lÇn nµy t¹i h¹ sÏ ®İch th©n gi¶i quyÕt, kh«ng cÇn ph¶i gi¶i thİch nhiÒu, kh«ng ng¹i chø?",
	},
	--ĞÂ±²
	{	
		{"<color=green>Lı Nguyªn Kh¸nh<color>: NÕu kh«ng th¾ng næi nh÷ng tªn nh¶i nhĞp cña bæn ®­êng, th× xem nh­ kh«ng cÇn chuÈn bŞ lÇn yÕn tiÖc nµy."
		},
		{	"<color=green>Lı Nguyªn Kh¸nh<color>: Th©n thñ bÊt phµm, cã thÓ ®èi phã ®­îc mÊy tªn thñ h¹ bÊt tµi cña t¹i h¹, qu¶ nhiªn thËt xøng ®¸ng!"
		},
		{	"<color=green>Lı Nguyªn Kh¸nh<color>: ChØ cã mÊy tªn thñ h¹ bÊt tµi mµ còng kh«ng ®èi phã ®­îc, sao cã thÓ dù buæi tiÖc nµy?",
			"<color=green>Lı Nguyªn Kh¸nh<color>: Xem ra c¸c h¹ vÉn ch­a ph¶i lµ ®èi thñ cña t¹i h¹, thËt ch¼ng thó vŞ tİ nµo."
		}
	},
	--´Ì¿Í
	{	
		{"<color=green>Lı Nguyªn Kh¸nh<color>: Ngay c¶ thİch kh¸ch cña bæn ®­êng mµ kh«ng th¾ng næi, xem ra kh«ng cÇn chuÈn bŞ cho b÷a tiÖc nµy."
		},
		{	"<color=green>Lı Nguyªn Kh¸nh<color>: Th©n thñ bÊt phµm, t¹i h¹ rÊt kİnh phôc nh÷ng ng­êi dòng vâ."
		},
		{	"<color=green>Lı Nguyªn Kh¸nh<color>: Dùa vµo th©n thñ nh­ thÕ, mµ muèn n¸o lo¹n bæn ®­êng sao, ®Ó t¹i h¹ xem thö vËn may trung nguyªn ®Õn ®©u.",
			"<color=green>Lı Nguyªn Kh¸nh<color>: ChØ lµ mÊy tªn thİch kh¸ch, mµ ng­¬i còng ®· lóng tóng, t¹i h¹ thËt kh«ng hiÓu bæn ®­êng b¹i ë chç nµo."
		}
	},
	--·É»¤
	{	
		{"<color=green>Lı Nguyªn Kh¸nh<color>: MÆc dï Phi Hé cña bæn ®­êng thùc lùc phi phµm, nh­ng nh÷ng ng­êi muèn tham dù yÕn tiÖc th× ph¶i th¾ng nã, th¾ng nã míi cã thÓ bµn ®Õn viÖc dù tiÖc."
		},
		{	"<color=green>Lı Nguyªn Kh¸nh<color>: Bæn ®­êng nhiÒu lÇn thÊt b¹i ë trung nguyªn, t¹i h¹ nhí kh«ng lÇm lµ do cao thñ trung nguyªn c¶n trë, qu¶ nhiªn kh«ng ngoµi dù ®o¸n, thÊt s¸ch thÊt s¸ch."
		},
		{	"<color=green>Lı Nguyªn Kh¸nh<color>: LÇn nµy trung nguyªn hµnh ®éng, tİnh to¸n kü l­ìng chu ®¸o, kh«ng ngê bŞ ng­¬i ph¸ ho¹i, Lı mæ thÊt b¹i råi.",
			"<color=green>Lı Nguyªn Kh¸nh<color>: Cø nghÜ r»ng nh÷ng ng­êi ®Õn ®©y ®Òu lµ cao thñ vâ l©m trung nguyªn, nµo ngê chØ cã vµi ng­êi ®Şch l¹i phi hé, vâ l©m trung nguyªn qu¶ thËt h­ danh kh«ng İt."
		}
	},
	--»¢Òí
	{	
		{"<color=green>Lı Nguyªn Kh¸nh<color>: MÆc dï Hç Dùc cña bæn ®­êng thùc lùc phi phµm, nh­ng nh÷ng ng­êi muèn tham dù yÕn tiÖc th× ph¶i th¾ng ®­îc nã, th¾ng nã míi cã thÓ bµn ®Õn viÖc dù tiÖc."
		},
		{	"<color=green>Lı Nguyªn Kh¸nh<color>: Vâ l©m trung nguyªn qu¶ lµ ®èi thñ cña bæn ®­êng, lÇn sau hä ®Õn, ta quyÕt toµn lùc ®èi phã, ®Ó tr¶ thï cho c¸c vong hån ®· mÊt."
		},
		{	"<color=green>Lı Nguyªn Kh¸nh<color>: Ng­êi nhËn thiÖp cña Lı mæ, nhÊt ®Şnh kh«ng ph¶i lµ ng­êi tÇm th­êng, sao giê vÉn ch­a ®Õn ®ñ? Vâ l©m trung nguyªn chØ cã thÕ th«i sao.",
			"<color=green>Lı Nguyªn Kh¸nh<color>: Vâ l©m trung nguyªn vÉn ch­a ®Õn ®ñ, xem ra cÇn ph¶i gëi thiÖp, mêi cao thñ ®Õn dù tiÖc, chÕt d­íi tay cña t¹i h¹ lµ mét sù vinh h¹nh."
		}
	},
	--ÓğÁÖÎÀ
	{	
		{"<color=green>Lı Nguyªn Kh¸nh<color>: Vò vÖ míi lµ tinh anh cña bæn ®­êng, chØ cÇn th¾ng ®­îc chóng, t¹i h¹ nhÊt ®Şnh sÏ chuÈn bŞ yÕn tiÖc thŞnh so¹n vµ quµ hËu hÜnh tõ T©y H¹."
	},
		{	"<color=green>Lı Nguyªn Kh¸nh<color>: KÕ  ho¹ch cña bæn ®­êng mÆc dï bŞ ng­¬i ph¸ háng, nh­ng vËn mÖnh §¹i Tèng kh«ng ph¶i n»m trong tay ng­¬i."
		},
		{	"<color=green>Lı Nguyªn Kh¸nh<color>: C¸c ng­¬i d¸m ®Õn Long M«n yÕn, xem ra còng ®· gi¸c ngé ®­îc, sÏ ch«n th©n ë n¬i nµy, nªn lÊy lµm vinh h¹nh.",
			"<color=green>Lı Nguyªn Kh¸nh<color>: Bæn ®­êng ®· lÊy l¹i khİ ph¸ch, lÊy l¹i nh÷ng g× thuéc vÒ m×nh."
		}
	},
	--±»¸ÉµôÁË
	{	
		"<color=green>Lı Nguyªn Kh¸nh<color>: Vâ l©m trung nguyªn qu¶ nhiªn kh«ng lµm Lı mæ thÊt väng, cã thÓ ®¸nh mét trËn thËt s¶ng kho¸i, thËt kh«ng uæng phİ.",
		"<color=green>Lı Nguyªn Kh¸nh<color>: Vâ l©m trung nguyªn qu¶ nhiªn lµ ®èi thñ cña Lı mæ, bæn ®­êng lÊy l¹i khİ ph¸ch, qu¶ kh«ng lµm t¹i h¹ thÊt väng. Mét ngµy gÇn ®©y sÏ bµy tiÖc chiªu ®·i, rÊt hoan nghªnh."
	},
	--Ê±¼ä½áÊø
	{
		"<color=green>Lı Nguyªn Kh¸nh<color>: H«m nay qu¶ nhiªn ®­îc diÖn kiÕn sù uyªn b¸c tinh th«ng cña vâ c«ng trung nguyªn, hy väng lÇn sau l¹i ®­îc thö søc cïng c¸c vŞ anh hïng!",
	}
}
--npcº°»°
Tb_boss_step_chat = {
	--¿ªÊ¼
	{	
			"Hoan nghªnh c¸c vŞ quang l©m! YÕn tiÖc s¬ sµi, chiªu ®·i kh«ng chu ®¸o, mong ®­îc l­îng thø!",
			"Trung nguyªn cæ cã H¹ng Vò B¸ V­¬ng bµy Hång M«n YÕn, c¸c vŞ còng cã khİ kh¸i dù tiÖc cña L­u Thiªn Tö, tuyÖt diÖu tuyÖt diÖu!",
			"Trung nguyªn nh©n tµi v« sè, ch¼ng tr¸ch kh¾p n¬i cöa ¶i trïng trïng!",
	},
	--ĞÂ±¸
	{	{	"YÕn tiÖc sao cã thÓ thiÕu r­îu, c¸c h¹ xem thö lÇn nµy xem c¸c vŞ cã xøng ®¸ng ®Ó dù yÕn tiÖc hay kh«ng! ",
			"Ng­êi ®©u! Bµy tiÖc, chiªu ®·i c¸c vŞ kh¸ch quı.",
		},
		{	"YÕn tiÖc ®· ®­îc bµy, dòng khİ cña c¸c vŞ thËt khiÕn t¹i h¹ kİnh phôc, nay long hæ t­¬ng phïng sao cã thÓ thiÕu r­îu ®­îc?"},
		{	"C¸c vŞ tµi nghÖ kĞm câi, sao cã thÓ dù tiÖc?"},
	},
	--´Ì¿Í
	{	{	"Cïng Th¸c B¹t T­ M· giao chiÕn, thËt s¶ng kho¸i, mau mang r­îu cho ta!",
			"Ng­êi ®©u! Bµy tiÖc, chiªu ®·i c¸c vŞ kh¸ch quı."
		},
		{	"Vâ l©m trung nguyªn danh bÊt h­ truyÒn, cao thñ v« sè, yÕn tiÖc h«m nay thËt kh«ng lµm t¹i h¹ thÊt väng!"},
		{	"ChØ lµ vµi tªn thİch kh¸ch, khiÕn mäi ng­êi mÊt høng, t¹i h¹ thËt lÊy lµm tiÕc!"},
	},
	--·É»¤
	{	{	"T¹i h¹ ph¶i chøng tá thùc lùc cña m×nh, tiÕp chiªu!",
			"Ng­êi ®©u! Bµy r­îu!"
		},
		{	"Bæn ®­êng lÇn nµy chŞu thua trung nguyªn, qu¶ thËt thùc lùc kh«ng ®ñ!"},
		{	"Xem ra bæn ®­êng th¶m b¹i, lµ do ng­êi cña bæn ®­êng bÊt tµi!"},
	},
	--»¢Òí
	{	{	"Mü töu, thİch hîp khi ch«n theo ng­êi!",
			"Bay ®©u! Mêi r­îu, ®õng tr¸ch ta kh«ng n­¬ng tay"
		},
		{"Vâ l©m trung nguyªn qu¶ lµ mét ®èi thñ, thËt diÔm phóc!"},
		{"Ngay c¶ Hæ Dùc còng kh«ng qua næi, Vâ L©m Trung Nguyªn chØ cã thÕ th«i sao!"},
	},
	--ÓğÁÖÎÀ
	{	{	"¢n o¸n gi÷a bæn ®­êng vµ trung nguyªn, h·y ®Ó Lı mæ ta ra tay gi¶i quyÕt!",
			"Ng­êi ®©u! Bµy r­îu, tiÔn c¸c vŞ cao thñ lªn ®­êng!"
		},
		{"Trung nguyªn sím muén g× còng thuéc vÒ T©y H¹, vâ l©m khã tr¸nh n¹n triÒu ®×nh!"},
		{"Kh«ng cÇn gi·y chÕt n÷a, m¹ng ng­¬i ®· ®­îc ®Şnh s½n råi!"},
	},
	--±»¸ÉµôÁË
	{	"§Êt trung nguyªn nµy, Lı mæ chØ lµ kh¸ch, cã chót İt quµ män, mong c¸c vŞ nhËn cho!",
		"LÔ vËt kh«ng ®­îc chu ®¸o c¸c vŞ h·y nhËn cho! "
	},
	--Ê±¼ä½áÊø
	{
		"H«m nay qu¶ thËt ®· nh×n thÊy râ sù th©m thóy uyªn b¸c cña vâ c«ng trung nguyªn, hy väng lÇn sau sÏ cã dŞp l·nh gi¸o!"
	}

}
--npc+buff
Tb_boss_life_buff = {
	{},
	{	
		{"state_move_speed_percent_add",50,64800,0,19801260},
	},
	{
		{"state_magic_parmor_per_add",50,64800,0,19801261},
		{"state_physical_parmor_per_add",50,64800,0,19801262},
	},
	{
		{"state_knockback_when_lose_hp",810,64800,0,19801263},
		{"state_paralysis_when_lose_hp",232,64800,0,19801264},
		{"state_p_attack_percent_add",30,64800,0,19801265},
		{"state_m_attack_percent_add",30,64800,0,19801266},
	},
	{
		{"state_interrupt_rate_add",10,64800,0,19801267},
		{"state_paralysis_attack",10,64800,0,19801268},
		{"state_sleep_attack",10,64800,0,19801269},
		{"state_attack_burst_dec_attack",650,64800,0,19801270},
		{"state_slow_attack",650,64800,0,19801271},
		{"state_shadow_burst", 2565,64800,0,19801272},
	},
	{
		{"state_knockback_attack",10,64800,0,19801273},
		{"state_knockdown_attack",10,64800,0,19801274},
		{"state_fetter_attack",10,64800,0,19801275},
		{"state_confusion_attack",10,64800,0,19801276},
		{"state_vertigo_attack",10,64800,0,19801277},
		{"state_shadow_run",2565,64800,0,19801278},
	}
}
--ÑçÏ¯½±Àø
feast_exp_prize_max ={
	{1000000,1000000,1000000,1500000,2500000,6000000},
	{2000000,500000,500000,800000,1000000,2000000},
	}
feast_exp_chg_prize_max = 	{500000,800000,800000,1000000,1500000,3000000}
Tb_add_mertiral = {
	{2,1,3330,"NhÊt ThiÓm Yªu Hoµng"},
	{2,1,3331,"Tam DiÖu Long Hi"},
	{2,1,3332,"§é NguyÖt ThÇn Sa"},
	{2,1,3333,"PhÇn Quang ThÇn Sa"},
	{2,1,3334,"Tr¶m Tinh ThÇn Sa"},
	{2,1,3204," Ngò Th¸i Lung Tóy"},
	{2,1,3205,"ThÊt HuyÒn TÒ V¨n"},
}
Tb_feast_mis_prirze = {
	{		--ÊÕ·Ñ½±Àø
		--¾­Ñé»ùÊı-½¡¿µ×ª¾­Ñé»ùÊı-ÁéÊ¯½±Àø£¨µÈ¼¶ÏÂÏŞ¡¢µÈ¼¶ÉÏÏŞ¡¢ÊıÁ¿£©-ÎäÆ÷ÌØĞ§½±Àø£¨·ÖÀà1£¨{ID,Ãû³Æ}£¬{¸ÅÂÊ1¡¢¸ÅÂÊ2}{ÊıÁ¿1¡¢ÊıÁ¿2}£©£©
		{100000,120000,			{1,4,2},	{},									{}						},
		{250000,250000,			{1,4,2},	{},									{}						},
		{250000,250000,			{2,5,2},	{{50,100},{1,2},{1,1}},	{}						},
		{500000,300000,			{2,5,2},	{{50,100},{1,2},{2,2}},	{{50},{1},{3}}	},
		{750000,500000,			{3,6,2},	{{50,100},{1,2},{6,6}},	{{50},{1},{3}}	},
		{12500000,62500000,	{5,6,2},	{{10},{1},{7}},				{{100},{1},{3}}	},
	},
	{		--Ãâ·Ñ½±Àø
		--¾­Ñé»ùÊı-ÁéÊ¯½±Àø£¨µÈ¼¶ÏÂÏŞ¡¢µÈ¼¶ÉÏÏŞ¡¢ÊıÁ¿£©-ÎäÆ÷ÌØĞ§½±Àø£¨·ÖÀà1£¨{ID,Ãû³Æ}£¬{¸ÅÂÊ1¡¢¸ÅÂÊ2}{ÊıÁ¿1¡¢ÊıÁ¿2}£©£©
		{50000,0,						{1,4,2},	{},							{}					},
		{150000,0,						{1,4,2},	{},							{}					},
		{150000,0,						{2,5,2},	{{50},{1},{1}},		{{25},{1},{3}	}},
		{250000,0,						{2,5,2},	{{10},{1},{2}},		{{25},{1},{3}	}},
		{500000,0,						{3,6,2},	{{5},{1},{6}},			{{25},{1},{3}	}},
		{5000000,0,					{5,6,2},	{{3},{1},{7}},			{{25},{1},{3}	}},
	},
}
--*******************¹Ø¿¨Ö÷Âß¼­*********************
feast_boss_life_chk_start_sec = 3060
feast_boss_life_chk_end_sec = 60
Tb_feast_time_fun = {
	[feast_boss_life_chk_start_sec] = "chg_boss_2_fight()",
	[feast_boss_life_chk_end_sec] = "feast_fail()",
	[feast_boss_life_chk_end_sec - 1] = "feast_crt()",
	[0] = "feast_end()"
}
for i = 3600,3180,-1 do
	if mod(i,60) == 0 then
		Tb_feast_time_fun[i] = "feast_broadcast()"
	end
end
for i = 3179,3061,-1 do
	if mod(i,20) == 0 then
		Tb_feast_time_fun[i] = "feast_broadcast()"
	end
end
function OnTimer()
	--Ö÷Âß¼­
	local time_loop_num = GetMissionV(MS_TIMMER_LOOP_ID) 
	SetMissionV(MS_TIMMER_LOOP_ID,(time_loop_num - 1))
	--ÏµÍ³º¯Êı´¦Àí
	if Tb_feast_time_fun[time_loop_num] ~= nil then
		dostring(Tb_feast_time_fun[time_loop_num])
	end
	--ÑªÁ¿¼ì²âÊ±¼ä
	local mis_step = GetMissionV(Ms_feast_step)		--bossÑªÁ¿µÍÓÚ10%ÒÔºó²»ĞèÒª¼ì²âÑªÁ¿
	if mis_step < 6 and time_loop_num < feast_boss_life_chk_start_sec and time_loop_num > feast_boss_life_chk_end_sec  then
		feast_boss_life_chk()
	end
	--bossË²¼äÒÆ¶¯´¥·¢
	if time_loop_num < 3000 and time_loop_num > 60 and mod(time_loop_num,60) == 0 and GetMissionV(Ms_feast_deputy_step) == 0 then
		boss_now_pos()
	end
	--Ñç»á¸÷¸ö½×¶ÎÖ´ĞĞ
	local denputy_loop_num =GetMissionV(MS_feast_timmer_deputy_loop_ID)
	if denputy_loop_num >= 0 then
		local denputy_step_id = GetMissionV(Ms_feast_deputy_step)
		if denputy_loop_num == 0 then
			if denputy_step_id == 1 then
				devil_kill_all_fail()
			else
				chg_boss_2_fight()
			end
		else
			SetMissionV(MS_feast_timmer_deputy_loop_ID,(denputy_loop_num-1))
		end
	end
end
--µÚ¶ş²½Ñ­»·£¬¿ªÊ¼K npc
function chg_boss_2_fight()
	--µÈ¼¶´¦Àí
	local mis_step = GetMissionV(Ms_feast_step)
	if mis_step == 1 then
		local player_num = GetMissionV(MS_PLAYER_NUM)
		if player_num <= 0 then
			CloseMission(FEAST_MS_ID)
			local map_id =  SubWorldIdx2ID(SubWorld)
			WriteLog("[YÕn tiÖc Long M«n]cöa ¶i: 	"..map_id.."	Cöa ¶i 	")
			return
		end
		Zgc_pub_mission_fun(FEAST_MS_ID,"StartTimeGuage(\"Thêi gian kÕt thóc d¹ yÕn cßn\",3000,0,1)")
	end
	--Ğ¡¹ÖÇåÀí
	feast_devil_clear()
	--boss×ª»»
	local boss_index = GetMissionV(MS_feast_boss_index)
	ChangeNpcToFight(boss_index)
	feast_boss_chat(boss_index)
	--NpcChat(boss_index,Tb_boss_step_chat[mis_step][1][random(1,getn(Tb_boss_step_chat[mis_step][1]))])
	--boss+buff
	if Tb_boss_life_buff[mis_step] ~= nil then
		local buff_num = getn(Tb_boss_life_buff[mis_step])
		if  buff_num~= 0 then
			for i = 1,buff_num do
				CastState2Npc(boss_index,Tb_boss_life_buff[mis_step][i][1],Tb_boss_life_buff[mis_step][i][2],Tb_boss_life_buff[mis_step][i][3],Tb_boss_life_buff[mis_step][i][4],Tb_boss_life_buff[mis_step][i][5])
			end
		end
	end
	--ÏµÍ³´¦Àí
	SetMissionV(Ms_feast_forstep_time,GetTime())
	SetMissionV(Ms_feast_deputy_step,0)
	SetMissionV(MS_feast_timmer_deputy_loop_ID,-1)
end
--ÑªÁ¿¼ì²â
function feast_boss_life_chk()
	local mis_step = GetMissionV(Ms_feast_step)
	local boss_index = GetMissionV(MS_feast_boss_index)
	local boss_life_max,boss_life_num = GetUnitCurStates(boss_index,1)
	if (boss_life_num/boss_life_max) < Tb_boss_life_step[mis_step] then
		chg_boss_2_dialog()
	end
end
--µÚÈı²½£¬npc¿ªÊ¼¶Ô»°
function chg_boss_2_dialog()
	--Ê±¼ä¼ÇÂ¼
	SetMissionV(Ms_feast_waste_sec_num,(GetTime()-GetMissionV(Ms_feast_forstep_time)))
	--¹Ø¿¨µÈ¼¶ÌáÉı
	local mis_step = (GetMissionV(Ms_feast_step) + 1)
	SetMissionV(Ms_feast_step,mis_step)
	SetMissionV(Ms_feast_deputy_step,1)
	--npc×ª»»
	local boss_index = GetMissionV(MS_feast_boss_index)
	feast_boss_chat(boss_index)
	ChangeNpcToFight(boss_index,0,6)
	AddUnitStates(boss_index,7,0)
	--ÀîÔªÇì±»É±ËÀÖ®Ç°¶¼ÒªË¢Ğ¡¹Ö
	if mis_step < 7 then	
		local map_id =  SubWorldIdx2ID(SubWorld)
		local devil_num,devil_index = CreateNpc(Tb_feast_npc_info[mis_step][1],Tb_feast_npc_info[mis_step][2],map_id,Tb_feast_npc_info[mis_step][3],Tb_feast_npc_info[mis_step][4],-1,Tb_feast_npc_info[mis_step][6],1,300)
		for i = 0,getn(devil_index) do
			SetNpcScript(devil_index[i],Tb_feast_npc_info[mis_step][5])
		end
		--Ğ¡¹ÖÊıÁ¿Çå0
		SetMissionV(Ms_feast_devil_kill_num,0)
		--Ğ¡´¥·¢Æ÷Ö´ĞĞ
		SetMissionV(MS_feast_timmer_deputy_loop_ID,feast_devil_kill_loop_num)
		--Ê±¼ä¼ÇÂ¼
		SetMissionV(Ms_feast_forstep_time,GetTime())
		Zgc_pub_mission_fun(FEAST_MS_ID,"StartTimeGuage(\"Thêi gian ®¸nh b¹i hé vÖ cßn\","..feast_devil_kill_loop_num..",0,2)")
	end
end
--µÚËÄ-1²½£º´´½¨ÑçÏ¯£¬ÁìÈ¡½±Àø
function devil_kill_all_suc()
	local boss_index = GetMissionV(MS_feast_boss_index)
	feast_boss_chat(boss_index)
	player_revive()
	--¹Ø¿¨µÈ¼¶´¦Àí
	SetMissionV(Ms_feast_deputy_step,2)
	--ÑçÏ¯´´½¨
	feast_crt()
	--ÁìÈ¡½±ÀøÊ±¼ä30s
	SetMissionV(MS_feast_timmer_deputy_loop_ID,feast_prize_get_num)		--ÉèÖÃÎª-1Ôò²»¼ÆÊı
	SetMissionV(Ms_feast_forstep_time,GetTime())
end
--µÚËÄ-2²½£ºĞ¡¹ÖÎ´±»É±Íê
function devil_kill_all_fail()
	local boss_index = GetMissionV(MS_feast_boss_index)
	feast_boss_chat(boss_index)
	player_revive()
	--¹Ø¿¨µÈ¼¶´¦Àí
	SetMissionV(Ms_feast_deputy_step,3)
	--ÔİÍ£Ê±¼ä30s
	SetMissionV(MS_feast_timmer_deputy_loop_ID,feast_prize_get_num)		--ÉèÖÃÎª-1Ôò²»¼ÆÊı
	--ÏÂÒ»½×¶Î¼ÆÊıÆ÷
	SetMissionV(Ms_feast_forstep_time,GetTime())
	Zgc_pub_mission_fun(FEAST_MS_ID,"StartTimeGuage(\"Thêi gian tiÕp tôc tû vâ cßn\","..feast_prize_get_num..",0,2)")
	feast_devil_clear()
end
--µÚÎå²½£º¹Ø¿¨Ê§°Ü
function feast_fail()
	local boss_index = GetMissionV(MS_feast_boss_index)
	SetNpcLifeTime(boss_index,0)
	--Ğ¡¹ÖÇå³ı
	feast_devil_clear()
	--×ªÎª¶Ô»°npc
	--ÉèÖÃ¹Ø¿¨²½Öè
	local log_mission_step = GetMissionV(Ms_feast_step)
	SetMissionV(Ms_feast_step,8)
	SetMissionV(MS_feast_timmer_deputy_loop_ID,-1)
	--ÉèÖÃ¹Ø¿¨×´Ì¬ÎªµÈ´ı½áÊø
	SetMissionV(MS_TIMMER_LOOP_ID,58)
	Zgc_pub_mission_fun(FEAST_MS_ID,"StartTimeGuage(\"Thêi gian hÕt yÕn tiÖc cßn\",60,0,1)")
	player_revive()
	local map_id =  SubWorldIdx2ID(SubWorld)
	WriteLog("[YÕn tiÖc Long M«n]cöa ¶i: 	"..map_id.."	Cöa ¶i 1 ®ang ®­îc ®ãng	"..log_mission_step.."	Sè ng­êi	"..GetMissionV(MS_PLAYER_NUM).."")
end
--¹Ø¿¨½áÊø
function feast_end()
	CloseMission(FEAST_MS_ID)
end
--¸´»îÍæ¼Ò
function player_revive()
	local nMapID = SubWorldIdx2ID(SubWorld)
	local player = mf_GetMSPlayerIndex(FEAST_MS_ID,0,nMapID)
	for i = 1, getn(player) do
		PlayerIndex = player[i]
		if IsPlayerDeath() == 1 then
			RevivePlayer(0)
		end
	end 
end
--bossË²ÒÆ
function boss_now_pos()
	local boss_index = GetMissionV(MS_feast_boss_index)
	local rand_seq = random(1,getn(Tb_npc_newpos))
	NpcChat(boss_index,Tb_npc_newpos_dialog[random(1,getn(Tb_npc_newpos_dialog))])
	SetNpcPos(boss_index,Tb_npc_newpos[rand_seq][1],Tb_npc_newpos[rand_seq][2])
	NpcChat(boss_index,Tb_npc_newpos_dialog[random(1,getn(Tb_npc_newpos_dialog))])
end
--*******************ÏµÍ³º¯ÊıÇø***********************
--NPC¶Ô»°ĞÅÏ¢
Tb_feast_npc_dialog = {
	{"Lı Nguyªn Kh¸nh","feast_boss_dialog"},
	{"YÕn tiÖc Long M«n","feast_banquet_dialog"},
}
--¶Ô»°Ö÷º¯Êı
function main()
	local npc_index = GetTargetNpc()
	local npc_name = GetTargetNpcName()
	if tonumber(date("%w")) == 5 and npc_name == "YÕn tiÖc Long M«n" then
		Talk(1,"","YÕn tiÖc chØ ®­îc chiªu ®·i vµo ngµy thø 7!")
		return
	end
	for i = 1,getn(Tb_feast_npc_dialog) do
		if npc_name == Tb_feast_npc_dialog[i][1] then
			dostring(Tb_feast_npc_dialog[i][2].."("..npc_index..")")
		end
	end	
end
--ÀîÔªÇì¶Ô»°
function feast_boss_dialog(npc_index)
	local stage_step = GetMissionV(Ms_feast_step)
	local npc_dialog = {}
	--µÚÒ»²½ºÍµÚÆß²½¶¼Ö»ÓĞÒ»´Î¶Ô»°
	if stage_step == 1 or stage_step == 7 or stage_step == 8 then
		npc_dialog = Tb_boss_step_dialog[stage_step]
	else
		local stage_deputy_step = GetMissionV(Ms_feast_deputy_step)
		npc_dialog = Tb_boss_step_dialog[stage_step][stage_deputy_step]
	end
	--¶Ô»°¿ªÊ¼
	if random(1,5) == 3 then
		feast_boss_chat(npc_index)
	end
	Talk(1,"",npc_dialog[random(1,getn(npc_dialog))])
end
--NPCº°»°
function feast_boss_chat(npc_index)
	local stage_step = GetMissionV(Ms_feast_step)
	local npc_chat = {}
	--µÚÒ»²½ºÍµÚÆß²½¶¼Ö»ÓĞÒ»´Î¶Ô»°
	if stage_step == 0 then
		return
	end
	if stage_step == 1 or stage_step == 7 or stage_step == 8 then
		npc_chat = Tb_boss_step_chat[stage_step]
	else
		local stage_deputy_step = GetMissionV(Ms_feast_deputy_step)
		npc_chat = Tb_boss_step_chat[stage_step][stage_deputy_step]
	end
	NpcChat(npc_index,npc_chat[random(1,getn(npc_chat))])
end
--ÑçÏ¯¶Ô»°
function feast_banquet_dialog(feast_index)
	Say("<color=green>Lı Nguyªn Kh¸nh<color>: Trung nguyªn qu¶ nhiªn cao thñ v« sè, trËn nµy thËt s¶ng kho¸i! R­îu T©y H¹ nång nµn ng©y ngÊt, rÊt thİch hîp c¸c vŞ hµo kiÖt, mêi dïng! Cßn mét sè thø cña T©y H¹, c¸c vŞ h·y nhËn lÊy!",
	3,
	"Th­ëng thøc r­îu thŞt/feast_restore",
	"NhËn lÊy phÇn th­ëng./feast_get_prize",
	"Rêi khái yÕn tiÖc/end_dialog"
	)
end
function feast_get_prize()
	local stage_step = (GetMissionV(Ms_feast_step) -1 )
	local prize_step = GetTask(TaskID_feast_prize_step) 
	if prize_step >= min(6,stage_step) then
		Talk(1,"","<color=green>Nh¾c nhë<color>: Mçi phÇn th­ëng chØ nhËn 1 lÇn!")
		return
	else
		stage_step = min(6,stage_step)
		SetTask(TaskID_feast_prize_step,stage_step)
		--½±Àø·¢·Å
		--¾­Ñé
		local prize_T = 60/GetMissionV(Ms_feast_waste_sec_num)
		local exp_num = floor(min(feast_exp_prize_max[Sever_diff][stage_step],(Tb_feast_mis_prirze[Sever_diff][stage_step][1] * prize_T)))
		ModifyExp(exp_num)
		Msg2Player("Chóc mõng b¹n nhËn ®­îc "..exp_num.." ®iÓm kinh nghiÖm!")
			--½¡¿µ¾­Ñé
		if Sever_diff == 1 then
			local exp_chg_num = min(GetGoldenExp(),floor((Tb_feast_mis_prirze[Sever_diff][stage_step][2] * prize_T)),feast_exp_chg_prize_max[stage_step])
			if exp_chg_num ~= 0 then
				ModifyGoldenExp(-exp_chg_num)
				ModifyExp(exp_chg_num)
				Msg2Player("Chóc mõng b¹n ®· ®æi "..exp_chg_num.." ®iÓm søc kháe thµnh kinh nghiÖm!")
			else
				Msg2Player("§iÓm søc kháe cña b¹n lµ 0, kh«ng thÓ ®æi thµnh kinh nghiÖm!")
			end
		end
		--ÁéÊ¯
		for i = 1,Tb_feast_mis_prirze[Sever_diff][stage_step][3][3] do
				local linshi_level = random(Tb_feast_mis_prirze[Sever_diff][stage_step][3][1],Tb_feast_mis_prirze[Sever_diff][stage_step][3][2])
				lspf_AddLingShiInBottle(linshi_level,1)
				Msg2Player("B¹n nhËn ®­îc 1 viªn cÊp "..linshi_level.." Linh th¹ch, ®· cho vµo Tô Linh ®Ønh!")
		end
			--ÌØĞ§²ÄÁÏ1
		local ran_num = 0
		for i = 4,5 do
			ran_num = random(1,100)
			if getn(Tb_feast_mis_prirze[Sever_diff][stage_step][i]) ~= 0 then
				for j = 1,getn(Tb_feast_mis_prirze[Sever_diff][stage_step][i][1]) do
					if ran_num <= Tb_feast_mis_prirze[Sever_diff][stage_step][i][1][j] then
						local mertiral_seq = Tb_feast_mis_prirze[Sever_diff][stage_step][i][3][j]
						local mertiral_num = Tb_feast_mis_prirze[Sever_diff][stage_step][i][2][j]
						local add_flag = AddItem(Tb_add_mertiral[mertiral_seq][1],Tb_add_mertiral[mertiral_seq][2],Tb_add_mertiral[mertiral_seq][3],mertiral_num)
						if add_flag == 1 then
							Msg2Player("Chóc mõng b¹n nhËn ®­îc "..mertiral_num.."c¸i"..Tb_add_mertiral[mertiral_seq][4].."!")
						else
						WriteLog("Cöa ¶i vïng T©y B¾c: ¶i 7, ng­êi ch¬i ["..GetName().."]t¨ng thªm "..mertiral_num.."c¸i"..Tb_add_mertiral[mertiral_seq][4].." thÊt b¹i, kı hiÖu:"..add_flag)
						end
					end
				end
			end
		end
		--¸öÈËĞÅÏ¢
		Msg2Player("B¹n ph¸t hiÖn cã mét sè vËt kú l¹ trong yÕn tiÖc ph¸t s¸ng lÊp l¸nh, cã thÓ lµ b¶o vËt T©y H¹ do Lı Nguyªn Kh¸nh mang ®Õn!")
	end
end
--Íæ¼ÒÈ«»Ø
function feast_restore()
	RestoreAll()
	Msg2Player("Kh«ng biÕt lo¹i r­îu T©y H¹ nµy ®­îc nÊu nh­ thÕ nµo, nÕm vµo miÖng ®· thÊy mïi vŞ ®Ëm ®µ, d­ vŞ ng©y ngÊt, b¹n lËp tøc c¶m thÊy ®Çu ãc s¸ng suèt dÔ chŞu, thÓ lùc håi phôc rÊt nhanh!")
end
--´´½¨¾ÆÏ¯
function feast_crt()
	local map_id =  SubWorldIdx2ID(SubWorld)
	local big_feast_index = CreateNpc("Long M«n ®¹i yÕn tiÖc","YÕn tiÖc Long M«n",map_id,Tb_feast_npc_info[7][3],Tb_feast_npc_info[7][4])
	SetNpcScript(big_feast_index,Tb_feast_npc_info[7][5])
	SetNpcLifeTime(big_feast_index,30)
	local feast_num,feast_index = CreateNpc("yÕn tiÖc Long M«n","YÕn tiÖc Long M«n",map_id,Tb_feast_npc_info[7][3],Tb_feast_npc_info[7][4],-1,20,2,Tb_feast_npc_info[7][6])
	for i = 0,getn(feast_index) do
		SetNpcScript(feast_index[i],Tb_feast_npc_info[7][5])
		SetNpcLifeTime(feast_index[i],30)
	end
	--¼ÆÊ±Æ÷Í£Ö¹
	Zgc_pub_mission_fun(FEAST_MS_ID,"StopTimeGuage(2)")
	--ÏÂÒ»½×¶Î¼ÆÊıÆ÷
	Zgc_pub_mission_fun(FEAST_MS_ID,"StartTimeGuage(\"Thêi gian nhËn th­ëng cßn\","..feast_prize_get_num..",0,2)")
end
--npcËÀÍöĞÅÏ¢
Tb_feast_npc_death = {
	{"Lı Nguyªn Kh¸nh","boss_death()"},
	{"NhÊt PhÈm §­êng T©n BŞ","devil_death(npc_index)"},
	{"NhÊt PhÈm §­êng Thİch Kh¸ch","devil_death(npc_index)"},
	{"NhÊt PhÈm §­êng Phi Hé","devil_death(npc_index)"},
	{"NhÊt PhÈm §­êng Hæ Dùc","devil_death(npc_index)"},
	{"NhÊt PhÈm §­êng Vò VÖ","devil_death(npc_index)"},
}
--ËÀÍöÖ÷º¯Êı
function OnDeath(npc_index)
	for i = 1,getn(Tb_feast_npc_death) do
		if GetNpcName(npc_index) == Tb_feast_npc_death[i][1] then
			dostring(Tb_feast_npc_death[i][2])
			break
		end
	end
end
--ÀîÔªÇìËÀÍö
function boss_death()
	--Ê±¼ä¼ÆËã
	SetMissionV(Ms_feast_waste_sec_num,(GetTime()-GetMissionV(Ms_feast_forstep_time)))
	--×ªÎª¶Ô»°NPC
	local boss_index = GetMissionV(MS_feast_boss_index)
	SetNpcLifeTime(boss_index,0)
	local map_id =  SubWorldIdx2ID(SubWorld)
	boss_index = CreateNpc(Tb_feast_npc_info[1][1],Tb_feast_npc_info[1][2],map_id,Tb_feast_npc_info[1][3],Tb_feast_npc_info[1][4])
	SetNpcScript(boss_index,Tb_feast_npc_info[1][5])
	ChangeNpcToFight(boss_index,0,6)
	AddUnitStates(boss_index,7,0)
	SetMissionV(MS_feast_boss_index,boss_index)
	--½±ÀøÁìÈ¡
	local mis_step = (GetMissionV(Ms_feast_step) + 1)
	SetMissionV(Ms_feast_step,mis_step)
	--»÷É±½±Àø(³ÆºÅ)
	if PlayerIndex ~= 0 and PlayerIndex ~= nil then
		AddTitle(60,8)
		SetCurTitle(60,8)
		SetTitleTime(60,8,(GetTime() +( 7 * 86400)))
		Zgc_pub_mission_fun(FEAST_MS_ID,"Msg2Player(\""..GetName().."  t¹i yÕn tiÖc Long M«n, dïng mét chiªu hiÓm hãc ®¸nh b¹i NhÊt PhÈm §­êng Lı Nguyªn Kh¸nh, c¸c anh hïng tung hoµnh T©y Vùc còng cïng Lı Nguyªn Kh¸nh ®ä søc, qu¶ thùc hµo khİ bõng bõng!\")")
		AddGlobalNews(GetName().."  t¹i yÕn tiÖc Long M«n, dïng mét chiªu hiÓm hãc ®¸nh b¹i NhÊt PhÈm §­êng Lı Nguyªn Kh¸nh, ®¹t ®­îc danh hiÖu 'Tung Hoµnh T©y H¹', anh hïng c¸c ph¸i còng cïng Lı Nguyªn Kh¸nh ®ä søc, qu¶ thùc hµo khİ bõng bõng!")
	end
	feast_devil_clear()
	SetMissionV(Ms_feast_step,8)
	SetMissionV(MS_feast_timmer_deputy_loop_ID,-1)
	--ÉèÖÃ¹Ø¿¨×´Ì¬ÎªµÈ´ı½áÊø
	local log_time_loop_num = GetMissionV(MS_TIMMER_LOOP_ID)
	SetMissionV(MS_TIMMER_LOOP_ID,59)
	Zgc_pub_mission_fun(FEAST_MS_ID,"StartTimeGuage(\"Thêi gian hÕt yÕn tiÖc cßn\",60,0,1)")
	if tonumber(date("%w")) == 5 then
		local player = mf_GetMSPlayerIndex(FEAST_MS_ID,0,map_id)
		for i = 1, getn(player) do
			PlayerIndex = player[i]
			if IsPlayerDeath() == 0 then
				ModifyExp(10000000)
				Msg2Player("NhËn ®­îc 10000000 ®iÓm kinh nghiÖm.")
				WriteLog("[YÕn tiÖc Long M«n]cöa ¶i: 	"..map_id.."	Cöa ¶i 	".."nhËn 10000000 ®iÓm kinh nghiÖm")
			end
		end
	end
	player_revive()
	Zgc_pub_mission_fun(FEAST_MS_ID,"Task_finish()")
	--log¼ÇÂ¼
	local map_id =  SubWorldIdx2ID(SubWorld)
	WriteLog("[YÕn tiÖc Long M«n]cöa ¶i: 	"..map_id.."	Thêi gian qua ¶i cöa ¶i 2	"..Zgc_pub_time_sec_change((3060 - log_time_loop_num),1).."	Sè ng­êi	"..GetMissionV(MS_PLAYER_NUM).."")
end
--ÈÎÎñÍê³É
function Task_finish()
	--ÈÎÎñ½ø¶È
	if GetTask(Tb_stage7_sign_task_info[1]) == Tb_stage7_sign_task_info[2] then
		SetTask(Tb_stage7_sign_task_info[1],(Tb_stage7_sign_task_info[2]+1))
		Msg2Player("Cuèi cïng ®· ®¸nh b¹i NhÊt PhÈm §­êng Lı Nguyªn Kh¸nh, mau quay vÒ håi b¸o KhÊu ChuÈn ë BiÖn Kinh.")
		TaskTip("Cuèi cïng ®· ®¸nh b¹i NhÊt PhÈm §­êng Lı Nguyªn Kh¸nh, mau quay vÒ håi b¸o KhÊu ChuÈn ë BiÖn Kinh.")
	end
end
--Ğ¡¹ÖËÀÍö
function devil_death(npc_index)
	local devil_killed_num = GetMissionV(Ms_feast_devil_kill_num)
	if devil_killed_num == (feast_devil_num - 1) then
		devil_kill_all_suc()
	else
		SetMissionV(Ms_feast_devil_kill_num,(devil_killed_num+1))
	end
	SetNpcLifeTime(npc_index,5)
end
--********************¹«¹²º¯ÊıÇø********************
--Ğ¡¹ÖÇåÀíº¯Êı
function feast_devil_clear()
	--ÇåÀíĞ¡¹Ö
	local mission_step = GetMissionV(Ms_feast_step)
	local map_id = SubWorldIdx2ID(SubWorld)
	local npc_total_index = GetMapNpcIdx(map_id)
	local npc_num = getn(npc_total_index)
	if npc_num < 1 then
		return
	else
		for i = 1,npc_num do
			if GetNpcName(npc_total_index[i]) ~= Tb_feast_npc_info[1][2] and GetNpcName(npc_total_index[i]) ~= Tb_feast_npc_info[7][2] then
				SetNpcLifeTime(npc_total_index[i],0)
			end
		end
	end
end
--ÏµÍ³¹ã²¥º¯Êı
function feast_broadcast()
	local start_remian_sec_num = (GetMissionV(MS_TIMMER_LOOP_ID)-3060)
	AddGlobalNews("YÕn tiÖc Long M«n sÏ b¾t ®Çu: Mêi ng­êi ch¬i ®Õn Long M«n trÊn t×m Npc TiÓu NhŞ ®¨ng kı qua ¶i. Thêi gian kÕt thóc ®¨ng kı cßn "..Zgc_pub_time_sec_change((start_remian_sec_num-1),0).."KÕt thóc!")
end
