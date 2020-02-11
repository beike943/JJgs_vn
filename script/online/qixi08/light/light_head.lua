--°ÂÔËÆßÏ¦»î¶¯µãµÆÍ·ÎÄ¼þ
--by vivi
--2008\07\17

Include("\\script\\online\\qixi08\\function.lua");

--ÈÎÎñ±äÁ¿
TSK_AOYUN_LIGHT_AWARD = 1970;    --ÊÇ·ñÁìÈ¡¹ý½±Àø
TSK_AOYUN_LIGHT_DATE = 1971;		 --ÁìÈ¡½±ÀøµÄÈÕÆÚ
TSK_AOYUN_LIGHT_GUAN = 1972;     --Í¨ÁËµÚ¼¸¹Ø
TSK_AOYUN_LIGHT_NUM = 1973;      --Á¬ÐøÍ¨¹Ø´ÎÊý	

--MISSIONÏà¹Ø
AOYUN_LIGHT_MISSION_ID = 45;        --mission id
AOYUN_LIGHT_TIMER_ID = 74;           --¼ÆÊ±Æ÷ID
AOYUN_LIGHT_LOG_ID = 1113;          --µÇÂ½´¥·¢Æ÷ID
AOYUN_LIGHT_LOG_CUSTOM_ID = 558;    --µÇÂ½´¥·¢Æ÷×Ô¶¨Òå±àºÅ

--=========================================================================================
AOYUN_LIGHT_FRAME_PER_SECOND = 18;								--ÓÎÏ·ÔËÐÐËÙ¶È£ºÃ¿Ãë£±£¸Ö¡
--¶¨Òå¸÷¸ö½×¶ÎµÄ³ÖÐøÊ±¼ä£¬Ö»ÄÜÌî·Ç0ÕýÕûÊý==================================================
AOYUN_LIGHT_READY_TIME = 20;										--×¼±¸Ê±¼ä£¬20s
AOYUN_LIGHT_STARTED_TIME = 120;								--½øÐÐÊ±¼ä£¬2·ÖÖÓ
AOYUN_LIGHT_ENDING_TIME = 20;									--µÈ´ý½áÊøÊ±¼ä£¬20s

--¶¨Òå¸÷¸ö½×¶Î¼ÆÊ±Æ÷µÄ´¥·¢¼ä¸ô=============================================================
AOYUN_LIGHT_READY_TIMER_INTERVAL = 10;							--¼ÆÊ±Æ÷´¥·¢µÄÊ±¼ä¼ä¸ô£¬µ¥Î»s
AOYUN_LIGHT_READY_TIMER_COUNT = (AOYUN_LIGHT_READY_TIME/AOYUN_LIGHT_READY_TIMER_INTERVAL)-1;	
AOYUN_LIGHT_DIANDENG_TIMER_INTERVAL = 10;            --ÏµÍ³Ã¿5sµãÒ»´ÎµÆ
AOYUN_LIGHT_STARTED_TIMER_INTERVAL = 30;					
AOYUN_LIGHT_STARTED_TIMER_COUNT = (AOYUN_LIGHT_STARTED_TIME/AOYUN_LIGHT_STARTED_TIMER_INTERVAL)-1;	
AOYUN_LIGHT_ENDING_TIMER_INTERVAL = 10;
AOYUN_LIGHT_ENDING_TIMER_COUNT = (AOYUN_LIGHT_ENDING_TIME/AOYUN_LIGHT_ENDING_TIMER_INTERVAL)-1;	

--MissionV±äÁ¿=============================================================================
AOYUN_LIGHT_MISSION_STATE = 1;								--¼ÇÂ¼Mission×´Ì¬
AOYUN_LIGHT_TIMER_LOOP = 2;									--¼ÇÂ¼¼ÆÊ±Æ÷µÄ¼ÆÊý
AOYUN_LIGHT_MISSION_UID = 3;									--¼ÇÂ¼MissionµÄÎ¨Ò»ID
AOYUN_LIGHT_MAPID = 4;                        --¼ÇÂ¼missionµØÍ¼µÄid
AOYUN_LIGHT_MAPIDX = 5;											--¼ÇÂ¼missionµØÍ¼µÄË÷Òý
AOYUN_LIGHT_GUAN_TYPE = 6;                   --¼ÇÂ¼ÌôÕ½µÚ¼¸¹Ø
AOYUN_LIGHT_GUAN_SUC = 7;                    --´³¹ØÊÇ·ñ³É¹¦

