Include("\\script\\lib\\talktmp.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\missions\\kuafu_battle\\kf_head.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")
Include("\\script\\missions\\kuafu_battle\\runtime_data_stat.lua")
Include("\\settings\\static_script\\kf_newbattles\\sign_up_npc_kf.lua")

KF_NPC_NAME = "<color=green>ChiÕn tr­êng liªn ®Êu tiÕp dÉn sø: <color>"

function main()
	if IsKfNewBattleOpen() ~= 0 then
		main_kf_newbattle(); --¿ªÆôÁË¿ç·şÅÚÌ¨Õ½
		return 0;
	end
	local tSay = {};
	local nJoinTimes = KF_GetJoinTimes();
	tSay.msg = KF_NPC_NAME..format("§¹i hiÖp muèn tham gia chiÕn tr­êng liªn server kh«ng? Trong chiÕn tr­êng liªn server, b¹n cã thÓ chiÕn ®Êu mét c¸ch s¶ng kho¸i víi hµo kiÖt cña toµn vâ l©m, kiÕn c«ng lËp nghiÖp vµ nhËn ®­îc phÇn th­ëng quı hiÕm. HiÖn t¹i chØ më cho nh©n vËt chuyÓn sinh %d cÊp %d trë lªn, ®· gia nhËp l­u ph¸i vµ ®· häc tÊt c¶ kü n¨ng cÊp %d, ®ång thêi mçi ng­êi chØ cã thÓ tham gia %d lÇn/ngµy. §¹i hiÖp h«m nay ®· tham gia <color=green>%d<color> lÇn.", 5, 96, 55, KF_JOIN_TIMES_MAX, nJoinTimes);
	if GetNpcName(GetTargetNpc()) == "Ng­êi B¸o Danh Liªn §Êu" then
		local nTimes = GetMapTaskTemp(KF_MAP_TASK_TEMP_ID, KF_CURR_OPEN_COUNT);
		tSay.msg = tSay.msg..format("\n<color=red> ChiÕn Tr­êng Liªn Server lÇn nµy ®· më %d trËn <color>", nTimes);
	end
	tSay.sel = {
			{format("B¸o danh c¸ nh©n (tiªu hao %d vµng)", KF_ENTRY_FEE), "jyr_single_join"},
			{format("Tæ ®éi b¸o danh (nhiÒu nhÊt 3 ng­êi, tiªu hao %d vµng)", KF_ENTRY_FEE * min(gf_GetTeamSize(),3)), "jyr_team_join"},
		};
	tinsert(tSay.sel,	{"\n rót lui", "nothing"});	
	temp_Talk(tSay);
end

function jyr_main_lingjiang()
	local tSay = {};
	local nJoinTimes = KF_GetJoinTimes();
	tSay.msg = KF_NPC_NAME..format("§¹i hiÖp muèn tham gia chiÕn tr­êng liªn server kh«ng? Trong chiÕn tr­êng liªn server, b¹n cã thÓ chiÕn ®Êu mét c¸ch s¶ng kho¸i víi hµo kiÖt cña toµn vâ l©m, kiÕn c«ng lËp nghiÖp vµ nhËn ®­îc phÇn th­ëng quı hiÕm. HiÖn t¹i chØ më cho nh©n vËt chuyÓn sinh %d cÊp %d trë lªn, ®· gia nhËp l­u ph¸i vµ ®· häc tÊt c¶ kü n¨ng cÊp %d, ®ång thêi mçi ng­êi chØ cã thÓ tham gia %d lÇn/ngµy. §¹i hiÖp h«m nay ®· tham gia <color=green>%d<color> lÇn.", 5, 96, 55, KF_JOIN_TIMES_MAX, nJoinTimes);
	tSay.sel = {
			{"NhËn phÇn th­ëng lÇn tr­íc", "jyr_get_last_award"},
			{"Cöa hµng hu©n ch­¬ng", "jyr_medal_shop"},
			{"Th«ng tin chiÕn tr­êng liªn ®Êu", "jyr_battle_introduce"},	
		};
	tinsert(tSay.sel,	{"\n rót lui", "nothing"});	
	temp_Talk(tSay);
end

