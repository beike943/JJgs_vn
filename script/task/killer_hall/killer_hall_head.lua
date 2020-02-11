--date:2007-3-6
--author:yanjun
--describe:this script define some constant values and some public functions,is the header file of killer hall task;
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\lingshi_head.lua");
Include("\\script\\task\\happiness_bag\\happiness_bag.lua");
Include("\\script\\online_activites\\shimen_tier4\\tier4.lua")
--========================================================================================
SETTING_DYNAMIC_MISSION = 0;	--ÊÇ·ñÖ§³Ö¶¯Ì¬¿ªÆôµÄMission
DEBUG_VERSION = 0;				--ĞèÒªÊä³öµ÷ÊÔĞÅÏ¢Âğ£¿

THIS_FILE_NAME = "\\script\\task\\killer_hall\\killer_hall_head.lua";
MAP_ID = 885;					--É±ÊÖÌÃµØÍ¼ID
PLAY_TIME = 60;					--Ë¢É±ÊÖµÄ×ÜÊ±¼ä£¬Ò²µÈÓÚMissionÖĞµÄSTARTED_TIMEÊ±¼ä¡£Õâ¸ö³£Á¿Éè¼ÆµÃºÜÃ»Ë®Æ½
--ÈÎÎñ±äÁ¿================================================================================
KH_TASK_GOT_MASK_DATE = 433;	--ÁìÈ¡ÈËÆ¤Ãæ¾ßµÄÈÕÆÚ
KH_TASK_MSUID = 434;			--¼ÇÂ¼Íæ¼ÒÖ®Ç°½øÈëµÄÊÇÄÄÒ»³¡Mission
KH_TASK_OPEN_BOX_TIME = 435;	--¼ÇÂ¼µ±³¡¿ªÏä×ÓµÄ´ÎÊı
KH_TASK_USE_MIHAN_TIME = 436;	--¼ÇÂ¼ÉÏ´ÎÊ¹ÓÃÉ±ÊÖÌÃÃØº¯µÄÊ±¼ä
--ÁÙÊ±ÈÎÎñ±äÁ¿============================================================================
KH_TASK_TEMP_BOX_INDEX = 115;	--¼ÇÂ¼ËùµãÏä×ÓµÄNPCË÷Òı
--·şÎñÆ÷±äÁ¿==============================================================================
GLB_KILLER_HALL_FORBIDEN = 600;	--ÊÇ·ñ½ûÖ¹É±ÊÖÌÃÈÎÎñ
--µØÍ¼±äÁ¿================================================================================
MAPV_BEGIN = 1;
MAPV_OPENED_BOX1_COUNT = 1;		--¼ÇÂ¼¿ªÏãÖ÷Ïä×ÓµÄÊıÁ¿  
MAPV_OPENED_BOX2_COUNT = 2;     --¼ÇÂ¼¿ª¸±ÌÃÖ÷Ïä×ÓµÄÊıÁ¿
MAPV_OPENED_BOX3_COUNT = 3;     --¼ÇÂ¼¿ªÀî´ó×ìÏä×ÓµÄÊıÁ¿
MAPV_OPEN_BOX_FORBIDDEN = 4;	--ÉèÖÃÊÇ·ñ¿ÉÒÔ¿ªÏä×Ó£¬ÓÃÀ´Ô¤·ÀË¢Ïä×Ó
MAPV_END = 4;
--========================================================================================
XIANGZHU_KILLER_COUNT = 10
FUTANGZHU_KILLER_COUNT = 20;	--É±ËÀ¸±ÌÃÖ÷ºó²úÉúµÄÉ±ÊÖÊıÁ¿
LIDAZUI_KILLER_COUNT = 40;		--É±ËÀÀî´ó×ìºó²úÉúµÄÉ±ÊÖÊıÁ¿
--========================================================================================
NPC_TYPE_XIANGZHU = 1;
NPC_TYPE_FUTANGZHU = 2;
NPC_TYPE_LIDAZUI = 3;
NPC_TYPE_KILLER = 4;
--========================================================================================
tItemInfo = --¶¨ÒåÉ±ÊÖÌÃÈÎÎñÏà¹ØÎïÆ·ĞÅÏ¢
--2¡¢3Ïî¸ÄÎªËÍÌ«Ò×»ìÔª¹¦Í¼¼ø edited by vivi
{
	[1] = {"MÆt n¹ S¸t Thñ §­êng",2,1,1087},
	[2] = {"Th¸i DŞch Hçn Nguyªn C«ng §å",2,0,1082},
	[3] = {"Th¸i DŞch Hçn Nguyªn C«ng §å",2,0,1082},
}

tExpAward = {	--Ïä×ÓËù¸øµÄ¾­Ñé
	[NPC_TYPE_XIANGZHU] = {500000},
	[NPC_TYPE_FUTANGZHU] = {1000000},
	[NPC_TYPE_LIDAZUI] = {2000000},
	}

tTaoAward = {	--Ïä×ÓËù¸øµÄ¾­Ñé
	[NPC_TYPE_XIANGZHU] = {1},
	[NPC_TYPE_FUTANGZHU] = {2},
	[NPC_TYPE_LIDAZUI] = {4},
	}
	
tbThuongMoRuong = {
	[NPC_TYPE_XIANGZHU] = {2,1,30340,100},
	[NPC_TYPE_FUTANGZHU] = {2,1,30341,2},
	[NPC_TYPE_LIDAZUI] = {2,1,30341,3},
}
	
