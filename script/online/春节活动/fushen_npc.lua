
--ĞŞ¸Ä£º1¡¢´å³¤20070123ĞŞ¸Ä±¾½Å±¾£¬Ôö¼Ó»ªÉ½¾º¼¼Ïà¹ØÄÚÈİ
Include("\\script\\online\\´º½Ú»î¶¯\\newyear_head.lua")	
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı
--==========================¹«¹²±äÁ¿¶¨ÒåÇøÓò=============================
	huashan_in_num_per_minit_max = 10				--Ã¿·ÖÖÓ¿É½øÈëÊıÁ¿Îª10ÈË
	huashan_in_minit_seq = 0
	huashan_in_num_per_minit = 0
--==============================Ö÷Âß¼­ÇøÓò===============================
function fushen_main(npc_index)
	SetTaskTemp(164,npc_index)				--Ğ´Èë¸£ÉñµÄË÷Òı
	--¼ÓÉÏµÈ¼¶ÅĞ¶Ï
	if spring_2007_date_chk() == 1 then
		local selTab = {
					"Ta muèn nhËn hép quµ n¨m míi./get_present",
					"Ta ph¶i ®Õn Hoa S¬n tham gia lÔ Héi Hoa S¬n./goto_huashan",
					"S¾p xÕp thêi gian ho¹t ®éng n¨m míi/time_plan",
					"T×m hiÓu néi dung ho¹t ®éng n¨m míi/spring_info_choice",
					"NhËn mét quyÓn ChØ nam ho¹t ®éng xu©n/spr_book_add",
					"§a t¹ Phóc ThÇn!/nothing"
					}
		Say("Nh©n dŞp n¨m míi ta cã chót quµ tÆng mäi ng­êi, chóc mäi ng­êi n¨m míi vui vÎ!",getn(selTab),selTab)
	else
		Say("Xu©n ®· vÒ, mäi ng­êi h©n hoan chµo ®ãn, kh¾p mäi n¬i thËt lµ nhén nhŞp!",0)
	end
end

function get_present()
	if gf_JudgeRoomWeight(1,10) ~= 1 then
		Talk(1,"","Kho¶ng trèng trong hµnh trang kh«ng ®ñ!");
		return 0;
	end;
	local nDate = tonumber(date("%Y%m%d"))
	if Check_Date() == -1 then 	--´º½Ú»î¶¯»¹Ã»¿ªÊ¼
		Say("H·y an t©m, mäi ng­êi ®Òu cã quµ!",0)
		return 0		
	end
	if Check_Date() == 1 then	--´º½Ú»î¶¯½áÊø
		Say("TÕt ®· qua, hép quµ n¨m míi ®· bŞ ng­êi ch¬i lÊy hÕt råi. ThËt ¸y n¸y, n¨m sau ta nhÊt ®Şnh mang nhiÒu quµ h¬n!",0)
		return 0
	end
	if GetLevel() < 10 then
		Say("Ng­¬i ch­a ®¹t ®Õn cÊp 10, kh«ng thÓ nhËn hép quµ n¨m míi!",0)
		return 0
	end
	if GetTask(TASK_GOT_PRESENT) ~= GetCurDate() then	--ĞÂµÄÒ»Ìì£¬ÒÑÁìÈ¡ÀñÎï±ê¼ÇÇå0
		SetTask(TASK_GOT_PRESENT,0)
	end
	if GetTask(TASK_GOT_PRESENT) ~= 0 then	--Èç¹û½ñÌìÒÑ¾­ÁìÈ¡¹ıĞÂÄêÀñÎï
		Say("H«m nay ng­¬i ®· nhËn quµ, ngµy mai quay l¹i nhĞ!",0)
		return 0
	end
	local nHour = GetLocalTime()
	if GetGlbValue(GLB_PRESENT_NUM) == 0 then	--ÀñÎï·¢ÍêÁË
		local strSex = gf_GetPlayerSexName();
		Say("Hép quµ n¨m míi ®· bŞ lÊy hÕt råi,"..strSex.."Thêi gian ph¸t quµ: <color=yellow>10, 14 vµ 20 giê<color>. Sè l­îng quµ cã h¹n, nhí ®Õn sím nhĞ!",0)
		return 0
	end
	if AddItem(2,0,628,1) == 1 then
		WriteLog("[Ho¹t ®éng mïa xu©n Phóc ThÇn]:"..GetName().."T¹i"..g_sPlace.."NhËn ®­îc quµ may m¾n cña Phóc ThÇn")
		SetTask(TASK_GOT_PRESENT,GetCurDate())
		Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 hép quµ n¨m míi!")
		local present_left = GetGlbValue(GLB_PRESENT_NUM) - 1
		if present_left < 0 then
			SetGlbValue(GLB_PRESENT_NUM,0)
		end
		SetGlbValue(GLB_PRESENT_NUM,present_left)
		if present_left == 0 then	--Ã»ÓĞÀñÎïÊ£ÓàÁË£¬¿ì·¢»î¶¯½áÊøµÄ¹«¸æ°É
			Msg2Global("Ho¹t ®éng"..g_sPlace.."ThËt ®¸ng tiÕc, Phóc ThÇn ®· ph¸t hÕt quµ. LÇn sau nhí ®Õn sím nhĞ!")
			return 1
		end
		if mod(present_left,10) == 0 then	--Ö»¹«¸æ10´Î
			Msg2Global(g_sPlace.." cßn "..present_left.." phÇn quµ n¨m míi ®îi ng­êi ch¬i ®Õn nhËn")
		end
	end