AOYUN_LIGHT_IDX = 11;                      --11-26ÎªÊ¥»ðÌ¨Ë÷Òý

--MissionS±äÁ¿=============================================================================
AOYUN_LIGHT_DENG_SEQ = 1;                  --µãµÆË³Ðò
AOYUN_LIGHT_PLAYER_SEQ = 2;                --Íæ¼ÒµãµÆË³Ðò

--Mission×´Ì¬¼¯============================================================================
AOYUN_LIGHT_STATE_IDEL = 0;									--³¡µØ¿ÕÏÐ
AOYUN_LIGHT_STATE_READY = 1;									--×¼±¸½×¶Î
AOYUN_LIGHT_STATE_DIANDENG = 2;               --ÏµÍ³µãµÆ½×¶Î
AOYUN_LIGHT_STATE_STARTED = 3;								--Íæ¼ÒµãµÆ½×¶Î
AOYUN_LIGHT_STATE_ENDING = 4;								--µÈ´ý½áÊø½×¶Î
--=========================================================================================

--È«¾Ö±äÁ¿
tMapId = {
	{977,1622,3181},
	{{100,1445,2950},
	 {200,1412,2853},
	 {300,1776,3541}
	}};
tLightNpc = {
	{"§µi ®uèc","§Ìn 1",1621,3141,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"§µi ®uèc","§Ìn 2",1607,3154,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"§µi ®uèc","§Ìn 3",1593,3167,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"§µi ®uèc","§Ìn 4",1579,3183,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"§µi ®uèc","§Ìn 5",1594,3198,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"§µi ®uèc","§Ìn 6",1608,3214,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"§µi ®uèc","§Ìn 7",1624,3228,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"§µi ®uèc","§Ìn 8",1640,3213,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"§µi ®uèc","§Ìn 9",1654,3200,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"§µi ®uèc","§Ìn 10",1667,3187,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"§µi ®uèc","§Ìn 11",1649,3170,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"§µi ®uèc","§Ìn 12",1636,3154,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"§µi ®uèc","§Ìn 13",1635,3168,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"§µi ®uèc","§Ìn 14",1609,3194,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"§µi ®uèc","§Ìn 15",1610,3169,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"§µi ®uèc","§Ìn 16",1638,3197,"\\script\\online\\qixi08\\light\\light_npc.lua"}
	};

AOYUN_LIGHT_CAMP = 1;							--µãµÆÕóÓª
AOYUN_LIGHT_TOTAL_MAP = 10;        --×î¶à20×éÈËÔÚ¹Ø¿¨

--½±Àø
tLightAward = {--¾­Ñé£¬±¦Ê¯°ü¹üid£¬ÊýÁ¿£¬½¡¿µ¾­Ñé
	{1000000,2,1,2642,2,2500000},
	{1000000,2,1,2642,3,3000000},
	{1000000,2,1,2642,4,3500000},
	{1000000,2,1,2642,5,4000000},
	{2000000,2,1,2642,6,4000000}
};

function aoyun_light_random(nMin,nMax,nType)
	local tLetter = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P"};
	local sBackNum = "";
	if nType == 1 then	
		for i=nMin,nMax do
			local nRand = random(nMin,nMax);
			sBackNum = sBackNum..tLetter[nRand];
		end
	elseif nType == 2 then
		local tArgNum = {};
		for i=nMin,nMax do
			tinsert(tArgNum,i);
		end
		for j=1,getn(tArgNum) do
			local nRand = random(1,getn(tArgNum));
			sBackNum = sBackNum..tLetter[nRand];
			tremove(tLetter,nRand);
			tremove(tArgNum,nRand);
		end
	end
	return sBackNum;
end

--»ñÈ¡¶¯Ì¬¹Ø¿¨ID
function aoyun_light_GetIdleRoom()
	local nCount = 0;
	local nMapID,nMapIdx = 0,0;
	nCount = GetMapLoadCount(tMapId[1][1]);
	if nCount < AOYUN_LIGHT_TOTAL_MAP then
		nMapID,nMapIdx = DynamicLoadMap(tMapId[1][1]);
		return nMapID,nMapIdx;
	end;			
	return 0,0;
