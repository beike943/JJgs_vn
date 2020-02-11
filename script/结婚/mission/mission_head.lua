MISSION_ID = 32;
TIMER_ID = 60;
--========================================================================================
FRAME_PER_SECOND = 18;								--ÓÎÏ·ÔËÐÐËÙ¶È£ºÃ¿Ãë£±£¸Ö¡
FRAME_PER_MIN = 60*FRAME_PER_SECOND;				--Ã¿·ÖÖÓÓÎÏ·Ö¡Êý

READY_TIME = 30;--»éÀñ³¡µØ×¼±¸Ê±¼ä£¬30·ÖÖÓ
STARTED_TIME = 60;--¾ÙÐÐ»éÀñÊ±¼ä£¬60·ÖÖÓ
WAITOUT_TIME = 5;--µÈ´ýÍË³¡Ê±¼ä£¬5·ÖÖÓ

READY_TIMER_INTERVAL = 5*FRAME_PER_MIN;	--¼ÆÊ±Æ÷´¥·¢µÄÊ±¼ä¼ä¸ô£¬µ¥Î»·ÖÖÓ,ÕâÀïÖ¸5·ÖÕë
READY_TIMER_COUNT = (READY_TIME*FRAME_PER_MIN/READY_TIMER_INTERVAL)-1;	
STARTED_TIMER_INTERVAL = 5*FRAME_PER_MIN;					
STARTED_TIMER_COUNT = (STARTED_TIME*FRAME_PER_MIN/STARTED_TIMER_INTERVAL)-1;	
WAITOUT_TIMER_INTERVAL = 1*FRAME_PER_MIN;
WAITOUT_TIMER_COUNT = (WAITOUT_TIME*FRAME_PER_MIN/WAITOUT_TIMER_INTERVAL)-1;	
--========================================================================================
MS_BRIDEGROOM =1;
MS_BRIDE = 2;
--========================================================================================
MV_FIELD_STATE = 1;									--¼ÇÂ¼½á»é³¡µØµÄ×´Ì¬
MV_TIMER_LOOP = 2;									--¼ÇÂ¼¼ÆÊ±Æ÷µ±Ç°µÄ¼ÆÊý
MV_WEDDING_ID = 3;									--¼ÇÂ¼»éÀñµÄID

MV_FOOD_BEGIN = 11;
--11ÖÁ28
MV_FOOD_END = 28;

MV_DAHONGBAO_COUNT = 29;
MV_ZHONGHONGBAO_COUNT = 30;
MV_XIAOHONGBAO_COUNT = 31;
MV_CAN_MARRY = 32;	--ÊÇ·ñ¿ÉÒÔ°ÝÌÃ³É»é£¬1ÊÇ£¬0·ñ
MV_LIHUA_COUNT = 33;	--³¡µØÀïµÄÀñ»¨ÊýÄ¿
MV_XINIANG_INDEX = 34;	--Ï²ÄïµÄNPCË÷Òý
--========================================================================================
MS_STATE_IDEL = 0;									--³¡µØ¿ÕÏÐ
MS_STATE_READY = 1;									--×¼±¸½×¶Î
MS_STATE_STARTED = 2;								--¿ªÕ½½×¶Î
MS_STATE_COMPLETE = 3;								--µÈ´ý½áÊø½×¶Î
--=========================================================================================
LOG_ID = 204;										--µÇÂ½´¥·¢Æ÷ID
LOG_CUSTOM_ID = 3018;								--µÇÂ½´¥·¢Æ÷×Ô¶¨Òå±àºÅ
--=========================================================================================
CAMP_ALL = 0;	--ËùÓÐÈË
CAMP_COUPLE = 1;--ÐÂÈË
CAMP_FRIEND = 2;--Ç×ÓÑ
--=========================================================================================
SKILL_CANDY	= 870		-- ¼¼ÄÜID£ºÈöÏ²ÌÇ
--=========================================================================================
--»éÀñ³¡µØ³õÊ¼»¯£¬Ö»ÒªÐÂÈËºÍÖ÷»éÈË²ÅÄÜ½ø³¡
function MR_InitMarryField()
	SetMissionV(MV_FIELD_STATE,MS_STATE_READY);
	SetMissionV(MV_TIMER_LOOP,READY_TIMER_COUNT);
	StartMissionTimer(MISSION_ID,TIMER_ID,READY_TIMER_INTERVAL);
	local nMapID = SubWorldIdx2ID(SubWorld);
	local nFieldID = map_field2type[nMapID];
	local nWeddingID = date("%y%m%d%H")..nFieldID;
	MR_CreateMapNPC(nFieldID);
	MR_CreateMapTrap(nFieldID);
	SetMissionV(MV_WEDDING_ID,nWeddingID);
	WriteLog("[KÕt h«n]: H«n lÔ b¾t ®Çu, ID h«n lÔ lµ:"..nWeddingID);
