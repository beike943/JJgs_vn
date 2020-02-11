-- ====================== ÎÄ¼şĞÅÏ¢ ====================== 
                                                          
-- ½£ÏÀÇéÔµonlineII Í¨¼©ÈÎÎñÍ·ÎÄ¼ş                  
-- Edited by starry night                                 
-- 2005/09/05 PM 16:21                                    
                                                          
-- ======================================================

--»ñÈ¡±í¸ñÖ§³Ö
Include("\\script\\class\\ktabfile.lua");
--¶Ô»°ÃüÁîÖ§³Ö
--Include("\\script\\\task\\world\\task_head.lua");
-- ×Ö·û´®´¦Àí¹¦ÄÜ¿â
Include("\\script\\lib\\string.lua");
Include("\\script\\shinynight_head.lua");
--2006ÄêÊ¥µ®½Ú»î¶¯½±ÀøÖ§³Ö
Include("\\script\\online\\zgc_temp_fun.lua")

tabKillerSurname = new(KTabFile, "\\settings\\task\\killer\\killer_surname.txt");
tabKillerFirstname = new(KTabFile, "\\settings\\task\\killer\\killer_firstname.txt");
tabKillerMode = new(KTabFile, "\\settings\\task\\killer\\killer_mode.txt");
tabKillerPos = new(KTabFile, "\\settings\\task\\killer\\killer_pos.txt");
tabKillerParMode = new(KTabFile, "\\settings\\task\\killer\\killer_par_mode.txt");
tabAwardMedicine = new(KTabFile, "\\settings\\task\\killer\\award_medicine.txt");
tabKillerPosTop = new(KTabFile, "\\settings\\task\\killer\\killer_top_pos.txt");
tabTopKillerMode = new(KTabFile, "\\settings\\task\\killer\\killer_top_mode.txt");
tabTaskPay = new(KTabFile, "\\settings\\task\\killer\\killer_pay.txt");
tabAwardEquip = new(KTabFile, "\\settings\\task\\killer\\topkiller_equip.txt");
tabTriggerID = new(KTabFile, "\\settings\\task\\killer\\pos_trigger_id.txt");

--¶¨ÒåÈÎÎñÏà¹Ø²ÎÊı

TASK_KILLER_STATE_ID        = 1100; -- Í¨¼©ÈÎÎñ×´Ì¬
TASK_KILLER_MAP_ID          = 1101; -- µØÍ¼ID
                            
TASK_KILLER_NPCMODE_ID      = 1102; -- É±ÊÖÄ£°åID
TASK_KILLER_SURNAME_ID      = 1103; -- É±ÊÖĞÕID
TASK_KILLER_FIRSTNAME_ID    = 1104; -- É±ÊÖÃûID
                            
TASK_KILLER_NPCINDEX_ID     = 1105; -- ÁÙÊ±Éú³ÉµÄÉ±ÊÖË÷Òı
TASK_KILLER_PAR_NPCINDEX_ID = 1106; -- ÁÙÊ±Éú³ÉµÄÉ±ÊÖÍ¬°éË÷Òı
TASK_KILLER_STATE_STAR      = 1107; -- Í¨¼©ÈÎÎñ¿ª¹Ø 1 Îª¿ªÊ¼£»0 Îª¹Ø±Õ
TASK_KILLER_DONUM           = 1108; -- Íæ¼ÒÍê³ÉÍ¨¼©ÈÎÎñ´ÎÊı                          
TAKS_KILLER_START_TIME      = 1109; -- ¼ÇÂ¼Íæ¼Ò¿ªÊ¼ÈÎÎñµÄÊ±¼ä£¨ÈÕÆÚ£©
TASK_PLAYER_LEVEL						= 1110; -- Íæ¼Ò½Ó»ñÈÎÎñÊ±µÄµÈ¼¶
TASK_TRIGGER_ID             = 1111; -- ¼ÇÂ¼Éú³ÉÉ±ÊÖµÄµØÍ¼´¥·¢Æ÷ID
TASK_ACCEPT_TIME            = 1112; -- ¼ÇÂ¼Íæ¼Ò½Ó»ñÈÎÎñµÄÊ±¼ä£¨´Ó1970ÄêÖÁ½ñ¾­¹ıµÄÃëÊı£©
TASK_KILLER_DONUM_LIMIT     = 1113; -- ¼ÇÂ¼¸ÃµØÍ¼ÉÏËùÓĞÍæ¼Ò½Ó»ñÈÎÎñ´ÎÊı
TASK_USEYANHUO_TIME         = 1114; -- ¼ÇÂ¼Ê¹ÓÃ´«ĞÅÑÌ»ğµÄÊ±¼ä
TASK_POINT_TOTAL            = 1115; -- ¼ÇÂ¼Íæ¼ÒÍ¨¼©ÈÎÎñ»ı·Ö