function jyr_single_join()
	--Ê±¼äÏŞÖÆ
	local nTime = tonumber(date("%H%M"));
	if (not ((1630 <= nTime and nTime < 1730) or (2130 <= nTime and nTime < 2230))) then
		Talk(1,"",KF_NPC_NAME..format("ChiÕn tr­êng liªn server ch­a më, ®¹i hiÖp h·y b¸o danh vµo lóc %s hoÆc %s ®Ó tham gia.", "16:30", "21:30"));
		return 0;
	end
	--ÒÑ¾­ÓĞ¶ÓÎéÁË
	if GetTeamSize() ~= 0 then
		Talk(1,"",KF_NPC_NAME.."C¸c h¹ ®· cã ®éi ngò kh«ng thÓ b¸o danh c¸ nh©n");
		return 0;
	end
	--Ìõ¼ş1
	if gf_CheckBaseCondition(80) == 0 then
		return 0;
	end
	--Ìõ¼ş2
	if KF_GetBattleRezult() ~= 0 or KF_GetActivity() ~= 0 then
		Talk(1,"",KF_NPC_NAME.."VÉn ch­a nhËn phÇn th­ëng chiÕn tr­êng lÇn tr­íc, kh«ng thÓ tham gia.");
		return 0;
	end
	--Ìõ¼ş3
	if KF_GetJoinTimes() >= KF_JOIN_TIMES_MAX then
		Talk(1,"",KF_NPC_NAME..format("Sè lÇn tham gia chiÕn tr­êng liªn ®Êu ®· v­ît qu¸ %d lÇn", KF_JOIN_TIMES_MAX));
		return 0;
	end
	--Ìõ¼ş4
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
		return 0;
	end
	--Ìõ¼ş4
	if GetCash() < gf_GetTeamSize() * KF_ENTRY_FEE * 10000 then
		Talk(1,"",format("Ng©n l­îng kh«ng ®ñ %d vµng", KF_ENTRY_FEE));
		return 0;
	end
	--¼ÓÈëMISSION
	local nCurMapId = KF_GetSuitMap(1);
	local nCityMapId = GetWorldPos();
	if nCurMapId ~= 0 then
		if mf_GetPlayerCount(KF_MISSION_ID, CampOne_ID, nCurMapId) <= mf_GetPlayerCount(KF_MISSION_ID, CampTwo_ID, nCurMapId) then
			mf_JoinMission(KF_MISSION_ID, CampOne_ID, nCurMapId);
		else
			mf_JoinMission(KF_MISSION_ID, CampTwo_ID, nCurMapId);
		end
	else
		local nMissionCount = GetMapTaskTemp(KF_MAP_TASK_TEMP_ID, KF_CURR_OPEN_COUNT);
		if nMissionCount >= MISSION_COUTN_MAX then
			Talk(1,"",KF_NPC_NAME.."Sè ng­êi tham gia trªn c¸c ®Êu tr­êng ®Òu ®· ®Çy, c¸c h¹ vui lßng tham gia vµo trËn chiÕn lÇn sau.");
			return 0;
		end
		--ÉÏÒ»³¡¿ªÊ¼ÏÂÒ»³¡¿ªÆô
		local nLastMapID = GetMapTaskTemp(KF_MAP_TASK_TEMP_ID, KF_LAST_OPEN_MAPID);
		if SubWorldID2Idx(nLastMapID) ~= -1 then
			local nLoadTag = mf_GetMissionV(KF_MISSION_ID, MV_BATTLE_LOAD, nLastMapID);
			local nMissionState = mf_GetMissionV(KF_MISSION_ID, MV_BATTLE_STATE, nLastMapID);
			if nLoadTag == 1 then --ÉÏÒ»³¡ÒÑ¿ªÆô
				if nMissionState == MS_STATE_PEACE or nMissionState == MS_STATE_READY then --ÉÏÒ»³¡¿ªÆôµÄ½×¶Î»¹Ã»½øÈëÕ½¶·½×¶Î
					Talk(1,"",KF_NPC_NAME.."B¶n ®å ®Êu tr­êng liªn ®Êu tr­íc khëi ®éng råi míi cã thÓ më b¶n ®å chiÕn tr­êng tiÕp theo!")
					return 0;
				end
			end
		end
		local nMapID, nMapIdx = DynamicLoadMap(KF_MAP_ID);
		if nMapID == 0 and nMapIdx == 0 then
			Talk(1,"","XuÊt hiÖn lçi ch­a x¸c ®Şnh, chiÕn tr­êng kh«ng thÓ më");
			return 0;
		end
		if mf_OpenMission(KF_MISSION_ID, nMapID) == 1 then
			SetMapTaskTemp(KF_MAP_TASK_TEMP_ID ,KF_CURR_OPEN_COUNT, nMissionCount + 1);
			SetMapTaskTemp(KF_MAP_TASK_TEMP_ID ,KF_LAST_OPEN_MAPID, nMapID);
			mf_SetMissionV(KF_MISSION_ID, MV_BATTLE_LOAD, 1, nMapID);	
			mf_SetMissionV(KF_MISSION_ID, MV_BATTLE_MAP_ID, nMapID, nMapID);
			mf_SetMissionV(KF_MISSION_ID, MV_BATTLE_MAP_INDEX, nMapIdx, nMapID);
			mf_JoinMission(KF_MISSION_ID, CampOne_ID, nMapID);	
			
			_stat_on_misson_open()
		end
	end
	
	_stat_when_join(1)
