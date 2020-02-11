--°ÂÔË»î¶¯´óÊ¹
Include("\\script\\online\\olympic\\oly_head.lua")
Include("\\settings\\static_script\\global\\regular_clear_task.lua")
Include("\\script\\lib\\talktmp.lua")

tbSay_201207 = {
	"Giíi thiÖu ho¹t ®éng/introduce_201207",
--	"°ÂÔËĞÒÔË³é½±/oly_lucky_star_201207",
	"Rót th­ëng H¹nh VËn/oly_lucky_star_201207",
	"GhĞp Ngò Th¸i Th¸nh Háa/combining_flame_201207",
	"§o¸n sè nhËn Lam S¾c Th¸nh Háa /guess_flame_201207",
	"§Õn Háa Vùc Cöu Ch©u thu thËp Th¸nh Háa/goto_caji_map_201207",
}

--sTitle_201207 = "»¶Ó­²Î¼Ó°ÂÔË»î¶¯£¬ÊÕ¼¯¸÷É«Ê¥»ğµãÈ¼Ê¥Ì³£¬Ó®È¡ºÃÀñ¡£<color=green>70<color>¼¶ÒÑÈëÁ÷ÅÉÑ§»á<color=green>1<color>Ì×<color=green>55<color>¼¶¼¼ÄÜµÄÈËÊ¿¿ÉÒÔ²Î¼Ó¡£";
sTitle_201207 = "Chóc mõng Phiªn B¶n míi, nhËn h¶o lÔ. CÊp 80 ®· gia nhËp m«n ph¸i häc kü n¨ng 55 ®¹t cÊp tèi ®a cã thÓ tham gia";

Activity_Ds_Name = "<color=green>§¹i Sø ho¹t ®éng: <color>";

sTitle_201207_1 = "T¹i mçi thµnh ThuyÒn Ch©u (165/192), Thµnh §« (180/179), §¹i Lı ( 231/222), T­¬ng D­¬ng (221/195), Ph­îng T­êng (221/195), BiÖn Kinh ( 183/173) ®Òu cã mét Th¸nh Háa §µn";

function introduce_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event ®· hÕt h¹n");
		return 0;
	end
	local tbSay = {
		"Nguån gèc vµ chñng lo¹i Th¸nh Háa/source_201207",
		"PhÇn th­ëng vµ sè lÇn sö dông 5 lo¹i Th¸nh Háa ®Ó th¾p s¸ng/danse_award_201207",
		"PhÇn th­ëng vµ sè lÇn sö dông Ngò Th¸i Th¸nh Háa ®Ó th¾p s¸ng/wucai_award_201207",
--		"Ã¿ÈÕ°ÂÔËĞÒÔËĞÇ³é½±/lucky_star_201207",
		"Rót th­ëng H¹nh VËn Tinh mçi ngµy/lucky_star_201207",
		"\n rót lui/nothing",
	}
	Say(Activity_Ds_Name..sTitle_201207_1,getn(tbSay),tbSay);
end

function source_201207()
	local tbBody = "  \n H¾c S¾c Th¸nh Háa——R¬i ra tõ Boss ¶i L­¬ng S¬n, V¹n KiÕm Tròng;  \n Hoµng S¾c Th¸nh Háa——NhËn ®­îc khi giÕt qu¸i ë Quû M«n Håi Lang;  \n Hång S¾c Th¸nh Háa——R¬i ra tõ Thiªn M«n TrËn;  \n Lôc S¾c Th¸nh Háa——Thu thËp U Minh Hoa ë Quû M«n Håi Lang (cã x¸c suÊt sinh ra khi giÕt chÕt qu¸i vËt);   \n Lam S¾c Th¸nh Háa——NhËn ®­îc khi tham gia ®o¸n sè;  \n Ngò Th¸i Th¸nh Háa——GhĞp ë §¹i Sø ho¹t ®éng hoÆc cã thÓ nhËn ®­îc khi giÕt qu¸i chiªu dô Minh Háa Quû Linh";
	local tbSay = {};
	tbSay.msg = Activity_Ds_Name..tbBody;
	tbSay.sel = {
		{"\n rót lui","nothing"},
	};
	temp_Talk(tbSay);
end

