Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\missions\\tong_melee\\tm_define.lua")
Include("\\settings\\static_script\\missions\\base\\mission_head.lua")
Include("\\settings\\static_script\\global\\tonginfo_task.lua")
Include("\\script\\lib\\date.lua")
Include("\\script\\task_access_code_def.lua")
Include("\\script\\lib\\sdb.lua")
Include("\\script\\system_switch_config.lua")
Include("\\settings\\static_script\\vip_feedback_system\\yinjuan_api.lua")
Include("\\script\\tmp_task_id_def.lua")

thisFile = "\\script\\missions\\tong_melee\\mission.lua"

tbTONGMELEE = {
	name = "Lo¹n chiÕn bang héi",
	missionID = 65, --\gamesvr\settings\task\missions.txt
	realMapID = 6074,
	dynamicMap = 1, --ÊÇ·ñ¶¯Ì¬¼ÓÔØ
	
	MaxTongCount = 20, --×î´ó°ï»áÊýÁ¿
	
	--mv1-MaxTongCount±íÊ¾°ïÅÉ»ý·Ö
	--ms1-MaxTongCount¼ÇÂ¼°ïÅÉÃû³Æ
	mv_TongCount = 21, --¼ÇÂ¼°ïÅÉÊýÁ¿
	mv_RandomEvent = 22, --mv_RandomEvent+20 21¸öµãµÄnpcIndex
}

tbTONGMELEE = inherit(missionHead, tbTONGMELEE);
--------------------------------------------------------------------
function tm_IsTongMeleeOpen()
	if IsTongMeleeSystemOpen() ~= 1 then
		Talk(1,"",TM_TONG_AD_NPC.."TÝnh n¨ng t¹m thêi ch­a më, xin h·y ®îi!");
		return 0;
	end
	return 1;	
end

function tm_WeeklyClear()
	gf_SetTaskByte(TM_TASKID_YINJUAN, 3, 0, TASK_ACCESS_CODE_TONG_MELEE);
	gf_SetTaskByte(TM_TASKID_YINJUAN, 4, 0, TASK_ACCESS_CODE_TONG_MELEE);
end

function tm_checkJoinCondition()
	local today = Date();
	local wDay = today:week();
	if wDay ~= 0 then
		Talk(1,"",TM_TONG_AD_NPC.."HiÖn t¹i kh«ng ph¶i thêi gian b¸o danh, thêi gian b¾t ®Çu b¸o danh Bang Héi §¹i Lo¹n §Êu lµ 12:45, 22:15 chñ nhËt h»ng tuÇn");
		return 0;
	end
	if GetName() ~= GetCaptainName() then
		Talk(1,"",TM_TONG_AD_NPC.."ChØ cã ®éi tr­ëng míi cã thÓ tiÕn hµnh b¸o danh tham gia lo¹n chiÕn bang héi");
		return 0;
	end
	if tit_IsTempTong() ~= 0 then
		Talk(1,"",TM_TONG_AD_NPC.."Ng­¬i vÉn ch­a cã bang héi hoÆc lµ bang héi t¹m thêi, kh«ng thÓ b¸o danh tham chiÕn");
		return 0;
	end
	if tit_IsTongManager() ~= 1 then
		Talk(1,"",TM_TONG_AD_NPC.."ChØ cã thµnh viªn qu¶n lý bang héi míi dÉn d¾t ®éi ngò tiÕn hµnh b¸o danh");
		return 0;
	end
	local nTeamSize = gf_GetTeamSize();
	if nTeamSize ~= 8 then
		Talk(1,"",TM_TONG_AD_NPC.."Nh©n sè tæ ®éi kh«ng ®ñ 8 ng­êi, kh«ng thÓ tiÕn hµnh b¸o danh!");
		return 0;
	end
	local oldPlayerIndex = PlayerIndex;
	local bIsLevelUp90 = nil;
	local levelMsg = "Thµnh viªn tæ ®éi ch­a ®ñ cÊp 90: \n"
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i);
		if GetLevel() < 90 then
			levelMsg = levelMsg..format("<color=red>%s<color>(%d cÊp)\n", GetName(), GetLevel());
			bIsLevelUp90 = 1;
		end
	end
	PlayerIndex = oldPlayerIndex;
	if bIsLevelUp90 then
		Talk(1,"",TM_TONG_AD_NPC..levelMsg);
		return 0;
	end
	local bIsSameTong = nil;
	local msg = "Thµnh viªn sau kh«ng thuéc bang héi: \n"
	local szTongName = tm_GetTongName();
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i);
		if tm_GetTongName() ~= szTongName then
			msg = msg..format("<color=red>%s<color>(%s)\n", GetName(), tm_GetTongName());
			bIsSameTong = 1;
		end
	end
	PlayerIndex = oldPlayerIndex;
	if bIsSameTong then
		Talk(1,"",TM_TONG_AD_NPC..msg);
		return 0;
	end
	
	local bIsFree = nil;
	local msg1 = "Hµnh trang cña ®éi viªn d­íi ®©y kh«ng ®ñ chç trèng: \n"
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i);
		if gf_Judge_Room_Weight(1, 0) ~= 1 then
			msg1 = msg1..format("<color=red>%s<color>\n", GetName());
			bIsFree = 1;
		end
	end
	PlayerIndex = oldPlayerIndex;
	if bIsFree then
		Talk(1,"",TM_TONG_AD_NPC..msg1);
		return 0;
	end
	
	local bIsPK = nil;
	local msg2 = "§iÓm PK cña ®éi viªn d­íi ®©y qu¸ cao: \n"
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i);
		if GetPKValue() >= 10 then
			msg2 = msg2..format("<color=red>%s<color>(%d)\n", GetName(), GetPKValue());
			bIsPK = 1;
		end
	end
	PlayerIndex = oldPlayerIndex;
	if bIsPK then
		Talk(1,"",TM_TONG_AD_NPC..msg2);
		return 0;
	end
	
	return 1;