end

function jyr_team_join()
	--Ê±¼äÏŞÖÆ
	local nTime = tonumber(date("%H%M"));
	if (not ((1630 <= nTime and nTime < 1730) or (2130 <= nTime and nTime < 2230))) then
		Talk(1,"",KF_NPC_NAME..format("ChiÕn tr­êng liªn server ch­a më, ®¹i hiÖp h·y b¸o danh vµo lóc %s hoÆc %s ®Ó tham gia.", "16:30", "21:30"));
		return 0;
	end
	--ÒÑ¾­ÓĞ¶ÓÎéÁË
	if GetTeamSize() == 0 then
		Talk(1,"",KF_NPC_NAME.."HiÖn t¹i c¸c h¹ ch­a cã ®éi ngò, kh«ng thÓ b¸o danh ®éi ngò tham gia");
		return 0;
	end
	--²»ÊÇ¶Ó³¤
	if GetCaptainName() ~= GetName() then
		Talk(1,"",KF_NPC_NAME.."C¸c h¹ kh«ng ph¶i ®éi tr­ëng kh«ng thÓ b¸o danh ®éi ngò");
		return 0;
	end
	--¶ÓÎé³¬Ô±
	if GetTeamSize() > KF_TEAM_SIZE_MAX then
		Talk(1,"",KF_NPC_NAME..format("§éi ngò tæ ®éi tham gia b¸o danh kh«ng ®­îc v­ît qu¸ %d ng­êi", KF_TEAM_SIZE_MAX));
		return 0;
	end
	--Ìõ¼ş4
	if GetCash() < gf_GetTeamSize() * KF_ENTRY_FEE * 10000 then
		Talk(1,"",format("Ng©n l­îng kh«ng ®ñ %d vµng", GetTeamSize() * KF_ENTRY_FEE));
		return 0;
	end
	local OldPlayerIndex = PlayerIndex;
	local bFlag = 0;
	local nOldMapID = GetWorldPos();
	local sString = "\nThµnh viªn kh«ng trong b¶n ®å nµy:\n<color=red>";
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		local nMapIDTemp = GetWorldPos();
		if nMapIDTemp ~= nOldMapID then
			sString = sString..GetName().."   ";
			bFlag = 1;
		end
	end
	PlayerIndex = OldPlayerIndex;
	sString = sString.."<color>";
	if bFlag == 1 then
		Talk(1,"",KF_NPC_NAME..sString);
		return 0;
	end
	local tResult = {
		[1] = {},
		[2] = {},
		[3] = {},	
		[4] = {},
	};
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		--Ìõ¼ş1
		if gf_CheckBaseCondition(80) == 0 then
			tinsert(tResult[1], GetName());
		end
		--Ìõ¼ş2
		if KF_GetBattleRezult() ~= 0 or KF_GetActivity() ~= 0 then
			tinsert(tResult[2], GetName());
		end
		--Ìõ¼ş3
		if KF_GetJoinTimes() >= KF_JOIN_TIMES_MAX then
			tinsert(tResult[3], GetName());
		end
		--Ìõ¼ş4
		if GetFreeItemRoom() < 1 then
			tinsert(tResult[4], GetName());
		end
	end
	PlayerIndex = OldPlayerIndex;
	local bTag = 0;
	local msg = "\nKh«ng ®ñ cÊp giíi h¹n kü n¨ng:\n<color=red>"
	for i = 1, getn(tResult[1]) do
		msg = msg..tResult[1][i].."   ";
		bTag = 1;
	end
	msg = msg.."<color>\nCh­a nhËn phÇn th­ëng trËn tr­íc gåm: \n<color=red>"
	for i = 1, getn(tResult[2]) do
		msg = msg..tResult[2][i].."   ";
		bTag = 1;
	end
	msg = msg.."<color>\nKh«ng tháa ®iÒu kiÖn sè lÇn tham gia: \n<color=red>"
	for i = 1, getn(tResult[3]) do
		msg = msg..tResult[3][i].."   ";
		bTag = 1;
	end
	msg = msg.."<color>\nHµnh trang ®Çy:\n<color=red>"
	for i = 1, getn(tResult[4]) do
		msg = msg..tResult[4][i].."   ";
		bTag = 1;
	end
	msg = msg.."<color>"
	if bTag == 1 then
		Talk(1,"",KF_NPC_NAME..msg);
		return 0;
	end
	--¼ÓÈëMISSION
	local nSize = GetTeamSize();
	local nCurMapId = KF_GetSuitMap(nSize);
	local nCityMapId = GetWorldPos();
	if nCurMapId ~= 0 then
		if mf_GetPlayerCount(KF_MISSION_ID, CampOne_ID, nCurMapId) <= mf_GetPlayerCount(KF_MISSION_ID, CampTwo_ID, nCurMapId) then
			for i = 1, nSize do 
				PlayerIndex = GetTeamMember(i);
				mf_JoinMission(KF_MISSION_ID, CampOne_ID, nCurMapId);
			end
			PlayerIndex = OldPlayerIndex;
		else
			for i = 1, nSize do 
				PlayerIndex = GetTeamMember(i);
				mf_JoinMission(KF_MISSION_ID, CampTwo_ID, nCurMapId);
			end
			PlayerIndex = OldPlayerIndex;
		end
	else
		--²»ÄÜÈİÄÉ¶ÓÎéÈËÊı¹ı¶à
		if KF_GetSuitMap(1) ~= 0 then
			Talk(1,"",KF_NPC_NAME.."ChiÕn tr­êng kh«ng thÓ dung n¹p sè ng­êi trong ®éi ngò, xin h·y ®îi trËn tiÕp theo.")
			return 0;
		end
		local nMissionCount = GetMapTaskTemp(KF_MAP_TASK_TEMP_ID, KF_CURR_OPEN_COUNT);
		--µØÍ¼ÊıÉÏÏŞ£¬»¹¿ÉÒÔµ¥ÈË±¨Ãû
		--±¾Ê±¼ä¶Î¿ªÆôµÄÊıÁ¿ÏŞÖÆ
		if nMissionCount >= MISSION_COUTN_MAX then
			Talk(1,"",KF_NPC_NAME.."Sè ng­êi tham gia trªn c¸c ®Êu tr­êng ®Òu ®· ®Çy, c¸c h¹ vui lßng tham gia vµo trËn chiÕn lÇn sau.");
			return 0;
		end
		--ÉÏÒ»³¡¿ªÊ¼ÏÂÒ»³¡¿ªÆô
		local nLastMapID = GetMapTaskTemp(KF_MAP_TASK_TEMP_ID, KF_LAST_OPEN_MAPID);
		if SubWorldID2Idx(nLastMapID) ~= -1 then
			local nLoadTag = mf_GetMissionV(KF_MISSION_ID, MV_BATTLE_LOAD, nLastMapID);
			local nMissionState = mf_GetMissionV(KF_MISSION_ID, MV_BATTLE_STATE, nLastMapID);
			if nLoadTag == 1 then --ÉÏÒ»³¡ÒÑ¿ªÆô
				if nMissionState == MS_STATE_PEACE or nMissionState == MS_STATE_READY then --ÉÏÒ»³¡¿ªÆôµÄ½×¶Î»¹Ã»½øÈëÕ½¶·½×¶Î
					Talk(1,"",KF_NPC_NAME.."B¶n ®å ®Êu tr­êng liªn ®Êu tr­íc khëi ®éng råi míi cã thÓ më b¶n ®å chiÕn tr­êng tiÕp theo!")
					return 0;
				end
			end
		end
		local nMapID, nMapIdx = DynamicLoadMap(KF_MAP_ID);
		if nMapID == 0 and nMapIdx == 0 then
			Talk(1,"","XuÊt hiÖn lçi ch­a x¸c ®Şnh, chiÕn tr­êng kh«ng thÓ më");
			return 0;
		end
		if mf_OpenMission(KF_MISSION_ID, nMapID) == 1 then
			SetMapTaskTemp(KF_MAP_TASK_TEMP_ID ,KF_CURR_OPEN_COUNT, nMissionCount + 1);
			SetMapTaskTemp(KF_MAP_TASK_TEMP_ID ,KF_LAST_OPEN_MAPID, nMapID);
			mf_SetMissionV(KF_MISSION_ID, MV_BATTLE_LOAD, 1, nMapID);	
			mf_SetMissionV(KF_MISSION_ID, MV_BATTLE_MAP_ID, nMapID, nMapID);
			mf_SetMissionV(KF_MISSION_ID, MV_BATTLE_MAP_INDEX, nMapIdx, nMapID);
			for i = 1, nSize do 
				PlayerIndex = GetTeamMember(i);
				mf_JoinMission(KF_MISSION_ID, CampOne_ID, nMapID);
			end
			PlayerIndex = OldPlayerIndex;	
			
			_stat_on_misson_open()
		end
	end
	
	_stat_when_join(GetTeamSize() or 2)
