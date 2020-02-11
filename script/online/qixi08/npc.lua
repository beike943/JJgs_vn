Include("\\script\\online\\qixi08\\function.lua");
Include("\\script\\online\\qixi08\\star\\npc.lua");
Include("\\script\\online\\qixi08\\guess\\npc.lua");
Include("\\script\\online\\qixi08\\light\\npc.lua");
Include("\\script\\online\\qixi08\\box\\npc.lua");
Include("\\script\\lib\\time.lua");

g_tbEquipHead = 
{			--8¼¶Íâ·À			8¼¶ÄÚ·À				9¼¶
	[1] = {{"B¸ch ChiÕn (Trang søc ngo¹i phßng cÊp 8)",0,103,73},{"HuyÒn Vò (Trang søc néi phßng cÊp 8)",0,103,77},{"Lôc Ly (Trang søc cÊp 9)",0,103,81}},
	[2] = {{"¤ Bµn (Trang søc ngo¹i phßng cÊp 8)",0,103,74},{"Cöu Anh (Trang søc néi phßng cÊp 8)",0,103,78},{"Thôc Quû (Trang søc cÊp 9)",0,103,82}},
	[3] = {{"Häa Hu©n (Trang søc ngo¹i phßng cÊp 8)",0,103,75},{"Yªn Hoa (Trang søc néi phßng cÊp 8)",0,103,79},{"Phó Vò (Trang søc cÊp 9)",0,103,83}},
	[4] = {{"Phiªn TuyÕt (Trang søc ngo¹i phßng cÊp 8)",0,103,76},{"Yªn Méng (Trang søc néi phßng cÊp 8)",0,103,80},{"¶m NguyÖt (Trang søc cÊp 9)",0,103,84}},
}
g_tbEquipCloth = 
{			--8¼¶Íâ·À				8¼¶ÄÚ·À				9¼¶
	[1] = {{"ThÊt ThÇn Y (¸o ngo¹i phßng cÊp 8)",0,100,73},{"Gi¸ng Tö Bµo (¸o néi phßng cÊp 8)",0,100,77},{"Tè Ng©n Bµo (¸o cÊp 8)",0,100,81}},
	[2] = {{"Long L©n ¤ Kim Gi¸p (¸o ngo¹i phßng cÊp 8)",0,100,74},{"L­u Kim Gi¸p Y (¸o néi phßng cÊp 8)",0,100,78},{"Xİch LuyÖn Gi¸p Y (¸o cÊp 9)",0,100,82}},
	[3] = {{"Lôc Oanh Vò Y (¸o ngo¹i phßng cÊp 8)",0,100,75},{"Song §¹i Vò Th­êng (¸o néi phßng cÊp 8)",0,100,79},{"Ngäc Thoa Vò Y (¸o cÊp 9)",0,100,83}},
	[4] = {{"Doanh Vò Th­êng (¸o ngo¹i phßng cÊp 8)",0,100,76},{"Phông Vò Nghª Sa (¸o néi phßng cÊp 8)",0,100,80},{"§¹i Yªn Nghª Th­êng (¸o cÊp 9)",0,100,84}},
}
g_tbEquipTrousers = 
{			--8¼¶Íâ·À				8¼¶ÄÚ·À				9¼¶
	[1] = {{"Së Ca (H¹ y ngo¹i phßng cÊp 8)",0,101,73},{"§Şnh MÆc (H¹ y néi phßng cÊp 8)",0,101,77},{"ThÖ V©n (H¹ y cÊp 9)",0,101,81}},
	[2] = {{"K×nh Th­¬ng (H¹ y ngo¹i phßng cÊp 8)",0,101,74},{"§»ng Ngäc (H¹ y néi phßng cÊp 8)",0,101,78},{"HuyÒn Tiªu (H¹ y cÊp 9)",0,101,82}},
	[3] = {{"Phï Thóy (H¹ y ngo¹i phßng cÊp 8)",0,101,75},{"Vò Mé (H¹ y néi phßng cÊp 8)",0,101,79},{"Khª V©n (H¹ y cÊp 9)",0,101,83}},
	[4] = {{"Hµn §é (H¹ y ngo¹i phßng cÊp 8)",0,101,76},{"Tinh Lam (H¹ y néi phßng cÊp 8)",0,101,80},{"D¹ Ca (H¹ y cÊp 9)",0,101,84}},
}

g_tbEquipWeapon = 
{
	[0] = {{"ThÇn Qui (Vò khİ cÊp 9)",0,0,15},			{"¢m D­¬ng Ên (Vò khİ cÊp 10)",0,0,16}},	--ÊÖ
	[1] = {{"Khoa Phô (Vò khİ cÊp 9)",0,1,54},			{"Mét Vò (Vò khİ cÊp 10)",0,1,55}},	--°µÆ÷
	[2] = {{"Häa ¶nh (Vò khİ cÊp 9)",0,2,37},			{"Nha Cöu (Vò khİ cÊp 10)",0,2,38}},	--½£
	[3] = {{"LËu C¶nh (Vò khİ cÊp 9)",0,3,65},			{"NghŞch L©n (Vò khİ cÊp 10)",0,3,66}},	--µ¶
	[4] = {{"Viªn §Ò (Vò khİ cÊp 9)",0,4,120},			{"BÊt X¹ Chi X¹ (Vò khİ cÊp 10)",0,4,121}},	--¹­
	[5] = {{"Ngäc Trô (Vò khİ cÊp 9)",0,5,41},			{"ThÇn Ch©m (Vò khİ cÊp 10)",0,5,42}},	--¹÷
	[6] = {{"Cöu Long Toµn Kİch (Vò khİ cÊp 9)",0,6,109},		{"Th­¬ng N« (Vò khİ cÊp 10)",0,6,110}},	--Ç¹
	[7] = {{"Bİch Thñy (Vò khİ cÊp 9)",0,7,13},			{"Thiªn T«n (Vò khİ cÊp 10)",0,7,14}},	--Ë«µ¶
	[8] = {{"Môc KiÒn Liªn Tr­îng (Vò khİ cÊp 9)",0,8,98},		{"D­îc S­ Tr­îng (Vò khİ cÊp 10)",0,8,99}},	--ÕÈ
	[9] = {{"Toan Dù (Vò khİ cÊp 9)",0,9,87},			{"Th¸i H­ (Vò khİ cÊp 10)",0,9,88}},	--±Ê
	[10] = {{"§¹i Th¸nh Di ¢m (Vò khİ cÊp 9)",0,10,76},	{"Kh« Méc Long Ng©m (Vò khİ cÊp 10)",0,10,77}},	--ÇÙ
	[11] = {{"V« Ng©n (Vò khİ cÊp 9)",0,11,13},		{"Thanh Long (Vò khİ cÊp 10)",0,11,14}},	--×¦
}