end

--·ÖÅäÉñÊÞ
function tm_assign_beast(bTag, nPlayerIndex)
	if GetName() ~= GetCaptainName() then
		Talk(1,"",TM_TONG_AD_NPC.."Ng­¬i kh«ng ph¶i lµ ®éi tr­ëng kh«ng thÓ ph©n phèi ThÇn Thó!");
		return 0;
	end
	if bTag and bTag == 2 then
		local oldPlayerIdx2 = PlayerIndex;
		PlayerIndex = nPlayerIndex;
		local nRet = tm_AssignBeast();
		PlayerIndex = oldPlayerIdx2;
		if nRet == -1 then
			Talk(1,"",TM_TONG_AD_NPC.."Kh«ng gian hµnh trang kh«ng ®ñ".."Ph©n phèi ThÇn Thó thÊt b¹i");
		end
		if nRet == -2 or nRet == -4 then
			Talk(1,"",TM_TONG_AD_NPC.."Ph©n phèi ThÇn Thó thÊt b¹i");
		end
		if nRet == -3 then
			Talk(1,"",TM_TONG_AD_NPC.."Qóy bang ®· ph©n phèi ThÇn Thó råi, kh«ng thÓ lµm thªm");
		end
		return (nRet == 1) and 3 or 0;
	end
	if bTag and bTag == 1 then
		local oldPlayerIdx1 = PlayerIndex;
		local PlayerIndex = nPlayerIndex;
		local sSay = format("Ng­¬i quyÕt ®Þnh muèn giao ThÇn Thó cho %s chø?", GetName());
		PlayerIndex = oldPlayerIdx1;
		Say(TM_TONG_AD_NPC..sSay, 2, format("§ång ý/#tm_assign_beast(2, %d)", nPlayerIndex), "Hñy bá/nothing");
		return 2;
	end
	local oldPlayerIndex = PlayerIndex;
	local tSay = {};
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		tinsert(tSay, GetName()..format("/#tm_assign_beast(1, %d)", PlayerIndex));
		if GetItemCount(2, 1, 30616) >= 1 or GetTrigger(1534*2) > 0 then
			Talk(1,"",TM_TONG_AD_NPC.."Qóy bang ®· ph©n phèi ThÇn Thó råi, kh«ng thÓ lµm thªm");
			return 0;
		end
	end
	tinsert(tSay, "Ta suy nghÜ l¹i/nothing");
	PlayerIndex = oldPlayerIndex;
	Say(TM_TONG_AD_NPC.."§¹i hiÖp muèn lÊy ThÇn Thó giao cho vÞ nµo trong bang héi kh«ng? 1 bang chØ cã thÓ nhËn 1 ThÇn Thó, sau khi ®· giao cho thµnh viªn trong bang nµo ®ã th× kh«ng thÓ ®æi l¹i.", getn(tSay), tSay);
	return 1;
