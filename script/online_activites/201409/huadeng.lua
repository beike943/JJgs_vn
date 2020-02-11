Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\missionfunctions.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\lib\\globalvalue.lua")

DebugOutput = nothing;

HD_START = {2014, 09, 07, 0, 0, 0};
HD_END = {2014, 09, 16, 0, 0, 0};

HD_NPC_NAME = "§Ìn Hoa §¨ng"

HD_PK_STATE = {
	[0] = {
		[0] = -9,
	},
	[1] = {
		[0] = 0,
		[1] = 1,
		[2] = 2,
	},
	[2] = {
		[0] = 3,
	},
	[3] = {
		[0] = 4,
	},
}

HD_NPC_POS = {
	{303, 1548, 3247, "Nga My (193,202)"},
	{305, 1563, 3005, "§­êng M«n (195,187)"},
	{209, 1480, 3243, "C¸i Bang (185,202)"},
	{312, 1760, 3433, "Vâ §ang (219,214)"},
	{407, 1576, 3312, "Ngò §éc Gi¸o (197,206)"},
	{219, 1684, 3268, "Thiªn Ba D­¬ng Phñ (211,204)"},
	{204, 1523, 3258, "ThiÕu L©m Ph¸i (190,203)"},
	{404, 1403, 2929, "Thóy Yªn (175,183)"},
}

HD_MISSION_ID = {67, 68, 69};
HD_TIMER_ID = {97, 98, 99};

HD_GV_ID = {GV_ID_HUADENG_MAP_ID_1, GV_ID_HUADENG_MAP_ID_2, GV_ID_HUADENG_MAP_ID_3};

HD_TASK_GROUP =  TaskManager:Create(10, 10);
HD_TASK_GROUP.DaySeq = 1; --¿çÌì
HD_TASK_GROUP.Time = 2; 
HD_TASK_GROUP.Box = 3;
HD_TASK_GROUP.Limit = 4;
HD_TASK_GROUP.Flag = 5;

function hd_IsActivityOpen()
	return gf_CheckDuration(HD_START, HD_END);
end

--RelayË¢»¨µÆ
function hd_CreateLantern(nRandomSeed)
	if hd_IsActivityOpen() ~= 1 then
		return 0;
	end
	randomseed(nRandomSeed);
	local tPos = gf_Random(1, getn(HD_NPC_POS), 3);
	if getn(tPos) ~= 3 then
		DebugOutput("UDERROR: getn(tPos) ~= 3")
		return 0;
	end
	if tPos[1] < 1 or tPos[1] > getn(HD_NPC_POS) or
		tPos[2] < 1 or tPos[2] > getn(HD_NPC_POS) or
		tPos[3] < 1 or tPos[3] > getn(HD_NPC_POS) then
		DebugOutput("UDERROR: tPos[i] < 1 or tPos[i] > getn(HD_NPC_POS)");
		return 0;
	end
	Msg2Global(format("§Ìn Hoa §¨ng ®· xuÊt hiÖn ë b¶n ®å %s, %s, %s, c¸c vÞ ®¹i hiÖp h·y nhanh chãng ®i tham gia nµo!", HD_NPC_POS[tPos[1]][4], HD_NPC_POS[tPos[2]][4], HD_NPC_POS[tPos[3]][4]))
	
	for i = 1, getn(tPos) do
		DebugOutput(tPos[i], SubWorldID2Idx(HD_NPC_POS[tPos[i]][1]))
		if SubWorldID2Idx(HD_NPC_POS[tPos[i]][1]) ~= -1 then
			local npcIndex = CreateNpc("§Ìn KÐo Qu©n", HD_NPC_NAME, HD_NPC_POS[tPos[i]][1], HD_NPC_POS[tPos[i]][2], HD_NPC_POS[tPos[i]][3]);
			if npcIndex > 0 then
				SetNpcScript(npcIndex, "\\script\\online_activites\\201409\\huadeng.lua");
				SetNpcLifeTime(npcIndex, 30 * 60);
				mf_OpenMission(HD_MISSION_ID[i], HD_NPC_POS[tPos[i]][1]);
				mf_SetMissionV(HD_MISSION_ID[i], 1, HD_NPC_POS[tPos[i]][1], HD_NPC_POS[tPos[i]][1]);
				mf_SetMissionV(HD_MISSION_ID[i], 2, npcIndex, HD_NPC_POS[tPos[i]][1]);
				mf_SetMissionV(HD_MISSION_ID[i], 3, GetTime(), HD_NPC_POS[tPos[i]][1]);
				SetGlbValue(HD_GV_ID[i], HD_NPC_POS[tPos[i]][1]);
			end
		end
	end
end