function danse_award_201207()
	local tbBody = format("Sè lÇn: Th¸nh Háa §µn cña mçi thµnh, mçi ngµy cã thÓ ®èt s¸ng 1 lÇn. PhÇn th­ëng: \n céng dån sè lÇn ®iÓm háa + 1; \n exp<color=green>%d<color>; \n ngÉu nhiªn 1 ®¹o cô quı hiÕm, phÇn th­ëng cao nhÊt cã Tinh Kh¾c, trang bŞ Thiªn NghÜa, trang bŞ ngÉu nhiªn v.v.", OLY_EXP_2);
	local tbSay = {
		"Sè lÇn th¾p s¸ng céng dån cã lîi İch g× kh«ng?/fire_used_201207",
		"\n trë vÒ tÇng tr­íc/introduce_201207",
		"Tho¸t/nothing",
	}
	Say(Activity_Ds_Name..sTitle_201207_1..tbBody,getn(tbSay),tbSay);
end

function wucai_award_201207()
	local tbBody = format("Sè lÇn: Cã thÓ ®iÓm háa t¹i bÊt kú Th¸nh Háa §µn cña thµnh thŞ víi sè lÇn bÊt kú. PhÇn th­ëng: \n céng dån sè lÇn ®iÓm háa +1; \n exp<color=green>%d<color>; \n ngÉu nhiªn 1 ®¹o cô quı hiÕm, phÇn th­ëng cao nhÊt cã Linh Th¹ch cÊp 7, Thiªn Cang LÖnh, §Şnh Hån Thiªn Th¹ch Linh Th¹ch, Thiªn Th¹ch Linh Th¹ch, trang bŞ ngÉu nhiªn v.v", OLY_EXP_3);
	local tbSay = {
		"Sè lÇn th¾p s¸ng céng dån cã lîi İch g× kh«ng?/fire_used_201207",
		"\n trë vÒ tÇng tr­íc/introduce_201207",
		"Tho¸t/nothing",
	}
	Say(Activity_Ds_Name..sTitle_201207_1..tbBody,getn(tbSay),tbSay);
end

function fire_used_201207()
	local tbSay = {};
--	tbSay.msg = Activity_Ds_Name.."´ïµ½²»Í¬µÄÀÛ¼Æµã»ğ´ÎÊı»ñµÃ½±ÀøÊ±½«±È»ñµÃÈçÏÂ½±Àø£º\n    50´Î-1¼¶Ç§»Ã¿Ì°å£»100´Î-ÉñĞĞ±¦µä£»150´Î-ÔÉÌú¾«Ê¯£»\n    300´Î-2¼¶Ç§»Ã¿Ì°å£¨¿É»»È¡Ö¸¶¨²¿Î»Ö¸¶¨ÊôĞÔµÄ2¼¶ÔÌÁé£©£»\n    600´Î-»Ô»Í¾ü¹¦ÕÂ£»\n    800´Î-7¼¶ÁéÊ¯£»\n    1000´Î-3¼¶Ç§»Ã¿Ì°å£¨¿É»»È¡Ö¸¶¨²¿Î»Ö¸¶¨ÊôĞÔµÄ3¼¶ÔÌÁé£©£»\n    1200´Î-Ììî¸Áî£»\n	×¢Òâ£ºÁìÈ¡1200´ÎµÄ½±Àøºó£¬ÀÛ¼Æµã»ğ´ÎÊı»áÇåÁã£¬¿ÉÒÔÖØĞÂ¿ªÊ¼ÀÛ»ı¡£\n";
	tbSay.msg = Activity_Ds_Name.."§iÓm háa céng dån ®¹t ®Õn 50 lÇn kh¸c nhau trang bŞ ngÉu nhiªn-1-3 sao; 100 lÇn-Bİ Ng©n To¶n; 200 lÇn-Bİ Ng©n Chïy; 400 lÇn-Qu©n C«ng §¹i; 700 lÇn-Thiªn Th¹ch Tinh Th¹ch; 1000 lÇn-Qu©n C«ng Huy Hoµng; 1300 lÇn-TÈy T©m Th¹ch cÊp 3; 1600 lÇn-LuyÖn L« ThiÕt cÊp 3; 1800 lÇn-Thiªn M«n Kim LÖnh; 2000 lÇn-Thiªn Cang LÖnh; \n Chó ı: Sau khi nhËn phÇn th­ëng 2000 lÇn, sè lÇn ®iÓm háa tİch lòy céng dån sÏ ®­îc lµm míi, cã thÓ tiÕp tôc b¾t ®Çu tİch lòy l¹i tõ ®Çu.";
	tbSay.sel = {
		{"\n rót lui","nothing"},
	};
	temp_Talk(tbSay);
