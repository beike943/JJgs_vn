Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\define.lua");
Include("\\script\\lib\\sdb.lua");
--Include("\\script\\lib\\talktmp.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\system_switch_config.lua")

--¿ò¼ÜµÄÖØĞÂ¸ã¶¨£º£©
--1¡¢Èı¸ö±íµÄÌî³ä
--tGtNpcInfo:Êı¾İÄÚÈİÎªmain.txt + dialog.txt
function gf_ReadAllInfo(nGTaskID)	--´úÂëÓëÔ­°æÓĞÖØ¸´£¬´úÕûÀí
	tGtNpcInfo = tGtNpcInfo or {}
	if tGtNpcInfo[nGTaskID] ~= nil then
		return 1
	end
	
	for i = 3,TABLE_GT_MAIN:getRow() do
		local nTaskID = tonumber(TABLE_GT_MAIN:getCell(i,2));
		if nGTaskID == nTaskID then
			tGtNpcInfo[nTaskID] = {};
			tGtNpcInfo[nTaskID].name = TABLE_GT_MAIN:getCell(i,1);
			tGtNpcInfo[nTaskID].from_npc = TABLE_GT_MAIN:getCell(i,4);
			tGtNpcInfo[nTaskID].to_npc = TABLE_GT_MAIN:getCell(i,5);
			tGtNpcInfo[nTaskID].data = {};
			tGtNpcInfo[nTaskID].get_talk = {};
			tGtNpcInfo[nTaskID].finish_talk = {};
			tGtNpcInfo[nTaskID].data[1] = TABLE_GT_MAIN:getCell(i,3);
			--ExCondition
			local sExpression = tGtCondition:get_sub(TABLE_GT_MAIN:getCell(i,6));
			if sExpression == nil or sExpression == "" then --Èç¹û¿ÕµÄ·µ»Ø1
				sExpression = "1";
			end
			local strCondition = "function GtExCondition() return "..sExpression.." end";
			dostring(strCondition);
			tGtNpcInfo[nTaskID].data[2] = GtExCondition;
			--FinishCondition
			sExpression = tGtCondition:get_sub(TABLE_GT_MAIN:getCell(i,7));
			if sExpression == nil or sExpression == "" then
				sExpression = "1";
			end			
			strCondition = "function GtFinishCondition() return "..sExpression.." end";
			dostring(strCondition);
			tGtNpcInfo[nTaskID].data[3] = GtFinishCondition;
			--Action
			sExpression = tGtPrize:get_sub(TABLE_GT_MAIN:getCell(i,8));
			strCondition = "function GtAction() return "..sExpression.." end";
			dostring(strCondition);
			tGtNpcInfo[nTaskID].data[4] = GtAction;
			--Prize
			sExpression = tGtPrize:get_sub(TABLE_GT_MAIN:getCell(i,9));
			strCondition = "function GtPrize() return "..sExpression.." end";
			dostring(strCondition);
			tGtNpcInfo[nTaskID].data[5] = GtPrize;			
			tGtNpcInfo[nTaskID].data[6] = TABLE_GT_MAIN:getCell(i,10); --µÚ6ÏîÎªAction¿Õ¼ä¸ºÖØ
			tGtNpcInfo[nTaskID].data[7] = TABLE_GT_MAIN:getCell(i,11); --µÚ7ÏîÎªPrize¿Õ¼ä¸ºÖØ
			tGtNpcInfo[nTaskID].data[8] = TABLE_GT_MAIN:getCell(i,12); --µÚ8ÏîÎªÈ¡ÏûÈÎÎñ
			tGtNpcInfo[nTaskID].data[9] = TABLE_GT_MAIN:getCell(i,13); --µÚ9ÏîÎªÌø¹ıÈÎÎñ
			tGtNpcInfo[nTaskID].data[10] = TABLE_GT_MAIN:getCell(i,7); --µÚ10ÏîÎªÍê³ÉÌõ¼ş£¬ÎªÁËÉ¾³ıÎïÆ·	
			
			for k = 3,TABLE_GT_DIALOG:getRow() do
				if tonumber(TABLE_GT_DIALOG:getCell(k,1)) == nTaskID then
					local sTalkType = TABLE_GT_DIALOG:getCell(k,2);
					for m = 3,22 do
						local StrTalk = TABLE_GT_DIALOG:getCell(k,m);
						if StrTalk ~= nil and StrTalk ~= "" then
							tinsert(tGtNpcInfo[nTaskID][sTalkType],StrTalk);								
						else
							break;
						end
					end
					tGtNpcInfo[nTaskID][sTalkType].tip = TABLE_GT_DIALOG:getCell(k,24);  
				end
			end
		
			return 1
		end
	end
	
	return 0