tMysticThing = 	--ÍÃĞ¡Ñ¾ÉñÃØÎïÆ·
{
	{"Hoµng Kim b¶o r­¬ng",2,1,108},
	{"X¸ Lîi TruyÒn C«ng",2,1,109},
	{"M¶nh b¶n ®å SHXT",2,1,110},
	{"Hoa hång",2,1,111},
	{"Ch©n thá",2,1,112},
	{"Nanh sãi",2,1,113},
	{"T¬ kh¸ng Thñy",2,1,114},
	{"Ph¸ Thiªn Cung",2,1,115},
	{"X­¬ng rång",2,1,116},
	{"Tóy Tiªn Cóc",2,1,117},
	{"Thi V­¬ng LÆc Cèt",2,1,118},
	{"Thi Khİ B×nh",2,1,119},
	{"Qu¶n Tö",2,1,120},
	{"Tói Phi Ng­",2,1,121},
	{"B×nh Song Tinh",2,1,122},
	{"Thó V­¬ng T©m",2,1,123},
	{"X­¬ng sä",2,1,124},
	{"Tô Hån ®Ønh",2,1,125},
	{"L¹p Hoµn",2,1,126},
	{"D¬i ®éc",2,1,127},
	{"Quan m·o",2,1,128},
	{"MËt S¸t LÖnh",2,1,129},
	{"ChÊn Thiªn TuyÕt",2,1,130},
	{"Tµng B¶o §å",2,1,131},
	{"DiÒu",2,1,132},
	{"Con rèi",2,1,133},
	{"Tµo Ng©n",2,1,134},
	{"Hoa Th¹ch C­¬ng",2,1,135},
	{"DÇu ®en",2,1,136},
	{"Tr­êng Thµnh Kİnh",2,1,137},
	{"B¶n ch÷ TÊt Th¨ng",2,1,138},
	{"Nh©n §Çu NiÖm Ch©u",2,1,139},
	{"Khª S¬n chİ",2,1,140},
	{"Yªu V­¬ng chiÕn kú",2,1,141},
	{"Hoµng TriÒu Ngäc Tû",2,1,142},
	{"Thiªn C­¬ng Ngò L«i §¹i Ph¸p",2,1,143},
	{"Kim Chuyªn",2,1,144},
	{"L«i Viªm Kim Sa",2,1,146},
	{"Thiªn Y V« Phong",2,1,147},
	{"Bå §Ò",2,1,151},
	{"Bİ Ng©n",2,1,152},
	{"PhÈm mµu",2,1,153},
}

tFactionTokenRing = --ÃÅÅÉ¶ÔÓ¦µÄÊ¦ÃÅÁîÅÆ
{
	[1] = {2,0,205},	--ÉÙÁÖ
	[2] = {2,0,206},	--Îäµ±
	[3] = {2,0,207},	--¶ëáÒ
	[4] = {2,0,208},	--Ø¤°ï
	[5] = {2,0,209},	--ÌÆÃÅ
	[6] = {2,0,350},	--ÑîÃÅ
	[7] = {2,0,390},	--Îå¶¾
}

tRouteInfo = --¼¼ÄÜID£¬¼¼ÄÜ×î¸ßµÈ¼¶£¬ÎäÆ÷ĞÅÏ¢
{
	[0] = {0,0,{}},--"ÎŞÃÅÎŞÅÉ",
	[1] = {0,0,{}},--ÉÙÁÖ
	[2] = {31,7,{{"Cæ §İnh ch­a gi¸m ®Şnh",2,1,379},{"LiÖt DiÖm ch­a gi¸m ®Şnh",2,1,377}}},--"Ë×¼Ò",
	[3] = {56,7,{{"A La H¸n Tr­îng ch­a gi¸m ®Şnh",2,1,382}}},--"ìøÉ®",
	[4] = {43,7,{{"V¹n NhÉn ch­a gi¸m ®Şnh",2,1,375}}},--"ÎäÉ®",
	[5] = {0,0,{}},--"ÌÆÃÅ",
	[6] = {73,7,{{"M·n Thiªn Hoa Vò ch­a gi¸m ®Şnh",2,1,378}}},--"ÌÆÃÅ",
	[7] = {0,0,{}},--"¶ëáÒ",
	[8] = {88,7,{{"Háa Tinh ch­a gi¸m ®Şnh",2,1,376}}},--"¶ëáÒ·ğ¼Ò",
	[9] = {101,7,{{"Hi Nh©n CÇm ch­a gi¸m ®Şnh",2,1,380}}},--"¶ëáÒË×¼Ò",
	[10] = {0,0,{}},--"Ø¤°ï",
	[11] = {112,7,{{"V¹n NhÉn ch­a gi¸m ®Şnh",2,1,375}}},--"Ø¤°ï¾»ÒÂ",
	[12] = {123,7,{{"LiÖt DiÖm ch­a gi¸m ®Şnh",2,1,377}}},--"Ø¤°ïÎÛÒÂ",
	[13] = {0,0,{}},--"Îäµ±",
	[14] = {145,7,{{"Háa Tinh ch­a gi¸m ®Şnh",2,1,376}}},--"Îäµ±µÀ¼Ò",
	[15] = {158,7,{{"ThÇn Hµnh ch­a gi¸m ®Şnh",2,1,381}}},--"Îäµ±Ë×¼Ò",
	[16] = {0,0,{}},--"ÑîÃÅ",
	[17] = {731,7,{{"§¹i Hµo L«i Th­¬ng ch­a gi¸m ®Şnh",2,1,383}}},--"ÑîÃÅÇ¹Æï",
	[18] = {744,7,{{"ThÇn Cung ch­a gi¸m ®Şnh",2,1,384}}},--"ÑîÃÅ¹­Æï",
	[19] = {0,0,{}},--"Îå¶¾",
	[20] = {377,7,{{"L¨ng Phong ch­a gi¸m ®Şnh",2,1,386}}},--"Îå¶¾Ğ°ÏÀ",
	[21] = {363,7,{{"M·nh Hæ ch­a gi¸m ®Şnh",2,1,385}}},--"Îå¶¾¹ÆÊ¦",
	[23] = {1030,8,{{"M·nh Hæ ch­a gi¸m ®Şnh",2,1,385}}},
	[29] = {1176,7,{{"M·nh Hæ ch­a gi¸m ®Şnh",2,1,385}}},
	[30] = {1229,7,{{"M·nh Hæ ch­a gi¸m ®Şnh",2,1,385}}},
}