end

function combining_flame_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event ®· hÕt h¹n");
		return 0;
	end
	local tbSay = {
		"GhĞp b»ng Ngò Th¸i ThÇn Th¹ch (b¸n ë Ngù C¸c)/combining_1_201207",
		"GhĞp Th¸nh Háa vµ Vµng/combining_2_201207",
		"\n rót lui/nothing",
	}
	Say(Activity_Ds_Name.."C¸c h¹ muèn chän c¸ch thøc nµo ®Ó ghĞp Ngò Th¸i Th¸nh Háa vËy?",getn(tbSay),tbSay);
end

function combining_1_201207()
	local tbSay = {
		format("GhĞp %d Hång S¾c Th¸nh Háa+%d Ngò Th¸i ThÇn Th¹ch/#begin_combining_1(1)",Compose_ShengHuo_Num_1,Compose_ShenShi_Num_1),
		format("GhĞp %d Lôc S¾c Th¸nh Háa+%d Ngò Th¸i ThÇn Th¹ch/#begin_combining_1(2)",Compose_ShengHuo_Num_1,Compose_ShenShi_Num_1),
		format("GhĞp %d Hoµng S¾c Th¸nh Háa+%d Ngò Th¸i ThÇn Th¹ch/#begin_combining_1(3)",Compose_ShengHuo_Num_1,Compose_ShenShi_Num_1),
		format("GhĞp %d Lam S¾c Th¸nh Háa+%d Ngò Th¸i ThÇn Th¹ch/#begin_combining_1(4)",Compose_ShengHuo_Num_1,Compose_ShenShi_Num_1),
		format("GhĞp %d H¾c S¾c Th¸nh Háa+%d Ngò Th¸i ThÇn Th¹ch/#begin_combining_1(5)",Compose_ShengHuo_Num_1,Compose_ShenShi_Num_1),
		"\n trë vÒ tÇng tr­íc/combining_flame_201207",
		"Tho¸t/nothing",
	}
	Say(Activity_Ds_Name.."1 Th¸nh Háa bÊt kú+1 Ngò Th¸i ThÇn Th¹ch (b¸n ë Ngù C¸c)=1 Ngò Th¸i Th¸nh Háa",getn(tbSay),tbSay);
end

function combining_2_201207()
	local tbSay = {
		format("GhĞp %d Hång S¾c Th¸nh Háa+%d Vµng/#begin_combining_2(1)",Compose_ShengHuo_Num_2,Compose_Coin_Num_2),
		format("GhĞp %d Lôc S¾c Th¸nh Háa+%d Vµng/#begin_combining_2(2)",Compose_ShengHuo_Num_2,Compose_Coin_Num_2),
		format("GhĞp %d Hoµng S¾c Th¸nh Háa+%d Vµng/#begin_combining_2(3)",Compose_ShengHuo_Num_2,Compose_Coin_Num_2),
		format("GhĞp %d Lam S¾c Th¸nh Háa+%d Vµng /#begin_combining_2(4)",Compose_ShengHuo_Num_2,Compose_Coin_Num_2),
		format("GhĞp %d H¾c S¾c Th¸nh Háa+%d Vµng/#begin_combining_2(5)",Compose_ShengHuo_Num_2,Compose_Coin_Num_2),
		"\n trë vÒ tÇng tr­íc/combining_flame_201207",
		"Tho¸t/nothing",
	}
	Say(Activity_Ds_Name.."9 Th¸nh Háa bÊt kú+30 Vµng=1 Ngò Th¸i Th¸nh Háa",getn(tbSay),tbSay);
end

