Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\function\\zq_battles\\zq_define.lua")
Include("\\script\\task_access_code_def.lua")
Include("\\script\\task\\global_task\\gtask_data.lua")
Include("\\script\\system_switch_config.lua")
Include("\\script\\lib\\talktmp.lua")

--»ñµÃÕóÓª
function ZQ_GetCamp()
	local nValue = GetTask(ZQ_CONST_JG_TASK);
	local nCamp = gf_GetTaskByte(ZQ_BATTLE_TASK1, 1);
	if nValue > 0 then
		if nCamp ~= SONG_ID then
			gf_SetTaskByte(ZQ_BATTLE_TASK1, 1, SONG_ID, TASK_ACCESS_CODE_ZQBATTLE);
			ZQ_Task_DelAndClean(LIAO_ID);
		end
		return SONG_ID;
	elseif nValue < 0 then
		if nCamp ~= LIAO_ID then
			gf_SetTaskByte(ZQ_BATTLE_TASK1, 1, LIAO_ID, TASK_ACCESS_CODE_ZQBATTLE);
			ZQ_Task_DelAndClean(SONG_ID);
		end
		return LIAO_ID;
	else
		return ALL_ID;
	end
end

function ZQ_Task_DelAndClean(nCamp)
	local nCampAnother;
	if nCamp == SONG_ID then
		nCampAnother = LIAO_ID;
	elseif nCamp == LIAO_ID then
		nCampAnother = SONG_ID;
	else
		return 0;
	end
	for i = 0, 1 do
		local nIndex = 2 * i + nCamp;
		local tSubTaskList = ZQ_TASK_LIST[nIndex];
		local nIndexAnother = 2 * i + nCampAnother;
		local tSubTaskListAnother = ZQ_TASK_LIST[nIndexAnother];
		if not tSubTaskList then return 0; end
		if not tSubTaskListAnother then return 0; end
		for j = 1, getn(tSubTaskList) do
			local tCeil = tSubTaskList[j];
			if not tCeil or getn(tCeil) ~= ZQ_TASK_TOTAL then return 0; end
			local tCeilAnother = tSubTaskListAnother[j];
			if not tCeilAnother or getn(tCeilAnother) ~= ZQ_TASK_TOTAL then return 0; end
			--¸´ÖÆ×´Ì¬
			gf_SetTaskBit(tCeilAnother[2], tCeilAnother[3], gf_GetTaskBit(tCeil[2], tCeil[3]), TASK_ACCESS_CODE_ZQBATTLE);
			gf_SetTaskBit(tCeilAnother[2], tCeilAnother[4], gf_GetTaskBit(tCeil[2], tCeil[4]), TASK_ACCESS_CODE_ZQBATTLE);
			--É¾³ý½ÓÁËµÄÈÎÎñ
			if tGtTask:check_cur_task(tCeil[1]) == 1 then
				DirectDeleteTask(tCeil[1]);
				--¶ÔÓ¦ÒÑ½ÓÖÃÁã
				gf_SetTaskBit(tCeilAnother[2], tCeilAnother[4], 0, TASK_ACCESS_CODE_ZQBATTLE);
			end
			--Ô­×´Ì¬ÖÃÁã
			gf_SetTaskBit(tCeil[2], tCeil[3], 0, TASK_ACCESS_CODE_ZQBATTLE);
			gf_SetTaskBit(tCeil[2], tCeil[4], 0, TASK_ACCESS_CODE_ZQBATTLE);
		end		
	end
end

--±£´æÕóÓª
function ZQ_SetCamp(nCamp)
	if nCamp ~= SONG_ID and nCamp ~= LIAO_ID then
		print("UERROR:ZQ_SetCamp nCamp illegality")
		return 0;
	end
	if nCamp == SONG_ID and GetTask(ZQ_CONST_JG_TASK) == 0 then
		SetTask(ZQ_CONST_JG_TASK, 1);
	end
	if nCamp == LIAO_ID and GetTask(ZQ_CONST_JG_TASK) == 0 then
		SetTask(ZQ_CONST_JG_TASK, -1);
	end
	gf_SetTaskByte(ZQ_BATTLE_TASK1, 1, nCamp, TASK_ACCESS_CODE_ZQBATTLE);
end

--ÅÐ¶ÏÕóÓª
function ZQ_JugdeCamp(nCamp)
	if ZQ_GetCamp() == nCamp then
		return 1;
	else
		return 0;
	end
end

--µØÍ¼ºÏ·¨
function ZQ_IsAllowMap()
	local nMapId, nX, nY = GetWorldPos();
	if nMapId ~= ZQ_MAP_ID then
		return 0;
	end
	return 1;
end