end

function jyr_get_last_award()
	local tSay = {};
	local tTempString = {
		[0] = "§· nhËn th­ëng hoÆc ch­a tham gia chiÕn tr­êng",
		[1] = "Tho¸t ra",	
		[2] = "§· giµnh chiÕn th¾ng",
		[3] = "§· thÊt b¹i",
		[4] = "BÊt ph©n th¾ng b¹i",
	}
	local tResult = KF_Calculate_Award();
	local nRet = KF_GetBattleRezult();
	local strTemp = format("ChiÕn tr­êng lÇn tr­íc cña b¹n <color=green>%s<color>, ®é tİch cùc lµ <color=green>%d<color>#", tTempString[nRet], KF_GetActivity(), tResult[1], tResult[2]);
	tSay.sel = {};
	if nRet > 0 then
		strTemp = strTemp.."Sö dông qu©n c«ng ch­¬ng, qu©n c«ng ®¹i, qu©n c«ng huy hoµng nhËn th­ëng cã thÓ nhËn ®­îc phÇn th­ëng nhiÒu h¬n vÒ ®iÓm kinh nghiÖm, gãi quµ th­ëng."
		tinsert(tSay.sel, {"NhËn th­ëng trùc tiÕp", "direct_award"})
		tinsert(tSay.sel, {"Qu©n c«ng ch­¬ng nhËn th­ëng", "jungongzhang_award"})
		tinsert(tSay.sel, {"Qu©n c«ng ®¹i nhËn th­ëng", "dajungongzhang_award"})
		tinsert(tSay.sel, {"Qu©n c«ng huy hoµng nhËn th­ëng", "hhjungongzhang_award"})
		tinsert(tSay.sel, {"Vinh Dù Qu©n C«ng Ch­¬ng nhËn th­ëng", "ryjungongzhang_award"})
	end
	tinsert(tSay.sel, {"Quay l¹i ", "main"})
	tinsert(tSay.sel, {"Ra khái", "nothing"})
	tSay.msg = KF_NPC_NAME..strTemp;
	temp_Talk(tSay);