end

--gf_ReadAllInfo();

--g_GtCondition condition.txt
function gf_ReadCondition()
	g_GtCondition = g_GtCondition or {}

	if g_GtCondition[1] ~= nil then
		return
	end
	
	for i = 3, TABLE_GT_CONDITION:getRow() do
		local nConditionID = TABLE_GT_CONDITION:getCell(i, 1);
		g_GtCondition[nConditionID] = {}
		g_GtCondition[nConditionID][1] = TABLE_GT_CONDITION:getCell(i, 2);
		for j = 3,8 do
			g_GtCondition[nConditionID][j-1] = TABLE_GT_CONDITION:getCell(i, j);
		end
	end
end

--gf_ReadCondition();

--g_GtPrize prize.txt
function gf_ReadPrize()
	g_GtPrize = g_GtPrize or {}
	
	if g_GtPrize[1] ~= nil then
		return
	end
	
	for i = 3, TABLE_GT_PRIZE:getRow() do
		local nPrizeID = TABLE_GT_PRIZE:getCell(i, 1);
		g_GtPrize[nPrizeID] = {}
		g_GtPrize[nPrizeID][1] = TABLE_GT_PRIZE:getCell(i, 2);
		for j = 3,8 do
			g_GtPrize[nPrizeID][j-1] = TABLE_GT_PRIZE:getCell(i, j);
		end
	end
end

--gf_ReadPrize();


--¹ÜÀíÃ¿¸öÍæ¼ÒÉíÉÏµÄgtask
tGtTaskManage = {};

--gtaskÖĞµÚÒ»¸ö¿Õ³öÀ´µÄÈÎÎñ±äÁ¿
function tGtTaskManage:FirstEmptyTask()
	for i = tGtTask.GT_TASK_ID_START, tGtTask.GT_TASK_ID_START+tGtTask.GLV_GT_TASK_NUM do
		if GetTask(i) == 0 then
			return i;
		end
	end
	
	return 0
end

--gtaskÊÇ·ñ¿ÉÒÔÌí¼ÓĞÂµÄÈÎÎñ
function tGtTaskManage:IsCanAddNewTask()
	if tGtTaskManage:FirstEmptyTask() == 0 then
		return 0
	else
		return 1
	end
end

--ÉèÖÃgtaskÖĞµÄÈÎÎñ±ê¼ÇÎ»
--nValue
	--1 ±íÊ¾ÒÑ¾­Íê³É
	--0 ±íÊ¾Î´Íê³É
function tGtTaskManage:SetTaskStateBit(nTaskID, nValue)
	local nTabIdx,nBit = 0,0;
	nTabIdx = ceil(nTaskID/31);
	nBit = mod(nTaskID,31);	
	if nBit == 0 then
		nBit = 31;
	end
	gf_SetTaskBit(tGtTask.tGtTaskID[nTabIdx],nBit,nValue);  
end

--gtaskÖĞÌí¼ÓÒ»¸öÈÎÎñ
--1¡¢Ìí¼Ó
--2¡¢½«ÈÎÎñ×´Ì¬ÉèÎªÎ´Íê³É
--·µ»ØÖµ
	--1¡¢Ìí¼Ó³É¹¦
	--2¡¢Ìí¼ÓÊ§°Ü£¬Ô­ÒòÊÇÒÑÂú