end;
--»éÀñÕýÊ½¿ªÊ¼£¬Ç×ÓÑ¿ÉÒÔÈë³¡
function MR_StartMarry()
	--ÕýÊ½¿ªÊ¼»éÀñ
	Msg2MSAll(MISSION_ID,"H«n lÔ chÝnh thøc b¾t ®Çu, cã thÓ mêi ng­êi th©n vµo tham dù!");
end;
--»éÀñ½áÊø
function MR_EndMarry()
	SetMissionV(MV_FIELD_STATE,MS_STATE_IDEL)
	local nWeddingID = GetMissionV(MV_WEDDING_ID);
	local nMapID = SubWorldIdx2ID(SubWorld);
	mf_DelAllMSPlayer(MISSION_ID,CAMP_ALL);
	ClearMapNpc(nMapID);
	ClearMapTrap(MAPID);
	WriteLog("[KÕt h«n]: H«n lÔ kÕt thóc, ID h«n lÔ lµ:"..nWeddingID);
	local nXiNiang = GetMissionV(MV_XINIANG_INDEX);
	local szXiNiang = GetNpcName(nXiNiang);
	WriteLog("[KÕt h«n]: S©n khÊu kÕt h«n ®· ®ãng, NPC Hû N­¬ng:"..nXiNiang..", tªn NPC t­¬ng øng"..szXiNiang);
	mf_ClearMissionData();
end;
--Íæ¼ÒÀë¿ª»éÀñ³¡µØÊ±µÄ²Ù×÷
function MR_LeaveMarryField()
	local nMapID = GetWorldPos();
	local nFieldID = map_field2type[nMapID];
	Msg2MSAll(MISSION_ID,GetName().."Rêi s©n khÊu kÕt h«n")
	MR_RestorePlayerState();
	LeaveChannel(MARRIAGE_CHANNEL);
	NewWorld(map_leavefieldpos[nFieldID][1],map_leavefieldpos[nFieldID][2],map_leavefieldpos[nFieldID][3])
end;
--Íæ¼Ò½øÈë»éÀñ³¡µØÊ±µÄ²Ù×÷
function MR_JoinMarryField(nCamp)
	local nFieldID = map_field2type[SubWorldIdx2ID(SubWorld)]
	CleanInteractive();
	if nCamp == CAMP_COUPLE then
		LearnSkill(SKILL_CANDY)
		Msg2Player("Vµo s©n khÊu, nhÊp chuét ph¶i tham gia h«n lÔ cïng mäi ng­êi ¨n kÑo mõng.");
		SetMissionS(GetSex(),GetName());	--¼ÇÂ¼³¡µØÄÚÐÂÀÉÐÂÄïµÄÐÕÃû
	end;
	if NewWorld(map_fieldpos[nFieldID][1],map_fieldpos[nFieldID][2],map_fieldpos[nFieldID][3]) == 1 then
		Msg2MSAll(MISSION_ID,GetName().."Vµo s©n khÊu, chóc mõng t©n lang vµ t©n n­¬ng!")
		MR_SetPlayerState();
		EnterChannel(MARRIAGE_CHANNEL);
		AddMSPlayer(MISSION_ID,nCamp);
	end;
end;
--´¦Àí»éÀñ×¼±¸½×¶ÎµÄÊÂ¼þ
function MR_ProcessReadyTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		SetMissionV(MV_FIELD_STATE,MS_STATE_STARTED);
		SetMissionV(MV_TIMER_LOOP,STARTED_TIMER_COUNT);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,STARTED_TIMER_INTERVAL);
		RunMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"H«n lÔ s¾p kÕt thóc, chØ cßn"..(nLoop*5).." phót ");
	end;
