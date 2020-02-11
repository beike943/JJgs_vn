--filename:mainbattle_head.lua
--create date:2006-06-23
--describe:Ö÷Õ½³¡Í·ÎÄ¼þ¡£°üº¬ËùÐèÒ»ÇÐÍ·ÎÄ¼þ¡£ÆäËü½Å±¾Ö»Ðè°üº¬Õâ¸öÍ·ÎÄ¼þ¾ÍÐÐÁË
Include("\\script\\newbattles\\mainbattle_primary\\mission\\mission_head.lua");
Include("\\script\\newbattles\\mainbattle_primary\\position.lua");

BATTLE_TYPE = PRIMARY_MAINBATTLE_ID;	--Õ½³¡ÀàÐÍ

ENTRANCE_POINT = 	--½øÈëµã
{
	[SONG_ID] = {MAPID_SONG,1550,3753},
	[LIAO_ID] = {MAPID_LIAO,1939,3743},
};

SOLDIER_COUNT = getn(tSoldierSong);
ARROWBUILDING_COUNT = getn(tArrowBuildingSong);
LOOEY_COUNT = getn(tLooeySong);
CAPTAIN_COUNT = getn(tCaptainSong);
PIONEER_COUNT = getn(tPioneerSong);
GENERAL_COUNT = getn(tGeneralSong);
MARSHAL_COUNT = getn(tMarshalSong);
HEADER_COUNT = getn(tVillagerHeaderPos);
REFUGEE_COUNT =	getn(tVillagerPos); 
EMPLACEMENT_COUNT = getn(tEmplacementPos);
HERO_COUNT = getn(tNonalignedHeroPos);

REFUGEE_COUNT = getn(tSongRefugee);

TYPE_SOLDIER = 1;		--Ê¿±ø
TYPE_ARROWBUILDING = 2;	--¼ýËþ
TYPE_LOOEY = 3;			--¶¼Î¾
TYPE_CAPTAIN = 4;		--¶¼Í³
TYPE_PIONEER = 5;		--ÏÈ·æ
TYPE_GENERAL = 6;		--½«¾ü
TYPE_MARSHAL = 7;		--ÔªË§
TYPE_HEADER = 8;		--ÍÁÃñÊ×Áì
TYPE_REFUGEE = 9;		--ÍÁÃñ
TYPE_EMPLACEMENT = 10;	--ÅÚÌ¨
TYPE_HERO = 11;			--ÆæÈËÒìÊ¿