--¼ÇÂ¼½øÈëÐ¡¹Ø¿¨Ç°µÄ×ø±ê
function ZQ_RecordPos()
	local nMapId, nX, nY = GetWorldPos();
	gf_SetMyTaskByte(ZQ_BATTLE_TASK10, 1, 2, nX, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetMyTaskByte(ZQ_BATTLE_TASK10, 3, 4, nY, TASK_ACCESS_CODE_ZQBATTLE);
end

--³öÐ¡¹Ø¿¨ÊÇµ÷ÓÃ
function ZQ_OutfromCopy()
	local nX = gf_GetMyTaskByte(ZQ_BATTLE_TASK10, 1, 2);
	local nY = gf_GetMyTaskByte(ZQ_BATTLE_TASK10, 3, 4);
--	if nX == 0 and nY == 0 then
--		local nCamp = ZQ_GetCamp();
--		nX = ZQ_OUTER_EXITPOS[nCamp][1];
--		nY = ZQ_OUTER_EXITPOS[nCamp][2];
--	end
	if nX ~= 0 or nY ~= 0 then
		SetPos(nX, nY);
		gf_SetMyTaskByte(ZQ_BATTLE_TASK10, 1, 2, 0, TASK_ACCESS_CODE_ZQBATTLE);
		gf_SetMyTaskByte(ZQ_BATTLE_TASK10, 3, 4, 0, TASK_ACCESS_CODE_ZQBATTLE);
		gf_SetTaskBit(ZQ_BATTLE_TASK11, 17, 0, TASK_ACCESS_CODE_ZQBATTLE);
		SetFightState(1);
	end
end

--´´½¨µØÍ¼trapµã
function ZQ_CreateTrap()
	local tTraps = {
		{ZQ_MAP_ID, {1574,3787},{1574,3804}, "\\script\\function\\zq_battles\\zq_trap.lua"},
		{ZQ_MAP_ID, {1574,3804},{1588,3804}, "\\script\\function\\zq_battles\\zq_trap.lua"},
		{ZQ_MAP_ID, {1588,3804},{1588,3787}, "\\script\\function\\zq_battles\\zq_trap.lua"},
		{ZQ_MAP_ID, {1588,3787},{1574,3787}, "\\script\\function\\zq_battles\\zq_trap.lua"},
	};
	gf_CreateTraps(tTraps);
	tTraps = {
		{ZQ_MAP_ID, {1900,3280},{1900,3296}, "\\script\\function\\zq_battles\\zq_trap.lua"},
		{ZQ_MAP_ID, {1900,3296},{1910,3296}, "\\script\\function\\zq_battles\\zq_trap.lua"},
		{ZQ_MAP_ID, {1910,3296},{1910,3280}, "\\script\\function\\zq_battles\\zq_trap.lua"},
		{ZQ_MAP_ID, {1910,3280},{1900,3280}, "\\script\\function\\zq_battles\\zq_trap.lua"},
	};
	gf_CreateTraps(tTraps);
end

--npc´´½¨
function ZQ_NpcCreate()
	if IsSubSystemOpen(SYS_SWITCH_ZHENQI_BATTLE) ~= 1 then
		return 0;
	end	
	local nNpcIndex, tNpcPos = {};
	--½ÓÒýÈË
	nNpcIndex = CreateNpc("ZM_jieyingren", "Ch©n Ma TiÕp DÉn Sø", 300, 1796, 3358);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_jieyinren.lua");
	--ËÎ¾üÓªµØ
	nNpcIndex = CreateNpc("ZM_songjiangjun", "Tèng T­íng Qu©n", ZQ_MAP_ID, 1572, 3800);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_jiangjun.lua");
	nNpcIndex = CreateNpc("ZM_chunyangzhenren", "ThuÇn D­¬ng Ch©n Nh©n", ZQ_MAP_ID, 1540, 3772);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\chunyangzhenren.lua");
	nNpcIndex = CreateNpc("ZM_songjunxuguan", "Tèng Qu©n Nhu Quan", ZQ_MAP_ID, 1592, 3827);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\junxuguang.lua");
	nNpcIndex = CreateNpc("ZM_songshangren", "Tèng Th­¬ng Nh©n", ZQ_MAP_ID, 1532, 3756);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_songsale.lua");
	tNpcPos = {
			{1644, 3765},
			{1645, 3762},
			{1646, 3771},
			{1644, 3782},
			{1640, 3784},
			{1640, 3773},
			{1634, 3772},
			{1634, 3781},
		};
	for i = 1, getn(tNpcPos) do
		nNpcIndex = CreateNpc("ZM_songshangbing", "Tèng Th­¬ng Binh", ZQ_MAP_ID, tNpcPos[i][1], tNpcPos[i][2]);
		SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_songshangbing.lua");
	end
	tNpcPos = {
			{1590, 3703},
			{1585, 3706},
			{1574, 3708},
			{1566, 3714},
			{1588, 3722},
			{1562, 3731},
			{1570, 3722},
			{1579, 3717},
			{1594, 3713},
			{1598, 3727},
			{1584, 3730},
			{1576, 3737},
			{1567, 3739},
			{1608, 3731},
			{1598, 3741},
		};
	for i = 1, getn(tNpcPos) do
		nNpcIndex = CreateNpc("ZM_songshibing", "Tèng SÜ Binh", ZQ_MAP_ID, tNpcPos[i][1], tNpcPos[i][2]);
		SetNpcDeathScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\song_shibing_death.lua");
		SetCampToNpc(nNpcIndex, ZQ_tCampString[SONG_ID]);
	end
	nNpcIndex = CreateNpc("ZM_songxunyingguan", "Tèng TuÇn Doanh Quan", ZQ_MAP_ID, 1580, 3793);
	SetCampToNpc(nNpcIndex, ZQ_tCampString[SONG_ID]);
	nNpcIndex = CreateNpc("ZM_songxunyingguan", "Tèng TuÇn Doanh Quan", ZQ_MAP_ID, 1617, 3736);
	SetCampToNpc(nNpcIndex, ZQ_tCampString[SONG_ID]);
	nNpcIndex = CreateNpc("ZM_songjiandie", "Gi¸n §iÖp ¶nh Phong", ZQ_MAP_ID, 1616, 3823);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\jd_yingfeng.lua");
	nNpcIndex = CreateNpc("ZM_songxianfeng", "Tèng tiªn phong", ZQ_MAP_ID, 1622, 3737);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_songxianfeng.lua");
	tNpcPos = {
		{1704, 3753},
		{1599, 3575},
		{1611, 3503},
	}
	for i = 1, getn(tNpcPos) do
		nNpcIndex = CreateNpc("ZM_mohuasongXF", "Ma Hãa Tèng Tiªn Phong", ZQ_MAP_ID, tNpcPos[i][1], tNpcPos[i][2]);
	end	
	--ÁÉ¾üÓªµØ
	nNpcIndex = CreateNpc("ZM_liaojiangjun", "Liªu T­íng Qu©n", ZQ_MAP_ID, 1912, 3282);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_jiangjun.lua");
	nNpcIndex = CreateNpc("ZM_jinlunfawang", "Kim Lu©n Ph¸p V­¬ng", ZQ_MAP_ID, 1885, 3250);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\jinglunfawang.lua");
	nNpcIndex = CreateNpc("ZM_liaojunxuguan", "Liªu Qu©n Nhu Quan", ZQ_MAP_ID, 1961, 3314);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\junxuguang.lua");
	nNpcIndex = CreateNpc("ZM_liaoshangren", "Liªu Th­¬ng Nh©n", ZQ_MAP_ID, 1953, 3306);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_liaosale.lua");
	tNpcPos = {
			{1837, 3295},
			{1842, 3299},
			{1847, 3305},
			{1843, 3291},
			{1847, 3298},
			{1848, 3287},
			{1851, 3293},
			{1853, 3301},
		};
	for i = 1, getn(tNpcPos) do
		nNpcIndex = CreateNpc("ZM_liaoshangbing", "Liªu Th­¬ng Binh", ZQ_MAP_ID, tNpcPos[i][1], tNpcPos[i][2]);
		SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_liaoshangbing.lua");
	end
	tNpcPos = {
			{1902, 3319},
			{1912, 3328},
			{1903, 3332},
			{1895, 3336},
			{1887, 3355},
			{1894, 3349},
			{1901, 3349},
			{1909, 3343},
			{1916, 3345},
			{1923, 3343},
			{1917, 3359},
			{1910, 3360},
			{1907, 3372},
			{1903, 3363},
			{1895, 3360},
		};
	for i = 1, getn(tNpcPos) do
		nNpcIndex = CreateNpc("ZM_liaoshibing", "Liªu SÜ Binh", ZQ_MAP_ID, tNpcPos[i][1], tNpcPos[i][2]);
		SetNpcDeathScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\liao_shibing_death.lua");
		SetCampToNpc(nNpcIndex, ZQ_tCampString[LIAO_ID]);
	end
	nNpcIndex = CreateNpc("ZM_liaoxunyingguan", "Liªu TUÇn Doanh Quan", ZQ_MAP_ID, 1927, 3298);
	SetCampToNpc(nNpcIndex, ZQ_tCampString[LIAO_ID]);
	nNpcIndex = CreateNpc("ZM_liaoxunyingguan", "Liªu TUÇn Doanh Quan", ZQ_MAP_ID, 1920, 3293);
	SetCampToNpc(nNpcIndex, ZQ_tCampString[LIAO_ID]);
	nNpcIndex = CreateNpc("ZM_liaojiandie", "Gi¸n §iÖp Kim §iªu", ZQ_MAP_ID, 1900, 3252);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\jd_jingdiao.lua");
	nNpcIndex = CreateNpc("ZM_liaoxianfeng", "Liªu tiªn phong", ZQ_MAP_ID, 1866, 3331);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_liaoxianfeng.lua");
	tNpcPos = {
		{1753, 3323},
		{1886, 3457},
		{1862, 3563},
	}
	for i = 1, getn(tNpcPos) do
		nNpcIndex = CreateNpc("ZM_mohualiaoXF", "Ma Hãa Liªu Tiªn Phong", ZQ_MAP_ID, tNpcPos[i][1], tNpcPos[i][2]);
	end
	--×ÊÔ´µã
	tNpcPos = {
			{1728, 3462},
			{1755, 3488},
			{1769, 3486},
			{1778, 3522},
			{1797, 3543},
			{1777, 3572},
			{1748, 3593},
			{1729, 3563},
			{1714, 3558},
			{1701, 3573},
			{1685, 3524},
			{1703, 3491},
		};
	for i = 1, getn(tNpcPos) do
		nNpcIndex = CreateNpc("ZM_zijinmu", "Tö Kim Méc", ZQ_MAP_ID, tNpcPos[i][1], tNpcPos[i][2]);
		SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\cai_ji.lua");
	end
	tNpcPos = {
			{1697, 3296},
			{1708, 3316},
			{1693, 3327},
			{1676, 3334},
			{1689, 3353},
			{1682, 3376},
			{1696, 3384},
			{1702, 3412},
			{1687, 3420},
			{1673, 3401},
			{1656, 3393},
			{1650, 3413},
	};
	for i = 1, getn(tNpcPos) do
		nNpcIndex = CreateNpc("ZM_jintiekuang", "Kho¸n tinh thiÕt", ZQ_MAP_ID, tNpcPos[i][1], tNpcPos[i][2]);
		SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\cai_ji.lua");
	end
	tNpcPos = {
			{1852, 3583},
			{1867, 3594},
			{1881, 3610},
			{1866, 3625},
			{1846, 3651},
			{1832, 3665},
			{1820, 3677},
			{1815, 3652},
			{1801, 3633},
			{1861, 3622},
			{1831, 3613},
			{1841, 3602},
	};
	for i = 1, getn(tNpcPos) do
		nNpcIndex = CreateNpc("ZM_qixinghua", "ThÊt tinh hoa", ZQ_MAP_ID, tNpcPos[i][1], tNpcPos[i][2]);
		SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\cai_ji.lua");
	end
	--¼ÀÌ³
	tNpcPos = {
		{1843, 3466},
		{1719, 3262},
		{1596, 3513},
		{1804, 3697},
	}
	for i = 1, getn(tNpcPos) do
		nNpcIndex = CreateNpc("Th¸nh Háa §µi", "TÕ §µn", ZQ_MAP_ID, tNpcPos[i][1], tNpcPos[i][2]);
		SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_jitan.lua");
	end
	--ÐÞ¸´·âÓ¡
	ZQ_RepairSeal_NpcCreate();
	--Ð°Áé¶ÄÔ¼
	nNpcIndex = CreateNpc("ZM_shenmenxieling", "Sinh M«n Tµ Linh", ZQ_MAP_ID, 1934, 3685);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\shengmen_xieling.lua");
	--ÖØÆô·âÓ¡
	ZQ_RestartSeal_NpcCreate();
	--±£ÎÀ·âÓ¡
	ZQ_ProtectSeal_NpcCreate();
	--ÉèÖÃtrapµã
	ZQ_CreateTrap();
end

--ÐÞ¸´·âÓ¡NPC´´½¨
function ZQ_RepairSeal_NpcCreate()
	local nNpcIndex = CreateNpc("ZM_jinmenzhenling", "C¶nh M«n TrËn Linh", ZQ_MAP_ID, 1602, 3303);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\jinmen_zhenling.lua");
	for i = 1, getn(ZQ_REPAIRREAL_NPC) do
		nNpcIndex = CreateNpc(ZQ_REPAIRREAL_NPC[i][2], ZQ_REPAIRREAL_NPC[i][1], ZQ_MAP_ID, ZQ_REPAIRREAL_NPC[i][3], ZQ_REPAIRREAL_NPC[i][4]);
		SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_repairreal_npc.lua");
	end
end

--ÖØÆô·âÓ¡
function ZQ_RestartSeal_NpcCreate()
	local npcIndex = CreateNpc("ZM_simenzhenling", "Tö M«n TrËn Linh", ZQ_MAP_ID, 1573, 3520);
	SetNpcScript(npcIndex, "\\script\\function\\zq_battles\\npc\\simen_zhenling.lua");
	for i = 1, getn(ZQ_RESTART_REAL_NPC) do
		npcIndex = CreateNpc(ZQ_RESTART_REAL_NPC[i][2], ZQ_RESTART_REAL_NPC[i][1], ZQ_MAP_ID, ZQ_RESTART_REAL_NPC[i][3], ZQ_RESTART_REAL_NPC[i][4]);
		SetNpcScript(npcIndex, "\\script\\function\\zq_battles\\npc\\zm_restartseal.lua");
	end
	for i = 1, getn(ZQ_RESTART_JIGUAN_NPC) do
		npcIndex = CreateNpc(ZQ_RESTART_JIGUAN_NPC[i][2], ZQ_RESTART_JIGUAN_NPC[i][1]..tostring(i), ZQ_MAP_ID, ZQ_RESTART_JIGUAN_NPC[i][3], ZQ_RESTART_JIGUAN_NPC[i][4]);
	end
end

--±£»¤·âÓ¡
function ZQ_ProtectSeal_NpcCreate()
	local nNpcIndex = CreateNpc("ZM_meimenzhenling", "DiÖt M«n TrËn Linh", ZQ_MAP_ID, 1874, 3491);
	SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\miemen_zhenling.lua");
	for i = 1, getn(ZQ_MMZL_NPC_TABLE) do
		nNpcIndex = CreateNpc(ZQ_MMZL_NPC_TABLE[i][2], ZQ_MMZL_NPC_TABLE[i][1], ZQ_MAP_ID, ZQ_MMZL_NPC_TABLE[i][3], ZQ_MMZL_NPC_TABLE[i][4]);
	end
end

function ZQ_CreateChannel()
	for nChannel, _ in pairs(ZQ_BATTLE_CHANNEL) do
		CreateChannel(ZQ_BATTLE_CHANNEL[nChannel][1], ZQ_BATTLE_CHANNEL[nChannel][2]);
	end
end

function ZQ_SetPlayerState()
	LeaveTeam();
	SetCreateTeam(1);
	local nCamp = ZQ_GetCamp();
	if nCamp ~= SONG_ID and nCamp ~= LIAO_ID then
		return 0;
	end
	ZQ_SetCamp(nCamp);
	SetCampToPlayer(ZQ_tCampString[nCamp]);
	if nCamp == SONG_ID then
		SetPKFlag(1, 0);
	elseif nCamp == LIAO_ID then
		SetPKFlag(1, 1);
	end
	--SetFightState(1);
	SetDeathPunish(0);
	ForbidChangePK(1);
	InteractiveEnable(0);
	UseScrollEnable(0);
	KillFollower();
	SetDeathScript(ZQ_PLAYER_DEATH_SCRIPT);
	EnterChannel(ZQ_BATTLE_CHANNEL[ALL_ID][1]);
	EnterChannel(ZQ_BATTLE_CHANNEL[nCamp][1]);
	--¸øµÇ³ö´¥·¢Æ÷
	if GetTrigger(3009*2) == 0 then
		CreateTrigger(3, 3009, 3009*2);
	end
	SetTempRevPos(ZQ_MAP_ID, ZQ_OUTER_EXITPOS[nCamp][1]*32, ZQ_OUTER_EXITPOS[nCamp][2]*32);
	gf_SetMyTaskByte(ZQ_BATTLE_TASK10, 1, 2, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetMyTaskByte(ZQ_BATTLE_TASK10, 3, 4, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetTaskBit(ZQ_BATTLE_TASK11, 17, 0, TASK_ACCESS_CODE_ZQBATTLE);
	ZQ_RepairReal_Clean();
	ZQ_ReStartSeal_Clean();
	ZQ_ProtectSeal_Clean();
	ZQ_EvilBet_Clean();
	ZQ_Trigger_Clean();
	FloatMsg2Player();
end

function ZQ_ResetPlayerState()
	SetCreateTeam(0);
	SetCampToPlayer("");
	SetFightState(0);
	SetDeathPunish(1);
	ForbidChangePK(0);
	SetDeathScript("");
	SetPKFlag(0, 0);
	InteractiveEnable(1);
	UseScrollEnable(1);
	KillFollower();
	LeaveChannel(ZQ_BATTLE_CHANNEL[ALL_ID][1]);
	LeaveChannel(ZQ_BATTLE_CHANNEL[SONG_ID][1]);
	LeaveChannel(ZQ_BATTLE_CHANNEL[LIAO_ID][1]);
	--ÒÆ³ýµÇ³ö´¥·¢Æ÷
	if GetTrigger(3009*2) ~= 0 then
		RemoveTrigger(GetTrigger(3009*2));
	end
	SetTempRevPos(0,0,0);
	RemvoeTempEffect();
	gf_SetMyTaskByte(ZQ_BATTLE_TASK10, 1, 2, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetMyTaskByte(ZQ_BATTLE_TASK10, 3, 4, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetTaskBit(ZQ_BATTLE_TASK11, 17, 0, TASK_ACCESS_CODE_ZQBATTLE);
	ZQ_RepairReal_Clean();
	ZQ_ReStartSeal_Clean();
	ZQ_ProtectSeal_Clean();
	ZQ_EvilBet_Clean();
	ZQ_Trigger_Clean();
	FloatMsg2Player();
	local nCamp = ZQ_GetCamp();
	DelItem(ZQ_ITEM_FLAG[nCamp][1], ZQ_ITEM_FLAG[nCamp][2], ZQ_ITEM_FLAG[nCamp][3], 1);
end

--Éú³É»ò·µ»Ø¿ª·ÅµÄÈÎÎñSubIndex
function ZQ_GetTaskIndexTable(tTaskCnf, nMax)
	if not tTaskCnf then return nil; end
	local nSize = getn(tTaskCnf);
	if nSize < nMax then return nil; end
	local tRezult = {};
	for i = 1, nSize do
		local nCeil = tTaskCnf[i];
		if not nCeil or getn(nCeil) ~= ZQ_TASK_TOTAL then return nil; end
		if gf_GetTaskBit(nCeil[2], nCeil[3]) == 1 then
			tinsert(tRezult, i);
		end
	end
	local nRezultSize = getn(tRezult);
	if nRezultSize == 0 then
		local nRand = random(nSize);
		for i = 1, nMax do
			tinsert(tRezult, nRand);
			gf_SetTaskBit(tTaskCnf[nRand][2], tTaskCnf[nRand][3], 1, TASK_ACCESS_CODE_ZQBATTLE);
			nRand = nRand + 2;
			if nRand > nSize then
				nRand = mod(nRand, nSize);
			end
		end
	else
		if nMax ~= nRezultSize then
			print("UERROR:\\script\\function\\zq_battles\\zq_head.lua ZQ_GetTaskIndexTable");
			return nil;
		end
	end
	return tRezult;
end

--nIndex Ö¸¶¨ÄÇ¸öNPCµÄ±í£¬
--nMax ×î´óÄÜ¸øµÄÈÎÎñÊý
function ZQ_TaskDialog(nIndex, nMax)
	local tTaskCnf = ZQ_TASK_LIST[nIndex];
	if not tTaskCnf then return nil; end
	local tDialog = {};
	local tIndex = ZQ_GetTaskIndexTable(tTaskCnf, nMax);
	if not tIndex then
		print("UERROR:\\script\\function\\zq_battles\\zq_head.lua ZQ_TaskDialog tIndex is nil");
		return tDialog;
	end
	for i = 1, getn(tIndex) do
		if tIndex[i] < 0 or tIndex[i] > getn(tTaskCnf) then
			return nil
		end
		local strTemp = format("\n%s(%s)/#ZQ_AcceptOrFinish_Task(%d, %d)", tTaskCnf[tIndex[i]][getn(tTaskCnf[tIndex[i]])], ZQ_Return_String(nIndex, tIndex[i]), nIndex, tIndex[i]);
		tinsert(tDialog, strTemp);
	end
	return tDialog;
end

--½ÓÈ¡»òÍê³ÉÊµÏÖ
function ZQ_AcceptOrFinish_Task(nIndex, nSubIndex)
	local tTaskCnf = ZQ_TASK_LIST[nIndex];
	if not tTaskCnf then return 0;  end
	local tTaskSubCnf = tTaskCnf[nSubIndex];
	if not tTaskSubCnf or getn(tTaskSubCnf) ~= ZQ_TASK_TOTAL then return 0; end
	--ÊÇ·ñ½Ó¹ý
	local nIsAccept = gf_GetTaskBit(tTaskSubCnf[2], tTaskSubCnf[4]);
	if nIsAccept ~= 1 then
		if 1 == DirectGetGTask(tTaskSubCnf[1], 2) then
			gf_SetTaskBit(tTaskSubCnf[2], tTaskSubCnf[4], 1, TASK_ACCESS_CODE_ZQBATTLE);
			Msg2Player(format("C¸c h¹ ®· nhËn nhiÖm vô [%s]", tTaskSubCnf[5]));
		end
	else
		local nRet = DirectFinishGTask(tTaskSubCnf[1], 2);
		if nRet == 2 then
			Msg2Player("NhiÖm vô vÉn ch­a hoµn thµnh!");
			--¿ÉÒÔÌø¹ý
			if tGtTask:IsCanJump(tTaskSubCnf[1]) == 1 then
				Say(format("<color=green>%s:<color>C¸c h¹ x¸c ®Þnh dïng <color=red>%d<color> vµng ®Ó hç trî hoµn thµnh nhiÖm vô?", GetNpcName(GetTargetNpc()), tGtTask:GetJumpTaskCost(tTaskSubCnf[1])/10000), 2, "\nXin gióp m×nh hoµn thµnh/#JumpGTask("..tTaskSubCnf[1]..","..(1)..")", "\nTa muèn tù tay lµm/nothing");
			end
		elseif nRet == -3 then
			Msg2Player("C¸c h¹ ®· hoµn thµnh nhiÖm vô nµy råi!");
		end
	end
end

--ÈÎÎñ×´Ì¬
function ZQ_Return_String(nIndex, nSubIndex)
	local tTaskCnf = ZQ_TASK_LIST[nIndex];
	if not tTaskCnf then return 0;  end
	local tTaskSubCnf = tTaskCnf[nSubIndex];
	if not tTaskSubCnf or getn(tTaskSubCnf) ~= ZQ_TASK_TOTAL then return 0; end
	local tString = {"Ch­a nhËn","Ch­a hoµn thµnh","Cã thÓ giao","Ngµy mai h·y ®Õn", "Cã thÓ bá qua"};
	if gf_GetTaskBit(tTaskSubCnf[2], tTaskSubCnf[4]) ~= 1 then
		return tString[1];
	else
		if tGtTask:check_cur_task(tTaskSubCnf[1]) == 0 then
			return tString[4];
		else
			if DirectIsTaskFinish(tTaskSubCnf[1]) == 1 then
				return tString[3];
			else
				if tGtTask:CheckJumpTask(tTaskSubCnf[1]) == 1 then
					return tString[2].."/"..tString[5];
				else
					return tString[2];
				end
			end
		end
	end
	return "ERROR";
end

--¸ôÌìÇåÀíÈÎÎñ×´Ì¬
function ZQ_Everyday_ReSet()
	ZQ_Everyday_ReSet_NewTask_Record();
	ZQ_Everyday_ReSet_NewTask();
	ZQ_Everyday_ReSet_JoinTimes();
end

--ÖØÖÃ¼ÀÌ³½øÈëÏÞÖÆ
function ZQ_Everyday_ReSet_JoinTimes()
	gf_SetMyTaskBit(ZQ_BATTLE_TASK6, 10, 15, 0, TASK_ACCESS_CODE_ZQBATTLE);
end

--ÖØÖÃÈÎÎñÏµÍ³Íê³É¼ÆÊý±ê¼Ç£¬ÕâÐ©ÊÇÌØÊâ´¦Àí
function ZQ_Everyday_ReSet_NewTask_Record()
	local tList = {
			{112, ZQ_KILL_PLAYER_SONG},
			{117, ZQ_KILL_PLAYER_LIAO},
			{124, ZQ_CURE_SONG},
			{128, ZQ_CURE_LIAO},
			{129, ZQ_TASK_QXH},
			{130, ZQ_TASK_ZJM},
			{131, ZQ_TASK_JTK},
	}--ÈÎÎñIDÓëÊ¹ÓÃµÄÈÎÎñ±äÁ¿¶ÔÓ¦
	for i = 1, getn(tList) do
		if tGtTask:check_cur_task(tList[i][1]) ~= 1 then
				SetTask(tList[i][2], 0);
		end
	end 
end

--ÖØÖÃÈÎÎñÏµÍ³µÄ±ê¼Ç
function ZQ_Everyday_ReSet_NewTask()
	local nAllSize = getn(ZQ_TASK_LIST);
	for i = 1, nAllSize do
		local tSubTaskList = ZQ_TASK_LIST[i];
		if 1 == ZQ_GetTaskStatus(tSubTaskList) then
			for j = 1, getn(tSubTaskList) do
				if tGtTask:check_cur_task(tSubTaskList[j][1]) == 0 then
					gf_SetTaskBit(tSubTaskList[j][2], tSubTaskList[j][3], 0, TASK_ACCESS_CODE_ZQBATTLE);
					gf_SetTaskBit(tSubTaskList[j][2], tSubTaskList[j][4], 0, TASK_ACCESS_CODE_ZQBATTLE);
				end
			end
		else
			for j = 1, getn(tSubTaskList) do
				if tGtTask:check_cur_task(tSubTaskList[j][1]) == 0 then
					gf_SetTaskBit(tSubTaskList[j][2], tSubTaskList[j][4], 0, TASK_ACCESS_CODE_ZQBATTLE);
				end
			end
		end
	end
end

--·µ»Ø~1£ºËµÃ÷²»ÓÃÖØÖÃ3£¬Ã»ÓÐ½ÓÈÎÎñÖØÖÃ4
--·µ»Ø1£ºËµÃ÷È«²¿ÖØÖÃ
function ZQ_GetTaskStatus(tSubTaskList)
	if not tSubTaskList then return -1; end
	for i = 1, getn(tSubTaskList) do 
		if getn(tSubTaskList[i]) ~= ZQ_TASK_TOTAL then
			print("UERROR:ZQ_GetTaskStatus getn(tSubTaskList[i]) ~= 5");
			return -1;
		end
		--½Ó¹ýÈÎÎñ
		--if gf_GetTaskBit(tSubTaskList[i][2], tSubTaskList[i][4]) == 1 then
		--Ã»ÓÐ½»
		if tGtTask:check_cur_task(tSubTaskList[i][1]) == 1 then
			return 0;
		end
		--end
	end
	return 1;
end

--²É¼¯
function ZQ_Gather()
	local npcIndex = GetTargetNpc();
	local npcName = GetNpcName(npcIndex);
	local tListSrc = ZQ_GATHER_LIST;
	if not tListSrc[npcName] then
		return 0;
	end 
	--±³°ü¿Õ¼ä²»×ã
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ".."Kh«ng thÓ thu thËp"..npcName);
		return 0;
	end
	--¶ÔÓ¦µÄÈÎÎñÊÇ·ñ½ÓÈ¡
	if tGtTask:check_cur_task(tListSrc[npcName][2]) == 0 then
		Msg2Player(format("RÊt tiÕc, c¸c h¹ vÉn ch­a nhËn nhiÖm vô thu thËp %s.", npcName));
		return 0;
	end
	--¶ÔÓ¦µÄÈÎÎñÊÇ·ñÒÑÍê³É
	if DirectIsTaskFinish(tListSrc[npcName][2]) == 1 then
		Msg2Player(format("NhiÖm vô thu thËp %s ®· hoµn thµnh kh«ng thÓ tiÕp tôc thu thËp", npcName));
		return 0;
	end
	--²É¼¯´ÎÊýÊÇ·ñÒÑ½üÓÐ200´ÎÁË
	if GetTask(tListSrc[npcName][7]) >= 200 then
		Talk(1,"",format("C¸c h¹ ®· thu thËp %d lÇn råi, kh«ng thÓ tiÕp tôc thu thËp n÷a.", 200));
		return 0;
	end
	--ÎïÆ·µÄÄÍ¾ÃÊÇ¹»×ã¹»
	--local nItemIndex, nWorldItemIndex = GetFirstItem(tListSrc[npcName][5][1], tListSrc[npcName][5][2], tListSrc[npcName][5][3]);
	local nItemIndex = GetItemIndex(tListSrc[npcName][5][1], tListSrc[npcName][5][2], tListSrc[npcName][5][3]);
	if nItemIndex <= 0 then
		Msg2Player(format("Kh«ng thÓ thu thËp %s v× trong hµnh trang ®é bÒn %s kh«ng ®ñ ", npcName, tListSrc[npcName][1]));
		return 0;
	end
	if AbradeItem(tonumber(nItemIndex), 0) < tListSrc[npcName][3] then
		Msg2Player(format("§é bÒn cña %s  kh«ng ®ñ %d, kh«ng thÓ thu thËp. NÕu hµnh trang cßn cã %s kh¸c, h·y hñy bá %s hÕt ®é bÒn.", tListSrc[npcName][1], tListSrc[npcName][3], tListSrc[npcName][1], tListSrc[npcName][1]));
		return 0;
	end
	--ÊÇ·ñÓÐÁË´¥·¢Æ÷
	if GetTrigger(1522 * 2) ~= 0 then
		Msg2Player("Thao t¸c thu thËp lÇn tr­íc vÉn ch­a hoµn thµnh");
		return 0;
	end
	--ÊÇ·ñÒÑÓÐÈËÔÚ²É¼¯
	local nCurLevel = GetUnitCurStates(npcIndex, 0);
	if nCurLevel == 99 then
		Msg2Player(format("%s ®· cã ng­êi ®ang thu thËp, h·y thö l¹i sau gi©y l¸t.", npcName));
		return 0;
	end
	--¸ø¶ÁÌõ----------
	ProgressSlot(ZQ_GATHER_TIME * 18, "ZQ_Gather_ProgressSlot");
	local nTriggerIndex = CreateTrigger(1, 1522, 1522 * 2);
	ContinueTimer(nTriggerIndex);
	--¼ÇÂ¼ItemµÄIndex
	gf_SetMyTaskByte(ZQ_BATTLE_TASK3, 1, 3, tonumber(nItemIndex), TASK_ACCESS_CODE_ZQBATTLE);
	--±íÊ¾npcÔÚ±»²É¼¯
	AddUnitStates(npcIndex, 0, 100);
	local nMapId, nX, nY = GetWorldPos();
	gf_SetMyTaskByte(ZQ_BATTLE_TASK4, 1, 2, nX, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetMyTaskByte(ZQ_BATTLE_TASK4, 3, 4, nY, TASK_ACCESS_CODE_ZQBATTLE);
	--¼ÆÊý³õÊ¼»¯
	gf_SetTaskByte(ZQ_BATTLE_TASK3, 4, 0, TASK_ACCESS_CODE_ZQBATTLE);
	--¼ÇÂ¼npcË÷Òý
	SetTask(ZQ_BATTLE_TASK5, npcIndex, TASK_ACCESS_CODE_ZQBATTLE);
end

function ZQ_Gather_ProgressSlot()
end

function ZQ_Gather_OnTimer()
	--ÅÐ¶ÏÄ¿±êÊÇ·ñÊÇ×ÊÔ´
	local nNpcIndex = GetTask(ZQ_BATTLE_TASK5);
	local npcName = GetNpcName(nNpcIndex);
	if not npcName or npcName == "" then
		ZQ_Gather_Close(nNpcIndex);
		return 0;
	end 
	local tSubSrc = ZQ_GATHER_LIST[npcName];
	if not tSubSrc then
		ZQ_Gather_Close(nNpcIndex);
		return 0;
	end
	local nItemIndex = gf_GetMyTaskByte(ZQ_BATTLE_TASK3, 1, 3);
	if nItemIndex <= 0 then
		ZQ_Gather_Close(nNpcIndex);
		return 0;
	end
	local nMapId, nX, nY = GetWorldPos();
	if nMapId ~= ZQ_MAP_ID then
		ZQ_Gather_Close(nNpcIndex);
		return 0;
	end
	local nSecond = gf_GetTaskByte(ZQ_BATTLE_TASK3, 4);
	if nSecond < ZQ_GATHER_TIME then
		if abs(gf_GetMyTaskByte(ZQ_BATTLE_TASK4, 1, 2) - nX) > 3 or abs(gf_GetMyTaskByte(ZQ_BATTLE_TASK4, 3, 4) - nY) > 3 then
			ZQ_Gather_Close(nNpcIndex);
			Msg2Player(format("Thu thËp %s thÊt b¹i!", npcName));
		end
		gf_SetTaskByte(ZQ_BATTLE_TASK3, 4, nSecond + 1, TASK_ACCESS_CODE_ZQBATTLE);
	else
		ZQ_Gather_Close(nNpcIndex);
		--¿ÛÄÍ¾Ã¸ø½±Àø
		if AbradeItem(nItemIndex, 10) >= 0 then
			SetTask(tSubSrc[7], GetTask(tSubSrc[7]) + 1);
			ModifyExp(60 * GetLevel());
			gf_AddItemEx2(tSubSrc[4], npcName, ZQ_szLogTitle, "Gather", 0, 1);
			--×Ô¶¯½øÐÐÏÂÒ»´Î²É¼¯
			ZQ_Gather();
		end
	end
end
	
	
function ZQ_Gather_Close(nNpcIndex)
	--É¾³ý´¥·¢Æ÷
	RemoveTrigger(GetTrigger(1522 * 2));
	--Í£Ö¹NPC¶¯×÷
	--StopFakeGathering();
	ProgressSlotCancle();
	--Çå³þnpc±»²É¼¯±ê¼Ç
	AddUnitStates(nNpcIndex, 0, -100);
end

function ZQ_OpenTmzPak(nItem, nCost)
	local nItemIndex = tonumber(nItem);
	local nCostIndex = tonumber(nCost);
	local tConstAward = ZQ_TMZ_PAK_AWARD.ConstAward[nCostIndex];
	if not tConstAward then
		return 0;
	end
	local tRandomAward = ZQ_TMZ_PAK_AWARD.RandomAward[nCostIndex];
	if not tRandomAward then
		return 0;
	end
	--Ìõ¼þÅÐ¶Ï
	if nCostIndex ~= 0 and GetItemCount(2, 1, 30230) < nCostIndex then
		Talk(1,"",format("Hµnh trang kh«ng ®ñ %dXU", nCostIndex));
		return 0;
	end
	if GetFreeItemRoom() < 2 then
		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
		return 0;
	end
	--¸ø½±ÀøÁË
	if DelItemByIndex(nItemIndex, 1) == 1 then
		if nCostIndex ~= 0 then
			if DelItem(2, 1, 30230, nCostIndex) == 1 then
			 	--±ØµÃ½±Àø
				for i = 1, getn(tConstAward) do
					gf_EventGiveRandAward(tConstAward, 100, 1, ZQ_szLogTitle, "ZQ_TMZ_PAK_CONSTAWARD", i, 1);
				end
				--Ëæ»ú½±Àø
				gf_EventGiveRandAward(tRandomAward, 100, 1, ZQ_szLogTitle, "ZQ_TMZ_PAK_RANDOMAWARD", 0, 1);
			end
		else
			--±ØµÃ½±Àø
			for i = 1, getn(tConstAward) do
				gf_EventGiveRandAward(tConstAward, 100, 1, ZQ_szLogTitle, "ZQ_TMZ_PAK_CONSTAWARD", i, 1);
			end
			--Ëæ»ú½±Àø
			gf_EventGiveRandAward(tRandomAward, 100, 1, ZQ_szLogTitle, "ZQ_TMZ_PAK_RANDOMAWARD", 0, 1);
		end
		return 1;
	end
end

--ÐÞ¸´ÕóÁé
function ZQ_RepairReal()
	--Ìõ¼þÅÐ¶Ï
	if GetTrigger(1523 * 2) ~= 0 then
		Talk(1,"","Kh«ng thÓ lËp l¹i khëi ®éng tu söa trËn linh");
		return 0;
	end
	if gf_GetTaskBit(ZQ_BATTLE_TASK2, 31) == 0 then
		return 0;
	end
	local nTrigger = CreateTrigger(1, 1523, 1523 * 2);
	--´¥·¢Æ÷¼ÆÊýÉúÐ§
	gf_SetTaskBit(ZQ_BATTLE_TASK1, 31, 1, TASK_ACCESS_CODE_ZQBATTLE);
	--ÉèÖÃµ¹¼ÆÊ±³õÊ¼Öµ
	gf_SetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4, ZQ_SEAL_START_TIME, TASK_ACCESS_CODE_ZQBATTLE);
	--Æô¶¯Ê±¼ä´¥·¢Æ÷
	ContinueTimer(nTrigger);
end

function ZQ_RepairReal_OnTimer()
	local nTimes = gf_GetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4);
	--×î´óÊ±ÏÞµ½ÁË
	if nTimes >= ZQ_REPAIRREAL_TIME_MAX then
		--ÕâÀïÊÇ¸ø±£µ×½±Àø
		if gf_GetMyTaskBit(ZQ_BATTLE_TASK2, 21, 22) == 1 then
			ZQ_RepairReal_Award(getn(ZQ_REPAIRREAL_AWARD));
			gf_GetMyTaskBit(ZQ_BATTLE_TASK2, 21, 22, 0, TASK_ACCESS_CODE_ZQBATTLE);
		end
		ZQ_RepairReal_Clean();
		Talk(1,"ZQ_RepairReal_Fail","Tu söa trËn linh thÊt b¹i!");
		return 0;
	end
	--¼ÆÊýÊ§Ð§
	if gf_GetTaskBit(ZQ_BATTLE_TASK1, 31) == 0 then
		return 0;
	end
	--µ¹¼ÆÊ±
	if nTimes < ZQ_SEAL_START_TIME then
		gf_SetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4, gf_GetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4) + 1, TASK_ACCESS_CODE_ZQBATTLE);
		return 0;
	end
	--Õâ¸öµã¸ø³ö¶Ô»°
	if mod(nTimes, ZQ_SEAL_START_TIME) == 0 then
		Msg2Player("Tu söa phong Ên ®· b¾t ®Çu!");
		--ÉèÖÃÊÇµÚ¼¸´ÎÁË
		if nTimes / ZQ_SEAL_START_TIME > ZQ_REPAIRREAL_COUNT_MAX then
			gf_SetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4, ZQ_REPAIRREAL_TIME_MAX, TASK_ACCESS_CODE_ZQBATTLE);
			return 0;
		end
		--µ±Ç°ÐÞ¸´ÕóÁéµÄ´ÎÊý
		gf_SetMyTaskBit(ZQ_BATTLE_TASK2, 21, 22, nTimes / ZQ_SEAL_START_TIME, TASK_ACCESS_CODE_ZQBATTLE);
		--µã»÷NPC¼ÆÊýÇåÁã
--		gf_SetMyTaskBit(ZQ_BATTLE_TASK2, 23, 24, 0, TASK_ACCESS_CODE_ZQBATTLE);
		--¼ÆÊýÊ§Ð§
		gf_SetTaskBit(ZQ_BATTLE_TASK1, 31, 0, TASK_ACCESS_CODE_ZQBATTLE);
		--µãNPCÊ§Ð§
		gf_SetTaskBit(ZQ_BATTLE_TASK6, 16, 0, TASK_ACCESS_CODE_ZQBATTLE);
		--¹Ø±ÕIBÄ£Ê½
		gf_SetTaskBit(ZQ_BATTLE_TASK6, 9, 0, TASK_ACCESS_CODE_ZQBATTLE);
		--+1
		gf_SetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4, nTimes + 1, TASK_ACCESS_CODE_ZQBATTLE);
		--¸ø³ö¶Ô»°
		ZQ_RepairReal_FindGoalTalk();
		return 0;
	end
	--³¬Ê±
	local nCount = gf_GetMyTaskBit(ZQ_BATTLE_TASK2, 25, 27);
	local nGoalTime = floor(nTimes/ZQ_SEAL_START_TIME) * ZQ_SEAL_START_TIME + ZQ_FIND_GOAL_TIME + ZQ_SEAL_EX_TIME * nCount + 1;
	if nTimes == nGoalTime then
		gf_SetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4, ZQ_REPAIRREAL_TIME_MAX, TASK_ACCESS_CODE_ZQBATTLE);
		Msg2Player("Tu söa c¶nh m«n trËn linh v­ît qu¸ thêi h¹n!");
		return 0;
	end
	--¼ÆÊý
	local nCountTemp = gf_GetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4);
	gf_SetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4, nCountTemp + 1, TASK_ACCESS_CODE_ZQBATTLE);
