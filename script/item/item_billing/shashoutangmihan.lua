--create date:2007-07-02
--author:yanjun
--describe:
--ÔÚÉ±ÊÖÌÃÖĞÊ¹ÓÃºó£¬¿ÉÒÔÕÙ»½³öÒ»¸öBOSS£¬²»ÄÜÔÚÆäËûµØ·½Ê¹ÓÃ£¬²»ÄÜÔÚÉ±ÊÖÌÃÍêºóÊ¹ÓÃ¡£
--ÕÙ»½¸ÅÂÊÈçÏÂ£º
--ÏãÖ÷¡ª¡ª75%
--¸±ÌÃÖ÷¡ª¡ª20%
--Àî´ó×ì¡ª¡ª5%
--¸ÃµÀ¾ß±ØĞë¶ÓÎéÖĞÓĞ´óÓÚµÈÓÚ5ÈËÊ±²ÅÔÊĞíÊ¹ÓÃ¡£
--Ã¿¸ö¶ÓÎéÊ¹ÓÃÊ±£¬¼ä¸ôÊ±¼äÎª2·ÖÖÓ£¬Ö»Òª¶ÓÎéÖĞÓĞÒ»¸öÈËÊ¹ÓÃ¹ı£¬ËùÓĞÈËÕÙ»½¶¼±ØĞëµÈ´ı2·ÖÖÓ
Include("\\script\\task\\killer_hall\\mission\\mission_head.lua");
NEED_TEAM_MEMBER = 5;	--ĞèÒªµÄ¶ÓÔ±ÊıÁ¿
NEED_INTERVAL = 2*60;	--ĞèÒªµÄ¼ä¸ôÊ±¼ä
function OnUse(nItemIdx)
	local nCurMapID = GetWorldPos();
	if nCurMapID ~= MAP_ID then
		Talk(1,"","MËt hµm S¸t Thñ ®­êng chØ ®­îc sö dông trong S¸t Thñ §­êng. ");
		return 0;
	end;
	if GetMissionV(MV_MISSION_STATE) ~= MS_STATE_STARTED then
		Talk(1,"","MËt hµm S¸t Thñ ®­êng chØ ®­îc sö dông khi s¸t thñ xuÊt hiÖn. ");
		return 0;
	end;
	local nTeamSize = GetTeamSize();
	if nTeamSize < NEED_TEAM_MEMBER then
		Talk(1,"","Ph¶i sö dông MËt hµm S¸t Thñ ®­êng, İt nhÊt ph¶i cã <color=yellow>"..(NEED_TEAM_MEMBER-1).."<color> ®ång ®éi gióp b¹n. ");
		return 0;
	end;
	local nTimeElapse = GetTime() - get_team_use_time(nTeamSize);
	if nTimeElapse <= NEED_INTERVAL then	--Ê±¼ä»¹Ã»µ½
		Talk(1,"","cßn <color=yellow>"..tf_GetTimeString(NEED_INTERVAL-nTimeElapse).."<color> míi cã thÓ tiÕp tôc sö dông MËt hµm S¸t Thñ ®­êng. ");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		set_team_time(nTeamSize);
		create_boss();
	end;
end;
--·µ»Ø¶ÓÎéÀïÃæµÄÍæ¼Ò×î½üÊ¹ÓÃÉ±ÊÖÌÃÃØº¯µÄÊ±¼ä
function get_team_use_time(nTeamSize)
	local nOldPlayerIdx = PlayerIndex;
	local nNearestTime = 0;
	local nUseTime = 0;
	for i=1,nTeamSize do
		PlayerIndex = GetTeamMember(i);
		nUseTime = GetTask(KH_TASK_USE_MIHAN_TIME);
		nNearestTime = max(nUseTime,nNearestTime);
	end;
	PlayerIndex = nOldPlayerIdx;
	return nNearestTime;
end;
--ÉèÖÃ¶ÓÎéÀïÃæËùÓĞÍæ¼ÒµÄÊ¹ÓÃÊ±¼ä
function set_team_time(nTeamSize)
	local nOldPlayerIdx = PlayerIndex;
	local nTime = GetTime();
	for i=1,nTeamSize do
		PlayerIndex = GetTeamMember(i);
		SetTask(KH_TASK_USE_MIHAN_TIME,nTime);
	end;
	PlayerIndex = nOldPlayerIdx;
end;
--Ëæ»ú´´½¨Ò»¸öboss
function create_boss()
	local nRand = random(1,100);
	local nType = 0;
	if nRand <= 75 then
		nType = NPC_TYPE_XIANGZHU;
	elseif nRand <= 95 then
		nType = NPC_TYPE_FUTANGZHU;
	else
		nType = NPC_TYPE_LIDAZUI;
	end;
	local sBossModel,sBossName,nLifeTime = tNpcInfo[nType][1],tNpcInfo[nType][2],tNpcInfo[nType][3];
	local nNpcIdx = CreateNpc(sBossModel,sBossName,GetWorldPos());
	SetNpcDeathScript(nNpcIdx,"\\script\\task\\killer_hall\\npc_death.lua");
	SetNpcLifeTime(nNpcIdx,nLifeTime);
	gf_Msg2Team(GetName().."sö dông 1 MËt hµm S¸t Thñ ®­êng, triÖu tËp "..sBossName);
	WriteLog("[S¸t Thñ §­êng]::"..GetName().."sö dông 1 MËt hµm S¸t Thñ ®­êng, t¹o ra "..sBossName)
end;