g_tbRouteEquip = 
{
	[0]={1,2,3,4,5,6,7,8,9,10,11},
	[1]={0,3,5,8},
 	[2]={3,5},
	[3]={8},
	[4]={0},
 	[5]={1},
 	[6]={1},
	[7]={2,10},
	[8]={2},
	[9]={10},
	[10]={0,5},
	[11]={0},
	[12]={5},
	[13]={2,9},
	[14]={2},
	[15]={9},
	[16]={4,6},
	[17]={6},
	[18]={4},
	[19]={7,11},
	[20]={7},
	[21]={11},
}

g_tbEquip = {g_tbEquipHead,g_tbEquipCloth,g_tbEquipTrousers,g_tbEquipWeapon};

function main()
	local nLevel = GetLevel()
	if nLevel <= 30 then
		Talk(1,"",g_szInfoHead.."§¼ng cÊp qu¸ thÊp, ho¹t ®éng yªu cÇu cÊp thÊp nhÊt lµ <color=yellow>31<color>.");
		return 0;
	end;
	local selTab = {};
	local nDate = tonumber(date("%Y%m%d"));
	local nYear1,nMonth1,nDay1 = QX08_GetDate(g_nGameBeginDate);
	local nYear2,nMonth2,nDay2 = QX08_GetDate(g_nGameEndDate);
	local nYear3,nMonth3,nDay3 = QX08_GetDate(g_nAwardEndDate);
	if nDate < g_nGameBeginDate then
		Talk(1,"",g_szInfoHead.."Thêi gian ho¹t ®éng <color=yellow>"..nYear1.."niªn"..nMonth1.."NguyÖt"..nDay1.." ®Õn "..nYear2.."niªn"..nMonth2.."NguyÖt"..nDay2.."<color>, vŞ thiÕu hiÖp nµy ®Õn lóc nhí ghĞ l¹i xem.");
		return 0;
	end;
	if nDate > g_nGameEndDate then
		local selTab2 = {};
		if nDate <= g_nAwardEndDate then
			tinsert(selTab2,"Dïng ®iÓm thi ®Êu ®æi phÇn th­ëng (Thêi h¹n: "..nYear3.."niªn"..nMonth3.."NguyÖt"..nDay3..")/point_award");
		end;
		tinsert(selTab2,"KÕt thóc ®èi tho¹i/nothing");
		Say(g_szInfoHead.."Thêi gian lÇn ho¹t ®éng nµy lµ <color=yellow>"..nYear1.."niªn"..nMonth1.."NguyÖt"..nDay1.." ®Õn "..nYear2.."niªn"..nMonth2.."NguyÖt"..nDay2.."<color>, hiÖn ®· qu¸ thêi gian ho¹t ®éng, xin lÇn sau quay l¹i.",getn(selTab2),selTab2);
		return 0;
	end;
	local szGameName,nGameID = QX08_GetTodayGame();
	local nYear4,nMonth4,nDay4 = QX08_GetDate(g_nQiXiBeginDate);
	local nYear5,nMonth5,nDay5 = QX08_GetDate(g_nQiXiEndDate);
	local nYear6,nMonth6,nDay6 = QX08_GetDate(g_nYearsEndDate);
	if nDate <= g_nQiXiEndDate then
		tinsert(selTab,"LÔ thÊt tŞch cïng nhau cÇu nguyÖn (Thêi gian më: "..nYear4.."niªn"..nMonth4.."NguyÖt"..nDay4.." ®Õn "..nYear5.."niªn"..nMonth5.."NguyÖt"..nDay5..")/aoyun_star_main");
	end;
	if nGameID == GAME_ID_GUESS then
		tinsert(selTab,"Thi ®Êu Thiªn C¬ ThÇn To¸n (Thø 2, thø 4, thø 6)/#enter_aoyun_game(1)");
	elseif nGameID == GAME_ID_BOX then
		tinsert(selTab,"Thi ®Êu §o¹t B¶o Kú Binh (Thø 3, thø 5, thø 7)/#enter_aoyun_game(2)");
	elseif nGameID == GAME_ID_LIGHT then
		tinsert(selTab,"Héi th¾p ®Ìn (Chñ nhËt)/#enter_aoyun_game(3)");
	end;
	if nDate <= g_nAwardEndDate then
		tinsert(selTab,"Dïng ®iÓm thi ®Êu ®æi phÇn th­ëng (Thêi h¹n: "..nYear3.."niªn"..nMonth3.."NguyÖt"..nDay3..")/point_award");
	end;
--	tinsert(selTab,"ÁìÈ¡¡°ÌìÏÂµÚÒ»±ÈÎäÑûÇëº¯¡±/get_ticket");
	tinsert(selTab,"Xem thêi gian ho¹t ®éng/see_game_schedule");
	tinsert(selTab,"NhËn h­íng dÉn ho¹t ®éng trßn 20 n¨m/get_book");
	if nDate >= g_nYearsBeginDate and nDate <= g_nYearsEndDate then
		tinsert(selTab,"NhËn danh hiÖu Mõng trßn 20 n¨m (Thêi h¹n nhËn: "..nYear6.."niªn"..nMonth6.."NguyÖt"..nDay6..")/get_years_title");
	end
	if nDate <= 20080823 then
		tinsert(selTab,"Ta muèn nhËn båi th­êng Héi th¾p ®Ìn chñ nhËt tr­íc (17/8). (Thêi h¹n: 23/8)/diandeng_buchang");
	end 	
	tinsert(selTab,"Ta ®Õn xem thö/nothing");
	if DEBUG_VERSION == 1 then
		tinsert(selTab,"Lèi vµo kiÓm tra/test_entry");
	end;
	Say(g_szInfoHead.."N¨m 1988 «ng CÇu B¸ Qu©n viÕt ra wps, ®¸nh dÊu thµnh lËp cña c«ng ty Kingsoft, ®Õn nay ®· 20 n¨m, trong 20 n¨m ®ã, Kingsoft ®¾ng cay cã vinh quang cã nh­ng cho dï lóc nµo còng cã sù ñng hé cña mäi ng­êi. Tõ b©y giê ®Õn 23 giê 27/1/2009, sÏ më ho¹t ®éng Kû niÖm 20 n¨m Kingsoft, hoan nghªnh mäi ng­êi tham gia, ta ®· chuÈn rÊt nhiÒu trß ch¬i nhá hÊp dÉn. Mçi ngµy chØ cã thÓ tham gia mét trß ch¬i nhá. <color=yellow>H«m nay: ["..szGameName.."]. Thêi gian ho¹t ®éng: "..nYear1.."niªn"..nMonth1.."NguyÖt"..nDay1.." ®Õn "..nYear2.."niªn"..nMonth2.."NguyÖt"..nDay2.." mçi ngµy tõ 9:00 ®Õn 23:00<color>. Xin chó ı, mçi ng­êi nhiÒu nhÊt chØ cã thÓ tİch lòy 200 ®iÓm.",getn(selTab),selTab);
