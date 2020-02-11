Include("\\settings\\static_script\\kf_newbattles\\battlestatistic.lua");
Include("\\script\\global\\battlefield_callback.lua")
Include("\\settings\\static_script\\kf_newbattles\\battleaward.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\ks2vng\\missions\\mission_award_add_rate_cfg.lua")
Include("\\script\\system_switch_config.lua")

g_sNpcName = "ChiÕn tr­êng liªn ®Êu";

function main_kf_newbattle()
	BT_NewBattleClear();
	if GetLevel() < 40 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: ChiÕn tr­êng lµ n¬i nguy hiÓm, ®îi ng­¬i luyÖn tËp thªm mét thêi gian ®¹t cÊp <color=yellow>40<color> råi h·y quay l¹i!");
		return 0;
	end
	if GetPlayerRoute() == 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: V« danh tiÓu tèt nh­ ng­¬i mµ còng muèn tham gia cuéc chiÕn Tèng-Liªu µ? Gia nhËp m«n ph¸i råi h·y tÝnh.");
		return 0;
	end
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	if nGlobalState == 0 then
		Say("<color=green>"..g_sNpcName.."<color>: "..format("ChiÕn tr­êng vÉn ch­a më, mêi thiÕu hiÖp vµo lóc %s hoÆc %s ®Õn b¸o danh tham gia.", "16:30", "21:30"), 0);
		return 0;
	end
	if GetPKValue() >= 4 then	--ºìÃû²»ÄÜ½øÕ½³¡
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Téi ¸c tµy trêi kh«ng thÓ tham gia chiÕn tr­êng!");
		return 0;
	end
	
	local nDate = tonumber(date("%y%m%d"));
	local nSignUpTime = BT_GetData(PT_BATTLE_DATE);	--»ñÈ¡Íæ¼Ò±¨ÃûµÄÊÇÄÄÒ»³¡´ÎµÄÕ½³¡
	local nBattleType = BT_GetBattleType();
	local nSongPlayerCount = BT_GetPlayerCount(EMPLACEMENT_ID,SONG_ID);
	local nLiaoPlayerCount = BT_GetPlayerCount(EMPLACEMENT_ID,LIAO_ID);
		
	local selTab = {
			"Ta muèn tham gia"..tBattleName[EMPLACEMENT_ID].."chiÕn tr­êng [Tèng "..nSongPlayerCount.." ng­êi]: [Liªu "..nLiaoPlayerCount.." ng­êi]/#join_battle("..EMPLACEMENT_ID..")",
			"Ta muèn ®­îc h­íng dÉn vÒ chiÕn tr­êng/get_battle_book",
			"KÕt thóc ®èi tho¹i/nothing",
	}
	
	Say("<color=green>"..g_sNpcName..format("<color>: ChiÕn tr­êng phÝa tr­íc ®· khai háa, %s muèn tham gia kh«ng?", gf_GetPlayerSexName()),getn(selTab),selTab);
end

function join_battle(nBattleType)
	if BT_GetData(PT_POINT_AWARD) ~= 0 or BT_GetData(PTNC_BATTLEPOINT) ~= 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Ng­¬i ch­a nhËn phÇn th­ëng lÇn tr­íc.");
		return 0;
	end
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	local nBattleSegment = mod(nGlobalState,10);	--»ñÈ¡Õ½³¡µ±Ç°´¦ÓÚÄÄ¸ö½×¶Î
	if nBattleSegment ~= 1 and nBattleSegment ~= 3 then	--¸±Õ½³¡±¨ÃûÖÐ£»Î´±¨¹ýÃûµÄ
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: ChiÕn tr­êng ®· më, lÇn sau h·y quay l¹i.");
		return 0;
	end
	local nMaxPlayer = SUB_BATTLE_MAX_PLAYER;
	local nDiffPlayerCount = SUB_BATTLE_PLAYER_DIFF;
	if nBattleType == MAINBATTLE_ID then
		nMaxPlayer = MAIN_BATTLE_MAX_PLAYER;
		nDiffPlayerCount = MAIN_BATTLE_PLAYER_DIFF
	end
	local nSongPlayerCount = BT_GetPlayerCount(nBattleType,SONG_ID);
	local nLiaoPlayerCount = BT_GetPlayerCount(nBattleType,LIAO_ID);
	if nSongPlayerCount >= nMaxPlayer and nLiaoPlayerCount >= nMaxPlayer then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Sè ng­êi b¸o danh chiÕn tr­êng ®· ®¹t ®Õn giíi h¹n, lÇn sau h·y quay l¹i.");
		return 0;
	end
	local nCamp = SONG_ID;
	if nSongPlayerCount > nLiaoPlayerCount then
		nCamp = LIAO_ID;
	end
		
	BT_SetData(PT_BATTLE_TYPE,nBattleType);
	BT_SetData(PT_SIGN_UP,nBattleType*10+nCamp);
	BT_SetData(PT_BATTLE_DATE,tonumber(date("%y%m%d"))*1000+nGlobalState);
	BT_AddSignUpPlayerCount(nBattleType,nCamp);
	
	local nBattleMapID = tBTMSInfo[nBattleType][2];
	local Old_SubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(nBattleMapID);
	JoinMission(tBTMSInfo[nBattleType][1],nCamp);
	SubWorld = Old_SubWorld;
