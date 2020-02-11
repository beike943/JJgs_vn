
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Ëæ»úÈÎÎñÍ·ÎÄ¼ş
-- Edited by peres
-- 2005/08/08 PM 13:45

-- Ö»ÓĞÍíÉÏËûÃÇÊÇÔÚÒ»ÆğµÄ
-- Ëû¿¿½üËı£¬Óµ±§Ëı
-- ËûµÄÊÖÖ¸ºÍÆ¤·ô
-- Ëı¿´×ÅËû£¬ĞÄÀïÈáÈí¶øÌÛÍ´
-- ËıÏë£¬Ëı»¹ÊÇ°®Ëû
-- Ëı²»Ïë±§Ô¹Ê²Ã´
-- Ã¿ÌìÍíÉÏËûÃÇ¶¼ÔÚ×ö°®
-- Ëı²»ÖªµÀ£¬³ıÁËÕâÖÖ½Ó´¥£¬ËıµÄ°²È«¸ĞºÍÎÂÅ¯£¬»¹ÄÜ´ÓÄÄÀïÈ¡µÃ
-- ËıÏ²»¶ÄÇÒ»Ë²¼ä¡£·Â·ğÔÚºÚ°µµÄ´óº£ÉÏ£¬Æ¯ÏòÊÀ½çµÄ¾¡Í·

-- ======================================================


-- ±í¸ñÎÄ¼şÀàµÄÖ§³ÖÒÔ¼°µØÍ¼Ìø×ªµÄÖ§³Ö
Include("\\script\\task\\random\\task_gotoworld.lua");

-- ¶ÁÈëÈÎÎñÒıÇæ DEBUG Ö§³ÖÎÄ¼ş
Include("\\script\\lib\\task_debug.lua");

-- Êı¾İÎÄ¼şµÄÖ§³Ö
Include("\\script\\task\\random\\task_data.lua");

-- »Ô»ÍÖ®Ò¹
Include("\\script\\shinynight_head.lua");

tabNpcName   = new(KTabFile, "\\settings\\task\\random\\task_npc.txt");  -- NPC Ãû×Ö±í¸ñ
tabTaskType  = new(KTabFile, "\\settings\\task\\random\\task_type.txt"); -- ÈÎÎñÀàĞÍ×Ü±í
tabTalkTask  = new(KTabFile, "\\settings\\task\\random\\task_talk.txt"); -- ¶Ô»°ÈÎÎñÏ¸±í
tabKillTask  = new(KTabFile, "\\settings\\task\\random\\task_kill.txt"); -- É±¹ÖÈÎÎñÏ¸±í
tabCollTask  = new(KTabFile, "\\settings\\task\\random\\task_coll.txt"); -- ÊÕ¼¯ÈÎÎñÏ¸±í

TASKNPC_ID      = 550; -- ÈÎÎñ NPC µÄ ID
TASKSTATE_ID    = 551; -- ÈÎÎñ½øÕ¹³Ì¶ÈµÄ ID
TASKTYPE_ID     = 552; -- ÈÎÎñÀàĞÍµÄ ID
TASKID_ID       = 553; -- ¾ßÌåÈÎÎñµÄ ID
TASKCANCEL_ID   = 554; -- ÈÎÎñÈ¡ÏûÀÛ»ı´ÎÊıµÄ ID
TASKRANDOM_ID   = 555; -- ÈÎÎñËæ»úÖÖ×Ó¼ÇÂ¼
TASKTIMER_ID    = 556; -- ¼ÇÂ¼Ê±¼ä´¥·¢Æ÷µÄË÷Òı
TASKKILL_ID     = 557; -- ¼ÇÂ¼É±¹ÖÈÎÎñ´¥·¢Æ÷µÄË÷Òı

EVENT_NPC_ID    = 100; -- Óë NPC ¶Ô»°µÄ´¥·¢Æ÷ ID
EVENT_TIMER_ID  = 101; -- 15 ·ÖÖÓÆÚÏŞµÄ¼ÆËã ID