end

function know_detail()
	Say("Tõ ngµy 9 ®Õn ngµy 25 th¸ng 2, mçi ngµy (<color=yellow>10 giê, 14 giê vµ 20 giê<color>) ®Õn chç ta nhËn quµ may m¾n!",0)
end
--==========================»ªÉ½¾º¼¼Ïà¹Ø==========================
--***************************´«ËÍµ½»ªÉ½***************************
function goto_huashan()
	if GetPlayerRoute() == 0 then
		Talk(1,"","Ch­a gia nhËp m«n ph¸i kh«ng thÓ tham gia ho¹t ®éng Hoa S¬n C¶nh Kü!")
		return
	else
		local time_distance = 64800 - Zgc_pub_today_sec_num_rtn()
		if time_distance < 0 then
			local player_in_time_distance =  GetTime() - GetTask(991)
			if player_in_time_distance < 600 then
				Talk(1,"","Vµo Hoa S¬n c¸ch nhau 10 phót, ng­¬i cßn"..Zgc_pub_time_sec_change((600-player_in_time_distance),0).." míi cã thÓ vµo")
				return
			end
		else
			Talk(1,"","Ho¹t ®éng Hoa S¬n ch­a më, xin chê"..Zgc_pub_time_sec_change(time_distance,0).."_cã thÓ vµo!")
			return
		end
		local minit_seq_now = floor(GetTime()/60)
		if minit_seq_now < huashan_in_minit_seq or (huashan_in_minit_seq == minit_seq_now and huashan_in_num_per_minit > huashan_in_num_per_minit_max) then
			Talk(1,"","Sè ng­êi tham gia ®· ®ñ, xin ®îi"..(((minit_seq_now+1)*60) - GetTime()).." gi©y!")
			return
		elseif huashan_in_minit_seq > minit_seq_now then
			huashan_in_num_per_minit = 0
		end
		huashan_in_minit_seq = minit_seq_now
		huashan_in_num_per_minit = huashan_in_num_per_minit + 1
		SetDeathPunish(0)
		Msg2Player("B¹n ®· ®æi sang tr¹ng th¸i PK!")
		SetFightState(1)
		NewWorld(969,1633,3263)
	end	
end
--*************************»ªÉ½»î¶¯ÏêÇé***************************
function huashan_fight_inf()
	
end
function nothing()

end
--************************»î¶¯ËµÃ÷******************************
function time_plan()

	local str_talk = "Cung hØ ph¸t tµi! Thêi gian ho¹t ®éng t©n niªn tõ <color=yellow>09-02-2007<color> ®Õn <color=yellow>25-02<color>, cô thÓ nh­ sau: \n 10:00: Phóc ThÇn ph¸t hång bao \n 12:00: móa l©n \n 14:00: Phóc ThÇn ph¸t hång bao \n 16:00: Móa l©n \n 18:00: §o¹t b¶o r­¬ng \n 20h:00: Phóc ThÇn ph¸t hång bao \n 22:00: Móa l©n"

	 Talk(1,"",str_talk)

end

function spring_info_choice()

	local selTab = {
			"Online tÆng quµ/#spring_info(1)",
			"Phóc ThÇn ph¸t hång bao/#spring_info(2)",
			"Móa l©n/#spring_info(3)",
			"§o¹t b¶o r­¬ng/#spring_info(4)",
			"Heo vµng ®em ®Õn c¸t t­êng/#spring_info(5)",
			"Chóc tÕt/#spring_info(6)",
			"N¨m míi mÆc ®å míi./#spring_info(7)",
			"Niªn thó lµm thó c­ìi/#spring_info(8)",
			"Rêi khái/nothing"
			}
	
	Say("N¨m míi ®Õn råi! Mäi ng­êi chuÈn bŞ thËt nhiÒu quµ, nhÊp vµo tªn ho¹t ®éng t­¬ng øng ®Ó xem chi tiÕt.",getn(selTab),selTab);

end


function spring_info(nType)

