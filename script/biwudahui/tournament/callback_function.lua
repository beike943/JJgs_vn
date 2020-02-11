--Create date:2008-1-9 10:29
--Author:yanjun
--Description:ÏµÍ³µÄ»Øµ÷½Å±¾
Include("\\script\\biwudahui\\tournament\\tournament_function.lua");
g_szInfoHead = "";

--°´Å¥»Øµ÷º¯Êı
function OnButton(nBtID)
	local nSignUpInfo = GetTask(TSK_SIGN_UP);
	local nCurRealResult = GetTask(TSK_CURREALRESULT);	--µ±Ç°½ÏÒÕ»ı·Ö
	BWT_WeeklyClear();
	local nVersion,nCurGs = GetRealmType();
	if GetTaskTemp(TSK_TEMP_CAMP) ~= 0 then
		Talk(1,"","Kh«ng thÓ thùc hiÖn thao t¸c nµy!");
		return 0;
	end;
	local nLevel = GetLevel();
	if nBtID == 1 then	--¡°¹Û¿´½ÏÒÕ¡±
		if nCurGs == 1 then
			Talk(1,"","Kh«ng thÓ thùc hiÖn thao t¸c nµy ë ®©y.");
			return 0;
		end
		GLB_BW_ChangeItem();
		return 1;
	end;
	if nBtID == 2 then	--²Î¼Ó½ÏÒÕ
		if nCurGs == 1 then --ÔÚ¿ç·şÇø
			local selTab = {
				"Ta chØ muèn tham gia 1 lÇn tû vâ toµn quèc/#join_list_confirm(1)",
				"T«i chØ muèn lu«n tham gia tû vâ toµn quèc/#join_list_confirm(2)",
				"T¹m thêi kh«ng tham gia/nothing",
			};
			Say("B¹n muèn <color=yellow>tham gia 1 lÇn tû vâ toµn quèc<color> hay lµ <color=yellow>lu«n tham gia tû vâ toµn quèc<color>?",
				getn(selTab),
				selTab)
		else --ÔÚ±¾·ş
			go_to_biwu_npc();
			return 1;
		end
	end;
	if nBtID == 3 then	--ÍË³ö½ÏÒÕ
		BWT_QuitGestConvention();
		Talk(1,"","Ng­¬i ®· ngõng so tµi.");
		return 1;
	end;
	if nBtID == 4 then	--ÁìÈ¡½±Àø
		if nCurGs == 1 then
			Talk(1,"","Kh«ng thÓ thùc hiÖn thao t¸c nµy ë ®©y.");
			return 0;
		end
		BWT_GetAward();
		return 1;
	end;
	if nBtID == 5 then	--µÇ¼Ç»ı·Ö
		if GetTask(TSK_CURWEEKMATCH) >= REQUIRE_MATCH_TIME then
			local nCurSignedResult = GetTask(TSK_CURSIGNEDRESULT);
			if nCurSignedResult ~= 0 and nCurRealResult <= nCurSignedResult then
				Talk(1,"","§iÓm so tµi hiÖn giê cña ng­¬i thÊp h¬n ®iÓm ng­¬i ®¨ng kı tr­íc ®©y, luyÖn tËp thªm råi h½n ®Õn ®¨ng kı. <color=red>Nh­ng cÇn l­u ı: Khi ®iÓm thùc tÕ cña ng­¬i thÊp h¬n ®iÓm ®¨ng kı 30 hoÆc nhiÒu h¬n n÷a, th× hÖ thèng sÏ c­ìng chÕ ®¨ng kı. Cho nªn, kh«ng nªn ®Ó cho ®iÓm thùc tÕ thÊp h¬n ®iÓm ®¨ng kı qu¸ nhiÒu.<color>");
				return 0;
			end;
			local selTab = {
						"§ång ı ®¨ng kı/register_point_confirm",
						"T¹m thêi kh«ng ®¨ng kı/nothing",
						}
			local szString1,szString2,szString3 = "","","";
			local nGetXinDeState = GetTask(TSK_GET_XINDE_STATE);
			local nCount = 0;
			if nGetXinDeState == 30 then
				szString1 = "<color=red>§· l·nh<color>";
				szString2 = "<color=red>§· l·nh<color>";
				szString3 = "<color=red>§· l·nh<color>";
			elseif nGetXinDeState == 20 then
				szString1 = "<color=red>§· l·nh<color>";
				szString2 = "<color=red>§· l·nh<color>";
				szString3 = "<color=yellow>Ch­a l·nh<color>";
			elseif nGetXinDeState == 10 then
				szString1 = "<color=red>§· l·nh<color>";
				szString2 = "<color=yellow>Ch­a l·nh<color>";
				szString3 = "<color=yellow>Ch­a l·nh<color>";
			else
				szString1 = "<color=yellow>Ch­a l·nh<color>";
				szString2 = "<color=yellow>Ch­a l·nh<color>";
				szString3 = "<color=yellow>Ch­a l·nh<color>";
			end;
			Say("120 ®iÓm ®¨ng kı ®æi ®­îc 10 quyÓn Thùc ChiÕn T©m §¾c       "..szString1.."\n150 ®iÓm ®¨ng kı ®æi thªm ®­îc 10 quyÓn Thùc ChiÕn T©m §¾c     "..szString2.."\n200 ®iÓm ®¨ng kı cã thÓ ®æi thªm 10 quyÓn Thùc ChiÕn T©m §¾c     "..szString3.."\n§iÓm ®¨ng kı hiÖn giê cña ng­¬i lµ <color=yellow>"..nCurSignedResult.."<color>, ®iÓm so tµi hiÖn giê cña ng­¬i lµ <color=yellow>"..nCurRealResult.."<color>, 11 giê 30 tèi chñ nhËt sÏ tiÕn hµnh xÕp h¹ng dùa theo ®iÓm ®¨ng kı, ng­¬i x¸c nhËn muèn ®¨ng kı ®iÓm so tµi hiÖn giê cña m×nh chø?",getn(selTab),selTab);
			return 1;
		else
			Talk(1,"","Sè lÇn ng­¬i tham gia so tµi tuÇn nµy İt h¬n <color=yellow>"..REQUIRE_MATCH_TIME.."<color>, kh«ng thÓ ®¨ng kı ®iÓm.");
			return 0;
		end;
	end;
	if nBtID == 6 then	--½ÏÒÕËµÃ÷
		know_detail();
		return 1;
	end;
	if nBtID == 7 then	--½ÏÒÕ²éÑ¯
		if SubWorldID2Idx(100) < 0 then
			Talk(1,"","N¬i nµy kh«ng thÓ kiÓm tra th«ng tin so tµi, h·y ®Õn <color=yellow>TuyÒn Ch©u hoÆc gÇn TuyÒn Ch©u<color> chän vµo phİm nµy ®Ó kiÓm tra.");
			return 0;
		end;
		local nPIdx = 0;
		local nPoint = 0;
		local nLevel = 0;
		local szString = "Ng­êi cã ®iÓm cao nhÊt trong cuéc tû vâ ë thµnh nµy:\n"..gf_FormatStringLength("",20)..gf_FormatStringLength("§iÓm cao nhÊt",12)..gf_FormatStringLength("CÊp",4).."\n";
		nPIdx = GetPlayerByGestQueueIndex(GetGestQueueSize()-1);
		if nPIdx == 0 then
			szString = szString.."<color=yellow>"..gf_FormatStringLength("§¹i héi tû vâ Thiªn H¹ §Ö NhÊt: ",20,0).."<color>"..gf_FormatStringLength("Ch­a",12)..gf_FormatStringLength("Ch­a",4).."\n";
		else
			nPoint = GetTask(TSK_CURREALRESULT,nPIdx);
			nLevel = GetLevel(nPIdx);
			szString = szString.."<color=yellow>"..gf_FormatStringLength(TB_BIWU_NAME[2]..": ",20,0).."<color>"..gf_FormatStringLength(nPoint,12)..gf_FormatStringLength(nLevel,4).."\n";
		end;
		Talk(1,"",szString);
		return 1;
	end;