-- ÌØÊâ½±Àø
speAward1 = {

	{"Tr­êng QuyÒn Phæ", 0,	107, 51},		
  {"T­îng H×nh Phæ", 0, 107, 52},		
  {"Trung B×nh Phæ", 0,	107, 53},		
  {"Khai S¬n Phæ", 0,	107, 54},		
  {"Khİ LiÖu ThuËt", 0,	107, 55},		
  {"To¸i DiÖp Phæ", 0,	107, 56},		
  {"Tô NguyÖn C«ng Phæ", 0,	107, 57},		
  {"HuyÒn Th¹ch C«ng Phæ", 0,	107, 58},
  
  }
  
speAward2 = {
  {"Tr­êng QuyÒn Phæ", 0,	107, 51},		
  {"T­îng H×nh Phæ", 0, 107, 52},		
  {"Trung B×nh Phæ", 0,	107, 53},		
  {"Khai S¬n Phæ", 0,	107, 54},		
  {"Khİ LiÖu ThuËt", 0,	107, 55},		
  {"To¸i DiÖp Phæ", 0,	107, 56},		
  {"Tô NguyÖn C«ng Phæ", 0,	107, 57},		
  {"HuyÒn Th¹ch C«ng Phæ", 0,	107, 58},
  {"Kim ThiÒn Phæ", 0,	107, 59},
  {"Tu La MËt tŞch", 0,	107, 60},
  {"Bæ Kim MËt tŞch", 0,	107, 61},
  {"Bæ Th¹ch MËt tŞch", 0,	107, 62},
  {"Ngò Quû MËt tŞch", 0,	107, 63},
  
  }
  
speAward3 = {
  {"Tr­êng QuyÒn Phæ", 0,	107, 51},		
  {"T­îng H×nh Phæ", 0, 107, 52},		
  {"Trung B×nh Phæ", 0,	107, 53},		
  {"Khai S¬n Phæ", 0,	107, 54},		
  {"Khİ LiÖu ThuËt", 0,	107, 55},		
  {"To¸i DiÖp Phæ", 0,	107, 56},		
  {"Tô NguyÖn C«ng Phæ", 0,	107, 57},		
  {"HuyÒn Th¹ch C«ng Phæ", 0,	107, 58},
  {"Kim ThiÒn Phæ", 0,	107, 59},
  {"Tu La MËt tŞch", 0,	107, 60},
  {"Bæ Kim MËt tŞch", 0,	107, 61},
  {"Bæ Th¹ch MËt tŞch", 0,	107, 62},
  {"Ngò Quû MËt tŞch", 0,	107, 63},
  {"Thiªn Hµ MËt tŞch", 0,	107, 64},
  {"Tö Hµ MËt tŞch", 0,	107, 65},
  {"Chiªm Y Phæ", 0,	107, 66},
  
}

--Ê¦ÃÅÃØóÅ£¬ĞÄ·¨
FactionBook = {
	--½ğ¸Õ·üÄ§¾­,½ğ¸Õ·üÄ§ĞÄ·¨,ÉÙÁÖÁîÅÆ
	[2] = {{0,107,1},{0,107,2},{2,0,205},"ThiÕu L©m"},
	--ÎŞ³¾ÃØ¼®,ÎŞ³¾ĞÄ·¨,ÉÙÁÖÁîÅÆ    
	[3] = {{0,107,5},{0,107,6},{2,0,205},"ThiÕu L©m"},
	--Ç±ÁúÃØ¼®,Ç±ÁúĞÄ·¨,ÉÙÁÖÁîÅÆ
	[4] = {{0,107,3},{0,107,4},{2,0,205},"ThiÕu L©m"},
	--ÌìÂŞÃØ¼®,ÌìÂŞĞÄ·¨,ÌÆÃÅÁîÅÆ
	[6] = {{0,107,7},{0,107,8},{2,0,209},"§­êng M«n"},
	--ÈçÒâÃØ¼®,ÈçÒâĞÄ·¨,¶ëáÒÁîÅÆ
	[8] = {{0,107,9},{0,107,10},{2,0,207},"Nga My"},
	--±Ìº£Æ×,±Ìº£ĞÄ·¨,¶ëáÒÁîÅÆ
	[9] = {{0,107,11},{0,107,12},{2,0,207},"Nga My"},
	--»ìãçÃØ¼®,»ìãçĞÄ·¨,Ø¤°ïÁîÅÆ
	[11] = {{0,107,13},{0,107,14},{2,0,208},"C¸i Bang"},
	--ŞñÌìÃØ¼®,ŞñÌìĞÄ·¨,Ø¤°ïÁîÅÆ
	[12] = {{0,107,15},{0,107,16},{2,0,208},"C¸i Bang"},
	--»ÃÓ°ÃØ¼®,»ÃÓ°ĞÄ·¨,Îäµ±ÁîÅÆ
	[14] = {{0,107,17},{0,107,18},{2,0,206},"Vâ §ang"},
	--¾ı×ÓÃØ¼®,¾ı×ÓĞÄ·¨,Îäµ±ÁîÅÆ
	[15] = {{0,107,19},{0,107,20},{2,0,206},"Vâ §ang"},
	--Ç¹ÆïÃØ¼®,Ç¹ÆïĞÄ·¨,ÑîÃÅÁîÅÆ
	[17] = {{0,107,21},{0,107,22},{2,0,350},"D­¬ng M«n"},
	--¹­ÆïÃØ¼®,¹­ÆïĞÄ·¨,ÑîÃÅÁîÅÆ
	[18] = {{0,107,23},{0,107,24},{2,0,350},"D­¬ng M«n"},
	--Ğ°ÏÀÃØ¼®£¬Ğ°ÏÀĞÄ·¨,Îå¶¾ÁîÅÆ
	[20] = {{0,107,25},{0,107,26},{2,0,390},"Ngò §éc"},
	--¹ÆÊ¦ÃØ¼®£¬¹ÆÊ¦ĞÄ·¨,Îå¶¾ÁîÅÆ
	[21] = {{0,107,27},{0,107,28},{2,0,390},"Ngò §éc"},
}