tNpcInfo = --¶¨ÒåNPCµÄÄ£°åÃûÓëÃû×ÖÓëÉú´æÊ±¼ä
{
	[NPC_TYPE_XIANGZHU] = {"H­¬ng chñ S¸t Thñ §­êng","H­¬ng chñ S¸t Thñ §­êng",5*60-30},
	[NPC_TYPE_FUTANGZHU] = {"Phã §­êng chñ S¸t Thñ §­êng","Phã §­êng chñ S¸t Thñ §­êng",5*60-30},
	[NPC_TYPE_LIDAZUI] = {"Nh©n ®å phñ -Quû Ng­îc","Nh©n ®å phñ -Lı §¹i Chñy",15*60-30},
	[NPC_TYPE_KILLER] = {"Kim bµi s¸t thñ","Kim bµi s¸t thñ",5*60-30},
}

tNpcRegion = --¶¨Òå¸÷¸öÇøÓòµÄË¢ĞÂµã
{
	[NPC_TYPE_XIANGZHU] = 	--ÀûÒæ¶ÀÏíÇøÓò
		  {	
			[1] = {{MAP_ID,1533,3137}},	--Ä³¸öÀûÒæ¶ÀÏíÇøÓòÖĞ¿ÉÄÜ»áÓĞ¶à¸öË¢ĞÂµã
			[2] = {{MAP_ID,1565,3106}}, 
			[3] = {{MAP_ID,1593,3077}},
			[4] = {{MAP_ID,1682,3165}},
			[5] = {{MAP_ID,1653,3194}},
			[6] = {{MAP_ID,1629,3222}},
			[7] = {{MAP_ID,1711,2960}},
			[8] = {{MAP_ID,1738,2986}},
			[9] = {{MAP_ID,1770,3016}},
		  },
	[NPC_TYPE_FUTANGZHU] = --ÀûÒæ¾ºÕù¶ÀÏíÇøÓò
		  {
		  	[1] = {{MAP_ID,1630,3039}},
		  	[2] = {{MAP_ID,1718,3126}},
		  	[3] = {{MAP_ID,1784,3070}},
		  	[4] = {{MAP_ID,1734,3048}},
		  	[5] = {{MAP_ID,1700,3026}},
		  	[6] = {{MAP_ID,1682,2990}},
		  },
	[NPC_TYPE_LIDAZUI] = 	--ÀûÒæ×î¼¯ÖĞÇøÓò
		  {	
			[1] = {{MAP_ID,1672,3082}},
		  },
	[NPC_TYPE_KILLER] = 	--ÀûÒæ·ÖÉ¢ÇøÓò
		  {	
		  	[1] = {{MAP_ID,1611,3147}},
		  },
}

tEntrancePos = --½øÈëµã
{
	[1] = {MAP_ID,1573,3186},
	[2] = {MAP_ID,1586,3204},
	[3] = {MAP_ID,1548,3168},
	--ÉÏÃæÈı¸öÊÇÃÅ¿Ú´«ËÍµã£¬ÏÂÃæ9¸öÊÇ·¿¼ä´«ËÍµã
	[4] = {MAP_ID,1533,3137},
	[5] = {MAP_ID,1565,3106},
	[6] = {MAP_ID,1593,3077},
	[7] = {MAP_ID,1682,3165},
	[8] = {MAP_ID,1653,3194},
	[9] = {MAP_ID,1629,3222},
	[10] = {MAP_ID,1711,2960},
	[11] = {MAP_ID,1738,2986},
	[12] = {MAP_ID,1770,3016},
}

tExitPos = --³ö¿Úµã
{
	[1] = {300,1654,3643},
	[2] = {300,1893,3648},
	[3] = {300,1908,3449},
	[4] = {300,1679,3463},
}
--=========================================================================================
BOSS1_POS_COUNT = getn(tNpcRegion[NPC_TYPE_XIANGZHU]);
BOSS2_POS_COUNT = getn(tNpcRegion[NPC_TYPE_FUTANGZHU]);
BOSS3_POS_COUNT = getn(tNpcRegion[NPC_TYPE_LIDAZUI]);
MAX_BOX1_COUNT = ceil(PLAY_TIME/5)*BOSS1_POS_COUNT;	--ÏãÖ÷Ïä×ÓµÄ×ÜÊı
MAX_BOX2_COUNT = ceil(PLAY_TIME/5)*BOSS2_POS_COUNT;	--¸±ÌÃÖ÷Ïä×ÓµÄ×ÜÊı
MAX_BOX3_COUNT = ceil(PLAY_TIME/15)*BOSS3_POS_COUNT;	--Àî´ó×ìÏä×ÓµÄ×ÜÊı
--=========================================================================================
--¼ì²éÊÇ·ñ°Ñ±¾ÃÅ×î¸ßÎäÑ§Á·µ½ÁË¼«ÖÁ
function KH_Check_Skill_Level()
	local nRoute = GetPlayerRoute();
	local nSkillID = tRouteInfo[nRoute][1];
	local nMaxLevel = tRouteInfo[nRoute][2];
	if tRouteInfo[nRoute][1] == 0 then
		return 0;
	else
		if GetSkillLevel(nSkillID) >= nMaxLevel then
			return 1
		else
			return 0;
		end;
	end;