end;

function see_game_schedule()
	local selTab = {
				"Thø 2: Thiªn C¬ ThÇn To¸n/#know_game_detail(1)",
				"Thø 3: §o¹t B¶o Kú Binh/#know_game_detail(2)",
				"Thø 4: Thiªn C¬ ThÇn To¸n/#know_game_detail(1)",
				"Thø n¨m: §o¹t B¶o Kú Binh/#know_game_detail(2)",
				"Thø 6: Thiªn C¬ ThÇn To¸n/#know_game_detail(1)",
				"Thø 7: §o¹t B¶o Kú Binh/#know_game_detail(2)",
				"Chñ nhËt: Héi th¾p ®Ìn/#know_game_detail(3)",
				"Ta ®· hiÓu/main",
				}
	Say(g_szInfoHead.."Sau ®©y lµ s¾p xÕp cña thø 2:",getn(selTab),selTab);
end;

function know_game_detail(nGameID)
	if nGameID == GAME_ID_GUESS then
		Talk(1,"see_game_schedule",g_szInfoHead.."HÖ thèng chän ngÉu nhiªn 1 sè tõ 0 ®Õn 100, sau ®ã b¹n cã 5 c¬ héi ®o¸n sè nµy, cµng ®o¸n ®­îc sím th× phÇn th­ëng cµng tèt. <color=red>Chó ı: PhÇn th­ëng ph¶i ®­îc nhËn trong ngµy<color>.");
	elseif nGameID == GAME_ID_BOX then
		Talk(1,"see_game_schedule",g_szInfoHead.."B¹n vµ h¶o h÷u ®· vµo b¶n ®å, hÖ thèng mçi vßng sÏ gi¶m 1 R­¬ng theo sè ng­êi, chØ cã ng­êi giµnh ®­îc r­¬ng míi cã thÓ ë l¹i tiÕp tôc trß ch¬i. Gi÷ v÷ng cµng vÒ sau sÏ nhËn phÇn th­ëng cµng tèt. <color=red>Chó ı: PhÇn th­ëng ph¶i ®­îc nhËn trong ngµy<color>.");
	elseif nGameID == GAME_ID_LIGHT then
		Talk(1,"see_game_schedule",g_szInfoHead.."Quan s¸t kü thø tù ®Ìn ®­îc th¾p, c¨n cø gîi ı cña hÖ thèng mµ th¾p ®Ìn, tæng céng cã 5 ¶i, v­ît ¶i cµng nhiÒu phÇn th­ëng cµng tèt. <color=red>Chó ı: PhÇn th­ëng ph¶i ®­îc nhËn trong ngµy<color>.");
	end;
end;

function get_ticket()
	local nDate = tonumber(date("%Y%m%d"));
	if GetTask(TSK_AOYUN_GET_TICKET_DATE) < nDate then
		if gf_JudgeRoomWeight(2,30,g_szInfoHead) == 0 then
			return 0;
		end;
		SetTask(TSK_AOYUN_GET_TICKET_DATE,nDate);
		AddItem(2,0,1069,10);
		Msg2Player("B¹n nhËn ®­îc 10 tÊm 'Th­ mêi Tû vâ Thiªn h¹ ®Ö nhÊt'");
		Talk(1,"main",g_szInfoHead.."Cã 'Th­ mêi Tû vâ Thiªn h¹ ®Ö nhÊt' míi cã thÓ tham gia thi ®Êu, h«m nay göi ng­¬i 10 tÊm, h·y nhËn lÊy. Dïng hÕt nÕu vÉn muèn tham gia h·y <color=yellow>tham gia l«i ®µi §¹i héi tû vâ Thiªn h¹ ®Ö nhÊt, mçi lÇn tham gia sÏ cã thÓ nhËn ®­îc 1 tÊm 'Th­ mêi §¹i héi tû vâ Thiªn h¹ ®Ö nhÊt'.<color>");
	else
		Talk(1,"main",g_szInfoHead.."Xin lçi, ng­¬i ®· nhËn 'Th­ mêi §¹i héi tû vâ Thiªn h¹ ®Ö nhÊt' h«m nay, nh­ng vÉn cã thÓ nhËn th­ mêi khi <color=yellow>tham gia §¹i héi tû vâ Thiªn h¹ ®Ö nhÊt<color>, hoÆc ngµy mai h·y ®Õn t×m ta.");
	end;
end;

function test_entry()
	local selTab = {
			"Thi ®Êu Thiªn C¬ ThÇn To¸n/aoyun_guess_main",
			"Thi ®Êu §o¹t B¶o Kú Binh/aoyun_box_main",
			"§iÓm §¨ng Héi/aoyun_light_main",
			"Kh«ng cã g×/nothing",
			}
	Say(g_szInfoHead.."§Ó kiÓm tra",getn(selTab),selTab);
end;

function use_point()
	local nDate = tonumber(date("%Y%m%d"));
	local nYear,nMonth,nDay = QX08_GetDate(g_nAwardEndDate);
	if nDate > g_nAwardEndDate then
		Talk(1,"",g_szInfoHead.."Thêi gian ®æi trang bŞ ®· hÕt, xin chê ho¹t ®éng lÇn sau.");
		return 0;
	end;
	local nPoint = GetTask(TSK_AOYUN_POINT);
	local selTab = {
				"Dïng ®iÓm ®æi trang bŞ linh khİ cao (Thêi h¹n: "..nYear.."niªn"..nMonth.."NguyÖt"..nDay..")/exchange_equipment",
				"Lµm sao ®æi trang bŞ linh khİ cao/know_how_to_get_point",
				"T¹m kh«ng ®æi phÇn th­ëng/nothing",
				}
	Say(g_szInfoHead.."Hµnh tÈu giang hå, kh«ng thÓ thiÕu trang bŞ, nÕu trang bŞ tèt nã cã thÓ gióp b¹n cñng cè ®Şa vŞ trªn giang hå. §Ó ban th­ëng cho c¸c vŞ anh hïng, tham gia ho¹t ®éng sÏ cã c¬ héi nhËn ®­îc trang bŞ linh khİ cao. §iÓm ho¹t ®éng hiÖn t¹i cña b¹n lµ: <color=yellow>"..nPoint.."<color>",getn(selTab),selTab);