-- ´ÓÈÎÎñÀàĞÍ±íÖĞ¸ù¾İÈ¨ÖØÑ¡ÔñÒ»¸öÈÎÎñÀàĞÍ
function SelectTaskType()
    
local nLevel      = SelectPlayerLevel(); -- Ñ¡ÔñÒ»¸öÈÎÎñÇø¼ä
local aryRate     = tabTaskType:createArray("Rate"..nLevel); -- ¹¹ÔìÒ»¸öÊı×é
local nRow        = GetRateForArray(aryRate);
    
local nTaskType   = tonumber(tabTaskType:getCell(nRow, "TaskType"));
	  
	CDebug:MessageOut("NhËn ®­îc lo¹i nhiÖm vô:"..nTaskType);
	return nTaskType;
    
end;
    
    
-- ¸ù¾İÈÎÎñÀàĞÍÑ¡È¡Ò»¸ö¾ßÌåµÄÈÎÎñ
function SelectTask(nTaskType)

local nLevel      = SelectPlayerLevel(); -- Ñ¡ÔñÒ»¸öÈÎÎñÇø¼ä
local tabTaskFile = GetTaskTableFile(nTaskType);
local aryRate = {};
local nRow = 0;

	aryRate = tabTaskFile:createArray("Rate"..nLevel);
	nRow    = GetRateForArray(aryRate);
	
	CDebug:MessageOut("NhËn ®­îc nhiÖm vô cô thÓ:"..nRow);
	return nRow;

end;


-- ´ÓÈËÎïÁĞ±íÖĞÑ¡ÔñÒ»¸öÈÎÎñÈËÎï
function SelectTaskNpc()

local nRow = tabNpcName:getRow();
local nRandom = random(3, nRow);
local nNpcID = tabNpcName:getCell(nRandom, "NpcID");

	CDebug:MessageOut("NhËn ®­îc ID cña NPC nhiÖm vô:"..nNpcID);
	return nNpcID, nRandom;

end;