end

function ZQ_RepairReal_FindGoalTalk()
	if GetTrigger(1523 * 2) == 0 then
		return 0;
	end
	local nTimes = gf_GetMyTaskBit(ZQ_BATTLE_TASK2, 21, 22);
	local tSay = {
		"\nKhëi ®éng trùc tiÕp/#ZQ_RepairReal_StartFindGoal(0)",
		--format("\nÊ¹ÓÃ%d¿ÅÄ§Ê¯ÑÓ³¤%dÃë¿ªÊ¼/#ZQ_RepairReal_StartFindGoal(%d)", nTimes, ZQ_SEAL_EX_TIME, nTimes),	
		"Sö dông Ma Th¹ch kÐo dµi thêi gian/ZQ_RepairReal_ACFN",
		"\nTõ bá/ZQ_RepairReal_GiveUp",
		--"ÎÒÖ»ÊÇ¿´¿´¶øÒÑ/nothing",
	}
	local nSize = getn(ZQ_REPAIRREAL_NPC);
	local tRezult = gf_Random(1, nSize, nTimes);
	if not tRezult or (getn(tRezult) < 1 or getn(tRezult) > 3) then
		print("UDERROR:ZQ_RepairReal_FindGoalTalk tRezult");
		return 0;
	end
	--ÒªµÄË÷Òý´æÆðÀ´
	ZQ_RepairReal_RecordIndex(tRezult);
	--¶Ô»°¸ø³öµÄÄ¿±êNPC
	local strGoal = ""
	for i = 1, getn(tRezult) do
		strGoal = strGoal.."<color=green>"..ZQ_REPAIRREAL_NPC[tRezult[i]][1].."<color>";
		if i ~= getn(tRezult) then
			strGoal = strGoal..",";
		end
	end
	Say(ZQ_JMZL_NPC_NAME..format("§©y lµ lÇn tu söa phong Ên thø <color=green>%d<color>, hiÖn ®ang cÇn %s, c¸c h¹ vÉn cßn %d ®Ó t×m môc tiªu, h·y nhanh chãng hµnh ®éng.", nTimes, strGoal, ZQ_FIND_GOAL_TIME), getn(tSay), tSay);
