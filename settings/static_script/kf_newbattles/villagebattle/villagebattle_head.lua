--filename:villagebattle_head.lua
--create date:2006-05-31
--describe:´åÂäÕù¶áÕ½³¡Í·ÎÄ¼ş¡£°üº¬ËùĞèÒ»ÇĞÍ·ÎÄ¼ş¡£´åÂäÕ½µÄÆäËü½Å±¾Ö»Ğè°üº¬Õâ¸öÍ·ÎÄ¼ş¾ÍĞĞÁË
Include("\\settings\\static_script\\kf_newbattles\\villagebattle\\mission\\mission_head.lua");
Include("\\settings\\static_script\\kf_newbattles\\villagebattle\\position.lua");

MAX_TASK_STEP = 99;	--×î´óÈÎÎñ²½Êı

SICK_NPC = 1;	--NPCÇéĞ÷ÀàĞÍ£¬³ğºŞ
ANGRY_NPC = 2;	--·ßÅ­
RAGING_NPC = 3;	--¿ñ±©

BATTLE_TYPE = VILLAGE_ID;	--Õ½³¡ÀàĞÍ

SELECT_COUNT = 3;	--±»Ñ¡ÖĞÈ¥Ñ°ÕÒÄ¿±êNPCµÄÍæ¼ÒµÄÊıÁ¿¡£Ö»ÄÜÉèÖÃ1»ò2»ò3»ò4
KNOWMAN_COUNT = 10;	--ÖªÇéÈËÊıÁ¿¡£²»ÄÜ¸Ä¶¯¡£ÈçĞè¸Ä¶¯£¬ÇëÏÈ¿´¶®½Å±¾¡£

ENTRANCE_POINT = 	--½øÈëµã
{
	[SONG_ID] = {MAPID_SONG,1553,3618},
	[LIAO_ID] = {MAPID_LIAO,1783,3152},
};

DEATH_SCRIPT = "\\settings\\static_script\\kf_newbattles\\villagebattle\\playerdeath.lua";

--ÒÔtableĞÎÊ½·µ»ØnPlayerCount¸öËæ»úÍæ¼ÒµÄË÷Òı
function Get_Random_Player(nCamp,nPlayerCount)
	local tPlayer = {};
	local tSelectedPlayer = {};
	local nMSPlayerCount = GetMSPlayerCount(MISSION_ID,nCamp);
	if nMSPlayerCount == 0 then
		WriteLog("[ChiÕn tr­êng b¸o lçi]: Hµm sè Get_Random_Player nhËn ®­îc sè ng­êi cña phe MS nµo ®ã lµ 0");
		return 0;
	end;
	tPlayer = BT_GetMSPlayerIndex(nCamp);
	if nPlayerCount > nMSPlayerCount then	--Èç¹ûÒªÇóµÃµ½µÄÍæ¼ÒÊıÁ¿´óÓÚÄ¿Ç°Íæ¼ÒÊıÁ¿
		--ÄÇÃ´¾Í·µ»Øµ±Ç°ËùÓĞµÄÍæ¼Ò
		for i=1,nMSPlayerCount do	
			tSelectedPlayer[i] = tPlayer[i];
		end;
		return tSelectedPlayer;
	end;
	if getn(tPlayer) ~= nMSPlayerCount then
		WriteLog("[ChiÕn tr­êng b¸o lçi]: Hµm sè Get_Random_Player trong tPlayer("..getn(tPlayer)..") lín nhá so víi nMSPlayerCount("..nMSPlayerCount..") kh«ng ®ång nhÊt");
	end;
	for i=1,nPlayerCount do
		local nSel = random(1,getn(tPlayer));
		tSelectedPlayer[i] = tPlayer[nSel];
		tremove(tPlayer,nSel);
	end;
	if getn(tSelectedPlayer) ~= nPlayerCount then
		WriteLog("[ChiÕn tr­êng b¸o lçi]: Hµm sè Get_Random_Player trŞ ph¶n håi tSelectedPlayer("..getn(tSelectedPlayer)..") lín nhá so víi nPlayerCount("..nPlayerCount..") kh«ng ®ång nhÊt");
	end;
	return tSelectedPlayer;