-- ¸æËßÍæ¼ÒÈÎÎñ½Ó¿Ú NPC£¬ÈÎÎñ×´Ì¬Îª£º1
function CreateTask()
	local nNpcID, nRow   = SelectTaskNpc();   -- µÃµ½ÈÎÎñ NPC µÄID ºÍĞĞÊı
	local nTaskType      = SelectTaskType();           -- µÃµ½Ò»¸öÈÎÎñµÄÀàĞÍ
	local nRow           = SelectTask(nTaskType);      -- µÃµ½Ò»¸öÈÎÎñµÄ¾ßÌåĞĞºÅ
	local tabTask        = GetTaskTableFile(nTaskType);
	local nTaskID        = tabTask:getCell(nRow, "TaskID"); -- »ñÈ¡ ID
	local nTimerIndex    = 0;
	
	CDebug:MessageOut("Lo¹i nhiÖm vô:"..nTaskType.."  Sè hµng nhiÖm vô:"..nRow);
	if CreateTrigger(4, nNpcID, EVENT_NPC_ID) == 0 then
		WriteLog("[Lçi nhiÖm vô s­ m«n]:task_head.lua Lçi CreateTask ë hµm sè, CreateTrigger(4. nNpcID, EVENT_NPC_ID), trŞ nNpcID:"..nNpcID..". Tªn:"..GetName());
		return 0;	--´´½¨Ê§°Ü
	end;
	CDebug:MessageOut("B¾t ®Çu xuÊt hiÖn: Npc ID:"..nNpcID);
	-- ½«ÈÎÎñµÄÄÚÈİ¼ÇÂ¼µ½ÈÎÎñ±äÁ¿ÖĞ
	SetTask(TASKTYPE_ID, nTaskType);
	SetTask(TASKID_ID, nTaskID);
	SetTask(TASKNPC_ID, nNpcID);
	SetTask(TASKSTATE_ID, 1);
		
	nTimerIndex = CreateTrigger(1, 100, EVENT_TIMER_ID); -- ¿ªÊ¼Ò»¸öÊ±¼ä¼ÆÊıÆ÷
	
	ContinueTimer(nTimerIndex);
	SetTask(TASKTIMER_ID, nTimerIndex);
	
	-- Èç¹ûÉíÉÏÃ»ÓĞĞÅº¯µÄ»°ÄÇ¾Í¼ÓÉÏÒ»·â
	if GetItemCount(2,0,135)<=0 then
		AddItem(2,0,135,1);
	end;
	
	CDebug:MessageOut("NhiÖm vô kiÕn lËp hoµn thµnh, nhiÖm vô ®­îc tİnh 1");
	return 1;
end;


-- ¸æËßÍæ¼ÒÈÎÎñ NPC µÄÎ»ÖÃ
function ShowTaskNpc()

local nNpcID         = GetTask(TASKNPC_ID);
local nRow           = tabNpcName:selectRowNum("NpcID", nNpcID);

local nNpcMapID      = tonumber(tabNpcName:getCell(nRow, "MapID")); -- µÃµ½ÈÎÎñ NPC ËùÔÚµØÍ¼ID

local strNpcName     = tabNpcName:getCell(nRow, "NpcName"); -- µÃµ½ÈÎÎñ NPC µÄÃû×Ö
local strNpcMap      = tabNpcName:getCell(nRow, "NpcMap");  -- µÃµ½ÈÎÎñ NPC ËùÔÚµØÍ¼ÖĞÎÄÃû

local strBossName    = FactionBossName[GetPlayerFaction()];
local strBossTitle   = FactionBossTitle[GetPlayerFaction()];

	Say("B¹n nhËn ®­îc bå c©u ®­a th­ cña"..strBossTitle.."{bå c©u ®­a th­}"..strBossName.."nhê b¹n ®Õn <color=yellow>"..strNpcMap.."<color> t×m <color=yellow>"..strNpcName.."<color>, ng­êi nµy cÇn sù gióp ®ì cña b¹n, ®ång thêi dÆn b¹n dï thÕ nµo còng ph¶i hoµn thµnh nhiÖm vô ®­îc giao!",
		3,
		"TiÕp nhËn nhiÖm vô vµ ®i ®Õn n¬i ®ã/#AcceptTask("..nNpcMapID..")",
		"Ta cã viÖc råi, §Ó khi kh¸c ®i!/Main_Exit",
		"Tõ chèi nhiÖm vô/CancelTask_Confirm");
end;


-- ÓÉÈÎÎñ NPC ¸æËßÍæ¼ÒÈÎÎñµÄÏêÏ¸Çé¿ö£¬ÈÎÎñ×´Ì¬Îª 2
function ShowTask()

local nTaskType = GetTask(TASKTYPE_ID);
local nTask     = GetTask(TASKID_ID);
local tabTask   = GetTaskTableFile(nTaskType);
local nRow      = tabTask:selectRowNum("TaskID", nTask);
local nMapID    = tabTask:getCell(nRow, "MapID");