end

function tm_aoto_assign_beast()
	local oldPlayerIndex = PlayerIndex;
	local nTeamSize = GetTeamSize();
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i);
		if GetItemCount(2, 1, 30616) >= 1 or GetTrigger(1534*2) > 0 then
			PlayerIndex = oldPlayerIndex;
			return 1;
		end
	end
	local nRet = 0;
	local nMaxTimes = 0;
	repeat
		local nRand = random(nTeamSize);
		PlayerIndex = GetTeamMember(nRand);
		nRet = tm_AssignBeast();
		nMaxTimes = nMaxTimes + 1;
	until nRet == 1 or nMaxTimes > 99;
	PlayerIndex = oldPlayerIndex;
	if nMaxTimes > 99 and nRet ~= 1 then
		DebugOutput("tm_aoto_assign_beast() failed!!!");
	end
end

function tm_AssignBeast()
	if gf_Judge_Room_Weight(1, 10) ~= 1 then
		return -1;
	end
	if DelItem(2, 1, 30615, 1) ~= 1 then
		return -2;
	end
	local oldPlayerIndex = PlayerIndex;
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if GetItemCount(2, 1, 30616) >= 1 or GetTrigger(1534*2) > 0 then
			return -3;
		end
	end
	PlayerIndex = oldPlayerIndex;
	--¸øµÀ¾ß
	AddItem(2, 1, 30616, 1);
	--¸ø´¥·¢Æ÷
	local nTrigger = CreateTrigger(1, 1534, 1534*2);
	if not nTrigger or nTrigger == 0 then
		DelItem(2, 1, 30616, 1);
		AddItem(2, 1, 30615, 1);
		return -4;
	end
	ContinueTimer(nTrigger);
	SetCurrentNpcSFX(PIdx2NpcIdx(), 921,0,1,18*3);
	--¶ÓÎéÏûÏ¢
	gf_Msg2Team(format("%s trë thµnh ThÇn Thó Hé Gi¶!", GetName()));
	return 1;
end

--Àë¿ªÕ½³¡
function tm_leave_battle(bTag)
	if 	not bTag or bTag == 0 then
		Say(TM_TONG_AD_NPC.."Ng­¬i quyÕt ®Þnh rêi khái lo¹n chiÕn bang héi chø?", 2, "QuyÕt ®Þnh rêi khái/#tm_leave_battle(1)", "Ta suy nghÜ l¹i/nothing");
		return 0;
	end
	DelMSPlayer(tbTONGMELEE.missionID, 0);
end

--5ÃëÒ»´Î£¬ÉñÊÞ¿´»¤Õß´¥·¢Æ÷
function tm_OnTimer()
	local nMapId, nMapTemplteId = SubWorldIdx2ID(SubWorld);
	if nMapTemplteId ~= 6074 then
		DelItem(2, 1, 30616, GetItemCount(2, 1, 30616));
		RemoveTrigger(GetTrigger(1534*2));
		return 0;
	end
	--´´½¨ºÍ¸üÐÂÉñÊÞ
	local bRet = tm_SummonNpc();
	--¸øÉñÊÞBUFF
	if bRet == 1 then
		local nIndex, nLevel = tm_GetNpcLocate();
		if not nLevel or nLevel == 0 then
			DebugOutput("tm_OnTimer() nLevel == 0");
			return 0;
		end
		gf_TeamOperateEX(function (nLevel)
			CastState("state_p_attack_percent_add", nLevel * 10, 30 * 60 * 18, 1, 9991, 1);
			CastState("state_m_attack_percent_add", nLevel * 10, 30 * 60 * 18, 1, 9992, 1);
			CastState("state_burst_enhance_rate"  , nLevel * 10, 30 * 60 * 18, 1, 9993, 1);
			CastState("state_move_speed_percent_add", nLevel * 10, 30 * 60 * 18, 1, 9994, 1);
			SyncCustomState(1, 9991, 1, format("ThÇn Thó LV%d", nLevel));
			Msg2Player("B¹n nhËn ®­îc "..format("ThÇn Thó LV%d: lùc c«ng kÝch t¨ng %d%%, tèc ®é xuÊt chiªu t¨ng %d%%, tèc ®é di chuyÓn t¨ng %d%%", nLevel, nLevel*10, nLevel*10, nLevel*10));
		end, nLevel);	
	end