end;

function point_award()
	local nDate = tonumber(date("%Y%m%d"));
	local nYear,nMonth,nDay = QX08_GetDate(g_nAwardEndDate);
	if nDate > g_nAwardEndDate then
		Talk(1,"",g_szInfoHead.."Thêi gian ®æi trang bŞ ®· hÕt, xin chê ho¹t ®éng lÇn sau.");
		return 0;
	end;
	local nPoint = GetTask(TSK_AOYUN_POINT);
	local strtab = {
				"Dïng ®iÓm ®æi phÇn th­ëng (Thêi h¹n: "..nYear.."niªn"..nMonth.."NguyÖt"..nDay..")/exchange_award",
				"Lµm sao dïng ®iÓm ®æi phÇn th­ëng/know_how_to_get_point",
				"T¹m kh«ng ®æi phÇn th­ëng/nothing"
				};
	Say(g_szInfoHead.."Ng­¬i cã thÓ dïng ®iÓm ®Ó ®æi c¸c lo¹i phÇn th­ëng t¹i ®©y, ®iÓm kh«ng ®ñ th× cã thÓ tham gia ho¹t ®éng thu thËp, nh­ vËy tuy kh«ng cã phÇn th­ëng b×nh th­êng, nh­ng cã phÇn th­ëng ®iÓm rÊt cao. §iÓm hiÖn t¹i lµ: <color=yellow>"..nPoint.."<color>, xin tr­íc 23 giê ngµy "..nYear.."niªn"..nMonth.."NguyÖt"..nDay.." nhËn phÇn th­ëng.",getn(strtab),strtab);
end

function exchange_award()
	local nPoint = GetTask(TSK_AOYUN_POINT);
	local strtab = {
				"Ta muèn dïng 1 ®iÓm tİch lòy ®æi 1 R­¬ng kû niÖm 20 n¨m/change_one_box",
				"Ta muèn dïng 10 ®iÓm tİch lòy ®æi phÇn th­ëng/#ask_exchange_award(10)",
				"Ta muèn dïng 50 ®iÓm tİch lòy ®æi phÇn th­ëng/#ask_exchange_award(50)",
				"Ta muèn dïng 200 ®iÓm tİch lòy ®æi phÇn th­ëng/#ask_exchange_award(200)",
				"Ta muèn dïng 200 ®iÓm tİch lòy ®æi 1 quyÓn Hîp Thµnh MËt TŞch/exchange_miji",
				"R­¬ng kû niÖm 20 n¨m cã thÓ më ra phÇn th­ëng nµo/know_20box_award",
				"Trë l¹i ®æi phÇn th­ëng sau/nothing",
				}
	Say(g_szInfoHead.."§iÓm hiÖn lµ: <color=yellow>"..nPoint.."<color>, ng­¬i muèn ®æi phÇn th­ëng nµo?",getn(strtab),strtab);
end

function change_one_box()
	local nPoint = GetTask(TSK_AOYUN_POINT);
	if nPoint < 1 then
		Talk(1,"",g_szInfoHead.."Xin lçi, ng­¬i ch­a cã ®iÓm tİch lòy.");
	else
		Say(g_szInfoHead.."Muèn dïng 1 ®iÓm tİch lòy ®æi 1 R­¬ng kû niÖm 20 n¨m kh«ng?",
			3,
			"õ, ta muèn ®æi./input_box_num",
			"Kh«ng, ta nhÇm!/exchange_award",
			"Trë l¹i ®æi phÇn th­ëng sau/nothing")
	end
end

function input_box_num()
	local nPoint = GetTask(TSK_AOYUN_POINT);
	AskClientForNumber("confirm_give_box",1,nPoint,"muèn ®æi mÊy r­¬ng?");
end

function confirm_give_box(nCount)
	local nPoint = GetTask(TSK_AOYUN_POINT);
	if nPoint < nCount then
		return 0;
	end
	if gf_Judge_Room_Weight(1,nCount*10,g_szInfoHead) ~= 1 then
		return 0;
	end 
	SetTask(TSK_AOYUN_POINT,nPoint-nCount);
	AddItem(tItemName[6][2],tItemName[6][3],tItemName[6][4],nCount);
	Msg2Player("B¹n nhËn ®­îc "..nCount.."c¸i"..tItemName[6][1]);	
end