end;
--²úÉúÄ¿±êNPCºÍÖªÇéÈË
function Create_Task_NPC(nCamp,sName)
	local tPosition = {};
	local nNpcCount = KNOWMAN_COUNT+1;	--£±£±¸öÖªÇéÈË¼ÓÒ»¸öÄ¿±êNPC
	tPosition = Get_Position_Index(nCamp);	--tPosition×îºóÒ»¸öÔªËØÊÇÄ¿±êNPCµÄÎ»ÖÃË÷Òı£¬¼´µÚnNpcCount¸öÔªËØ
	if getn(tPosition) ~= nNpcCount then
		WriteLog("[ChiÕn tr­êng b¸o lçi]: Hµm sè Create_Task_NPC trong Get_Position_Index ph¶n håi table lín nhá kh«ng ph¶i"..nNpcCount..",§óng:"..getn(tPosition))
		for i=1,nNpcCount do	--Èİ´í´¦Àí£¬ÓĞ¿ÉÄÜÔÚÍ¬Ò»¸öÎ»ÖÃ´´½¨¶à¸öNPC
			tPosition[i] = random(1,g_PosCount);	
		end;
	end;
	local npcIndex = CreateNpc("V­¬ng An Th¹ch",sName,MAPID,tNpcPos[tPosition[nNpcCount]][1],tNpcPos[tPosition[nNpcCount]][2],6,1,1,20);
	SetMissionV(MV_TASK_NPCINDEX_SONG-1+nCamp,npcIndex);	--¼ÇÂ¼Ä¿±êNPCµÄË÷Òı
	SetNpcScript(npcIndex,"\\settings\\static_script\\kf_newbattles\\villagebattle\\targetnpc_npc.lua");
	SetMissionS(MSTR_SONG_TARGETNAME-1+nCamp,sName);	--¼ÇÂ¼Ä¿±êNPCµÄÃû×Ö
	local nIndexBase = 0;
	if nCamp == SONG_ID then
		nIndexBase = MV_KNOWMAN_SONG_BEGIN;
	else
		nIndexBase = MV_KNOWMAN_LIAO_BEGIN;
	end;
	for i=0,9 do
		npcIndex = CreateNpc("Hoµn tr­êng Thæ d©n",sName.."B¸ch Sù T«ng",MAPID,tNpcPos[tPosition[i+1]][1],tNpcPos[tPosition[i+1]][2]);
		SetMissionV(nIndexBase+i,npcIndex);
		SetNpcDeathScript(npcIndex,"\\settings\\static_script\\kf_newbattles\\villagebattle\\knowmandeath.lua");
	end;
end;
--Çå³ıÈÎÎñNPC
function Clear_Task_NPC(nCamp)
	SetNpcLifeTime(GetMissionV(MV_TASK_NPCINDEX_SONG-1+nCamp),0);	--É¾³ıÄ¿±êNPC
	SetMissionV(MV_TASK_NPCINDEX_SONG-1+nCamp,0);
	SetMissionS(MSTR_SONG_TARGETNAME-1+nCamp,"");
	local nIndexBase = 0;
	if nCamp == SONG_ID then
		nIndexBase = MV_KNOWMAN_SONG_BEGIN;
	else
		nIndexBase = MV_KNOWMAN_LIAO_BEGIN;
	end;
	local npcIndex = 0;
	for i=0,9 do
		npcIndex = GetMissionV(nIndexBase+i);
		if npcIndex ~= 0 then
			SetNpcDeathScript(npcIndex,"");	--ÖÃ¿ÕËÀÍö½Å±¾
			SetNpcLifeTime(npcIndex,0);	--É¾³ıÖªÇéÈË
			SetMissionV(nIndexBase+i,0);
		end;
	end;
end;	
--ĞŞ¸ÄÕóÓªµÄÈÎÎñ²½Êı
function Modify_Task_Step(nCamp,nStep)
	local nCurStep = GetMissionV(MV_SONG_TASKSTEP+nCamp-1);
	nCurStep = nCurStep + nStep;
	if nCurStep < 0 then
		nCurStep = 0;
	elseif nCurStep > MAX_TASK_STEP then
		nCurStep = MAX_TASK_STEP;
	end;
	SetMissionV(MV_SONG_TASKSTEP+nCamp-1,nCurStep);
	if nCurStep == MAX_TASK_STEP then
		return 1;	--±íÊ¾Íê³ÉÑ°ÕÒÈÎÎñ£¬ÕâÊ±Ó¦¸ÃÉú³ÉÊ×Áì
	end;
	return 0;
