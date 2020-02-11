--create date:07-04-10
--author:yanjun
--describe:¹¥³ÇÊ¹Õß½Å±¾
Include("\\script\\gongcheng\\gongcheng_function.lua")
Include("\\script\\online\\zgc_public_fun.lua")

g_InfoHeader = "<color=green>§¹i sø c«ng thµnh<color>: .";

function main()
	if GetGlbValue(GLB_GONGCHENG_FORBIDEN) == 1 then
		Talk(1,"",g_InfoHeader.."Thµnh nµy t¹m thêi do triÒu ®×nh tiÕp qu¶n");
		return 0;
	end;
	local selTab = {
				"* Giíi thiÖu l­u tr×nh vµ quy t¾c C«ng thµnh/know_rule",
				"* Ta muèn vµo Khu vùc C«ng thµnh/enter_battle",
				"* Ta muèn xem tin tøc chiÕn b¸o C«ng thµnh hiÖn t¹i/view_gongcheng_info",
				"* PhÇn th­ëng C«ng thµnh chiÕn/get_award",
				"Ta chØ tiÖn ®­êng hái ch¬i!/nothing",
				}
	Say(g_InfoHeader.."Mçi tuÇn thµnh thŞ ®Òu më 'Bang héi C«ng thµnh chiÕn', lÊy chiÕm lÜnh vµ tiªu hñy §¹i kú cña ®Şch lµm môc tiªu. Bang ph¸i lµm Thµnh Chñ sÏ ®­îc phÇn th­ëng cña triÒu ®×nh",getn(selTab),selTab);
end;

function view_gongcheng_info()
	local nCityMapID = GetWorldPos();
	local nBattleMapID = GCZ_GetBattleMapID(nCityMapID);
	local nGTotal,nGNormal,nGRfm = GCZ_GetCampPlayerCount(GONG_ID,nBattleMapID);
	local nSTotal,nSNormal,nSRfm = GCZ_GetCampPlayerCount(SHOU_ID,nBattleMapID);
	local szGong,szShou = GCZ_GetCampNameFromRelay(nCityMapID,ALL_ID);
	if szGong == "" then
		szGong = "Ch­a";
	end;
	if szShou == "" then
		szShou = "Ch­a";
	end;
	szGong = replace(szGong, "/" ,"-")
	szGong = replace(szGong, "|" ,"-")
	szGong = replace(szGong, ":" ,"-")
	szShou = replace(szShou, "/" ,"-")
	szShou = replace(szShou, "|" ,"-")
	szShou = replace(szShou, ":" ,"-")
	Say(g_InfoHeader.."\nPhe thñ thµnh: <color=yellow>"..szShou.."<color>, Phe c«ng thµnh: <color=red>"..szGong.."<color>\nT×nh h×nh chiÕn sù hiÖn t¹i: \nTæng nh©n sè phe c«ng: <color=yellow>"..nGTotal.."<color> Nh©n sè ngo¹i viÖn phe c«ng: <color=yellow>"..nGRfm.."<color>\nTæng nh©n sè phe thñ: <color=yellow>"..nSTotal.."<color> Nh©n sè ngo¹i viÖn phe thñ: <color=yellow>"..nSRfm.."<color>",0);
end;

function know_rule()
	local selTab = {
				"* Tranh ®o¹t t­ c¸ch C«ng thµnh/introduce_qualification",
				"* Giíi thiÖu chi tiÕt C«ng thµnh chiÕn/introduce_detail",
				--"¡ô ³ÇÊĞË°ÊÕ/introduce_tax",
				"* Quay l¹i/main",
				"Ta chØ tiÖn ®­êng hái ch¬i!/nothing",
				}
	Say(g_InfoHeader,getn(selTab),selTab);
end;