function know_20box_award()
	if IB_VERSION == 1 then
		Talk(2,"exchange_award",g_szInfoHead.."R­¬ng kû niÖm 20 n¨m cã thÓ më ®­îc: \nNgùa di chuyÓn 120%, ®é bÒn 200 ®iÓm (D­¬ng M«n lµ chiÕn m· di chuyÓn 35%, ®é bÒn 1000 ®iÓm)\nMËt tŞch cao cÊp S­ M«n (ng­êi ch¬i ch­a gia nhËp l­u ph¸i sÏ nhËn ®­îc quyÓn mËt tŞch l­u ph¸i ngÉu nhiªn)\n100 triÖu kinh nghiÖm (l­u ı, khi kinh nghiÖm cña b¹n ®¹t ®Õn 2 tû, th× phÇn d­ ra sÏ bŞ mÊt, mçi tuÇn chØ cã thÓ ®æi thµnh c«ng 1 lÇn)\n§Şnh Hån Thiªn Th¹ch ThÇn Th¹ch (c­êng hãa vËt phÈm, khi ®é c­êng hãa lµ 7 th× kh«ng thÓ c­êng hãa n÷a)\nThiªn Qu¸i Th¹ch(dïng th¨ng cÊp trang bŞ Viªm §Õ, trang bŞ t­íng qu©n, trang bŞ nguyªn so¸i vµ ®æi trang bŞ Thiªn §Şa HuyÒn Hoµng thµnh trang bŞ Thiªn Qu¸i)",g_szInfoHead.."\nM¶nh Thiªn Th¹ch (trang bŞ c­êng hãa cÊp 1-4 tiªu hao vËt phÈm)\nThiªn Th¹ch Tinh Th¹ch (trang bŞ c­êng hãa cÊp 8-15 tiªu hao vËt phÈm)\nKinh nghiÖm lËp ph­¬ng ®¼ng cÊp\nHuy Hoµng Chi Thñy vµ Vinh Dù Chi Thñy\n    PhÇn th­ëng ë trªn, sÏ c¨n cø vµo ch×a khãa dïng ®Ó më b¶o r­¬ng mµ cã tû lÖ kh¸c nhau, tÊt c¶ nh÷ng vËt phÈm ë trªn, trõ <color=yellow>kinh nghiÖm, Thiªn Qu¸i Th¹ch, Huy Hoµng Chi Thñy vµ Vinh Dù Chi Thñy<color>, ®Òu cã thÓ giao dŞch ®­îc, chóc b¹n may m¾n!");
	else
		Talk(2,"exchange_award",g_szInfoHead.."R­¬ng kû niÖm 20 n¨m cã thÓ më ra ®­îc: \nNgùa di chuyÓn 120%, ®é bÒn 200 ®iÓm (D­¬ng M«n lµ chiÕn m· di chuyÓn 35%, ®é bÒn 1000 ®iÓm)\nMËt tŞch cao cÊp S­ M«n (ng­êi ch­a gia nhËp l­u ph¸i sÏ nhËn ®­îc 1 quyÓn mËt tŞch l­u ph¸i ngÉu nhiªn)\n100 triÖu kinh nghiÖm (l­u ı, khi kinh nghiÖm cña b¹n ®¹t ®Õn 2 tû, th× phÇn d­ ra sÏ bŞ mÊt, mçi tuÇn chØ cã thÓ ®æi thµnh c«ng 1 lÇn)\nThiªn Th¹ch Linh Th¹ch (c­êng hãa trang bŞ trùc tiÕp ®Õn cÊp )\nThiªn Qu¸i Th¹ch(dïng th¨ng cÊp trang bŞ Viªm §Õ, trang bŞ t­íng qu©n, trang bŞ nguyªn so¸i vµ ®æi trang bŞ Thiªn §Şa HuyÒn Hoµng thµnh trang bŞ Thiªn Qu¸i)\nNguyÖt Hoa hoÆc N÷ Oa Tinh Th¹ch",g_szInfoHead.."\nKinh nghiÖm lËp ph­¬ng ®¼ng cÊp\nHuy Hoµng Chi Thñy vµ Vinh Dù Chi Thñy\n    PhÇn th­ëng ë trªn, sÏ c¨n cø vµo ch×a khãa dïng ®Ó më b¶o r­¬ng mµ cã tû lÖ kh¸c nhau, tÊt c¶ nh÷ng vËt phÈm ë trªn, trõ <color=yellow>kinh nghiÖm, Thiªn Qu¸i Th¹ch, Huy Hoµng Chi Thñy vµ Vinh Dù Chi Thñy<color>, ®Òu cã thÓ giao dŞch ®­îc, chóc b¹n may m¾n!");
	end
end

function ask_exchange_award(nJifen)
	local nPoint = GetTask(TSK_AOYUN_POINT);
	if nPoint < nJifen then
		Talk(1,"",g_szInfoHead.."Xin lçi, ®iÓm kh«ng ®ñ ®Ó ®æi phÇn th­ëng, ®iÓm hiÖn lµ: <color=yellow>"..nPoint.."<color>.")
		return 0
	end
	local nWeek = GetWeekSequence(1,0);
	if GetTask(TSK_AOYUN_AWARD_WEEK) < nWeek then
		SetTask(TSK_AOYUN_AWARD_WEEK,nWeek);
		SetTask(TSK_AOYUN_EXP_NUM,0);
		SetTask(TSK_AOYUN_YI_EXP,0);
	end
	if GetTask(TSK_AOYUN_EXP_NUM) >= g_nExpNum then
		Talk(1,"",g_szInfoHead.."Xin lçi, phÇn th­ëng kinh nghiÖm mçi ng­êi mçi tuÇn chØ ®­îc ®æi "..g_nExpNum.." lÇn, tuÇn nµy ®· ®æi råi, tuÇn sau ®Õn ®i.");
		return 0
	end
	local nLv = GetLevel();
	local nExpArg = nLv^3/80^3;
	local nExp = floor(tJifenAward[nJifen][6]*nExpArg);
	local nExpNum = GetTask(TSK_AOYUN_EXP_NUM);
	Say(g_szInfoHead.."Muèn dïng "..nJifen.." ®iÓm tİch lòy ®æi "..tJifenAward[nJifen][5].."c¸i"..tJifenAward[nJifen][1].." vµ"..nExp.." kinh nghiÖm kh«ng? <color=red>Chó ı, cho dï ®æi phÇn th­ëng nµo, phÇn th­ëng kinh nghiÖm mçi tuÇn nhiÒu nhÊt chØ nhËn "..g_nExpNum.." lÇn, ®©y lµ lÇn "..(nExpNum+1).." nhËn phÇn th­ëng.<color>",
			3,
			"õ, ta muèn ®æi./#confirm_exchange_award("..nJifen..")",
			"Kh«ng, ta nhÇm!/exchange_award",
			"Trë l¹i ®æi phÇn th­ëng sau/nothing")
end

function confirm_exchange_award(nJifen)
	if gf_Judge_Room_Weight(2,100,g_szInfoHead) ~= 1 then
		return 0;
	end
	local nPoint = GetTask(TSK_AOYUN_POINT);
	if nPoint < nJifen then
		Talk(1,"",g_szInfoHead.."Xin lçi, ®iÓm kh«ng ®ñ ®Ó ®æi phÇn th­ëng, ®iÓm hiÖn lµ: <color=yellow>"..nPoint.."<color>.")
		return 0;
	end
	local nWeek = GetWeekSequence(1,0);
	if GetTask(TSK_AOYUN_AWARD_WEEK) < nWeek then
		SetTask(TSK_AOYUN_AWARD_WEEK,nWeek);
		SetTask(TSK_AOYUN_EXP_NUM,0);
		SetTask(TSK_AOYUN_YI_EXP,0);
	end
	if GetTask(TSK_AOYUN_EXP_NUM) >= g_nExpNum then
		Talk(1,"",g_szInfoHead.."Xin lçi, phÇn th­ëng kinh nghiÖm mçi ng­êi mçi tuÇn chØ ®­îc ®æi "..g_nExpNum.." lÇn, tuÇn nµy ®· ®æi råi, tuÇn sau ®Õn ®i.");
		return 0;
	end
	local nLv = GetLevel();
	local nExpArg = nLv^3/80^3;
	local nExp = floor(tJifenAward[nJifen][6]*nExpArg);	
	SetTask(TSK_AOYUN_POINT,nPoint-nJifen);
	SetTask(TSK_AOYUN_EXP_NUM,GetTask(TSK_AOYUN_EXP_NUM)+1);
	AddItem(tJifenAward[nJifen][2],tJifenAward[nJifen][3],tJifenAward[nJifen][4],tJifenAward[nJifen][5]);
	ModifyExp(nExp);
	Msg2Player("B¹n nhËn ®­îc "..tJifenAward[nJifen][5].."c¸i"..tJifenAward[nJifen][1].." vµ"..nExp.." kinh nghiÖm.");
	WriteLog("[Ho¹t ®éng Kû niÖm 20 n¨m]: Ng­êi ch¬i "..GetName().."Sö dông "..nJifen.."§æi phÇn th­ëng.");
	Talk(1,"exchange_award",g_szInfoHead.."Chóc mõng b¹n nhËn ®­îc "..tJifenAward[nJifen][5].."c¸i"..tJifenAward[nJifen][1].." vµ"..nExp.." kinh nghiÖm.");