end;

function OnOpenUI()
	local nDate = tonumber(date("%Y%m%d%H"));
	if nDate >= g_nBWAwardBeginDate and GetTask(TSK_FIRST_OPEN_UI) ~= g_nBWAwardDate then
		local nYear,nMonth,nDay,nHour = gf_GetDateData(g_nBWAwardDate);
		--Say("    ÏÖÔÚ·¢²¼ÌìÏÂµÚÒ»±ÈÎä´ó»áÁªÈü½±Àø¡£\n    ·²ÊÇ<color=green>½øÁËÁ÷ÅÉ×Ê¸ñ·ÖÅÅĞĞ°ñ»òÕßµÃµ½×Ê¸ñ·Ö<color>µÄÍæ¼Ò£¬¶¼ÓĞÒ»·İ·áºñµÄ½±Àø£¬¿ÉÒÔÁìÈ¡Ò»¶¨ÊıÁ¿µÄ<color=green>"..g_szGloryAwardName.."<color>£¬Í¬Ê±½«Çå¿Õ×Ê¸ñ·Ö¡£\n    ±ÈÎä»ı·ÖÔÚ200·ÖÒÔÏÂµÄÍæ¼Ò£¬»ı·ÖÔö¼Ó100·Ö£¬Ôö¼ÓºóµÄ»ı·Ö×î¶à²»³¬¹ı200¡£\n    ÒÔºóÒ²»á¸ù¾İ×Ê¸ñ·Ö²»¶¨ÆÚ·¢·Å½±Àø¡£\n    ÇëÓÚ<color=yellow>"..nYear.."Äê"..nMonth.."ÔÂ"..nDay.."ÈÕ"..nHour.."µãÇ°<color>µ½<color=green>ãê¾©±ÈÎä´ó»áÌØÊ¹[173,176]<color>´¦ÁìÈ¡ÄãµÄ½±Àø£¡",0);
		BWDH_SetTask(TSK_FIRST_OPEN_UI,g_nBWAwardDate);
	end;
