--create date:2007-07-04
--author:yanjun
--describe:¶¨ÒåÒ»Ð©°ï»á¹Ø¿¨Ïà¹ØµÄ²Ù×÷
Include("\\script\\missions\\tong_mission\\main_head.lua");
Include("\\script\\online_activites\\task_values.lua");--ÈÎÎñ±äÁ¿Í·ÎÄ¼þ

--»ñÈ¡Ä¿±ê³¡µØµÄ×´Ì¬ºÍÊ¹ÓÃ³¡µØµÄ°ï»áÃû×Ö
function TM_GetFieldInfo(nAreaIdx,nFieldIdx)
	local szTongName = "";
	local nMapID = GetWorldPos();
	local nFieldMapID = TM_GetFieldMapID(nMapID,nAreaIdx,nFieldIdx);
	local nMisstionState = mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,nFieldMapID);
	if nMisstionState == MS_STATE_IDEL then
		return nMisstionState,0,"R¶nh rçi";
	else
		szTongName = mf_GetMissionS(MISSION_ID,MS_TONG_NAME,nFieldMapID);
		nStage = mf_GetMissionV(MISSION_ID,MV_STAGE,nFieldMapID);
		return nMisstionState,nStage,szTongName;
	end;
end;
--¸ù¾ÝµØÍ¼ID£¬ÇøÓòË÷Òý£¬³¡µØË÷ÒýÈýÕß»ñÈ¡³¡µØµÄµØÍ¼ID
function TM_GetFieldMapID(nCurMapID,nAreaIdx,nFieldIdx)
	return FTB_CITY[nCurMapID][nAreaIdx][nFieldIdx];
end;
--´´½¨³¡µØNPC
function TM_CreateFieldNpc(nMapID)
	local nNpcIdx = CreateNpc("V­¬ng An Th¹ch","Qu¶n lý ngo¹i ®­êng Tö Quang C¸c",nMapID,tPos_Out_Room[1],tPos_Out_Room[2]);
	SetNpcScript(nNpcIdx,"\\script\\missions\\tong_mission\\npc\\npc_stage_manager.lua");
	nNpcIdx = CreateNpc("V­¬ng An Th¹ch","Qu¶n lý néi ®­êng Tö Quang C¸c",nMapID,tPos_In_Room[1],tPos_In_Room[2]);
	SetNpcScript(nNpcIdx,"\\script\\missions\\tong_mission\\npc\\npc_stage_manager.lua");
end;
--»ñÈ¡ÕýÑ¡¡¢Ìæ²¹¡¢ÕýÑ¡ÖÐ°ï»áÁìµ¼µÄË÷Òýtable
function TM_GetPlayerTable()
	local tbPlayer = mf_GetMSPlayerIndex(MISSION_ID,ALL_CAMP);	
	local tbNormalPlayer = {};
	local tbSubPlayer = {};
	local tbTongHeader = {};
	local nOldPlayerIdx = PlayerIndex;
	local nCurJob = 0;
	for i=1,getn(tbPlayer) do
		PlayerIndex = tbPlayer[i];
		if GetTaskTemp(TSK_TEMP_STATUS) == 1 then
			tinsert(tbNormalPlayer,PlayerIndex);
			nCurJob = IsTongMember();
			if nCurJob ~= 0 and nCurJob <= 3 and GetTaskTemp(TSK_TEMP_HELPER) ~= 1 then
				tinsert(tbTongHeader,PlayerIndex);
			end;
		else
			tinsert(tbSubPlayer,PlayerIndex);
		end;
	end;
	PlayerIndex = nOldPlayerIdx
	return tbNormalPlayer,tbSubPlayer,tbTongHeader;
end;
--»ñÈ¡³¡µØÀïÃæµÄÕýÑ¡ÓÐ¶àÉÙ¸ö
function TM_GetNormalPlayerCount()
	local tbNormalPlayer = TM_GetPlayerTable();
	return getn(tbNormalPlayer);