end

function exchange_miji()
	local strtab = {
				"Tø Linh ChiÕn ı Phæ (hiÖu qu¶ Kim ThiÒn vµ Chiªm Y)/#ask_change_miji(1)",
				"Tø Linh Thiªn Y Phæ (hiÖu qu¶ Thiªn Hµ vµ Chiªm Y)/#ask_change_miji(2)",
				"Tø Linh Tö Y Phæ (hiÖu qu¶ Tö Hµ vµ Chiªm Y)/#ask_change_miji(3)",
				"Ta chän nhÇm råi./exchange_award",
				"T¹m kh«ng ®æi phÇn th­ëng/nothing"
				}
	Say(g_szInfoHead.."muèn ®æi mËt tŞch nµo?",getn(strtab),strtab);	
end

function ask_change_miji(nType)
	local nPoint = GetTask(TSK_AOYUN_POINT);
	if nPoint < 200 then
		Talk(1,"",g_szInfoHead.."Xin lçi, ®iÓm kh«ng ®ñ ®Ó ®æi phÇn th­ëng, ®iÓm hiÖn lµ: <color=yellow>"..nPoint.."<color>.")
		return 0;
	end	
	Say(g_szInfoHead.."Muèn dïng 200 ®iÓm tİch lòy ®æi <color=yellow>"..tMijiName[nType][1].."<color> chø?",
			3,
			"õ, ta muèn ®æi./#confirm_exchange_miji("..nType..")",
			"Kh«ng, ta nhÇm!/exchange_miji",
			"T¹m kh«ng ®æi phÇn th­ëng/nothing")	
end

function confirm_exchange_miji(nType)
	if gf_Judge_Room_Weight(1,50) ~= 1 then
		return 0;
	end	
	local nPoint = GetTask(TSK_AOYUN_POINT);
	if nPoint < 200 then
		Talk(1,"",g_szInfoHead.."Xin lçi, ®iÓm kh«ng ®ñ ®Ó ®æi phÇn th­ëng, ®iÓm hiÖn lµ: <color=yellow>"..nPoint.."<color>.")
		return 0;
	end
	SetTask(TSK_AOYUN_POINT,nPoint-200);
	AddItem(tMijiName[nType][2],tMijiName[nType][3],tMijiName[nType][4],1);
	Msg2Player("Dïng 200 ®iÓm tİch lòy ®æi 1 quyÓn "..tMijiName[nType][1]);
	WriteLog("[Ho¹t ®éng Kû niÖm 20 n¨m]: Ng­êi ch¬i "..GetName().."Dïng 200 ®iÓm tİch lòy ®æi 1 quyÓn "..tMijiName[nType][1]);	
end

function exchange_equipment()
	local nPoint = GetTask(TSK_AOYUN_POINT);
	if nPoint < g_nEquipPoint then
		Talk(1,"",g_szInfoHead.."Xin lçi, ®iÓm tİch lòy kh«ng ®ñ ®Ó ®æi 1 mãn trang bŞ, İt nhÊt cÇn cã <color=yellow>"..g_nEquipPoint.."<color> ®iÓm míi cã thÓ ®æi 1 mãn trang bŞ.");
		return 0;
	end;
	local selTab = {
				"Trang søc/#exchange_equipment_1(1)",
				"Ngo¹i trang/#exchange_equipment_1(2)",
				"H¹ y/#exchange_equipment_1(3)",
				"Vò khİ/#exchange_equipment_1(4)",
				"T¹m thêi kh«ng ®æi/nothing",
				}
	Say(g_szInfoHead.."Xin chän vŞ trİ trang bŞ: ",getn(selTab),selTab);
end;

function exchange_equipment_1(nEquipType)
	local selTab = {};
	local nBody = GetBody();
	local tbEquip = g_tbEquip[nEquipType];
	if nEquipType ~= 4 then
		for i=1,getn(tbEquip[nBody]) do
			tinsert(selTab,tbEquip[nBody][i][1].."/#exchange_equipment_2("..nEquipType..","..i..")");
		end;
	else
		tinsert(selTab,"Vò khİ cÊp 9/#exchange_equipment_2("..nEquipType..",1)");
		tinsert(selTab,"Vó khİ cÊp 10/#exchange_equipment_2("..nEquipType..",2)");
	end;
	tinsert(selTab,"Chän l¹i/exchange_equipment");
	tinsert(selTab,"T¹m thêi kh«ng ®æi/nothing");
	local szEquipName = get_equip_describe(nEquipType);
	Say(g_szInfoHead.."B¹n ®· chän 1 "..szEquipName..", tiÕp theo xin chän ®¼ng cÊp cña trang bŞ: ",getn(selTab),selTab);
end;

function exchange_equipment_2(nEquipType,nLevel)
	local nPlayerRoute = GetPlayerRoute();
	SetTask(TSK_WEAPON_TYPE,0);
	if nPlayerRoute == 2 and nEquipType == 4 then 	--Íò¶ñµÄÉÙÁÖË×¼Ò
		local selTab = {
					"§ao/#exchange_equipment_2_1("..nEquipType..","..nLevel..",1)",
					"C«n/#exchange_equipment_2_1("..nEquipType..","..nLevel..",2)",
					"Chän l¹i/exchange_equipment",
					"T¹m thêi kh«ng ®æi/nothing",
					}
		Say(g_szInfoHead.."Xin chän lo¹i vò khİ: ",getn(selTab),selTab);
		return 0;
	end;
	exchange_equipment_2_1(nEquipType,nLevel);
end;

function exchange_equipment_2_1(nEquipType,nLevel,nType)
	if nType then
		SetTask(TSK_WEAPON_TYPE,nType);
	end;
	local selTab = {
				"Sè lÎ (Linh khİ 111)/#exchange_equipment_3("..nEquipType..","..nLevel..",1)",
				"Sè ch½n (Linh khİ 110)/#exchange_equipment_3("..nEquipType..","..nLevel..",2)",
				"Chän l¹i/exchange_equipment",
				"T¹m thêi kh«ng ®æi/nothing",
				}
	local szEquipName = get_equip_describe(nEquipType,nLevel)
	Say(g_szInfoHead.."B¹n ®· chän 1 "..szEquipName..", tiÕp theo xin chän ®iÓm linh khİ ch½n:",getn(selTab),selTab);