function guess_flame_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event ®· hÕt h¹n");
		return 0;
	end
	local tbBody = "T¹i h¹ ra 1 ch÷ sè (tõ 1-100) ®Ó c¸c h¹ ®o¸n 5 lÇn, sè lÇn ®o¸n tróng cµng İt th× phÇn th­ëng cµng lín. Sè lÇn tham gia trß ch¬i mçi ngµy lµ tïy ı, nh­ng chØ ®­îc nhËn th­ëng 3 lÇn.";
	local tbSay = {
		"H·y b¾t ®Çu ®i /oly_begin_guess",
		"NhËn phÇn th­ëng lÇn tr­íc/oly_get_last_guess_award",
		"\n rót lui/nothing",
	}
	Say(Activity_Ds_Name..tbBody,getn(tbSay),tbSay);
end

function lucky_star_201207()
	local tbSay = {};
--	tbSay.msg = Activity_Ds_Name.."Ò»ÌìÀÛ¼Æµã»ğ´ÎÊı´ïµ½ 6 ´Î£¬¼´¿É²Î¼Ó°ÂÔËĞÒÔË³é½±»î¶¯:\n   ·½Ê½£ºÊäÈëÒ»¸ö1-9999Ö®¼äµÄÊı×Ö£»\n   Áì½±Á÷³Ì£ºÃ¿Íí21:00¿ª½±£¬21:00-21:30ÖĞ½±Íæ¼ÒĞèÒªÀ´ÎÒÕâÀï½øĞĞÖĞ½±µÇ¼Ç£¬Ç°10ÃûµÇ¼ÇµÄÍæ¼Ò¿ÉÒÔ¾ù·Ö½±Àø¡£ÍíÉÏ21:30ºó¿ÉÒÔÁì½±£¬22:00Áì½±½áÊø£¬¹ıÊ±²»ÄÜÁì½±¡£\n   ½±Àø£ºÃ¿Ìì1¸öÌìî¸Áî£¬µ±ÈÕÎŞÈËÖĞ½±£¨Áì½±£©£¬½±Àø½«Ò»Ö±ÀÛ¼ÆÖ±µ½ÓĞÈËÖĞ½±»ò»î¶¯½áÊø¡£\n   ×¢Òâ£ºĞÒÔËÊı×Öµ±ÈÕÓĞĞ§¡£";
	tbSay.msg = Activity_Ds_Name.."Mçi ngµy sè lÇn tİch lòy ®iÓm háa ®¹t ®Õn 6 lÇn, cã thÓ tham gia ho¹t ®éng rót th­ëng H¹nh VËn: \n   H×nh thøc: tõ 1-9999 nhËp vµo 1 con sè; \n   L­u tr×nh phÇn th­ëng: 21:00 mçi tèi sÏ më th­ëng, 21:00-21:30 nh÷ng ai tróng th­ëng ph¶i ®Õn ®©y ®Ó ®¨ng kı, 10 ng­êi ch¬i ®¨ng kı tr­íc sÏ cã phÇn th­ëng. Sau 21:30 cã thÓ nhËn th­ëng, 22:00 kÕt thóc nhËn th­ëng, qu¸ thêi gian kh«ng thÓ nhËn th­ëng. \n PhÇn th­ëng: Mçi ngµy 1 Thiªn Cang LÖnh, trong ngµy kh«ng ai tróng th­ëng (nhËn th­ëng), th× phÇn th­ëng sÏ ®­îc tİch lòy cho ®Õn khi cã ng­êi tróng th­ëng hoÆc ho¹t ®éng kÕt thóc. \n Chó ı: Sè H¹nh VËn cã hiÖu lùc trong ngµy.";
	tbSay.sel = {
		{"\n rót lui","nothing"},
	};
	temp_Talk(tbSay);
end

function oly_lucky_star_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event ®· hÕt h¹n");
		return 0;
	end
	CheckAndDoRegularClear(EM_REGULAR_CLEAR_TYPE_DAILY);