end

--½øÈëmissionµÄÊ±ºò³õÊ¼»¯
function tm_set_tong_info()
	if GetName() ~= GetCaptainName() then
		return 0;
	end
	local nTongCout = GetMissionV(tbTONGMELEE.mv_TongCount);
	DebugOutput("tm_set_tong_info(), ", nTongCout + 1, tm_GetTongName())
	if nTongCout >= tbTONGMELEE.MaxTongCount then
		return 0;
	end
	SetMissionV(tbTONGMELEE.mv_TongCount, nTongCout + 1);
	SetMissionS(nTongCout + 1, tm_GetTongName());
	SetMissionV(nTongCout + 1, 500);
end

--»ñµÃÄ³°ïÅÉµÄ»ý·Ö
function tm_get_tongsorce()
	for i = 1, tbTONGMELEE.MaxTongCount do
		if tostring(GetMissionS(i)) == tostring(tm_GetTongName()) then
			return GetMissionV(i);
		end
	end
	return 0;
end

--ÉèÖÃÄ³°ïÅÉ»ý·Ö
function tm_set_tongsorce(nSorce)
	DebugOutput("tm_set_tongsorce(nSorce)", GetName(), tm_GetTongName(), nSorce);
	local nCurTime = GetTime();
	if nSorce > 0 then
		if nCurTime - GetTaskTemp(TMP_TASK_TONG_MELEE_DOUBLESORCE) <= 30 then
			nSorce = nSorce * 2;
		end
	elseif nSorce < 0 then
		if nCurTime - GetTaskTemp(TMP_TASK_TONG_MELEE_NOTREDUCESORCE) <= 30 then
			return 1;
		end
	end
	for i = 1, tbTONGMELEE.MaxTongCount do
		if tostring(GetMissionS(i)) == tostring(tm_GetTongName()) then
			if nSorce > 0 then
				SetMissionV(i, GetMissionV(i) + nSorce);
				gf_Msg2Team(format("§iÓm linh lùc bang héi %s råi %d, tæng sè lµ %d", "T¨ng", nSorce, GetMissionV(i)));
			else
				SetMissionV(i, max(GetMissionV(i) + nSorce, 0));
				gf_Msg2Team(format("§iÓm linh lùc bang héi %s råi %d, tæng sè lµ %d", "Gi¶m", -nSorce, GetMissionV(i)));
			end
			return 1;
		end
	end
	return 0;
end

function tm_GetNpcLocate()
	local nIndex = 0;
	local nSubIndex = 0;
	local oldPlayerIdx = PlayerIndex;
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		local nFollower = GetFollower();
		if nFollower and nFollower > 0 then
			local sNpcName = GetNpcName(nFollower);
			for i = 1, getn(TM_TONG_SHENSHOU) do
				for j = 1, getn(TM_TONG_SHENSHOU[i]) do
					if TM_TONG_SHENSHOU[i][j] == sNpcName then
						nIndex = i;
						nSubIndex = j;					
					end
				end
			end
			break;
		end
	end
	PlayerIndex = oldPlayerIdx;
	return nIndex, nSubIndex;
end