end

function direct_award()
	KF_GetAward(1);
end

function jungongzhang_award()
	KF_GetAward(2);
end

function dajungongzhang_award()
	KF_GetAward(3);
end

function hhjungongzhang_award()
	KF_GetAward(4);
end

function ryjungongzhang_award()
	KF_GetAward(5);
end

function jyr_battle_introduce()
	local tSay = {};
	local string1 = format("ChiÕn tr­êng liªn server më h»ng ngµy vµo %s, %s giê, hiÖn t¹i chØ më cho nh©n vËt chuyÓn sinh %d cÊp %d trë lªn, ®· gia nhËp l­u ph¸i, häc tÊt c¶ kü n¨ng cÊp 55, ®ång thêi mçi ng­êi chØ ®­îc tham gia %d lÇn/ngµy.\n", "16:30", "21:30", 5, 96, KF_JOIN_TIMES_MAX);
	local string2 = "ChiÕn tr­êng th¾ng lîi: muèn nhËn ®­îc th¾ng lîi cÇn ph¶i nhËn ®­îc ®Çy ®ñ ®iÓm tİch lòy chiÕn tr­êng. §iÓm tİch lòy chiÕn tr­êng nÕu bªn nµo ®¹t ®Õn sè ®iÓm giíi h¹n tr­íc sÏ giµnh th¾ng lîi. Giíi h¹n ®iÓm tİch lòy th«ng qua nh©n sè khi chiÕn tr­êng b¾t ®Çu ®Ó quyÕt ®Şnh, nh©n sè cµng nhiÒu th× chiÕn tr­êng cµng kŞch liÖt ®iÓm tİch lòy yªu cÇu sÏ cµng nhiÒu. §iÓm tİch lòy chiÕn tr­êng cã thÓ th«ng qua tiªu diÖt ng­êi ch¬i ®èi ph­¬ng, binh lİnh ®èi ph­¬ng, t­íng lÜnh, ®o¹t kú ®Ó nhËn ®­îc. \n"
	local string3 = "PhÇn th­ëng chiÕn tr­êng: Muèn nhËn ®­îc phÇn th­ëng tèt sau khi chiÕn ®Êu, cÇn ph¶i næ lùc giµnh ®­îc th¾ng lîi. PhÇn th­ëng bªn th¾ng sÏ tèt h¬n phÇn th­ëng bªn thua. Ngoµi ra trong chiÕn tr­êng cã thÓ th«ng qua viÖc ®¸nh b¹i ng­êi ch¬i ®èi ph­¬ng, binh lİnh, t­íng lÜnh, qu¸i, ®o¹t kú vµ nhiÒu h×nh thøc ®Ó nhËn ®­îc ®iÓm n¨ng ®éng. §iÓm n¨ng ®éng cµng cao th× sÏ nhËn ®­îc mét sè phÇn th­ëng v­ît møc. \n"
	local string4 = "Lîi İch chiÕn tr­êng: trong chiÕn tr­êng cã rÊt nhiÒu qu¸i vËt trung lËp, ®¸nh b¹i nã th× toµn ®éi cã thÓ nhËn ®­îc hiÖu qu¶ lîi İch. Trong chiÕn tr­êng cßn cã 2 Boss, ®¸nh b¹i nã kh«ng nh÷ng nhËn ®­îc trang bŞ tèt, mµ c¶ ®éi cßn nhËn ®­îc hiÖu qu¶ lîi İch. \n"
	--local string3 = "Ã¿ÌìµÚÒ»´Î»ñµÃ¸ß¼¶½±ÀøÊ±»¹ÄÜ»ñµÃ¶îÍâµÄÓÂÊ¿Ñ«ÕÂ¡£½±ÀøÖĞµÄÓÂÊ¿Ñ«ÕÂ£¬Ó¢ĞÛÑ«ÕÂ¿ÉÒÔÓÃÀ´ºÍÎÒ¶Ò»»ğ©ÔÂ£¬¾ÅÖİ×°±¸¡£\n";
	tSay.msg = KF_NPC_NAME..string1..string2..string3..string4;
	tSay.sel = {
		{"\nQuay l¹i", "main"},
		{"Ra khái", "nothing"},
	}
	temp_Talk(tSay);
