--08ÎåÒ»»î¶¯ĞùÔ¯¶ÄÍ½½Å±¾
--by vivi
--2008/04/11

Include("\\script\\online\\laborday08\\mah_jong_head.lua");
Include("\\script\\lib\\lingshi_head.lua");	

--==========================¹«¹²±äÁ¿¶¨ÒåÇøÓò=============================
	start_seq = {
		{630,638}, --1Í²ºÍ9Í²µÄÏêÏ¸Ààid
		{639,647}, --Ìõ
		{648,656}, --Íò
		{657,663}  --ÔÓ
		}

tMJaward = { --Í²¡¢Ìõ¡¢Íò¡¢´óËÄÏ²¡¢ÅÆÉñ
	{{5,1},{"NhÊt ThiÓm Yªu Hoµng",2,1,3330,5},{50,51},{"Tói bİ kiÕp s­ m«n",0,0,0,"R­¬ng Thiªn §Şa HuyÒn Hoµng Trang",2,0,1057}},
	{{5,2},{"NhÊt ThiÓm Yªu Hoµng",2,1,3330,10},{50,55,58},{"Ngò Hµnh MËt tŞch",0,107,155,"R­¬ng Thiªn §Şa HuyÒn Hoµng Trang",2,0,1057,"R­¬ng Thiªn §Şa HuyÒn Hoµng Gi¸p",2,0,1056}},
	{{6,1},{"Tam DiÖu Long Hi",2,1,3331,5},{50,70,90,110},{"L¨ng Ba Vi Bé",0	,112,78,"R­¬ng Thiªn §Şa HuyÒn Hoµng Trang",2,0,1057,"R­¬ng Thiªn §Şa HuyÒn Hoµng Gi¸p",2,0,1056,"R­¬ng Thiªn §Şa HuyÒn Hoµng Qu¸n",2,0,1055}},
	{{7,1},{"Tam DiÖu Long Hi",2,1,3331,15},{150,200,250,300},{"R­¬ng Thiªn §Şa HuyÒn Hoµng vò khİ",2,0,1058,"R­¬ng Thiªn §Şa HuyÒn Hoµng Trang",2,0,1057,"R­¬ng Thiªn §Şa HuyÒn Hoµng Gi¸p",2,0,1056,"R­¬ng Thiªn §Şa HuyÒn Hoµng Qu¸n",2,0,1055}},
	{{7,2},{" Thanh §ång ®Ønh cÊp 1",2,1,3213,1}}
}

	tJueYaoBao = {
	{"Tói bİ kiÕp ThiÕu L©m",2,0,607},
	{"Tói bİ kiÕp Vâ §ang",2,0,611},
	{"Tói bİ kiÕp Nga My",2,0,609},
	{"Tói bİ kiÕp C¸i Bang",2,0,610},
	{"Tói bİ kiÕp §­êng M«n",2,0,608},
	{"Tói bİ kiÕp D­¬ng M«n",2,0,612},
	{"Tói bİ kiÕp Ngò §éc",2,0,613}
	}
	