end;
--´¦Àí»éÀñ½øÐÐÖÐµÄÊÂ¼þ
function MR_ProcessStartedTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		SetMissionV(MV_FIELD_STATE,MS_STATE_COMPLETE);
		SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_COUNT);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIMER_INTERVAL);
		Msg2MSAll(MISSION_ID,"H«n lÔ ®· kÕt thóc, mäi ng­êi rêi s©n khÊu");
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		if mod(nLoop,2) == 0 then
			Msg2MSAll(MISSION_ID,"H«n lÔ s¾p kÕt thóc, chØ cßn"..(nLoop*5).." phót ");
		end;
		local fAddExp = function(tArg)
			ModifyExp(GetLevel()^2*15);
			Msg2Player("May m¾n: B¹n nhËn ®­îc"..(GetLevel()^2*15).." ®iÓm kinh nghiÖm");
		end;
		mf_OperateAllPlayer(MISSION_ID,fAddExp,{},0);
	end;
end;
--´¦Àí»éÀñ½áÊøºóÌáÐÑÍæ¼ÒÀë¿ª³¡µØ
function MR_ProcessWaitOutTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		CloseMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"H«n lÔ s¾p kÕt thóc, chØ cßn"..nLoop.." phót, xin mäi ng­êi rêi khái s©n khÊu. T©n Lang ®Õn chç T©n N­¬ng ®Ó nhËn Hång bao");
	end;
end;
--½øÈë³¡µØÊ±Í³Ò»½øÐÐµÄ²Ù×÷
function MR_SetPlayerState()
	LeaveTeam();	--Àë¿ª¶ÓÎé
	SetLogoutRV(1);	--ÉèÖÃµÇÂ½µãÎª³ÇÊÐÖØÉúµã
	SetFightState(1)
	CreateTrigger(3,LOG_ID,LOG_CUSTOM_ID);
	SetDeathScript("\\script\\½á»é\\mission\\playerdeath.lua");
	local nFieldType = map_field2type[SubWorldIdx2ID(SubWorld)];
	SetTempRevPos(map_RevPos[nFieldType][1],map_RevPos[nFieldType][2]*32,map_RevPos[nFieldType][3]*32)	--ÖØÉúµã
	SetDeathPunish(0)
	SetTask(TASK_WEDDING1_ID+nFieldType-1,GetMissionV(MV_WEDDING_ID));
end;
--Àë¿ª³¡µØÊ±Í³Ò»½øÐÐµÄ²Ù×÷
function MR_RestorePlayerState()
	SetLogoutRV(0)
	SetFightState(0)
	if HaveLearnedSkill(SKILL_CANDY) == 1 then
		RemoveSkill(SKILL_CANDY);
	end;
	SetDeathScript("");
	SetTempRevPos(0,0,0);
	SetDeathPunish(1);
	RemoveTrigger(GetTrigger(LOG_CUSTOM_ID));
end;
--»ñÈ¡Ê³ÎïÐÅÏ¢×Ö·û´®£¬nTypeÎª1Ê±±íÊ¾»ñµÃÍæ¼ÒÉíÉÏµÄÊ³ÎïÐÅÏ¢£¬Îª2Ê±±íÊ¾»ñÈ¡³¡µØµÄÊ³ÎïÐÅÏ¢
function MR_GetFoodsString(nType)
	local sString = "";
	local nFoodCount = 0;
	local nMapID = GetWorldPos();
	for i=1,getn(tFoods) do
		if nType == 1 then
			nFoodCount = GetItemCount(tFoods[i][1],tFoods[i][2],tFoods[i][3]);
		else
			nFoodCount = GetMissionV(MV_FOOD_BEGIN+i-1);
		end;
		if nFoodCount > 0 then
			sString = sString..nFoodCount..tFoods[i][4]..", ";
		end; 
	end;
	return sString;
end;