end

function jyr_medal_shop()
	local tSay = {};
	tSay.msg = KF_NPC_NAME.."C¸c h¹ muèn tham quan cöa hµng hu©n ch­¬ng?";
	tSay.sel = {
		{"Cöa hµng Hu©n Ch­¬ng Dòng SÜ", "jyr_ys_shop"},
		{"Cöa hµng Hu©n Ch­¬ng Anh Hïng", "jyr_yx_shop"},
		{"Cöa hiÖu qu©n phôc L«i Hæ", "jyr_junzhuang_shop"},
		{"Cöa hµng trang bŞ Kim Xµ 4 sao", "jyr_jinshe_shop"},
		{"\nQuay l¹i", "main"},
		{"Ra khái", "nothing"},
	}
	temp_Talk(tSay);
end

function jyr_jinshe_shop()
	local szTitle = format("NÕu chän sö dông ph­¬ng thøc n©ng cÊp ngò hµnh, xin chó ı sÏ<color=yellow> gi¶m ®é c­êng hãa<color>:\n")
	szTitle = format("%s 1. ChØ trang bŞ cã <color=yellow>®é c­êng hãa +13 vµ trë lªn<color> míi ®­îc tham gia n©ng cÊp\n", szTitle)
	szTitle = format("%s 2. N©ng cÊp trang bŞ xong <color=yellow> +13 ®æi thµnh +0, +14 +15 ®æi thµnh +7<color>\n", szTitle)
	szTitle = format("%s tÊt c¶ <color=yellow>hiÖu qu¶ ®Şnh hån kh«ng b¶o l­u<color>\n ", szTitle)

	local strtab = {
			format("\n%s/%s","X¸c nhËn më","#show_equip_shop(3037)"),
			format("\n%s/%s","\n Ph¶n håi", "jyr_medal_shop"),
			"\n rót lui/nothing",
	};
	Say(szTitle, getn(strtab), strtab)