end;
--º¯ÊıÃû³Æ£ºNPCË÷ÒıÖµÉè¶¨
--¹¦        ÄÜ£ºÖ±½ÓÉè¶¨NPCË÷ÒıÎ»ÖÃµÄÖµ
function KH_SetUnit_CurStates(Npc_index,att_seq,number)
	if number > 99 and att_seq ~= 1 and att_seq ~= 4 and att_seq ~= 5 and att_seq ~= 6 then
		print("ThiÕt lËp trŞ sè NPC nhÇm: VŞ trİ:"..att_seq.."TrŞ:"..number)
		return 0
	end
	local num_save = GetUnitCurStates(Npc_index,att_seq)
	num_save = number - num_save
	AddUnitStates(Npc_index,att_seq,num_save)
	return 1
end
--¸ø½±Àø
function KH_Give_Award(nType)
	if GetMapTaskTemp(MAP_ID,MAPV_OPEN_BOX_FORBIDDEN) == 1 then
		local nNpcIdx = GetTaskTemp(KH_TASK_TEMP_BOX_INDEX);
		SetNpcLifeTime(nNpcIdx,0);
		gf_Msg2Team("Sè l­îng r­¬ng ®· v­ît giíi h¹n!");
		return 0;
	end;
--	local nFrui = tTaoAward[nType][1];
	local tbAward = tbThuongMoRuong[nType]
	local nTeamSize = GetTeamSize();
	local nOldPlayerIdx = PlayerIndex;
	local tMPVID = {
					[1] = MAPV_OPENED_BOX1_COUNT,
					[2] = MAPV_OPENED_BOX2_COUNT,
					[3] = MAPV_OPENED_BOX3_COUNT,
					}
	if nTeamSize > 1 then
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i);
			KH_Normal_Award(nType);
			VIET_0908_Aword(nType);		--2009Äê8ÔÂ»î¶¯½±Àø
			VIET_1009_DoQuest(nType)
--			gf_AddItemEx2({2,1,30176,nFrui}, "T¸o", "Nhiem vu STD", "nhËn")
--			gf_AddItemEx2(	tbAward, "Mo ruong", "Nhiem vu STD", "nhËn")
		end;
		PlayerIndex = nOldPlayerIdx;
	else
		KH_Normal_Award(nType);
		VIET_0908_Aword(nType);		--2009Äê8ÔÂ»î¶¯½±Àø
		VIET_1009_DoQuest(nType)
	end;
	if tonumber(date("%y%m%d")) >= 100716 and tonumber(date("%y%m%d")) <= 100815 then
		VIET_1005_Award(nType)
	end
	if tonumber(date("%y%m%d")) >= 101008 and tonumber(date("%y%m%d")) <= 101025 then
		VIET_1010_Bhta4(nType)
	end
	-- Bang héi tinh anh 6 , nguån ra hoa hång
	if tonumber(date("%y%m%d")) >= 110930 and tonumber(date("%y%m%d")) <= 111023 then
		VIET_1103_BHTA6(nType)
	end
	KH_Special_Award(nType);	--Õë¶ÔËùÓĞÈËµÄ½±Àø
	VIET_0908_Aword(nType);		--2009Äê8ÔÂ»î¶¯½±Àø
	-- Bá phÇn th­ëng vò khİ
--	VET_Tier4GiveKillerHallAward(nType);-- Ê¦ÃÅ4Ì×
	local nMapVID = tMPVID[nType];
	--< Added by SunZhuoshi
	if 1 == GetMapTaskTemp(MAP_ID, nMapVID) then
		HBRewardInKillerHall();
	end
	-->
	SetMapTaskTemp(MAP_ID,nMapVID,GetMapTaskTemp(MAP_ID,nMapVID)+1);	--¿ªÆô¹ıµÄÏä×Ó¼ÆÊı
	KH_Check_Box_Count();	--¼ì²éÏä×ÓÊıÁ¿
end;
--±¦ÏäÆÕÍ¨½±Àø
function KH_Normal_Award(nType)
	local nCurMapID = GetWorldPos();
	if nCurMapID ~= MAP_ID then	--Èç¹û²»ÔÚÉ±ÊÖÌÃµØÍ¼¾Í²»ÄÜ»ñµÃ½±Àø
		return 0;
	end;
	if IsPlayerDeath() == 0 then --²»ÊÇËÀÍö×´Ì¬
		KH_Exp_Award(nType);	--¾­Ñé½±Àø
	end;
	KH_LingShiPF_Award(nType);	--ÁéÊ¯Åä·½½±Àø
	SetTask(KH_TASK_OPEN_BOX_TIME,GetTask(KH_TASK_OPEN_BOX_TIME)+1);	--»ñµÃ½±Àø´ÎÊı¼Ó1
end;
--ÁéÊ¯½±Àø
function KH_LingShiPF_Award(nType)
	local nGotAwardTime = GetTask(KH_TASK_OPEN_BOX_TIME);
	local nRandPro = {30,50,100};
	local nRand = random(1,100);
	local nPFLevel = 0;
	local nLevel = GetLevel();
	if nGotAwardTime >= 7 and nGotAwardTime <= 11 then
		if nRand <= floor(nRandPro[nType]*2/3) then	--µÚ7ÖÁµÚ11´Î£¬Ë¥¼õÎªÔ­À´µÄ2/3
			if nLevel < 80 then
				nPFLevel = random(1,5);
			else
				nPFLevel = random(2,5);
			end;
		end;
	elseif nGotAwardTime >= 12 and nGotAwardTime <= 17 then
		if nRand <= floor(nRandPro[nType]*1/2) then	--µÚ12ÖÁµÚ17´Î£¬Ë¥¼õÎªÔ­À´µÄ1/2
			if nLevel < 80 then
				nPFLevel = random(1,5);
			else
				nPFLevel = random(2,5);
			end;
		end;
	elseif nGotAwardTime >= 18 then
		if nRand <= floor(nRandPro[nType]*1/4) then	--µÚ18´ÎÖ®ºó£¬Ë¥¼õÎªÔ­À´µÄ1/4
			if nLevel < 80 then
				nPFLevel = random(1,5);
			else
				nPFLevel = random(2,5);
			end;
		end;
	else
		if nLevel < 80 then
			nPFLevel = random(1,5);
		else
			nPFLevel = random(2,5);
		end;
	end;
	if nPFLevel ~= 0 then
		lspf_AddPeiFangInBottle(nPFLevel,1);
		Msg2Player("B¹n nhËn ®­îc 1 "..nPFLevel.." (cÊp) Linh th¹ch phèi ph­¬ng, ®· nhËp vµo Tô Linh §Ønh");
	end;