local strInfo   = tabTask:getCell(nRow, "TaskText");
local strName = GetTargetNpcName();

	if strName==nil or strName=="" then 
		strName = ""; 
	end;
	
	SetTask(TASKSTATE_ID, 2); -- ½«ÈÎÎñ½ø³ÌÉèÎª 2
	
	StartTaskEvent(nTaskType, nTask); -- ¿ªÊ¼ÈÎÎñËù±ØĞëµÄ´¥·¢Æ÷
	CDebug:MessageOut("Ng­êi ch¬i kÕt thóc ®èi tho¹i víi NPC, nhiÖm vô ®­îc tİnh 2");
	
	if nMapID=="" or nMapID==nil then
		Say("<color=green>"..strName.."<color>: "..strInfo, 0);
	else
		nMapID = tonumber(nMapID)
		Say("<color=green>"..strName.."<color>: "..strInfo, 2, 
			"§Õn n¬i lµm nhiÖm vô/#gotoWorld("..nMapID..")",
			"BiÕt råi!/Main_Exit");
	end;
	
end;


-- ¿ªÆôÒ»¸ö¾ßÌåÈÎÎñµÄ´¥·¢Æ÷
function StartTaskEvent(nTaskType, nTask)

local nNpcID         = GetTask(TASKNPC_ID);
local tabTask        = GetTaskTableFile(nTaskType);
local nRow           = tabTask:selectRowNum("TaskID", nTask);
local nEventID       = tabTask:getCell(nRow, "EventID");
local nKillIndex     = 0;

	if nTaskType==1 then
		CreateTrigger(4, nTask, EVENT_NPC_ID); -- ¶Ô»°ÈÎÎñ
	elseif nTaskType==2 then
		CreateTrigger(4, nNpcID, EVENT_NPC_ID); -- ÊÕ¼¯ÈÎÎñ£¬ÕÕ¾É´¥·¢ÈËÎï
	elseif nTaskType==3 then
		-- ´æ´¢É±¹Ö¼ÆÊıµÄ´¥·¢Æ÷Ë÷Òı
		nKillIndex = CreateTrigger(0, nEventID, EVENT_NPC_ID); -- É±¹ÖÈÎÎñ
		SetTask(TASKKILL_ID, nKillIndex);
	end;
	
end;


-- ½ÓÊÜÈÎÎñ²¢Ç°ÍùÈÎÎñËùÔÚµØ
function AcceptTask(nMapID)
local nMap = GetWorldPos()
	--Ñ©ÕÈ³¡µØ²»ÄÜÊ¹ÓÃÊ¦¸¸ÃÜº¯³öËÍÀë¿ªµØÍ¼
	if nMap >= 961 and nMap <= 965 then
		Talk(1,"","Khu vùc nµy kh«ng thÓ ®­a tíi n¬i lµm nhiÖm vô s­ m«n, mêi b¹n rêi khái míi sö dông mËt hµm s­ phô!")
		return
	end
	if GetTask(1715) ~= 0 then
		Talk(1,"","Khu vùc nµy kh«ng thÓ ®­a tíi n¬i lµm nhiÖm vô s­ m«n, mêi b¹n rêi khái míi sö dông mËt hµm s­ phô!")
		return
	end;
	gotoWorld(nMapID);
end;


-- È·ÈÏÈ¡ÏûÈÎÎñ
function CancelTask_Confirm()

local strBossTitle   = FactionBossTitle[GetPlayerFaction()];

	Say("B¹n ®ång ı hñy nhiÖm vô"..strBossTitle.."nµy? NÕu liªn tôc hñy 2 lÇn b¹n sÏ mÊt <color=yellow>1<color> ®iÓm danh väng!",
		2,
		"§­îc/CancelTask",
		"§Ó xem l¹i!/ShowTaskNpc");

end;

-- È¡ÏûÈÎÎñºóµÄÌáÊ¾
function CancelTask()

local nLost = GetTask(TASKCANCEL_ID);

	nLost = nLost + 1;
	
	if nLost>=2 then
		nLost = 0;
		SetTask(TASKCANCEL_ID, nLost); -- ½«ÀÛ»ıÊ§°Ü´ÎÊıÇå¿Õ
		-- ÈÎÎñ´¦·£
		TaskPunish();
		return
	end;
	
	SetTask(TASKSTATE_ID, 0); -- ½«ÈÎÎñ×´Ì¬±äÎª»¹Î´¿ªÊ¼
	SetTask(TASKCANCEL_ID, nLost);
	local nTriggerID = GetTrigger(EVENT_NPC_ID);
	if nTriggerID ~= 0 then
		RemoveTrigger(nTriggerID);
	end;