--×¢Òâ,NPCµÄÃû×Ö²»¿ÉËæÒâ¸ü¸Ä,ÈçÐë¸ü¸Ä,ÇëÏÈ¿´¶®npc_death.lua½Å±¾
--ÌîÐ´¸ñÊ½£º{ËÎ·½Î»ÖÃtable,ÁÉ·½Î»ÖÃtable,{{ËÎ·½NPCÃû×Ö,ËÎ·½Ä£¿éÃû},...},{{ÁÉ·½NPCÃû×Ö,ÁÉ·½Ä£¿éÃû}},...}
tNpcInfo = {									--NPCÃû×Ö¡¡¡¡Ä£°åÃû
	[TYPE_SOLDIER] = {tSoldierSong,tSoldierLiao,{{"Tèng qu©n tinh binh","Tèng tinh binh (Ngäc M«n)"},{"Tèng qu©n c­êng nâ binh","Tèng c­êng nâ binh (Ngäc M«n)"}},{{"Liªu qu©n dòng sÜ","Liªu dòng sü (Ngäc M«n)"},{"Liªu qu©n ng¹nh tiÔn binh","Liªu ng¹nh tiÔn binh (Ngäc M«n)"}}},
	[TYPE_ARROWBUILDING] = {tArrowBuildingSong,tArrowBuildingLiao,{{"TiÔn th¸p-Tèng","TiÔn th¸p"}},{{"TiÔn th¸p-Liªu","TiÔn th¸p"}}},
	[TYPE_LOOEY] = {tLooeySong,tLooeyLiao,{{"Tèng hiÖu óy","Tèng ®« óy (Ngäc M«n)"}},{{"Liªu hiÖu óy","Liªu ®« óy (Ngäc M«n)"}}},
	[TYPE_CAPTAIN] = {tCaptainSong,tCaptainLiao,{{"Tèng §« thèng","Tèng ®« thèng (Ngäc M«n)"}},{{"Liªu §« thèng","Liªu ®« thèng (Ngäc M«n)"}}},
	[TYPE_PIONEER] = {tPioneerSong,tPioneerLiao,{{"Tèng tiªn phong","Tèng tiªn phong (Ngäc M«n)"}},{{"Liªu tiªn phong","Liªu tiªn phong (Ngäc M«n)"}}},
	[TYPE_GENERAL] = {tGeneralSong,tGeneralLiao,{{"T­íng qu©n (Tèng)","Tèng t­íng qu©n (Ngäc M«n)"}},{{"T­íng qu©n (Liªu) ","Liªu t­íng qu©n (Ngäc M«n)"}}},
	[TYPE_MARSHAL] = {tMarshalSong,tMarshalLiao,{{"Tèng nguyªn so¸i","Tèng nguyªn so¸i (Ngäc M«n)"}},{{"Liªu nguyªn so¸i","Liªu nguyªn so¸i (Ngäc M«n)"}}},
	[TYPE_HEADER] = {tVillagerHeaderPos,tVillagerHeaderPos,{{"Thñ lÜnh thæ d©n","Thñ lÜnh thæ d©n (Ngäc M«n)"}},{{"Thñ lÜnh thæ d©n","Thñ lÜnh thæ d©n (Ngäc M«n)"}}},
	[TYPE_REFUGEE] = {tVillagerPos,tVillagerPos,{{"Thæ d©n","Thæ d©n (Ngäc M«n)"},{"Thæ d©n","Thæ d©n cung tiÔn thñ(Ngäc M«n)"}},{{"Thæ d©n","Thæ d©n (Ngäc M«n)"},{"Thæ d©n","Thæ d©n cung tiÔn thñ(Ngäc M«n)"}}},
	[TYPE_EMPLACEMENT] = {tEmplacementPos,tEmplacementPos,{{"Ph¸o ®µi","Háa ph¸o trung qu©n (Ngäc M«n)"}},{{"Ph¸o ®µi","Háa ph¸o trung qu©n (Ngäc M«n)"}}},
	[TYPE_HERO] = {tNonalignedHeroPos,tNonalignedHeroPos,{{"Vâ t­íng trung lËp","Kú nh©n dÞ sÜ"}},{{"Vâ t­íng trung lËp","Kú nh©n dÞ sÜ"}}}
	}

FIGHT_TIMER_ID = 1110;
FIGHT_TRIGGER_ID = 3124;

KILL_VILLAGER_POINT_LIMITED = 100;	--É±ËÀÍÁÃñËù»ñ»ý·ÖÉÏÏÞ
KILL_SOLDIER_POINT_LIMITED = 200;	--É±ËÀÊ¿±øËù»ñ»ý·ÖÉÏÏÞ

OPERATE_TIME = 30;	--µ¥Ìô×î³¤²Ù×÷Ê±¼ä
--É±ËÀÍæ¼ÒºóµÃµ½»ÊµÛ¼ÎÉÍµÄ¸ÅÂÊ£¨ÒÔ¾üÏÎÅÅÐò£©
tKillPlayerEAP = {1,1,2,3,10,30};
--É±ËÀNPCºóµÃµ½»ÊµÛ¼ÎÉÍµÄ¸ÅÂÊ
tKillNpcEAP = {
			[TYPE_SOLDIER] = 1,	--soldier
			[TYPE_ARROWBUILDING] = 10,	--arrowbuilding
			[TYPE_LOOEY] = 1,	--looey
			[TYPE_CAPTAIN] = 2,	--captain
			[TYPE_PIONEER] = 10,	--pioneer
			[TYPE_GENERAL] = 20,	--general
			[TYPE_MARSHAL] = 30,	--marshal
			[TYPE_HEADER] = 2,	--header
			[TYPE_REFUGEE] = 0,	--refugee
			[TYPE_EMPLACEMENT] = 10,	--emplacement
			[TYPE_HERO] = 2,
			}