function MR_CreateMapNPC(nFieldID)
	local nNpcIndex = 0;
	if nFieldID == 1 then
		nNpcIndex = CreateNpc("Th­¬ng nh©n", "Sø gi¶ h«n lÔ", 851, 1554, 3232)
	  	SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\»éÇì´«ËÍÈË.lua");  
		nNpcIndex = CreateNpc("Th­¬ng nh©n", "DÞch vô h«n nh©n", 851, 1567, 3156)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\»éÇìÉÌÈË.lua");  		
		nNpcIndex = CreateNpc("Th­¬ng nh©n", "Tæng qu¶n dÞch vô h«n nh©n", 851, 1558, 3165)
		SetNpcScript(nNpcIndex,"\\script\\½á»é\\npc\\»éÇì±£¹ÜÈË.lua");  		
		nNpcIndex = CreateNpc("Hû N­¬ng", "Hû N­¬ng", 851, 1608, 3142)
		SetMissionV(MV_XINIANG_INDEX,nNpcIndex);
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\Ï²Äï.lua");  	
		nNpcIndex = CreateNpc("Ng­êi thæi kÌn", "Nh¹c c«ng", 851, 1622, 3155)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\´µ¹ÄÊÖ.lua");  	
		nNpcIndex = CreateNpc("M©m cç", " ", 851, 1586, 3199)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\¾ÆÏ¯.lua");  		
		nNpcIndex = CreateNpc("M©m cç", " ", 851, 1591, 3203)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\¾ÆÏ¯.lua");  		
		nNpcIndex = CreateNpc("M©m cç", " ", 851, 1586, 3207)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\¾ÆÏ¯.lua");  
		nNpcIndex = CreateNpc("M©m cç", " ", 851, 1582, 3203)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\¾ÆÏ¯.lua"); 
		WriteLog("[KÕt h«n]: T¹o NPC phôc vô hãa trang thµnh c«ng");
	elseif nFieldID == 2 then
		nNpcIndex = CreateNpc("Th­¬ng nh©n", "Sø gi¶ h«n lÔ", 852, 1615, 3276)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\»éÇì´«ËÍÈË.lua");  		
		nNpcIndex = CreateNpc("Th­¬ng nh©n", "DÞch vô h«n nh©n", 852, 1600, 3225)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\»éÇìÉÌÈË.lua"); 		
		nNpcIndex = CreateNpc("Th­¬ng nh©n", "Tæng qu¶n dÞch vô h«n nh©n", 852, 1600, 3235)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\»éÇì±£¹ÜÈË.lua"); 		
		nNpcIndex = CreateNpc("Hû N­¬ng", "Hû N­¬ng", 852, 1680, 3217)
		SetMissionV(MV_XINIANG_INDEX,nNpcIndex);
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\Ï²Äï.lua"); 	
		nNpcIndex = CreateNpc("Ng­êi thæi kÌn", "Nh¹c c«ng", 852, 1677, 3223)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\´µ¹ÄÊÖ.lua"); 	
		nNpcIndex = CreateNpc("Ng­êi thæi kÌn", "Nh¹c c«ng", 852, 1683, 3223)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\´µ¹ÄÊÖ.lua"); 		
		nNpcIndex = CreateNpc("M©m cç", " ", 852, 1664, 3237)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\¾ÆÏ¯.lua"); 		
		nNpcIndex = CreateNpc("M©m cç", " ", 852, 1664, 3246)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\¾ÆÏ¯.lua"); 		
		nNpcIndex = CreateNpc("M©m cç", " ", 852, 1659, 3242)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\¾ÆÏ¯.lua"); 		
		nNpcIndex = CreateNpc("M©m cç", " ", 852, 1669, 3242)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\¾ÆÏ¯.lua"); 		
		nNpcIndex = CreateNpc("M©m cç", " ", 852, 1659, 3250)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\¾ÆÏ¯.lua"); 		
		nNpcIndex = CreateNpc("M©m cç", " ", 852, 1654, 3246)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\¾ÆÏ¯.lua"); 	
		WriteLog("[KÕt h«n]: T¹o NPC phôc phôc tuÇn tr¨ng mËt thµnh c«ng");
	elseif nFieldID == 3 then
		nNpcIndex = CreateNpc("Th­¬ng nh©n", "Sø gi¶ h«n lÔ", 853, 1550, 3217)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\»éÇì´«ËÍÈË.lua"); 		
		nNpcIndex = CreateNpc("Th­¬ng nh©n", "DÞch vô h«n nh©n", 853, 1654, 3136)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\»éÇìÉÌÈË.lua"); 	
		nNpcIndex = CreateNpc("Th­¬ng nh©n", "DÞch vô h«n nh©n", 853, 1596, 3224)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\»éÇìÉÌÈË.lua"); 		
		nNpcIndex = CreateNpc("Th­¬ng nh©n", "DÞch vô h«n nh©n", 853, 1539, 3168)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\»éÇìÉÌÈË.lua"); 		
		nNpcIndex = CreateNpc("Th­¬ng nh©n", "Tæng qu¶n dÞch vô h«n nh©n", 853, 1536, 3141)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\»éÇì±£¹ÜÈË.lua"); 	
		nNpcIndex = CreateNpc("Th­¬ng nh©n", "Tæng qu¶n dÞch vô h«n nh©n", 853, 1589, 3108)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\»éÇì±£¹ÜÈË.lua"); 		
		nNpcIndex = CreateNpc("Th­¬ng nh©n", "Tæng qu¶n dÞch vô h«n nh©n", 853, 1613, 3201)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\»éÇì±£¹ÜÈË.lua"); 		
		nNpcIndex = CreateNpc("Th­¬ng nh©n", "Tæng qu¶n dÞch vô h«n nh©n", 853, 1657, 3175)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\»éÇì±£¹ÜÈË.lua"); 	
		nNpcIndex = CreateNpc("Hû N­¬ng", "Hû N­¬ng", 853, 1627, 3142)
		SetMissionV(MV_XINIANG_INDEX,nNpcIndex);
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\Ï²Äï.lua"); 	
		nNpcIndex = CreateNpc("Ng­êi thæi kÌn", "Nh¹c c«ng", 853, 1640, 3158)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\´µ¹ÄÊÖ.lua"); 	
		nNpcIndex = CreateNpc("Ng­êi thæi kÌn", "Nh¹c c«ng", 853, 1625, 3172)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\´µ¹ÄÊÖ.lua"); 	
		nNpcIndex = CreateNpc("Ng­êi thæi kÌn", "Nh¹c c«ng", 853, 1595, 3113)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\´µ¹ÄÊÖ.lua"); 	
		nNpcIndex = CreateNpc("Ng­êi thæi kÌn", "Nh¹c c«ng", 853, 1575, 3132)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\´µ¹ÄÊÖ.lua"); 		
		nNpcIndex = CreateNpc("M©m cç", " ", 853, 1601, 3174)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\¾ÆÏ¯.lua"); 		
		nNpcIndex = CreateNpc("M©m cç", " ", 853, 1605, 3179)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\¾ÆÏ¯.lua"); 		
		nNpcIndex = CreateNpc("M©m cç", " ", 853, 1600, 3185)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\¾ÆÏ¯.lua"); 		
		nNpcIndex = CreateNpc("M©m cç", " ", 853, 1595, 3180)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\¾ÆÏ¯.lua"); 		
		nNpcIndex = CreateNpc("M©m cç", " ", 853, 1589, 3186)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\¾ÆÏ¯.lua"); 		
		nNpcIndex = CreateNpc("M©m cç", " ", 853, 1593, 3190)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\¾ÆÏ¯.lua"); 	
		nNpcIndex = CreateNpc("M©m cç", " ", 853, 1581, 3153)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\¾ÆÏ¯.lua"); 		
		nNpcIndex = CreateNpc("M©m cç", " ", 853, 1576, 3149)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\¾ÆÏ¯.lua"); 		
		nNpcIndex = CreateNpc("M©m cç", " ", 853, 1570, 3155)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\¾ÆÏ¯.lua"); 		
		nNpcIndex = CreateNpc("M©m cç", " ", 853, 1574, 3160)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\¾ÆÏ¯.lua"); 		
		nNpcIndex = CreateNpc("M©m cç", " ", 853, 1569, 3166)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\¾ÆÏ¯.lua"); 		
		nNpcIndex = CreateNpc("M©m cç", " ", 853, 1564, 3161)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\¾ÆÏ¯.lua"); 	
		WriteLog("[KÕt h«n]: T¹o NPC phôc vô ®éng phßng thµnh c«ng");
	elseif nFieldID == 4 then
		nNpcIndex = CreateNpc("Th­¬ng nh©n", "Sø gi¶ h«n lÔ", 854, 1612, 3324)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\»éÇì´«ËÍÈË.lua"); 		
		nNpcIndex = CreateNpc("Th­¬ng nh©n", "DÞch vô h«n nh©n", 854, 1644, 3277)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\»éÇìÉÌÈË.lua"); 	
		nNpcIndex = CreateNpc("Th­¬ng nh©n", "DÞch vô h«n nh©n", 854, 1644, 3277)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\»éÇìÉÌÈË.lua"); 	
		nNpcIndex = CreateNpc("Th­¬ng nh©n", "Tæng qu¶n dÞch vô h«n nh©n", 854, 1653, 3286)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\»éÇì±£¹ÜÈË.lua"); 	
		nNpcIndex = CreateNpc("Th­¬ng nh©n", "Tæng qu¶n dÞch vô h«n nh©n", 854, 1608, 3259)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\»éÇì±£¹ÜÈË.lua"); 		
		nNpcIndex = CreateNpc("Hû N­¬ng", "Hû N­¬ng", 854, 1663, 3267)
		SetMissionV(MV_XINIANG_INDEX,nNpcIndex);
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\Ï²Äï.lua"); 	
		nNpcIndex = CreateNpc("Ng­êi thæi kÌn", "Nh¹c c«ng", 854, 1670, 3274)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\´µ¹ÄÊÖ.lua"); 	
		nNpcIndex = CreateNpc("Ng­êi thæi kÌn", "Nh¹c c«ng", 854, 1679, 3265)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\´µ¹ÄÊÖ.lua"); 	
		nNpcIndex = CreateNpc("Ng­êi thæi kÌn", "Nh¹c c«ng", 854, 1647, 3254)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\´µ¹ÄÊÖ.lua"); 	
		nNpcIndex = CreateNpc("Ng­êi thæi kÌn", "Nh¹c c«ng", 854, 1658, 3244)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\´µ¹ÄÊÖ.lua"); 		
		nNpcIndex = CreateNpc("M©m cç", " ", 854, 1653, 3300)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\¾ÆÏ¯.lua"); 		
		nNpcIndex = CreateNpc("M©m cç", " ", 854, 1658, 3304)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\¾ÆÏ¯.lua"); 		
		nNpcIndex = CreateNpc("M©m cç", " ", 854, 1648, 3304)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\¾ÆÏ¯.lua"); 		
		nNpcIndex = CreateNpc("M©m cç", " ", 854, 1653, 3308)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\¾ÆÏ¯.lua"); 		
		nNpcIndex = CreateNpc("M©m cç", " ", 854, 1648, 3312)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\¾ÆÏ¯.lua"); 		
		nNpcIndex = CreateNpc("M©m cç", " ", 854, 1643, 3308)
		SetNpcScript(nNpcIndex, "\\script\\½á»é\\npc\\¾ÆÏ¯.lua"); 
		WriteLog("[KÕt h«n]: Hoµn tÊt viÖc t¹o NPC trªn ®Ønh V©n S¬n");
	else
		WriteLog("[KÕt h«n bÞ lçi]: Tham sè t¹o NPC s©n khÊu h«n lÔ bÞ lçi, t¹o NPC thÊt b¹i, nFieldID:"..nFieldID);
	end;
	local nXiNiang = GetMissionV(MV_XINIANG_INDEX);
	local szXiNiang = GetNpcName(nXiNiang);
	WriteLog("[KÕt h«n]: T¹o NPC kÕt h«n, NPC h­íng dÉn Hû N­¬ng:"..nXiNiang..", tªn NPC t­¬ng øng"..szXiNiang);