local selTab = {
	{
	"    Ng­êi ch¬i cÊp 10 trë lªn, mçi ngµy cã thÓ ®Õn gÆp LÔ Quan ë BiÖn Kinh ®Ó nhËn tói TiÓu phóc Kim Tr­. Mçi ngµy chØ nhËn ®­îc 1 lÇn.",
		},
	
	{
	"    Ng­êi ch¬i tõ cÊp 10 trë lªn vµo lóc 10:00, 14:00, 20:00 ®Õn Phóc ThÇn ®Ó nhËn TiÓu Hång Bao. Mçi ngµy Phóc ThÇn chØ ph¸t 100 c¸i, ­u tiªn cho nh÷ng ng­êi ®Õn tr­íc (mçi ngµy chØ nhËn ®­îc 1 lÇn )",
		},
		
	{
	"    Ho¹t ®éng móa l©n sÏ xuÊt hiÖn bªn ngoµi ë 3 thµnh thŞ chİnh. Ng­êi ch¬i nÕu ®¸nh b¹i ®­îc Niªn Thó sÏ gäi ®­îc 20 tiÓu Niªn Thó kh¸c, nhÊp vµo tiÓu Niªn Thó sÏ nhËn ®­îc §¹i Hång Bao. (ChØ dµnh cho ng­êi ch¬i cÊp 10 trë lªn)",
		},
		
	{
	"    Mçi ngµy tõ 18:00 trªn ®Ønh Hoa S¬n sÏ xuÊt hiÖn mét b¶o r­¬ng. Ng­êi ch¬i (®· gia nhËp m«n ph¸i) ®Õn gÆp Phóc ThÇn, sÏ ®­îc Phóc ThÇn ®­a vµo Hoa S¬n hoÆc cã thÓ mua Hoa S¬n ThÇn phï. Khi vµo Hoa S¬n trËn ®Şa, b¹n sÏ tù ®éng chuyÓn sang tr¹ng th¸i PK vµ ®å s¸t. Trong thêi gian 10 phót b¹n dïng hÕt kh¶ n¨ng h¹ ®èi ph­¬ng ®Ó ®o¹t b¶o r­¬ng.",
		},
		
	{
	"    Kim Tr­ mang ®Õn may m¾n: Trong phÇn th­ëng ho¹t ®éng t©n niªn, may m¾n b¹n còng cã thÓ nhËn ®­îc Tr­ b¶o b¶o. Sö dông b¹n sÏ gäi ®­îc mét chó heo xinh x¾n vµ mét quyÓn  B¶o §iÓn.",
		},
	
	{
	"    Chóc tÕt: Hai ng­êi ch¬i ®øng trong mét ph¹m vi nhÊt ®Şnh. Ng­êi cÊp nhá cung kİnh chóc tÕt ng­êi cÊp cao th× sÏ nhËn ®­îc mét trong 3 phÇn th­ëng sau: §iÓm søc kháe, ®iÓm kinh nghiÖm hoÆc tõ 10 ®Õn 20 ®iÓm danh väng. PhÇn th­ëng nµy phô thuéc vµo ®¼ng cÊp cña 2 bªn. Mçi ngµy ng­êi ch¬i cÊp nhá cã thÓ chóc tÕt ng­êi cÊp cao tèi ®a 3 lÇn, nh­ng ng­êi cÊp cao th× kh«ng bŞ giíi h¹n bëi sè lÇn ®­îc chóc tÕt. (Ho¹t ®éng nµy chØ dµnh cho ng­êi ch¬i tõ cÊp 10 trë lªn)",
		},
		
	{
	"    Khi më quµ Kim Tr­ ( Kim Tr­ tiÓu phóc, Kim Tr­ tiÓu hång bao, Kim Tr­ ®¹i hång bao), sÏ nhËn ®­îc phÇn th­ëng trang phôc Ngo¹i trang t­¬ng øng.",
		},
	{
	"    Khi më quµ Kim Tr­ (Kim Tr­ tiÓu phóc, Kim Tr­ tiÓu hång bao, Kim Tr­ ®¹i hång bao) sÏ cã c¬ may nhËn ®­îc niªn thó. [Chó ı: niªn thó chØ sö dông trong 1 ngµy ( kÓ tõ khi ngåi lªn). HÕt thêi gian niªn thó sÏ biÕn mÊt!]",
		},

	};

	Say("N¨m míi ®· ®Õn, cã rÊt nhiÒu ho¹t ®éng ®Ó nhËn quµ. NhÊp chuét vµo tªn ho¹t ®éng ®Ó xem chi tiÕc! \n"..selTab[nType][1],2,	"trë l¹i/spring_info_choice",
	"Rêi khái/nothing");

end
function spr_book_add()
	AddItem(2,0,614,1)
end