--É±ËÀÍæ¼ÒºóµÃµ½µÄ¸öÈË»ý·Ö£¨ÒÔ¾üÏÎÅÅÐò£©
tKillPlayerPoint = 
{
	[1] = tBPEven[BP_MAIN_KILL_SOLDIER],	--É±ËÀÊ¿±ø
	[2] = tBPEven[BP_MAIN_KILL_LOOEY],		--É±ËÀÐ£Î¾
	[3] = tBPEven[BP_MAIN_KILL_CAPTAIN],	--É±ËÀ¶¼Í³
	[4] = tBPEven[BP_MAIN_KILL_PIONEER],	--É±ËÀÏÈ·æ
	[5] = tBPEven[BP_MAIN_KILL_GENERAL],	--É±ËÀ´ó½«
	[6] = tBPEven[BP_MAIN_KILL_MARSHAL],	--É±ËÀÔªË§
};
--É±ËÀNPCºóµÃµ½µÄ¸öÈË»ý·Ö
tKillNpcPoint = {
			[TYPE_SOLDIER] = tBPEven[BP_MAIN_KILL_NPC_SOLDIER],	--soldier
			[TYPE_ARROWBUILDING] = 1,	--É±ËÀ¼ýËþ£¬ÌØÊâ´¦Àí
			[TYPE_LOOEY] = tBPEven[BP_MAIN_KILL_NPC_LOOEY],	--looey
			[TYPE_CAPTAIN] = tBPEven[BP_MAIN_KILL_NPC_CAPTAIN],	--captain
			[TYPE_PIONEER] = tBPEven[BP_MAIN_KILL_NPC_PIONEER],	--pioneer
			[TYPE_GENERAL] = tBPEven[BP_MAIN_KILL_NPC_GENERAL],	--general
			[TYPE_MARSHAL] = tBPEven[BP_MAIN_KILL_NPC_MARSHAL],	--marshal
			[TYPE_HEADER] = tBPEven[BP_MAIN_KILL_HEADER],	--ÍÁÃñÊ×Áì
			[TYPE_REFUGEE] = tBPEven[BP_MAIN_KILL_NATIVE],	--ÍÁÃñ
			[TYPE_EMPLACEMENT] = tBPEven[BP_MAIN_KILL_EMPLACEMENT],	--ÅÚÌ¨
			[TYPE_HERO] = tBPEven[BP_MAIN_KILL_HERO],
			}
			
EMPLACEMENT0RANGE = 80;	--Èý¸öÅÚÌ¨µÄ¹¥»÷·¶Î§
EMPLACEMENT1RANGE = 60;
EMPLACEMENT2RANGE = 60;

tRouteHurt = --ÅÚÌ¨ÉËº¦{ÊÜÉË¸ÅÂÊ,ÉËº¦µãÊý}
{
	[0] = {0,0},		--°×Ãû
	[1] = {100,1000},	--ÉÙÁÖ
	[2] = {100,1000},	--Ë×¼Ò
	[3] = {100,600},	--ìøÉ®
	[4] = {100,600},	--ÎäÉ®
	[5] = {100,1000},	--ÌÆÃÅ
	[6] = {30,1000},	--ÌÆÃÅ
	[7] = {100,1000},	--¶ëáÒ
	[8] = {100,600},	--¶ëáÒ·ð¼Ò
	[9] = {100,600},	--¶ëáÒË×¼Ò
	[10] = {100,1000},	--Ø¤°ï
	[11] = {100,1000},	--Ø¤°ï¾»ÒÂ
	[12] = {30,1000},	--Ø¤°ïÎÛÒÂ
	[13] = {100,1000},	--Îäµ±
	[14] = {50,800},	--Îäµ±µÀ¼Ò
	[15] = {30,1000},	--Îäµ±Ë×¼Ò
	[16] = {100,1000},	--ÑîÃÅ
	[17] = {100,1000},	--ÑîÃÅÇ¹Æï
	[18] = {100,1000},	--ÑîÃÅ¹­Æï
	[19] = {100,1000},	--Îå¶¾
	[20] = {30,1000},	--Îå¶¾Ð°ÏÀ
	[21] = {50,800},	--Îå¶¾¹ÆÊ¦
	[22] = {50,800},	--"À¥ÂØ",
	[23] = {50,800},	--"À¥ÂØÌìÊ¦",
	[24] = {50,800},	--"Ã÷½Ì",
	[25] = {50,800},	--"Ã÷½ÌÊ¥Õ½",
	[26] = {50,800},	--"Ã÷½ÌÕó±ø",
	[27] = {50,800},	--"Ã÷½ÌÑªÈË",
	[28] = {50,800},	--"´äÑÌ",
	[29] = {50,800},	--"´äÑÌÎèÏÉ",
	[30] = {50,800},	--"´äÑÌÁéÅ®",
	[31] = {50,800},	--"ÌÆÃÅÈÎÏÀ",
	[32] = {50,800},	--"À¥ÂØ½£×ð",
}