--	local tbBody = "Ò»ÌìÀÛ¼Æµã»ğ´ÎÊı´ïµ½ 6 ´Î£¬¼´¿É²Î¼Ó°ÂÔËĞÒÔË³é½±»î¶¯¡£\n    Ä¿Ç°ÀÛ»ı½±ÀøÎª£º<color=green>%d¸öÌìî¸Áî<color>£»\n    ½ñÌìµÄĞÒÔËÊı×ÖÊÇ£º<color=green>%s<color>£»\n    Äã½ñÌìµÄĞÒÔËÊı×ÖÊÇ£º<color=green>%d<color>£»\n    ½±Àø£ºÃ¿Ìì1¸öÌìî¸Áî£¬µ±ÈÕÎŞÈËÖĞ½±£¨Áì½±£©£¬½±Àø½«Ò»Ö±ÀÛ¼ÆÖ±µ½ÓĞÈËÖĞ½±»ò»î¶¯½áÊø¡£";
	local tbBody = "Mçi ngµy sè lÇn tİch lòy ®iÓm háa ®¹t ®Õn 6 lÇn, cã thÓ tham gia ho¹t ®éng rót th­ëng H¹nh VËn. \n HiÖn t¹i tİch lòy rót th­ëng lµ: <color=green>%d Thiªn Cang LÖnh<color>; \n Sè H¹nh VËn h«m nay lµ: <color=green>%s<color>; \n Sè H¹nh VËn h«m nay cña ng­¬i lµ: <color=green>%d<color>; \n PhÇn th­ëng: Mçi ngµy 1 Thiªn Cang LÖnh, trong ngµy kh«ng ai tróng th­ëng (lÜnh th­ëng), phÇn th­ëng sÏ ®­îc tİch lòy cho ®Õn khi cã ng­êi tróng th­ëng hoÆc ho¹t ®éng kÕt thóc. ";
	local tbSay = oly_CreateDlgTable();
	local nTglNum,strNum,nMyluckNum = oly_GetBaseInfo();	
	tinsert(tbSay,"Tho¸t/nothing");
	Say(Activity_Ds_Name..format(tbBody,nTglNum,strNum,nMyluckNum),getn(tbSay),tbSay);
end

function input_luck_num_201207()
	if gf_GetMyTaskByte(VET_OLY_TASK1,2,3) == 0 then
		AskClientForNumber("input_luck_num_cb_201207",1,OLY_MAX_LUCK_NUM,"NhËp ch÷ sè may m¾n cña c¸c h¹");
	end
end

function input_luck_num_cb_201207(nNum)
	local nDayTime = oly_GetDayCurrTime(); --µ±ÌìÊ±¼ä
	if nDayTime >= 0 and nDayTime < OLY_TIME_START then
		gf_SetMyTaskByte(VET_OLY_TASK1,2,3,nNum,TASK_ACCESS_CODE_OLYMPIC);
		Msg2Player(format("Ch÷ sè may m¾n cña c¸c h¹ lµ %d",nNum));
	else
		Msg2Player("B©y giê kh«ng thÓ nhËp ch÷ sè may m¾n , h·y quay l¹i vµo ngµy mai.");
	end
end

function goto_caji_map_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event ®· hÕt h¹n");
		return 0;
	end
	local tbSay = {
		"§ång ı/sure_201207",
		"Tho¸t/nothing",
	}
	Say(Activity_Ds_Name.."Cã muèn ®i thu thËp Lam S¾c vµ Lôc S¾c Th¸nh Háa kh«ng?",getn(tbSay),tbSay);
end

function sure_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event ®· hÕt h¹n");
		return 0;
	end
	if oly_Is_LevelSkill()	~= 1 then
		return 0;
	end
	NewWorld(328,1628,3981);
	SetFightState(1);
end

--µÇ¼Ç
function register_mylucknum_201207()
	ApplyRelayShareData(Oly_Record3.szKey,Oly_Record3.nKey1,Oly_Record3.nKey2,Oly_CallBack_Script,"oly_CallBack_Rigister");
end

--Áì½±
function get_lucknum_award_201207()
	if gf_GetTaskByte(VET_OLY_TASK1,4) == 0 then
		Talk(1,"","C¸c h¹ ch­a ®¨ng kı kh«ng thÓ nhËn phÇn th­ëng");
	end
	--Áì½±
	ApplyRelayShareData(Oly_Record3.szKey,Oly_Record3.nKey1,Oly_Record3.nKey2,Oly_CallBack_Script,"oly_CallBack_GetLuckPersonNum");
end