end;
--»ñÈ¡Ìæ²¹µÄÈËÊý
function TM_GetSubPlayerCount()
	local _,tbSubPlayer = TM_GetPlayerTable();
	return getn(tbSubPlayer);
end;
--¼ì²âÕýÑ¡Íæ¼ÒµÄ×é³É½á¹¹£ºÄ³¸öÁ÷ÅÉÕýÑ¡ÈËÊýÊÇ·ñ³¬¹ý3¡£·ûºÏ¹æÔò·µ»Ø1£¬²»·ûºÏ¹æÔò·µ»Ø0
function TM_CheckNormalPlayer(nRoute)
	local tbNormalPlayer = TM_GetPlayerTable();
	local nOldPlayerIdx = PlayerIndex;
	local tbRoutCount = {};	
	for i=0,30 do	--³õÊ¼»¯tbRoutCount
		tbRoutCount[i] = 0;
	end;
	for i=1,getn(tbNormalPlayer) do
		PlayerIndex = tbNormalPlayer[i];
		local nRoute = GetPlayerRoute();
		tbRoutCount[nRoute] = tbRoutCount[nRoute] + 1;
	end;
	PlayerIndex = nOldPlayerIdx;
	local nRoutPlayerCount = tbRoutCount[GetPlayerRoute()];
	if nRoutPlayerCount >= MAX_ROUTE_PLAYER_COUNT then
		return 0;
	else
		return 1;
	end;
end;
--³õÊ¼»¯Ä³¸ö¹Ø¿¨
function TM_InitStage(nStage)
	TB_STAGE[nStage]:InitStage();
end;
--²¥·ÅÒôÐ§
function TM_PlaySound(tbPlayer,szWavFileName)
	local lfFunc = function(tArg)
		PlaySound("\\sound\\"..%szWavFileName);
	end;
	gf_OperatePlayers(tbPlayer,lfFunc,{});
end;	
--ÔÚÄ³¸öµØµã²¥·ÅÒ»¸öÌØÐ§
function TM_DoSpecialEffect(nMapX,nMapY,nEffectID,szEffectName,nTime)
	if szEffectName == nil or szEffectName == "" then
		szEffectName = " ";
	end;
	local nMapID = SubWorldIdx2ID(SubWorld);
	local nNpcIdx = CreateNpc("Ng­êi V« h×nh",szEffectName,nMapID,nMapX,nMapY);
	SetNpcLifeTime(nNpcIdx,nTime);
	SetCurrentNpcSFX(nNpcIdx,nEffectID,1,1);
end;
--sample:TM_SetRelayTongData("É½Èª¾Ó",5,"d",1);
function TM_SetRelayTongData(szTongName,nDataIdx,szFormat,nsData)
	AddRelayShareData(szTongName,0,0,"","",0,nDataIdx,szFormat,nsData);
	DelRelayShareDataCopy(szTongName,0,0);
end;
--¼ì²éµ±Ç°°ï»áÓÐÃ»ÓÐ¼¤»î³¡µØ
function TM_GetTongFieldState(szTongName)
	for i,v in FTB_CITY do
		for j=1,getn(v) do
			for k=1,getn(v[j]) do
				if tostring(GetMissionExValue(TONG_MISSIONEX,v[j][k])) == szTongName then
					return i,j,k;	--mapid,areaidx,fieldidx
				end;
			end;
		end;
	end;
	return 0,0,0;
end;
--Çå³ýÄ¿±ê³ÇÊÐµÄËùÓÐ³¡µØÐÅÏ¢
function TM_ClearFieldState(nCityMapID)
	if SubWorldID2Idx(nCityMapID) >= 0 then
		gf_ShowDebugInfor("B¶n ®å:"..nCityMapID.."TÊt c¶ nh÷ng th«ng tin liªn quan vÒ ¶i");
		for i,v in FTB_CITY[nCityMapID] do
			for j=1,getn(v) do
				SetMissionExValue(TONG_MISSIONEX,v[j],0);
			end;
		end;
	end;