tTiandi = {
	{{"Thiªn §Şa HuyÒn Hoµng Kh«i",0,103,85},{"Thiªn §Şa HuyÒn Hoµng Kh«i",0,103,86},{"Thiªn §Şa HuyÒn Hoµng Kh«i",0,103,87},{"Thiªn §Şa HuyÒn Hoµng Kh«i",0,103,88}},
	{{"Thiªn §Şa HuyÒn Hoµng Gi¸p ",0,100,85},{"Thiªn §Şa HuyÒn Hoµng Gi¸p ",0,100,86},{"Thiªn §Şa HuyÒn Hoµng Gi¸p ",0,100,87},{"Thiªn §Şa HuyÒn Hoµng Gi¸p ",0,100,88}},
	{{"Thiªn §Şa HuyÒn Hoµng Trang",0,101,85},{"Thiªn §Şa HuyÒn Hoµng Trang",0,101,86},{"Thiªn §Şa HuyÒn Hoµng Trang",0,101,87},{"Thiªn §Şa HuyÒn Hoµng Trang",0,101,88}},
	{[0]={{"Thiªn §Şa HuyÒn Hoµng Thñ",0,0,17},{"Thiªn §Şa HuyÒn Hoµng KiÕm ",0,2,39},{"Thiªn §Şa HuyÒn Hoµng C«n",0,5,43},{"Thiªn §Şa HuyÒn Hoµng Khİ ",0,1,56},{"Thiªn §Şa HuyÒn Hoµng Dao",0,3,67},{"Thiªn §Şa HuyÒn Hoµng CÇm",0,10,78},{"Thiªn §Şa HuyÒn Hoµng Bót ",0,9,89},{"Thiªn §Şa HuyÒn Hoµng Tr­îng",0,8,100},{"Thiªn §Şa HuyÒn Hoµng Th­¬ng ",0,6,111},{"Thiªn §Şa HuyÒn Hoµng Cung ",0,4,122},{"Thiªn §Şa HuyÒn Hoµng Tr¶o",0,11,15},{"Thiªn §Şa HuyÒn Hoµng NhÉn ",0,7,15}},
	 [1]={{"Thiªn §Şa HuyÒn Hoµng Thñ",0,0,17},{"Thiªn §Şa HuyÒn Hoµng C«n",0,5,43},{"Thiªn §Şa HuyÒn Hoµng Dao",0,3,67},{"Thiªn §Şa HuyÒn Hoµng Tr­îng",0,8,100}},
	 [2]={{"Thiªn §Şa HuyÒn Hoµng Dao",0,3,67},{"Thiªn §Şa HuyÒn Hoµng C«n",0,5,43}},
	 [3]={{"Thiªn §Şa HuyÒn Hoµng Tr­îng",0,8,100}},
	 [4]={{"Thiªn §Şa HuyÒn Hoµng Thñ",0,0,17}},
	 [5]={{"Thiªn §Şa HuyÒn Hoµng Khİ ",0,1,56}},
	 [6]={{"Thiªn §Şa HuyÒn Hoµng Khİ ",0,1,56}},
	 [7]={{"Thiªn §Şa HuyÒn Hoµng KiÕm ",0,2,39},{"Thiªn §Şa HuyÒn Hoµng CÇm",0,10,78}},
	 [8]={{"Thiªn §Şa HuyÒn Hoµng KiÕm ",0,2,39}},
	 [9]={{"Thiªn §Şa HuyÒn Hoµng CÇm",0,10,78}},
	 [10]={{"Thiªn §Şa HuyÒn Hoµng Thñ",0,0,17},{"Thiªn §Şa HuyÒn Hoµng C«n",0,5,43}},
	 [11]={{"Thiªn §Şa HuyÒn Hoµng Thñ",0,0,17}},
	 [12]={{"Thiªn §Şa HuyÒn Hoµng C«n",0,5,43}},
	 [13]={{"Thiªn §Şa HuyÒn Hoµng KiÕm ",0,2,39},{"Thiªn §Şa HuyÒn Hoµng Bót ",0,9,89}},
	 [14]={{"Thiªn §Şa HuyÒn Hoµng KiÕm ",0,2,39}},
	 [15]={{"Thiªn §Şa HuyÒn Hoµng Bót ",0,9,89}},
	 [16]={{"Thiªn §Şa HuyÒn Hoµng Th­¬ng ",0,6,111},{"Thiªn §Şa HuyÒn Hoµng Cung ",0,4,122}},
	 [17]={{"Thiªn §Şa HuyÒn Hoµng Th­¬ng ",0,6,111}},
	 [18]={{"Thiªn §Şa HuyÒn Hoµng Cung ",0,4,122}},
	 [19]={{"Thiªn §Şa HuyÒn Hoµng Tr¶o",0,11,15},{"Thiªn §Şa HuyÒn Hoµng NhÉn ",0,7,15}},
	 [20]={{"Thiªn §Şa HuyÒn Hoµng NhÉn ",0,7,15}},
	 [21]={{"Thiªn §Şa HuyÒn Hoµng Tr¶o",0,11,15}}}
	};	


	Npc_name = {"<color=green>Hiªn Viªn LÔ<color>:","<color=green>Hiªn Viªn Trung<color>:","<color=green>Hiªn Viªn Nh©n<color>:"}
--==============================Ö÷Âß¼­ÇøÓò===============================
function main(npc_index)
	local map_ID = GetWorldPos()				--¼ÇÂ¼NPCÃû³Æ
	if get_laborday08_award_state() == 1 then
		local npc_dia = {
			"Hay l¾m! Xem ta ra tay ®©y!/mah_jong_suc_list",
			"§¸nh theo quy t¾c nµo vËy? Lµm sao tİnh th¾ng?/mah_jong_suc_inf",
			"Kh«ng biÕt M¹t ch­îc lµ c¸i g×?/what_is_mah_jong",
			"Cuéc thi §ç thÇn tranh b¸ lµ g×?/mah_jong_task_inf",
			"Ta muèn nhËn H­íng dÉn ho¹t ®éng 1-5/#get_something(1)",
			"Ta muèn nhËn 1 'r­¬ng M¹t ch­îc'/#get_something(2)",
			"Ta cßn ph¶i hµnh hiÖp cøu ng­êi, kh«ng r¶nh ®Ó ®¸nh M¹t ch­îc!/end_dialog",
		}
		Say(Npc_name[floor(map_ID/100)].."Ta lµ ®Ö tö cña Hiªn Viªn m«n, gÇn ®©y bæn m«n cã tæ chøc 1 cuéc thi <color=yellow>§ç ThÇn tranh b¸<color>, sao b»ng h÷u kh«ng ®Õn ®ã thö xem. Chó ı thêi gian ho¹t ®éng tõ <color=yellow>28-4 ®Õn 23-5<color>, thêi gian nhËn th­ëng lµ <color=yellow>28-4 ®Õn 23 giê 12-5<color>.",
			getn(npc_dia),
			npc_dia
		)
	elseif get_laborday08_award_state() == 0 then
		Talk(1,"",Npc_name[floor(map_ID/100)].."Cuéc thi §ç thÇn tranh b¸ sÏ diÔn ra tõ 28-4 ®Õn 5-5, 12-5 sÏ kÕt thóc nhËn phÇn th­ëng.");		 
	else
		Talk(1,"",Npc_name[floor(map_ID/100)].."Chóc mõng ph¸t tµi! Cuéc thi §ç thÇn tranh b¸ ®· kÕt thóc.");
	end
