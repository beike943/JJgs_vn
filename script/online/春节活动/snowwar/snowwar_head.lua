--Create Date:2006Äê×îºóÒ»Ìì
--Describe:£°£·Äê´º½ÚÑ©ÕÌMissionÍ·ÎÄ¼ş
--Author:yanjun
Include("\\script\\online\\´º½Ú»î¶¯\\newyear_head.lua")	
Include("\\script\\lib\\globalfunctions.lua");

DEBUG_VERSION = 1;
--===============================ÒÔÏÂÊÇÏµÍ³Ïà¹Ø³£Á¿=========================================
FRAME_PER_SECOND = 18;								--ÓÎÏ·ÔËĞĞËÙ¶È£ºÃ¿Ãë£±£¸Ö¡
FRAME_PER_MIN = 60*FRAME_PER_SECOND;				--Ã¿·ÖÖÓÓÎÏ·Ö¡Êı

GLB_SNOWWAR_TIME = 4580;								--·şÎñÆ÷È«¾Ö±äÁ¿£¬¼ÇÂ¼µ±Ç°Ñ©ÕÌ³¡µØµÄĞÅÏ¢
--===============================ÒÔÏÂÊÇMissionÏà¹Ø³£Á¿======================================
MISSION_ID = 31;									--MissionµÄID

TIMER_ID = 59;										--Mission¼ÆÊ±Æ÷µÄID
TIMER_INTERVAL = 30*FRAME_PER_SECOND;				--¼ÆÊ±Æ÷´¥·¢µÄÊ±¼ä¼ä¸ô£¬µ¥Î»Ãë
TIMER_COUNT = (30*FRAME_PER_MIN/TIMER_INTERVAL)-1;	--×ÜµÄ¼ÆÊ±´ÎÊı£¬£³£°·ÖÖÓ
TIMER_WAITOUT_COUNT = (20*FRAME_PER_MIN/TIMER_INTERVAL)-1;--ÁìÈ¡½±ÀøÊ±¼ä£¬£²£°·ÖÕë

MV_FIELD_STATE = 1;									--¼ÇÂ¼Ñ©ÕÌ³¡µØµÄ×´Ì¬
MV_TIMER_LOOP = 2;									--¼ÇÂ¼¼ÆÊ±Æ÷µÄ

MS_STATE_PEACE = 0;									--³¡µØ¿ÕÏĞ
MS_STATE_READY = 1;									--×¼±¸½×¶Î
MS_STATE_FIGHT = 2;									--¿ªÕ½½×¶Î
MS_STATE_COMPLETE = 3;								--µÈ´ı½áÊø½×¶Î
--===============================ÒÔÏÂÊÇÍæ¼ÒÈÎÎñ±äÁ¿=========================================
PT_STATUS = 1715;									--ÌØÊâÈÎÎñ±äÁ¿£¬µ±ËüµÄÖµÎª£²Ê±£¬Íæ¼Ò²»ÄÜÈÎºÎ×°±¸
PT_POINT = 2380;									--¸öÈË»ı·Ö
PT_SIGNUP_TIME = 2381;								--²Î¼ÓÄ³³¡Ñ©ÕÌµÄĞÅÏ¢
PT_KILL_COUNT = 2382;								--É±ËÀÍæ¼Ò´ÎÊı	
PT_DEATH_COUNT = 2383;								--±»É±´ÎÊı0
--===============================ÒÔÏÂÊÇÆäËü³£Á¿=============================================
tMAP_CITY_FIELD =									--³ÇÊĞÓëÑ©ÕÌµØÍ¼µÄ¶ÔÓ¦¹ØÏµ
{	
	{100,963,"TuyÒn Ch©u"},	--ÈªÖİ
	{200,962,"BiÖn Kinh"},	--ãê¾©
	{300,961,"Thµnh §«"},	--³É¶¼
}

tBORN_POS = 										--³¡µØÀïÃæµÄÖØÉúµã
{
	{1859,3230},
	{1664,3654},
	{1664,3229},
	{1854,3654}
}