function introduce_qualification()
	Talk(1,"know_rule",g_InfoHeader.."Mçi <color=yellow>tèi thø S¸u<color> sÏ tiÕn hµnh thi ®Êu L«i ®µi theo thÓ thøc lo¹i trùc tiÕp, bang héi qu¸n qu©n sÏ giµnh ®­îc t­ c¸ch tham gia c«ng thµnh chiÕn thµnh thŞ t­¬ng øng? (Khi thµnh thuéc vÒ Trung lËp sÏ trùc tiÕp thµnh Thµnh Chñ cña thµnh ®ã). <enter>H¹n chÕ L«i ®µi: bang ph¸i ®· chiÕm ®­îc thµnh thŞ kh«ng cÇn tham mgia thi ®Êu L«i ®µi, mµ mÆc nhiªn lµ Thµnh Chñ phe thñ, vµ còng kh«ng ®­îc tranh ®o¹t t­ c¸ch c«ng thµnh thµnh kh¸c. Mçi bang ph¸i tham gia L«i ®µi ph¶i do <color=yellow>Bang chñ l·nh ®éi<color> vµ bang chñ ®ã ph¶i l·nh ®¹o bang ph¸i <color=yellow>İt nhÊt 7 ngµy<color>, ®ång thêi <color=yellow>tÊt c¶ thµnh viªn trong ®éi ®Òu ph¶i trªn cÊp 80 vµ ph¶i gia nhËp bang héi İt nhÊt 7 ngµy<color>");
end;

function introduce_detail()
	Talk(1,"introduce_detail_2",g_InfoHeader.."Mçi 7h tèi thø S¸u, bang héi giµnh ®­îc t­ c¸ch C«ng thµnh sÏ ph¸t ®éng C«ng thµnh chiÕn ®Õn thµnh thŞ t­¬ng øng<enter> <color=yellow>§iÒu kiÖn vµo Khu vùc C«ng thµnh<color>: Nh»m phßng chèng gian tÕ, chØ thµnh viªn ®· gia nhËp bang ph¸i trªn 7 ngµy míi ®­îc trùc tiÕp tham gia c«ng thµnh chiÕn. Nh÷ng ng­êi kh¸c (cã thÓ kh«ng ph¶i lµ thµnh viªn bang héi) muèn vµo khu vùc cÇn ph¶i tæ ®éi víi ng­êi cã chøc vô tõ §­êng chñ trë lªn, ®éi tr­ëng cã sè l­îng <color=yellow>Dòng SÜ lÖnh<color> t­¬ng ®­¬ng lµ ®­îc. Sau khi thµnh ngo¹i viÖn, trong thêi gian C«ng thµnh chiÕn cã thÓ tïy ı ra vµo khu vùc chiÕn ®Êu. Tèi ®a chØ cã <color=yellow>150 ng­êi c«ng (thñ) thµnh<color>, ng­êi ch¬i ch­a gia nhËp m«n ph¸i kh«ng thÓ vµo khu vùc nµy<enter> <color=yellow>Khu an toµn<color>: Ng­êi ch¬i tö vong sÏ ®­îc håi sinh trong Khu an toµn. C¸c ®iÓm truyÒn tèng trong Khu an toµn kh¸c nhau sÏ truyÒn tèng ®Õn c¸c ®iÓm tËp kÕt kh¸c nhau trong thµnh");
end;

function introduce_detail_2()
	Talk(1,"introduce_detail_3",g_InfoHeader.."<enter> <color=yellow>§iÓm tËp kÕt<color>: Tõ Khu an toµn vµo Khu vùc C«ng thµnh ph¶i qua §iÓm tËp kÕt.<enter> <color=yellow>Thµnh thŞ ®¹i kú<color>: Trong thµnh cã <color=yellow>3 ®¹i kú<color>, cã thÓ bŞ ph¸ háng vÜnh viÔn. §¹i kú mét khi bŞ ph¸ háng th× phe c«ng sÏ ®­îc t¨ng ®iÓm tİch lòy c«ng thµnh<enter> <color=yellow>C¸c kiÕn tróc cã thÓ chiÕm lÜnh<color>: trong thµnh cã <color=yellow>7 kiÕn tróc cã thÓ chiÕm lÜnh<color>, khai cuéc do phe thñ chiÕm lÜnh. Khi Phe c«ng ph¸ hñy thµnh c«ng sÏ chuyÓn quyÒn chiÕm lÜnh vµ t¨ng ®iÓm tİch lòy. Khi phe thñ chiÕm l¹i ®­îc th× ®iÓm tİch lòy cña phe c«ng còng sÏ bŞ trõ ®i");
end;