end
--*********************************ºúÅÆ¹æÔòËµÃ÷**************************
function mah_jong_suc_inf()
	local map_ID = GetWorldPos()
	Say(Npc_name[floor(map_ID/100)].."D­íi ®©y lµ quy t¾c th¾ng, b¹n muèn ch¬i theo c¸ch nµo?",
	7,
	"Ta muèn biÕt quy t¾c hßa vµ phÇn th­ëng/#mah_jong_rule_dia(1)",
	"Ta muèn biÕt quy t¾c vµ phÇn th­ëng cña Thanh NhÊt S¾c §ång/#mah_jong_rule_dia(2)",
	"Ta muèn biÕt quy t¾c vµ phÇn th­ëng cña Thanh NhÊt S¾c §iÒu/#mah_jong_rule_dia(3)",
	"Ta muèn biÕt quy t¾c vµ phÇn th­ëng cña Thanh NhÊt S¾c V¹n/#mah_jong_rule_dia(4)",
	"Ta muèn biÕt quy t¾c vµ phÇn th­ëng cña §¹i Tø Hû/#mah_jong_rule_dia(5)",
	"Ta muèn biÕt quy t¾c vµ phÇn th­ëng cña Bµi ThÇn/#mah_jong_rule_dia(6)",
	"Tho¸t/end_dialog"
	)
end
function mah_jong_rule_dia(suc_way)
	local map_ID = GetWorldPos()
	local tb_mah_jong_suc_rule = {
		"<color=yellow>Quy t¾c B×nh Hå<color>:\nCÇn <color=yellow>ngÉu nhiªn 14<color> tÊm bµi tøc cã thÓ bãc bµi!\nPhÇn th­ëng: <color=yellow>§iÓm kinh nghiÖm vµ 3 viªn Linh th¹ch cÊp 1-7, ng­êi ch¬i cÊp 99 nhËn ngÉu nhiªn 15 viªn Linh th¹ch cÊp 1-7<color>!",
		"<color=yellow>Quy t¾c Thanh NhÊt S¾c (§ång)<color>:\nCÇn NhÊt §ång ®Õn Cöu §ång <color=yellow>mçi lo¹i 1 tÊm<color>,  §ång kh¸c <color=yellow>ngÉu nhiªn<color> 5 tÊm!\nPhÇn th­ëng: <color=yellow>NhËn ®­îc 5 nguyªn liÖu hiÖu qu¶ ¸nh s¸ng cÊp 1 vµ 1 viªn Linh th¹ch cÊp 5, cã thÓ nhËn ®­îc tói bİ kiÕp l­u ph¸i hiÖn t¹i vµ trang bŞ Thiªn §Şa HuyÒn Hoµng<color>!", 
		"<color=yellow>Quy t¾c Thanh NhÊt S¾c (§iÒu) <color>:\nCÇn NhÊt §iÒu ®Õn Cöu §iÒu <color=yellow>mçi lo¹i 1 tÊm<color>, <color=yellow>ngÉu nhiªn<color> 5 tÊm §iÒu kh¸c!\nPhÇn th­ëng: <color=yellow>NhËn ®­îc 10 nguyªn liÖu hiÖu qu¶ ¸nh s¸ng cÊp 1 vµ 2 viªn Linh th¹ch cÊp 5, cã thÓ nhËn ®­îc Ngò hµnh mËt tŞch vµ trang bŞ Thiªn §Şa HuyÒn Hoµng<color>!", 
		"<color=yellow>Quy t¾c Thanh NhÊt S¾c V¹n<color>:\nCÇn NhÊt V¹n ®Õn Cöu V¹n <color=yellow>mçi lo¹i 1 tÊm<color>, ngoµi ra cã <color=yellow>ngÉu nhiªn<color> 5 tÊm V¹n!\nPhÇn th­ëng: <color=yellow>NhËn ®­îc Nguyªn liÖu hiÖu qu¶ ¸nh s¸ng cÊp 3 vµ 1 viªn Linh th¹ch cÊp 6, cã thÓ nhËn ®­îc bİ kiÕp L¨ng Ba Vi Bé vµ trang bŞ Thiªn §Şa HuyÒn Hoµng<color>!", 
		"<color=yellow>Quy t¾c §¹i Tø Hû<color>:\nCÇn §«ng Phong, Nam Phong, T©y Phong, B¾c Phong <color=yellow>mçi lo¹i 3 tÊm<color>, ngoµi Hång Trung, Ph¸t Tµi, B¹ch BiÖn <color=yellow>ngÉu nhiªn 1 cÆp<color>!\n<color=yellow>PhÇn th­ëng<color>: <color=red>NhËn ®­îc 15 nguyªn liÖu hiÖu qu¶ ¸nh s¸ng cÊp 3 vµ 1 Linh th¹ch cÊp 7, cã thÓ nhËn ®­îc trang bŞ Thiªn §Şa HuyÒn Hoµng<color>!",
		"<color=yellow>Quy t¾c ThÇn bµi<color>:\nCÇn <color=yellow>ngÉu nhiªn<color> <color=yellow>777<color> tÊm M¹t ch­îc!\n<color=yellow>PhÇn th­ëng<color>: <color=red>2 Linh th¹ch cÊp 7 vµ 1 Thanh §ång §Ünh cÊp 1<color>!"
	}
	Talk(1,"mah_jong_suc_inf",Npc_name[floor(map_ID/100)].."\n"..tb_mah_jong_suc_rule[suc_way])