TASK_TRIGGER_RECT           = 600;  -- É±ÊÖµÄµØÍ¼´¥·¢Æ÷
TASK_TRIGGER_TIME           = 500;  -- É±ÊÖ¼ÆÊ±Æ÷

--²¶Í·ËùÔÚµÄµØÍ¼ĞÅÏ¢
BuTouMapData = {
	
	[1]={100,"TuyÒn Ch©u"},
	[2]={150,"D­¬ng Ch©u"},
	[3]={200,"BiÖn Kinh"},
	[4]={300,"Thµnh §«"},
	[5]={350,"T­¬ng D­¬ng"},
	 
}

--Í¨¼©ÈÎÎñ»ı·ÖÏµÊıµÈ¼¶¶ÔÓ¦±í
KillerPointData = {

	[20]={1.0},
	[25]={1.1},
  [30]={1.2},
  [35]={1.3},
  [40]={1.4},
  [45]={1.5},
  [50]={1.6},
  [55]={1.7},
  [60]={1.8},
  [65]={1.9},
  [70]={2.0},
  [75]={2.1},
  [80]={2.2},
  [85]={2.3},
  [90]={2.4},
  [95]={2.5},
  
}

--¹¹ÔìÉ±ÊÖĞÕÃû
--·µ»Ø£ºÉ±ÊÖĞÕID£¬É±ÊÖÃûID
function getKillerNameID()

local nXRow = tabKillerSurname:getRow();
local nMRow = tabKillerFirstname:getRow();
local nSurnameID = tonumber(tabKillerSurname:getCell(random(3,nXRow),"SurnameID"));
local nFirstnameID = tonumber(tabKillerFirstname:getCell(random(3,nMRow),"FirstnameID"));
	
	return nSurnameID,nFirstnameID;

end;


--¸ù¾İÉ±ÊÖĞÕÃûID»ñÈ¡É±ÊÖĞÕÃû
function getKillerName(nSurnameID,nFirstnameID)

local nName = "";
local nSurname = "";
local nFirstname = "";
local nXRow = 0;
local nMrow = 0;

	nXRow = tabKillerSurname:selectRowNum("SurnameID",nSurnameID);
	nMRow = tabKillerFirstname:selectRowNum("FirstnameID",nFirstnameID);
	
	nSurname = tabKillerSurname:getCell(nXRow,"Text");
	nFirstname = tabKillerFirstname:getCell(nMRow,"Text");

	nName = nSurname..nFirstname;
		
	return nName;
	
end;


--¸ù¾İÍæ¼ÒµÈ¼¶Ñ¡È¡ÈÎÎñµÈ¼¶£¨ÈÎÎñÇø¼ä£©
function selectLevelArea()

local playerLevel = GetLevel();

	if playerLevel < 10 then 
		return 10;
	end;
	
	if playerLevel > 70 then 
		return 70;
	else 
		return floor(playerLevel/10)*10;
	end;
	
end;


--¸ù¾İÍæ¼ÒµÈ¼¶¹¹ÔìÉ±ÊÖµÈ¼¶Êı×é
--·µ»ØÖµ£ºÉ±ÊÖIDÊı×é
function getKillerLevelArg(nLevel)

local argKillerID = {};
local i = 0;


	for i=3,tabKillerMode:getRow() do
		if tonumber(tabKillerMode:getCell(i,"Level"))==nLevel then
			tinsert(argKillerID,tonumber(tabKillerMode:getCell(i,"KillerID")));

		end;
	end;
	
	return argKillerID;

end;

 
--¸ù¾İÍæ¼ÒµÈ¼¶Ñ¡Ñ¡È¡²¢·µ»ØÒ»¸öÉ±ÊÖÄ£°åID
function getKillerID(nLevel)