end;
--Ëæ»ú²úÉúÒ»¸ö²»ÓëµĞ·½Ä¿±êNPCÍ¬Ãû×ÖµÄ±¾·½Ä¿±êNPCÃû×Ö
function Create_Target_Name()
	local sName = "®èi ph­¬ng NPC";
	for i=1,20 do
		sName = Create_Name();
		if sName ~= GetMissionS(MSTR_SONG_TARGETNAME) and sName ~= GetMissionS(MSTR_LIAO_TARGETNAME) then
			return sName;
		end;
	end;
	WriteLog("[ChiÕn tr­êng b¸o lçi]: TuÇn hoµn 20 lÇn vÉn ch­a t×m ra tªn thİch hîp");
	return sName;
end;
--Ñ¡ÔñÈı¸ö£¨»òÈı¸öÒÔÏÂ£©ĞÒÔË¶ù
function Select_Task_Player(nCamp)
	local OldPlayerIndex = PlayerIndex;
	local tSelPlayer = Get_Random_Player(nCamp,SELECT_COUNT);
	if tSelPlayer == 0 then
		PlayerIndex = OldPlayerIndex;
		return 0;	--nCamp·½ÈËÊıÎª0
	end;
	local nSelPlayerCount = getn(tSelPlayer);
	if nSelPlayerCount > SELECT_COUNT then
		WriteLog("[ChiÕn tr­êng b¸o lçi]: Select_Task_Player hµm sè Get_Random_Player(nCamp,SELECT_COUNT) ph¶n håi sai, tSelPlayer lín nhá lµ:"..nSelPlayerCount);
	end;
	Clear_Task_Player(nCamp);
	for i=1,nSelPlayerCount do
		PlayerIndex = tSelPlayer[i];
		if PlayerIndex > 0 then
			local sName = GetName();
			BT_SetTempData(PTT_SELECTED,1);
			SetMissionS(MSTR_SONG_ONE+nCamp+i*2-3,sName);	--¼ÇÂ¼ËûÃÇµÄÃû×Ö
		end;
	end;
	PlayerIndex = OldPlayerIndex;
end;
--Çå¿Õ¼ÇÂ¼Íæ¼ÒÃû×ÖµÄMS±äÁ¿
function Clear_Task_Player(nCamp)
	for i=1,SELECT_COUNT do
		SetMissionS(MSTR_SONG_ONE+nCamp+i*2-3,"");	--ÏÈÇå¿Õ
	end;
end;
--´´½¨Ê×ÁìNPC
function Create_Header(nCamp)
	local nPosIndex = random(1,g_PosCount);
	local npcIndex = CreateNpc("V­¬ng An Th¹ch","Thñ lÜnh thæ d©n",MAPID,tNpcPos[nPosIndex][1],tNpcPos[nPosIndex][2]);
	SetMissionV(MV_HEADER_APPEAR,npcIndex);
	SetNpcScript(npcIndex,"\\settings\\static_script\\kf_newbattles\\villagebattle\\header_npc.lua");
end;
--µÃµ½NPCÎ»ÖÃµÄË÷ÒıÊı×é£¬Ò»¹²ÓĞ11¸ö£¬ÆäÖĞµÚ11¸öÊÇÄ¿±êNPCµÄÎ»ÖÃË÷Òı
function Get_Position_Index(nCamp)
	local tResult = {};
	local nPosIndex = 0;
	local nIndexBase = 0;
	if nCamp == SONG_ID then
		nIndexBase = MV_POS_INDEX_SONG_BEGIN;
	else
		nIndexBase = MV_POS_INDEX_LIAO_BEGIN;
	end;
	for i=0,10 do
		nPosIndex = Get_Right_Pos();
		SetMissionV(nIndexBase+i,nPosIndex);
		tResult[i+1] = nPosIndex;
	end;
	return tResult;
end;
--»ñµÃÒ»¸ö¿ÉÓÃµÄÎ»ÖÃË÷Òı¡£Èç¹ûÑ­»·ÁË10´Î»¹ÕÒ²»µ½Ò»¸öºÏÊÊµÄÎ»ÖÃË÷Òı£¬¼´½«·µ»Ø×îºóÒ»´ÎÑ­»·µÄÎ»ÖÃË÷Òı
function Get_Right_Pos()
	local nPosIndex = random(1,g_PosCount);
	for j=1,10 do
		nPosIndex = random(1,g_PosCount);
		if Check_Position(nPosIndex) == 1 then
			return nPosIndex;
		end;
	end;
	WriteLog("[ChiÕn tr­êng b¸o lçi]: TuÇn hoµn 10 lÇn vÉn ch­a t×m ra vŞ trİ thİch hîp");
	return nPosIndex;