end;
--Çå³ýËùÓÐ³ÇÊÐµÄ³¡µØÐÅÏ¢
function TM_ClearAllFieldState()
	TM_ClearFieldState(100);
	TM_ClearFieldState(150);
	TM_ClearFieldState(200);
	TM_ClearFieldState(300);
	TM_ClearFieldState(350);
end;
--ÉèÖÃÄ³¸ö³¡µØµÄÐÅÏ¢£º±ê¼ÇÕâ¸ö³¡±»Ä³¸ö°ï»áÕ¼ÓÐ
function TM_SetTongFieldState(nFieldMapID,szTongName)
	SetMissionExValue(TONG_MISSIONEX,nFieldMapID,szTongName);
end;
--´´½¨Ò»¸ö¶Ô»°Ïä×Ó
function TM_CreateBox(nStage)
	local nMapID = SubWorldIdx2ID(SubWorld);
	local nNpcIdx = CreateNpc("R­¬ng tiÒn","thø"..nStage.."R­¬ng cña ¶i",nMapID,1569,3175);
	TM_SetUnitCurStates(nNpcIdx,1,nStage);	--±ê¼ÇÕâ¸öÏä×ÓÊÇµÚ¼¸¹ØµÄ
	SetNpcScript(nNpcIdx,"\\script\\missions\\tong_mission\\npc\\npc_box.lua");
	SetMissionV(MV_GET_BOX,1);
end;
--º¯ÊýÃû³Æ£ºNPCË÷ÒýÖµÉè¶¨
--¹¦        ÄÜ£ºÖ±½ÓÉè¶¨NPCË÷ÒýÎ»ÖÃµÄÖµ
function TM_SetUnitCurStates(Npc_index,att_seq,number)
	if number > 99 and att_seq ~= 1 and att_seq ~= 4 and att_seq ~= 5 and att_seq ~= 6 then
		print("ThiÕt lËp trÞ sè NPC nhÇm: VÞ trÝ:"..att_seq.."TrÞ:"..number)
		return 0
	end
	local num_save = GetUnitCurStates(Npc_index,att_seq)
	num_save = number - num_save
	AddUnitStates(Npc_index,att_seq,num_save)
	return 1
end
--´´½¨Ìæ²¹ÇøµÄNPC
function TM_CreateSubNpc(nCount)
	local nNpcIdx = 0;
	local nMapID = SubWorldIdx2ID(SubWorld);
	for i=1,nCount do
		nNpcIdx = CreateNpc("TiÓu qu¸i ë khu vùc bæ sung","VÖ binh ngo¹i ®­êng",nMapID,1536,3253,-1,1,1,200);
		SetNpcDeathScript(nNpcIdx,"\\script\\missions\\tong_mission\\stage\\death_sub_npc.lua");
	end;
end;
--ÐÞ¸ÄNPCÑªÁ¿£¬²ÎÊý1£ºNPCË÷Òý£¬²ÎÊý2£ºÑªÁ¿Öµ£¬²ÎÊý3£ºÊÇ·ñÎª°Ù·Ö±È£¬1±íÊ¾ÊÇ£¬0±íÊ¾²»ÊÇ£¨Ä¬ÈÏÊÇ1£©
function TM_ModifyNpcLife(nNpcIdx,nValue,bPercent)
	if bPercent == 0 then	--Èç¹û²»ÊÇ°Ù·Ö±È
		ModifyNpcData(nNpcIdx,0,nValue,1);
		return 0;
	end;
	local nNpcMaxLife = GetUnitCurStates(nNpcIdx,1);	
	local nDamage = floor(nNpcMaxLife*nValue/100);	--¸ù¾Ý°Ù·Ö±ÈÀ´¼ÆËã¸Ä±äµÄÑªÁ¿
	ModifyNpcData(nNpcIdx,0,nDamage,1);