end

function ZQ_RepairReal_ACFN()
	if GetTrigger(1523 * 2) == 0 then
		return 0;
	end
	local nNum = GetItemCount(2, 1, 30481);
	AskClientForNumber("ZQ_RepairReal_StartFindGoal", min(1, nNum), min(5, nNum), "H·y nhËp sè l­îng","");
end

function ZQ_RepairReal_StartFindGoal(nCount)
	if GetTrigger(1523 * 2) == 0 then
		return 0;
	end
	if tonumber(nCount) == 0 then
		--¹Ø±ÕIBÄ£Ê½
		gf_SetTaskBit(ZQ_BATTLE_TASK6, 9, 0, TASK_ACCESS_CODE_ZQBATTLE);
		--¼ÆÊýÉúÐ§
		gf_SetTaskBit(ZQ_BATTLE_TASK1, 31, 1, TASK_ACCESS_CODE_ZQBATTLE);
		--µãNPCÉúÐ§
		gf_SetTaskBit(ZQ_BATTLE_TASK6, 16, 1, TASK_ACCESS_CODE_ZQBATTLE);
		--ÇåÁãÄ§Ê¯Ê¹ÓÃµÄÊýÄ¿
		gf_SetMyTaskBit(ZQ_BATTLE_TASK2, 25, 27, 0, TASK_ACCESS_CODE_ZQBATTLE);
		Msg2Player(format("B¾t ®Çu ®Õm ng­îc %d gi©y!", ZQ_FIND_GOAL_TIME));
	else
		if DelItem(ZQ_ITEM_IB[1], ZQ_ITEM_IB[2], ZQ_ITEM_IB[3], nCount) ==  1 then
			--¿ªÆôIBÄ£Ê½
			gf_SetTaskBit(ZQ_BATTLE_TASK6, 9, 1, TASK_ACCESS_CODE_ZQBATTLE);
			--¼ÆÊýÉúÐ§
			gf_SetTaskBit(ZQ_BATTLE_TASK1, 31, 1, TASK_ACCESS_CODE_ZQBATTLE);
			--µãNPCÉúÐ§
			gf_SetTaskBit(ZQ_BATTLE_TASK6, 16, 1, TASK_ACCESS_CODE_ZQBATTLE);
			--¼ÇÂ¼Ä§Ê¯Ê¹ÓÃµÄÊýÄ¿
			gf_SetMyTaskBit(ZQ_BATTLE_TASK2, 25, 27, nCount, TASK_ACCESS_CODE_ZQBATTLE);
			Msg2Player(format("B¾t ®Çu ®Õm ng­îc %d gi©y!", ZQ_FIND_GOAL_TIME + ZQ_SEAL_EX_TIME * nCount));
		else
			Talk(1, "ZQ_RepairReal_FindGoalTalk", "Ma Th¹ch trong hµnh trang kh«ng ®ñ!");
		end
	end
end

function ZQ_RepairReal_NpcTalk(nNpcIndex)
	--µã»÷ÊÇ·ñÉúÐ§
	if gf_GetTaskBit(ZQ_BATTLE_TASK6, 16) == 0 then
		return 0;
	end
	--µ±Ç°ÐÞ¸´ÕóÁéµÄ´ÎÊý
	local nTimes = gf_GetMyTaskBit(ZQ_BATTLE_TASK2, 21, 22);
	--µã»÷´ÎÊý³¬¹ýÁË
--	if gf_GetMyTaskBit(ZQ_BATTLE_TASK2, 23, 24) >= nTimes then
--		return 0;
--	end
	--»ñµÃNPCÔÚ±íÀïµÄË÷Òý
	local nTableIndex = ZQ_RepairReal_FindTableIndex(GetNpcName(nNpcIndex));
	--NpcÊÇ±íÀïÃæµÄ
	if nTableIndex > 0 and nTableIndex <= getn(ZQ_REPAIRREAL_NPC) then
--		--µã»÷NPC¼ÆÊý+1
--		gf_SetMyTaskBit(ZQ_BATTLE_TASK2, 23, 24, gf_GetMyTaskBit(ZQ_BATTLE_TASK2, 23, 24) + 1, TASK_ACCESS_CODE_ZQBATTLE);
		--ÊÇ·ñÊÇÆäÖÐµÄÒ»¸öÄ¿±ê
		local bTag = 1;
		local tString = {"ThÊt b¹i", " thµnh c«ng "};
		if nTableIndex == gf_GetMyTaskByte(ZQ_BATTLE_TASK6, 3, 4) then
			gf_SetMyTaskByte(ZQ_BATTLE_TASK6, 3, 4, 0, TASK_ACCESS_CODE_ZQBATTLE);
			bTag = 2;
		end
		if nTableIndex == gf_GetMyTaskByte(ZQ_BATTLE_TASK7, 1, 2) then
			gf_SetMyTaskByte(ZQ_BATTLE_TASK7, 1, 2, 0, TASK_ACCESS_CODE_ZQBATTLE);
			bTag = 2;
		end
		if nTableIndex == gf_GetMyTaskByte(ZQ_BATTLE_TASK7, 3, 4) then
			gf_SetMyTaskByte(ZQ_BATTLE_TASK7, 3, 4, 0, TASK_ACCESS_CODE_ZQBATTLE);
			bTag = 2;
		end
--		Msg2Player(format("µÚ%d´Î²éÕÒ", gf_GetMyTaskBit(ZQ_BATTLE_TASK2, 23, 24))..tString[bTag]);
		Msg2Player("Truy t×m nguyªn liÖu môc tiªu--"..tString[bTag]);
		if bTag == 1 then
			HeadMsg2Player("T×m sai råi");
		elseif bTag == 2 then
			HeadMsg2Player("T×m ®óng råi");
		end
	end
