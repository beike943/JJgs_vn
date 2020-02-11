Include("\\settings\\static_script\\kf_newbattles\\emplacementbattle\\mission\\mission_head.lua");
Include("\\settings\\static_script\\kf_newbattles\\emplacementbattle\\position.lua");

BATTLE_TYPE = EMPLACEMENT_ID;	--Õ½³¡ÀàĞÍ

ENTRANCE_POINT = 	--½øÈëµã
{
	[SONG_ID] = {MAPID_SONG,1617,3360},
	[LIAO_ID] = {MAPID_LIAO,1839,3365},
};

EMPLACEMENT_POS = {1725,2904};	--ÅÚÌ¨×ø±ê

tKillPlayerBonus = --É±ËÀ²»Í¬¾üÏÎÍæ¼ÒËù¶ÔÓ¦µÄÊÂ¼şID
{
	[1] = BP_EMPLACEMENT_KILL_SOLDIER,	--É±ËÀÊ¿±ø
	[2] = BP_EMPLACEMENT_KILL_LOOEY,	--É±ËÀĞ£Î¾
	[3] = BP_EMPLACEMENT_KILL_CAPTAIN,	--É±ËÀ¶¼Í³
	[4] = BP_EMPLACEMENT_KILL_PIONEER,	--É±ËÀÏÈ·æ
	[5] = BP_EMPLACEMENT_KILL_GENERAL,	--É±ËÀ´ó½«
	[6] = BP_EMPLACEMENT_KILL_MARSHAL,	--É±ËÀÔªË§
};	

EMPLACEMENT_HURT_RANGE = 40;	--ÅÚÌ¨Õ¨ÌÅÉËº¦·¶Î§
EMPLACEMENT_HURT_PROBABILITY = 5;	--ÅÚÌ¨Õ¨ÌÅ¸ÅÂÊ£¬£µ£¥

DEATH_SCRIPT = "\\settings\\static_script\\kf_newbattles\\emplacementbattle\\playerdeath.lua";

--¸ù¾İNPCµÄÃû×ÖÀ´´´½¨NPC
function Create_Npc(sNpcName,nNum)
	if nNum <= 0 then
		return 0;
	end;
	local tPos = {};
	local npcIndex = 0;
	local sModelName = "";
	if sNpcName == "Thæ d©n" then
		tPos = tNative_Pos;
		sModelName = "Thæ d©n";
	elseif sNpcName == "VÖ binh Ph¸o ®µi" then
		tPos = tGuard_Pos;
		sModelName = "VÖ binh Ph¸o ®µi";
	end;
	local nNpcCount = getn(tPos);
	local nPosIndex = 0;
	for i=1,nNum do
		nPosIndex = mod(i,nNpcCount+1);
		npcIndex = CreateNpc(sModelName,sNpcName,MAPID,tPos[nPosIndex][1],tPos[nPosIndex][2]);
		SetNpcDeathScript(npcIndex,"\\settings\\static_script\\kf_newbattles\\emplacementbattle\\npc_death.lua");
	end;	
end;
--´´½¨ÅÚÌ¨
function Create_Emplacement(nCamp)
	local tbNpcName = 
				{
				[0] = "Ph¸o ®µi",
				[1] = "Ph¸o ®µi: Tèng",
				[2] = "Ph¸o ®µi: Liªu"
				};
	local npcIndex = CreateNpc("Háa ph¸o h­ h¹i",tbNpcName[nCamp],MAPID,EMPLACEMENT_POS[1],EMPLACEMENT_POS[2]);
	SetCampToNpc(npcIndex,tCampNameP[nCamp]);	
	SetNpcDeathScript(npcIndex,"\\settings\\static_script\\kf_newbattles\\emplacementbattle\\emplacement_death.lua");	
	AddUnitStates(npcIndex, 1, 3000000);
	CastState2Npc(npcIndex, "state_ignore_damage_life_max_prob", 100, 360000);
end;

function Create_Box()
	for i=1,getn(tBoxPos) do 
		local nNpcIndex = CreateNpc("B¶o r­¬ng chiÕn tr­êng","B¶o r­¬ng",MAPID,tBoxPos[i][1],tBoxPos[i][2],-1,1,1,100);
		SetNpcDeathScript(nNpcIndex,"\\settings\\static_script\\kf_newbattles\\emplacementbattle\\box_death.lua");
	end;
end;
--ÔÚËæ»úÎ»ÖÃ´´½¨N¸ö±¦Ïä
function Create_Random_Pos_Box(nNum)
	for i=1,nNum do
		local nRanPos = random(1,getn(tBoxPos));
		local nNpcIndex = CreateNpc("B¶o r­¬ng chiÕn tr­êng","B¶o r­¬ng",MAPID,tBoxPos[nRanPos][1],tBoxPos[nRanPos][2],-1,1,1,100);
		SetNpcDeathScript(nNpcIndex,"\\settings\\static_script\\kf_newbattles\\emplacementbattle\\box_death.lua");
	end;
	SetMissionV(MV_KILL_BOX_COUNT,0);
end;
--ÀäÏãÁâ
function Create_LengXiangLing_Boss()
	local npcIdx = GetMissionV(MV_LENGXL_BOSS_NPXIDX);
	if npcIdx > 0 and IsNpcDeath(npcIdx) ~= 1 then
		return 0;
	end 
	local nNpcIndex = CreateNpc("L·nh H­¬ng L¨ng","L·nh H­¬ng L¨ng",MAPID,1719,3225);
	if nNpcIndex > 0 then
		SetNpcDeathScript(nNpcIndex,"\\settings\\static_script\\kf_newbattles\\emplacementbattle\\boss_death.lua");
		SetMissionV(MV_LENGXL_BOSS_NPXIDX, nNpcIndex);
		return 1;
	end
	return 0;
end