end

function get_battle_book()
	if GetItemCount(tBattleItem[5][2],tBattleItem[5][3],tBattleItem[5][4]) == 0 then
		AddItem(tBattleItem[5][2],tBattleItem[5][3],tBattleItem[5][4],1);
	else
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Ch¼ng ph¶i ng­¬i cã quyÓn s¸ch sao?");
	end
end

function get_kf_pt_award()
	local nRezult = BT_GetData(PT_LAST_RESULT);
	local nPersonPoint = BT_GetData(PTNC_BATTLEPOINT);
	local nPointAward = BT_GetData(PT_POINT_AWARD);
	if nRezult == 0 and nPersonPoint == 0 and nPointAward == 0 then
		Talk(1,"","<color=green>"..g_sNpcName.."<color>: Mau ®i tham gia chiÕn tr­êng råi ®Õn ®©y l·nh th­ëng!");
		return 0;
	end
	local tSay = {};
	local tTempString = {
		[0] = "BÊt ph©n th¾ng b¹i",	
		[1] = "§· giµnh chiÕn th¾ng",
		[2] = "§· thÊt b¹i",
	}
	if not tTempString[nRezult] then
		return 0;
	end
	local strTemp = format("ChiÕn tr­êng trËn tr­íc cña b¹n lµ <color=green>%s<color>, tæng ®iÓm tÝch lòy nhËn ®­îc lµ <color=green>%d<color>.", tTempString[nRezult], nPersonPoint+nPointAward);
	tSay.sel = {};
	strTemp = strTemp.."Sö dông qu©n c«ng ch­¬ng, qu©n c«ng ®¹i, qu©n c«ng huy hoµng nhËn th­ëng cã thÓ nhËn ®­îc phÇn th­ëng nhiÒu h¬n vÒ ®iÓm kinh nghiÖm, gãi quµ th­ëng."
	tinsert(tSay.sel, {"NhËn th­ëng trùc tiÕp", "#get_kf_pt_award_deal(1)"})
	tinsert(tSay.sel, {"Qu©n c«ng ch­¬ng nhËn th­ëng", "#get_kf_pt_award_deal(2)"})
	tinsert(tSay.sel, {"Qu©n c«ng ®¹i nhËn th­ëng", "#get_kf_pt_award_deal(3)"})
	tinsert(tSay.sel, {"Qu©n c«ng huy hoµng nhËn th­ëng", "#get_kf_pt_award_deal(4)"})
	tinsert(tSay.sel, {"Vinh Dù Qu©n C«ng Ch­¬ng nhËn th­ëng", "#get_kf_pt_award_deal(5)"})
	tinsert(tSay.sel, {"Ra khái", "nothing"})
	tSay.msg = "<color=green>"..g_sNpcName.."<color>: "..strTemp;
	temp_Talk(tSay);
end