ARROWBUILDING_GROUP_SONG = 23;	--NPCÈÎÎñ×é
ARROWBUILDING_GROUP_LIAO = 24;

DEATH_SCRIPT = "\\script\\newbattles\\mainbattle_primary\\playerdeath.lua";
--==============================================================================
--==============================================================================
--===========================ÒÔÏÂÊÇÖ÷Õ½³¡Ïà¹Øº¯Êý===============================
--==============================================================================
--==============================================================================
--==============================================================================
--´´½¨Õ½¶·NPC
function Create_Fight_NPC(nNpcType,nNum,nCamp)
	if nNum <= 0 then
		return 0;
	end;
	local tNpcPos = {};
	local sName = "";
	local sModelName = "";
	local nNpcIndex = 0;
	local nPosIndex = 0;
	local nRandomNpcType = 0;
	local nCampPlace = nCamp;
	tNpcPos = tNpcInfo[nNpcType][nCampPlace];
	for i=1,nNum do
		nRandomNpcType = random(1,getn(tNpcInfo[nNpcType][nCamp+2]));
		sName = tNpcInfo[nNpcType][nCamp+2][nRandomNpcType][1];
		sModelName = tNpcInfo[nNpcType][nCamp+2][nRandomNpcType][2];
		nPosIndex = mod(i,getn(tNpcPos))+1;
		nNpcIndex = CreateNpc(sModelName,sName,MAPID,tNpcPos[nPosIndex][1],tNpcPos[nPosIndex][2])
		SetCampToNpc(nNpcIndex,tCampNameP[nCamp]);
		SetNpcDeathScript(nNpcIndex,"\\script\\newbattles\\mainbattle_primary\\npc_death.lua");
		if nNpcType == TYPE_MARSHAL then
			SetMissionV(MV_MARSHAL_SONG+nCamp-1,nNpcIndex);
		end;
	end;
	if nNpcType == TYPE_SOLDIER then
		SetMissionV(MV_KILL_SONG_SOLDIER_COUNT+nCamp-1,0);
	end;
end
--´´½¨ÅÚÌ¨¡£µÚÒ»¸ö²ÎÊý±íÊ¾ÅÚÌ¨µÄÎ»ÖÃ£¬¿ªÊ¼µÄÊ±ºòÎ»ÖÃ£±ÊÇËÎµÄ£¬£²ÊÇÁÉµÄ£¬£°ÊÇ¹«¹²µÄ£¬µÚ¶þ¸ö²ÎÊý±íÊ¾ÅÚÌ¨ËùÊôÕóÓª£¬£°Îª¹«¹²£¬£±ÎªËÎ£¬£²ÎªÁÉ
function Create_Emplacement(nPosition,nCamp)
	local nNpcIndex = 0;
	local sNpcName = "";
	if nCamp == ALL_ID then
		sNpcName = "Ph¸o ®µi trung lËp";
	else
		sNpcName = tCampNameZ[nCamp].."_ph¸o ®µi";
	end;
	nNpcIndex = CreateNpc("Háa ph¸o trung qu©n (Ngäc M«n)",sNpcName,MAPID,tEmplacementPos[nPosition][1],tEmplacementPos[nPosition][2]);
	SetCampToNpc(nNpcIndex,tCampNameP[nCamp]);
	if nPosition == 0 and nCamp == SONG_ID then	--ÈôÖÐ¼äµÄÅÚÌ¨±»¶Ô·½Õ¼Áì£¬Íæ¼Ò¿ÉÒÔÖ±½Ó´ÓºóÓª´«ËÍµ½Ç°Óª³öÉúµã
		SetMissionV(MV_FRONT_TRAP_SONG,0);
		SetMissionV(MV_FRONT_TRAP_LIAO,1);
	elseif nPosition == 0 and nCamp == LIAO_ID then
		SetMissionV(MV_FRONT_TRAP_SONG,1);
		SetMissionV(MV_FRONT_TRAP_LIAO,0);
	end;
	SetNpcDeathScript(nNpcIndex,"\\script\\newbattles\\mainbattle_primary\\npc_death.lua");
	SetMissionV(MV_EMPLACEMENT0_POSSESSION+nPosition,nCamp);