end;
--»ñÈ¡NPC×î´óÑªÁ¿ºÍµ±Ç°ÑªÁ¿£¬²ÎÊý¶þ±íÊ¾µ±Ç°ÑªÁ¿ÊÇ·ñÎª°Ù·Ö±È,1±íÊ¾ÊÇ£¬0±íÊ¾²»ÊÇ£¬Ä¬ÈÏÊÇ1
function TM_GetNpcLife(nNpcIdx,bPercent)
	if nNpcIdx == 0 then
		return 0,0;
	end;
	local nMaxLife,nCurLife = GetUnitCurStates(nNpcIdx,1);
	if bPercent == 0 then	--Èç¹û²»ÊÇ°Ù·Ö±È
		return nMaxLife,nCurLife;
	end;
	gf_ShowDebugInfor("nCurLife:"..nCurLife);
	gf_ShowDebugInfor("nMaxLife:"..nMaxLife);
	return nMaxLife,floor(nCurLife/nMaxLife*100);
end;
--»ñÈ¡Íæ¼ÒµÄ×î´óÉúÃüÖµºÍµ±Ç°ÉúÃüÖµ
function TM_GetPlayerLife(nPlayerIdx)
	local nOldIdx = PlayerIndex;
	if nPlayerIdx ~= nil then
		PlayerIndex = nPlayeridx;
	end;
	local nMaxLife,nCurLife = GetUnitCurStates(PIdx2NpcIdx(PlayerIndex),1);
	PlayerIndex = nOldIdx;
	return nMaxLife,nCurLife;
end;
--Ôö¼ÓÍæ¼Ò¹Ø¿¨»ý·Ö
function TM_AddPoint(nPoint,nCurStage,tbPlayer)
	if tbPlayer == nil then --Ä¬ÈÏÊÇËùÓÐÍæ¼Ò
		tbPlayer = mf_GetMSPlayerIndex(MISSION_ID,ALL_CAMP);
	end;
	if GetMissionV(MV_KILL_SUB_NPC) >= MIN_KILL_SUB_NPC_COUNT then
		nPoint = nPoint + KILL_SUB_NPC_POINT;
		Msg2MSAll(MISSION_ID,"§· giÕt vÖ binh ngo¹i ®­êng ë ¶i nµy v­ît qu¸ "..MIN_KILL_SUB_NPC_COUNT..", tÊt c¶ mäi ng­êi sÏ ®­îc th­ëng thªm "..KILL_SUB_NPC_POINT.."®iÓm phÇn th­ëng tÝch lòy");
	end;
	local funAddPoint = function(tbArg)
		local nPassTimes = TM_GetStagePassTimes(%nCurStage);
		local nP = %nPoint;
		if nPassTimes == 2 then
			nP = floor(nP*4/5);
		elseif nPassTimes == 3 then
			nP = floor(nP*3/5);
		elseif nPassTimes >= 4 then
			nP = floor(nP*1/10);
		end;
--    if %nCurStage == 6 then
--        SetTask(VET_201009_00_TASK_TONGGUAN_ZIGUANG,1)
--    end
		SetTask(TSK_POINT,GetTask(TSK_POINT)+nP);
		Msg2Player("Trong tuÇn nµy ®¹i hiÖp ®©y lµ lÇn thø "..nPassTimes.." v­ît ¶i "..%nCurStage..", cã thÓ thu ®­îc "..%nPoint.." ®iÓm quan ¶i, sau khi trõ xong cã sè ®iÓm thùc tÕ lµ "..nP.." ®iÓm quan ¶i");
	end;
	gf_OperatePlayers(tbPlayer,funAddPoint,{});