end

function jyr_junzhuang_shop()
	local szTitle = format("NÕu chän sö dông trang bŞ Th­¬ng ¦ng n©ng cÊp ®Õn trang bŞ L«i Hæ, xin chó ı sÏ <color=yellow>gi¶m ®é c­êng hãa<color>:\n")
	szTitle = format("%s 1. ChØ trang bŞ cã <color=yellow>®é c­êng hãa +14,+15 <color> míi ®­îc tham gia n©ng cÊp\n", szTitle)
	szTitle = format("%s 2. N©ng cÊp xong <color=yellow>®é c­êng hãa ®æi thµnh +0<color>\n", szTitle)
	szTitle = format("%s tÊt c¶ <color=yellow>hiÖu qu¶ ®Şnh hån kh«ng b¶o l­u<color>\n ", szTitle)

	local strtab = {
			format("\n%s/%s","X¸c nhËn më","#show_equip_shop(3038)"),
			format("\n%s/%s","\n Ph¶n håi", "jyr_medal_shop"),
			"\n rót lui/nothing",
	};
	Say(szTitle, getn(strtab), strtab)
	--show_equip_shop(3038);
end

function jyr_ys_shop()
	local szTitle = format("NÕu chän sö dông trang bŞ H¹o NguyÖt n©ng cÊp ®Õn trang bŞ DiÖu D­¬ng, xin chó ı <color=yellow>®é c­êng hãa gi¶m nöa<color>:\n")
	szTitle = format("%s Nh­: +1, +7, +10 n©ng cÊp xong ®é c­êng hãa sÏ ph©n biÖt ®æi thµnh +0, +3, +5\n", szTitle)
	szTitle = format("%s tÊt c¶ <color=yellow>hiÖu qu¶ ®Şnh hån kh«ng b¶o l­u<color>\n ", szTitle)

	local strtab = {
			format("\n%s/%s","X¸c nhËn më","#show_equip_shop(3028)"),
			format("\n%s/%s","\n Ph¶n håi", "jyr_medal_shop"),
			"\n rót lui/nothing",
	};
	Say(szTitle, getn(strtab), strtab)
	--show_equip_shop(3028);
end

function jyr_yx_shop()
	show_equip_shop(3029);
end

function nothing()
end