function get_kf_pt_award_deal(nKind)
	nKind = tonumber(nKind) or 0;
	
	if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then
		return 0;
	end
	
	--¾­Ñé£¬¾ü¹¦£¬µÀ¾ß
	local nRet = BT_GetData(PT_LAST_RESULT);
	local tAwardTable = {
		[0] = {
			[1] = {0, {300000, 0}, 200, {1, 1}},
			[2] = {30, {8000000, 10000}, 300, {1, 1}},
			[3] = {100, {8000000, 10000}, 800, {1, 1}},
			[4] = {200, {8000000, 10000}, 1200, {1, 1}},
			[5] = {450, {20000000, 0}, 1600, {1, 1}},
		},
		[1] = {
			[1] = {0, {300000, 0}, 200, {1, 1}},
			[2] = {30, {16000000, 10000}, 300, {2, 1}},
			[3] = {100, {16000000, 10000}, 800, {2, 1}},
			[4] = {200, {16000000, 10000}, 1200, {2, 1}},
			[5] = {450, {36000000, 0}, 1600, {2, 1}},
		},
		[2] = {
			[1] = {0, {300000, 0}, 200, {1, 1}},
			[2] = {30, {8000000, 10000}, 300, {1, 1}},
			[3] = {100, {8000000, 10000}, 800, {1, 1}},
			[4] = {200, {8000000, 10000}, 1200, {1, 1}},
			[5] = {450, {20000000, 0}, 1600, {1, 1}},
		},
	}
	local tAward = tAwardTable[nRet];
	if not tAward then  return 0; end
	local nPersonPoint = BT_GetData(PTNC_BATTLEPOINT);
	local nPointAward = BT_GetData(PT_POINT_AWARD);
	local nActivity = nPersonPoint+nPointAward;
	local nIndex = 0;
	local tAwardLevel = {0, 30, 100, 200, 450};
	for i = 1, getn(tAwardLevel) do
		if i ~= getn(tAwardLevel) then
			if nActivity >= tAwardLevel[i] and nActivity < tAwardLevel[i+1] then
				nIndex = i;
				break;
			end
		else
			nIndex = i;
		end
	end	
	local tSubAward = tAward[nIndex];
	if not tSubAward then return 0; end
	local nExp = (tSubAward[2][1] + tSubAward[2][2] * nActivity) * (1 + GetVipCardParam()) * (min(VNG_CFG_KFB_EXP_EXT_ADD_RATE or 0, 1) + 1);
	local nJunGong = tSubAward[3] * (1 + min(VNG_CFG_KFB_JUNGONG_EXT_ADD_RATE or 0, 1));
	local tAwardRet = {nExp, nJunGong, tSubAward[4]};
	
	local tJGZ = {
		[2] = {2, 1, 9999, "Qu©n C«ng Ch­¬ng"},
		[3] = {2, 1, 9998, "Qu©n C«ng §¹i"},
		[4] = {2, 1, 9977, "Qu©n C«ng Huy Hoµng"},
		[5] = {2, 1, 30642, "qu©n c«ng ch­¬ng vinh dù "},
	}
	if tJGZ[nKind] then
		if DelItem(tJGZ[nKind][1], tJGZ[nKind][2], tJGZ[nKind][3], 1) ~= 1 then
			Talk(1,"",format("Hµnh trang kh«ng ®ñ <color=green>%s<color>", tJGZ[nKind][4]));
			return 0;
		end
	end
	
	local tAwardType = {
		[1] = {1, 1, {0, 0}, "NhËn th­ëng trùc tiÕp"},
		[2] = {1.5, 2, {1, 1}, "Qu©n c«ng ch­¬ng nhËn th­ëng"},
		[3] = {2, 5, {2, 1}, "Qu©n c«ng ®¹i nhËn th­ëng"},
		[4] = {2.5, 10, {3, 1}, "Qu©n c«ng huy hoµng nhËn th­ëng"},
		[5] = {3, 14, {3, 2}, "Vinh Dù Qu©n C«ng Ch­¬ng nhËn th­ëng"},
	}
	if not tAwardType[nKind] then return 0; end
	
	--ÏÈÇåÀí±äÁ¿ ·ÀÖ¹¶à´ÎÁì½±
	BT_SetData(PT_LAST_RESULT,0);
	BT_SetData(PT_POINT_AWARD,0);
	BT_SetData(PTNC_BATTLEPOINT,0);
	
	--¸ø½±Àø
	gf_Modify("Exp", tAwardRet[1] * tAwardType[nKind][1]);
	gf_EventGiveCustomAward(31, tAwardRet[2] * tAwardType[nKind][2], 1, "Ph¸o §µi ChiÕn Liªn Server", tAwardType[nKind][4]);
	local funcPackAward = function (tParam)
		if not tParam or getn(tParam) ~= 2 then
			return 0;
		end
		local tTemp = {
			[1] = {
				{3, 100, 30000, 1},
				{3, 40, 60000, 1},
				{3, 10, 100000, 1},
				{27, 150, 300, 1},
				{27, 100, 600, 1},
				{27, 100, 1000, 1},
				{34, 75, 60, 1},
				{35, 25, 60, 1},
				{1, 150, "VÐ TiÕu Y §ång", {2, 1, 30493, 1}, 0},
				{1, 100, "VÐ TiÕu Y §ång", {2, 1, 30493, 2}, 0},
				{1, 50, "VÐ TiÕu Y §ång", {2, 1, 30493, 4}, 0},
				{1, 100, "ThiÕt Tinh cÊp 1", {2, 1, 30533, 4}, 0},
			},
			[2] = {
				{3, 50, 100000, 1},
				{3, 20, 150000, 1},
				{3, 10, 300000, 1},	
				{27, 100, 600, 1},
				{27, 100, 1200, 1},
				{27, 100, 1500, 1},
				{34, 40, 60, 1},
				{35, 10, 60, 1},
				{1, 200, "VÐ TiÕu Y §ång", {2, 1, 30493, 2}, 0},
				{1, 100, "VÐ TiÕu Y §ång", {2, 1, 30493, 4}, 0},
				{1, 50, "VÐ TiÕu Y B¹c", {2, 1, 30492, 1}, 0},
				{1, 120, "ThiÕt Tinh cÊp 1", {2, 1, 30533, 4}, 0},
				{1, 100, "ThiÕt Tinh cÊp 2", {2, 1, 30534, 4}, 0},
			},
			[3] = {
				{3, 100, 150000, 1},
				{3, 100, 300000, 1},
				{3, 10, 600000, 1},	
				{27, 100, 1500, 1},
				{27, 100, 2000, 1},
				{27, 100, 2500, 1},
				{35, 75, 60, 1},
				{36, 25, 60, 1},
				{1, 100, "VÐ TiÕu Y B¹c", {2, 1, 30493, 1}, 0},
				{1, 100, "VÐ TiÕu Y B¹c", {2, 1, 30493, 2}, 0},
				{1, 50, "VÐ TiÕu Y B¹c", {2, 1, 30492, 4}, 0},
				{1, 50, "ThiÕt Tinh cÊp 1", {2, 1, 30533, 4}, 0},
				{1, 50, "ThiÕt Tinh cÊp 2", {2, 1, 30534, 4}, 0},
				{1, 40, "ThiÕt Tinh cÊp 3", {2, 1, 30535, 4}, 0},
			},
		}
		local tTempAdd = {
			[1] = {
				{1, "Hu©n ch­¬ng anh hïng", {2, 1, 30499, 1}, 0},
				{28, 300, 1},--ÕæÆø
			},
			[2] = {
				{1, "Hu©n ch­¬ng anh hïng", {2, 1, 30499, 2}, 0},
				{28, 400, 1},--ÕæÆø
			},
			[3] = {
				{1, "Hu©n ch­¬ng anh hïng", {2, 1, 30499, 6}, 0},
				{28, 500, 1},--ÕæÆø
			},
		}
		local ttAward = tTemp[tParam[1]];
		local ttAwardAdd = tTempAdd[tParam[1]];
		if not ttAward or not ttAwardAdd then
			return 0;
		end
		for i = 1, tParam[2] do
			gf_EventGiveRandAward(ttAward, gf_SumRandBase(ttAward), 1, "Ph¸o §µi ChiÕn Liªn Server", "Ph¸o §µi ChiÕn Liªn Server");
			gf_EventGiveAllAward(ttAwardAdd, "Ph¸o §µi ChiÕn Liªn Server", "Ph¸o §µi ChiÕn Liªn Server");
		end
	end
	funcPackAward(tAwardRet[3]);
	funcPackAward(tAwardType[nKind][3]);
end