end;
--Ôö¼ÓÍæ¼Ò¾­Ñé
function TM_AddExpAward(nCurStage,tbPlayer)
	if tbPlayer == nil then --Ä¬ÈÏÊÇËùÓÐÍæ¼Ò
		tbPlayer = mf_GetMSPlayerIndex(MISSION_ID,ALL_CAMP);
	end;
	local funAddExp = function(tbArg)
		local nPassTimes = TM_GetStagePassTimes(%nCurStage);
		local nX = 0;
		if nPassTimes == 1 then
			nX = 1;
		elseif nPassTimes == 2 then
			nX = 2/5;
		elseif nPassTimes == 3 then
			nX =1/5;
		elseif nPassTimes == 4 then
			nX = 1/10
		elseif nPassTimes > 4 then
			nX = 0;
		end;
		if IsPlayerDeath() ~= 1 then	--Èç¹ûÃ»ËÀ
			local nExp = floor(GetLevel()^3*4);
			local nExp2 = floor(nX*nExp);
			ModifyExp(nExp2);
			Msg2Player("Trong tuÇn nµy ®¹i hiÖp ®©y lµ lÇn thø "..nPassTimes.." v­ît ¶i "..%nCurStage..", cã thÓ thu ®­îc "..nExp.." kinh nghiÖm, sau khi trõ xong cã sè ®iÓm thùc tÕ lµ "..nExp2.." ®iÓm kinh nghiÖm");
		end;
	end;
	gf_OperatePlayers(tbPlayer,funAddExp,{});
end;
--»ñµÃ¹ÖµÄÃÅÅÉ
function TM_GetNpcFaction(nNpcIdx)
	local szNpcName = GetNpcName(nNpcIdx);
	local szPreName = szNpcName;
	if szPreName == "Bãng hé vÖ ThiÕu L©m" then
		return 1;
	elseif szPreName == "Bãng hé vÖ Vâ §ang" then
		return 2;
	elseif szPreName == "Bãng hé vÖ Nga Mi" then
		return 3;
	elseif szPreName == "Bãng hé vÖ C¸i Bang" then
		return 4;
	elseif szPreName == "Bãng hé vÖ §­êng M«n" then
		return 5;
	elseif szPreName == "Bãng hé vÖ D­¬ng M«n" then
		return 6;
	elseif szPreName == "Bãng hé vÖ Ngò §éc" then
		return 7;
	elseif szPreName == "C«n L«n ¶nh Tö Hé VÖ" then
		return 8;
	elseif szPreName == "Thóy Yªn ¶nh Tö Hé VÖ" then
		return 10;
	else
		return 0;
	end;
end;
--´´½¨ÃÅÅÉ¹Ö
function TM_CreateFactionNpc(nMapX,nMapY,nCount,nNpcTableIdx,nRadius)
	if nRadius == nil then
		nRadius = 50;	--Ä¬ÈÏÊÇ50·¶Î§ÄÚËæ»úË¢
	end;
	local nMapID = SubWorldIdx2ID(SubWorld);
	local szModel,szName = tb_Npc_Info[nNpcTableIdx][1],tb_Npc_Info[nNpcTableIdx][2];
	local nNpcIdx = 0;
	for i=1,nCount do
		nNpcIdx = CreateNpc(szModel,szName,nMapID,nMapX,nMapY,-1,1,1,nRadius);
		SetNpcDeathScript(nNpcIdx,"\\script\\missions\\tong_mission\\stage\\death_npc.lua");
	end;
	SetMissionV(MV_FAC_NPC_COUNT,GetMissionV(MV_FAC_NPC_COUNT)+nCount);
end;
--¸øÄ³Íæ¼Ò¼¯ºÏ¿ªÊ¼Ò»¸öÊ±¼ä½ø¶ÈÌõ
function TM_StartTimeGuage(szInfo,nDuration,bRepeat,nCustomID,tbPlayer)
	if tbPlayer == nil then --Ä¬ÈÏÊÇËùÓÐÍæ¼Ò
		tbPlayer = mf_GetMSPlayerIndex(MISSION_ID,ALL_CAMP);
	end;
	local funTimeGuage = function(tbArg)
		StartTimeGuage(%szInfo,%nDuration,%bRepeat,%nCustomID)
	end;
	gf_OperatePlayers(tbPlayer,funTimeGuage,{});