end;
--´´½¨ÍÁÃñÊ×Áì£¬ÓÉÓÚ¼ÓÈëÁËÖØÉú»úÖÆ£¬ÕâÀïÔÝÊ±Ö»Ö§³ÖÒ»¸öÊ×Áì
function Create_VillagerHeader(nCamp)
	if GetMissionV(MV_HEADER_DEATH) == 1 then
		for i=1,getn(tVillagerHeaderPos) do 
			local nNpcIndex = CreateNpc("Thñ lÜnh thæ d©n (Ngäc M«n)","Thñ lÜnh thæ d©n",MAPID,tVillagerHeaderPos[i][1],tVillagerHeaderPos[i][2])
			SetNpcDeathScript(nNpcIndex,"\\script\\newbattles\\mainbattle_primary\\npc_death.lua");
			SetCampToNpc(nNpcIndex,tCampNameP[nCamp]);
		end;
		SetMissionV(MV_HEADER_DEATH,0);
	end;
end;
--´´½¨ÍÁÃñ
function Create_Villager(nCamp)
	for i=1,getn(tVillagerPos) do 
		local nNpcIndex = CreateNpc("Thæ d©n (Ngäc M«n)","Thæ d©n",MAPID,tVillagerPos[i][1],tVillagerPos[i][2])
		SetNpcDeathScript(nNpcIndex,"\\script\\newbattles\\mainbattle_primary\\npc_death.lua");
		SetCampToNpc(nNpcIndex,tCampNameP[nCamp]);
	end;
end;
--ÔÚN¸öËæ»úÎ»ÖÃ´´½¨N¸öÍÁÃñ
function Create_Random_Pos_Villager(nCamp,nCount)
	if nCount <= 0 then
		return 0;
	end;
	for i=1,nCount do
		local nRanPos = random(1,getn(tVillagerPos));
		local nNpcIndex = CreateNpc("Thæ d©n (Ngäc M«n)","Thæ d©n",MAPID,tVillagerPos[nRanPos][1],tVillagerPos[nRanPos][2],-1,1,1,100);
		SetNpcDeathScript(nNpcIndex,"\\script\\newbattles\\mainbattle_primary\\npc_death.lua");
		SetCampToNpc(nNpcIndex,tCampNameP[nCamp]);
	end;
	SetMissionV(MV_KILL_VILLAGER_COUNT,0);
end;
--´´½¨ÆæÈËÒìÊ¿£¬ÓÉÓÚ¼ÓÈëÁËÖØÉú»úÖÆ£¬ÕâÀïÔÝÊ±Ö»Ö§³ÖÒ»¸öÆæÈËÒìÊ¿
function Create_Nonaligned_Hero()
	if GetMissionV(MV_HERO_DEATH) == 1 then
		for i=1,getn(tNonalignedHeroPos) do 
			local nNpcIndex = CreateNpc("Vâ t­íng trung lËp (Ngäc M«n)","Kú nh©n dÞ sÜ",MAPID,tNonalignedHeroPos[i][1],tNonalignedHeroPos[i][2])
			SetNpcDeathScript(nNpcIndex,"\\script\\newbattles\\mainbattle_primary\\npc_death.lua");
			SetCampToNpc(nNpcIndex,tCampNameP[ALL_ID]);
		end;
		SetMissionV(MV_HERO_DEATH,0);
	end;
end;
--´´½¨Ëæ»ú±¦Ïä£¬Õ½³¡³õÊ¼»¯Ê±ÓÃ¡£
function Create_Box()
	for i=1,getn(tBoxPos) do 
		local nNpcIndex = CreateNpc("B¶o r­¬ng chiÕn tr­êng","B¶o r­¬ng",MAPID,tBoxPos[i][1],tBoxPos[i][2],-1,1,1,100);
		SetNpcDeathScript(nNpcIndex,"\\script\\newbattles\\mainbattle_primary\\box_death.lua");
	end;