function introduce_detail_3()
	Talk(2,"introduce_detail_4",g_InfoHeader.."<enter> <color=yellow>Thêi gian C«ng thµnh vµ quy t¾c th¾ng thua<color>: Thêi gian C«ng thµnh chiÕn lµ 2 tiÕng, mçi tèi thø B¶y tõ 19-21h. 19h Khu vùc C«ng thµnh sÏ vµo giai ®o¹n chuÈn bŞ, thêi gian chuÈn bŞ 30 phót. NÕu trong thêi gian chiÕn ®Êu, Phe c«ng giµnh ®­îc <color=yellow>8 phÇn ®iÓm tİch ph©n th× C«ng thµnh chiÕn kÕt thóc<color>, nÕu hÕt thêi gian, Phe c«ng ®­îc <color=yellow>tõ 6 phÇn ®iÓm tİch lòy trë lªn lµ chiÕn th¾ng<color> vµ ng­îc l¹i",g_InfoHeader.."<enter> <color=yellow>Thñ vÖ thµnh m«n vµ C«ng thµnh tiªn phong<color>: Bang héi phe thñ cÇn thiÕt lËp Thñ vÖ thµnh m«n, thiÕt lËp xong c¸c thµnh m«n ®èi øng trong thµnh thŞ sÏ vµo tr¹ng th¸i ®ãng. Ng­êi ch¬i phe c«ng sö dông C«ng thµnh Tiªn phong lÖnh cã thÓ khiªu chiÕn ng­êi ch¬i Thñ vÖ thµnh m«n. Thñ VÖ lÖnh vµ C«ng thµnh Tiªn phong lÖnh cã b¸n ë Thñ thµnh Tham m­u vµ C«ng thµnh Tham M­u. Giµnh th¾ng lîi trong khiªu chiÕn ®¬n ®Êu sÏ trë thµnh T©n Thñ vÖ thµnh m«n, thµnh m«n sÏ t¹m thêi më ra. Sau ®ã phe thñ cã thÓ l¹i sö dông C«ng thµnh Tiªn phong lÖnh ®Ó khiªu chiÕn, ®o¹t l¹i thµnh m«n.");
end;

function introduce_detail_4()
	Talk(1,"know_rule",g_InfoHeader.."<enter> <color=yellow>khiªu chiÕn ®¬n ®Êu<color>: thµnh thŞ cã 3 thµnh m«n cã thÓ tÊn c«ng. NÕu phe thñ ®¶m nhiÖm chøc Thñ vÖ th× thµnh m«n sÏ vµo tr¹ng th¸i ®ãng, giai ®o¹n nµy thµnh viªn phe thñ cã thÓ tù do ra vµo thµnh m«n, phe c«ng kh«ng thÓ. Cã hai c¸ch ®Ó më thµnh m«n.1. c«ng kİch ph¸ hñy thµnh m«n, 2.Sö dông C«ng thµnh Tiªn phong lÖnh ph¸t khiªu chiÕn ®¬n ®Êu tíi Thñ vÖ thµnh m«n vµ ph¶i giµnh chiÕn th¾ng th× thµnh m«n sÏ ®­îc më t¹m thêi, tÊt c¶ ng­êi ch¬i ®Òu cã thÓ tïy ı ra vµo. Lóc nµy kh¶ n¨ng phßng ngù cña thµnh m«n gi¶m ®¸ng kÓ. §­¬ng nhiªn Phe thñ thµnh còng cã thÓ th«ng qua khiªu chiÕn ®¬n ®Êu ®Ó ®o¹t l¹i thµnh m«n.");
end;