end;
--¸ù¾İÎ»ÖÃË÷ÒıÀ´¼ì²éÕâ¸öÎ»ÖÃÊÇ·ñ¿ÉÓÃ£¬¼´ÓĞÃ»ÓĞ±ğµÄNPCÕ¼ÓÃÁËÕâ¸öÎ»ÖÃ
function Check_Position(nPosIndex)
	for i=MV_POS_INDEX_SONG_BEGIN,MV_POS_INDEX_LIAO_END do
		if nPosIndex == GetMissionV(i) then
			return 0;
		end;
	end;
	return 1;
end;

tFirstName = {"Lı","V­¬ng","Tr­¬ng","L­u","TrÇn","D­¬ng","TriÖu","Hoµng","Chu",
			  "Chu","Cao","L©m","Hµ","Qu¸ch","M·","La ","L­¬ng","Tèng","TrŞnh",
			  "T¹","Hµn","§­êng","Phïng","Vu","§æng","Tiªu","Tr×nh","Tµo","Viªn",
			  "§Æng","Høa","Phã","ThÈm","T¨ng","Bµnh","L÷","T«","L­"," T­¬ng",
			  "Th¸i","Gi¶","§inh","Ngôy","TiÕt ","DiÖp","Diªm","Xa","Phan","§¹t ",
			  "§¸i","H¹","Chung","U«ng","§iÒn","NhiÖm","Kh­¬ng","Phµn ","Ph­¬ng ","Th¹ch",
			  "Diªu","§µm","Liªu","Tr©u","GÊu"," Kim ","Lôc","H¸ch","Khæng","B¹ch",
			  "Th«i","khang","Mao","Kh­u","TÇn","Giang","Sö","Cè","HÇu","ThiÖu",
			  "M·nh","Long","V¹n ","§oµn","Ch­¬ng","TiÒn","Thang","Do·n","Lª"," DŞch ",
			  "Th­êng","Vò ","¢n","H¹","L¹i","Cung","T©n","Ng«","Tõ","T«n",
			  "Bå ",
			 };
nFirstNameSize = getn(tFirstName);
tSecondName = {"ba","bèn","Ngò ","L©m","§iÒn","Th¹ch","B¹ch","khang","Quúnh","Giang",
				"Minh","Ch­¬ng","Vò ","KiÒu","T©n","C¸t","Trİ","Chİ ","D­¬ng","®¹t","Thanh",
				"Toµn","Huy","B©n","Siªu","phi","Vò","L­îng","KiÖn","Ho»ng","ı","H¹o",
				"Khanh","QuyÒn","Quı","Dông","Phong","h¶i","B»ng","Tïng","Thiªn","V¹n ","Xu©n",
				"Anh","c¶nh","Söu","TiÖm","H­¬ng","Th©m","Hoµn ","Ch©n","Bè","Tr¸c","Nguyªn",
				"Xung","To¸n","Hy","Chïy","TiÕn","®Ó","NhuËn","KiÖm","hai"

			  };
ntSecondNameSize = getn(tSecondName);
--¸ù¾İtFirstNameºÍtSecondNameËæ»úÉú³ÉÒ»¸öÃû×Ö
function Create_Name()
	local sName = "";
	sName = tFirstName[random(1,nFirstNameSize)]..tSecondName[random(1,ntSecondNameSize)];
	return sName;