end;

--¿ªÆôÒ»³¡¹Ø¿¨
function aoyun_light_OpenMatch()
	local nMapID,nMapIdx = aoyun_light_GetIdleRoom();
	if nMapID == 0 and nMapIdx == 0 then
		Talk(1,"","Khu thi ®Êu hiÖn t¹i ®· ®Çy, xin quay l¹i sau.")
		return 0;
	end;
	local nOldPIdx = PlayerIndex;
	if mf_OpenMission(AOYUN_LIGHT_MISSION_ID,nMapID) == 1 then
		mf_SetMissionV(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_GUAN_TYPE,1,nMapID);	
		mf_SetMissionV(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_MAPID,nMapID,nMapID);
		mf_SetMissionV(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_MAPIDX,nMapIdx,nMapID);
		ClearMapTrap(nMapID); --Çå³þµ±Ç°µØÍ¼µÄtrapµã
		local nTeamSize = GetTeamSize();
		if nTeamSize == 0 or nTeamSize == 1 then
			mf_JoinMission(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_CAMP,nMapID);
		else	
			for i=1,GetTeamSize() do
				PlayerIndex = GetTeamMember(i);
				mf_JoinMission(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_CAMP,nMapID);
			end
		end
	end
	PlayerIndex = nOldPIdx;
end;

--³õÊ¼»¯³¡µØboss
function aoyun_light_InitFieldNpc(nType)
	local nMapID = gf_GetCurMapID();
	local nNpcIdx = 0;
	if nType == 1 then	
		for i=1,8 do
			nNpcIdx = CreateNpc(tLightNpc[i][1],tLightNpc[i][2],nMapID,tLightNpc[i][3],tLightNpc[i][4]);
			SetNpcScript(nNpcIdx,tLightNpc[i][5]);
			SetMissionV(i+10,nNpcIdx);
		end
	end
	if nType == 2 or nType == 4 then
		return
	end 
	if nType == 3 then
		for i=9,12 do
			nNpcIdx = CreateNpc(tLightNpc[i][1],tLightNpc[i][2],nMapID,tLightNpc[i][3],tLightNpc[i][4]);
			SetNpcScript(nNpcIdx,tLightNpc[i][5]);
			SetMissionV(i+10,nNpcIdx);
		end	
	end
	if nType == 5 then
		for i=13,16 do
			nNpcIdx = CreateNpc(tLightNpc[i][1],tLightNpc[i][2],nMapID,tLightNpc[i][3],tLightNpc[i][4]);
			SetNpcScript(nNpcIdx,tLightNpc[i][5]);
			SetMissionV(i+10,nNpcIdx);
		end	
	end
end;

--¹Ø±ÕµãµÆ³¡µØ
function aoyun_light_CloseField()
	local nMapID = GetMissionV(AOYUN_LIGHT_MAPID);
	local nMapIdx = GetMissionV(AOYUN_LIGHT_MAPIDX);
	CloseMission(AOYUN_LIGHT_MISSION_ID);
	local nRetCode = FreeDynamicMap(nMapID,nMapIdx);	--FreeDynamicMapÒ²»áµ÷ÓÃCloseMisssion
	if nRetCode ~= 1 then
		WriteLog("[ThÕ vËn héi th¾p ®Ìn bÞ lçi]:FreeDynamicMap bÞ lçi, nRetCode:"..nRetCode);
	end;
end;