--´´½¨ÉñÊÞ
function tm_SummonNpc()
	local nIndex = 0;
	local nSubIndex = 0;
	local nOldSubIndex = 0;
	local nFollower = GetFollower();
	if not nFollower or nFollower <= 0 then
		nIndex = random(4);
	else
		nIndex, nOldSubIndex = tm_GetNpcLocate();
		if nIndex == 0 then
			DebugOutput("can't find npc name~");
			return 0
		end
	end
	local nTongSorce = tm_get_tongsorce();
	if nTongSorce < 600 then
		nSubIndex = 1;
	elseif nTongSorce >= 600 and nTongSorce < 800 then
		nSubIndex = 2;
	elseif nTongSorce >= 800 and nTongSorce < 1200 then
		nSubIndex = 3;
	elseif nTongSorce >= 1200 then
		nSubIndex = 4;
	end
	if nSubIndex == 0 then
		DebugOutput("nSubIndex == 0");
		return 0;
	end
	if nSubIndex ~= nOldSubIndex then
		DebugOutput("TM_TONG_SHENSHOU[nIndex][nSubIndex] =",TM_TONG_SHENSHOU[nIndex][nSubIndex]);
		local bRetIndex = SummonNpc(TM_TONG_SHENSHOU_MODEL[nIndex][nSubIndex], TM_TONG_SHENSHOU[nIndex][nSubIndex]);
		if bRetIndex > 0 then
			if nSubIndex > nOldSubIndex then
				gf_Msg2Team(format("Chóc mõng thÇn thó bang héi ®· th¨ng cÊp %s", TM_TONG_SHENSHOU[nIndex][nSubIndex]));
				Msg2MSAll(format("Chóc mõng %s thÇn thó bang héi th¨ng cÊp %s", tm_GetTongName(), TM_TONG_SHENSHOU[nIndex][nSubIndex]));
			elseif nSubIndex < nOldSubIndex then
				gf_Msg2Team(format("ThÇn thó cña bang héi bÞ h¹ cÊp lµ %s", TM_TONG_SHENSHOU[nIndex][nSubIndex]));
				Msg2MSAll(format("%s thÇn thó bang héi bÞ h¹ cÊp lµ %s", tm_GetTongName(), TM_TONG_SHENSHOU[nIndex][nSubIndex]));
			end
			return 1;
		end
	end
	return 0;
end

function _tm_GetRankTable()
	local tRezult = {};
	local nTongCout = GetMissionV(tbTONGMELEE.mv_TongCount);
	for i = 1, nTongCout do
		--DebugOutput(GetMissionS(i), GetMissionV(i), type(GetMissionS(i)), type(GetMissionV(i)))
		tinsert(tRezult, {tostring(GetMissionS(i)), tonumber(GetMissionV(i))});
	end
	--DebugOutput("sort before----")
	for k, v in tRezult do
		if type(v) == "table" then
			--DebugOutput(k, v[1], v[2]);
		else
			--DebugOutput(k, v);
		end
	end
	--DebugOutput("---------------");
	sort(tRezult, function (t1, t2)
			--DebugOutput(t1[1], t1[2], t2[1], t2[2])
			return t1[2] > t2[2];
		end);
	--DebugOutput("sort after-----");
	for k, v in tRezult do
		if type(v) == "table" then
			--DebugOutput(k, v[1], v[2]);
		else
			--DebugOutput(k, v);
		end
	end
	--DebugOutput("---------------");
	return tRezult;
end

function tm_UpdateTongToClient()
	DebugOutput("tm_UpdateTongToClient() --------");
	local tRezult = _tm_GetRankTable();
	UpdateTongMeleeData(tRezult);
end

function tm_SetTempRevPos()
	local nMapID = GetMissionV(MV_MAP_ID);
	local nIndex = random(getn(TM_REVPOS));
	DebugOutput("SetTempRevPos",nMapID, TM_REVPOS[nIndex][1], TM_REVPOS[nIndex][2])
	SetTempRevPos(nMapID, TM_REVPOS[nIndex][1] * 32, TM_REVPOS[nIndex][2] * 32);
end