end;
--×ªµ½ÏÂÒ»²½Ñ°ÈËÈÎÎñ
function Go_To_Next_Step(nCamp)
	local sName = "";
	SetMissionV(MV_TARGET_NPC_STATE_SONG+nCamp-1,0);	--ÉèÖÃNPCÀàĞÍ
	SetMissionV(MV_FIGHT_NPC_TYPE_SONG+nCamp-1,0);		--ÉèÖÃNPC×´Ì¬ÎªºÍÆ½×´Ì¬
	SetMissionV(MV_NPC_FIGHT_BEGIN_SONG+nCamp-1,0);	
	
	BT_SetCampTempValue(nCamp,PTT_SELECTED,0);	--Çå¿ÕÕóÓªËùÓĞÍæ¼ÒµÄ¡°ĞÒÔË¡±±ê¼Ç
	
	if nCamp == SONG_ID then
		SetMissionV(MV_SONG_KILL_SONG,0);
		SetMissionV(MV_LIAO_KILL_SONG,0);		
	else
		SetMissionV(MV_SONG_KILL_LIAO,0);
		SetMissionV(MV_LIAO_KILL_LIAO,0);
	end;
	Clear_Task_NPC(nCamp);
	if Select_Task_Player(nCamp) == 0 then	--Ö®Ç°±¾·½ÈËÊıÎª0
		Clear_Task_Player(nCamp);	
		SetMissionS(MSTR_SONG_TARGETNAME-1+nCamp,"");	--Ãû×ÖÖÃ¿Õ£¬ÒÔ±ãºóÀ´½øÈëµÄÍæ¼Ò¿ÉÒÔÖØĞÂ¿ªÊ¼¡£
		return "";
	end;
	sName = Create_Target_Name();
	Create_Task_NPC(nCamp,sName);
	local sContent = "";
	if GetMissionS(MSTR_SONG_ONE+nCamp-1) ~= "" then
		sContent = sContent..GetMissionS(MSTR_SONG_ONE+nCamp-1)..", ";
	end;
	if GetMissionS(MSTR_SONG_TWO+nCamp-1) ~= "" then
		sContent = sContent..GetMissionS(MSTR_SONG_TWO+nCamp-1)..", ";
	end;
	if GetMissionS(MSTR_SONG_THREE+nCamp-1) ~= "" then
		sContent = sContent..GetMissionS(MSTR_SONG_THREE+nCamp-1)..", ";
	end;
	sContent = strsub(sContent,1,strlen(sContent)-2);
	Msg2MSGroup(MISSION_ID,"Doanh tr¹i cÊp b¸o: Nghe nãi "..sName.."  cã thÓ biÕt tung tİch thñ lÜnh. Mêi "..sContent.." nhanh chãng ph©n t¸n ®i t×m B¸ch Sù Th«ng. HiÖn phe ta nhËn ®­îc sù tİn nhiÖm cña Thæ d©n lµ "..GetMissionV(MV_SONG_TASKSTEP+nCamp-1)..".",nCamp);
	if nCamp == SONG_ID then
		Msg2MSAll(MISSION_ID,"T­íng sÜ nhËn nhiÖm vô phe Tèng lµ: "..sContent)
	else
		Msg2MSAll(MISSION_ID,"T­íng sÜ nhËn nhiÖm vô phe Liªu lµ: "..sContent)
	end;
	Tips_To_Selected_Player(nCamp);
	return sName;
end;
--Ïò±»Ñ¡ÖĞµÄÈË·¢TIPS
function Tips_To_Selected_Player(nCamp)
	local nOldPlayerIndex = PlayerIndex;
	local tPlayer = BT_GetMSPlayerIndex(nCamp);
	for i=1,getn(tPlayer) do
		PlayerIndex = tPlayer[i];
		if BT_GetTempData(PTT_SELECTED) == 1 then
			TaskTip("Nguyªn so¸i cã lÖnh, ng­¬i mau t×m"..GetMissionS(MSTR_SONG_TARGETNAME+nCamp-1));
		end;
	end;
	PlayerIndex = nOldPlayerIndex;
end;
--µ½´ï×îºóÒ»²½Ñ°ÈËÈÎÎñ
function Reach_Final_Step(nCamp)
	if GetMissionV(MV_HEADER_APPEAR) == 0 then
		Msg2MSAll(MISSION_ID,"Th¸m m· håi b¸o: Thñ lÜnh ®· xuÊt hiÖn, c¸c vŞ t­íng sÜ mau chãng t×m ra!");
		Create_Header();
	end;
	if nCamp == SONG_ID then
		Msg2MSAll(MISSION_ID,"Phe Tèng ®· hoµn thµnh c¸c b­íc, cã thÓ ®èi tho¹i víi thñ lÜnh.");
	else
		Msg2MSAll(MISSION_ID,"Phe Liªu ®· hoµn thµnh c¸c b­íc, cã thÓ ®èi tho¹i víi thñ lÜnh.");
	end;
	Say("<color=green>"..GetMissionS(MSTR_SONG_TARGETNAME-1+nCamp).."<color>: Nghe nãi thñ lÜnh ®· xuÊt hiÖn, ng­¬i t×m trong th«n xem!",0);
	Clear_Task_NPC(nCamp);
end;
--ÊÇ²»ÊÇ±»Ñ¡ÔñµÄÄÇ¼¸¸öÈË
function Is_The_Selected(nCamp)
	if BT_GetCamp() == nCamp and BT_GetTempData(PTT_SELECTED) == 1 then
		return 1;
	else
		return 0;
	end;
end;