--	--µã»÷µÄÊýÄ¿ÉÏÏÞ
--	if gf_GetMyTaskBit(ZQ_BATTLE_TASK2, 23, 24) == nTimes then
--		--ÒªÕÒµÄ¶¼ÕÒµ½ÁË
--		--IBÄ£Ê½Öª·ñ
--		gf_SetTaskBit(ZQ_BATTLE_TASK6, 9, 0, TASK_ACCESS_CODE_ZQBATTLE);
--		--µãnpcÊ§Ð§
--		gf_SetTaskBit(ZQ_BATTLE_TASK6, 16, 0, TASK_ACCESS_CODE_ZQBATTLE);
--		if ZQ_RepairReal_RezultFind() == 1 then
--			--¸ø½±ÀøÁË
--			ZQ_RepairReal_Award(nTimes);
--			if nTimes < ZQ_REPAIRREAL_COUNT_MAX then
--				--½øÈëÏÂÒ»¸ö½×¶Î
--				SetPos(1605, 3306);
--				CastState("state_fetter", 100, 18*3);
--				CastState("state_dispear",100, 18*3);
--				--NpcCommand(PIdx2NpcIdx(),1)
--				gf_SetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4, ZQ_SEAL_START_TIME * (nTimes + 1), TASK_ACCESS_CODE_ZQBATTLE);
--			else
--				--µ½´ïÉÏÏß´ÎÊýÁË
--				Talk(1,"ZQ_RepairReal_Succ","ÐÞ¸´¾°ÃÅÕóÁé³É¹¦£¡");
--			end
--		--Ê§°ÜÁË
--		else
--			gf_SetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4, ZQ_REPAIRREAL_TIME_MAX, TASK_ACCESS_CODE_ZQBATTLE);
--		end
--		return 0;
--	end
	--È«²¿ÕÒµ½ÁË
	if ZQ_RepairReal_RezultFind() == 1 then
		--IBÄ£Ê½Öª·ñ
		gf_SetTaskBit(ZQ_BATTLE_TASK6, 9, 0, TASK_ACCESS_CODE_ZQBATTLE);
		--µãnpcÊ§Ð§
		gf_SetTaskBit(ZQ_BATTLE_TASK6, 16, 0, TASK_ACCESS_CODE_ZQBATTLE);
		--¸ø½±ÀøÁË
		ZQ_RepairReal_Award(nTimes);
		if nTimes < ZQ_REPAIRREAL_COUNT_MAX then
			--½øÈëÏÂÒ»¸ö½×¶Î
			SetPos(1605, 3306);
			CastState("state_fetter", 100, 18*3);
			CastState("state_dispear",100, 18*3);
			gf_SetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4, ZQ_SEAL_START_TIME * (nTimes + 1), TASK_ACCESS_CODE_ZQBATTLE);
			Msg2Player(format("T×m thµnh c«ng giai ®o¹n thø %d, tiÕn vµo giai ®o¹n kÕ tiÕp.", nTimes + 1));
		else
			--µ½´ïÉÏÏß´ÎÊýÁË
			Talk(1,"ZQ_RepairReal_Succ","Tu söa c¶nh m«n trËn linh thµnh c«ng!");
		end
	end
end

function ZQ_RepairReal_Succ()
	ZQ_RepairReal_Clean();
	ZQ_OutfromCopy();
	ZQ_Trigger_Clean();
	Msg2Player("C¸c h¹ ®· tu söa c¶nh m«n trËn linh thµnh c«ng!");
end

function ZQ_RepairReal_Fail()
	ZQ_RepairReal_Clean();
	ZQ_OutfromCopy();
	ZQ_Trigger_Clean();
end

function ZQ_RepairReal_FindTableIndex(strName)
	for i = 1, getn(ZQ_REPAIRREAL_NPC) do
		if strName == ZQ_REPAIRREAL_NPC[i][1] then
			return i;
		end
	end
	return 0;
end 

function ZQ_RepairReal_RecordIndex(tRezult)
	local nSize = getn(tRezult);
	if nSize == 1 then
		gf_SetMyTaskByte(ZQ_BATTLE_TASK6, 3, 4, tRezult[1], TASK_ACCESS_CODE_ZQBATTLE);
		gf_SetMyTaskByte(ZQ_BATTLE_TASK7, 1, 2, 0, TASK_ACCESS_CODE_ZQBATTLE);
		gf_SetMyTaskByte(ZQ_BATTLE_TASK7, 3, 4, 0, TASK_ACCESS_CODE_ZQBATTLE);
	elseif nSize == 2 then
		gf_SetMyTaskByte(ZQ_BATTLE_TASK6, 3, 4, tRezult[1], TASK_ACCESS_CODE_ZQBATTLE);
		gf_SetMyTaskByte(ZQ_BATTLE_TASK7, 1, 2, tRezult[2], TASK_ACCESS_CODE_ZQBATTLE);
		gf_SetMyTaskByte(ZQ_BATTLE_TASK7, 3, 4, 0, TASK_ACCESS_CODE_ZQBATTLE);		
	elseif nSize == 3 then
		gf_SetMyTaskByte(ZQ_BATTLE_TASK6, 3, 4, tRezult[1], TASK_ACCESS_CODE_ZQBATTLE);
		gf_SetMyTaskByte(ZQ_BATTLE_TASK7, 1, 2, tRezult[2], TASK_ACCESS_CODE_ZQBATTLE);
		gf_SetMyTaskByte(ZQ_BATTLE_TASK7, 3, 4, tRezult[3], TASK_ACCESS_CODE_ZQBATTLE);		
	else
		print("UDERROR:ZQ_RepairReal_RecordIndex");
	end
end

function ZQ_RepairReal_RezultFind()
	if gf_GetMyTaskByte(ZQ_BATTLE_TASK6, 3, 4, TASK_ACCESS_CODE_ZQBATTLE) ~= 0 then
		return 0;
	end
	if gf_GetMyTaskByte(ZQ_BATTLE_TASK7, 1, 2, TASK_ACCESS_CODE_ZQBATTLE) ~= 0 then
		return 0;
	end
	if gf_GetMyTaskByte(ZQ_BATTLE_TASK7, 3, 4, TASK_ACCESS_CODE_ZQBATTLE) ~= 0 then
		return 0;
	end
	return 1;
end

function ZQ_RepairReal_Award(nStep)
	if nStep < 0 or nStep > getn(ZQ_REPAIRREAL_AWARD) then
		return 0;
	end
	--¸øÕæÆø
	AwardGenuineQi(ZQ_REPAIRREAL_AWARD[nStep][1]);
	--¸ø¾­Ñé
	gf_Modify("Exp", ZQ_REPAIRREAL_AWARD[nStep][2]);
	--¸øµÀ¾ß
	gf_AddItemEx2({2, 1, 30497, ZQ_REPAIRREAL_AWARD[nStep][3]}, "Ma Tinh", ZQ_szLogTitle, "Tu söa phong Ên", 0, 1);
	--¸ø¹ý½±ÀøµÄÒ»ÂÉÇå¿Õ
	gf_SetTaskBit(ZQ_BATTLE_TASK2, 31, 0, TASK_ACCESS_CODE_ZQBATTLE);
end

function ZQ_RepairReal_GiveUp()
	ZQ_RepairReal_Clean();
	ZQ_OutfromCopy();
	ZQ_Trigger_Clean();
	Talk(1,"","C¸c h¹ ®· tõ bá tu söa trËn linh!");
end