function tGtTaskManage:AddTask(nGTaskID)
	local nTaskID = self:FirstEmptyTask();
	if nTaskID ~= 0 then
		self:SetTaskStateBit(nGTaskID, 0);
		SetTask(nTaskID, nGTaskID);
		return 1
	else
		return 0
	end
end

--ÒÆ³ıÒ»¸öÈÎÎñ
--1¡¢ÒÆ³ı
--2¡¢½«ÈÎÎñ×´Ì¬ÉèÎªÍê³É
--·µ»ØÖµ
	--1 ³É¹¦
	--2 Ã»ÓĞ´ËÈÎÎñ
function tGtTaskManage:DeleteTask(nTaskID, nIsOver)
	local nTaskReturn = 0
	for i = tGtTask.GT_TASK_ID_START,tGtTask.GT_TASK_ID_START+tGtTask.GLV_GT_TASK_NUM do
		if GetTask(i) == nTaskID then
			SetTask(i,0);
			for j = 1,tGtTask.GLV_GT_TASK_ADD - 1 do 
				SetTask(i+(tGtTask.GLV_GT_TASK_NUM+1)*j,0);
			end
			nTaskReturn = i;
			break;
		end
	end
	
	if nTaskReturn ~= 0 then	--ÓĞ£¬²¢ÇÒÒÑ¾­É¾³ı
		if  nIsOver == 1 then
			tGtTaskManage:SetTaskStateBit(nTaskID, 1);
		else
			tGtTaskManage:SetTaskStateBit(nTaskID, 0);
		end
		tGtTask:remove_trigger(nTaskID)
	end
end

--ÊÇ·ñ½Óµ½gtaskÖĞnGTaskID¶ÔÓ¦µÄÈÎÎñ
function tGtTaskManage:IsGetGTaskID(nGTaskID)
	if tGtTask:get_task(nGTaskID) == 0 then
		return 0
	else
		return 1
	end
end

function tGtTaskManage:AddTaskInfo(nGTaskID)
	return gf_ReadAllInfo(nGTaskID)
end

function tGtTaskManage:IsTSDLTask(nGTaskID)
	for n = 2,TABLE_GT_TSDL:getRow() do
		if tonumber(TABLE_GT_TSDL:getCell(n,1)) == nGTaskID then	--ÍêÁËÍêÁË£¬Õâ¸öÈÎÎñĞèÒªÌØÊâµôÂä
			return 1
		end
	end
	
	return 0
end

--Ò»Ğ©¹ØÓÚÈÎÎñµÄÒ×ÓÃº¯Êı
--Open ¿ªÆôÒ»¸öÈÎÎñ
--1¡¢ÏòmanageÖĞÉêÇëÒ»¸öÈÎÎñ±äÁ¿¡ª¡ªËüÊôÓÚ¡¾¹ÜÀí¡¿Âß¼­
--2¡¢Æô¶¯¿ªÆôÇ°µÄ¡¾ÑéÖ¤¡¿Âß¼­
	--2¡¢ÑéÖ¤¿Õ¼äÖØÁ¿
	--0¡¢ÊÇ·ñÂú×ãcondition±íÖĞµÄÌõ¼ş
--3¡¢Æô¶¯¿ªÆôÇ°µÄ¶¯×÷
	--0¡¢Ëæ»ú
	--1¡¢²ß»®×Ô¶¨Òå¡ª¡ªÎ´ÊµÏÖ
--4¡¢¿ªÆô¡ª¡ªÉè¶¨±ê¼ÇÎ»
--5¡¢Æô¶¯¿ªÆôºóµÄ¶¯×÷
	--1¡¢¶Ô»°£¨¶Ô»°¶¼±»Éè¶¨³ÉÊÂÏÈËµµÄÁË£º£©
	--2¡¢²ß»®×Ô¶¨Òå
	--3¡¢ÌØĞ§
	--4¡¢ÌØÊâµôÂä