function introduce_tax()
	Talk(2,"know_rule",g_InfoHeader.."Bang ph¸i Thµnh Chñ cã thÓ thu thuÕ trong chiÕm ®­îc<enter>* ThuÕ mua b¸n: ng­êi ch¬i mua hoÆc b¸n bÊt cø vËt phÈm nµo cho NPC trong thµnh ®Òu sÏ bŞ tr­ng thu mét phÇn thuÕ<enter>* ThuÕ bµy b¸n: ng­êi ch¬i bµy b¸n trong thµnh thŞ, sÏ bŞ tr­ng thu thuÕ n¹p cho Bang ph¸i Thµnh Chñ",g_InfoHeader.."<enter># ThuÕ suÊt: Thµnh Chñ cã thÓ tù do söa thuÕ suÊt (<color=yellow>Trong giíi h¹n thuÕ suÊt 10%<color>). §èi víi h×nh thøc thuÕ bµy b¸n sÏ tİnh theo thêi gian thu.<enter># TÊt c¶ thuÕ suÊt sÏ ®­îc gi÷ t¹i c«ng thµnh ®¹i sø, thêi gian thu thuÕ lµ thêi gian thùc, <color=yellow> vµo 0 giê thø 7 sÏ xãa vÒ 0<color>, qu¸ h¹n kh«ng tr¶ l¹i. <color=yellow> Thêi gian thu thuÕ sÏ lµ tõ 0 giê chñ nhËt ®Õn 24 giê thø 6<color>, ch­a ph¶i thêi gian thu thuÕ hoÆc ch­a më c«ng thµnh th× tÊt c¶ thuÕ suÊt sÏ ®¸nh 10%.<enter> Nh÷ng thuÕ suÊt trªn ®èi v« hiÖu víi thµnh viªn bæn bang.");
end;

function enter_battle()
	local nCityMapID = GetWorldPos();
	local selTab = {
			"* Ta muèn vµo C«ng thµnh /#single_enter(1)",
			"* Ta muèn dÉn ngo¹i viÖn vµo C«ng thµnh /#reinforcement_enter(1)",
			"* Ta muèn vµo Thñ thµnh/#single_enter(2)",
			"* Ta muèn dÉn ngo¹i viÖn vµo Thñ thµnh/#reinforcement_enter(2)",
			"Ta chØ ®Õn xem/nothing",
			}			
	if GetPKValue() >= 4 then
		Talk(1,"",g_InfoHeader.."Ng­¬i ®· lµm nhiÒu ®iÒu ¸c, ®ang bŞ truy n· th× lµm sao tiÕn vµo chiÕn tr­êng?");
		return 0;
	end
	local nBattleMapID = GCZ_GetBattleMapID(nCityMapID);
	local nGTotal,nGNormal,nGRfm = GCZ_GetCampPlayerCount(GONG_ID,nBattleMapID);
	local nSTotal,nSNormal,nSRfm = GCZ_GetCampPlayerCount(SHOU_ID,nBattleMapID);
	local szGong,szShou = GCZ_GetCampNameFromRelay(nCityMapID,ALL_ID);
	szGong = replace(szGong, "/" ,"-")
	szGong = replace(szGong, "|" ,"-")
	szGong = replace(szGong, ":" ,"-")
	szShou = replace(szShou, "/" ,"-")
	szShou = replace(szShou, "|" ,"-")
	szShou = replace(szShou, ":" ,"-")
	if szGong == "" then
		szGong = "Ch­a";
	end;
	if szShou == "" then
		szShou = "Ch­a";
	end;
	Say(g_InfoHeader.."\nPhe thñ thµnh: <color=yellow>"..szShou.."<color>, Phe c«ng thµnh: <color=red>"..szGong.."<color>\nT×nh h×nh chiÕn sù hiÖn t¹i: \nTæng nh©n sè phe c«ng: <color=yellow>"..nGTotal.."<color> Nh©n sè ngo¹i viÖn phe c«ng: <color=yellow>"..nGRfm.."<color>\nTæng nh©n sè phe thñ: <color=yellow>"..nSTotal.."<color> Nh©n sè ngo¹i viÖn phe thñ: <color=yellow>"..nSRfm.."<color>",getn(selTab),selTab);
end;