end;
--Ïä×ÓÆÕÍ¨½±ÀøÖĞµÄ¾­Ñé½±Àø
function KH_Exp_Award(nType)
	local nGotAwardTime = GetTask(KH_TASK_OPEN_BOX_TIME);
	local nExp = tExpAward[nType][1];
	if nGotAwardTime >= 7 and nGotAwardTime <= 11 then
		nExp = floor(nExp*2/3);	--µÚ7ÖÁµÚ11´Î£¬Ë¥¼õÎªÔ­À´µÄ2/3
	elseif nGotAwardTime >= 12 and nGotAwardTime <= 17 then
		nExp = floor(nExp*1/2);	--µÚ12ÖÁµÚ17´Î£¬Ë¥¼õÎªÔ­À´µÄ1/2
	elseif nGotAwardTime >= 18 then
		nExp = floor(nExp*1/4);	--µÚ18´ÎÖ®ºó£¬Ë¥¼õÎªÔ­À´µÄ1/4
	end; 
	ModifyExp(nExp);
	Msg2Player("B¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm");
end;
--±¦ÏäÌØÊâ½±Àø
function KH_Special_Award(nType)
	local nRand = 0;
	local nTeamSize = GetTeamSize();
	local nOldPlayerIdx = PlayerIndex;
	local tProb1 = {10,15,50};	--µÃÎäÆ÷µÄ¸ÅÂÊ
	local tProb2 = {0,0,1};	--µÃÊ¦ÃÅÎäÆ÷µÄÍ¼Ö½ËéÆ¬µÄ¸ÅÂÊ£¬µ¥Î»Íò·ÖÖ®Ò»
	local tProb3 = {0,0,20};	--µÃÃØ¼®ËéÆ¬µÄ¸ÅÂÊ
	nRand = random(1,100);
	if nRand <= tProb1[nType] then	--¸øÎäÆ÷
		if nTeamSize <= 1 then
--			KH_Add_Weapon();
		else
			for i=1,nTeamSize do
				PlayerIndex = GetTeamMember(i);
--				KH_Add_Weapon();
			end;
			PlayerIndex = nOldPlayerIdx;
		end;
	end;
	nRand = random(1,100);
	if nRand <= tProb3[nType] then	--¸øÃØ¼®ËéÆ¬
		if nTeamSize <= 1 then
			KH_Book_Frag();
		else
			for i=1,nTeamSize do
				PlayerIndex = GetTeamMember(i);
				KH_Book_Frag();
			end;
			PlayerIndex = nOldPlayerIdx;
		end;
	end;	
	nRand = random(1,100);
	local nNpcIdx = GetTaskTemp(KH_TASK_TEMP_BOX_INDEX);
	if nRand <= tProb2[nType] then	--¸øÊ¦ÃÅÎäÆ÷µÄÍ¼Ö½ËéÆ¬
		KH_Drop_Weapon_Map(nNpcIdx);	--»áÔÚÖÀÉ«×ÓºóÉ¾³ıNPC
	else
		SetTaskTemp(KH_TASK_TEMP_BOX_INDEX,0);
		SetNpcLifeTime(nNpcIdx,0);	--Èç¹û²»ÓÃÖÀÉ«×Ó¾ÍÉ¾³ıNPC
	end;
	PlayerIndex = nOldPlayerIdx;
end;
--¸øÒ»ÕÅÃØ¼®ËéÆ¬
--¸ÄÎª¸øÓèÒ»ÕÅÌ«Ò×»ìÔª¹¦Í¼¼ø edited by vivi
function KH_Book_Frag()
	local nCurMapID = GetWorldPos();
	local nRetCode = 0;
	if nCurMapID ~= MAP_ID then	--Èç¹û²»ÔÚÉ±ÊÖÌÃµØÍ¼¾Í²»ÄÜ»ñµÃ½±Àø
		return 0;
	end;
	nRetCode = AddItem(tItemInfo[2][2],tItemInfo[2][3],tItemInfo[2][4],1);
	if nRetCode == 1 then
		Msg2Player("B¹n ®­îc 1 "..tItemInfo[2][1]);
		WriteLog("[S¸t Thñ §­êng]::"..GetName().."NhËn ®­îc "..tItemInfo[2][1]);
	else
		WriteLog("[S¸t Thñ §­êng b¸o lçi]:"..GetName().."NhËn ®­îc"..tItemInfo[2][1].." thÊt b¹i, nRetCode:"..nRetCode);
	end;
end;
--Ôö¼ÓÒ»¸öÉñÃØÎïÆ·
function KH_Add_Random_Mystic_Thing(nCount)
	local nRand = 0;
	for i=1,nCount do
		nRand = random(1,getn(tMysticThing));
		if AddItem(tMysticThing[nRand][2],tMysticThing[nRand][3],tMysticThing[nRand][4],1) == 1 then
			Msg2Player("B¹n nhËn ®­îc mét vËt phÈm thÇn bİ:"..tMysticThing[nRand][1]);
		end;
	end;