end;
--ÔÚN¸öËæ»úÎ»ÖÃ´´½¨N¸ö±¦Ïä
function Create_Random_Pos_Box(nNum)
	if nNum <= 0 then
		return 0;
	end;
	for i=1,nNum do
		local nRanPos = random(1,getn(tBoxPos));
		local nNpcIndex = CreateNpc("B¶o r­¬ng chiÕn tr­êng","B¶o r­¬ng",MAPID,tBoxPos[nRanPos][1],tBoxPos[nRanPos][2],-1,1,1,100);
		SetNpcDeathScript(nNpcIndex,"\\script\\newbattles\\mainbattle_primary\\box_death.lua");
	end;
	SetMissionV(MV_KILL_BOX_COUNT,0);
end;
--´´½¨ÄÑÃñ
function Create_Refugee(nCamp,nCount)
	if nCount <= 0 then
		return 0;
	end;
	local nRefugeeIndex = 0;
	local tPos = {tSongRefugee,tLiaoRefugee};
	local nCampPlace = nCamp;
	local tRefugeeModel = {"N¹n d©n Tèng","N¹n d©n Liªu"};
	for i=1,nCount do
		local nRandPos = random(1,getn(tPos[nCampPlace]));
		nRefugeeIndex = CreateNpc(tRefugeeModel[nCamp],tCampNameZ[nCamp].." _n¹n d©n",MAPID,tPos[nCampPlace][nRandPos][1],tPos[nCampPlace][nRandPos][2],-1,1,1,20);
		SetNpcScript(nRefugeeIndex,"\\script\\newbattles\\mainbattle_primary\\refugee_talk_npc.lua");
	end;
end;
--´´½¨ÄÑÃñ½ÓÊÕÈË
function Create_Refugee_Receiver(nCamp)
	local nCampPlace = nCamp;
	local nNpcIndex = CreateNpc("L·o n«ng d©n",tCampNameZ[nCamp].."_thñ vÖ",MAPID,tRefugeeReceiver[nCampPlace][1],tRefugeeReceiver[nCampPlace][2]);
	SetNpcScript(nNpcIndex,"\\script\\newbattles\\mainbattle_primary\\refugee_receive_npc.lua")
end;
--´´½¨¹ÍÓ¶±øÍÅÍÅ³¤
function Create_Assistant_Hirer(nCamp)
	local nCampPlace = nCamp;
	local nNpcIndex = CreateNpc("Thiªn V­¬ng Bang Chñ",tCampNameZ[nCamp].."_®éi tr­ëng ®¸nh thuª ",MAPID,tAssistantHirer[nCampPlace][1],tAssistantHirer[nCampPlace][2]);
	SetNpcScript(nNpcIndex,"\\script\\newbattles\\mainbattle_primary\\assistant_hirer_npc.lua")
end;
--´´½¨Ð¡Â·ÉÏµÄÁ©¼ýËþ
function Create_ArrowBuilding()
	for i=1,ARROWBUILDING_COUNT do
		local nNpcIndex = CreateNpc("TiÔn th¸p-Tèng","TiÔn th¸p",MAPID,tArrowBuildingSong[i][1],tArrowBuildingSong[i][2]);
		AddGroupUnit(ARROWBUILDING_GROUP_SONG,nNpcIndex);
	end;
	for i=1,ARROWBUILDING_COUNT do
		local nNpcIndex = CreateNpc("TiÔn th¸p-Liªu","TiÔn th¸p",MAPID,tArrowBuildingLiao[i][1],tArrowBuildingLiao[i][2]);
		AddGroupUnit(ARROWBUILDING_GROUP_LIAO,nNpcIndex);
	end;
end;
--´Ý»ÙÐ¡Â·ÉÏµÄÁ©¼ýËþ
function Destroy_ArrowBuilding(nCamp)
	local nCampPlace = nCamp;
	SetGroupLifeTime(ARROWBUILDING_GROUP_SONG+nCampPlace-1,0);
	ClearGroup(ARROWBUILDING_GROUP_SONG+nCampPlace-1);
end;