end;


-- ÈÎÎñµÄ³Í·£
function TaskPunish()

-- ¼õÉÙÉùÍû 5 µã
Msg2Player("Do b¹n ch­a hoµn thµnh nhiÖm vô ®iÓm danh väng gi¶m 1");
TaskTip("Do b¹n ch­a hoµn thµnh nhiÖm vô ®iÓm danh väng gi¶m 1");
ModifyReputation(-1,0);

end;


-- ¼ì²éÈÎÎñÊÇ·ñÍê³É
function CheckTask()

local nTaskType = GetTask(TASKTYPE_ID);
local nTask     = GetTask(TASKID_ID);

local tabTask   = GetTaskTableFile(nTaskType);
local nRow      = tabTask:selectRowNum("TaskID", nTask);

local nGenre, nDetail, nParticular, nNum = 0,0,0,0;

	-- ¶Ô»°ÈÎÎñµÄ´¦Àí
	if nTaskType==1 then
		return 1;
	end;
	
	-- ÊÕ¼¯ÈÎÎñµÄ´¦Àí
	if nTaskType==2 then
	
		nGenre      = tonumber(tabTask:getCell(nRow, "Genre"));
		nDetail     = tonumber(tabTask:getCell(nRow, "Detail"));
		nParticular = tonumber(tabTask:getCell(nRow, "Particular"));
		nNum        = tonumber(tabTask:getCell(nRow, "Num"));
		
		if GetItemCount(nGenre, nDetail, nParticular)>= nNum then
			DelItem(nGenre, nDetail, nParticular, nNum);
			return 1;
		else
			return 0;
		end;

	end;
	
	-- É±¹ÖÈÎÎñµÄ´¦Àí
	if nTaskType==3 then
		return 1;
	end;
	
	return 0;

end;


-- Íê³ÉÈÎÎñ²¢·¢Óè½±Àø£¬ÈÎÎñ½øÕ¹Îª 3
function FinishTask()

local nTimerIndex = GetTask(TASKTIMER_ID);

	PauseTimer(nTimerIndex);
	RemoveTrigger(nTimerIndex);
	
	-- Íê³ÉÈÎÎñ£¬ÉèÖÃÈÎÎñ½øÕ¹Îª 3
	SetTask(TASKSTATE_ID, 3);
	
	-- ½«Ê§°ÜÀÛ»ıÇå¿Õ
	SetTask(TASKCANCEL_ID, 0);
	
	-- Èç¹ûÊÇ»Ô»ÍÖ®Ò¹»î¶¯ÆÚ¼ä£¬Ôò·¢Á½´Î½±Àø
	local multiple = get_reward_multiple(SYS_MASTER_RANDOMTASK)
	--local times = ceil(multiple)
	local times = 2  --¹Ì¶¨½±ÀøÎª2 
	PayAward(multiple, times)
end;