local argKillerID = getKillerLevelArg(nLevel);
local nKillerModeID = argKillerID[random(1,getn(argKillerID))];
	
	return nKillerModeID;

end;


--¸ù¾İÉ±ÊÖÄ£°åID·µ»ØÒ»¸öÉ±ÊÖÄ£°åÃû×Ö
function getKillerMode(nKillerModeID)

local nRow = tabKillerMode:selectRowNum("KillerID",nKillerModeID);
local nKillerMode = tabKillerMode:getCell(nRow,"KillerMode");
	
	return nKillerMode;

end;


--¸ù¾İÍæ¼ÒµÈ¼¶¹¹ÔìµØÍ¼µÈ¼¶Êı×é
--·µ»ØÖµ£ºµØÍ¼IDÊı×é
function getPosLevelArg(nLevel)

local argPosID = {};
local i = 0;

	for i=3,tabKillerPos:getRow() do
		if tonumber(tabKillerPos:getCell(i,"Level")) <= nLevel then
			tinsert(argPosID,tonumber(tabKillerPos:getCell(i,"PosID")));
		end;
	end;
	
	return argPosID;
	
end;


--¸ù¾İÍæ¼ÒµÈ¼¶·µ»ØÒ»¸öµØÍ¼ID
function getPosID(nLevel)

local argPosID = 0;
local nPosID = 0;

	if nLevel >= 70 then
		nLevel = 70;
	end;

	argPosID = getPosLevelArg(nLevel);
	nPosID = argPosID[random(1,getn(argPosID))];

	return nPosID;

end;
	

--¸ù¾İµØÍ¼ID»ñÈ¡µØÍ¼Ïà¹ØĞÅÏ¢
--£¨µØÍ¼Ãû£¬µØÍ¼ºÅID£¬ÊÀ½ç×ø±êX£¬ÊÀ½ç×ø±êY£¬µØÍ¼×ø±êx£¬µØÍ¼×ø±êy£©
function getPosData(nPosID)

local nRow = tabKillerPos:selectRowNum("PosID",nPosID);
local nMapName = tabKillerPos:getCell(nRow,"MapName");
local nMapID = tonumber(tabKillerPos:getCell(nRow,"MapID"));
local nWx = tonumber(tabKillerPos:getCell(nRow,"WorldX"));
local nWy = tonumber(tabKillerPos:getCell(nRow,"WorldY"));
local nMx = tonumber(tabKillerPos:getCell(nRow,"MapX"));
local nMy = tonumber(tabKillerPos:getCell(nRow,"MapY"));

	return nMapName,nMapID,nWx,nWy,nMx,nMy;
	
end;


--¹¹½¨Ò»¸öÉ±ÊÖ
--·µ»Ø£¨É±ÊÖÃû×Ö£¬É±ÊÖÄ£°å£¬µØÍ¼Ãû³Æ£¬µØÍ¼ID£¬ÊÀ½ç×ø±êx£¬ÊÀ½ç×ø±êy£¬µØÍ¼×ø±êx£¬µØÍ¼×ø±êy£©
function createKillerData()

	--»ñÈ¡É±ÊÖĞÕÃû
	local nSurnameID,nFirstnameID = getKillerNameID();
	local nKillerName = getKillerName(nSurnameID,nFirstnameID);
	
	--±£´æÉ±ÊÖĞÕÃûID
	SetTask(TASK_KILLER_SURNAME_ID,nSurnameID);
	SetTask(TASK_KILLER_FIRSTNAME_ID,nFirstnameID);
	
	--»ñÈ¡Íæ¼ÒÈÎÎñµÈ¼¶Çø¼ä
	local nLevel = selectLevelArea();
	
	--»ñÈ¡É±ÊÖÄ£°å
	local nKillerModeID = getKillerID(nLevel);
	local nKillerMode = getKillerMode(nKillerModeID);
	
	--±£´æÉ±ÊÖÄ£°åID
	SetTask(TASK_KILLER_NPCMODE_ID,nKillerModeID);	
	
	--»ñÈ¡µØÍ¼Ïà¹ØĞÅÏ¢
	local nKillerPosID = getPosID(nLevel);
	local nMapName,nMapID,nWx,nWy,nMx,nMy = getPosData(nKillerPosID);
	
	--±£´æµØÍ¼ID
	SetTask(TASK_KILLER_MAP_ID,nKillerPosID);
	
	--¼ÇÂ¼½Ó»òÈÎÎñÈÕÆÚ
	local nStartTime = tonumber(date("%y")..date("%m")..date("%d"));
		
	--±£´æ½Ó»ñÈÎÎñµÄÊ±¼ä
	SetTask(TAKS_KILLER_START_TIME,nStartTime);

		return nKillerName,nKillerMode,nMapName,nMapID,nWx,nWy,nMx,nMy;
			