--³¢ÊÔÈ¥´´½¨ÏÈ·æ¡¢´ó½«ºÍÔªË§¡£Èç¹û´´½¨ÏÈ·æ³É¹¦Ôò·µ»Ø£±£¬´´½¨´ó½«³É¹¦Ôò·µ»Ø£²£¬´´½¨ÔªË§³É¹¦Ôò·µ»Ø£³
function Try_To_Create_FightNPC(sName,nEnemyCamp)
	local nEnemyNpcType = GetMissionV(MV_NPC_TYPE_SONG+nEnemyCamp-1);
	local nPlayerCamp = 3 - nEnemyCamp;
	BT_ShowDebugInfor("sName:"..sName);

	if sName == "Tiªn phong" then
		if nEnemyNpcType == 0 then	--ÏÈ·æ³öÀ´À²
			Create_Fight_NPC(TYPE_PIONEER,PIONEER_COUNT,nEnemyCamp);
			Msg2MSAll(MISSION_ID,tCampNameZ[nEnemyCamp].."_Tiªn phong xuÊt hiÖn");
			SetMissionV(MV_NPC_TYPE_SONG+nEnemyCamp-1,1);
			Create_Fight_NPC(TYPE_LOOEY,GetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1),nEnemyCamp);
			SetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1,0);	--Ð£Î¾ÖØÉú
			Create_Fight_NPC(TYPE_CAPTAIN,GetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1),nEnemyCamp);
			SetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1,0);	--¶¼Í³ÖØÉú
			return 1;
		end;	
	elseif sName == "T­íng qu©n" then
		if nEnemyNpcType == 1 then	--´ó½«³öÀ´À²
			Create_Fight_NPC(TYPE_GENERAL,GENERAL_COUNT,nEnemyCamp);
			Msg2MSAll(MISSION_ID,tCampNameZ[nEnemyCamp].."_T­íng qu©n xuÊt hiÖn, hiÖn hËu doanh ®èi ph­¬ng kh«ng ai trÊn gi÷, ta cã thÓ tÊn c«ng vµo ®ã!");
			local fTaskTip = function(tArg)
				TaskTip("T­íng qu©n phe ta hiÖn ra trî gióp");
			end;
			BT_OperateAllPlayer(fTaskTip,{},nEnemyCamp);
			SetMissionV(MV_NPC_TYPE_SONG+nEnemyCamp-1,2);
			Create_Fight_NPC(TYPE_LOOEY,GetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1),nEnemyCamp);
			SetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1,0);	--Ð£Î¾ÖØÉú
			Create_Fight_NPC(TYPE_PIONEER,GetMissionV(MV_KILL_SONG_PIONEER_COUNT+nEnemyCamp-1),nEnemyCamp);
			SetMissionV(MV_KILL_SONG_PIONEER_COUNT+nEnemyCamp-1,0);		--ÏÈ·æÖØÉú
			Create_Fight_NPC(TYPE_CAPTAIN,GetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1),nEnemyCamp);
			SetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1,0);	--¶¼Í³ÖØÉú
			Destroy_ArrowBuilding(nEnemyCamp);	--Çå³ý¼ýËþ
			return 2;
		end;		
	elseif sName == "Nguyªn So¸i" then
		if nEnemyNpcType == 2  then	--ÔªË§³öÀ´À²
			Create_Fight_NPC(TYPE_MARSHAL,MARSHAL_COUNT,nEnemyCamp);
			Msg2MSAll(MISSION_ID,"Sau cuéc chiÕn ®Êu khèc liÖt,"..tCampNameZ[nPlayerCamp].."_®· bøc "..tCampNameZ[nEnemyCamp].."_Nguyªn So¸i xuÊt hiÖn!");
			local fTaskTip = function(tArg)
				TaskTip("Nguyªn so¸i phe ta hiÖn ra trî gióp");
			end;
			BT_OperateAllPlayer(fTaskTip,{},nEnemyCamp);
			SetMissionV(MV_NPC_TYPE_SONG+nEnemyCamp-1,3);
			Create_Fight_NPC(TYPE_PIONEER,GetMissionV(MV_KILL_SONG_PIONEER_COUNT+nEnemyCamp-1),nEnemyCamp);
			SetMissionV(MV_KILL_SONG_PIONEER_COUNT+nEnemyCamp-1,0);		--ÏÈ·æÖØÉú
			Create_Fight_NPC(TYPE_GENERAL,GetMissionV(MV_KILL_SONG_GENERAL_COUNT+nEnemyCamp-1),nEnemyCamp);
			SetMissionV(MV_KILL_SONG_GENERAL_COUNT+nEnemyCamp-1,0);	--½«¾üÖØÉú
			Create_Fight_NPC(TYPE_CAPTAIN,GetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1),nEnemyCamp);
			SetMissionV(MV_KILL_SONG_CAPTAIN_COUNT+nEnemyCamp-1,0);	--¶¼Í³ÖØÉú
			Create_Fight_NPC(TYPE_LOOEY,GetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1),nEnemyCamp);
			SetMissionV(MV_KILL_SONG_LOOEY_COUNT+nEnemyCamp-1,0);	--Ð£Î¾ÖØÉú
			return 3;
		end;
	end;
	return 0;