--×ª»»Missionµ±Ç°×´Ì¬
function aoyun_light_ChangeMSState(nState)
	if nState == AOYUN_LIGHT_STATE_IDEL then
		StopMissionTimer(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_TIMER_ID);	--½áÊøÇ°Ò»¸ö¼ÆÊ±Æ÷
		SetMissionV(AOYUN_LIGHT_MISSION_STATE,AOYUN_LIGHT_STATE_IDEL);
	elseif nState == AOYUN_LIGHT_STATE_READY then
		SetMissionV(AOYUN_LIGHT_MISSION_STATE,AOYUN_LIGHT_STATE_READY);	--ÉèÖÃMissionµÄ×´Ì¬Îª×¼±¸×´Ì¬
		SetMissionV(AOYUN_LIGHT_TIMER_LOOP,AOYUN_LIGHT_READY_TIMER_COUNT);	--ÉèÖÃ¼ÆÊ±Æ÷×Ü¼ÆÊ±´ÎÊý
		StopMissionTimer(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_TIMER_ID);	--½áÊøÇ°Ò»¸ö¼ÆÊ±Æ÷
		StartMissionTimer(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_TIMER_ID,AOYUN_LIGHT_READY_TIMER_INTERVAL*AOYUN_LIGHT_FRAME_PER_SECOND);	--¿ªÊ¼Ò»¸ö¼ÆÊ±Æ÷	
	elseif nState == AOYUN_LIGHT_STATE_DIANDENG then
		SetMissionV(AOYUN_LIGHT_MISSION_STATE,AOYUN_LIGHT_STATE_DIANDENG);
		SetMissionV(AOYUN_LIGHT_TIMER_LOOP,strlen(GetMissionS(AOYUN_LIGHT_DENG_SEQ)));
		StopMissionTimer(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_TIMER_ID);
		StartMissionTimer(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_TIMER_ID,AOYUN_LIGHT_DIANDENG_TIMER_INTERVAL*AOYUN_LIGHT_FRAME_PER_SECOND);
	elseif nState == AOYUN_LIGHT_STATE_STARTED then
		SetMissionV(AOYUN_LIGHT_MISSION_STATE,AOYUN_LIGHT_STATE_STARTED);	--ÉèÖÃMissionµÄ×´Ì¬Îª¿ªÊ¼×´Ì¬
		SetMissionV(AOYUN_LIGHT_TIMER_LOOP,AOYUN_LIGHT_STARTED_TIMER_COUNT);	--ÉèÖÃ¿ªÊ¼×´Ì¬µÄ³ÖÐøÊ±¼ä
		StopMissionTimer(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_TIMER_ID);	--½áÊøÇ°Ò»¸ö¼ÆÊ±Æ÷
		StartMissionTimer(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_TIMER_ID,AOYUN_LIGHT_STARTED_TIMER_INTERVAL*AOYUN_LIGHT_FRAME_PER_SECOND);	--¿ªÊ¼Ò»¸öÐÂµÄ¼ÆÊ±Æ÷
	elseif nState == AOYUN_LIGHT_STATE_ENDING then
		SetMissionV(AOYUN_LIGHT_MISSION_STATE,AOYUN_LIGHT_STATE_ENDING);
		SetMissionV(AOYUN_LIGHT_TIMER_LOOP,AOYUN_LIGHT_ENDING_TIMER_COUNT);
		StopMissionTimer(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_TIMER_ID);
		StartMissionTimer(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_TIMER_ID,AOYUN_LIGHT_ENDING_TIMER_INTERVAL*AOYUN_LIGHT_FRAME_PER_SECOND);
	end;
end;

function aoyun_light_right_seq(nType)
	local tLetter = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P"};
	local sSeq = "";
	if nType == 1 then
		for i=1,strlen(GetMissionS(AOYUN_LIGHT_DENG_SEQ)) do
			for j=1,getn(tLetter) do
				if strsub(GetMissionS(AOYUN_LIGHT_DENG_SEQ),i,i) == tLetter[j] then
					if i ~= strlen(GetMissionS(AOYUN_LIGHT_DENG_SEQ)) then	
						sSeq = sSeq..j..",";
					else
						sSeq = sSeq..j;
					end
					break;
				end
			end
		end
	elseif nType == 2 then
		for i=1,strlen(GetMissionS(AOYUN_LIGHT_PLAYER_SEQ)) do
			for j=1,getn(tLetter) do
				if strsub(GetMissionS(AOYUN_LIGHT_PLAYER_SEQ),i,i) == tLetter[j] then
					if i ~= strlen(GetMissionS(AOYUN_LIGHT_PLAYER_SEQ)) then	
						sSeq = sSeq..j..",";
					else
						sSeq = sSeq..j;
					end
					break;
				end
			end
		end		
	end
	return sSeq;
end