end;


--ÔÚµØÍ¼Ö¸¶¨µØ·½Éú³ÉÒ»¸öÉ±ÊÖ
function CreateKiller()

--»ñÈ¡É±ÊÖĞÕÃûID
local nSurnameID = GetTask(TASK_KILLER_SURNAME_ID);
local	nFirstnameID = GetTask(TASK_KILLER_FIRSTNAME_ID);
--»ñÈ¡É±ÊÖĞÕÃû
local nKillerName = "S¸t thñ "..getKillerName(nSurnameID,nFirstnameID);	

--»ñÈ¡É±ÊÖÄ£°åID
local nKillerModeID = GetTask(TASK_KILLER_NPCMODE_ID);			
--»ñÈ¡É±ÊÖÄ£°å
local nKillerMode = getKillerMode(nKillerModeID);	

--»ñÈ¡µØÍ¼ID
local nKillerPosID = GetTask(TASK_KILLER_MAP_ID);	
--»ñÈ¡µØÍ¼Ïà¹ØĞÅÏ¢
local nMapName,nMapID,nWx,nWy,nMx,nMy = getPosData(nKillerPosID);
	
--ÔÚÖ¸¶¨µØ·½²úÉúÒ»¸öÉ±ÊÖ,·µ»ØÆäNpcË÷Òı
local nKillerIndex = 0;
local nKillerIndex = CreateNpc(nKillerMode,nKillerName,nMapID,nWx,nWy,-1,1,1,450);

--ÉèÖÃÉ±ÊÖÉú´æÊ±¼ä
local	nAcceptTime = GetTask(TASK_ACCEPT_TIME);
local nNowTime = GetTime();
local nTime = 1800-(nNowTime - nAcceptTime);
	
	if nTime < 0 then
		nTime = 0;
	end;

	SetNpcLifeTime(nKillerIndex,nTime); 

	--ÉèÖÃ¸ÃNpcÉ±ÊÖ½Å±¾
	SetNpcScript(nKillerIndex,"\\script\\task\\killer\\killer_talk.lua");
	
	--É¾µô¸ÃµØÍ¼´¥·¢Æ÷
	RemoveTrigger(GetTrigger(600)); 
		
	--±£´æÉ±ÊÖÁÙÊ±ID
	SetTask(TASK_KILLER_NPCINDEX_ID,nKillerIndex);
	
end;



--¸ù¾İÉ±ÊÖµÈ¼¶¹¹ÔìÉ±ÊÖÍ¬°éµÈ¼¶Êı×é
--·µ»ØÖµ£ºÉ±ÊÖÍ¬°éIDÊı×é
function getKillerParLevelArg()

local argKillerParID = {};
local nKillerModeID = GetTask(TASK_KILLER_NPCMODE_ID);
local nRow = tabKillerMode:selectRowNum("KillerID",nKillerModeID);
local nLevel = tonumber(tabKillerMode:getCell(nRow,"Level"));

local i = 0;

	for i=3,tabKillerParMode:getRow() do
		if tonumber(tabKillerParMode:getCell(i,"Level"))==nLevel then
			tinsert(argKillerParID,tonumber(tabKillerParMode:getCell(i,"KillerParID")));
		end;
	end;
	
	return argKillerParID;

end;


--Ñ¡È¡Ò»¸öÉ±ÊÖÍ¬°éÄ£°åID
function getKillerParModeID()

local argKillerParID = getKillerParLevelArg();
local nKillerParID = argKillerParID[random(1,getn(argKillerParID))];

	SetTask(TASK_KILLER_PAR_NPCINDEX_ID,nKillerParID);

	return nKillerParID;
	
end;

--»ñÈ¡É±ÊÖÍ¬°éÄ£°åÃû³Æ
function getKillerParMode(nKillerParID)