function tm_ResetEventPoint(npcIndex)
	local npcIdx = tonumber(npcIndex);
	if not npcIdx or type(npcIdx) ~= "number" then
		print("UDERROR:[TongMelee] tm_ResetEventPoint(npcIdx) not npcIdx or type(npcIdx) ~= number");
		return 0;
	end
	for i = tbTONGMELEE.mv_RandomEvent, tbTONGMELEE.mv_RandomEvent + 20 do
		if GetMissionV(i) == npcIdx then
			SetMissionV(i, 0);
		end
	end
end

function tm_RandomEvent()
	local nMapID = GetMissionV(MV_MAP_ID);
	DebugOutput("tm_RandomEvent() nMapID =", nMapID);
	if getn(TM_RANDOM_EVENT_POS) ~= 21 then
		print("UDERROR: tm_RandomEvent() getn(TM_RANDOM_EVENT_POS) ~= 21", getn(TM_RANDOM_EVENT_POS));
		return 0;
	end
	local nSize = getn(TM_RANMDOM_EVEN_NPC);
	for i = 1, 21 do
		if GetMissionV(tbTONGMELEE.mv_RandomEvent + i - 1) == 0 then
			local nKind = random(nSize);
			local npcIndex = CreateNpc(TM_RANMDOM_EVEN_NPC[nKind][1], TM_RANMDOM_EVEN_NPC[nKind][2], nMapID, TM_RANDOM_EVENT_POS[i][1], TM_RANDOM_EVENT_POS[i][2]);
			if TM_RANMDOM_EVEN_NPC[nKind][3] == 0 then
				SetNpcDeathScript(npcIndex, "\\script\\missions\\tong_melee\\mission.lua");
			elseif TM_RANMDOM_EVEN_NPC[nKind][3] == 1 then
				SetNpcScript(npcIndex, "\\script\\missions\\tong_melee\\mission.lua");
			end
			SetMissionV(tbTONGMELEE.mv_RandomEvent + i - 1, npcIndex);
		end
	end
end

function tm_Event1()
	local nMapID = GetMissionV(MV_MAP_ID);
	DebugOutput("tm_Event1() nMapID =", nMapID);
	if getn(TM_RANDOM_EVENT_POS) ~= 21 then
		print("UDERROR: tm_RandomEvent() getn(TM_RANDOM_EVENT_POS) ~= 21", getn(TM_RANDOM_EVENT_POS));
		return 0;
	end
	local nSize = getn(TM_RANMDOM_EVEN_NPC);
	for i = 11, 21 do
		if GetMissionV(tbTONGMELEE.mv_RandomEvent + i - 1) == 0 then
			local npcIndex = 0;
			if random(100) > 75 then --B
				npcIndex = CreateNpc(TM_RANMDOM_EVEN_NPC[2][1], TM_RANMDOM_EVEN_NPC[2][2], nMapID, TM_RANDOM_EVENT_POS[i][1], TM_RANDOM_EVENT_POS[i][2]);
				SetNpcDeathScript(npcIndex, "\\script\\missions\\tong_melee\\mission.lua");
			else --A
				npcIndex = CreateNpc(TM_RANMDOM_EVEN_NPC[1][1], TM_RANMDOM_EVEN_NPC[1][2], nMapID, TM_RANDOM_EVENT_POS[i][1], TM_RANDOM_EVENT_POS[i][2]);
				SetNpcDeathScript(npcIndex, "\\script\\missions\\tong_melee\\mission.lua");
			end
			SetMissionV(tbTONGMELEE.mv_RandomEvent + i - 1, npcIndex);
		end
	end
end

function tm_SetPlayer2Fight()
	DebugOutput("tm_SetPlayer2Fight()")
	CastState("state_dispear",100,5*18);
	tm_SetTempRevPos();
	SetTempRevScript(thisFile);
	RestoreAll();
	SetFightState(1);
	if GetTrigger(1534*2) > 0 then
		SetCurrentNpcSFX(PIdx2NpcIdx(), 921,0,1,18*3);
	end
end