tEXIT_POS = 
{
	{100,1365,2932},	--ÈªÖİ
	{200,1409,3048},	--ãê¾©
	{300,1820,3573},	--³É¶¼
}

LOG_ID = 203;										--µÇÂ½´¥·¢Æ÷ID
LOG_CUSTOM_ID = 3017;								--µÇÂ½´¥·¢Æ÷×Ô¶¨Òå±àºÅ

MAX_PLAYER = 100;									--×î´óÈËÊı
BASE_POINT = 10;									--Ô­Ê¼·Ö
LIMIT_POINT = 50;									--»ı·ÖÉÏÏŞ
--===============================ÒÔÏÂÊÇ¹«¹²º¯Êı=============================================
--´´½¨Ïà¹ØµÄNPC
function SW_CreateSnowWarNpc()
	local nCityMapID,nFieldID,nIndex = SW_GetMapIDFromSubWorld(SubWorld);
	local npcIndex = CreateNpc("Giang hå hµo kiÖt","Xa phu_nĞm tuyÕt",nFieldID,1665,3652)
	SetNpcScript(npcIndex,"\\script\\online\\´º½Ú»î¶¯\\³É¶¼Ñ©ÕÌ´«ËÍÈËout.lua")
	npcIndex = CreateNpc("Giang hå hµo kiÖt","Xa phu_nĞm tuyÕt",nFieldID,1665,3224)
	SetNpcScript(npcIndex,"\\script\\online\\´º½Ú»î¶¯\\³É¶¼Ñ©ÕÌ´«ËÍÈËout.lua")
	npcIndex = CreateNpc("Giang hå hµo kiÖt","Xa phu_nĞm tuyÕt",nFieldID,1857,3226)
	SetNpcScript(npcIndex,"\\script\\online\\´º½Ú»î¶¯\\³É¶¼Ñ©ÕÌ´«ËÍÈËout.lua")
	npcIndex = CreateNpc("Giang hå hµo kiÖt","Xa phu_nĞm tuyÕt",nFieldID,1856,3652)
	SetNpcScript(npcIndex,"\\script\\online\\´º½Ú»î¶¯\\³É¶¼Ñ©ÕÌ´«ËÍÈËout.lua")	
end;
--ÉèÖÃÍæ¼ÒµÄÒ»Ğ©×´Ì¬
function SW_SetPlayerState()
	SW_NewSnowWarClear();
	AddItem(2,3,216,50)
	Msg2Player("B¹n nhËn ®­îc 50 ®¹n TiÓu TuyÕt CÇu.")
	local nBornPos = random(1,getn(tBORN_POS))
	local nMapID = GetWorldPos();
	local nSnowWarMapID = SW_GetFieldIDFromMapID(nMapID);
	SetTempRevPos(nSnowWarMapID,tBORN_POS[nBornPos][1]*32,tBORN_POS[nBornPos][2]*32)	--Ëæ»úÖØÉúµã
	SetDeathScript("\\script\\online\\´º½Ú»î¶¯\\playerdeath.lua")
	SetDeathPunish(0)
	SetFightState(0)
	SetPKFlag(2,1)
	ForbidChangePK(1);	--½ûÖ¹¸Ä±äPK×´Ì¬
	UseScrollEnable(0)
	LeaveTeam();	--Àë¿ª¶ÓÎé
	SetLogoutRV(1);	--ÉèÖÃµÇÂ½µãÎª³ÇÊĞÖØÉúµã
	ForbitTrade(1);	--½ûÖ¹½»Ò×
	StallEnable(0);	--½ûÖ¹°ÚÌ¯(ÏÂÏßºó»á±»Çåµô)
	CreateTrigger(3,LOG_ID,LOG_CUSTOM_ID);
	for SkillID=843,851 do
		LearnSkill(SkillID)	--Ñ§»á´òÑ©ÕÌ¼¼ÄÜ
	end
	Msg2Player("B¹n ®· häc ®­îc tÊt c¶ c¸c kü n¨ng sö dông tuyÕt cÇu, nhÊp chuét ph¶i vµo biÓu t­îng kü n¨ng ®Ó chän kü thuËt t­¬ng øng.");
	Say("B¹n ®· häc ®­îc tÊt c¶ c¸c kü n¨ng sö dông tuyÕt cÇu, nhÊp chuét ph¶i vµo biÓu t­îng kü n¨ng ®Ó chän kü thuËt t­¬ng øng.",0);
	SetTask(PT_SIGNUP_TIME,GetGlbValue(GLB_SNOWWAR_TIME));
	SetLRSkill(843,0);
	SetTask(PT_STATUS,2);