function single_enter(nCamp)
	local nRoute = GetPlayerRoute();
	if nRoute == 0 then
		Talk(1,"",g_InfoHeader.."Ch­a gia nhËp m«n ph¸i, kh«ng thÓ vµo chiÕn tr­êng");
		return 0;
	end;
	local nCityMapID = GetWorldPos();
	local nBattleMapID = GCZ_GetBattleMapID(nCityMapID);
	if nBattleMapID == 0 then
		Talk(1,"",g_InfoHeader.."§­êng ®i phİa tr­íc kh«ng th«ng!");
		return 0;
	end;
	if mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,nBattleMapID) == MS_STATE_IDEL then
		Talk(1,"",g_InfoHeader.."Giai ®o¹n nµy bÊt cø ai còng kh«ng ®­îc vµo!");
		return 0;
	end;
	local nPlayerCount = GCZ_GetCampPlayerCount(nCamp,nBattleMapID);
	if nPlayerCount >= MAX_TOTAL_PLAYER then
		Talk(1,"",g_InfoHeader.."Nh©n sè trong chiÕn tr­êng hiÖn ®· ®ñ. Xin h·y ®îi sau…");
		return 0;
	end;
	local nCurBattleMUID = mf_GetMissionV(MISSION_ID,MV_MISSION_UID,nBattleMapID);
	local nMyBattleMUID = GetTask(TNC_MUID);
	if nMyBattleMUID ~= 0 and nMyBattleMUID == nCurBattleMUID and GetTask(TNC_CAMP) == nCamp then	--Èç¹ûÖ®Ç°½øÈ¥¹ı¾ÍÖ±½Ó½øÈ¥°É
		transmit_single_man(nCamp,nBattleMapID);
		return 0;
	end;
	--Èç¹ûÃ»½øÈ¥¹ı¾ÍÅĞ¶ÏËûÊÇ·ñÂú×ã½øÈëÌõ¼ş
	if (GCZ_GetJoinTongDayCount() < LEAST_STAY_DAY or GetTongName() ~= GCZ_GetCampNameFromRelay(nCityMapID,nCamp)) and LIMIT_IGNORE == 0 then
		Talk(1,"",g_InfoHeader.."Chİ cã thµnh viªn ®· tham gia bang héi trªn <color=yellow>"..LEAST_STAY_DAY.."<color> ngµy míi ®­îc tùc tiÕp vµo")
		return 0;
	end;
	transmit_single_man(nCamp,nBattleMapID);
end;

function reinforcement_enter(nCamp)
	local nRoute = GetPlayerRoute();
	if nRoute == 0 then
		Talk(1,"",g_InfoHeader.."Ch­a gia nhËp m«n ph¸i, kh«ng thÓ vµo chiÕn tr­êng");
		return 0;
	end;
	local nCityMapID = GetWorldPos();
	local nBattleMapID = GCZ_GetBattleMapID(nCityMapID);
	if mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,nBattleMapID) == MS_STATE_IDEL then
		Talk(1,"",g_InfoHeader.."Giai ®o¹n nµy bÊt cø ai còng kh«ng ®­îc vµo!");
		return 0;
	end;
	local nPlayerCount = GCZ_GetCampPlayerCount(nCamp,nBattleMapID);
	local nTeamSize = GetTeamSize();
	if nTeamSize == 0 then
		Talk(1,"enter_battle",g_InfoHeader.."B¹n kh«ng dÉn theo viÖn binh nµo!");
		return 0;
	end;
	if nPlayerCount + nTeamSize > MAX_TOTAL_PLAYER then
		Talk(1,"",g_InfoHeader.."Nh©n sè trong chiÕn tr­êng hiÖn ®· ®ñ. Xin h·y ®îi sau…");
		return 0;
	end;
	if GetCaptainName() ~= GetName() then	--Èç¹û²»ÊÇ¶Ó³¤
		Talk(1,"enter_battle",g_InfoHeader.."ChØ cã ®éi tr­ëng míi cß t­ c¸ch nãi chuyÖn víi ta!");
		return 0;
	end;
	if (GCZ_CheckPlayerRight(4,LEAST_STAY_DAY) == 0 or GetTongName() ~= GCZ_GetCampNameFromRelay(nCityMapID,nCamp)) and LIMIT_IGNORE == 0 then
		Talk(1,"enter_battle",g_InfoHeader.."Ng­¬i ph¶i lµ "..tCampNameZ[nCamp].." §­êng chñ hoÆc trªn §­êng chñ vµ ®· nhËn chøc "..LEAST_STAY_DAY.." ngµy míi cã thÓ dÉn viÖn binh vµo chiÕn tr­êng");
		return 0;
	end;
	local nRoute0Count = GCZ_GetTeamRouteCount(0);
	if nRoute0Count ~= 0 then
		Talk(1,"",g_InfoHeader.."§éi cña ng­¬i cã <color=red>"..nRoute0Count.."<color> ng­êi ch­a gia nhËp m«n ph¸i…");
		return 0;
	end;
	local nRfmCount,nNeedTokenCount = GCZ_GetTeamReinforcementCount(nCamp,nBattleMapID);
	local _,_,nRfmInBattleCount = GCZ_GetCampPlayerCount(nCamp,nBattleMapID);
	local nRfmLeft = MAX_REINFORCEMENT - nRfmInBattleCount;	--¿É½øÈëÍâÔ®Êı
	if nRfmCount > nRfmLeft then
		Talk(1,"",g_InfoHeader.."Ngo¹i viÖn cña ng­¬i qu¸ ®«ng, HiÖn phe cña ng­¬i ®· cã <color=yellow>"..nRfmInBattleCount.."<color> ngo¹i viÖn vµo chiÕn tr­êng, b©y giê chØ cã thÓ vµo thªm <color=yellow>"..nRfmLeft.."<color> ng­êi n÷a th«i!");
		return 0;
	end;
	local nCurTokenCount = GetItemCount(tItemInfo[3][2],tItemInfo[3][3],tItemInfo[3][4]);
	local szToken = tItemInfo[3][1];
	if nCurTokenCount < nNeedTokenCount then
		Talk(1,"",g_InfoHeader.."<color=yellow>"..szToken.."<color> kh«ng ®ñ! §éi ng­¬i hiÖn cã <color=yellow>"..nNeedTokenCount.."<color> ng­êi míi gia nhËp viÖn binh, cÇn cã <color=yellow>"..nNeedTokenCount.."<color> "..szToken..".");
		return 0;
	end;
	if DelItem(tItemInfo[3][2],tItemInfo[3][3],tItemInfo[3][4],nNeedTokenCount) == 1 then
		transmit_team(nCamp,nBattleMapID);
	end;