--·µ»ØÖµ
	--4 ´«ÈëµÄnTaskIDÓĞÎÊÌâ
	--3 ²»¿ÉÔÙ½ÓÈÎÎñ
	--2 Î´Âú×ã¿ªÆôÌõ¼ş
	--1 ³É¹¦
	--5 Ä¾ÓĞ´ËnTaskID
function OpenGTask(nTaskID)
	--gtask¹Ø±Õ
	if IsNewTaskSystemOpen() ~= 1 then
		return -1;
	end
	--print("in Open")
	if nTaskID == 0 or nTaskID == nil then
		nTaskID = GetTask(2956)
		if nTaskID == 0 then
			return 4
		end
	end

	--manager¹ÜÀí
	if tGtTaskManage:IsCanAddNewTask() == 0 then
		return 3	
	end
	if tGtTaskManage:AddTaskInfo(nTaskID) == 0 then
		return 5
	end
	
	--¿ªÆôÇ°µÄÑéÖ¤
	local nCanGet = tGtTask:IsTaskCanGet(nTaskID);
	if nCanGet ~= 1 then
		if nCanGet == 3 then
			Talk(1,  "",  "Do kh«ng ®¹t ®ñ ®iÒu kiÖn, c¸c h¹ ch­a thÓ nhËn nhiÖm vô nµy, rÊt tiÕc.");
		end
		if nCanGet == 5 then
			Talk(1, "", "C¸c h¹ ®· xin giao nhËp vµo m«n ph¸i kh¸c råi.");
		end
		return 2
	end
	
	--½ÓÈÎÎñÏŞÖÆ£¬ÌØÊâ´¦Àí-----
	if nTaskID == 151 then
		--ÏŞÖÆ
		if GetWorldPos() ~= 6073 then
			Talk(1,  "",  "Do kh«ng ®¹t ®ñ ®iÒu kiÖn, c¸c h¹ ch­a thÓ nhËn nhiÖm vô nµy, rÊt tiÕc.");
			return 6
		end
		--´¦Àí
		SetCampToPlayer("camp_enemy");
	end
	---------------------------
	
	--¿ªÆôÇ°¶¯×÷
	--Ëæ»ú<----------Î´×÷
	
	--¿ªÆô
	--±ê¼ÇÄ³¸ö±ê¼ÇÎ»<----------ÎŞ
	tGtTaskManage:AddTask(nTaskID)
	
	--¿ªÆôºóµÄ¶¯×÷
	--¶Ô»°
	--tGtTask:SpeakBegin(nTaskID, 1);
	--²ß»®×Ô¶¨Òå
	SetTaskTemp(tGtTask.GT_TEMP_TASK_ID,nTaskID);
	tGtTask:DoAction(nTaskID);
	
	--ÌØĞ§
	SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), 906, 2, 0);
	
	--ÌØÊâµôÂä
	if tGtTaskManage:IsTSDLTask(nTaskID) == 1 and GetTrigger(4001) == 0 then
		CreateTrigger(0, 1245,  4001, 1);
	end
	
	--print("succ")
	--ok Íê³É½ÓÈÎÎñ
	return 1
end	
	
--Finish Õı³£½áÊøÒ»¸öÈÎÎñ
--0¡¢manageÖĞÊÇ·ñ½ÓÁË
--1¡¢½áÊøÌõ¼ş¼ì²â
	--2¡¢²ß»®Éè¶¨
	--1¡¢¿Õ¼ä
--2¡¢½áÊøÇ°¶¯×÷
	--1¡¢²ß»®Éè¶¨
	--2¡¢¶Ô»°
--3¡¢½áÊø
--4¡¢manageÖĞ´¦Àí
--5¡¢¸ø½±Àø
--6¡¢ÏÂÒ»²½ÊÇ·ñ¿É½Ó
--·µ»ØÖµ
	--1 ³É¹¦
	--2 ²»Âú×ãÍê³ÉÌõ¼ş
	--3 Ä¾ÓĞ½Óµ½ÈÎÎñ
	--4 É¾³ıÊ§°Ü
	--5 ´«²ÎÎÊÌâ
	--6 Ä¾ÓĞ´ËnTaskID