end
--**********************************Âé½«À´Àú******************************
function what_is_mah_jong()
	local map_ID = GetWorldPos()
	Talk(1,"what_is_mah_jong_1",Npc_name[floor(map_ID/100)].."<color=yellow>M¹t Ch­îc<color> vèn cã tªn lµ <color=yellow>M¹t T­íng<color>, M¹t lµ <color=yellow>108<color> vŞ h¶o h¸n cña Thñy Hö truyÖn. cã ng­êi tªn <color=green>V¹n BØnh §iÒu<color> rÊt sïng b¸i h¶o h¸n L­¬ng S¬n B¹c, ®· ph¸t minh ra cê <color=yellow>M¹t Ch­îc<color>, ®em 108 Anh hïng hãa th©n vµo trß ch¬i. M¹t Ch­îc cã tæng céng <color=yellow>108<color> qu©n bµi, vİ nh­ <color=yellow>108<color> vŞ h¶o h¸n. Trong bµi cã <color=yellow>Cöu §iÒu<color> vİ nh­ <color=green>Cöu §iÒu Long Sö TiÕn<color>, <color=yellow>NhŞ §iÒu<color> vİ nh­ <color=green>Song Tiªn H« Diªn Ch­íc<color>, <color=yellow>NhÊt Bİnh<color> vİ nh­ <color=green>H¾c TiÒn Phong Lı Quú<color>.")
end
function what_is_mah_jong_1()
	local map_ID = GetWorldPos()
	Talk(1,"what_is_mah_jong_2",Npc_name[floor(map_ID/100)].."Tæng céng chia lµm 3 lo¹i <color=yellow>V¹n, Bİnh, §iÒu<color>, lÊy hµi ©m cña mçi ng­êi. Mçi lo¹i cã 5 tÊm tõ 1 ®Õn 9 võa ®óng <color=yellow>108<color> tÊm. <color=yellow>108<color> vŞ h¶o h¸n tõ 4 ph­¬ng t¸m h­íng tÒ tô vÒ L­¬ng S¬n cho nªn thªm <color=yellow>§«ng, T©y, Nam, B¾c, Trung<color> 5 h­íng mçi h­íng thªm 4 tÊm tæng céng <color=yellow>20<color> tÊm. C¸c vŞ h¶o h¸n xuÊt th©n tõ nhiÒu tÇng líp kh¸c nhau nªn l¹i thªm <color=yellow>Ph¸t, B¹ch<color> t­îng tr­ng cho giµu nghÌo, céng thªm 8 tÊm nµy tÊt c¶ cã <color=yellow>136<color> tÊm.")
end
function what_is_mah_jong_2()
	local map_ID = GetWorldPos()
	Talk(1,"main",Npc_name[floor(map_ID/100)].."Sau ®ã l¹i céng thªm 4 lo¹i Hoa bµi tæng céng ®· cã <color=yellow>144<color> qu©n bµi. §¸nh M¹t Ch­îc dïng bµn cã 4 h­íng §«ng T©y Nam B¾c, còng lµ chØ 4 mïa xu©n h¹ thu ®«ng, mçi ng­êi <color=yellow>13 qu©n bµi<color> bëi v× mçi quı cã <color=yellow>13 tuÇn <color>. 4 mïa hîp l¹i lµ <color=yellow>52<color> tuÇn, tæng céng <color=yellow>364 ngµy<color>, céng thªm <color=yellow>1 qu©n bµi<color> giê d­, tæng céng cã <color=yellow>365 ngµy<color>, võa ®óng 1 n¨m. ")
end
--**********************************»î¶¯¼òÊö******************************
function mah_jong_task_inf()
	local map_ID = GetWorldPos()
	Talk(1,"main",Npc_name[floor(map_ID/100)].."<color=yellow>Hiªn Viªn m«n<color> ta vèn lµ tæ chøc tËp hîp nhiÒu con b¹c sïng b¸i <color=green>Hiªn Viªn ®¹i hiÖp<color>, mçi n¨m ®Òu tæ chøc cuéc thi §æ ThÇn ®Ó t­ëng nhí <color=green>Hiªn Viªn ®¹i hiÖp<color>. B»ng h÷u cã thêi gian cã thÓ t×m 1 qu©n bµi tèt ®Õn chç ta, ta sÏ c¨n cø sè qu©n bµi thu thËp ®­îc ®Ó tÆng <color=yellow>phÇn th­ëng<color> t­¬ng øng.")