end;
--´´½¨TRAPµã
function MR_CreateMapTrap(nFieldID)
	local nMapID = map_fieldpos[nFieldID][1];
	if nFieldID == 1 then
		for i=1,10 do
			AddMapTrap(nMapID,(1537-i)*32,(3180-i)*32,"\\script\\½á»é\\mission\\trap.lua")
		end;
		for i=1,10 do
			AddMapTrap(nMapID,(1522+i)*32,(3194-i)*32,"\\script\\½á»é\\mission\\trap.lua")
		end;
	elseif nFieldID == 2 then
		for i=1,10 do
			AddMapTrap(nMapID,(1597+i)*32,3176*32,"\\script\\½á»é\\mission\\trap.lua")
		end;
		for i=1,20 do
			AddMapTrap(nMapID,1607*32,(3176-i)*32,"\\script\\½á»é\\mission\\trap.lua")
		end;		
	elseif nFieldID == 3 then
		for i=1,20 do
			AddMapTrap(nMapID,1510*32,(3163+i)*32,"\\script\\½á»é\\mission\\trap.lua")
		end;	
	else
		for i=1,10 do
			AddMapTrap(nMapID,(1602+i)*32,3232*32,"\\script\\½á»é\\mission\\trap.lua")
		end;
	end;
end;
--µÇÂ½´¥·¢Æ÷
function OnLogin()
	MR_RestorePlayerState();
end;