function FinishGTask(nTaskID)
	--print("in finish")
	if nTaskID == 0 or nTaskID == nil then
		nTaskID = GetTask(2956);
		if nTaskID == 0 then
			return 5
		end
	end
	
	--manageÖĞÊÇ·ñ½ÓÁË
	if tGtTaskManage:IsGetGTaskID(nTaskID) == 0 then
		return 3
	end
	if tGtTaskManage:AddTaskInfo(nTaskID) == 0 then
		return 6
	end
	
	--Ìõ¼ş¼ì²â
	local nCanOver = tGtTask:IsTaskCanOver(nTaskID)
	if nCanOver ~= 1 then
		return 2
	end
	
	--½áÊøÇ°¶¯×÷£º²ß»®Éè¶¨£¬É¾³ı£¬¶Ô»°
	if tGtCondition:del_item_confirm(tGtNpcInfo[nTaskID]["data"][10]) == nil then
		return 4;
	end
	
	--½áÊø¶¯×÷
	--ÌØĞ§
	SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), 907, 2, 0);
	--manage´¦Àí
	tGtTaskManage:DeleteTask(nTaskID, 1)
	
	--¸øÓë½±Àø
	tGtTask:DoPrize(nTaskID)	
	
	--°ïËûµãÒ»ÏÂ¾Í¿ÉÒÔµÃµ½ÏÂÒ»²½ÈÎÎñ
	local targetNpc = GetNpcName(GetTargetNpc());
	if targetNpc ~= "" and tGtNpcInfo[nTaskID].to_npc == targetNpc 
		and tGtNpcMain and type(tGtNpcMain.npc_main) == "function" then
		tGtNpcMain:npc_main(tGtNpcInfo[nTaskID].to_npc)
	end
	return 1
end

--Close È¡ÏûÒ»¸öÈÎÎñ
--0¡¢ÊÇ·ñÔÚmanageÖĞ
--1¡¢ÊÇ·ñ¿ÉÉ¾³ı
--3¡¢È¡ÏûÒªÇ®µÄÅ¶
--2¡¢´ÓmanageÖĞÉ¾³ı
--·µ»ØÖµ
	--1¡¢³É¹¦
	--2¡¢Ä¾ÓĞÈÎÎñ
	--3¡¢ÈÎÎñ²»¿ÉÒÔÈ¡Ïû
	--4¡¢¿ÛÇ®Ê§°Ü
function CloseGTask(nTaskID)
	--manageÖĞÊÇ·ñ½ÓÁË
	if tGtTaskManage:IsGetGTaskID(nTaskID) == 0 then
		return 2
	end
	
	--ÊÇ·ñ¿ÉÒÔÉ¾³ı
	if tGtTask:IsCanClose(nTaskID) ~= 1 then
		return 3
	end
	
	--¿ÛÇ®¿ÛÇ®¿ÛÇ®
	if Pay(tGtNpcInfo[nTaskID].data[8]) ~= 1 then
		return 4
	end
	
	--´ÓmanageÖĞÒÆ³ı
	tGtTaskManage:DeleteTask(nTaskID)
	
	return 1
end
	
--Jump Ìø¹ıÒ»¸öÈÎÎñ
--0¡¢ÊÇ·ñÔÚmanageÖĞ
--1¡¢ÊÇ·ñ¿ÉÌø¹ı
--3¡¢»¹ÊÇÇ®
--4¡¢´ÓmanageÖĞÒÆ³ı
--5¡¢½²½áÊøµÄ»°£¬Å¶Ò²
--·µ»ØÖµ
	--1¡¢³É¹¦
	--2¡¢Ä¾ÓĞÈÎÎñ
	--3¡¢ÈÎÎñ²»¿ÉÒÔÌø¹ı
	--4¡¢¿ÛÇ®Ê§°Ü