end
--**********************************ºúÅÆ¶Ô»°******************************
function mah_jong_suc_list()
	local map_ID = GetWorldPos()
	local nState = get_laborday08_state();
	if nState == 0 then				--»î¶¯Ê±¼äÅĞ¶Ï
		Talk(1,"mah_jong_task_inf",Npc_name[floor(map_ID/100)].."Cuéc thi §æ ThÇn tranh b¸ vÉn ch­a chİnh thøc b¾t ®Çu. b»ng h÷u cã thÓ xem thuyÕt minh liªn quan ho¹t ®éng")
		return
	elseif nState == 1 then			--ºúÅÆÁĞ±í
		Say(Npc_name[floor(map_ID/100)].."Kh«ng biÕt thiÕu hiÖp cã bµi nµo?",
			7,
			"Ta muèn chän B×nh Hå/#mah_jong_suc_dtm(1)",
			"Ta muèn chän Thanh NhÊt S¾c §ång/#mah_jong_suc_dtm(2)",
			"Ta muèn chän Thanh NhÊt S¾c §iÒu/#mah_jong_suc_dtm(3)",
			"Ta muèn chän Thanh NhÊt S¾c V¹n/#mah_jong_suc_dtm(4)",
			"Ta muèn chän §¹i Tø Hû/#mah_jong_suc_dtm(5)",
			"Ta muèn chän Bµi ThÇn/#mah_jong_suc_dtm(6)",
			"Ta vÉn ch­a chuÈn bŞ/end_dialog"
		)
	else
		Say(Npc_name[floor(map_ID/100)].."<color=yellow>Cuéc thi §ç ThÇn tranh b¸ <color><color=red>®· kÕt thóc<color> nh­ng phÇn th­ëng vÉn cã thÓ ®æi b×nh th­êng, b»ng h÷u muèn ®æi th­ëng <color=red>h·y nhanh lªn<color> kÎo hÕt c¬ héi.",
			7,
			"Ta muèn chän B×nh Hå/#mah_jong_suc_dtm(1)",
			"Ta muèn chän Thanh NhÊt S¾c §ång/#mah_jong_suc_dtm(2)",
			"Ta muèn chän Thanh NhÊt S¾c §iÒu/#mah_jong_suc_dtm(3)",
			"Ta muèn chän Thanh NhÊt S¾c V¹n/#mah_jong_suc_dtm(4)",
			"Ta muèn chän §¹i Tø Hû/#mah_jong_suc_dtm(5)",
			"Ta muèn chän Bµi ThÇn/#mah_jong_suc_dtm(6)",
			"Ta vÉn ch­a chuÈn bŞ/end_dialog"
		)
	end
end
--********************************ºúÅÆÈ·ÈÏ********************************
function mah_jong_suc_dtm(suc_seq)
	local map_ID = GetWorldPos()
	local mah_jong_suc_dia = {
		Npc_name[floor(map_ID/100)].."<color=yellow>B×nh Hå<color> chØ cÇn cã <color=yellow>14 tÊm bµi<color> ngÉu nhiªn lµ cã thÓ ®æi, phÇn th­ëng lµ: <color=yellow>®iÓm kinh nghiÖm vµ 3 viªn Linh th¹ch cÊp 1-7, ng­êi ch¬i cÊp 99 nhËn ®­îc 15 Linh th¹ch cÊp 1-7<color>. B¹n cã tÊm bµi nµo kh«ng muèn nép tù m×nh cÊt nã tr­íc ®i!",
		Npc_name[floor(map_ID/100)].."<color=yellow>Thanh NhÊt S¾c (§ång)<color> CÇn NhÊt §ång ®Õn Cöu §ång <color=yellow>mçi lo¹i 1 tÊm<color>, lo¹i kh¸c <color=yellow>ngÉu nhiªn<color> 5 tÊm, tæng céng <color=yellow>14<color> tÊm §ång!\n    PhÇn th­ëng: <color=yellow>5 nguyªn liÖu hiÖu qu¶ ¸nh s¸ng cÊp 1 vµ 1 Linh th¹ch cÊp 5, cã thÓ nhËn ®­îc tói bİ kiÕp l­u ph¸i hiÖn t¹i vµ trang bŞ Thiªn §Şa HuyÒn Hoµng<color>. B¹n cã tÊm bµi nµo kh«ng muèn nép tù m×nh cÊt nã tr­íc ®i!",
		Npc_name[floor(map_ID/100)].."<color=yellow>Thanh NhÊt S¾c (§iÒu)<color> CÇn NhÊt §iÒu ®Õn Cöu §iÒu <color=yellow>mçi lo¹i 1 tÊm<color>, <color=yellow>ngÉu nhiªn<color> 5 tÊm §iÒu kh¸c!\nPhÇn th­ëng: <color=yellow>NhËn ®­îc 10 nguyªn liÖu hiÖu qu¶ ¸nh s¸ng cÊp 1 vµ 2 viªn Linh th¹ch cÊp 5, cã thÓ nhËn ®­îc Ngò hµnh mËt tŞch vµ trang bŞ Thiªn §Şa HuyÒn Hoµng<color>! B¹n cã tÊm bµi nµo kh«ng muèn nép tù m×nh cÊt nã tr­íc ®i!",
		Npc_name[floor(map_ID/100)].."<color=yellow>Thanh NhÊt S¾c V¹n<color> cÇn NhÊt V¹n ®Õn Cöu V¹n <color=yellow>mçi lo¹i 1 tÊm<color>, ngoµi ra cã <color=yellow>ngÉu nhiªn<color> 5 tÊm V¹n!\nPhÇn th­ëng: <color=yellow>NhËn ®­îc Nguyªn liÖu hiÖu qu¶ ¸nh s¸ng cÊp 3 vµ 1 viªn Linh th¹ch cÊp 6, cã thÓ nhËn ®­îc bİ kiÕp L¨ng Ba Vi Bé vµ trang bŞ Thiªn §Şa HuyÒn Hoµng<color>! B¹n cã tÊm bµi nµo kh«ng muèn nép tù m×nh cÊt nã tr­íc ®i!",
		Npc_name[floor(map_ID/100)].."<color=yellow>§¹i Tø Hû<color> cÇn §«ng Phong, Nam Phong, T©y Phong, B¾c Phong <color=yellow>mçi lo¹i 3 tÊm<color>, ngoµi Hång Trung, Ph¸t Tµi, B¹ch BiÖn <color=yellow>ngÉu nhiªn 1 cÆp<color>!\nPhÇn th­ëng: <color=red>NhËn ®­îc 15 nguyªn liÖu hiÖu qu¶ ¸nh s¸ng cÊp 3 vµ 1 Linh th¹ch cÊp 7, cã thÓ nhËn ®­îc trang bŞ Thiªn §Şa HuyÒn Hoµng<color>! B¹n cã tÊm bµi nµo kh«ng muèn nép tù m×nh cÊt nã tr­íc ®i!",
		Npc_name[floor(map_ID/100)].."<color=yellow>ThÇn bµi<color> CÇn <color=yellow>ngÉu nhiªn<color> <color=yellow>777<color> tÊm M¹t ch­îc!\nPhÇn th­ëng: <color=red>2 Linh th¹ch cÊp 7 vµ 1 Thanh §ång §Ünh cÊp 1<color>!",
	}
	Say(mah_jong_suc_dia[suc_seq],
	2,
	"Ta muèn ®æi phÇn th­ëng/#mah_jong_num_chk("..(suc_seq-1)..")",		--½øÈëÊıÁ¿¼ì²â
	"§Ó ta chuÈn bŞ thªm/end_dialog"
	)