end;

function exchange_equipment_3(nEquipType,nLevel,nJO)
	local selTab = {
				"§ång ı ®æi /#exchange_equipment_4("..nEquipType..","..nLevel..","..nJO..")",
				"Chän l¹i/exchange_equipment",
				"T¹m thêi kh«ng ®æi/nothing",
				}
	local szEquipName = get_equip_describe(nEquipType,nLevel,nJO);
	Say(g_szInfoHead.."B¹n ®· chän 1 "..szEquipName..", b¹n x¸c nhËn muèn ®æi?",getn(selTab),selTab);
end;

function exchange_equipment_4(nEquipType,nLevel,nJO)
	if gf_JudgeRoomWeight(2,200,g_szInfoHead) == 0 then
		return 0;
	end;
	local szEquipName,tbEquipInfo = get_equip_describe(nEquipType,nLevel,nJO);
	local nID1,nID2,nID3 = tbEquipInfo[2],tbEquipInfo[3],tbEquipInfo[4];
	local nPoint = GetTask(TSK_AOYUN_POINT);
	if nPoint < g_nEquipPoint then
		Talk(1,"",g_szInfoHead.."Xin lçi, ®iÓm tİch lòy kh«ng ®ñ ®Ó ®æi 1 mãn trang bŞ, İt nhÊt cÇn cã <color=yellow>"..g_nEquipPoint.."<color> ®iÓm míi cã thÓ ®æi 1 mãn trang bŞ.");
		return 0;
	end;
	local nLingqi = 0;
	if nJO == 1 then
		nLingqi = 111;
	else
		nLingqi = 110;
	end;
	local nRetCode,nItemIdx = AddItem(nID1,nID2,nID3,1,4,0,0,0,0,0,0,0,0,nLingqi);
	SetEquipCanChouQu(nItemIdx,1);
	SetTask(TSK_AOYUN_POINT,nPoint-g_nEquipPoint);
	szEquipName = sf_RemoveTag(szEquipName,"<",">");
	Msg2Player("B¹n ®æi "..g_nEquipPoint.." ®iÓm tİch luü ho¹t ®éng ®æi 1 "..szEquipName);
	WriteLog("[Ho¹t ®éng Olympic]:"..GetName().." ®· ®æi 1 "..szEquipName..". Tİch luü cßn: "..(nPoint-g_nEquipPoint));
end;

function know_how_to_get_point()
	Talk(2,"point_award",g_szInfoHead.."Tham gia ho¹t ®éng mçi ngµy, b¹n sÏ nhËn ®­îc phÇn th­ëng vµ ®iÓm tİch luü. PhÇn th­ëng cã ®¼ng cÊp kh¸c nhau sÏ nhËn ®­îc ®iÓm tİch luü kh¸c nhau.\nPhÇn th­ëng cÊp 1: 5 ®iÓm\nPhÇn th­ëng cÊp 2: 4 ®iÓm\nPhÇn th­ëng cÊp 3: 3 ®iÓm\nPhÇn th­ëng cÊp 4: 2 ®iÓm\nPhÇn th­ëng cÊp 5: 1 ®iÓm",g_szInfoHead.."\nSö dông 1 ®iÓm tİch luü ®Ó ®æi 1 'R­¬ng kû niÖm 20 n¨m'\nSö dông 10 ®iÓm tİch luü ®Ó ®æi 1 'R­¬ng kû niÖm 20 n¨m' + [2 triÖu*lËp ph­¬ng ®¼ng cÊp ng­êi ch¬i/lËp ph­¬ng 80] ®iÓm kinh nghiÖm\nSö dông 50 ®iÓm tİch luü ®Ó ®æi 8 'R­¬ng kû niÖm 20 n¨m'+[5 triÖu*lËp ph­¬ng ®¼ng cÊp ng­êi ch¬i/lËp ph­¬ng 80] ®iÓm kinh nghiÖm\nSö dông 200 ®iÓm tİch luü ®Ó ®æi 35 'R­¬ng kû niÖm 20 n¨m'+[10 triÖu*lËp ph­¬ng ®¼ng cÊp ng­êi ch¬i/lËp ph­¬ng 80] ®iÓm kinh nghiÖm\nSö dông 200 ®iÓm tİch luü ®Ó ®æi 1 Hîp Thµnh MËt TŞch\n    <color=red>Chó ı, mçi tuÇn chØ cã thÓ ®æi phÇn th­ëng kinh nghiÖm nhiÒu nhÊt lµ 21 lÇn, b¶o r­¬ng cã thÓ ®æi kh«ng giíi h¹n.<color>");
end;

function get_equip_describe(nEquipType,nLevel,nJO)
	local tbEquipName = {"Trang søc","Ngo¹i trang","QuÇn ","Vò khİ"};
	local szEquipName = "";
	local szLingQi = "";
	local tbEquipInfo = {};
	local nBody = GetBody();
	if nEquipType == nil then
		return "";
	end;
	local tbEquip = g_tbEquip[nEquipType];
	if nLevel == nil and nJO == nil then
		return "<color=yellow>"..tbEquipName[nEquipType].."<color>";
	elseif nLevel ~= nil and nJO == nil then
		if nEquipType ~= 4 then
			szEquipName = "<color=yellow>"..tbEquip[nBody][nLevel][1].."<color>";
		else
			if nLevel == 1 then
				szEquipName = "<color=yellow>Vò khİ cÊp 9<color>";
			elseif nLevel == 2 then
				szEquipName = "<color=yellow>Vò khİ cÊp 10<color>";
			end;
		end;
		return szEquipName;
	else
		if nEquipType ~= 4 then
			szEquipName ="<color=yellow>".. tbEquip[nBody][nLevel][1].."<color>";
			tbEquipInfo = tbEquip[nBody][nLevel];
		else
			if nLevel == 1 then
				szEquipName = "<color=yellow>Vò khİ cÊp 9<color>";
			elseif nLevel == 2 then
				szEquipName = "<color=yellow>Vò khİ cÊp 10<color>";
			end;
			local nRoute = GetPlayerRoute();
			local nWeaponIdx = 0;
			if nRoute == 2 then
				nWeaponIdx = g_tbRouteEquip[nRoute][GetTask(TSK_WEAPON_TYPE)];
			else
				nWeaponIdx = g_tbRouteEquip[nRoute][random(1,getn(g_tbRouteEquip[nRoute]))];
			end;
			tbEquipInfo = g_tbEquipWeapon[nWeaponIdx][nLevel];
			if gf_CheckPlayerRoute() == 1 then
				szEquipName = tbEquipInfo[1];
			end;
		end;
		if nJO == 1 then
			szLingQi = "<color=red>Linh khİ 111<color>";
		elseif nJO == 2 then
			szLingQi = "<color=red>Linh khİ 110<color>";
		end;
		szEquipName = szLingQi.." cña <color=yellow>"..szEquipName.."<color>"
		return szEquipName,tbEquipInfo;
	end;