function JumpGTask(nTaskID, bIsPrize)
	--manageÖĞÊÇ·ñ½ÓÁË
	if tGtTaskManage:IsGetGTaskID(nTaskID) == 0 then
		return 2
	end
	
	--ÊÇ·ñ¿ÉÒÔÌø¹ı
	if tGtTask:IsCanJump(nTaskID) ~= 1 then
		return 3
	end
	
	--Ç®
	if Pay(tGtNpcInfo[nTaskID].data[9]) ~= 1 then
		return 4
	end
	
	--½áÊøÇ°¶¯×÷£º²ß»®Éè¶¨£¬É¾³ı£¬¶Ô»°
	tGtCondition:del_item_force(tGtNpcInfo[nTaskID]["data"][10])
	
	--É¾³ı´¥·¢Æ÷
	tGtTask:remove_trigger(nTaskID);
	
	--½áÊø¶¯×÷
	--ÌØĞ§
	SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), 907, 2, 0);
	
	--´ÓmanageÖĞÒÆ³ı
	tGtTaskManage:DeleteTask(nTaskID, 1)
	
	--¸øÓë½±Àø
	if bIsPrize and tonumber(bIsPrize) == 1 then
		tGtTask:DoPrize(nTaskID);
		Msg2Player("NhiÖm vô hoµn thµnh!");
	end
	
	--½«½áÊø
	tGtTask:SpeakFinish(nTaskID)
	
	return 1
end

--Clear Çå³ıÒ»¸öÈÎÎñ
--1¡¢Èç¹ûmanageÖĞÓĞ£¬¾ÍÒÆ³ıÕâ¸öÈÎÎñ
--2¡¢½«ÈÎÎñµÄbitÎ»ÉèÎª0
function ClearGTask(nTaskID)
	if tGtTaskManage:IsGetGTaskID(nTaskID) ~= 0 then
		tGtTaskManage:DeleteTask(nTaskID)
	end
	
	tGtTaskManage:SetTaskStateBit(nTaskID, 0)
end

--gtask_main£¬½ÓÈ¡ÈÎÎñµÄNPCÃû²»´æÔÚ£¬×Ô¶¨Òå½Å±¾´¦ÀíÈÎÎñ
--Ö±½Ó½ÓÈ¡Ö¸¶¨TaskIdµÄÈÎÎñ
--flag£¬1Îª½çÃæ£¬2ÎªÇ¿ÖÆ
function DirectGetGTask(nTaskID,flag)
	--ÊÇ·ñ¿ªÆôÁËĞÂÈÎÎñÏµÍ³
	if IsNewTaskSystemOpen() ~= 1 then
		return -1;
	end
	--TaskIDÊÇ·ñºÏ·¨
	if nTaskID <= 0 or nTaskID == nil then
		return -2;
	end
	--TaskIDÊÇ·ñ½ÓÈ¡
	if tGtTask:check_cur_task(nTaskID) ~= 0 then
		Msg2Player("C¸c h¹ ®· tiÕp nhËn nhiÖm vô nµy");
		return -3;
	end
	--ÊÇ·ñ½ÓÂú
	if tGtTask:check_task() == 0 then
		Msg2Player("Sè nhiÖm vô ch­a hoµn thµnh v­ît qu¸ giíi h¹n");
		return -4;
	end
	if flag == 1 then
	--½çÃæ
		SetTask(Task_id_001,nTaskID);
		SendScript2Client("Open(\"TaskFace\","..tostring(nTaskID)..",1)");
		return 0;
	elseif flag == 2 then
	--Ç¿ÖÆ½ÓÈ¡
	--³É¹¦½ÓÈ¡·µ»Ø1
		return OpenGTask(nTaskID);
	end
end