end
--********************************Âé½«¼ì²â*****************************
function mah_jong_num_chk(color_diff)
--Êı¾İ×¼±¸
	local map_ID = GetWorldPos()
	local npc_name = Npc_name[floor(map_ID/100)]
--------------------------------------¶Ò»»¼ì²â--------------------------------------
	local tTotalNum = {PIHU_TOTAl_NUM,TONG_TOTAL_NUM,TIAO_TOTAL_NUM,WAN_TOTAL_NUM,SIXI_TOTAL_NUM};
	local tMjTask	= {TASK_MJ_PIHU_RPIZE,TASK_MJ_TONG_RPIZE,TASK_MJ_TIAO_RPIZE,TASK_MJ_WAN_RPIZE,TASK_MJ_SIXI_RPIZE};
	if color_diff ~= 5 then
		if GetTask(tMjTask[color_diff+1]) >= tTotalNum[color_diff+1] then
			Talk(1,"",npc_name.."Quy t¾c hå bµi nµy tèi ®a cã thÓ ®æi "..tTotalNum[color_diff+1].." lÇn, b¹n ®· ®æi xong.");
			return
		end
	end
--------------------------------------ÊıÁ¿¼ì²â--------------------------------------
	local mah_jong_id_start = 0
	local mah_jong_id_end = 0
	if color_diff == 0 or color_diff == 5 then			--¶¨ÒåÂé½«ÊıÁ¿µÄ¿ªÊ¼¼ÆËãIDºÍ½áÊø¼ÆËãID
		mah_jong_id_start = start_seq[1][1]
		mah_jong_id_end = start_seq[4][2]
	else
		mah_jong_id_start = start_seq[color_diff][1]
		mah_jong_id_end = start_seq[color_diff][2]
	end
	local mah_jong_count = 0		--¶¨Òå×ÜµÄÂé½«Êı
	for i = mah_jong_id_start,mah_jong_id_end do
		mah_jong_count = mah_jong_count + GetItemCount(2,0,i)
	end
	--ÊıÁ¿¼ì²â
	if (color_diff ~= 5 and mah_jong_count < 14) or (color_diff == 5 and mah_jong_count < 777) then
		Talk(1,"",npc_name.."B¹n h·y x¸c nhËn trong tói cã <color=yellow>®ñ sè l­îng M¹t ch­îc<color> phï hîp quy t¾c!")
		return
	end