end;

function enter_aoyun_game(nType)	
	if nType == GAME_ID_GUESS then
		aoyun_guess_main();
	elseif nType == GAME_ID_BOX then
		aoyun_box_main();
	elseif nType == GAME_ID_LIGHT then
		aoyun_light_main();
	end;
end;

function diandeng_buchang()
	if GetTask(571) ~= 0 then
		Talk(1,"",g_szInfoHead.."B¹n ®· nhËn båi th­êng råi.");
		return
	end
	local nGuan = GetTask(TSK_AOYUN_LIGHT_GUAN);
	if nGuan == 0 then
		Talk(1,"",g_szInfoHead.."TuÇn tr­íc ng­¬i kh«ng tham gia héi hoa ®¨ng nªn kh«ng thÓ nhËn phÇn th­ëng.");
	else
		QX08_GetAward(3,6-nGuan,571); 		
	end
end

function get_book()
	if GetItemCount(2,0,1090) >= 1 then
		Talk(1,"",g_szInfoHead.."Kh«ng ph¶i trªn ng­êi ng­¬i ®· cã mét c¸i råi sao?");
		return 0
	end
	AddItem(2,0,1090,1);
end

function get_years_title()
	local nYear6,nMonth6,nDay6 = QX08_GetDate(g_nYearsEndDate);
	Say(g_szInfoHead.."Hai m­¬i n¨m tr­íc, CÇu B¸ Qu©n tiªn sinh ®· viÕt nªn phÇn mÒm xö lı wps, ®¸nh dÊu viÖc s¸ng lËp Kingsoft. Chíp m¾t ®· 20 n¨m tr«i qua, Kingsoft ®· tr¶i qua biÕt bao th¨ng trÇm, nh­ng kh«ng cã sù quan t©m ñng hé cña ng­êi dïng th× sÏ kh«ng cã Kingsoft ngµy h«m nay. Tõ 18/11 ®Õn 23h 24/11, nh©n dŞp kû niÖm 20 n¨m thµnh lËp Kingsoft, chóng t«i ®· chuÈn bŞ mét sè lÔ vËt, hy väng b¹n sÏ thİch!",
			3,
			"NhËn danh hiÖu Mõng trßn 20 n¨m (Thêi h¹n nhËn: "..nYear6.."niªn"..nMonth6.."NguyÖt"..nDay6..")/ask_get_title",
			"KiÓm tra thêi gian nhËn danh hiÖu vµ thêi gian hiÖu qu¶/check_title_time",
			"Ta chØ ®Õn xem thö/nothing");
end

function ask_get_title()
	local nHour = tonumber(date("%H"));
	if GetTask(TSK_YEARS_BEGIN_DATE) ~= 0 then
		Talk(1,"",g_szInfoHead.."B¹n ®· nhËn danh hiÖu råi.");
		return 0;
	end
	if nHour >= 23 then
		Say(g_szInfoHead.."B©y giê ®· qu¸ 23h, nÕu b¹n nhËn danh hiÖu lóc nµy, b¹n sÏ kh«ng nhËn ®­îc kinh nghiÖm 1h cña ngµy h«m nay. Khuyªn b¹n ngµy mai h·y nhËn danh hiÖu. B¹n cã muèn nhËn lóc nµy kh«ng?",
			2,
			"Ta muèn nhËn /ask_get_title2",
			"Ngµy mai l¹i ®Õn nhËn /nothing");
	else
		ask_get_title2();
	end
end

function ask_get_title2()
	Say(g_szInfoHead.."Danh hiÖu kû niÖm 20 n¨m, sau khi sö dông, mçi phót sÏ t¨ng 0.5% kinh nghiÖm, lín h¬n <color=yellow>"..tYearsExp[IB_VERSION][1].."<color> giê, tèi ®a nhËn ®­îc "..tYearsExp[IB_VERSION][1]..", mçi ngµy cã hiÖu qu¶ trong 1h, <color=yellow>7 ngµy<color> sau danh hiÖu sÏ biÕn mÊt.",
		2,
		"Ta biÕt råi, ta muèn nhËn danh hiÖu/confirm_get_title",
		"Ta ch­a muèn nhËn danh hiÖu/nothing")
end

function confirm_get_title()
	local nDate = tonumber(date("%Y%m%d"));
	if IsTitleExist(3,8) > 0 then
		return
	end	
	if AddTitle(3, 8) > 0 then
		SetCurTitle(3,8);
	end
	SetTask(TSK_YEARS_BEGIN_DATE,nDate);
	local nEndDate = tf_GetResultDate(GetTask(TSK_YEARS_BEGIN_DATE),g_nYearsDays-1);
	SetTask(TSK_YEARS_END_DATE,nEndDate);	
end

function check_title_time()
	local nBeginDate = GetTask(TSK_YEARS_BEGIN_DATE);
	local nYear6,nMonth6,nDay6 = QX08_GetDate(g_nYearsEndDate);
	if nBeginDate == 0 then
		Talk(1,"get_years_title",g_szInfoHead.."Thêi gian hÕt h¹n nhËn danh hiÖu lµ: <color=yellow>"..nYear6.."niªn"..nMonth6.."NguyÖt"..nDay6.." ngµy<color>.");
	else
		local nEndDate = GetTask(TSK_YEARS_END_DATE);
		local nYear1,nMonth1,nDay1 = QX08_GetDate(nBeginDate);
		local nYear2,nMonth2,nDay2 = QX08_GetDate(nEndDate);
		Talk(1,"get_years_title",g_szInfoHead.."Thêi gian nhËn danh hiÖu cña b¹n lµ <color=yellow>"..nYear1.."niªn"..nMonth1.."NguyÖt"..nDay1.." ngµy<color>, thêi gian hÕt h¹n nhËn kinh nghiÖm lµ <color=yellow>"..nYear2.."niªn"..nMonth2.."NguyÖt"..nDay2.." ngµy<color>.");
	end
end