--Ö±½ÓÍê³ÉÈÎÎñ¿ÉÄÜ´æÔÚ²»ÄÜ´¥·¢Ïà¹Ø×´Ì¬µÄÇé¿ö£¬¾¡Á¿ÉÙÓÃ¡£
--flag£¬1Îª½çÃæ£¬2ÎªÇ¿ÖÆ
function DirectFinishGTask(nTaskID,flag)
	--ÊÇ·ñ¿ªÆôÁËĞÂÈÎÎñÏµÍ³
	if IsNewTaskSystemOpen() ~= 1 then
		return -1;
	end
	--TaskIDÊÇ·ñºÏ·¨
	if nTaskID <= 0 or nTaskID == nil then
			return -2;
	end
	--TaskIDÊÇ·ñ½ÓÈ¡
	if tGtTask:check_cur_task(nTaskID) == 0 then
		--Msg2Player("ÄúÃ»ÓĞ½Ó¹ı¸ÃÈÎÎñ");
		return -3;
	end
	if flag == 1 then
	--½çÃæ
		SetTask(Task_id_001,nTaskID);
		SendScript2Client("Open(\"TaskFace\","..tostring(nTaskID)..",2)");
		return 0;
	elseif flag == 2 then
	--Ç¿ÖÆÍê³É
	--³É¹¦Íê³É·µ»Ø1
		return FinishGTask(nTaskID);
	end	
end

--Ö±½ÓÉ¾³ı¹ıÆÚÈÎÎñ
function DirectDeleteTask(nTaskID)
	--ÊÇ·ñ¿ªÆôÁËĞÂÈÎÎñÏµÍ³
	if IsNewTaskSystemOpen() ~= 1 then
		return -1;
	end
	--TaskIDÊÇ·ñºÏ·¨
	if nTaskID <= 0 or nTaskID == nil then
		return -2;
	end
	if tGtTask:check_cur_task(nTaskID) ~= 1 then
		return -3;
	end
	--manageÖĞÊÇ·ñ½ÓÁË
	if tGtTaskManage:IsGetGTaskID(nTaskID) == 0 then
		return -4;
	end
	if tGtTaskManage:AddTaskInfo(nTaskID) == 0 then
		return -5;
	end	
	for i = tGtTask.GT_TASK_ID_START,tGtTask.GT_TASK_ID_START+tGtTask.GLV_GT_TASK_NUM do
		if GetTask(i) == nTaskID then
			SetTask(i,0);
			--ÆäËû×´Ì¬Ò»²¢ÇåÀí
			for j = 1,tGtTask.GLV_GT_TASK_ADD - 1 do 
				SetTask(i+(tGtTask.GLV_GT_TASK_NUM+1)*j,0);
			end
			break;
		end
	end	
	--É¾³ıÈÎÎñ¸øµÄµÀ¾ß
	tGtCondition:del_item_force(tGtNpcInfo[nTaskID]["data"][10])
	--É¾³ı´¥·¢Æ÷
	tGtTask:remove_trigger(nTaskID);	
	--Íê³É×´Ì¬ÉèÎª0
	tGtTaskManage:SetTaskStateBit(nTaskID, 0);
end


function DirectIsTaskFinish(nTaskID)
	if tGtTaskManage:AddTaskInfo(nTaskID) == 0 then
		return nil
	end
	--Ìõ¼ş¼ì²â
	if tGtTask:CheckCondition(nTaskID) ~= 1 then
		return nil;
	end
	return 1;
end

--ÊÇ·ñ½ÓÁË»òÕßÃ»ÓĞÄÜ½Ó¸ÃÈÎÎñ
function IsHaveTaskOrCanGet(nTaskID)
	if tGtTaskManage:AddTaskInfo(nTaskID) == 0 then
		return nil
	end
	if tGtTask:check_cur_task(nTaskID) == 1 or tGtTask:IsTaskCanGet(nTaskID) == 1 then
		return 1;
	end
	return nil;
end

--¼ì²éÊÇ·ñ½ÓÁË¸ÃÇø¼äµÄÈÎÎñ
function IsHaveTaskOrCanGet2(nStart, nEnd)
	for i = nStart, nEnd do
		if IsHaveTaskOrCanGet(i) == 1 then
			return 1;
		end
	end
	return nil;
end