function ZQ_RepairReal_Clean()
	RemoveTrigger(GetTrigger(1523 * 2));
	gf_SetTaskBit(ZQ_BATTLE_TASK1, 31, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetMyTaskBit(ZQ_BATTLE_TASK2, 21, 22, 0, TASK_ACCESS_CODE_ZQBATTLE);
--	gf_SetMyTaskBit(ZQ_BATTLE_TASK2, 23, 24, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetMyTaskBit(ZQ_BATTLE_TASK2, 25, 27, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetMyTaskByte(ZQ_BATTLE_TASK6, 3, 4, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetMyTaskByte(ZQ_BATTLE_TASK7, 1, 2, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetMyTaskByte(ZQ_BATTLE_TASK7, 3, 4, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetTaskBit(ZQ_BATTLE_TASK6, 16, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetTaskBit(ZQ_BATTLE_TASK6, 9, 0, TASK_ACCESS_CODE_ZQBATTLE);
	FloatMsg2Player();
	--¸ø±£µ×½±Àø
	if gf_GetTaskBit(ZQ_BATTLE_TASK2, 31) == 1 then
		Talk(1, "", "C¸c h¹ ®· tu söa c¶nh m«n trËn linh thÊt b¹i!");
		ZQ_RepairReal_Award(getn(ZQ_REPAIRREAL_AWARD));
	end
end

function ZQ_EvilBet_Talk()
	if ZQ_CopyIsAble(1526) == 0 then
		return 0;
	end
	local strSay = "<color=green>Sinh M«n Tµ Linh: <color>Hehe, ng­êi thanh niªn muèn ph¸t tµi kh«ng? H·y ch¬i trß o¼n tï t× víi ta, nÕu th¾ng ta sÏ nhËn ®­îc phÇn th­ëng hÊp dÉn, ®ång thêi nÕu th¾ng liªn tôc, mçi lÇn ®Òu cã thÓ gÊp ®«i phÇn th­ëng. §õng sî, thua råi còng kh«ng sao, chØ cÇn bá m¹ng l¹i lµ ®­îc råi.";
	local nZhenqi, nExp, nCount = ZQ_EvilBet_CalAward();
	local strExt = "\n<color=green>C¸c h¹ ®· th¾ng lÇn thø %d, phÇn th­ëng céng dån lµ: ch©n khÝ %d, kinh nghiÖm %d, Ma Tinh %d. <color>";
	local nSuccTimes = gf_GetTaskByte(ZQ_BATTLE_TASK8, 1);
	strExt = format(strExt, nSuccTimes, nZhenqi, nExp, nCount);
	--ÒÑ¾­´ïµ½²ÂµÄ×î´ó´ÎÊý
	--Ö±½Ó·¢»úÆ±
	if nSuccTimes == getn(ZQ_EVILBET_AWARD) - 1 then
		Say(format("C¸c h¹ ®· h¹ Sinh M«n Tµ Linh liªn tôc %d lÇn, ®©y lµ phÇn th­ëng dµnh xøng ®¸ng cña ng­¬i", nSuccTimes)..strExt, 1, "NhËn phÇn th­ëng råi ch¹y ngay/ZQ_EvilBet_GiveAward");
		return 0;
	end	
	local tSay = {
		format("Ra Bóa/#ZQ_EvilBet_Jugde(1)"),
		format("Ra KÐo/#ZQ_EvilBet_Jugde(2)"),
		format("Ra Bao/#ZQ_EvilBet_Jugde(3)"),	
	}
	tinsert(tSay, "\nKh«ng ch¬i n÷a, nhËn phÇn th­ëng råi ch¹y th«i/ZQ_EvilBet_GiveAward");
	tinsert(tSay, "T¹i h¹ chØ xem qua th«i/nothing");
	Say(strSay..strExt, getn(tSay), tSay);
end

function ZQ_EvilBet_Jugde(nValue)
	if ZQ_CopyIsAble(1526) == 0 then
		return 0;
	end
	local tListCmp = {
		--{Íæ¼ÒÊä£¬Íæ¼ÒÓ®}
		[1] = {3, 2},
		[2] = {1, 3},
		[3] = {1, 2},
	}
	local nSysValue = mod(random(1, 99), 3) + 1;
	if nSysValue == tonumber(nValue) then
		Talk(1,"ZQ_EvilBet_Talk","C¸c h¹ ®· hßa víi Sinh M«n Tµ Linh!");
	elseif nSysValue == tListCmp[tonumber(nValue)][1] then
			Talk(1,"ZQ_EvilBet_IB","C¸c h¹ ®· <color=red>Thua<color> råi!");
	elseif nSysValue == tListCmp[tonumber(nValue)][2] then 
		if gf_GetTaskByte(ZQ_BATTLE_TASK8, 1) < getn(ZQ_EVILBET_AWARD) - 1 then
			gf_SetTaskByte(ZQ_BATTLE_TASK8, 1, gf_GetTaskByte(ZQ_BATTLE_TASK8, 1) + 1, TASK_ACCESS_CODE_ZQBATTLE);
			Talk(1,"ZQ_EvilBet_Talk","C¸c h¹ ®· <color=green>Th¾ng<color> råi!");
		else
			ZQ_EvilBet_GiveAward();  --ÆäÊµ²»¿ÉÄÜµ½ÕâÀï
		end
	end
end

function ZQ_EvilBet_IB()
	if ZQ_CopyIsAble(1526) == 0 then
		return 0;
	end
	local nStep = 2^gf_GetTaskByte(ZQ_BATTLE_TASK8, 1);
	local nZhenqi, nExp, nCount = ZQ_EvilBet_CalAward();
	local tSay = {
		format("\nTiªu hao %d Ma Th¹ch, chóng ta tiÕp tôc/#ZQ_EvilBet_IB_Ensure(%d)", nStep, nStep),
		"\nTõ bá/ZQ_EvilBet_GiveUp",
	}
	local strExt = "\n<color=green>C¸c h¹ ®· th¾ng lÇn thø %d, phÇn th­ëng céng dån lµ: ch©n khÝ %d, kinh nghiÖm %d, Ma Tinh %d. <color>";
	local nSuccTimes = gf_GetTaskByte(ZQ_BATTLE_TASK8, 1);
	strExt = format(strExt, nSuccTimes, nZhenqi, nExp, nCount);
	Say("<color=green>Sinh M«n Tµ Linh:<color> thÕ th×, h·y ®Ó l¹i m¹ng sèng cña ng­¬i l¹i ®©y! Hahaha###."..strExt, getn(tSay), tSay);
end

function ZQ_EvilBet_IB_Ensure(nStep)
	if ZQ_CopyIsAble(1526) == 0 then
		return 0;
	end
	if DelItem(ZQ_ITEM_IB[1], ZQ_ITEM_IB[2], ZQ_ITEM_IB[3], nStep) == 1 then
		Msg2Player(format("C¸c h¹ ®· tiªu hao %d Ma Th¹ch", nStep));
		ZQ_EvilBet_Talk();
	else
		Talk(1,"ZQ_EvilBet_GiveUp","Ng­¬i c¶ gan d¸m lõa ta, ®i chÕt ®i!");
	end
end

function ZQ_EvilBet_CalAward()
	local nSuccTimes = gf_GetTaskByte(ZQ_BATTLE_TASK8, 1);
	local nZhenqi = 0;
	local nExp = 0;
	local nCount = 0;
--	for i = 1, nSuccTimes do
--		nZhenqi = nZhenqi + ZQ_EVILBET_AWARD[i][1];
--		nExp = nExp + ZQ_EVILBET_AWARD[i][2];
--		nCount = nCount + ZQ_EVILBET_AWARD[i][3];
--	end
	--±£µ×½±Àø
	if nSuccTimes == 0 then
		nZhenqi = ZQ_EVILBET_AWARD[getn(ZQ_EVILBET_AWARD)][1];
		nExp = ZQ_EVILBET_AWARD[getn(ZQ_EVILBET_AWARD)][2];
		nCount = ZQ_EVILBET_AWARD[getn(ZQ_EVILBET_AWARD)][3];
		return nZhenqi, nExp, nCount;
	end
	if nSuccTimes > 0 and nSuccTimes <= getn(ZQ_EVILBET_AWARD) then
		nZhenqi = ZQ_EVILBET_AWARD[nSuccTimes][1];
		nExp = ZQ_EVILBET_AWARD[nSuccTimes][2];
		nCount = ZQ_EVILBET_AWARD[nSuccTimes][3];
	end
	return nZhenqi, nExp, nCount;
end

function ZQ_EvilBet_GiveUp()
	Talk(1,"","Haha, ®©y lµ phÇn th­ëng cña ng­¬i, cÇm cho v÷ng nhÐ. VËy m¹ng cña ng­¬i ta lÊy ®i nhÐ, 1 tay trao tiÒn 1 tay nhËn hµng, xong.");
	--¸ø±£µ×½±Àø
	gf_SetTaskByte(ZQ_BATTLE_TASK8, 1, 0, TASK_ACCESS_CODE_ZQBATTLE);
	ZQ_EvilBet_GiveAward();
	-------------------
	local nLife = GetLife();
	ModifyLife(-nLife);
end

function ZQ_EvilBet_GiveAward()
	if gf_GetTaskBit(ZQ_BATTLE_TASK2, 23) == 0 then
		return 0;
	end
	--ÇåÀí
	gf_SetTaskBit(ZQ_BATTLE_TASK2, 23, 0, TASK_ACCESS_CODE_ZQBATTLE);
	----------------------
	local nZhenqi, nExp, nCount = ZQ_EvilBet_CalAward();
	--¸øÕæÆø
	AwardGenuineQi(tonumber(nZhenqi));
	--¸ø¾­Ñé
	gf_Modify("Exp", tonumber(nExp));
	--¸øµÀ¾ß
	gf_AddItemEx2({2, 1, 30497, tonumber(nCount)}, "Ma Tinh", ZQ_szLogTitle, "Tµ Linh §ç ¦íc", 0, 1);
	--ÍË³ö---------
	Talk(1,"","Khiªu chiÕn Tµ Linh §ç ¦íc kÕ thóc!");
	ZQ_EvilBet_Clean();
	ZQ_OutfromCopy();
	ZQ_Trigger_Clean();
end

function ZQ_EvilBet_Clean()
	--ÕâÖÖÇé¿ö¸ø±£µ×½±Àø
	if gf_GetTaskBit(ZQ_BATTLE_TASK2, 23) == 1 then
		gf_SetTaskByte(ZQ_BATTLE_TASK8, 1, 0, TASK_ACCESS_CODE_ZQBATTLE);
		ZQ_EvilBet_GiveAward();
	end
	gf_SetTaskByte(ZQ_BATTLE_TASK8, 1, 0, TASK_ACCESS_CODE_ZQBATTLE);
	FloatMsg2Player();
end

function ZQ_Leave_Game()
	FloatMsg2Player();
	if ZQ_IsAllowMap() ~= 1 then
		return 0;
	end
	--¸´»îÒ»ÏÂ
	RevivePlayer(1);
	NewWorld(ZQ_EXIT_POS[1], ZQ_EXIT_POS[2], ZQ_EXIT_POS[3]);
	ZQ_ResetPlayerState();
end

function ZQ_ReStartSeal_Talk()
	local nCurrentTimes = gf_GetTaskByte(ZQ_BATTLE_TASK8, 2);
	--ÐÞ¸´ÁËÈý´ÎÁË
	if nCurrentTimes >= ZQ_RESTARTSEAL_COUNT_MAX then
		ZQ_ReStartSeal_Exit(1);
		return 0;
	end
	local nTag = gf_GetTaskBit(ZQ_BATTLE_TASK8, 29);
	local tSay = {
		"Giíi thiÖu phong Ên/ZQ_ReStartSeal_Intro",
		"\nTõ bá/ZQ_ReStartSeal_Exit",
		"T¹i h¹ chØ xem qua th«i/nothing",
	}
	if nTag == 0 then
		tinsert(tSay, 1, "Hç trî khëi ®éng l¹i phong Ên/#ZQ_ReStartSeal_Assist(0)");
		if gf_GetTaskBit(ZQ_BATTLE_TASK8, 31) == 0 then
			tinsert(tSay, 2, "Hç trî khëi ®éng l¹i Phong Ên (cÇn tiªu hao 2 ma th¹ch ®Ó hç trî thªm)/#ZQ_ReStartSeal_Assist(2)");
		end
	end
	local strSay = "Tñ M«n Phong Ên rÊt kh«ng æn ®Þnh, l¹i cã phong Ên x¶y ra sù cè n÷a råi, c¸c h¹ cã thÓ gióp ta khëi ®éng chóng l¹i kh«ng? H·y cÈn thËn nh÷ng c¬ quan bªn trªn phong Ên, chóng kh¸ nguy hiÓm ®Êy.";
	local nTableIndex = gf_GetTaskByte(ZQ_BATTLE_TASK8, 3);
	--µÚÒ»´Î³õÊ¼»¯
	if nCurrentTimes == 0 and nTableIndex == 0 and nTag == 0 then
		nTableIndex = random(1, 3);
		gf_SetTaskByte(ZQ_BATTLE_TASK8, 3, nTableIndex, TASK_ACCESS_CODE_ZQBATTLE);
	end
	--indexºÏ·¨ÐÔ
	if nTableIndex <= 0 or nTableIndex > getn(ZQ_RESTART_REAL_NPC) then
		print("UDERROR:ZQ_ReStartSeal_Talk nTableIndex illegal");
		return 0;
	end
	local strCore = format("\n<color=green>Phong Ên cÇn khëi ®éng lµ [%s]<color>, nhÊn chän dßng chän nhËn ®­îc ®¹o cô khëi ®éng <color=green>‘Tø Linh LÖnh Bµi’<color>", ZQ_RESTART_REAL_NPC[nTableIndex][1]);
	Say(ZQ_SMZL_NPC_NAME..strSay..strCore, getn(tSay), tSay);
end

function ZQ_ReStartSeal_Assist(nValue)
	if gf_GetTaskBit(ZQ_BATTLE_TASK2, 24) == 0 then
		return 0;
	end
	if tonumber(nValue) == 2 then
		if DelItem(ZQ_ITEM_IB[1], ZQ_ITEM_IB[2], ZQ_ITEM_IB[3], tonumber(nValue)) == 1 then
			CastState("state_life_max_percent_add", 1000, 15 * 60 * 18, 1, 20003, 1);
			SyncCustomState(1, 20003, 1, "Phï hé cña Tö M«n TrËn Linh");
			Talk(1, "", "C¸c h¹ nhËn ®­îc<color=yellow>".."Phï hé cña Tö M«n TrËn Linh".."<color>hiÖu qu¶:  \n<color=green>".."§iÓm sinh mÖnh t¨ng gÊp 10 lÇn".."<color>");
			gf_SetTaskBit(ZQ_BATTLE_TASK8, 31, 1, TASK_ACCESS_CODE_ZQBATTLE);
			RestoreAll();		
		else
			Talk(1, "ZQ_ReStartSeal_Talk", "Ma Th¹ch trong hµnh trang kh«ng ®ñ!");
			return 0;
		end
	end
	--¸øµÀ¾ß
	if GetItemCount(ZQ_RESTARTSEAL_ITEM[1], ZQ_RESTARTSEAL_ITEM[2], ZQ_RESTARTSEAL_ITEM[3]) < 1 then
		AddItem(ZQ_RESTARTSEAL_ITEM[1], ZQ_RESTARTSEAL_ITEM[2], ZQ_RESTARTSEAL_ITEM[3], 1);
		gf_SetTaskBit(ZQ_BATTLE_TASK8, 29, 1, TASK_ACCESS_CODE_ZQBATTLE);
	end
end

function ZQ_ReStartSeal_Intro()
	local ZQ_GtSay = {};
	ZQ_GtSay.msg = ZQ_SMZL_NPC_NAME.."Tö M«n cã tæng céng 8 phong Ên (quÎ vÞ cña b¸t qu¸i), ®èi tho¹i víi Tö M«n TrËn Linh, xuÊt hiÖn ngÉu nhiªn 3 Phong Ên Th¸p cÇn kÝch ho¹t , ®ång thêi c¸c h¹ nhËn ®­îc 3 lÖnh bµi. Khi kÝch ho¹t phong Ên sÏ xuÊt hiÖn thanh tiÕn ®é, trong kho¶n thêi gian kÝch ho¹t nh©n vËt rêi khái ph¹m vi phong Ên th× thanh tiÕn ®é sÏ biÕn mÊt, kÝch ho¹t thÊt b¹i. \nL©n cËn mçi phong Ên ®Òu cã c¬ quan c¹m bÉy, khi nh©n vËt ch¹m ph¶i sÏ bÞ tÊn c«ng, bÞ tÊn c«ng tö vong xem nh­ khëi ®éng phong Ên thÊt b¹i. \nNg­êi ch¬i cã thÓ dïng 2 Ma Th¹ch sÏ nhËn ®­îc hiÖu qu¶ t¨ng tr­ëng ®iÓm sinh mÖnh 1000%, sinh mÖnh vµ néi lùc hoµn toµn håi phôc, rêi khái cöa ¶i hoÆc hoµn thµnh kÝch ho¹t sÏ biÕn mÊt.";
	ZQ_GtSay.sel = {
		{"\n Ph¶n håi","ZQ_ReStartSeal_Talk"},
	}
	temp_Talk(ZQ_GtSay);
end

function ZQ_ReStartSeal_Fail()
	--ZQ_OutfromCopy();
	--ZQ_ReStartSeal_Clean();
	--ZQ_Trigger_Clean();
	Talk(1,"","Khëi ®éng phong Ên thÊt b¹i!");
end

function ZQ_ReStartSeal_Exit(bTag)
	if bTag and bTag == 1 then
		Talk(1,"","Khiªu chiÕn thµnh c«ng, c¸c h¹ ®· khëi ®éng thµnh c«ng 3 phong Ên!")
	elseif gf_GetTaskByte(ZQ_BATTLE_TASK8, 2) == 0 and gf_GetTaskBit(ZQ_BATTLE_TASK2, 24) == 1 then
		ZQ_ReStartSeal_Award(getn(ZQ_RESTARTSEAL_AWARD));
		Talk(1,"","Khëi ®éng phong Ên thÊt b¹i, Tö M«n s¾p thÊt thñ råi. §©y lµ phÇn th­ëng cña ng­êi, ®a t¹.")
	elseif gf_GetTaskBit(ZQ_BATTLE_TASK2, 24) == 1 then
		Talk(1,"","C¸c h¹ ®· tõ bá khëi ®éng phong Ên!")
	elseif gf_GetTaskByte(ZQ_BATTLE_TASK8, 2) > 0 and gf_GetTaskBit(ZQ_BATTLE_TASK2, 24) == 0 then
		Talk(1,"","C¸c h¹ ®· tõ bá khëi ®éng phong Ên!")
	end
	ZQ_Trigger_Clean();
	ZQ_ReStartSeal_Clean();
	ZQ_OutfromCopy();
end

function ZQ_ReStartSeal_Award(nIndex)
	if nIndex < 1 or nIndex > getn(ZQ_RESTARTSEAL_AWARD) then
		return 0;
	end
	--¸øÕæÆø
	AwardGenuineQi(ZQ_RESTARTSEAL_AWARD[nIndex][1]);
	--¸ø¾­Ñé
	gf_Modify("Exp", ZQ_RESTARTSEAL_AWARD[nIndex][2]);
	--¸øµÀ¾ß
	gf_AddItemEx2({2, 1, 30497, ZQ_RESTARTSEAL_AWARD[nIndex][3]}, "Ma Tinh", ZQ_szLogTitle, "Khëi ®éng TrËn Linh", 0, 1);
end

function ZQ_ReStartSeal_Clean()
	if GetTrigger(1529 * 2) ~= 0 then
		RemoveTrigger(GetTrigger(1529 * 2));
	end
	gf_SetTaskBit(ZQ_BATTLE_TASK8, 30, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetTaskByte(ZQ_BATTLE_TASK8, 2, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetTaskByte(ZQ_BATTLE_TASK8, 3, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetTaskBit(ZQ_BATTLE_TASK8, 25, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetTaskBit(ZQ_BATTLE_TASK8, 26, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetTaskBit(ZQ_BATTLE_TASK8, 27, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetTaskBit(ZQ_BATTLE_TASK8, 29, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetTaskBit(ZQ_BATTLE_TASK2, 24, 0, TASK_ACCESS_CODE_ZQBATTLE);
	--Çå³ýÄ§·¨ÊôÐÔ
	RemoveState(20003);
	gf_SetTaskBit(ZQ_BATTLE_TASK8, 31, 0, TASK_ACCESS_CODE_ZQBATTLE);
	--É¾³ýµÀ¾ß
	DelItem(ZQ_RESTARTSEAL_ITEM[1], ZQ_RESTARTSEAL_ITEM[2], ZQ_RESTARTSEAL_ITEM[3], GetItemCount(ZQ_RESTARTSEAL_ITEM[1], ZQ_RESTARTSEAL_ITEM[2], ZQ_RESTARTSEAL_ITEM[3]));
	FloatMsg2Player();
	ProgressSlotCancle();
end

function ZQ_ReStartSeal_UseItem(nItem)
	if ZQ_IsAllowMap() ~= 1 then
		return 0;
	end
	if gf_GetTaskBit(ZQ_BATTLE_TASK8, 30) == 1 then
		return 0;
	end
	if not nItem then
		if GetItemCount(2,1,30496) < 1 then
			Talk(1,"","Kh«ng cã Tö Linh LÖnh ®Ó khëi ®éng phong Ên");
			return 0;
		end
	end
	local nTableIndex = gf_GetTaskByte(ZQ_BATTLE_TASK8, 3);
	if nTableIndex <= 0 or nTableIndex > getn(ZQ_RESTART_REAL_NPC) then
		return 0;
	end
	if GetNpcName(GetTargetNpc()) ~= ZQ_RESTART_REAL_NPC[nTableIndex][1] then
		Msg2Player(format("Môc tiªu phong Ên hiÖn t¹i kh«ng chÝnh x¸c! Môc tiªu chÝnh lµ [%s]", ZQ_RESTART_REAL_NPC[nTableIndex][1]));
		return 0;
	end
	local nMapId, nX, nY = GetWorldPos();
	local nXcmp = ZQ_RESTART_REAL_NPC[nTableIndex][3];
	local nYcmp = ZQ_RESTART_REAL_NPC[nTableIndex][4];
	local nDis = (nX - nXcmp)^2 + (nY - nYcmp)^2;
	--³¬¹ýÁË¾àÀë
	if nDis > ZQ_RESTARTSEAL_DIS_MAX then
		Msg2Player("C¸ch môc tiªu phong Ên qu¸ xa, h·y tiÕn l¹i gÇn h¬n!");
		return 0;
	end
	Msg2Player("B¾t ®Çu kÝch ho¹t phong Ên!")
	--´´½¨ÊµÊ±ÅÐ¶Ï´¥·¢Æ÷
	local nTrigger = GetTrigger(1529 * 2);
	if nTrigger ~= 0 then
		RemoveTrigger(nTrigger);
		ProgressSlotCancle();
	end
	nTrigger = CreateTrigger(1, 1529, 1529 * 2);
	if nTrigger ~= 0 then
		--¶ÁÌõÍê³Éºó»Øµ÷OnProgressCallback
		ProgressSlot(ZQ_RESTARTSEAL_PROGRESS_TIME);
		ContinueTimer(nTrigger);
		gf_SetTaskBit(ZQ_BATTLE_TASK8, 30, 1, TASK_ACCESS_CODE_ZQBATTLE);
	end
end

function ZQ_ReStartSeal_OnTimer()
	local nRet = ZQ_ReStartSeal_JugdeDistance();
	if nRet == 0 then
		ProgressSlotCancle();
		RemoveTrigger(GetTrigger(1529 * 2));
		--±êÖ¾»¹Ô­
		gf_SetTaskBit(ZQ_BATTLE_TASK8, 30, 0, TASK_ACCESS_CODE_ZQBATTLE);
		Msg2Player("C¸ch môc tiªu phong Ên qu¸ xa, khëi ®éng thÊt b¹i!")
	end
end

function ZQ_ReStartSeal_JugdeDistance()
	local nTableIndex = gf_GetTaskByte(ZQ_BATTLE_TASK8, 3);
	if nTableIndex <= 0 or nTableIndex > getn(ZQ_RESTART_REAL_NPC) then
		return 0;
	end
	if GetNpcName(GetTargetNpc()) ~= ZQ_RESTART_REAL_NPC[nTableIndex][1] then
		Msg2Player(format("Môc tiªu phong Ên hiÖn t¹i kh«ng chÝnh x¸c! Môc tiªu chÝnh lµ [%s]", ZQ_RESTART_REAL_NPC[nTableIndex][1]));
		return 0;
	end
	local nMapId, nX, nY = GetWorldPos();
	local nXcmp = ZQ_RESTART_REAL_NPC[nTableIndex][3];
	local nYcmp = ZQ_RESTART_REAL_NPC[nTableIndex][4];
	local nDis = (nX - nXcmp)^2 + (nY - nYcmp)^2;
	--³¬¹ýÁË¾àÀë
	if nDis > ZQ_RESTARTSEAL_DIS_MAX then
		return 0;
	else
		return 1;
	end
end

--ÖØÆô·âÓ¡µÄ¶ÁÌõ»Øµ÷º¯Êý
function OnProgressCallback()
	--ÒÆ³ýÕâ¸ö´¥·¢Æ÷
	local nTrigger = GetTrigger(1529 * 2);
	if nTrigger ~= 0 then
		RemoveTrigger(nTrigger);
	end
	--±êÖ¾»¹Ô­
	gf_SetTaskBit(ZQ_BATTLE_TASK8, 30, 0, TASK_ACCESS_CODE_ZQBATTLE);
	if ZQ_IsAllowMap() ~= 1 then
		return 0;
	end
	local nRet = ZQ_ReStartSeal_JugdeDistance();
	if nRet == 0 then
		--Ê§°Ü
		ZQ_ReStartSeal_Fail();
	elseif nRet == 1 then
		--³É¹¦
		ZQ_ReStartSeal_Succ();
	end
end

function ZQ_ReStartSeal_Succ()
	local nCount = gf_GetTaskByte(ZQ_BATTLE_TASK8, 2);
	--¸ø½±ÀøÁË
	ZQ_ReStartSeal_Award(nCount + 1);
	--´ÎÊý+1
	gf_SetTaskByte(ZQ_BATTLE_TASK8, 2, nCount + 1, TASK_ACCESS_CODE_ZQBATTLE);
	--Éú³ÉÐÂµÄÄ¿±ê
	if nCount == 0 then
		gf_SetTaskByte(ZQ_BATTLE_TASK8, 3, random(4,6), TASK_ACCESS_CODE_ZQBATTLE);
	elseif nCount == 1 then
		gf_SetTaskByte(ZQ_BATTLE_TASK8, 3, random(7,8), TASK_ACCESS_CODE_ZQBATTLE);
	else
--		print("nCount =",nCount);
	end
	--Ä§·¨ÊôÐÔ
	RemoveState(20003);
	gf_SetTaskBit(ZQ_BATTLE_TASK8, 31, 0, TASK_ACCESS_CODE_ZQBATTLE);
	--DelItem
	DelItem(ZQ_RESTARTSEAL_ITEM[1], ZQ_RESTARTSEAL_ITEM[2], ZQ_RESTARTSEAL_ITEM[3], GetItemCount(ZQ_RESTARTSEAL_ITEM[1], ZQ_RESTARTSEAL_ITEM[2], ZQ_RESTARTSEAL_ITEM[3]));
	--±ê¼ÇÖÃ0
	gf_SetTaskBit(ZQ_BATTLE_TASK8, 29, 0, TASK_ACCESS_CODE_ZQBATTLE);
	--ÏÂÒ»²½
	Talk(1, "ZQ_ReStartSeal_Talk", format("Khëi ®éng phong Ên lÇn thø %d, <color=green>nhËn ®­îc %d ®iÓm ch©n khÝ, %d ®iÓm kinh nghiÖm, %d Ma Tinh<color>", nCount + 1, ZQ_RESTARTSEAL_AWARD[nCount + 1][1], ZQ_RESTARTSEAL_AWARD[nCount + 1][2], ZQ_RESTARTSEAL_AWARD[nCount + 1][3]));
end

--¼ÇÂ¼NPCµÄË÷Òý
--ZQ_tMapNpcIndex = {};

function ZQ_ProtectSeal_Talk()	
	if gf_GetTaskBit(ZQ_BATTLE_TASK2, 30) == 0 then
		return 0;
	end
	local tSay = {
		"Giíi thiÖu Thñ VÖ Phong Ên/ZQ_ProtectSeal_Intro",
		"\nTiªu diÖt ®Õn ®©y vËy/ZQ_ProtectSeal_Exit",
		"T¹i h¹ chØ xem qua th«i/nothing",
	}
	if GetTrigger(1524 * 2) == 0 and GetTrigger(1293 * 2) == 0 then
		tinsert(tSay, 1, "Hç trî giÕt ®Þch/#ZQ_ProtectSeal_Start(0)");
		tinsert(tSay, 2, "Hç trî tiªu diÖt ®Þch (cÇn tiªu hao 2 ma th¹ch ®Ó hç trî thªm)/#ZQ_ProtectSeal_Start(2)");
	end
	local sString = format("Phong Ên  t¹i DiÖt M«n cã vÎ l¾c l­, Ma khÝ ®· mang ®Õn mét l­îng lín qu¸i vËt, nÕu cø tiÕp tôc nh­ thÕ, phong Ên sÏ bÞ ph¸ vì. Thêi gian kh«ng cßn nhiÒu, c¸c h¹ chØ cã <color=red>%d phót<color> ®Ó thùc hiÖn, tiªu diÖt Ýt nhÊt <color=red>%d tªn<color> qu¸i vËt, tiªu diÖt cµng nhiÒu, phÇn th­ëng cña ta cµng tèt.", ZQ_PROTECTSEAL_TIME_TOTLE/60, ZQ_PROTECTSEAL_KILL_MIN);
	local nCount = gf_GetTaskByte(ZQ_BATTLE_TASK6, 1);
	if nCount > 0 then
	  sString = sString..format("Sè l­îng qu¸i tiªu diÖt hiÖn t¹i: <color=green>%d<color>", nCount);
	end
	Say(ZQ_MMZL_NPC_NAME..sString, getn(tSay), tSay);
end

function ZQ_ProtectSeal_Start(nNum)
	if gf_GetTaskBit(ZQ_BATTLE_TASK2, 30) == 0 then
		return 0;
	end
	--ÖÃÎªÕ½¶·×´Ì¬
	SetFightState(1);
	--ÊÇ·ñ¿ªÆôIBÄ£Ê½
	if nNum and tonumber(nNum) == 2 then
		if DelItem(ZQ_ITEM_IB[1], ZQ_ITEM_IB[2], ZQ_ITEM_IB[3], nNum) ~= 1 then
			Talk(1,"ZQ_ProtectSeal_Talk","Sè l­îng Ma Th¹ch trong hµnh trang kh«ng ®ñ");
			return 0;
		end
		--»Ö¸´ÑªÀ¶
		RestoreAll();
		--¸øÄ§·¨ÊôÐÔ
		CastState("state_p_attack_percent_add", 300, 10 * 60 * 18, 1, 20001, 1);
		CastState("state_m_attack_percent_add", 300, 10 * 60 * 18, 1, 20002, 1);
		SyncCustomState(1, 20001, 1, "Phï hé cña TrËn Linh DiÖt M«n");
		Talk(1, "", "C¸c h¹ nhËn ®­îc<color=yellow>".."Phï hé cña TrËn Linh DiÖt M«n".."<color>hiÖu qu¶:  \n<color=green>".."Néi ngo¹i c«ng t¨ng 3 lÇn".."<color>");
	end
	--¿ªÆô¼ÆÊ±Æ÷
	local nTrigger = CreateTrigger(1, 1524, 1524 * 2);
	if nTrigger == 0 then
		ZQ_ProtectSeal_Exit();
		return 0;
	end
	ContinueTimer(nTrigger);
	--¿ªÆôÉ±¹Ö¼ÆÊýÆ÷
	nTrigger = CreateTrigger(0, 1293, 1293 * 2);
	if nTrigger == 0 then
		ZQ_ProtectSeal_Exit();
		return 0;
	end
	--¸÷ÖÖ¼ÆÊýÇåÀíÒ»ÏÂ
	gf_SetMyTaskByte(ZQ_BATTLE_TASK9, 1, 2, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetTaskByte(ZQ_BATTLE_TASK6, 1, 0, TASK_ACCESS_CODE_ZQBATTLE);
	
	Talk(1,"",format("Khiªu chiÕn b¾t ®Çu! C¸c h¹ chØ cã %d phót ®Ó thùc hiÖn, tiªu diÖt Ýt nhÊt %d qu¸i, míi cã thÓ nhËn ®­îc phÇn th­ëng: qu¸i tiªu diÖt cµng nhiÒu, phÇn th­ëng cµng cao.", 5, 10));
end

function ZQ_ProtectSeal_Intro()
	if gf_GetTaskBit(ZQ_BATTLE_TASK2, 30) == 0 then
		return 0;
	end
	local tSay = {
		"\n Ph¶n håi/ZQ_ProtectSeal_Talk",	
	}
	Say(ZQ_MMZL_NPC_NAME.."Ma khÝ tõ DiÖt M«n mang l¹i rÊt nhiÒu qu¸i vËt, tiªu diÖt nh÷ng qu¸i vËt nµy, Thñ VÖ Phong Ên. \nNg­êi ch¬i cã thÓ dïng 2 Ma Th¹ch ®Ó n©ng cao 300% lùc tÊn c«ng, håi phôc toµn bé sinh lùc néi lùc, BUFF sÏ biÕn mÊt sau khi thêi gian kÕt thóc, nhËn phÇn th­ëng hoÆc khi träng th­¬ng. \n§Æc tÝnh cña qu¸i vËt: <color=red>Néi phßng cao, ngo¹i phßng thÊp, c«ng kÝch ngo¹i c«ng<color>", getn(tSay), tSay);
end

function ZQ_ProtectSeal_Award()
	if gf_GetTaskBit(ZQ_BATTLE_TASK2, 30) == 0 then
		return 0;
	end
	local nCount = gf_GetTaskByte(ZQ_BATTLE_TASK6, 1);
	local nIndex = 1;
	if nCount < ZQ_PROTECTSEAL_KILL_MIN then
		nIndex = getn(ZQ_PROTECTSEAL_AWARD);
	else	
		for i =1, getn(ZQ_PROTECTSEAL_AWARD) - 1 do
			if nCount >= ZQ_PROTECTSEAL_AWARD[i][1] then
				nIndex = i;
			else
				break;
			end
		end
	end
	--¸øÕæÆø
	AwardGenuineQi(ZQ_PROTECTSEAL_AWARD[nIndex][2]);
	--¸ø¾­Ñé
	gf_Modify("Exp", ZQ_PROTECTSEAL_AWARD[nIndex][3]);
	--¸øµÀ¾ß
	gf_AddItemEx2({2, 1, 30497, ZQ_PROTECTSEAL_AWARD[nIndex][4]}, "Ma Tinh", ZQ_szLogTitle, "Thñ VÖ TrËn Linh", 0, 1);
	--²»ÄÜÔÙ¸ø½±ÀøÁË
	gf_SetTaskBit(ZQ_BATTLE_TASK2, 30, 0, TASK_ACCESS_CODE_ZQBATTLE);
end

function ZQ_ProtectSeal_Succ()
	if gf_GetTaskBit(ZQ_BATTLE_TASK2, 30) == 0 then
		return 0;
	end
	local nCount = gf_GetTaskByte(ZQ_BATTLE_TASK6, 1);
	Talk(1,"ZQ_ProtectSeal_Exit",format("Chóc mõng ®· thµnh c«ng tiªu diÖt<color=green>%d<color> tªn", nCount));
end

function ZQ_ProtectSeal_Exit()
	if gf_GetTaskBit(ZQ_BATTLE_TASK2, 30) == 0 then
		return 0;
	end
	ZQ_ProtectSeal_Award();
	ZQ_ProtectSeal_Clean();
	ZQ_OutfromCopy();
	ZQ_Trigger_Clean();
	FloatMsg2Player();
	Talk(1,"","C¸c h¹ ®· rêi khái Thñ VÖ Phong Ên!");
end

function ZQ_ProtectSeal_Fail()
	if gf_GetTaskBit(ZQ_BATTLE_TASK2, 30) == 0 then
		return 0;
	end
	ZQ_ProtectSeal_Award();
	ZQ_ProtectSeal_Clean();
	ZQ_OutfromCopy();
	ZQ_Trigger_Clean();
	FloatMsg2Player();
	Msg2Player("B¶o vÖ phong Ên thÊt b¹i!");
end

function ZQ_ProtectSeal_Clean()
	--Ê±¼ä´¥·¢Æ÷
	if GetTrigger(1524 * 2) ~= 0 then
		RemoveTrigger(GetTrigger(1524 * 2));
	end
	--É±¹Ö´¥·¢Æ÷
	if GetTrigger(1293 * 2) ~= 0 then
		RemoveTrigger(GetTrigger(1293 * 2));
	end		
	--ÇåÀíÄ§·¨ÊôÐÔ
	RemoveState(20001);
	RemoveState(20002);
	gf_SetMyTaskByte(ZQ_BATTLE_TASK9, 1, 2, 0, TASK_ACCESS_CODE_ZQBATTLE);
	gf_SetTaskByte(ZQ_BATTLE_TASK6, 1, 0, TASK_ACCESS_CODE_ZQBATTLE);
	--ÕâÖÖÇé¿ö¸ø±£µ×½±Àø
	if gf_GetTaskBit(ZQ_BATTLE_TASK2, 30) == 1 then
		Talk(1,"ZQ_ProtectSeal_Award","B¶o vÖ trËn linh thÊt b¹i!");
		return 0;
	end
end

function ZQ_ProtectSeal_OnTimer()
	local nTimes = gf_GetMyTaskByte(ZQ_BATTLE_TASK9, 1, 2);
	gf_SetMyTaskByte(ZQ_BATTLE_TASK9, 1, 2, nTimes + 1, TASK_ACCESS_CODE_ZQBATTLE);
	--Íæ¼ÒËÀÍö
	if nTimes == ZQ_PLAYER_DEATH_TAG then
		--É±¹Ö´¥·¢Æ÷
		if GetTrigger(1293 * 2) ~= 0 then
			RemoveTrigger(GetTrigger(1293 * 2));
		end	
		ZQ_ProtectSeal_Fail();
		return 0;
	end
	if mod(nTimes, 60) == 0 then
		Msg2Player(format("Thêi gian cßn l¹i: %ds, sè l­îng tiªu diÖt ®Þch: %d.", ZQ_PROTECTSEAL_TIME_TOTLE - nTimes, gf_GetTaskByte(ZQ_BATTLE_TASK6, 1)));
	end
	--µ½Ê±¼äÁË
	if nTimes >= ZQ_PROTECTSEAL_TIME_TOTLE or nTimes + 1 >= 65535 then
		--Ê±¼ä´¥·¢Æ÷
		if GetTrigger(1524 * 2) ~= 0 then
			RemoveTrigger(GetTrigger(1524 * 2));
		end
		--É±¹Ö´¥·¢Æ÷
		if GetTrigger(1293 * 2) ~= 0 then
			RemoveTrigger(GetTrigger(1293 * 2));
		end	
		--¸ø¶«¶«
		ZQ_ProtectSeal_Succ();
		return 0;
	end
	if nTimes == 0 then 
		SetPos(1905, 3535);
	end
end

function ZQ_ProtectSeal_Killer()
	--Ä¿±êNPCÃû¡°¹ÖÎï¡±	
	local nCount = gf_GetTaskByte(ZQ_BATTLE_TASK6, 1);
	--×î´ó¼ÆÊý
	if nCount >= 255 then
		RemoveTrigger(GetTrigger(1293 * 2));
		return 0;
	end
	gf_SetTaskByte(ZQ_BATTLE_TASK6, 1, nCount + 1, TASK_ACCESS_CODE_ZQBATTLE);
end

function OnTimer1()
	local nCount = gf_GetMyTaskByte(ZQ_BATTLE_TASK11, 1, 2);
	if nCount >= ZQ_COPY_TIME_MAX then
		RemoveTrigger(GetTrigger(1525 * 2));
		if gf_GetMyTaskBit(ZQ_BATTLE_TASK2, 21, 22) < ZQ_REPAIRREAL_COUNT_MAX then	
			Talk(1,"ZQ_RepairReal_Fail","§· hÕt thêi gian cöa ¶i")
		end
		return 0;
	end
	--ÏÔÊ¾ÓÒ±ßÐÅÏ¢
	local nTimes = gf_GetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4);
	local nUseCount = gf_GetMyTaskBit(ZQ_BATTLE_TASK2, 25, 27);
	local nGoalTime = floor(nTimes/ZQ_SEAL_START_TIME) * ZQ_SEAL_START_TIME + ZQ_FIND_GOAL_TIME + ZQ_SEAL_EX_TIME * nUseCount + 1;
	local nCountTemp = gf_GetMyTaskByte(ZQ_BATTLE_TASK9, 3, 4);
	local nSurplusTime = 0;
	if gf_GetTaskBit(ZQ_BATTLE_TASK6, 16) == 1 then
		nSurplusTime = nGoalTime - nTimes;
	end 	
	local nGoalName = "";
	local tTempValue = {
		{ZQ_BATTLE_TASK6, 3, 4},
		{ZQ_BATTLE_TASK7, 1, 2},
		{ZQ_BATTLE_TASK7, 3, 4},
	}
	local nSize = getn(tTempValue);
	local tTempIndex = {};
	for i = 1, nSize do
		local nValue = gf_GetMyTaskByte(tTempValue[i][1], tTempValue[i][2], tTempValue[i][3]);
		if nValue ~= 0 then
			tinsert(tTempIndex, nValue);
		end
	end
	for i = 1, getn(tTempIndex) do
		local nValue = tonumber(tTempIndex[i]);
		nGoalName = nGoalName..ZQ_REPAIRREAL_NPC[nValue][1];
		if i ~= getn(tTempIndex) then
			nGoalName = nGoalName..",";
		end
	end
	FloatMsg2Player(format("Thêi gian v­ît ¶i: %ds\n truy t×m vËt phÈm:%s\n thêi gian cßn l¹i:%ds", ZQ_COPY_TIME_MAX - nCount, nGoalName, nSurplusTime));
	gf_SetMyTaskByte(ZQ_BATTLE_TASK11, 1, 2, nCount + 1, TASK_ACCESS_CODE_ZQBATTLE);
end

function OnTimer2()
	local nCount = gf_GetMyTaskByte(ZQ_BATTLE_TASK11, 1, 2);
	if nCount >= ZQ_COPY_TIME_MAX then
		RemoveTrigger(GetTrigger(1526 * 2));
		if gf_GetTaskByte(ZQ_BATTLE_TASK8, 1) < getn(ZQ_EVILBET_AWARD) - 1 then
			Talk(1,"ZQ_EvilBet_GiveUp","§· hÕt thêi gian cöa ¶i")
		end
		return 0;
	end
	FloatMsg2Player(format("Thêi gian v­ît ¶i: %ds\n sè lÇn tÝch lòy: %d lÇn", ZQ_COPY_TIME_MAX - nCount, gf_GetTaskByte(ZQ_BATTLE_TASK8, 1)));
	gf_SetMyTaskByte(ZQ_BATTLE_TASK11, 1, 2, nCount + 1, TASK_ACCESS_CODE_ZQBATTLE);
end

function OnTimer3()
	local nCount = gf_GetMyTaskByte(ZQ_BATTLE_TASK11, 1, 2);
	if nCount >= ZQ_COPY_TIME_MAX then
		RemoveTrigger(GetTrigger(1527 * 2));
		if gf_GetTaskByte(ZQ_BATTLE_TASK8, 2) < ZQ_RESTARTSEAL_COUNT_MAX then
			Talk(1,"ZQ_ReStartSeal_Exit","§· hÕt thêi gian cöa ¶i")
		end
		return 0;
	end
	local sGoalName = ""
	local nTableIndex = gf_GetTaskByte(ZQ_BATTLE_TASK8, 3);
	if nTableIndex > 0 and nTableIndex <= getn(ZQ_RESTART_REAL_NPC) then
		sGoalName = ZQ_RESTART_REAL_NPC[nTableIndex][1];
	end
	FloatMsg2Player(format("Thêi gian v­ît ¶i: %ds\n môc tiªu khëi ®éng: %s", ZQ_COPY_TIME_MAX - nCount, sGoalName));
	gf_SetMyTaskByte(ZQ_BATTLE_TASK11, 1, 2, nCount + 1, TASK_ACCESS_CODE_ZQBATTLE);
end

function OnTimer4()
	local nCount = gf_GetMyTaskByte(ZQ_BATTLE_TASK11, 1, 2);
	if nCount >= ZQ_COPY_TIME_MAX then
		RemoveTrigger(GetTrigger(1528 * 2));
		Talk(1,"ZQ_ProtectSeal_Fail","§· hÕt thêi gian cöa ¶i")
		return 0;
	end
	FloatMsg2Player(format("Thêi gian v­ît ¶i: %ds\n sè l­îng qu¸i diÖt: %d\n thêi gian cßn l¹i:%ds", ZQ_COPY_TIME_MAX - nCount, gf_GetTaskByte(ZQ_BATTLE_TASK6, 1), ZQ_PROTECTSEAL_TIME_TOTLE - gf_GetMyTaskByte(ZQ_BATTLE_TASK9, 1, 2)));
	gf_SetMyTaskByte(ZQ_BATTLE_TASK11, 1, 2, nCount + 1, TASK_ACCESS_CODE_ZQBATTLE);
end

function ZQ_CreateCopyTrigger(nTriggerID)
	local nTrigger;
	if GetTrigger(nTriggerID * 2) == 0 then
		nTrigger = CreateTrigger(1, nTriggerID, nTriggerID * 2);
	end
	gf_SetMyTaskByte(ZQ_BATTLE_TASK11, 1, 2, 0, TASK_ACCESS_CODE_ZQBATTLE);
	if nTrigger ~= 0 then
		ContinueTimer(nTrigger);
	end
	return nTrigger;
end

function ZQ_GetCopyCount()
	return gf_GetMyTaskByte(ZQ_BATTLE_TASK11, 1, 2);
end

function ZQ_CopyIsAble(nTiggerID)
	if GetTrigger(nTiggerID * 2) == 0 then
		return 0;
	end
	return 1;
end

function ZQ_Trigger_Clean()
	gf_SetMyTaskByte(ZQ_BATTLE_TASK11, 1, 2, 0, TASK_ACCESS_CODE_ZQBATTLE);
	RemoveTrigger(GetTrigger(1525 * 2));
	RemoveTrigger(GetTrigger(1526 * 2));
	RemoveTrigger(GetTrigger(1527 * 2));
	RemoveTrigger(GetTrigger(1528 * 2));
end