-- ·¢½±º¯Êı
function PayAward(multiple, times)

	local nTaskType = GetTask(TASKTYPE_ID);
	local nTask     = GetTask(TASKID_ID);
	local tabTask   = GetTaskTableFile(nTaskType);
	local nRow      = tabTask:selectRowNum("TaskID", nTask);
	local nValue    = floor(tonumber(tabTask:getCell(nRow, "Value")) * 3.5); -- »ù´¡¼ÛÖµ³ËÒÔ 2.5 ±¶
	
	local strBossTitle   = FactionBossTitle[GetPlayerFaction()];
	local strName = GetTargetNpcName();
	
	local nSpe      = 0;
	
	if strName==nil or strName=="" then strName = ""; end;
	
	CDebug:MessageOut("B¾t ®Çu ph¸t th­ëng, phÇn th­ëng lµ:"..nValue);

	nValue = nValue * multiple
	ModifyExp(nValue);
	
	local nRoute = GetPlayerRoute();
	local nlevel = GetLevel()
	local a = 0;
	local b = 0;
 
 	for i=1, times do
	-- ÓĞ 5% µÄ¸ÅÂÊµÃµ½Ò»¸öÌØÊâ½±Àø
		if random(1, 100)<=5 then
			if random(1,100)<=40 then
				AddItem(2, 1, 148, 1, 1);
				a = 1;				
		  	elseif random(1,100)<=20 and nlevel>=45 then
		  		if FactionBook[nRoute][1][1] ~= nil then
		    		AddItem(FactionBook[nRoute][1][1], FactionBook[nRoute][1][2], FactionBook[nRoute][1][3], 1, 1);
					a = 2;
				end		  
		  	elseif random(1,100)<=20 and nlevel>=45 then
		  		if FactionBook[nRoute][2][1] ~= nil then
		  			AddItem(FactionBook[nRoute][2][1], FactionBook[nRoute][2][2], FactionBook[nRoute][2][3], 1, 1);		    
		    		a = 2;
		  		end
		  	else
		    	if nlevel>=50 then
				    nSpe = random(1, getn(speAward3));
				    AddItem(speAward3[nSpe][2],
					    speAward3[nSpe][3],
				    	speAward3[nSpe][4],
				    	1, 1); 
					a = 2;
				elseif nlevel>=30 and nlevel<=49 then
			    	nSpe = random(1, getn(speAward2));
			    	AddItem(speAward2[nSpe][2],
					    speAward2[nSpe][3],
				    	speAward2[nSpe][4],
			    		1, 1);
					a = 2;
				elseif nlevel<=29 then
			    	nSpe = random(1, getn(speAward1));
			    	AddItem(speAward1[nSpe][2],
				    	speAward1[nSpe][3],
				    	speAward1[nSpe][4],
				    	1, 1);
					a = 2;
				end;
		  	end;
		end;
		
		-- ÓĞ5%µÄ¸ÅÂÊµÃµ½Ê¦ÃÅÁîÅÆ 
		if random(1, 100)<=5 then
			AddItem(FactionBook[nRoute][3][1], FactionBook[nRoute][3][2], FactionBook[nRoute][3][3], 1, 1);
			b = 1;
		end;
	end
		
	if a==0 and b==0 then
		Say("<color=green>"..strName.."<color>: Kh¸ l¾m! Ng­¬i ®· hoµn thµnh nhiÖm vô cña"..strBossTitle..", ®©y lµ phÇn th­ëng! <enter><enter>Kinh nghiÖm:"..nValue,0);		
	elseif a==1 and b==0 then 
		Say("<color=green>"..strName.."<color>: Kh¸ l¾m! Ng­¬i ®· hoµn thµnh nhiÖm vô cña"..strBossTitle..", ®©y lµ phÇn th­ëng! <enter><enter>Kinh nghiÖm:"..nValue.."<enter>VËt phÈm ®Æc biÖt: m¶nh B¨ng th¹ch",0);
		Msg2Faction(FactionBook[nRoute][4], "§Ö tö"..GetName().." Hoµn thµnh nhiÖm vô s­ m«n nhËn ®­îc m¶nh B¨ng th¹ch");
	elseif a==2 and b==0 then
		Say("<color=green>"..strName.."<color>: Kh¸ l¾m! Ng­¬i ®· hoµn thµnh nhiÖm vô cña"..strBossTitle..", ®©y lµ phÇn th­ëng! <enter><enter>Kinh nghiÖm:"..nValue.."<enter>VËt phÈm ®Æc biÖt: MËt tŞch",0);
		Msg2Faction(FactionBook[nRoute][4], "§Ö tö"..GetName().." Hoµn thµnh nhiÖm vô s­ m«n nhËn ®­îc MËt tŞch");
	elseif a==0 and b==1 then
		Say("<color=green>"..strName.."<color>: Kh¸ l¾m! Ng­¬i ®· hoµn thµnh nhiÖm vô cña"..strBossTitle..", ®©y lµ phÇn th­ëng! <enter><enter>Kinh nghiÖm:"..nValue.."<enter>VËt phÈm ®Æc biÖt: LÖnh bµi s­ m«n",0);
		Msg2Faction(FactionBook[nRoute][4], "§Ö tö"..GetName().." Hoµn thµnh nhiÖm vô s­ m«n nhËn ®­îc LÖnh bµi s­ m«n");
	elseif a==1 and b==1 then
		Say("<color=green>"..strName.."<color>: Kh¸ l¾m! Ng­¬i ®· hoµn thµnh nhiÖm vô cña"..strBossTitle..", ®©y lµ phÇn th­ëng! <enter><enter>Kinh nghiÖm:"..nValue.."<enter>VËt phÈm ®Æc biÖt: LÖnh bµi s­ m«n vµ m¶nh B¨ng th¹ch",0);
		Msg2Faction(FactionBook[nRoute][4], "§Ö tö"..GetName().." Hoµn thµnh nhiÖm vô s­ m«n nhËn ®­îc LÖnh bµi s­ m«n vµ m¶nh B¨ng th¹ch");
	elseif a==2 and b==1 then
		Say("<color=green>"..strName.."<color>: Kh¸ l¾m! Ng­¬i ®· hoµn thµnh nhiÖm vô cña"..strBossTitle..", ®©y lµ phÇn th­ëng! <enter><enter>Kinh nghiÖm:"..nValue.."<enter>VËt phÈm ®Æc biÖt: LÖnh bµi s­ m«n vµ MËt tŞch",0);
		Msg2Faction(FactionBook[nRoute][4], "§Ö tö"..GetName().." Hoµn thµnh nhiÖm vô s­ m«n nhËn ®­îc LÖnh bµi s­ m«n vµ MËt tŞch");
	end;
	
	-- Ôö¼Ó 2 µãÉùÍû
	ModifyReputation(2 * multiple, 0);  