end;
--=========================================================================================
function register_point_confirm()
	BWDH_SetTask(TSK_CURSIGNEDRESULT,GetTask(TSK_CURREALRESULT));
	local nRegPoint = GetTask(TSK_CURSIGNEDRESULT);
	local nGetXinDeState = GetTask(TSK_GET_XINDE_STATE);
	local nCount = 0;
	if nRegPoint >= 200 and nGetXinDeState < 30 then
		BWDH_SetTask(TSK_GET_XINDE_STATE,30);
		nCount = 30 - nGetXinDeState;
	elseif nRegPoint >= 150 and nGetXinDeState < 20 then
		nCount = 20 - nGetXinDeState;
		BWDH_SetTask(TSK_GET_XINDE_STATE,20);
	elseif nRegPoint >= 120 and nGetXinDeState < 10 then
		nCount = 10 - nGetXinDeState;
		BWDH_SetTask(TSK_GET_XINDE_STATE,10);
	end;
	if nCount > 0 then
		AddItem(2,1,1101,nCount);
		Msg2Player("B¹n nhËn ®­îc "..nCount.." quyÓn Thùc ChiÕn T©m §¾c");
	end;
	SignUpGestResult();	--½«»ı·ÖµÇ¼ÇÉÏÈ¥
	WriteLog("["..LOG_HEAD.."]:"..GetName().."§iÓm ®¨ng kı tû vâ:"..nRegPoint.."NhËn ®­îc"..nCount.." quyÓn Thùc ChiÕn T©m §¾c");
	Talk(1,"","§iÓm cña ng­¬i ®· ®¨ng kı.");
end;

function go_to_watch_confirm(nMapID)
	local nCurMapID = GetWorldPos();
	if nCurMapID ~= 100 and nCurMapID ~= 200 and nCurMapID ~= 300 then
		Talk(1,"","ChØ cã thÓ ë TuyÒn Ch©u vµo xem tû vâ ")
		return 0;
	end;
	if GetTaskTemp(TSK_TEMP_CAMP) ~= 0 or GetFightState() == 1 then
		Talk(1,"","Tr¹ng th¸i hiÖn giê cña ng­¬i kh«ng thÓ thùc hiÖn thao t¸c nµy!");
		return 0;
	end;
	Pay(5000);
	UseScrollEnable(0);	--½ûÖ¹Ê¹ÓÃ»Ø³Ç·û
--	SetLogoutRV(1);	--ÉèÖÃµÇÂ½µãÎª³ÇÊĞÖØÉúµã
--	UseMask(1,0);	--±äÎªÉñÃØÈË
	NewWorld(TB_MAPID[nMapID][1],1620,3180);
end;

function go_to_biwu_npc()
	if GetTaskTemp(TSK_TEMP_CAMP) ~= 0 or GetFightState() == 1 then
		Talk(1,"","Tr¹ng th¸i hiÖn giê cña ng­¬i kh«ng thÓ thùc hiÖn thao t¸c nµy!");
		return 0;
	end;
--	if GetCash() < 5000 then
--		Talk(1,"","´«ËÍĞèÒªÏûºÄ50Òø£¬ÄãÉíÉÏ²»¹»¡£");
--		return 0
--	end
--	if Pay(500) == 1 then
		NewWorld(200,1390,2823);
--	end
end

function join_list_confirm(nType)
	if nType == 1 then	--Ö»²Î¼Ó1´Î
		BWDH_SetTask(TSK_JOIN_LIST_TYPE,1);
		gf_ShowMsg("Ng­¬i ®¨ng kı tham gia <color=yellow>so tµi mét lÇn<color>, sau khi so tµi kÕt thóc ng­¬i sÏ tù ®éng <color=red>tho¸t ra<color>.");
	elseif nType == 2 then	--Ò»Ö±²Î¼Ó
		BWDH_SetTask(TSK_JOIN_LIST_TYPE,-1);
		gf_ShowMsg("Ng­¬i ®· ®¨ng kı <color=yellow>tham gia so tµi liªn tôc<color>.");
	end;
	BWT_JoinGestConvention();
end;

function realm_kick_player()
	local nHour = tonumber(date("%H%M"));
	local nVersion,nCurGs = GetRealmType();	
	if nCurGs == 1 then
		if nHour >= 2310 then
			local nOldIndex = PlayerIndex;			
			local tPlayers = GetMapPlayer(7100);
			for i = 1, getn(tPlayers) do
				PlayerIndex = tPlayers[i];
				ExitGame();
			end
			PlayerIndex = nOldIndex;
		end		
	end
end
--=========================================================================

function callback_open_biwudahui()
	if SubWorldID2Idx(7100) < 0 then return end
	--local nHour = tonumber(date("%H"));
	if BWT_CheckBiWuTime() == 1 then
		BWT_InitOneRound();
		local szMsg = "open a new biwudahui round..."
		gf_ShowDebugInfor(szMsg);
		if BWDH_DEBUG_VERSION == 1 then
			print(szMsg)
		end
	end;
	realm_kick_player();
end

callback_open_biwudahui();