end
--Í£Ö¹Ä³¸ö¼ÆÊ±Æ÷
function TM_StopTimeGuage(nCustomID,tbPlayer)
	if tbPlayer == nil then --Ä¬ÈÏÊÇËùÓÐÍæ¼Ò
		tbPlayer = mf_GetMSPlayerIndex(MISSION_ID,ALL_CAMP);
	end;
	local funTimeGuage = function(tbArg)
		StopTimeGuage(%nCustomID);
	end;
	gf_OperatePlayers(tbPlayer,funTimeGuage,{});
end;
--¹Ø±ÕËùÓÐ³ÇÊÐµÄ¹Ø¿¨
function TM_CloseAllField()
	for i,v in FTB_CITY do
		if SubWorldID2Idx(i) >= 0 then
			for j=1,getn(v) do
				for k=1,getn(v[j]) do
					mf_CloseMission(MISSION_ID,v[j][k]);
				end;
			end;
		end;
	end;
end;
--Ò»ÖÜÒ»Çå£¨ÏÖÔÚ¸Ä³ÉÖÜ6ÖÜÈÕ¸÷ÇåÒ»´Î£©
function TM_WeeklyClear()
	local nCurWeek = tonumber(date("%y%W"));
	if GetTask(TSK_WEEK) < nCurWeek then
		SetTask(TSK_WEEK,nCurWeek);
		SetTask(TSK_ATTEND_STAGE_1,0);
		SetTask(TSK_ATTEND_STAGE_2,0);
		SetTask(TSK_ATTEND_STAGE_3,0);
		SetTask(TSK_ATTEND_STAGE_4,0);
		SetTask(TSK_ATTEND_STAGE_5,0);
		SetTask(TSK_ATTEND_STAGE_6,0);
                if tonumber(date("%w")) ~= 6 and tonumber(date("%w")) ~= 0 then
                    SetTask(2122, 0);--Éè¶¨µ½ÁËÐÇÆÚÁù¿ÉÒÔÖØÖÃ
                end
        else
                if GetTask(2122) == 0 then
                    local nDay = tonumber(date("%w"));
                    if nDay == 6 or nDay == 0 then
                        SetTask(TSK_WEEK,nCurWeek);
		        SetTask(TSK_ATTEND_STAGE_1,0);
		        SetTask(TSK_ATTEND_STAGE_2,0);
		        SetTask(TSK_ATTEND_STAGE_3,0);
		        SetTask(TSK_ATTEND_STAGE_4,0);
		        SetTask(TSK_ATTEND_STAGE_5,0);
		        SetTask(TSK_ATTEND_STAGE_6,0);
                        SetTask(2122, 1);--Éè¶¨ÖØÖÃÒ»´Îºó²»ÄÜÔÙÖØÖÃÁË
                    end
                end
	end;
end;
--»ñµÃÍæ¼Ò±¾ÖÜÍ¨¹ýÄ³Ò»ÌìµÄ´ÎÊý
function TM_GetStagePassTimes(nStage)
	return GetTask(TSK_ATTEND_STAGE_1+nStage-1);
end;
--Íæ¼ÒÍ¨¹ýÄ³¹Ø¿¨´ÎÊý¼Ó1
function TM_AddStagePassTimes(nStage,tbPlayer)
	if tbPlayer == nil then --Ä¬ÈÏÊÇËùÓÐÍæ¼Ò
		tbPlayer = mf_GetMSPlayerIndex(MISSION_ID,ALL_CAMP);
	end;
	local funAddPassTimes = function(tbArg)
		SetTask(TSK_ATTEND_STAGE_1+%nStage-1,TM_GetStagePassTimes(%nStage)+1);	
	end;
	gf_OperatePlayers(tbPlayer,funAddPassTimes,{});
end;

function nothing()

end;