end;
--´«ËÍµ¥¸öÍæ¼Ò
function transmit_single_man(nCamp,nBattleMapID)
	GCZ_NewBattleClear();
	CleanInteractive();
	mf_JoinMission(MISSION_ID,nCamp,nBattleMapID);
end;
--´«ËÍÒ»¶ÓÍæ¼Ò
function transmit_team(nCamp,nBattleMapID)
	local nTeamSize = GetTeamSize();
	local nOldPlayerIdx = PlayerIndex;
	local tbPlayer = {};
	for i=1,nTeamSize do
		tbPlayer[i] = GetTeamMember(i)
	end;
	for i=1,getn(tbPlayer) do
		PlayerIndex = tbPlayer[i];
		transmit_single_man(nCamp,nBattleMapID);
	end;
	PlayerIndex = nOldPlayerIdx;
end;

function get_award()
	local nWinBag = GetTask(TASK_AWARD_WIN);
	local nLoseBag = GetTask(TASK_AWARD_LOST);
	local selTab = {
				"Ta muèn l·nh tÊt c¶ phÇn th­ëng C«ng thµnh chiÕn! (®¹i bao)/#get_bag(1)",
				"Ta muèn l·nh tÊt c¶ phÇn th­ëng C«ng thµnh chiÕn! (tiÓu bao)/#get_bag(2)",
				"Quay l¹i néi dung tr­íc./main",
				"KÕt thóc ®èi tho¹i/nothing",
				}
--	if tonumber(date("%w")) == 4 then
--		tinsert(selTab, 3, "Ta muèn nhËn phÇn th­ëng Qu©n S­/get_junshi_award");
--	end
	Say(g_InfoHeader.."Ng­¬i hiÖn cßn cã <color=yellow>"..nWinBag.." phÇn th­ëng C«ng thµnh chiÕn! (®¹i bao)<color> vµ <color=yellow>"..nLoseBag.." phÇn th­ëng C«ng thµnh chiÕn! (tiÓu bao)<color> ch­a l·nh! B©y giê l·nh chø?",getn(selTab),selTab);