end;
--»Ö¸´Íæ¼ÒµÄÒ»Ğ©×´Ì¬
function SW_RestorePlayerState()
	SetTempRevPos(0,0,0);
	SetDeathScript("");
	SetDeathPunish(1);
	SetFightState(0);
	ForbidChangePK(0);	--ÔÊĞí¸Ä±äPK×´Ì¬
	SetPKFlag(0,0);
	UseScrollEnable(1);
	SetLogoutRV(0);
	ForbitTrade(0);
	InteractiveEnable(1);
	StallEnable(1);
	RemoveTrigger(GetTrigger(LOG_CUSTOM_ID));
	for SkillID=843,851 do
		if HaveLearnedSkill(SkillID) == 1 then
			RemoveSkill(SkillID)	--Íü¼Ç´òÑ©ÕÌ¼¼ÄÜ
		end;
	end
	SetTask(PT_STATUS,0);
	for i=216,221 do	--É¾³ıÑ©Çò
		local nItemCount = BigGetItemCount(2,3,i);
		if nItemCount > 0 then
			BigDelItem(2,3,i,nItemCount)	
		end;
	end;
end;
--ÓÉµØÍ¼ID»ñµÃÄ¿±êÑ©ÕÌµØÍ¼µÄID
function SW_GetFieldIDFromMapID(nMapID)
	for i=1,getn(tMAP_CITY_FIELD) do
		if tMAP_CITY_FIELD[i][1] == nMapID then
			return tMAP_CITY_FIELD[i][2]
		end;
	end;
	return 0;
end;
--ÓÉÑ©ÕÌµØÍ¼Ë÷Òı»ñµÃÏàÓ¦µÄ³ÇÊĞµØÍ¼IDºÍÑ©ÕÌµØÍ¼IDÒÔ¼°¶ÔÓ¦ÔÚ±íÀïµÄË÷Òı
--ÕâÀï¿ÉÒÔÊ¹ÓÃSubWorldIdx2IDÖ¸ÁîÖ±½Ó´ÓµØÍ¼Ë÷Òı£¨idx£©»ñÈ¡µØÍ¼ID
function SW_GetMapIDFromSubWorld(nFieldSubWorld)
	for i=1,getn(tMAP_CITY_FIELD) do
		if SubWorldID2Idx(tMAP_CITY_FIELD[i][2]) == nFieldSubWorld then
			return tMAP_CITY_FIELD[i][1],tMAP_CITY_FIELD[i][2],i;
		end;
	end;
	return 0,0,0;
end;
--Ñ©ÕÌ³õÊ¼»¯Ê±Òª×öµÄÒ»Ğ©²Ù×÷
function SW_InitSnowWar()
	SetGlbValue(GLB_SNOWWAR_TIME,tonumber(date("%y%m%d%H")));
	SW_CreateSnowWarNpc();
	RunMission(MISSION_ID);
	WriteLog("[nĞm tuyÕtn¨m 2007]: Ho¹t ®éng nĞm tuyÕt ®· kÕt thóc, ID nĞm tuyÕt"..GetGlbValue(GLB_SNOWWAR_TIME));