--»¨µÆÊÇ·ñ¼¤»î
function hd_IsActivate(npcIndex)
	for i = 1, 5 do
		if GetNpcTempData(npcIndex, i - 1) == 0 then
			return 0;
		end
	end
	return 1;
end
	
--»¨µÆ¶Ô»°
function main()
	if hd_IsActivityOpen() ~= 1 then
		Say("Event ®· hÕt h¹n", 0);
		return 0;
	end
	if gf_CheckBaseCondition(90) ~= 1 then
		return 0;
	end
	local targetNpc = GetTargetNpc();
	if GetNpcName(targetNpc) ~= HD_NPC_NAME then
		return 0;
	end
	if hd_IsActivate(targetNpc) ~= 1 then
		--Ã»ÓÐ¼¤»î ½ðÉ«£¬×ÏÉ«£¬ÂÌÉ«pk£¬ ÍÀÉ±pk£¬°ïÅÉpk
		local tSay = {};
		local namePK = {"PK mµu vµng", "PK mµu tÝm", "PK mµu lôc", "PK ®å s¸t", "PK bang ph¸i"};
		local state = {
			[0] = "Ch­a kÝch ho¹t", 
			[1] = "§· kÝch ho¹t"
		};
		for i = 1, 5 do
			tinsert(tSay, format("KÝch ho¹t %s(%s)/#hd_ActivatePK(%d)", namePK[i], state[GetNpcTempData(targetNpc, i - 1)], i))
		end
		tinsert(tSay, "§Ó ta suy nghÜ/nothing");
		Say(format("<color=green>%s:<color>", HD_NPC_NAME).."<color=red>Ch­a kÝch ho¹t, kh«ng thÓ nhËn th­ëng!<color> (Sau khi kÝch ho¹t mçi 3 phót sÏ nhËn ®­îc 690000 EXP)", getn(tSay), tSay);
	else
		--ÒÑ¾­¼¤»î
		hd_DailyReset();
		local nTime = GetTime();
		if nTime - HD_TASK_GROUP:GetTask(HD_TASK_GROUP.Time) > 180 then
			HD_TASK_GROUP:SetTask(HD_TASK_GROUP.Time, nTime);
			gf_Modify("Exp", 690000);
			if HD_TASK_GROUP:GetTask(HD_TASK_GROUP.Flag) == 0 then
				DoFireworks(832, 3);
				HD_TASK_GROUP:SetTask(HD_TASK_GROUP.Flag, HD_TASK_GROUP:GetTask(HD_TASK_GROUP.Flag) + 1);
			end
		else
			local nLast = 180 - nTime + HD_TASK_GROUP:GetTask(HD_TASK_GROUP.Time);
			Say(format("<color=green>%s:<color>", HD_NPC_NAME)..format("Cßn %d phót %d gi©y míi ®­îc nhËn phÇn th­ëng lÇn sau!", floor(nLast/ 60), mod(nLast, 60)), 0)
		end
	end
end

function hd_ActivatePK(nIndex)
	local targetNpc = GetTargetNpc();
	if GetNpcTempData(targetNpc, nIndex - 1) ~= 0 then
		Say(format("<color=green>%s:<color>", HD_NPC_NAME).."Mµu PK nµy ®· bÞ kÝch ho¹t!", 0);
		return 0;
	end
	
	local nState, nPKFlag = GetPKFlag();
	DebugOutput("nState, nPKFlag =", nState, nPKFlag);
	if HD_PK_STATE[nState][nPKFlag] ~= nIndex - 1 then
		Say(format("<color=green>%s:<color>", HD_NPC_NAME).."Mµu PK nµy kh«ng thÓ hoµn thµnh kÝch ho¹t!", 0);
		return 0;
	end
		
	SetNpcTempData(targetNpc, nIndex - 1, 1);
	Say(format("<color=green>%s:<color>", HD_NPC_NAME)..format("KÝch ho¹t thµnh c«ng!"), 0);
	
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(targetNpc,905,0,0);
end

--Ã¿ÈÕÖØÖÃ
function hd_DailyReset()
	if HD_TASK_GROUP:GetTask(HD_TASK_GROUP.DaySeq) ~= zgc_pub_day_turn() then
		HD_TASK_GROUP:SetTask(HD_TASK_GROUP.DaySeq,zgc_pub_day_turn());
		HD_TASK_GROUP:SetTask(HD_TASK_GROUP.Time,0);
		HD_TASK_GROUP:SetTask(HD_TASK_GROUP.Box,0);
		HD_TASK_GROUP:SetTask(HD_TASK_GROUP.Limit,0);
		HD_TASK_GROUP:SetTask(HD_TASK_GROUP.Flag,0);
	end
end