--------------------------------------¹æÔò¼ì²â--------------------------------------
	--¿ªÊ¼¼ì²â
	if color_diff ~= 0 and color_diff ~= 5 then		--Æ½ºúºÍÅÆÉñ²»ĞèÒª¹æÔò¼ì²â
		if color_diff ~= 4 then						--¼ì²âÍ¬ÖÖ»¨É«1-9¸÷Ò»ÕÅ
			for i = start_seq[color_diff][1],start_seq[color_diff][2] do
				if GetItemCount(2,0,i) < 1 then
					Talk(1,"",npc_name.."H·y x¸c nhËn trong tói cã <color=yellow>1 tÊm<color> bµi ®èi xøng 1 ®Õn 9!")
					return
				end
			end
		else
			for i = start_seq[4][1],(start_seq[4][1]+3) do	--¼ì²âËÄ·ç¸÷ÈıÕÅ
				if GetItemCount(2,0,i) < 3 then
					Talk(1,"",npc_name.."H·y x¸c nhËn trong tói b¹n cã §«ng Phong, Nam Phong, T©y Phong vµ B¾c Phong mçi lo¹i <color=yellow>3 tÊm<color>!")
					return
				end
			end
			local double_chk = 0 							--¶Ô×Ó¼ì²â±êÖ¾
			for i = (start_seq[4][1]+4),start_seq[4][2] do
				if GetItemCount(2,0,i) >= 2 then
					double_chk = 1
					break
				end
			end
			if double_chk == 0 then
				Talk(1,"",npc_name.."H·y x¸c nhËn trong tói b¹n cã <color=yellow>1 cÆp<color> Hång Trung, Ph¸t Tµi hoÆc B¹ch BiÖn!")
				return
			end
		end
	end
-------------------------------------°ü¹ü¿Õ¼ä¼ì²â--------------------------------
	if Zgc_pub_goods_add_chk(3,3) ~= 1 then
		return
	end
--------------------------------------É¾³ı¼ì²â--------------------------------------
	local del_chk = 0
	local del_remain_num = 14		--ĞèÒªÉ¾³ı14ÕÅÂé½«
	if color_diff == 0 or color_diff == 5 then
		if color_diff == 5 then
			del_remain_num = 777
		end
		for i = mah_jong_id_start,mah_jong_id_end do
			local mah_jong_num = GetItemCount(2,0,i)
			if mah_jong_num ~= 0 then
				local del_num = min(mah_jong_num,del_remain_num)
				if DelItem(2,0,i,del_num) == 1 then
					del_remain_num = del_remain_num - del_num
				end
			end
			if del_remain_num <= 0 then
				break
			end
		end
	elseif color_diff >= 1 and color_diff <= 3 then
		del_remain_num = 5						--³ıÒ»µ½¾ÅÍòÁíÍâĞèÒªÉ¾³ı5ÕÅ
		for i = start_seq[color_diff][1],start_seq[color_diff][2] do		--Âß¼­±È½Ï¸´ÔÓ
			local mah_jong_num = GetItemCount(2,0,i)
			local del_num = min(mah_jong_num,(del_remain_num + 1))
			if DelItem(2,0,i,del_num) ~= 1 then
				break
			end
			del_remain_num = del_remain_num - (del_num - 1)
		end
	elseif color_diff == 4 then
		del_remain_num = 5
		for i = start_seq[4][1],(start_seq[4][1]+3) do	--É¾³ıËÄ·ç¸÷ÈıÕÅ
			if DelItem(2,0,i,3) ~= 1 then
				break
			end
			del_remain_num = del_remain_num - 1
		end
		for i = (start_seq[4][1]+4),start_seq[4][2] do	--É¾³ı¶Ô×Ó
			if GetItemCount(2,0,i) >= 2 then
				if DelItem(2,0,i,2) == 1 then
					del_remain_num = del_remain_num - 1
					break
				end
			end
		end
	end
	if del_remain_num > 0 then			--É¾³ıÊ§°Ü
		Talk(1,"",npc_name.."H·y x¸c nhËn trong tói b¹n cã M¹t ch­îc phï hîp víi yªu cÇu!")
		return
	end