function tm_GetTongName()
	if tit_IsHaveTong() ~= 1 then
		DebugOutput("tm_GetTongName tit_IsHaveTong() ~= 1 return nil")
		return " ";
	end
	local gsName, sName = gf_GetRealmName(GetName());
	local sTongName = GetTongName();
	return gsName.."*"..sTongName;
end

function tm_EveryMatchAward()
	DebugOutput("tm_EveryMatchAward()------");
	local nTongCout = GetMissionV(tbTONGMELEE.mv_TongCount);
	local tRezult = _tm_GetRankTable();
	local nRank = 2*nTongCout+1;
	local nSorce = 0;
	local sTongName = tm_GetTongName();
	for i = 1, nTongCout do
		if sTongName == tRezult[i][1] then
			 nRank = i;
			 nSorce = tRezult[i][2];
			 break;
		end
	end
	Msg2Player(format("Chóc mõng quý bang trong lo¹n chiÕn bang héi ®· nhËn ®­îc h¹ng %d, tæng ®iÓm linh lùc lµ %d, nhËn ®­îc %d ®iÓm cèng hiÕn bang héi, h·y trë vÒ server nguån t×m [Ng­êi NhËn Th­ëng Liªn Server] nhËn phÇn th­ëng cña trËn nµy.", 
		nRank, nSorce, TM_RANK_SORCE[nRank]));
	local nLevel = GetLevel();
	local nExp = nLevel * nLevel * nLevel * (2 * nTongCout + 1 - nRank);
	local nYinJuan = 5 * (2 * nTongCout + 1 - nRank);
	--gf_ModifyExp(nExp);
	--yinquanapi_limittop_award_yinquan(nYinJuan)
	SetTask(TM_TASKID_EXP, nExp, TASK_ACCESS_CODE_TONG_MELEE);
	gf_SetMyTaskByte(TM_TASKID_YINJUAN, 1, 2, nYinJuan, TASK_ACCESS_CODE_TONG_MELEE);
end

function tm_RankShow()
	DebugOutput("tm_RankShow()------");
	local tRezult = _tm_GetRankTable();
	Msg2MSAll(tbTONGMELEE.missionID, "XÕp h¹ng bang héi lo¹n chiÕn:");
	for i = 1, min(3, GetMissionV(tbTONGMELEE.mv_TongCount)) do
		Msg2MSAll(tbTONGMELEE.missionID, format("XÕp h¹ng %d :%s[%d]", i, tRezult[i][1], tRezult[i][2]));	
	end
	--Êý¾Ý¿âÅÅÃû
	local s = SDB(TM_RANK_INMATCHREALM, 0, 0);
	s:apply2(callout(_tm_RelayShareDataRank, tRezult))
end

function _tm_RelayShareDataRank(tRezult, nCount, sdb)
	DebugOutput("_tm_RelayShareDataRank", tRezult, nCount, sdb)
	DebugOutput("-----------------")
	local tRank = {};
	for i = 1, getn(tRezult) do
		DebugOutput(tRezult[i][1],tRezult[i][2],TM_RANK_SORCE[i]);
		tinsert(tRank, {tRezult[i][1], TM_RANK_SORCE[i]});
	end
	DebugOutput("-----------------")
	for i = 1, nCount do
		local tData = sdb[i-1];
		DebugOutput(tData[1], tData[2]);
		if tData[1] and tData[2] ~= 0 then
			for j = 1, getn(tRank) do
				if tRank[j][1] == tData[1] then
					tRank[j][2] = tRank[j][2] + tData[2];
					break;
				end
			end
		end
	end
	DebugOutput("-----------------")
	for i = 1, getn(tRank) do
		DebugOutput(tRank[i][1],tRank[i][2]);
	end
	DebugOutput("-----------------")
	local s = SDB(TM_RANK_INMATCHREALM, 0, 0);
	s.sortType = 2;
	for i = 1, getn(tRank) do
		s[tRank[i][1]] = {"d", tRank[i][2]};
	end
end

function tm_CheckPlayer()
	if GetTrigger(1534*2) <= 0 then
		return 0;
	end
	if IsPlayerDeath() == 1 then
		RevivePlayer(1);
		tm_SetPlayer2Fight();
	end
end