end;
--¸ù¾Ý¹«¹²»ý·ÖÀ´ÅÐ¶ÏÊÇ·ñ´´½¨Ä³¸öNPC£»Õâ¸öº¯ÊýÊÇÓÉÍæ¼ÒÀ´´¥·¢µÄ
function Judge_State_By_Point(nCamp)
	local nPlayerCamp = nCamp;
	local nEnemyCamp = 3 - nPlayerCamp;
	local nMissionPoint = BT_GetMissionPoint(nPlayerCamp);
	local nEnemyCount = GetMSPlayerCount(MISSION_ID,nEnemyCamp);
	local nEnemyNpcType = GetMissionV(MV_NPC_TYPE_SONG+nEnemyCamp-1);
	BT_ShowDebugInfor("nEnemyNpcType:"..nEnemyNpcType)
	BT_ShowDebugInfor("nMissionPoint:"..nMissionPoint)
	BT_ShowDebugInfor("nEnemyCount:"..nEnemyCount)
	if nEnemyNpcType == 0 and nMissionPoint >= nEnemyCount*100 then
		BT_ShowDebugInfor("LËp tiªn phong");
		Msg2MSAll(MISSION_ID,tCampNameZ[nPlayerCamp].."_tÝch lòy c«ng céng v­ît "..(nEnemyCount*100)..", ®· bøc "..tCampNameZ[nEnemyCamp].."_Tiªn phong xuÊt hiÖn");
		Try_To_Create_FightNPC("Tiªn phong",nEnemyCamp);		--µÐ·½¹«¹²»ý·Ö³¬¹ýÒ»¶¨ÊýÖµ£º±¾·½×ÜÈËÊý*100£¬¶Ô·½ÏÈ·æ³ö
	elseif nEnemyNpcType == 1 and nMissionPoint >= nEnemyCount*200 then
		BT_ShowDebugInfor("LËp t­íng qu©n");
		Msg2MSAll(MISSION_ID,tCampNameZ[nPlayerCamp].."_tÝch lòy c«ng céng v­ît "..(nEnemyCount*200)..", ®· bøc "..tCampNameZ[nEnemyCamp].."_§¹i t­íng xuÊt hiÖn");
		Try_To_Create_FightNPC("T­íng qu©n",nEnemyCamp);	--µÐ·½¹«¹²»ý·Ö³¬¹ýÒ»¶¨ÊýÖµ£º±¾·½×ÜÈËÊý*200£¬¶Ô·½´ó½«³ö
	elseif nEnemyNpcType == 2 and nMissionPoint >= nEnemyCount*400 then
		BT_ShowDebugInfor("LËp nguyªn so¸i");
		Msg2MSAll(MISSION_ID,tCampNameZ[nPlayerCamp].."_tÝch lòy c«ng céng v­ît "..(nEnemyCount*400)..", ®· bøc "..tCampNameZ[nEnemyCamp].."_Nguyªn So¸i xuÊt hiÖn");
		Try_To_Create_FightNPC("Nguyªn So¸i",nEnemyCamp);	--µÐ·½¹«¹²»ý·Ö³¬¹ýÒ»¶¨ÊýÖµ£º±¾·½×ÜÈËÊý*400£¬¶Ô·½ÔªË§³ö
	else
		BT_ShowDebugInfor("Kh«ng cã g× ®Ó lËp");
	end;
end;