local nRow = tabKillerParMode:selectRowNum("KillerParID",nKillerParID);
local nKillerParModeName = tabKillerParMode:getCell(nRow,"KillerParMode");

	return nKillerParModeName;
	
end;


--Í¨¹ıÉ±ÊÖÁîÅÆ»ñÈ¡Ò©Æ·½±Àø
function AwardMedicine()

local nLevel = selectLevelArea();
local argMedicineID = getAwardMedicineArg(nLevel);

local i = 1;
local nKind = 2;--½±ÀøÒ©Æ·ÖÖÀàÎª2ÖÖ
local argAwardID = {};
local n = 0;
local j = 0;
local nRow = 0;
local argAwardData = {};
local k = 0;
local nG = 0;
local nD = 0;
local nP = 0;
local nNum = 0;
	
	k = random(1,getn(argMedicineID));
	nRow = tabAwardMedicine:selectRowNum("MedicineID",argMedicineID[k]);

	nG = tonumber(tabAwardMedicine:getCell(nRow,"Genre"));
	nD = tonumber(tabAwardMedicine:getCell(nRow,"Detail"));
	nP = tonumber(tabAwardMedicine:getCell(nRow,"Particular"));
	nNum = random(tonumber(tabAwardMedicine:getCell(nRow,"MinNum")),tonumber(tabAwardMedicine:getCell(nRow,"MaxNum")));
		
	AddItem(nG,nD,nP,nNum,1);
		
end;


--¹¹ÔìÒ©Æ·½±ÀøÊı×é
--·µ»ØÒ»¸öÒ©Æ·IDÊı×é
function getAwardMedicineArg(nLevel)

local argMidicineID = {};
local i = 0;
local nNum = tabAwardMedicine:getRow();

	for i=3,nNum do
		if tonumber(tabAwardMedicine:getCell(i,"Level"))==nLevel then
			tinsert(argMidicineID,tonumber(tabAwardMedicine:getCell(i,"MedicineID")));
		end;
	end;

	return argMidicineID; 

end;  


--¸ù¾İÍæ¼ÒµÈ¼¶¹¹Ôì¶¥¼¶É±ÊÖIDÊı×é
--·µ»ØÖµ£ºÉ±ÊÖIDÊı×é
function getTopKillerLevelArg(nLevel)

local i = 0;
local argTopKillerID = {};
local nNum = tabTopKillerMode:getRow();


	for i=3,nNum do
		if tonumber(tabTopKillerMode:getCell(i,"Level"))==nLevel then
			tinsert(argTopKillerID,tonumber(tabTopKillerMode:getCell(i,"KillerTopID")));
		end;
	end;
	
	return argTopKillerID;

end;

--»ñÈ¡¶¥¼¶É±ÊÖÄ£°åID
function getTopKillerID(nLevel)

local argTopKillerID = getTopKillerLevelArg(nLevel);
local nTopKillerID = argTopKillerID[random(1,getn(argTopKillerID))];

	return nTopKillerID;
	
end;

--»ñÈ¡¶¥¼¶É±ÊÖÄ£°åÃû×Ö
function getTopKillerMode(nTopKillerID)

local nRow = tabTopKillerMode:selectRowNum("KillerTopID",nTopKillerID);
local nTopKillerMode = tabTopKillerMode:getCell(nRow,"KillerTopMode");

	return nTopKillerMode;
	
end;


--»ñÈ¡¶¥¼¶É±ÊÖÏà¹ØĞÅÏ¢
--ÒÀ´Î·µ»Ø£ºÉ±ÊÖÃû£¬É±ÊÖÄ£°åÃû
function GetTopKillerData()

	--»ñÈ¡¶¥¼¶É±ÊÖĞÕÃû
	local nSurnameID,nFirstnameID = getKillerNameID();
	local nTopKillerName = getKillerName(nSurnameID,nFirstnameID);
	
	if nTopKillerName ~= nil then
		nTopKillerName = "S¸t thñ ®Çu môc"..nTopKillerName;
	else
		nTopKillerName = "S¸t thñ ®Çu môc"
	end

	--»ñÈ¡Íæ¼ÒµÈ¼¶ÇøÓò
	local nLevel = selectLevelArea();
	
	if nLevel < 40 then
		nLevel = 40;
	end; 

	--»ñÈ¡¶¥¼¶É±ÊÖÄ£°åID¼°Ä£°åÃû
	local nTopKillerID = getTopKillerID(nLevel);
	local nTopKillerMode = getTopKillerMode(nTopKillerID);
	
		return nTopKillerName,nTopKillerMode
		 