end;
--»ñµÃÓëÂ·ÏßÏà¶ÔÓ¦µÄÎäÆ÷
function KH_Add_Weapon()
	local nCurMapID = GetWorldPos();
	if nCurMapID ~= MAP_ID then	--Èç¹û²»ÔÚÉ±ÊÖÌÃµØÍ¼¾Í²»ÄÜ»ñµÃ½±Àø
		return 0;
	end;
	local nRoute = GetPlayerRoute();
	local tWeaponList = tRouteInfo[nRoute][3];
	local nWeaponCount = getn(tWeaponList);
	local nRetCode = 0;
	if nWeaponCount > 0 then
		local nRand = random(1,nWeaponCount);
		nRetCode = AddItem(tWeaponList[nRand][2],tWeaponList[nRand][3],tWeaponList[nRand][4],1)
		if nRetCode == 1 then
			Msg2Player("B¹n nhËn ®­îc 1 "..tWeaponList[nRand][1]);
			WriteLog("[S¸t Thñ §­êng]::"..GetName().."NhËn ®­îc"..tWeaponList[nRand][1]);
		else
			WriteLog("[S¸t Thñ §­êng b¸o lçi]:"..GetName().."NhËn vò khİ thÊt b¹i, nRetCode:"..nRetCode);
		end;
	end;
end;
--»ñµÃ¶ÓÎéÀïÃæÔÚÉ±ÊÖÌÃµØÍ¼µÄ¶ÓÔ±ÈËÊı
function KH_Get_InMap_Member_Count()
	local nTeamSize = GetTeamSize();
	local nTeamMemberCount = 0;
	local nOldPlayerIdx = PlayerIndex;
	for i=1,nTeamSize do
		PlayerIndex = GetTeamMember(i);
		local nCurMapID = GetWorldPos()
		if nCurMapID == MAP_ID then
			nTeamMemberCount = nTeamMemberCount + 1;
		end;
	end;
	PlayerIndex = nOldPlayerIdx;
	return nTeamMemberCount;
end;
--µôÂäÉñ±ø¶ÍÔìÍ¼ËéÆ¬
--¸ÄÎª10ÕÅÌ«ÒÒ»ìÔª¹¦Í¼¼ø edited by vivi 
function KH_Drop_Weapon_Map(nNpcIdx)
	local nInMapMemberCount = KH_Get_InMap_Member_Count();
	local nTeamSize = GetTeamSize();
	local nRetCode = 0;
	if nTeamSize <= 1 then	--Èç¹ûÃ»×é¶Ó»ò¶ÓÎéÖ»ÓĞ×Ô¼ºÒ»¸öÈË
		nRetCode = AddItem(tItemInfo[3][2],tItemInfo[3][3],tItemInfo[3][4],10);
		if nRetCode == 1 then
			Msg2Player("B¹n nhËn ®­îc 10 tÊm "..tItemInfo[3][1]);
			WriteLog("[S¸t Thñ §­êng]::"..GetName().."NhËn ®­îc "..tItemInfo[3][1]);
		else
			WriteLog("[S¸t Thñ §­êng b¸o lçi]:"..GetName().."NhËn ®­îc"..tItemInfo[3][1].." thÊt b¹i, nRetCode:"..nRetCode);
		end;
		SetTaskTemp(KH_TASK_TEMP_BOX_INDEX,0);
		SetNpcLifeTime(nNpcIdx,0);
		return 0;
	end;
	if nNpcIdx <= 0 then
		return
	end
	local dwID = GetUnitCurStates(nNpcIdx, 3)	--1,2ºÅÊôĞÔÒÑ¾­±»ÓÃ
	if dwID == 0 then
		local nRet = ApplyItemDice(1, 100, 40, THIS_FILE_NAME, "KH_Time_Over", nInMapMemberCount,nNpcIdx)
		AddDiceItemInfo(nRet,tItemInfo[3][2],tItemInfo[3][3],tItemInfo[3][4],10);
		AddUnitStates(nNpcIdx, 3, nRet);
		local nPlayerOld = PlayerIndex;
		local nCurMapID = 0;
		for i=1, nTeamSize do
			PlayerIndex = GetTeamMember(i)
			nCurMapID = GetWorldPos();
			if nCurMapID == MAP_ID then
				RollItem(nRet);
			end;
		end
		PlayerIndex = nPlayerOld;
		return
	end
	local nState = GetItemDiceState(dwID)
	if nState == 0 then
		Msg2Player("§ang gi¸m ®Şnh thuéc tİnh vËt phÈm!")
	elseif nState == 1 then
		local n = DiceLootItem(dwID)
		if n == 0 then
			gf_Msg2Team(GetName().."NhËn ®­îc "..tItemInfo[3][1],1)
		elseif n == 1 then
			Msg2Player("Hµnh trang kh«ng cßn trèng, kh«ng thÓ nhËn vËt phÈm")
		end
	elseif nState == 2 then
		--Msg2Player("Ïä×ÓÖĞÒÑ¾­Ã»ÓĞÎïÆ·ÁË")
	end