end;
--Ê¹ÓÃ¼ÆËãÆ«ÒÆÁ¿µÄ·½Ê½À´Ëõ¼õ´úÂëĞĞÊı¡£
--ÕâÖÖ·½·¨¿ÉÒÔ´óÁ¿¼õÉÙif elseif else½á¹¹£¬µ«ÊÇ¸÷¸ö±äÁ¿µÄ¶¨ÒåĞè½÷É÷£¬²»ÄÜËæ±ã¸Ä¶¯±äÁ¿ID
function get_bag(nType)
	local nBagCount = GetTask(TASK_AWARD_WIN+nType-1);
	if gf_JudgeRoomWeight(2,nBagCount) == 0 then
		Talk(1,"",g_InfoHeader.."R­¬ng hoÆc søc lùc cña ng­¬i kh«ng ®ñ! H·y quay l¹i sau nhĞ!");
		return 0;
	end;
	local nItemIndex = 4+nType;	--ÎïÆ·ÔÚtItemInfoÖĞµÄË÷Òı
	if nBagCount <= 0 then
		Talk(1,"get_award",g_InfoHeader.."Ng¹i qu¸! <color=yellow>"..tItemInfo[nItemIndex][1].."<color> ng­¬i muèn l·nh chØ cßn <color=red>0<color>. ChØ nh÷ng ai tham gia toµn trËn C«ng thµnh chiÕn míi ®­îc nhËn phÇn th­ëng");
		return 0;
	end;	
	SetTask(TASK_AWARD_WIN+nType-1,0);
	AddItem(tItemInfo[nItemIndex][2],tItemInfo[nItemIndex][3],tItemInfo[nItemIndex][4],nBagCount);
	WriteLog("[c«ng thµnh C«ng thµnh chiÕn]:"..GetName().."§· nhËn "..nBagCount.."c¸i"..tItemInfo[nItemIndex][1]);	
end;

function get_junshi_award()
	do return end
	local tTitle = 
	{
		[100] = {7},
		[300] = {3},
		[350] = {11},
	}
	local nMapID = GetWorldPos()
	local nNeedTitle = tTitle[nMapID][1]
	local szTongName, nCessBuysell, nCessStore, nTime = GetCityWarInfo(nMapID, "base")
	if szTongName ~= GetTongName() or IsTitleExist(51, nNeedTitle) == 0 then
		Say(g_InfoHeader.."Ng­¬i kh«ng ph¶i lµ Qu©n S­ thµnh thŞ nµy, kh«ng thÓ nhËn th­ëng ®­îc.", 0)
		return 0;
	end
	if GetTask(2546) == 0 then
		Say(g_InfoHeader.."Ng­¬i ®· nhËn phÇn th­ëng nµy råi, kh«ng thÓ nhËn thªm ®­îc n÷a.", 0);
		return 0;
	end
	if gf_JudgeRoomWeight(15, 100) == 0 then
		Talk(1,"",g_InfoHeader.."R­¬ng hoÆc søc lùc cña ng­¬i kh«ng ®ñ! H·y quay l¹i sau nhĞ!");
		return 0;
	end;
	
	local nRetCode, nIndex;
	for i = 1, 8 do
		nRetCode, nIndex = gf_AddItemEx({2,1,1001,1}, "Hßa ThŞ Bİch");
		if nRetCode == 1 then
			SetItemExpireTime(nIndex, 7 * 24 * 3600);
		end
	end
	nRetCode, nIndex = gf_AddItemEx({2,1,1067,1}, "§Şnh Hån Thiªn Th¹ch ThÇn Th¹ch");
	if nRetCode == 1 then
		SetItemExpireTime(nIndex, 7 * 24 * 3600);
	end
	for i = 1, 2 do
		nRetCode, nIndex = gf_AddItemEx({2,1,1049,1}, "Bao m¶nh Thiªn Th¹ch");
		if nRetCode == 1 then
			SetItemExpireTime(nIndex, 7 * 24 * 3600);
		end
	end
	for i = 1, 2 do
		nRetCode, nIndex = gf_AddItemEx({2,1,1050,1}, "Bao Thiªn Th¹ch");
		if nRetCode == 1 then
			SetItemExpireTime(nIndex, 7 * 24 * 3600);
		end
	end
	gf_AddItemEx({0,107,155,2}, "Ngò Hµnh MËt tŞch");
	
	SetTask(2546, 0);
end