--------------------------------------- ½±Àø¸øÓÚ-------------------------------------
	if color_diff == 0 then
		local nLv = GetLevel();
		local nExp = floor(nLv*nLv*140);
		SetTask(tMjTask[color_diff+1],GetTask(tMjTask[color_diff+1])+1);
		if nLv ~= 99 then	
			ModifyExp(nExp);
			Msg2Player("Chóc mõng b¹n nhËn ®­îc "..nExp.." kinh nghiÖm.");
			for i=1,3 do	
				laborday08_baoshi_prob("B×nh Hå");
			end
		else
			for i=1,15 do
				laborday08_baoshi_prob("B×nh Hå");
			end
		end
		Talk(1,"",npc_name.."B¹n ®· ®æi hå bµi <color=red>"..GetTask(tMjTask[color_diff+1]).."<color> lÇn, b¹n cßn ®­îc ®æi <color=red>"..(tTotalNum[color_diff+1]-GetTask(tMjTask[color_diff+1])).."<color> lÇn.");		
	else
		lspf_AddLingShiInBottle(tMJaward[color_diff][1][1],tMJaward[color_diff][1][2]);
		Msg2Player("Chóc mõng b¹n nhËn ®­îc "..tMJaward[color_diff][1][1].."Linh th¹ch"..tMJaward[color_diff][1][2].." viªn, nã ®· ®­îc cÊt vµo Tô Linh ®Ønh.");
		AddItem(tMJaward[color_diff][2][2],tMJaward[color_diff][2][3],tMJaward[color_diff][2][4],tMJaward[color_diff][2][5]);
		Msg2Player("Chóc mõng b¹n nhËn ®­îc "..tMJaward[color_diff][2][1]..tMJaward[color_diff][2][5].."c¸i");
		local tHuName = {"Thanh NhÊt S¾c (§ång)","Thanh NhÊt S¾c (§iÒu)","Thanh NhÊt S¾c (V¹n)","§¹i Tø Hû","ThÇn bµi"}
		if color_diff ~= 5 then
			SetTask(tMjTask[color_diff+1],GetTask(tMjTask[color_diff+1])+1);
			Talk(1,"",npc_name.."B¹n ®· ®æi hå bµi <color=red>"..GetTask(tMjTask[color_diff+1]).."<color> lÇn, b¹n cßn ®­îc ®æi <color=red>"..(tTotalNum[color_diff+1]-GetTask(tMjTask[color_diff+1])).."<color> lÇn.");
			local nRand = random(1,1000);
			for i=1,getn(tMJaward[color_diff][3]) do
				if nRand <= tMJaward[color_diff][3][i] then
					if color_diff == 1 and i == 1 then
						local nFaction = GetPlayerFaction();
						if nFaction ~= 0 then
							AddItem(tJueYaoBao[nFaction][2],tJueYaoBao[nFaction][3],tJueYaoBao[nFaction][4],1);
							Msg2Player("Chóc mõng b¹n nhËn ®­îc "..tJueYaoBao[nFaction][1]);
							Msg2Global("Ng­êi ch¬i"..GetName().."Trong cuéc thi ThÇn bµi"..tHuName[color_diff].."NhËn ®­îc"..tJueYaoBao[nFaction][1]);
							WriteLog("Ho¹t ®éng quèc tÕ lao ®éng 08: Ng­êi ch¬i"..GetName().."Trong cuéc thi ThÇn bµi"..tHuName[color_diff].."NhËn ®­îc"..tJueYaoBao[nFaction][1]);
						else
							local nIdx = random(1,7);
							AddItem(tJueYaoBao[nIdx][2],tJueYaoBao[nIdx][3],tJueYaoBao[nIdx][4],1);
							Msg2Player("Chóc mõng b¹n nhËn ®­îc "..tJueYaoBao[nIdx][1]);
							Msg2Global("Ng­êi ch¬i"..GetName().."Trong cuéc thi ThÇn bµi"..tHuName[color_diff].."NhËn ®­îc"..tJueYaoBao[nIdx][1]);
							WriteLog("Ho¹t ®éng quèc tÕ lao ®éng 08: Ng­êi ch¬i"..GetName().."Trong cuéc thi ThÇn bµi"..tHuName[color_diff].."NhËn ®­îc"..tJueYaoBao[nIdx][1]);
						end
					else
						local nId = 4*(i-1)+1; --¶¨Î»id
						AddItem(tMJaward[color_diff][4][nId+1],tMJaward[color_diff][4][nId+2],tMJaward[color_diff][4][nId+3],1);
						Msg2Player("Chóc mõng b¹n nhËn ®­îc "..tMJaward[color_diff][4][nId]);
						Msg2Global("Ng­êi ch¬i"..GetName().."Trong cuéc thi ThÇn bµi"..tHuName[color_diff].."NhËn ®­îc"..tMJaward[color_diff][4][nId]);
						WriteLog("Ho¹t ®éng quèc tÕ lao ®éng 08: Ng­êi ch¬i"..GetName().."Trong cuéc thi ThÇn bµi"..tHuName[color_diff].."NhËn ®­îc"..tMJaward[color_diff][4][nId]);
					end	
					break
				end
			end
		else
			Msg2Global("Ng­êi ch¬i"..GetName().."Trong cuéc thi ThÇn bµi"..tHuName[color_diff].."NhËn ®­îc"..tMJaward[color_diff][1][1].."Linh th¹ch"..tMJaward[color_diff][1][2].." ");
			Msg2Global("Ng­êi ch¬i"..GetName().."Trong cuéc thi ThÇn bµi"..tHuName[color_diff].."NhËn ®­îc"..tMJaward[color_diff][2][1]);
			WriteLog("Ho¹t ®éng quèc tÕ lao ®éng 08: Ng­êi ch¬i"..GetName().."Trong cuéc thi ThÇn bµi"..tHuName[color_diff].."NhËn ®­îc"..tMJaward[color_diff][1][1].."Linh th¹ch"..tMJaward[color_diff][1][2].." viªn vµ "..tMJaward[color_diff][2][1]);
		end
	end				
end

function get_something(nType)
	local tSomething = {{2,1,1114},{2,0,1059}};
	local map_ID = GetWorldPos()				--¼ÇÂ¼NPCÃû³Æ
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	if BigGetItemCount(tSomething[nType][1],tSomething[nType][2],tSomething[nType][3]) >= 1 then
		Talk(1,"",Npc_name[floor(map_ID/100)].."Kh«ng ph¶i ®· cã råi sao?");
		return
	end
	AddItem(tSomething[nType][1],tSomething[nType][2],tSomething[nType][3],1);
end