end
--É«×ÓÍê³É´¦Àí
function KH_Time_Over(dwID)
	local t, nSize = GetItemDiceRollInfo(dwID)
	local bAllGiveUp = 1
	for index, value in t do
		local str = value[1].."NĞm"..value[2].." ®iÓm"
		if value[3] == 0 then
			str = value[1].."Phãng"
		elseif value[3] == 1 then
			str = str.." (TuyÕt cÇu)"
			if value[4] == 1 then
				str = str.." -- NhËn ®­îc "..tItemInfo[3][1]
				WriteLog("[S¸t Thñ §­êng]::"..value[1].."NhËn ®­îc "..tItemInfo[3][1]);
			end
			bAllGiveUp = 0
		elseif value[3] == 2 then
			str = str.." (Tham lam)"
			if value[4] == 1 then
				str = str.." -- NhËn ®­îc "..tItemInfo[3][1]
				WriteLog("[S¸t Thñ §­êng]::"..value[1].."NhËn ®­îc "..tItemInfo[3][1]);
			end
			bAllGiveUp = 0
		end
		Msg2Player(str)
	end
	if bAllGiveUp == 1 then
		Msg2Player("TÊt c¶ ng­êi ch¬i ®· bá cuéc")
	elseif nSize ~= getn(t) then
		Msg2Player("Nh÷ng ng­êi ch¬i kh¸c ®· v­ît qu¸ thêi gian, xem nh­ bá cuéc")
	end
	local nNpcIdx = GetTaskTemp(KH_TASK_TEMP_BOX_INDEX);
	if nNpcIdx > 0 then
		if GetNpcWorldPos(nNpcIdx) == MAP_ID then
			SetNpcLifeTime(nNpcIdx,0);
		else
			WriteLog("[S¸t Thñ §­êng b¸o lçi]:"..GetName().."§­êng dÉn t×m NPC bŞ sai:"..GetNpcName(nNpcIdx));
		end;
		SetTaskTemp(KH_TASK_TEMP_BOX_INDEX,0);
	end
end
--Çå³ıËùÓĞµØÍ¼±äÁ¿
function KH_Clear_Map_Value()
	for i=MAPV_BEGIN,MAPV_END do
		SetMapTaskTemp(MAP_ID,i,0);
	end;
end;
--¼ì²é¿ªÏä×ÓÊıÊÇ·ñÒì³£
function KH_Check_Box_Count()
	local nBox1Count = GetMapTaskTemp(MAP_ID,MAPV_OPENED_BOX1_COUNT);
	local nBox2Count = GetMapTaskTemp(MAP_ID,MAPV_OPENED_BOX2_COUNT);
	local nBox3Count = GetMapTaskTemp(MAP_ID,MAPV_OPENED_BOX3_COUNT);
	--ÓÉÓÚ¼ÓÈëÁËIBµÀ¾ß¿ÉÒÔ´´½¨BOSS£¬ËùÒÔÕâ¸ö¼ì²é¾ÍÃ»±ØÒªÁË0
	if nBox1Count > MAX_BOX1_COUNT or nBox2Count > MAX_BOX2_COUNT or nBox3Count > MAX_BOX3_COUNT then
		--SetMapTaskTemp(MAP_ID,MAPV_OPEN_BOX_FORBIDDEN,1);
		--gf_ShowDebugInfor("Ïä×ÓÊıÁ¿Òì³££¡£¡£¡£¡nBox1Count:"..nBox1Count.."£¬nBox2Count:"..nBox2Count.."£¬nBox3Count:"..nBox3Count);
	end;
end;

--2009Äê8ÔÂ»î¶¯½±Àø
function VIET_0908_Aword(nType)
	if tonumber(date("%y%m%d")) >= 090807 and tonumber(date("%y%m%d")) < 090907 then
		local nDayWeek = tonumber(date("%w"));
		if nDayWeek == 0 or nDayWeek == 1 or nDayWeek == 5 or nDayWeek == 6 then 
			if GetTask(2081) < tonumber(date("%y%m%d")) then
				SetTask(2082, 0);
			end
			if GetTask(2082) >= 5000000 then return end;
			local nRand = random(1, 100);
			local nExp = 0;
			if nType == NPC_TYPE_XIANGZHU then
				if nRand <= 20 then
					nExp = 100000;
				elseif nRand > 20 and nRand <= 40 then
					nExp = 200000;
				else
					nExp = 300000;
				end
			elseif nType == NPC_TYPE_FUTANGZHU then
				if nRand <= 40 then
					nExp = 100000;
				elseif nRand > 40 and nRand <= 80 then
					nExp = 200000;
				else
					nExp = 300000;
				end
			elseif nType == NPC_TYPE_LIDAZUI then
				if nRand <= 45 then
					nExp = 100000;
				elseif nRand > 45 and nRand <= 90 then
					nExp = 200000;
				else
					nExp = 300000;
				end
			end
			ModifyExp(nExp);
			SetTask(2082, GetTask(2082) + nExp);
			SetTask(2081, tonumber(date("%y%m%d")));
		end
	end
end

tFruitAward = {
	{"Cam", 2, 1, 30166},
	{"B­ëi", 2, 1, 30169},
	{"D©u", 2, 1, 30170},
}

function VIET_1005_Award(nType)
	local nRand = random(1, 100)
	local nAward = 0
	local nQuanlity = 0
	
	if nType == NPC_TYPE_XIANGZHU then
		nAward = 1
		nQuanlity = 1
	elseif nType == NPC_TYPE_FUTANGZHU then
		if nRand <= 60 then
			nAward = 1
			nQuanlity = 2
		else
			nAward = 2
			nQuanlity = 2
		end
	elseif nType == NPC_TYPE_LIDAZUI then
		if nRand <= 40 then
			nAward = 1
			nQuanlity = 3
		elseif nRand <= 70 then
			nAward = 2
			nQuanlity = 3
		else
			nAward = 3
			nQuanlity = 3
		end
	end
	
	local nTeamSize = GetTeamSize();
	local nOldPlayerIdx = PlayerIndex;
	if nTeamSize > 1 then
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i)
			if GetWorldPos() ~= MAP_ID then
				break
			end
			if IsPlayerDeath() == 0 then
				gf_AddItemEx2({tFruitAward[nAward][2], tFruitAward[nAward][3], tFruitAward[nAward][4], nQuanlity}, tFruitAward[nAward][1], "Sat Thu Duong", "nhËn")
			end
		end
		PlayerIndex = nOldPlayerIdx
	else
		if GetWorldPos() ~= MAP_ID then
			return 0
		end
		if IsPlayerDeath() == 0 then
			gf_AddItemEx2({tFruitAward[nAward][2], tFruitAward[nAward][3], tFruitAward[nAward][4], nQuanlity}, tFruitAward[nAward][1], "Sat Thu Duong", "nhËn")
		end
	end