end;

--É±ËÀÉ±ÊÖµÄ½±Àø
function KillerAward()

local nLevel = GetTask(TASK_PLAYER_LEVEL);
local nRow = tabTaskPay:selectRowNum("Level",nLevel);
--local nExp = tonumber(tabTaskPay:getCell(nRow,"Exp"));
local nExp = GetTask(TASK_PLAYER_LEVEL)*GetTask(TASK_PLAYER_LEVEL)*1.5;
--local nMoney = tonumber(tabTaskPay:getCell(nRow,"Money"));
local nMoney = sqrt(nLevel)*400;
local nReputation = random(3,5);
	ModifyExp(multiple_reward(SYS_KILLER_TASK, nExp));
	Earn(nMoney);
	ModifyReputation(nReputation,0);
	-----------------Ê¥µ®»î¶¯---------------------
		Xmas_prize_get(4)
	--------------------½áÊø------------------------
end;

--»ñÈ¡µØÍ¼´¥·¢Æ÷ID
function GetTriggerID(nMapID)
local nRow = tabTriggerID:selectRowNum("PosID",nMapID);
local nTriggerID = tonumber(tabTriggerID:getCell(nRow,"TriggerID"));
local nCustomID = tonumber(tabTriggerID:getCell(nRow,"CustomID"));

	return nTriggerID,nCustomID;
	
end;


--É±ÊÖÈÎÎñ¼ÆÊ±Æ÷,Ö¸¶¨Ê±¼ä£¨900£©ÄÚÃ»ÓĞµ½´ïÖ¸¶¨µØÍ¼ÔòÈÎÎñÊ§°Ü
function TimeOut()

	RemoveTrigger(GetTrigger(600));
	RemoveTrigger(GetTrigger(500));
	
	TaskTip("B¹n ch­a hoµn thµnh nhiÖm vô trong thêi gian quy ®Şnh, nhiÖm vô truy n· thÊt b¹i!");
	TaskPunish();
	
	SetTask(TASK_KILLER_STATE_STAR,0);
	SetTask(TASK_KILLER_STATE_ID,0);
	
	DelItem(2,0,338,1,1);

end;

-- ÈÎÎñµÄ³Í·£
function TaskPunish()

local nReputation = GetReputation();

-- ¼õÉÙÉùÍû 2 µã

	if nReputation < 2 then
		if nReputation >= 0 then
			ModifyReputation(-nReputation,0);
		end
	else
		ModifyReputation(-2,0);
	end

	Msg2Player("B¹n kh«ng thÓ hoµn thµnh nhiÖm vô, bŞ trõ 2 ®iÓm danh väng!");
	TaskTip("B¹n kh«ng thÓ hoµn thµnh nhiÖm vô, bŞ trõ 2 ®iÓm danh väng!");

end;

-- »ñÈ¡Íæ¼Ò»ı·ÖÏµÊı
function GetPointCoefficient()
	local nLevel = GetTask(TASK_PLAYER_LEVEL);
	local nTaskLevel = floor(nLevel/10)*10
	local nLevelCoefficient = 0;
		if nLevel-nTaskLevel > 5 then	
			nTaskLevel = nTaskLevel + 5;
		end;
		
		if nTaskLevel~=0  then
			nLevelCoefficient = KillerPointData[nTaskLevel][1];
		end;
	
	if nLevelCoefficient~=nil then

	end
	
		return 	nLevelCoefficient 
end;

--°ÑÒ»¸öÃëÊı×ª»»ÎªÊ±£º·Ö£ºÃë
function TurnTime(nSec)

local nHour = floor(nSec/3600);
local nMinute = floor(mod(nSec,3600)/60); 
local nSecond = floor(mod((mod(nSec,3600)),60));
local str = "";

	str = " <color=yellow>"..nHour.."<color> giê <color=yellow>"..nMinute.."<color> phót <color=yellow>"..nSecond.."<color> gi©y ";
	
	return str

end