end;
--Ñ©ÕÌ¿ªÊ¼Ê±MissionÒª×öµÄÒ»Ğ©²Ù×÷
function SW_RunSnowWar()
	gf_ShowDebugInfor("MISSION_ID:"..MISSION_ID.." TIMER_ID:"..TIMER_ID.." TIMER_INTERVAL:"..TIMER_INTERVAL);
	StartMissionTimer(MISSION_ID,TIMER_ID,TIMER_INTERVAL);
	SetMissionV(MV_TIMER_LOOP,TIMER_COUNT);
	SetMissionV(MV_FIELD_STATE,MS_STATE_FIGHT);	--¿ªÕ½×´Ì¬
end;
--Ñ©ÕÌ½áÊøÊ±MissionÒª×öµÄÒ»Ğ©²Ù×÷
function SW_EndSnowWar()
	local nCityMapID,nFieldID,nIndex = SW_GetMapIDFromSubWorld(SubWorld);
	StopMissionTimer(MISSION_ID,TIMER_ID);
	ClearMapNpc(nFieldID);
	Msg2SubWorld(tMAP_CITY_FIELD[nIndex][3].." nĞm tuyÕt ®· kÕt thóc.");
	SW_DelAllMSPlayer();
	SetMissionV(MV_FIELD_STATE,MS_STATE_PEACE);
	WriteLog("[nĞm tuyÕtn¨m 2007]: Ho¹t ®éng nĞm tuyÕt ®· kÕt thóc, ID nĞm tuyÕt"..GetGlbValue(GLB_SNOWWAR_TIME));
end;
--Íæ¼ÒÀë¿ªÑ©ÕÌ
function SW_LeaveSnowWar()
	local nCityMapID,nFieldID,nIndex = SW_GetMapIDFromSubWorld(SubWorld);
	Msg2MSAll(MISSION_ID,GetName().."Rêi khái khu nĞm tuyÕt")
	SW_RestorePlayerState();
	NewWorld(tEXIT_POS[nIndex][1],tEXIT_POS[nIndex][2],tEXIT_POS[nIndex][3])
end;
--Íæ¼Ò¼ÓÈëÑ©ÕÌ
function SW_JoinSnowWar()
	local nRandPos = random(1,getn(tBORN_POS));
	local nMapID = GetWorldPos();
	local nFieldID = SW_GetFieldIDFromMapID(nMapID);
	CleanInteractive();
	SW_SetPlayerState();
	if NewWorld(nFieldID,tBORN_POS[nRandPos][1],tBORN_POS[nRandPos][2]) == 1 then
		RemvoeTempEffect()
		Msg2MSAll(MISSION_ID,GetName().."Vµo khu nĞm tuyÕt")
		InteractiveEnable(0);	--¹Ø±Õ½»»¥	±ØĞëÔÚNewWorldÖ®ºóÖ´ĞĞ²ÅÓĞĞ§
		AddMSPlayer(MISSION_ID,0);
	else
		WriteLog("[nĞm tuyÕt]:"..GetName().."Vµo chiÕn ®Şa NewWorld thÊt b¹i!!!");
	end;
end;
--É¾³ıËùÓĞÔÚÑ©ÕÌ³¡µØÀïÃæµÄÍæ¼Ò
function SW_DelAllMSPlayer()
	local tPlayer = mf_GetMSPlayerIndex(MISSION_ID,0);
	local nOldPlayerIndex = PlayerIndex;
	gf_ShowDebugInfor("Sè l­îng ng­êi ch¬i:"..getn(tPlayer));
	for i=1,getn(tPlayer) do
		PlayerIndex = tPlayer[i];
		if PlayerIndex > 0 then
			gf_ShowDebugInfor("H­íng dÉn ng­êi ch¬i:"..PlayerIndex);
			--SetTask(PT_SIGNUP_TIME,0);	--²âÊÔ½×¶ÎÊ¹ÓÃ
			DelMSPlayer(MISSION_ID,0);
		end
	end;
	PlayerIndex = nOldPlayerIndex;