end;
  
  
-- µÃµ½ÈÎÎñµÄ¼òÃ÷ĞÅÏ¢
function GetTaskClearInfo()
  
local nTaskType = GetTask(TASKTYPE_ID);
local nTask     = GetTask(TASKID_ID);
local tabTask   = GetTaskTableFile(nTaskType);
local nRow      = tabTask:selectRowNum("TaskID", nTask);

local strInfo   = "";
local strMain   = "";

	if (nTaskType==2) then
		strInfo = tabTask:getCell(nRow, "GoodsName");
		strMain = "§i thu thËp <color=yellow> "..strInfo.." <color>.";
	elseif (nTaskType==3) then
		strInfo = tabTask:getCell(nRow, "KillNpc");
		strMain = "§i giÕt <color=yellow> "..strInfo.." <color>.";	
	end;
	
	return strMain;

end;


-- ¸ù¾İÈÎÎñ ID ºÅÀ´·µ»ØÏàÓ¦µÄÈÎÎñ±í¸ñ
function GetTaskTableFile(nTaskType)

local tabTaskFile;

	if nTaskType==1 then
		tabTaskFile = tabTalkTask;
	elseif nTaskType==2 then
		tabTaskFile = tabCollTask;
	elseif nTaskType==3 then
		tabTaskFile = tabKillTask;
	end;
	
	return tabTaskFile;
	
end;

-- ´ÓÒ»¸ö¶àÎ¬Êı×éÀï¹¹ÔìÒ»¸öµ¥Î¬È¨ÖØÊı×é
-- ´«Èë²ÎÊı£ºary:table Êı×é£¬nCol:int ÁĞÊı¡¢Êı×éµÄË÷Òı
function CreateRateArray(ary, nCol)

local aryReturn = {};
local i=0;

	for i=1, getn(ary) do
		tinsert(aryReturn, ary[i][nCol]);
	end;
	
	return aryReturn;

end;


-- ´ÓÒ»ÁĞ´øÈ¨ÖØµÄÊı×éÀïÃæÑ¡³öÒ»¸ö
-- ´«Èë²ÎÊı£ºary:table µ¥Î¬Êı×é
function GetRateForArray(ary)

local nRandom = 0;
local nAdd = 0;
local i,j=0

	for i=1, getn(ary) do
		nAdd = nAdd + ary[i];
	end;
	
	nRandom = random(1, nAdd);
	
	nAdd = 0;
	
	for i=1, getn(ary) do
		nAdd = nAdd + ary[i];
		if nAdd>=nRandom then
			return i+2;
		end;
	end;
	
	return 0;
	
end;


-- ¸ù¾İÍæ¼ÒµÈ¼¶À´¾ö¶¨ÆäËùÔÚµÄµÈ¼¶Çø¼ä
function SelectPlayerLevel()

local nLevel = GetLevel();

	if nLevel<10 then return 10; end;
	
	if nLevel>100 then return 100; end;
	
	return floor(nLevel/10)*10;

end;


-- Ê²Ã´Ò²²»×öµÄ¿Õº¯Êı
function Main_Exit()

end;