--»ñÈ¡µ±Ç°ĞÇÆÚ£¬·µ»Ø0¡«6£¨ĞÇÆÚÌì¡«ĞÇÆÚÁù£©
function GetWeekDay()
	return tonumber(date("%w"))
end;

--·µ»Øµ±Ç°Ğ¡Ê±ºÍ·ÖÖÓ
function GetLocalTime()
	nHour = date("%H");
	nMin = date("%M");
	return tonumber(nHour), tonumber(nMin)
end;

--ÖÜÒ»ÖÁÖÜËÄ20µã - 24µã
function CheckTime()

	local nWeek = GetWeekDay();
	if nWeek == 5 or nWeek == 6 or nWeek ==0 then
		return 0
	end;

	--»»Ëã20:01 ¡« 23:59
	local nBegin = 20 * 60 + 1;
	local nEnd = 23 * 60 + 59;
	
	local nHour, nMin = GetLocalTime();
	local nValue = nHour * 60 + nMin;
	if nValue >= nBegin and nValue <= nEnd then
		return 1
	else
		return 0
	end;
end;

function SetTaskSayColor(str)

	local strKey = ":";
	local strKeyLeft = "{";
	local strKeyRight = "}";
	local strKeySex = "<sex>";
	local strPoint = strfind(str,strKey,1)
	local strName = "";
	local strColorText = str;
	
	local strSexChange = GetPlayerSex();
	
	if strPoint~=nil and strPoint>=1 then 
		strName = strsub(str, 1, strPoint-1);
		-- ´¦ÀíÈËÎïÃû³ÆÑÕÉ«
		strColorText = "<color=green>"..strName.."<color>"..strsub(str, strPoint, strlen(str));
	end;
			
	-- ´¦ÀíÖØµã±êÊ¶ÑÕÉ«
	strColorText = join(split(strColorText,strKeyLeft), "<color=yellow>");
	strColorText = join(split(strColorText,strKeyRight), "<color>");
	
	-- ´¦ÀíĞÔ±ğ±êÊ¶
	strColorText = join(split(strColorText,strKeySex), strSexChange);
	
	str = strColorText;
	return str;
	
end;


-- ÓÃÓÚ´¦ÀíÒ»¶ÑÑ¡ÏîµÄ¶Ô»°º¯Êı Say(""...);
function SelectSay(strSay)

local strMsg,strSel = "","";
local strNum = getn(strSay);

	if strNum < 2 then
		return
	end;
	
	if strNum > 2 then
		for i=2,strNum - 1 do
			strSel = strSel..format("%q", strSay[i])..",";
		end;
		strSel = strSel..format("%q", strSay[strNum]);
		strMsg = "Say("..format("%q", SetTaskSayColor(strSay[1]))..","..(strNum - 1)..","..strSel..");";
	elseif strNum == 2 then
		strSel = format("%q", strSay[strNum]);
		strMsg = "Say("..format("%q", SetTaskSayColor(strSay[1]))..",1"..","..strSel..");";
	end;
	
	dostring(strMsg);
	
end;


-- ×Óº¯Êı£¬ÓÃÓÚÀ©Õ¹¶Ô»° TALK º¯ÊıµÄ¹¦ÄÜ
function TalkEx(fun,szMsg)

	local num = getn(szMsg)
	local szmsg = ""
	for i=1,num-1 do
		szmsg = szmsg..format("%q",SetTaskSayColor(szMsg[i]))..","
	end
	szmsg = szmsg..format("%q",SetTaskSayColor(szMsg[num]))
	szmsg = "Talk("..num..","..format("%q",fun)..","..szmsg..")"

	dostring(szmsg)
	
end

-- ×Óº¯Êı£¬ÓÃÒÔ»ñÈ¡Íæ¼ÒµÄĞÔ±ğ£¬Ö±½Ó·µ»Ø×Ö·û´®
function GetPlayerSex()

local mySex -- ÓÃÒÔÏÔÊ¾ÈËÎïĞÔ±ğµÄ×Ö·û

	if (GetSex() == 1) then
		mySex = "§¹i hiÖp"
	elseif (GetSex() == 2) then
		mySex = "N÷ hiÖp "
	end
	
	return mySex
	
end


-- Ê²Ã´Ò²²»×öµÄ¿Õº¯Êı
function Task_Exit()

end;