end;
--¼ÆÊ±Æ÷´¦ÀíÔÚÑ©ÕÌ¿ªÊ¼½×¶ÎµÄÒ»Ğ©ÊÂÇé
function SW_ProcessFightTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		SetMissionV(MV_FIELD_STATE,MS_STATE_COMPLETE);
		SetMissionV(MV_TIMER_LOOP,TIMER_WAITOUT_COUNT);
		Msg2MSAll(MISSION_ID,"Thêi gian nĞm tuyÕt ®· kÕt thóc, xin c¸c vŞ ®Õn gÆp TuyÕt Gi¶ ®Ó nhËn phÇn th­ëng.");
		local fFunc = function(tArg)
			Say("Thêi gian nĞm tuyÕt ®· kÕt thóc, xin c¸c vŞ ®Õn gÆp TuyÕt Gi¶ ®Ó nhËn phÇn th­ëng.",0);
			SetFightState(0);
		end;
		mf_OperateAllPlayer(MISSION_ID,fFunc,{},0);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"TiÕn ®é thêi gian: ["..(TIMER_COUNT-nLoop+1)..":"..(TIMER_COUNT+1).."]");
	end;
end;
--¼ÆÊ±Æ÷´¦ÀíÔÚÑ©ÕÌ½áÊøºóÄÇ¶ÎÊ±¼äµÄÒ»Ğ©ÊÂÇé
function SW_ProcessWaitOutTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		CloseMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		if mod(nLoop,2) == 0 then
			Msg2MSAll(MISSION_ID,"TÊt c¶ mäi ng­êi dïng ®iÓm tİch lòy cña m×nh ®æi phÇn th­ëng."..(nLoop/2).." phót.");
		end;
	end;
end;
--Ñ©ÕÌ¼ò½é
function SW_KnowSnowWar()
	Talk(3,"","<color=green>"..g_sNpcName.."<color>: Kü n¨ng kh¸c nhau sÏ tiªu hao TuyÕt CÇu kh¸c nhau. Mçi ngµy vµo khu nĞm tuyÕt sÏ ®­îc ph¸t 50 TuyÕt CÇu miÔn phİ, còng cã thÓ mua t¹i TuyÕt Gi¶.","<color=green>"..g_sNpcName.."<color>: T¹i TuyÒn Ch©u, Thµnh §« vµ BiÖn Kinh c¶ 3 khu vùc ®Òu cã TuyÕt Gi¶","<color=green>"..g_sNpcName.."<color>: Chó ı: Trong khu vùc nĞm tuyÕt kh«ng thÓ sö dông Håi Thµnh phï hay MËt Hµm cña s­ phô.")
end;
--½øÈëĞÂµÄÑ©ÕÌÕ½³¡Ê±Òª×öµÄ²Ù×÷
function SW_NewSnowWarClear()
	if GetGlbValue(GLB_SNOWWAR_TIME) - GetTask(PT_SIGNUP_TIME) >= 1 or GetGlbValue(GLB_SNOWWAR_TIME) == 0 then
		SetTask(PT_POINT,BASE_POINT);--Çå³ı¸öÈË»ı·Ö£¬Õâ¸öÒª×ßSystemTimeTask²ÅÓĞÓÃ
		SetTask(PT_KILL_COUNT,0);
		SetTask(PT_DEATH_COUNT,0);
		return 1;
	end;
	return 0;
end;
--¼ì²éÉíÉÏÊÇ·ñ×°ÓĞÍâ×°Ö®ÍâµÄ×°±¸
function SW_CheckEquipment()
	for i=0,11 do
		if i~= 6 and i~= 7 and i~= 8 then
			local nGenre,nDetail,nParticular = GetPlayerEquipInfo(i);
			if nGenre ~= 0 or nDetail ~= 0 or nParticular ~= 0 then
				return 0;
			end;
		end;
	end;
	return 1;
end;
--µÇÂ½´¥·¢Æ÷¡£ÎªÁË¼õÉÙÎÄ¼şÊıÁ¿£¬ÒÔºó´òËã²»ÔÙµ¥¶À´´½¨Ò»¸ötrigger½Å±¾ÁË¡£
function OnLogin()
	SW_RestorePlayerState();
end;

function nothing()

end