end

function VIET_1009_DoQuest(nType)
	local nStatus = floor(mod(GetTask(KH_QUEST_TSK), 100)/10)
	if nStatus > 0 then
		if nStatus < 2 then
			SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) + 10)
		end
		local nBox1 = floor(mod(GetTask(KH_QUEST_TSK), 1000)/100)
		local nBox2 = floor(mod(GetTask(KH_QUEST_TSK), 10000)/1000)
		local nBox3 = floor(mod(GetTask(KH_QUEST_TSK), 100000)/10000)
	
		if nType == NPC_TYPE_XIANGZHU and nBox1 == 0 then
			SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) + 100)
			--gf_AddItemEx2({2,1,30176,1}, "T¸o", "Nhiem vu STD", "nhËn")
		elseif nType == NPC_TYPE_FUTANGZHU and nBox2 == 0 then
			SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) + 1000)
			--gf_AddItemEx2({2,1,30176,2}, "T¸o", "Nhiem vu STD", "nhËn")
		elseif nType == NPC_TYPE_LIDAZUI and nBox3 == 0 then
			SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) + 10000)
			--gf_AddItemEx2({2,1,30176,4}, "T¸o", "Nhiem vu STD", "nhËn")
		end
		Msg2Player("Hoµn thµnh nhiÖm vô më r­¬ng!")
	end
end

function VIET_1010_Bhta4(nType)
	local nTeamSize = GetTeamSize();
	local nOldPlayerIdx = PlayerIndex;
	if nTeamSize > 1 then
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i)
			if GetWorldPos() ~= MAP_ID then
				break
			end
			if IsPlayerDeath() == 0 then
				if nType == NPC_TYPE_XIANGZHU then
					gf_AddItemEx2({2,0,1162,5}, "Hoa Hång §á", "Bang Hoi Tinh Anh 4", "më r­¬ng H­¬ng Chñ")
				elseif nType == NPC_TYPE_FUTANGZHU then
					gf_AddItemEx2({2,0,1162,10}, "Hoa Hång §á", "Bang Hoi Tinh Anh 4", "më r­¬ng Phã §­êng Chñ")
				elseif nType == NPC_TYPE_LIDAZUI then
					gf_AddItemEx2({2,0,1164,1}, "Hoa Hång PhÊn", "Bang Hoi Tinh Anh 4", "më r­¬ng Lı §¹i Chñy")
				end
			end
		end
		PlayerIndex = nOldPlayerIdx
	else
		if GetWorldPos() ~= MAP_ID then
			return 0
		end
		if IsPlayerDeath() == 0 then
			if nType == NPC_TYPE_XIANGZHU then
				gf_AddItemEx2({2,0,1162,5}, "Hoa Hång §á", "Bang Hoi Tinh Anh 4", "më r­¬ng H­¬ng Chñ")
			elseif nType == NPC_TYPE_FUTANGZHU then
				gf_AddItemEx2({2,0,1162,10}, "Hoa Hång §á", "Bang Hoi Tinh Anh 4", "më r­¬ng Phã §­êng Chñ")
			elseif nType == NPC_TYPE_LIDAZUI then
				gf_AddItemEx2({2,0,1164,1}, "Hoa Hång PhÊn", "Bang Hoi Tinh Anh 4", "më r­¬ng Lı §¹i Chñy")
			end
		end
	end
end

function VIET_1103_BHTA6(nType)
	local nTeamSize = GetTeamSize();
	local nOldPlayerIdx = PlayerIndex;
	if nTeamSize > 1 then
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i)
			if GetWorldPos() ~= MAP_ID then
				break
			end
			if IsPlayerDeath() == 0 then
				if nType == NPC_TYPE_XIANGZHU then
					gf_AddItemEx2({2,0,1164,5}, "Hoa Hång PhÊn", "Bang Hoi Tinh Anh 6", "më r­¬ng H­¬ng Chñ")
				elseif nType == NPC_TYPE_FUTANGZHU then
					gf_AddItemEx2({2,0,1164,10}, "Hoa Hång PhÊn", "Bang Hoi Tinh Anh 6", "më r­¬ng Phã §­êng Chñ")
				elseif nType == NPC_TYPE_LIDAZUI then
					gf_AddItemEx2({2,1,30255,5}, "Hoa Hång Vµng", "Bang Hoi Tinh Anh 6", "më r­¬ng Lı §¹i Chñy")
				end
			end
		end
		PlayerIndex = nOldPlayerIdx
	else
		if GetWorldPos() ~= MAP_ID then
			return 0
		end
		if IsPlayerDeath() == 0 then
			if nType == NPC_TYPE_XIANGZHU then
				gf_AddItemEx2({2,0,1164,5}, "Hoa Hång PhÊn", "Bang Hoi Tinh Anh 6", "më r­¬ng H­¬ng Chñ")
			elseif nType == NPC_TYPE_FUTANGZHU then
				gf_AddItemEx2({2,0,1164,10}, "Hoa Hång PhÊn", "Bang Hoi Tinh Anh 6", "më r­¬ng Phã §­êng Chñ")
			elseif nType == NPC_TYPE_LIDAZUI then
				gf_AddItemEx2({2,1,30255,5}, "Hoa Hång Vµng", "Bang Hoi Tinh Anh 6", "më r­¬ng Lı §¹i Chñy")
			end
		end
	end
end