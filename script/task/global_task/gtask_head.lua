--ĞÂµÄÊÀ½çÈÎÎñ
--by vivi
--modify by liubo

Include("\\script\\class\\ktabfile.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\string.lua")
Include("\\script\\lib\\define.lua");
Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\system_switch_config.lua")

TABLE_GT_MAIN = new(KTabFile,"\\settings\\gtask\\gtask_main.txt");
TABLE_GT_CONDITION = new(KTabFile,"\\settings\\gtask\\gtask_condition.txt");
TABLE_GT_PRIZE = new(KTabFile,"\\settings\\gtask\\gtask_prize.txt");
TABLE_GT_DIALOG = new(KTabFile,"\\settings\\gtask\\gtask_dialog.txt");
TABLE_GT_TSDL = new(KTabFile,"\\settings\\gtask\\gtask_tsdl.txt");

--=======================ÈÎÎñ´¦Àí====================================
tGtTask = {
	--ÕâÒ»¶ÎÊÇ¼ÇÂ¼Ã¿¸öÈÎÎñIDÊÇ·ñÍê³ÉµÄÇé¿ö£¬·ÖbitÊ¹ÓÃ£¬Ã¿¸ö±äÁ¿²ğ31¸ö¡£
	--ÔİÊ±¶¨Îª40¸ö£¬¿É¼Ó¡£
	tGtTaskID = {
		3008,3009,3010,3011,3012,3013,3014,3015,3016,3017,
		3018,3019,3020,3021,3022,3023,3024,3025,3026,3027,
		3028,3029,3030,3031,3032,3033,3034,3035,3036,3037,
		3038,3039,3040,3041,3042,3043,3044,3045,3046,3047,
	},
	--ÈÎÎñ±äÁ¿
	--ÕâÒ»¶ÎÈÎÎñ±äÁ¿µÄ¿ªÊ¼
	--¼ÇÂ¼¹æÔò£º´ÓÕâ¸ö¿ªÊ¼µÄ10¸ö±äÁ¿¼ÇÂ¼µ±Ç°½ÓµÄÈÎÎñID
	--ÍùºóµÄ10¸öÊÇ¶ÔÓ¦ÈÎÎñIDµÄ´¥·¢Æ÷ÊıÁ¿£¨Èç¹ûÓĞ£©£¬·Ö4¸ö×Ö½ÚÊ¹ÓÃ£¬µÚ1¸öÎªÀàĞÍ£¬µÚ2¸öÎªÊıÁ¿£¬3¡¢4»¹Ã»ÓÃµ½¡£
	--ÔÙÍùºóµÄ10¸ö¼ÇÂ¼¶ÔÓ¦ÈÎÎñIDµÄ´¥·¢Æ÷Íê³ÉÇé¿ö
	--ÔÙÍùºó10¸ö¼ÇÂ¼¶ÔÓ¦ÈÎÎñIDµÄÄ³Ğ©ÌØÊâÊıÖµĞèÇó¡£
	GT_TASK_ID_START = 2968,
	GLV_GT_TASK_NUM = 9,  --Ã¿¶Î¼Ó9£¬Ò»¹²10¸ö
	GLV_GT_TASK_ADD = 4,  --Ò»¹²4¶Î
	GT_TEMP_TASK_ID = 201, --ÁÙÊ±±äÁ¿£¬¼ÇÂ¼µ±Ç°½ÓµÄÈÎÎñID
	GT_TEMP_RAND_ID = 202, --ÁÙÊ±±äÁ¿£¬¼ÇÂ¼µ±Ç°½ÓµÄËæ»úÈÎÎñID
	GT_TRIGGER_OFFSET = 4000, --CustomtriggerIDÓëÈÎÎñ±äÁ¿µÄÆ«ÒÆÁ¿
};

--¼ì²âÈÎÎñÍê³ÉµÄ½ø¶È
--·µ»ØÈÎÎñ½ø¶ÈµÄ²½Êı£¨ÒªÇógtask_main±íÈÎÎñIDÁ¬Ğø£©
function tGtTask:check_finsh_taskid()
	local nCount = getn(tGtTask.tGtTaskID) or 0;
	local nNum = 31;
	if nCount <= 0 then return 0; end
	for i = 1,nCount do
		for j = 1,nNum do
			if gf_GetTaskBit(tGtTask.tGtTaskID[i],j) ~= 1 then
				return (i-1) * 31 + j;
			end
		end
	end
	return 0;
end

--¼ì²âTaskIdÈÎÎñÊÇ·ñÍê³É
--·µ»Ø~0Íê³É0Î´Íê³É
function tGtTask:check_task_isfinish(nTaskId)
	--Çå³ş±ê¼ÇÎ»
	local nTabIdx,nBit = 0,0;
	nTabIdx = ceil(nTaskId/31);
	nBit = mod(nTaskId,31);
	if nBit == 0 then
		nBit = 31;
	end
	return gf_GetTaskBit(tGtTask.tGtTaskID[nTabIdx],nBit);
end

--¼ì²âÊÇ·ñ½ÓÂúÁËÈÎÎñ
--Õâ¸öÓ¦¸Ã¶ª¸ø
function tGtTask:check_task()
	for i = tGtTask.GT_TASK_ID_START,tGtTask.GT_TASK_ID_START+tGtTask.GLV_GT_TASK_NUM do
		if GetTask(i) == 0 then
			return 1;
		end
	end
	return 0;
end

function tGtTask:GetAllTask()
	local tRetTask = {};
	local nRetTask = 1;
	for i = tGtTask.GT_TASK_ID_START,tGtTask.GT_TASK_ID_START+tGtTask.GLV_GT_TASK_NUM do
		local nTaskID = GetTask(i);
		if nTaskID ~= 0 then
			tRetTask[nRetTask] = nTaskID;
			nRetTask=nRetTask+1;
		end
	end

	return tRetTask;
end

--¼ì²âÊÇ·ñ½ÓÁË¸ÃÈÎÎñ
function tGtTask:check_cur_task(nTaskID)
	for i = tGtTask.GT_TASK_ID_START,tGtTask.GT_TASK_ID_START+tGtTask.GLV_GT_TASK_NUM do
		if GetTask(i) == nTaskID then
			return 1;
		end
	end
	return 0;
end

function tGtTask:ClearAll()
	for i = tGtTask.GT_TASK_ID_START,tGtTask.GT_TASK_ID_START+tGtTask.GLV_GT_TASK_NUM do
		if GetTask(i) ~= 0 then
			tGtTask:set_task(3, GetTask(i));
		end
	end
end

--ÈÎÎñ±äÁ¿µÄ²Ù×÷
--nType£º1±íÊ¾½ÓÈÎÎñ 2±íÊ¾Íê³ÉÈÎÎñ»òÌø¹ıÈÎÎñ 3±íÊ¾È¡ÏûÈÎÎñ
--nTaskID:ÈÎÎñID
--·µ»Ø£ºÉèÖÃµÄ±äÁ¿Öµ
function tGtTask:set_task(nType,nTaskID)
	local nTaskReturn = 0;
	if nType == 1 then
		for i = tGtTask.GT_TASK_ID_START,tGtTask.GT_TASK_ID_START+tGtTask.GLV_GT_TASK_NUM do
			if GetTask(i) == 0 then
				SetTask(i,nTaskID);
				nTaskReturn = i;
				break;
			end
		end
	else
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
		if nType ~= 3 then
			if tGtNpcInfo[nTaskID].data[1] == "" or tonumber(tGtNpcInfo[nTaskID].data[1]) == 0 then
				local nTabIdx,nBit = 0,0;
				nTabIdx = ceil(nTaskID/31);
				nBit = mod(nTaskID,31);
				if nBit == 0 then
					nBit = 31;
				end
				gf_SetTaskBit(tGtTask.tGtTaskID[nTabIdx],nBit,1);  --ÉèÖÃ¶ÔÓ¦µÄÖµÎª1±íÊ¾¸ÃÈÎÎñIDÒÑ¾­Íê³É
			end
		end
	end
	return nTaskReturn;
end

--»ñÈ¡nTaskID´æÔÚÄÄ¸ö±äÁ¿ÉÏ
function tGtTask:get_task(nTaskID)
	local nTaskReturn = 0;
	for i = tGtTask.GT_TASK_ID_START,tGtTask.GT_TASK_ID_START+tGtTask.GLV_GT_TASK_NUM do
		if GetTask(i) == nTaskID then
			nTaskReturn = i;
			return nTaskReturn;
		end
	end
	return nTaskReturn;
end

--ÉèÖÃËæ»úÈÎÎñ£¬°ÑÇ°ÖÃÈÎÎñID´¢´æ½øµÚËÄ¸ö±äÁ¿ÖĞ
function tGtTask:set_ex_task(nTaskID,nExTaskID)
	local nTaskValue1 = tGtTask:get_task(nTaskID);
	local nTaskValue4 = nTaskValue1+(tGtTask.GLV_GT_TASK_NUM+1)*3;
	SetTask(nTaskValue4,nExTaskID);
end

--»ñÈ¡Ëæ»úÈÎÎñµÄÇ°ÖÃÈÎÎñID£¬´«ÈëËæ»úÈÎÎñID£¬·µ»ØÊÇ·ñ½ÓÁË¸ÄÈÎÎñ
function tGtTask:get_ex_task(nTaskID)
	local nResult = 0;
	for i = tGtTask.GT_TASK_ID_START+(tGtTask.GLV_GT_TASK_NUM+1)*3,tGtTask.GT_TASK_ID_START+(tGtTask.GLV_GT_TASK_NUM+1)*3+tGtTask.GLV_GT_TASK_NUM do
		if GetTask(i) == nTaskID then
			nResult = i;
			return nResult;
		end
	end
	return nResult;
end

--´¥·¢Æ÷£¨É±¹Ö£©Íê³ÉÇé¿ö
function tGtTask:trigger_finish_state(nTaskID)
	local nTaskValue = tGtTask:get_task(nTaskID);
	local nTaskValue2 = nTaskValue+tGtTask.GLV_GT_TASK_NUM+1;
	local nTaskValue3 = nTaskValue+(tGtTask.GLV_GT_TASK_NUM+1)*2;
	local nCount = gf_GetTaskByte(nTaskValue2,2);
	if nCount == 0 then
		return 1;
	end
	for i = 1,nCount do
		if gf_GetTaskBit(nTaskValue3,i) ~= 1 then
			return 0;
		end
	end
	return 1;
end

--¸ù¾İTaskIDÒÆ³ıÏà¹Ø´¥·¢Æ÷
function tGtTask:remove_trigger(nTaskID)
	local nTaskValue = tGtTask:get_task(nTaskID);
	local nTaskValue2 = nTaskValue+tGtTask.GLV_GT_TASK_NUM+1;
	local nTaskValue3 = nTaskValue+(tGtTask.GLV_GT_TASK_NUM+1)*2;
	local nCustomTrigger = 0;
	local nCount = gf_GetTaskByte(nTaskValue2,2);
	if nCount == 0 then
		return 0;
	end
	for i = 1,nCount do
		nCustomTrigger = tGtTask.GT_TRIGGER_OFFSET+nTaskID*10+i;
		RemoveTrigger(GetTrigger(nCustomTrigger));
	end
end

function tGtTask:get_trigger(nTaskID)
	local tTrigger = {};

	local nTaskValue = tGtTask:get_task(nTaskID);
	local nTaskValue2 = nTaskValue+tGtTask.GLV_GT_TASK_NUM+1;
	local nTaskValue3 = nTaskValue+(tGtTask.GLV_GT_TASK_NUM+1)*2;
	local nCustomTrigger = 0;
	local nCount = gf_GetTaskByte(nTaskValue2,2);
	if nCount == 0 then
		return nil;
	end
	for i = 1,nCount do
		nCustomTrigger = tGtTask.GT_TRIGGER_OFFSET+nTaskID*10+i;
		tTrigger[i] = nCustomTrigger
	end

	return tTrigger;
end

--ÈÎÎñ¶Ô»°
--nType
	--1 ¿ªÊ¼¶Ô»°
	--2 ½áÊø¶Ô»°
function tGtTask:_Speak(nTaskID, nDialogNum, nType, funcName)
	if tGtNpcInfo[nTaskID] == nil then
		return nil
	end

	local strType = "";
	local strFunName = "";
	if nType == 1 then
		strType = "get_talk"
		strFunName = "SpeakBegin"
	elseif nType == 2 then
		strType = "finish_talk"
		strFunName = "SpeakFinish"
	end

	local strDialog = nil;
	if nDialogNum and tGtNpcInfo[nTaskID][strType] then
		strDialog = tGtNpcInfo[nTaskID][strType][nDialogNum];
	end
	if strDialog ~= nil then
		strDialog = tGtNpcMain:dialog_string_deal(strDialog,tGtNpcInfo[nTaskID].from_npc);
		if tGtNpcInfo[nTaskID][strType][nDialogNum + 1] == nil and funcName ~= "" then
			Talk(1, funcName, strDialog);
		else
			Talk(1, "#tGtTask:"..strFunName.."("..nTaskID..","..(nDialogNum + 1)..", )", strDialog);
		end
	end

	local strTip = tGtNpcInfo[nTaskID][strType].tip;
	if strTip ~= nil and strTip ~= "" and nDialogNum == 1 then
		TaskTip(strTip);
	end
end

--ÈÎÎñ¿ªÊ¼¶Ô»°£¨´úÂëÓëÒÔÇ°°æ±¾ÓĞÖØ¸´£¬´ıÕûÀí£©
function tGtTask:SpeakBegin(nTaskID, nDialogNum)
	tGtTask:_Speak(nTaskID, nDialogNum, 1)
end

--ÈÎÎñ½áÊø¶Ô»°£¨´ıÕûÀí£©
function tGtTask:SpeakFinish(nTaskID, nDialogNum)
	tGtTask:_Speak(nTaskID, nDialogNum, 2)
end

--ÈÎÎñÖ´ĞĞ¶¯×÷£¨´ıÕûÀí£©
function tGtTask:DoAction(nTaskID)
	if tGtNpcInfo[nTaskID] ~= nil then
		tGtNpcInfo[nTaskID]["data"][4]();
	end
end


function UpdateMeridia_73()
	if MeridianGetLevel() == 0 then
	--print("MeridianGetLevel")
		local tSex = gf_GetPlayerSexName();
		if MeridianUpdateLevel() == 1 then
			Msg2Player("Chóc mõng "..tSex.."Nghiªn cøu <Quú Hoa B¶o §iÓn> thµnh c«ng vµ ®¹t ®Õn c¶nh giíi Vâ Gi¶.");
			if MeridianGetLevel() == 1 then
				gf_WriteLogEx("KICK HOAT KINH MACH", "thµnh c«ng", 1, "Vâ HiÒn")
				--AwardGenuineQi(30000);
	  		Msg2Player("Chóc mõng "..tSex.."So bé l·nh ngé <Quú Hoa B¶o §iÓn>");
	  		Talk(2,"",format("Chóc mõng <color=green>%s<color>®· ®äc'Quú Hoa B¶o §iÓn'thµnh c«ng vµ ®Æt  ®Õn c¹nh giíi vâ gi¶",tSex),format("Chóc mõng %s s¬ bé lÜnh ngé ®­îc'Quú Hoa B¶o §iÓn',(bÊm nót J®Ó xem kinh m¹ch)",tSex));
			end
		end
	end
end

--ÈÎÎñ½±Àø
function tGtTask:DoPrize(nTaskID)
	if tGtNpcInfo[nTaskID] == nil then
		return nil
	end

	tGtNpcInfo[nTaskID].data[5]();
	
	--¸øÓè½±ÀøºóµÄÌØÊâ´¦Àí------
	--ÒÑ¾­Íê³É73ºÅÈÎÎñ
	if tGtTask:check_finsh_taskid() == 74 then
		UpdateMeridia_73();
	end
	----------------------------
end

--ÈÎÎñ¿Õ¼ä¼ì²â
--·µ»ØÖµ
	--1 ³É¹¦
	--2 Ê§°Ü
function tGtTask:_CheckRoomWeight(tRoomWeight)
	local nRoomWeight = tRoomWeight;--tGtNpcInfo[nGTaskID]["data"][6];
	if nRoomWeight ~= "" and nRoomWeight ~= nil then
		local strArray = split(nRoomWeight,";");
		if gf_Judge_Room_Weight(tonumber(strArray[1]),tonumber(strArray[2]),"") ~= 1 then
			return 2
		end
	end

	return 1
end

--ÃÅÅÉµÄÌØÊâ´¦Àí
	--·µ»ØÖµ£º1¡¢³É¹¦
	--2¡¢Ê§°Ü
function tGtTask:CheckRoute(nGTaskID)
	return 1
end

--ÈÎÎñÊÇ·ñ¿É½Ó
	--1¡¢Âú×ã¿Õ¼ä
	--2¡¢condition
--·µ»ØÖµ
	--1 ³É¹¦
	--2 ¿Õ¼ä²»¹»
	--3 condition ²»Âú×ã
	--4 ´ËÈÎÎñÒÑ½Ó
	--5 ÃÅÅÉ³åÍ»
	--6 ÈÎÎñÍê³É¹ı
function tGtTask:IsTaskCanGet(nGTaskID)
	if self:_CheckRoomWeight(tGtNpcInfo[nGTaskID]["data"][6]) ~= 1 then
		Msg2Player("Kh«ng gian hµnh trang kh«ng ®ñ")
		return 2
	end

	SetTaskTemp(tGtTask.GT_TEMP_TASK_ID, nGTaskID);	--ÕâÀï°ÑÈÎÎñid´æÈëÁÙÊ±±äÁ¿ÖĞÎªÁËÏÂÃæµÄÇ°ÖÃÌõ¼ş¼ì²â
	local nConditionResult = tGtNpcInfo[nGTaskID]["data"][2]();
	if nConditionResult == nil then
		return 3
	end

	if tGtTask:check_cur_task(nGTaskID) == 1 then
		return 4
	end
	
	if tGtTask:CheckRoute(nGTaskID) == 0 then
		return 5
	end

	if tonumber(tGtNpcInfo[nGTaskID]["data"][1]) == 1 then	--Ëæ»úÈÎÎñ
		return 1
	else
		if tGtCondition:check_taskid(nGTaskID,1) ~= nil then
			return 6
		end
	end

	return 1
end

--ÈÎÎñÊÇ·ñ¿É½áÊø
	--2¡¢Íê³ÉÌõ¼ş
		--1¡¢Éè¶¨Íê³ÉÌõ¼ş
		--2¡¢´¥·¢Æ÷
	--1¡¢Âú×ã¿Õ¼ä
--·µ»ØÖµ
	--1¡¢³É¹¦
	--2¡¢¿Õ¼ä²»¹»
	--3¡¢²»Âú×ãÍê³ÉÌõ¼ş
	--4¡¢´¥·¢Æ÷Î´Íê³É
function tGtTask:IsTaskCanOver(nGTaskID)
	local nConditionResult = tGtNpcInfo[nGTaskID]["data"][3]();
	if nConditionResult == nil then
		return 3
	end

	if tGtTask:trigger_finish_state(nGTaskID) == 0 then --´¥·¢Æ÷Íê³ÉÇé¿ö
		return 4
	end

	if self:_CheckRoomWeight(tGtNpcInfo[nGTaskID]["data"][7]) ~= 1 then
		Msg2Player("Kh«ng gian hµnh trang kh«ng ®ñ")
		return 2
	end

	return 1
end

--¿ÉÓÃÇ®ÏûºÄÈÎÎñ¡ª¡ª½áÊøÈÎÎñµÄµÚ¶ş¸ö°ì·¨
--nType
	--1¡¢¹Ø±Õ
	--2¡¢Ìø¹ı
--·µ»ØÖµ
	--1¡¢¿ÉÒÔ
	--2¡¢²»¿ÉÈ¡Ïû
	--3¡¢²»´æÔÚÈÎÎñ
	--4¡¢Ç®²»¹»
	--5¡¢¿Õ¼ä²»¹»
function tGtTask:IsCanPayForTask(nTaskID, nType)
	if tGtNpcInfo[nTaskID] == nil then
		return 3
	end

	local nMoney = 0
	if nType == 1 then
		nMoney = tonumber(tGtNpcInfo[nTaskID].data[8]);
	elseif nType == 2 then
		nMoney = tonumber(tGtNpcInfo[nTaskID].data[9]);
		if self:_CheckRoomWeight(tGtNpcInfo[nTaskID]["data"][7]) ~= 1 then
			return 5
		end
	end

	if nMoney ~= -1 and nMoney ~= nil then
		if GetCash() < nMoney then
			return 4
		end
		return 1
	end

	return 2
end

--»ñµÃÌø¹ıÈÎÎñµÄ½ğ×ÓÊıÄ¿
function tGtTask:GetJumpTaskCost(nTaskID)
	if not nTaskID then
		return 0;
	end
	if tGtNpcInfo[nTaskID] == nil then
		return 0;
	end
	return tonumber(tGtNpcInfo[nTaskID].data[9]);
end

--¿ÉÓÃÇ®ÏûºÄÈÎÎñ¡ª¡ª½áÊøÈÎÎñµÄµÚ¶ş¸ö°ì·¨
--nType
	--1¡¢¹Ø±Õ
	--2¡¢Ìø¹ı
--·µ»ØÖµ
	--1¡¢¿ÉÒÔ
	--2¡¢²»¿ÉÈ¡Ïû
	--3¡¢²»´æÔÚÈÎÎñ
	--4¡¢Ç®²»¹»
function tGtTask:JumpTaskCheckCondition(nTaskID, nType)
	if tGtNpcInfo[nTaskID] == nil then
		return 3
	end
	local nMoney = 0
	if nType == 1 then
		nMoney = tonumber(tGtNpcInfo[nTaskID].data[8]);
	elseif nType == 2 then
		nMoney = tonumber(tGtNpcInfo[nTaskID].data[9]);
	end

	if nMoney ~= -1 and nMoney ~= nil then
		if GetCash() < nMoney then
			return 4
		end
		return 1
	end
	return 2
end

--ÈÎÎñÊÇ·ñ¿ÉÒÔ¹Ø±Õ
function tGtTask:IsCanClose(nTaskID)
	return self:IsCanPayForTask(nTaskID, 1)
end

--ÈÎÎñÊÇ·ñ¿ÉÒÔÌø¹ı
function tGtTask:IsCanJump(nTaskID)
	return self:IsCanPayForTask(nTaskID, 2)
end

--Ìø¹ıÈÎÎñÌõ¼ş¼ì²é
function tGtTask:CheckJumpTask(nTaskID)
	return self:JumpTaskCheckCondition(nTaskID, 2);
end

function tGtTask:CloseTask(nTaskID)
	--Çå³ş±ê¼ÇÎ»
	local nTabIdx,nBit = 0,0;
	nTabIdx = ceil(nTaskID/31);
	nBit = mod(nTaskID,31);
	if nBit == 0 then
		nBit = 31;
	end
	gf_SetTaskBit(tGtTask.tGtTaskID[nTabIdx],nBit, 0);
	--Çå³ıÏêÏ¸¼ÇÂ¼
	tGtTask:set_task(3,nTaskID)
end

--É±¹Ö´¥·¢Æ÷»Øµ÷º¯Êı
function gt_trigger_callback()
	local nCustomTrigger = GetTriggerCustomID(GetRunningTrigger());
	local nCount = mod(nCustomTrigger,10);
	local nTaskID = ((nCustomTrigger-nCount)-tGtTask.GT_TRIGGER_OFFSET)/10;
	local nTaskValue = 0;
	for i = tGtTask.GT_TASK_ID_START,tGtTask.GT_TASK_ID_START+tGtTask.GLV_GT_TASK_NUM do
		if GetTask(i) == nTaskID then
			nTaskValue = i;
			break;
		end
	end
	local nTaskValue3 = nTaskValue+(tGtTask.GLV_GT_TASK_NUM+1)*2;
	gf_SetTaskBit(nTaskValue3,nCount,1);
	RemoveTrigger(GetRunningTrigger());

end

--¼ì²âÈÎÎñÊÇ·ñÍê³É
function tGtTask:CheckCondition(nTaskID)
	local nConditionResult = tGtNpcInfo[nTaskID]["data"][3]();
	if nConditionResult == nil then
		return nil
	end
	if tGtTask:trigger_finish_state(nTaskID) == 0 then --´¥·¢Æ÷Íê³ÉÇé¿ö
		return nil
	end
	return 1
end



--=======================Ö÷¶Ô»°´¦Àí=================================
tNpcInfoEx = {};
tGtNpcMain = {};
tGtNpcInfo = {};

--ÕâÕÅ±íÓÃÀ´´æNPCÉíÉÏÓĞÄÄĞ©ÈÎÎñĞÅÏ¢£¬ÓÃÓÚ»º´æ
function tGtNpcMain:get_main_table(sNpcName)
--	if sNpcName == "" or sNpcName == nil then
--		return 0;
--	end	
--	if tNpcInfoEx[sNpcName] ~= nil then
--		return 0;
--	else
--		tNpcInfoEx[sNpcName] = 1;
--	end
--	if tGtNpcInfo ~= nil then
--		return 0;
--	end
	for i = 3,TABLE_GT_MAIN:getRow() do
		if TABLE_GT_MAIN:getCell(i,4) == sNpcName or TABLE_GT_MAIN:getCell(i,5) == sNpcName then
			local nTaskID = tonumber(TABLE_GT_MAIN:getCell(i,2));
			if tGtNpcInfo[nTaskID] == nil then
				tGtNpcInfo[nTaskID] = {};
				tGtNpcInfo[nTaskID].name = TABLE_GT_MAIN:getCell(i,1);
				tGtNpcInfo[nTaskID].from_npc = TABLE_GT_MAIN:getCell(i,4);
				tGtNpcInfo[nTaskID].to_npc = TABLE_GT_MAIN:getCell(i,5);
				tGtNpcInfo[nTaskID].data = {};
				tGtNpcInfo[nTaskID].get_talk = {};
				tGtNpcInfo[nTaskID].finish_talk = {};
				tGtNpcInfo[nTaskID].data[1] = TABLE_GT_MAIN:getCell(i,3);
				--------------------
				local sExpression = tGtCondition:get_sub(TABLE_GT_MAIN:getCell(i,6));
				if sExpression == nil or sExpression == "" then --Èç¹û¿ÕµÄ·µ»Ø1
					sExpression = "1";
				end
				local strCondition = "function GtExCondition() return "..sExpression.." end";
				dostring(strCondition);
				tGtNpcInfo[nTaskID].data[2] = GtExCondition;
				---------------------
				sExpression = tGtCondition:get_sub(TABLE_GT_MAIN:getCell(i,7));
				if sExpression == nil or sExpression == "" then
					sExpression = "1";
				end
				strCondition = "function GtFinishCondition() return "..sExpression.." end";
				dostring(strCondition);
				tGtNpcInfo[nTaskID].data[3] = GtFinishCondition;
				----------------------
				sExpression = tGtPrize:get_sub(TABLE_GT_MAIN:getCell(i,8));
				strCondition = "function GtAction() return "..sExpression.." end";
				dostring(strCondition);
				tGtNpcInfo[nTaskID].data[4] = GtAction;
				-----------------------
				sExpression = tGtPrize:get_sub(TABLE_GT_MAIN:getCell(i,9));
				strCondition = "function GtPrize() return "..sExpression.." end";
				dostring(strCondition);
				tGtNpcInfo[nTaskID].data[5] = GtPrize;
				----------------------
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
						tGtNpcInfo[nTaskID][sTalkType].unFinish = TABLE_GT_DIALOG:getCell(k,25);
					end
				end
			end
		end
	end
end

function tGtNpcMain:HaveTaskInGTask(sNpcName)
	sNpcName = sNpcName or GetTargetNpcName();	
	local strtab = {};
	for i,v in tGtNpcInfo do
		local nCheckCurTask = tGtTask:check_cur_task(i);
		if nCheckCurTask == 1 then --ÒÑ¾­½ÓÁË
			local nConditionResult = v.data[3](); --Íê³ÉÌõ¼ş
			if tGtNpcInfo[i].to_npc == sNpcName or tGtNpcInfo[i].from_npc == sNpcName then
				if nConditionResult ~= nil then --Âú×ãÍê³ÉÌõ¼ş
					if tGtTask:trigger_finish_state(i) == 1 and tGtNpcInfo[i].to_npc == sNpcName then --´¥·¢Æ÷Íê³ÉÇé¿ö
						tinsert(strtab,v.name.."(®· hoµn thµnh)/#tGtNpcMain:finish_task_talk("..i..",1)");
					else
						--local nNum = tonumber(i);
						--if nNum ~= 263 and nNum ~= 274  and nNum ~= 495 and tGtNpcInfo[i].from_npc ~= "ÒÇºÍ" and tGtNpcInfo[i].to_npc ~= "ÒÇºÍ" and tGtNpcInfo[i].from_npc ~= "º£±õ´¬·ò" and tGtNpcInfo[i].to_npc ~= "º£±õ´¬·ò" and tGtNpcInfo[i].from_npc ~= "´úÖ¾Ç¿" and tGtNpcInfo[i].to_npc ~= "´úÖ¾Ç¿" and tGtNpcInfo[i].from_npc ~= "ÇÙ¾ı·½Òô" and tGtNpcInfo[i].to_npc ~= "ÇÙ¾ı·½Òô" and tGtNpcInfo[i].from_npc ~= "ÌìÊà½£·¶ĞÇÀ½" and tGtNpcInfo[i].to_npc ~= "ÌìÊà½£·¶ĞÇÀ½"  then	--ÎäÆ÷µêÀÏ°å XOXO ÒÇºÍ
						tinsert(strtab, v.name.."(ch­a hoµn thµnh)/#tGtNpcMain:UnFinishTask("..i..")");	--Î´Íê³É¶Ô»°
						local nMoney1 = tonumber(v.data[8]);
						local nMoney2 = tonumber(v.data[9]);
--							if nMoney1 ~= -1 and nMoney1 ~= nil then
--								tinsert(strtab,"ÎÒÒªÈ¡ÏûÈÎÎñ["..v.name.."]/#tGtNpcMain:cancel_task_talk("..i..","..nMoney1..")");
--							end
						if nMoney2 ~= -1 and nMoney2 ~= nil then
							tinsert(strtab,"Ta muèn nh¶y qua nhiÖm vô nµy["..v.name.."]/#tGtNpcMain:skip_task_talk("..i..","..nMoney2..")");
						end
						--end
					end
				else
					--local nNum = tonumber(i);
					--if nNum ~= 263 and nNum ~= 274  and nNum ~= 495 and tGtNpcInfo[i].from_npc ~= "ÒÇºÍ" and tGtNpcInfo[i].to_npc ~= "ÒÇºÍ" and nNum ~= 622 and tGtNpcInfo[i].from_npc ~= "º£±õ´¬·ò" and tGtNpcInfo[i].to_npc ~= "º£±õ´¬·ò" and tGtNpcInfo[i].from_npc ~= "´úÖ¾Ç¿" and tGtNpcInfo[i].to_npc ~= "´úÖ¾Ç¿" and tGtNpcInfo[i].from_npc ~= "ÇÙ¾ı·½Òô" and tGtNpcInfo[i].to_npc ~= "ÇÙ¾ı·½Òô" and tGtNpcInfo[i].from_npc ~= "ÌìÊà½£·¶ĞÇÀ½" and tGtNpcInfo[i].to_npc ~= "ÌìÊà½£·¶ĞÇÀ½" then	--ÎäÆ÷µêÀÏ°å XOXO ÒÇºÍ
					tinsert(strtab, v.name.."(ch­a hoµn thµnh)/#tGtNpcMain:UnFinishTask("..i..")");	--Î´Íê³É¶Ô»°
					local nMoney1 = tonumber(v.data[8]);
					local nMoney2 = tonumber(v.data[9]);
--						if nMoney1 ~= -1 and nMoney1 ~= nil then
--							tinsert(strtab,"ÎÒÒªÈ¡ÏûÈÎÎñ["..v.name.."]/#tGtNpcMain:cancel_task_talk("..i..","..nMoney1..")");
--						end
					if nMoney2 ~= -1 and nMoney2 ~= nil then
						tinsert(strtab,"Ta muèn nh¶y qua nhiÖm vô nµy["..v.name.."]/#tGtNpcMain:skip_task_talk("..i..","..nMoney2..")");
					end
					--end
				end
			end
		else --»¹Ã»½Ó»òÒÑ¾­Íê³É
			local nTaskIdResult = tGtCondition:check_taskid(i,1);
			if nTaskIdResult == nil then --»¹Ã»Íê³É£¬ÄÇ¾ÍÊÇ¿ÉÒÔ½Ó
				SetTaskTemp(tGtTask.GT_TEMP_TASK_ID,i); --ÕâÀï°ÑÈÎÎñid´æÈëÁÙÊ±±äÁ¿ÖĞÎªÁËÏÂÃæµÄÇ°ÖÃÌõ¼ş¼ì²â
				local nConditionResult = v.data[2](); --Ç°ÖÃÌõ¼ş
				if nConditionResult ~= nil and tGtNpcInfo[i].from_npc == sNpcName then --Âú×ãÇ°ÖÃÌõ¼ş
					if tonumber(tGtNpcInfo[i].data[1]) == 1 then --Ëæ»úÈÎÎñ
						if tGtTask:get_ex_task(i) == 0 then --»¹Ã»ÓĞ½ÓËæ»úÈÎÎñ
							tinsert(strtab,v.name.."(cã thÓ nhËn)/#tGtNpcMain:start_task("..i..",2)");
						end
					else
						if tGtTask:CheckRoute(i) == 1 then
							tinsert(strtab,v.name.."(cã thÓ nhËn)/#tGtNpcMain:start_task_talk("..i..",1)");
						end
					end
				end
			end
		end
	end
	
	return strtab;
end

function tGtNpcMain:LevelGtask(npcId)
	local script = GetNpcScript(npcId);
	if script == nil or script == "" then
		return
	end
	
	SetPlayerScript(script);
	SendScript2VM(script,"main()");
end

--npc¶Ô»°´¦Àí
function tGtNpcMain:npc_main(sNpcName,sNpcTalk)
	sNpcName = sNpcName or GetTargetNpcName();
	----------------------------------------------------------
	--ÌØÊâ´¦Àí
	--ÈÎÎñID1£¬²»ÔÚ500Õâ¸öµØÍ¼Ôò·µ»Ø
	if sNpcName == "Chñ töu lÇu" then
		local nMapId,nMapX,nMapY = GetWorldPos();		
	  if nMapId ~= 500 then
			return 1;
		end
	end
	--ÈÎÎñID65£¬²»ÔÚ6017Õâ¸öµØÍ¼Ôò·µ»Ø
	if sNpcName == "NhËm Ng· Hµnh" and tGtTask:check_cur_task(65) == 1 then
		local nMapId,nMapX,nMapY = GetWorldPos();		
	  if nMapId ~= 6017 then
			return 1;
		end
	end
	--ÈÎÎñID15£¬²»ÔÚ6012Õâ¸öµØÍ¼·µ»Ø
	if sNpcName == "V« Danh T¨ng" and tGtTask:check_cur_task(15) == 1 then 
		local nMapId,nMapX,nMapY = GetWorldPos();
		if nMapId ~= 6012 then
			return 1;
		end
	end
	--ÈÎÎñID150£¬²»ÔÚ6073Õâ¸öµØÍ¼·µ»Ø
	if sNpcName == "Sµi Hoµng Nhi" and tGtTask:check_cur_task(150) == 1 then
		local nMapId,nMapX,nMapY = GetWorldPos();
		if nMapId ~= 6073 then
			return 1;
		end
	end
	--ÈÎÎñID151£¬²»ÔÚ404Õâ¸öµØÍ¼·µ»Ø
	if sNpcName == "Sµi Hoµng Nhi" and tGtTask:check_cur_task(152) == 1 then
		local nMapId,nMapX,nMapY = GetWorldPos();
		if nMapId ~= 404 then
			return 1;
		end
	end
	if sNpcName == "Th­¬ng ¦ng" and 
		GetWorldPos() == 8010 and
		(tGtTask:check_cur_task(244) == 1 or tGtTask:check_cur_task(245) == 1 or tGtTask:check_cur_task(246) == 1) then
		local bRet, szName = IsNpcChangeModel(PIdx2NpcIdx());
		if not szName or szName ~= "Th­¬ng ¦ng" then
			Say("H·y dïng Chu«ng BiÕn Th©n ®Ó biÕn thµnh Th­¬ng ¦ng sau ®ã ®èi tho¹i!", 0);
			return 0;
		end
	end
	----------------------------------------------------------
	sNpcTalk = sNpcTalk or "C¸c h¹ cã viÖc g× kh«ng?";
	self:get_main_table(sNpcName);

	local strtab = tGtNpcMain:HaveTaskInGTask(sNpcName);

	local strLevel = format("Ta cÇn xö lı nh÷ng viÖc kh¸c/#tGtNpcMain:LevelGtask(%d)",GetTargetNpc());
	if getn(strtab) ~= 0 then
		tinsert(strtab,strLevel);
		Say("<color=green>"..sNpcName.."<color>: "..sNpcTalk,
			getn(strtab),
			strtab)
	else
		return 1
	end

	return nil
end

--npcÃûÎªÎïÆ·µÄ¶Ô»°´¦Àí
function tGtNpcMain:item_main(sItemName,sItemTalk)
	if not sItemName or sItemName == "" then
		return nil;
	end
	sItemTalk = sItemTalk or "C¸c h¹ cã viÖc g× kh«ng?";
	self:get_main_table(sItemName);

	local strtab = tGtNpcMain:HaveTaskInGTask(sItemName);

	if getn(strtab) ~= 0 then
		Say("<color=green>"..sItemName.."<color>: "..sItemTalk,
			getn(strtab),
			strtab)
	else
		return 1
	end

	return nil	
end

--¶Ô»°×Ö·û´®´¦Àí
function tGtNpcMain:dialog_string_deal(dialog_str,sNpcName)
	sNpcName = sNpcName or GetTargetNpcName();
	dialog_str = gsub(dialog_str,"NpcName","<color=green>"..sNpcName.."<color>");
	dialog_str = gsub(dialog_str,"PlayerName","<color=green>"..GetSafeName().."<color>");
	local strSex = gf_GetPlayerSexName();
	dialog_str = gsub(dialog_str,"<sex>",strSex);
	if GetSex() == 1 then
		strSex = "Tha";
	elseif GetSex() == 2 then
		strSex = "Ng­êi ch¬i";
	else
		strSex = "¶nh/chØ";
	end;
	dialog_str = gsub(dialog_str,"<person>",strSex);
	if GetSex() == 1 then
		strSex = "Huynh ®Ö";
	elseif GetSex() == 2 then
		strSex = "Huynh muéi";
	else
		strSex = "Huynh ®Ö/Huynh muéi";
	end;
	dialog_str = gsub(dialog_str,"<bro_sis>",strSex);
	if GetSex() == 1 then
		strSex = "S­ huynh ®Ö";
	elseif GetSex() == 2 then
		strSex = "S­ huynh muéi";
	else
		strSex = "S­ huynh ®Ö/ S­ huynh muéi";
	end;
	dialog_str = gsub(dialog_str,"<tbro_tsis>",strSex);
	return dialog_str
end

--ÈÎÎñ¶Ô»°
--nNpcTabIdx == TaskID
function tGtNpcMain:start_task_talk(nNpcTabIdx,nDialogNum)
	local nTaskTotal = tGtTask:check_task();
	if nTaskTotal == 0 then
		Talk(1,"","NhiÖm vô ®· nhËn ®· ®Çy, h·y gi¶i quyÕt råi h½ng quay l¹i nhËn thªm");
		return 0;
	end
	local nRoomWeight = tGtNpcInfo[nNpcTabIdx]["data"][6];
	if nRoomWeight ~= "" and nRoomWeight ~= nil then
		local strArray = split(nRoomWeight,";");
		if gf_Judge_Room_Weight(tonumber(strArray[1]),tonumber(strArray[2]),"") ~= 1 then
			return 0;
		end
	end
	local strDialog = tGtNpcInfo[nNpcTabIdx]["get_talk"][nDialogNum];
	if strDialog == "" or strDialog == nil then
		tGtNpcMain:start_task(nNpcTabIdx,1);
	else
		strDialog = tGtNpcMain:dialog_string_deal(strDialog,tGtNpcInfo[nNpcTabIdx].from_npc);
		Talk(1,"#tGtNpcMain:start_task_talk("..nNpcTabIdx..","..(nDialogNum+1)..")",strDialog);
	end
end

--½ÓÈÎÎñ´¦Àí
--nTypeÎª1Ê±±íÊ¾ÆÕÍ¨ÈÎÎñ£¬Îª2Ê±±íÊ¾Ëæ»úÈÎÎñÈë¿Ú
function tGtNpcMain:start_task(nNpcTabIdx,nType)
	local nTaskTotal = tGtTask:check_task();
	if nTaskTotal == 0 then
		Talk(1,"","NhiÖm vô ®· nhËn ®· ®Çy, h·y gi¶i quyÕt råi h½ng quay l¹i nhËn thªm");
		return 0;
	end	
	if nType == 2 then
		SetTaskTemp(tGtTask.GT_TEMP_TASK_ID,nNpcTabIdx);
		tGtNpcInfo[nNpcTabIdx]["data"][4]();  --action
	elseif nType == 1 then --and nNpcTabIdx > 260 then		--2011ĞÂ×ÊÁÏÆ¬
		--tGtTask:set_task(1,nNpcTabIdx)
		SetTaskTemp(tGtTask.GT_TEMP_TASK_ID,nNpcTabIdx); --´Ë´¦ÉèÖÃÎªÁËaction´¥·¢Æ÷µÄ´¦Àí
		SetTask(2956, nNpcTabIdx);
		--print("GetTask(2956) = ",GetTask(2956))
		--print("Open(\"TaskFace\","..nNpcTabIdx..",1)")
		--AcceptTask(nNpcTabIdx);
		SendScript2Client("Open(\"TaskFace\","..nNpcTabIdx..",1)");
--	elseif nType == 1 and nNpcTabIdx < 261 then		--2011Ë«½£ÖïĞ°
--		tGtTask:set_task(1,nNpcTabIdx);
--		SetTaskTemp(tGtTask.GT_TEMP_TASK_ID,nNpcTabIdx); --´Ë´¦ÉèÖÃÎªÁËaction´¥·¢Æ÷µÄ´¦Àí
--		tGtNpcInfo[nNpcTabIdx]["data"][4]();
--		if tonumber(tGtNpcInfo[nNpcTabIdx].data[1]) == 1 then --Ëæ»úÈÎÎñ
--			local nExTaskID = GetTaskTemp(tGtTask.GT_TEMP_RAND_ID);
--			tGtTask:set_ex_task(nNpcTabIdx,nExTaskID);
--		end
--		local strTip = tGtNpcInfo[nNpcTabIdx]["get_talk"].tip;
--		if strTip ~= nil and strTip ~= "" then 
--			TaskTip(strTip);
--		end
	end
	
end

--Íê³ÉÈÎÎñ¶Ô»°
function tGtNpcMain:finish_task_talk(nNpcTabIdx,nDialogNum)
	local nRoomWeight = tGtNpcInfo[nNpcTabIdx]["data"][7];
	if nRoomWeight ~= "" then
		local strArray = split(nRoomWeight,";");
		if gf_Judge_Room_Weight(tonumber(strArray[1]),tonumber(strArray[2]),"") ~= 1 then
			return 0;
		end
	end
	local strDialog = tGtNpcInfo[nNpcTabIdx]["finish_talk"][nDialogNum];
	if strDialog == "" or strDialog == nil then
		self:finish_task(nNpcTabIdx);
	else
		strDialog = tGtNpcMain:dialog_string_deal(strDialog,tGtNpcInfo[nNpcTabIdx].to_npc);
		Talk(1,"#tGtNpcMain:finish_task_talk("..nNpcTabIdx..","..(nDialogNum+1)..")",strDialog);
	end
end

--Íê³ÉÈÎÎñ´¦Àí
function tGtNpcMain:finish_task(nNpcTabIdx)
	SetTask(2956, nNpcTabIdx);
	SendScript2Client("Open(\"TaskFace\","..nNpcTabIdx..",2)");
end

--Î´Íê³ÉÈÎÎñ¶Ô»°
function tGtNpcMain:UnFinishTask(nTaskID)
	if tGtNpcInfo[nTaskID]["get_talk"].unFinish ~= nil and tGtNpcInfo[nTaskID]["get_talk"].unFinish ~= "" then
		local strDialog = tGtNpcMain:dialog_string_deal(tGtNpcInfo[nTaskID]["get_talk"].unFinish, sNpcName)
		Talk(1, "", strDialog)
	else
		Talk(1, "", "NhiÖm vô nµy vÉn ch­a hoµn ")
	end
end

function tGtNpcMain:cancel_main(nTaskID)
	if tGtNpcInfo[nTaskID] == nil then
		local strName = "";
		for i = 3,TABLE_GT_MAIN:getRow() do
			if nTaskID == tonumber(TABLE_GT_MAIN:getCell(i,2)) then
				strName = TABLE_GT_MAIN:getCell(i,4);
				break;
			end
		end
--		if strName == "" then
--			return 0;
--		else
			tGtNpcMain:get_main_table(strName);
--		end
	end
	local nConditionResult = tGtNpcInfo[nTaskID].data[3](); --Íê³ÉÌõ¼ş
	if GetTime() - GetTask(TASK_GT_TASK_CANCEL_TIME) < 60 then
		Talk(1,"","Gi·n c¸ch thêi gian 2 lÇn hñy nhiÖm vô lµ 1 phót!");
		return 0;
	end
	if nConditionResult ~= nil then --Âú×ãÍê³ÉÌõ¼ş
		if tGtTask:trigger_finish_state(nTaskID) == 1 then --and (nTaskID <= 282 or nTaskID >= 293) then --´¥·¢Æ÷Íê³ÉÇé¿ö
			Talk(1,"","NhiÖm vô nµy ®· hoµn thµnh, c¸c h¹ kh«ng cÇn hñy nhiÖm vô nµy!");
			return 0;
		else
			local strFromNpc = tGtNpcInfo[nTaskID].from_npc;
			local	strToNpc = tGtNpcInfo[nTaskID].to_npc;
--			if nTaskID ~= 263 and nTaskID ~= 274  and nTaskID ~= 495 and strFromNpc ~= "ÒÇºÍ" and strToNpc ~= "ÒÇºÍ" and strFromNpc ~= "º£±õ´¬·ò" and strToNpc ~= "º£±õ´¬·ò" and strFromNpc ~= "´úÖ¾Ç¿" and strToNpc ~= "´úÖ¾Ç¿" and strFromNpc ~= "ÇÙ¾ı·½Òô" and strToNpc ~= "ÇÙ¾ı·½Òô" and strFromNpc ~= "ÌìÊà½£·¶ĞÇÀ½" and strToNpc ~= "ÌìÊà½£·¶ĞÇÀ½"  then	--ÎäÆ÷µêÀÏ°å XOXO ÒÇºÍ
				local nMoney1 = tonumber(tGtNpcInfo[nTaskID].data[8]);
				if nMoney1 ~= -1 and nMoney1 ~= nil then
					tGtNpcMain:cancel_task_talk(nTaskID,nMoney1);
				else
					Talk(1,"","NhiÖm vô nµy kh«ng thÓ bá!");
				end
--			else
--				Talk(1,"","¸ÃÈÎÎñ²»¿É·ÅÆú£¡");
--			end
		end
	else
		local strFromNpc = tGtNpcInfo[nTaskID].from_npc;
		local	strToNpc = tGtNpcInfo[nTaskID].to_npc;
--		if nTaskID ~= 263 and nTaskID ~= 274  and nTaskID ~= 495 and strFromNpc ~= "ÒÇºÍ" and strToNpc ~= "ÒÇºÍ" and strFromNpc ~= "º£±õ´¬·ò" and strToNpc ~= "º£±õ´¬·ò" and strFromNpc ~= "´úÖ¾Ç¿" and strToNpc ~= "´úÖ¾Ç¿" and strFromNpc ~= "ÇÙ¾ı·½Òô" and strToNpc ~= "ÇÙ¾ı·½Òô" and strFromNpc ~= "ÌìÊà½£·¶ĞÇÀ½" and strToNpc ~= "ÌìÊà½£·¶ĞÇÀ½"  then	--ÎäÆ÷µêÀÏ°å XOXO ÒÇºÍ
			local nMoney1 = tonumber(tGtNpcInfo[nTaskID].data[8]);
			if nMoney1 ~= -1 and nMoney1 ~= nil then
				tGtNpcMain:cancel_task_talk(nTaskID,nMoney1);
			else
				Talk(1,"","NhiÖm vô nµy kh«ng thÓ bá!");
			end
--		else
--			Talk(1,"","¸ÃÈÎÎñ²»¿É·ÅÆú£¡");
--		end		
	end
end

--È¡ÏûÈÎÎñ¶Ô»°
function tGtNpcMain:cancel_task_talk(nTaskID,nMoney)
	if nMoney == 0 then
		tGtNpcMain:cancel_task_confirm(nTaskID,nMoney);
		return
	end
	local strMoney = gf_GetMoneyString(nMoney);
	Say("Hñy nhiÖm vô nµy cÇn tiªu hao<color=yellow>"..strMoney.."<color>, x¸c ®Şnh muèn hñy?",
		2,
		"\n§óng råi, ta muèn hñy/#tGtNpcMain:cancel_task_confirm("..nTaskID..","..nMoney..")",
		"\nKÕt thóc ®èi tho¹i/nothing")
end

--È·¶¨È¡ÏûÈÎÎñ
function tGtNpcMain:cancel_task_confirm(nTaskID,nMoney)
	if GetCash() < nMoney then
		Talk(1,"","Vµng mang trªn ng­êi kh«ng ®ñ.");
		return 0;
	end
	if Pay(nMoney) == 1 or nMoney == 0 then
		tGtTask:remove_trigger(nTaskID);
		tGtTask:set_task(3,nTaskID);
		KillFollower();--°Ñ¸úËænpc¸Éµô
		
		--É¾³ıÈÎÎñµÀ¾ß
		--½áÊøÇ°¶¯×÷£º²ß»®Éè¶¨£¬É¾³ı£¬¶Ô»°
		tGtCondition:del_item_force(tGtNpcInfo[nTaskID]["data"][10])
	
		SetTask(TASK_GT_TASK_CANCEL_TIME,GetTime());
		if tGtNpcInfo[nTaskID].from_npc and strlen(tGtNpcInfo[nTaskID].from_npc) > 0 then
			Msg2Player("NhiÖm vô cña c¸c h¹ ®· hñy. Cã thÓ t×m["..tGtNpcInfo[nTaskID].from_npc.."]®Ó nhËn l¹i nhiÖm vô nµy!");
			Talk(1,"","NhiÖm vô cña c¸c h¹ ®· hñy. Cã thÓ t×m["..tGtNpcInfo[nTaskID].from_npc.."]®Ó nhËn l¹i nhiÖm vô nµy!");
		else
			Msg2Player("NhiÖm vô cña c¸c h¹ ®· hñy.");
			Talk(1,"","NhiÖm vô cña c¸c h¹ ®· hñy.");
		end
		---------------------------·ÅÆúÈÎÎñÌØÊâ´¦Àí---------------
		--µÚ3²½²é¿´°ÙĞÕÇé¿ö
		if nTaskID == 3 then 
			SetTask(Task_id_003,0)
		end
		--µÚ12²½½â¾È°ÙĞÕ
		if nTaskID == 12 then
			SetTask(Task_id_004,0)
			DelItem(2,0,30010,GetItemCount(2,0,30010) or 1)
			AddItem(2,0,30010,1)				
		end
		--µÚ40²½É±ËÀ´óÄêÊŞ
		if nTaskID == 40 then
			SetTask(Task_id_005,0)
		end
		--µÚ68²½ÉÕ»ÙÎï×Ê
		if nTaskID == 68 then
			SetTask(Task_id_006,0)
			SetTask(Task_id_012,0)
		end
		--µÚ69²½Óª¾ÈÄÚÓ¦
		if nTaskID == 69 then
			SetTask(Task_id_007,0)
		end
		--µÚ70²½¼áÊØ·´ÆË
		if nTaskID == 70 then
			SetTask(Task_id_008,0)
			SetTask(Task_id_009,0)
			SetTask(Task_id_010,0)
			SetTask(Task_id_013,0)
			SetTaskTemp(250,0);
			SetNpcLifeTime(GetTask(Task_id_011),0)
			SetTask(Task_id_011,0)
			RemoveTrigger(GetTrigger(1267*2));
			RemoveTrigger(GetTrigger(1268*2));
			RemoveTrigger(GetTrigger(1269*2));
			RemoveTrigger(GetTrigger(1270*2));
			RemoveTrigger(GetTrigger(1271*2));
			RemoveTrigger(GetTrigger(1272*2));
			RemoveTrigger(GetTrigger(1518*2));
			RemoveTrigger(GetTrigger(3007*2));
			DelItem(2,0,30040,GetItemCount(2,0,30040) or 1)		
			SetMapTaskTemp(6017,Map_Glb_Valve,GetMapTaskTemp(6017,Map_Glb_Valve)-1);
		end
		--µÚ72²½»÷°Ü¶«·½²»°Ü
		if nTaskID == 72 then
--			SetNpcLifeTime(GetTask(Task_id_013),0);
--			SetNpcLifeTime(GetTask(Task_id_014),0);
--			SetNpcLifeTime(GetTask(Task_id_015),0);
--			SetTask(Task_id_013,0)
--			SetTask(Task_id_014,0)
--			SetTask(Task_id_015,0)
		end
		----------------------------------------------------------
	end
end   

--Ìø¹ıÈÎÎñ¶Ô»°
function tGtNpcMain:skip_task_talk(nTaskID,nMoney)
	local strMoney = gf_GetMoneyString(nMoney);
	Say("Bá qua nhiÖm vô nµy cÇn tiªu hao <color=yellow>"..strMoney.."<color>, x¸c ®Şnh muèn bá chø?",
		2,
		"\n§óng, ta muèn bá qua/#tGtNpcMain:skip_task_confirm("..nTaskID..","..nMoney..")",
		"\nKÕt thóc ®èi tho¹i/nothing")
end

--È·¶¨Ìø¹ıÈÎÎñ
function tGtNpcMain:skip_task_confirm(nTaskID,nMoney)
	if GetCash() < nMoney then
		Talk(1,"","Vµng mang trªn ng­êi kh«ng ®ñ.");
		return 0;
	end
	if Pay(nMoney) == 1 then
		tGtNpcMain:finish_task(nTaskID);
	end
end

--Íê³ÉÈÎÎñ½±ÀøÌáÊ¾
function tGtNpcMain:ShowAward(nTaskID)
	local TaskName = nil
	local strPrize = nil
	for i = 3,TABLE_GT_MAIN:getRow() do
		if nTaskID == tonumber(TABLE_GT_MAIN:getCell(i,2)) then
			TaskName = TABLE_GT_MAIN:getCell(i,1);
			strPrizeID = TABLE_GT_MAIN:getCell(i,9);
			bFlag = 1
			break;
		end
	end
	if not TaskName or not strPrizeID then
		return
	end
	local msg = "";
	local nCount = 0;
	while 1 do
		if nCount > 10 then
			break
		end
		local nIndex = strfind(strPrizeID, "&") or (strlen(strPrizeID) + 1);
		local nConditionID = tonumber(strsub(strPrizeID, 1, nIndex - 1))
		g_GtPrize = g_GtPrize or {}
		if not g_GtPrize[nConditionID] then
			g_GtPrize[nConditionID] = {};
			local nIDRow = TABLE_GT_PRIZE:selectRowNum(1,nConditionID);
			g_GtPrize[nConditionID][1] = TABLE_GT_PRIZE:getCell(nIDRow,2);
			for i = 3,8 do
				g_GtPrize[nConditionID][i-1] = TABLE_GT_PRIZE:getCell(nIDRow,i);
			end
			if tGtPrize.tPrizeType[g_GtPrize[nConditionID][1]] == nil then
				return nil;
			end
		end
		if g_GtPrize[nConditionID][1] == "Exp" then
			msg = msg..format("Exp:%s", g_GtPrize[nConditionID][2]).."\n"
		elseif g_GtPrize[nConditionID][1] == "Item" then
			local cIndex = nil
			local strItem = g_GtPrize[nConditionID][2];
			for i = 1, strlen(strItem) do
				if strsub(strItem, i, i) == "," then
					cIndex = i
				end
			end
			if not cIndex then
				msg = msg..format("§¹o cô: %s", g_GtPrize[nConditionID][3]).."\n"
			else
				local nNum = tonumber(strsub(strItem, cIndex + 1, strlen(strItem)))
				msg = msg..format("§¹o cô: %s*%d", g_GtPrize[nConditionID][3], nNum).."\n"
			end
		elseif	g_GtPrize[nConditionID][1] == "Money" then
			msg = msg..format("Vµng: %d vµng", tonumber(g_GtPrize[nConditionID][2])/10000).."\n"
		elseif	g_GtPrize[nConditionID][1] == "ZhenQi" then
			msg = msg..format("Ch©n khİ: %s", g_GtPrize[nConditionID][2]).."\n"
		end
		if nIndex + 1 > strlen(strPrizeID) then
			break
		end
		strPrizeID = strsub(strPrizeID, nIndex + 1, strlen(strPrizeID)) 
		nCount = nCount + 1	
	end 
	Talk(1,"",format("Hoµn thµnh nhiÖm vô [<color=gold>%s<color>] nhËn ®­îc phÇn th­ëng:\n<color=green>%s<color>", TaskName, msg))
end

--=======================Ìõ¼ş´¦Àí====================================
tGtCondition = {};

--¼ì²âÈÎÎñIDÎªnTaskIDµÄÈÎÎñ×´Ì¬
--nValueÎª1±íÊ¾¼ì²âÊÇ·ñÒÑ¾­Íê³É¸ÃÈÎÎñ£¬Îª0±íÊ¾Î´½Ó¸ÃÈÎÎñ£¨Ò»°ãÓÃÓÚ·ÖÖ§Ñ¡Ôñ£©£¬2±íÊ¾ÊÇ·ñ½ÓÁË
function tGtCondition:check_taskid(nTaskID,nValue)
	nTaskID = tonumber(nTaskID);
	nValue = tonumber(nValue);
	if nTaskID == nil or nValue == nil then
		return nil;
	end
	local nTabIdx,nBit = 0,0;
	nTabIdx = ceil(nTaskID/31);
	nBit = mod(nTaskID,31);
	if nBit == 0 then
		nBit = 31;
	end
	local nResult = gf_GetTaskBit(tGtTask.tGtTaskID[nTabIdx],nBit);
	if nValue == 1 and nResult == nValue then
		return 1;
	elseif nValue == 0 then
		local nCheckCurTask = tGtTask:check_cur_task(nTaskID);
		if nCheckCurTask == 1 or nResult == 1 then --½ÓÁË¸ÃÈÎÎñ»òÕß¸ÃÈÎÎñÒÑ¾­Íê³É
			return nil;
		else
			return 1;
		end
	elseif nValue == 2 then
		local nCheckCurTask = tGtTask:check_cur_task(nTaskID);
		if nCheckCurTask == 1 and nResult == 0 then
			return 1;
		else
			return nil;
		end
	end
	return nil;
end

--¼ì²âÍæ¼ÒµÈ¼¶ÊÇ·ñ´óÓÚµÈÓÚnValue
function tGtCondition:check_lv(nValue, nReborn)
	nValue = tonumber(nValue) or 9999;
	nReborn = tonumber(nReborn) or 0;
	local nNeedLv = nReborn * 100 + nValue;
	local nCurrLv = gf_GetPlayerRebornCount() * 100 + GetLevel();
	if nCurrLv >= nNeedLv then
		return 1;
	else
		return nil;
	end
end

--¼ì²âÍæ¼ÒÈÎÎñ±äÁ¿nValue1µÄÖµÓënValue2µÄ¹ØÏµnValue3
function tGtCondition:check_tv(nValue1,nValue2,nValue3)
	nValue1 = tonumber(nValue1);
	nValue2 = tonumber(nValue2);
	nValue3 = tonumber(nValue3);
	if nValue1 == nil or nValue2 == nil or nValue3 == nil then
		return nil;
	end
	return ((1 == nValue3 and GetTask(nValue1) == nValue2) or
	        (2 == nValue3 and GetTask(nValue1) >  nValue2) or
	        (3 == nValue3 and GetTask(nValue1) >= nValue2) or
	        (4 == nValue3 and GetTask(nValue1) <  nValue2) or
	        (5 == nValue3 and GetTask(nValue1) <= nValue2) or
	        (6 == nValue3 and GetTask(nValue1) ~= nValue2));
end

--¼ì²âÎïÆ·
function tGtCondition:check_item(nID1,nID2,nID3,nNums,sName)
	nID1,nID2,nID3,nNums,sName = tonumber(nID1),tonumber(nID2),tonumber(nID3),tonumber(nNums),tostring(sName);
	if nID1 == nil or nID2 == nil or nID3 == nil or nNums == nil or sName == nil then
		return nil;
	end
	if GetItemCount(nID1,nID2,nID3) < nNums then
		return nil;
	else
		return 1;
	end
end

--¼ì²âÇ°Ò»¸öÈÎÎñÊÇ·ñÒÑ¾­Íê³É
function tGtCondition:check_ex_task()
	local nTaskID = GetTaskTemp(tGtTask.GT_TEMP_TASK_ID);
	if nTaskID == 0 then
		return nil;
	else
		local nCheck = self:check_taskid(nTaskID-1,1);
		if nCheck == 1 then
			return 1;
		else
			return nil;
		end
	end
end

function tGtCondition:check_kill()
	return 1;
end

function tGtCondition:do_script()
	return 1;
end
--nValue Îª 1 ÑéÖ¤ÊÇÄĞ£¬2ÎªÅ®
function tGtCondition:sex(nValue)
	nValue = tonumber(nValue);
	if nValue == 1 or nValue == 2 then
		local nSex = GetSex();
		if nSex == nValue then
			return 1
		end
	end

	return nil;
end

function tGtCondition:command(nValue)
	if nValue == "" then
		return nil;
	end

	dostring("return "..nValue);
end

function tGtCondition:_nil()
	return nil;
end

function tGtCondition:check_player_route(nValue)
	nValue = tonumber(nValue);	
	if nValue == 1 then --²»¼ÓÈëÃÅÅÉ²Å¿ÉÒÔ½Ó
		if gf_CheckPlayerRoute() ~= 1 then
			return 1
		else
			return nil
		end
	elseif nValue == 2 then --¼ÓÈëÃÅÅÉ²Å¿ÉÒÔ½Ó
		if gf_CheckPlayerRoute() == 1 then
			return 1
		else
			return nil
		end
	end

	return nil
end

--1¡¢ĞèÒªÔÚ¶ÓÎéÖĞ
--2¡¢ĞèÒª²»ÔÚ¶ÓÎéÖĞ
function tGtCondition:is_in_team(nValue)
	nValue = tonumber(nValue);

	if 1 == nValue then
		return ((0 == GetTeamID()) and 0) or 1;
	end

	if 2 == nValue then
		return ((0 == GetTeamID()) and 1) or 0;
	end
end

--nKey 
--1£¬µÈÓÚnLevel
--2£¬´óÓÚnLevel
--3£¬´óÓÚµÈÓÚnLevel
--4£¬Ğ¡ÓÚnlevel
--5£¬Ğ¡ÓÚµÈÓÚnlLevel
function tGtCondition:check_meridian(sLevel, sKey)
	local nLevel = tonumber(sLevel);
	local nKey = tonumber(sKey);
	if nLevel < 0 or nLevel > 6 then
		return nil;
	end
	if nKey < 1 or nKey > 5 then
		return nil;
	end
	local nCurrentLevel = MeridianGetLevel();
	if nKey == 1 then
		if nCurrentLevel == nLevel then
			return 1;
		else
			return nil;
		end
	end
	if nKey == 2 then
		if nCurrentLevel > nLevel then
			return 1;
		else
			return nil;
		end
	end
	if nKey == 3 then
		if nCurrentLevel >= nLevel then
			return 1;
		else
			return nil;
		end
	end
	if nKey == 4 then
		if nCurrentLevel < nLevel then
			return 1;
		else
			return nil;
		end
	end
	if nKey == 5 then
		if nCurrentLevel <= nLevel then
			return 1;
		else
			return nil;
		end
	end
end

--nKey 
--1£¬µÈÓÚnLevel
--2£¬´óÓÚnLevel
--3£¬´óÓÚµÈÓÚnLevel
--4£¬Ğ¡ÓÚnlevel
--5£¬Ğ¡ÓÚµÈÓÚnlLevel
function tGtCondition:check_reborn(sLevel, sKey)
	local nLevel = tonumber(sLevel);
	local nKey = tonumber(sKey);
	if nLevel < 0 or nLevel > 7 then
		return nil;
	end
	local nCurrentLevel = gf_GetPlayerRebornCount();
	if nKey == 1 then
		if nCurrentLevel == nLevel then
			return 1;
		else
			return nil;
		end
	end
	if nKey == 2 then
		if nCurrentLevel > nLevel then
			return 1;
		else
			return nil;
		end
	end
	if nKey == 3 then
		if nCurrentLevel >= nLevel then
			return 1;
		else
			return nil;
		end
	end
	if nKey == 4 then
		if nCurrentLevel < nLevel then
			return 1;
		else
			return nil;
		end
	end
	if nKey == 5 then
		if nCurrentLevel <= nLevel then
			return 1;
		else
			return nil;
		end
	end
end

function tGtCondition:check_exp(nExp)
	local nNeedExp = tonumber(nExp)
	if GetExp() < nNeedExp then
		return nil
	end
	return 1;
end

tGtCondition.tConditionType = {
	TaskID = tGtCondition.check_taskid,  --¼ì²âÈÎÎñID
	Lv = tGtCondition.check_lv,			--¼ì²âµÈ¼¶
	Item = tGtCondition.check_item,		--¼ì²âÎïÆ·
	Tv = tGtCondition.check_tv,			--¼ì²âÈÎÎñ±äÁ¿Öµ
	ExTask = tGtCondition.check_ex_task,
	Killer = tGtCondition.check_kill,
	Sex = tGtCondition.sex,
	CheckPlayerRoute = tGtCondition.check_player_route,
	IsInTeam = tGtCondition.is_in_team,
	Script = tGtCondition.do_script,
	Meridian = tGtCondition.check_meridian,--¼ì²â¾­ÂöµÈ¼¶
	Reborn = tGtCondition.check_reborn, --¼ì²â×ªÉúµÈ¼¶
	Exp = tGtCondition.check_exp, --¼ì²â¾­Ñé
};

--´«ÈëÌõ¼şID£¬µÃµ½Ìõ¼şType£¬Ö´ĞĞ¶ÔÓ¦º¯Êı
function tGtCondition:check(nConditionID)
	g_GtCondition = g_GtCondition or {};
	if not g_GtCondition[nConditionID] then
		g_GtCondition[nConditionID] = {};
		local nIDRow = TABLE_GT_CONDITION:selectRowNum(1,nConditionID);
		g_GtCondition[nConditionID][1] = TABLE_GT_CONDITION:getCell(nIDRow,2);
		for i = 3,8 do
			g_GtCondition[nConditionID][i-1] = TABLE_GT_CONDITION:getCell(nIDRow,i);
		end
		if tGtCondition.tConditionType[g_GtCondition[nConditionID][1]] == nil then
			return nil;
		end
	end
	local nConditionType = g_GtCondition[nConditionID][1];
	return tGtCondition.tConditionType[nConditionType](self,g_GtCondition[nConditionID][2],g_GtCondition[nConditionID][3],g_GtCondition[nConditionID][4],g_GtCondition[nConditionID][5],g_GtCondition[nConditionID][6]);
end

--ÈÎÎñÌõ¼ş´¦Àí
function tGtCondition:get_sub(sExpression)
	sExpression = gsub(sExpression,"&"," and ");
	sExpression = gsub(sExpression,"|"," or ");
	sExpression = gsub(sExpression,"(%d+)","tGtCondition:check(%1)");
	return sExpression
end

--²ÎÊı´«Èë±í´ïÊ½£¬½á¹û·µ»Ø1»ònil
function tGtCondition:result(sExpression)
	sExpression = tGtCondition:get_sub(sExpression);
	dostring("nConditionResult = "..sExpression);
	return nConditionResult;
end

--´«ÈëAction ID£¬¼ì²âĞèÒªÉ¾³ıµÄÎïÆ·
function tGtCondition:check_del_item(nConditionID)
	if g_GtCondition[nConditionID] ~= nil then
		if g_GtCondition[nConditionID][1] == "Item" then
			if DelItem(g_GtCondition[nConditionID][2],g_GtCondition[nConditionID][3],g_GtCondition[nConditionID][4],g_GtCondition[nConditionID][5]) == 1 then
				return 1;
			else
				return nil;
			end
		end
		if g_GtCondition[nConditionID][1] == "Exp" then
			local nExp = tonumber(g_GtCondition[nConditionID][2]);
			if GetExp() < nExp then
				return nil;
			end
			ModifyExp(-nExp);
			return 1;
		end
	end
	return 1;
end

--´«ÈëAction ID£¬¼ì²âĞèÒªÉ¾³ıµÄÎïÆ·
function tGtCondition:force_del_item(nConditionID)
	--g_GtCondition¿ÉÄÜÎ´³õÊ¼»¯
	self:check(nConditionID);
	if g_GtCondition[nConditionID] ~= nil then
		if g_GtCondition[nConditionID][1] == "Item" then
			if BigDelItem(g_GtCondition[nConditionID][2],g_GtCondition[nConditionID][3],g_GtCondition[nConditionID][4],g_GtCondition[nConditionID][5]) == 1 then
				return 1;
			else
				return 2;
			end
		end
	end
	return 1;
end

--Ç¿ÖÆÉ¾³ıÈÎÎñµÀ¾ß
function tGtCondition:del_item_force(sExpression)
	if sExpression == "" or sExpression == nil then
		return 1;
	end
	sExpression = gsub(sExpression,"&"," ; ");
	sExpression = gsub(sExpression,"|"," ; ");
	sExpression = gsub(sExpression,"(%d+)","tGtCondition:force_del_item(%1)");
	dostring(sExpression);
	return 0;
end

--ÈÎÎñÍê³ÉÌõ¼ş£¬¼ì²âÒªÉ¾³ıµÄÎïÆ·²¢Ö´ĞĞÉ¾³ı²Ù×÷
function tGtCondition:del_item_confirm(sExpression)
	if sExpression == "" or sExpression == nil then
		return 1;
	end
	sExpression = gsub(sExpression,"&"," and ");
	sExpression = gsub(sExpression,"|"," or ");
	sExpression = gsub(sExpression,"(%d+)","tGtCondition:check_del_item(%1)");
	dostring("g_ret = "..sExpression);
	return g_ret;
end

--=========================Action & Prize´¦Àí=============================
tGtPrize = {};

--´´½¨´¥·¢Æ÷
function tGtPrize:create_trigger(nValue1,nValue2,nValue3)
	if (nValue1 == nil and nValue2 == nil) or nValue3 == nil then
		return nil;
	end
	if tonumber(nValue1) == 1 and nValue3 == nil then
		return nil;
	end
	local TaskID = GetTaskTemp(tGtTask.GT_TEMP_TASK_ID);
	if TaskID == 0 then
		return nil;
	end
	local nTaskValue = tGtTask:get_task(TaskID); --¼ÇÂ¼´ËÈÎÎñIDµÄÈÎÎñ±äÁ¿
	local nTaskValue2 = nTaskValue+tGtTask.GLV_GT_TASK_NUM+1;
	local nCount = gf_GetTaskByte(nTaskValue2,2);
	gf_SetTaskByte(nTaskValue2,2,nCount+1);
	local nValue3 = tGtTask.GT_TRIGGER_OFFSET+TaskID*10+nCount+1; --×Ô¶¨ÒåIDÎªÈÎÎñID*10+4000Æ«ÒÆÁ¿+´¥·¢Æ÷µÄÊıÁ¿
	local n = CreateTrigger(tonumber(nValue1),tonumber(nValue2),nValue3,1);
	if tonumber(nValue1) == 1 then
		ContinueTimer(n);
	end
end

--¸øÓèÈÎÎñIDÎªnValue1µÄÈÎÎñ£¬²»ÔÙ¼ì²âÈÎÎñÌõ¼ş
function tGtPrize:task_next(nValue1)
	nValue1 = tonumber(nValue1);
	if nValue1 == nil then
		return nil;
	end
	tGtNpcMain:start_task_talk(nValue1,1);
end

--´«ÈëÈÎÎñIDºÍ¸ÅÂÊ»ñÈ¡ÈÎÎñID
function tGtPrize:rand_task(nValue1,nValue2)
	if nValue1 == "" or nValue2 == "" then
		return nil;
	end
	local tTaskID = split(nValue1,";");
	local tIDrand = split(nValue2,";");
	local nTotal = 0;
	for i = 1,getn(tIDrand) do
		nTotal = nTotal + tonumber(tIDrand[i]);
	end
	local nRand = random(1,nTotal);
	local nCurRand = 0;
	local nTaskID = 0;
	for i = 1,getn(tIDrand) do
		nCurRand = nCurRand + tonumber(tIDrand[i]);
		if nRand <= nCurRand then
			nTaskID = tonumber(tTaskID[i]);
			break;
		end
	end
	if nTaskID ~= 0 and nTaskID ~= nil then
		SetTaskTemp(tGtTask.GT_TEMP_RAND_ID,GetTaskTemp(tGtTask.GT_TEMP_TASK_ID));
		tGtNpcMain:start_task_talk(nTaskID,1);
	end
end

--¸øÓè¾­Ñé
function tGtPrize:give_exp(nValue1)
	if nValue1 == "" then
		return nil;
	end
	local nLv = GetLevel();
	nValue1 = gsub(nValue1,"Lv",nLv);
	dostring("gf_Modify('Exp',"..nValue1..")");
end
--¸øÓèÕæÆø
function tGtPrize:give_zhenqi(nValue)
	if nValue == "" then
		return nil;
	end
--	if tonumber(nValue) > 1000 then
--		print("WARN: \\script\\task\\global_task\\gtask_head.lua tGtPrize:give_zhenqi nValue > 1000")
--	end
	AwardGenuineQi(tonumber(nValue));
end
--¸øÓèÎïÆ·
function tGtPrize:give_item(nValue1,nValue2,nValue3)
	if nValue1 == "" or nValue2 == "" then
		return nil;
	end
	dostring("gAddFlag,gAddIdx = gf_AddItemEx({"..nValue1.."},'"..nValue2.."')");
	if nValue3 ~= "" then
		nValue3 = tonumber(nValue3);
		if gAddFlag == 1 then
			SetItemExpireTime(gAddIdx,nValue3);
		end
	end
	gAddFlag,gAddIdx = nil,nil
end

--ÉèÖÃ±äÁ¿Öµ
function tGtPrize:set_task_value(nValue1,nValue2,nValue3)
	nValue1, nValue2, nValue3 = tonumber(nValue1), tonumber(nValue2), tonumber(nValue3);
	if nValue1 == nil or nValue2 == nil then
		return nil;
	end
	if nValue3 then
		SetTask(nValue1,nValue2);
	else
		SetTask(nValue1, nValue2 + GetTask(nValue1));
	end
end

--¸øÇ®
function tGtPrize:give_money(nValue1)
	if nValue1 == "" then
		return nil;
	end
	dostring("gf_Modify('Money',"..nValue1..")");
end

--Ö´ĞĞÄ³¸ö½Å±¾ÀïµÄÄ³¸öº¯Êı
function tGtPrize:send_script(nValue)
	if nValue == "" then
		return nil;
	end
	dofile(nValue);
end

function tGtPrize:tong_score(nValue1)
	nValue1 = tonumber(nValue1);
	if nValue1 == nil then
		return nil;
	end
	ModifyPlayerCurWeekScore(nValue1);
	ModifyTongCurWeekScore(nValue1);
	Msg2Player("B¹n nhËn ®­îc "..nValue1.."®iÓm Th­ëng ThiÖn Ph¹t ¸c!");
end

function tGtPrize:create_npc(nValue1,nValue2,nValue3,nValue4)
	nValue1,nValue2,nValue3 = tostring(nValue1),tostring(nValue2),tonumber(nValue3);
	if nValue1 == "" or nValue2 == "" then
		return nil;
	end
	nValue3 = nValue3 or 1;
	for i = 1,nValue3 do
		local nNpcIdx;
		local nMapId,nX,nY = GetWorldPos();
		local i = random(4);
		local j = random(4);
		local tbTemp = {2,-2,1,-1};
		nNpcIdx = CreateNpc(nValue1,nValue2,nMapId,nX+tbTemp[i],nY+tbTemp[j]);
		if nValue4 ~= "" and nValue4 ~= nil then
			SetNpcScript(nNpcIdx,nValue4)
		else
			SetNpcScript(nNpcIdx, "\\script\\task\\global_task\\gtask_npc.lua");
		end
		SetNpcLifeTime(nNpcIdx,3*60); --NpcÄ¬ÈÏÉú´æÊ±¼ä3min
	end
end

function tGtPrize:change_npc_to_fight()
	local nIndexNpc = GetTargetNpc();
	ChangeNpcToFight(nIndexNpc);
	local sNpcName = GetTargetNpcName();
	--change npc ÌØÊâ´¦Àí
	if sNpcName == "Bao tr­ëng l·o" and tGtTask:check_cur_task(8) == 1 then
		SetNpcDeathScript(nIndexNpc,"\\script\\task\\npc\\±«³¤ÀÏDeath.lua");
		return 1;
	end
	if sNpcName == "Hoµng Chung C«ng" and tGtTask:check_cur_task(50) == 1 then
		SetNpcDeathScript(nIndexNpc,"\\script\\task\\npc\\»ÆÖÓ¹«Death.lua");
		return 1;
	end
	------------------------
	SetNpcDeathScript(nIndexNpc,"\\script\\task\\global_task\\gtask_head.lua");
	return 1;
end

function OnDeath(nIndexNpc)
	SetNpcLifeTime(nIndexNpc,0);
end

--¸ù¾İĞÔ±ğÑ¡Ôñ
function tGtPrize:sex(tValue)
	local tTaskID = split(tValue, ";");
	if getn(tTaskID) == 2 then
		tGtNpcMain:start_task_talk(tonumber(tTaskID[GetSex()]), 1);
	end
end

function tGtPrize:newWorld(nValue1, nValue2, nValue3)
	--print("!!!newnew!!!")
	NewWorld(tonumber(nValue1), tonumber(nValue2), tonumber(nValue3));
end

function tGtPrize:add_stat_value(nValue1, nValue2)
	nValue2 = tonumber(nValue2)
	if nValue1 == "" then
		return nil;
	end

	dostring(format("AddStatValue('%s', %d)", nValue1, nValue2));
end

function tGtPrize:command(nValue1)
	if nValue1 == "" then
		return nil;
	end

	dostring(nValue1);
end

function tGtPrize:exec_func(szPath, szFunc)
	if szPath == "" or szFunc == "" then
		return nil;
	end
	SetPlayerScript(szPath);
	SendScript2VM(szPath, szFunc);
end

tGtPrize.tPrizeType = {
	Trigger = tGtPrize.create_trigger,  --´´½¨´¥·¢Æ÷
	Exp = tGtPrize.give_exp,			--¸øÓè¾­Ñé
	Item = tGtPrize.give_item,		--¸øÓèÎïÆ·
	Tv = tGtPrize.set_task_value,			--ÉèÖÃÈÎÎñ±äÁ¿Öµ
	Money = tGtPrize.give_money,			--¸øÓèÇ®
	TaskNext = tGtPrize.task_next,    --½ÓÈ¡ÈÎÎñ
	Rand = tGtPrize.rand_task,       --Ëæ»úÈÎÎñ
	Script = tGtPrize.send_script,   --Ö´ĞĞÄ³¸ö½Å±¾ÀïµÄÄ³¸öº¯Êı
	Score = tGtPrize.tong_score,     --¸øÓèÉÍÉÆ·£¶ñÖµ£¨°ï»á£©
	CrNpc = tGtPrize.create_npc,       --´´½¨npc
	ChangeNpc = tGtPrize.change_npc_to_fight,   --×ª»»Õ½¶·npc
	Sex = tGtPrize.sex,				--ÅĞ¶ÏĞÔ±ğ
	Stat = tGtPrize.add_stat_value,		--Êı¾İÂñµã
	NewWorld = tGtPrize.newWorld,		--×ø±ê
	--DelItem = tGtPrize.delItem,			--É¾³ı£¬²»Ö§³Ö
	ZhenQi = tGtPrize.give_zhenqi,
	Command = tGtPrize.command,			--Ö´ĞĞ½Å±¾£¬ÓĞÁËËûÊµ¼ÊÉÏ¿ÉÒÔ²»ÓÃÉÏÃæ²¿·ÖµÄÄÚÈİÁË
	Function = tGtPrize.exec_func, 	--Ö´ĞĞ½Å±¾º¯Êı
};

--´«ÈëAction ID£¬µÃµ½Action Type£¬Ö´ĞĞ¶ÔÓ¦º¯Êı
function tGtPrize:action_prize(nConditionID)
	g_GtPrize = g_GtPrize or {}
	if not g_GtPrize[nConditionID] then
		g_GtPrize[nConditionID] = {};
		local nIDRow = TABLE_GT_PRIZE:selectRowNum(1,nConditionID);
		g_GtPrize[nConditionID][1] = TABLE_GT_PRIZE:getCell(nIDRow,2);
		for i = 3,8 do
			g_GtPrize[nConditionID][i-1] = TABLE_GT_PRIZE:getCell(nIDRow,i);
		end
		if tGtPrize.tPrizeType[g_GtPrize[nConditionID][1]] == nil then
			return nil;
		end
	end
	local nConditionType = g_GtPrize[nConditionID][1];
	tGtPrize.tPrizeType[nConditionType](self,g_GtPrize[nConditionID][2],g_GtPrize[nConditionID][3],g_GtPrize[nConditionID][4],g_GtPrize[nConditionID][5],g_GtPrize[nConditionID][6],g_GtPrize[nConditionID][7]);
	return 1;
end

--ÈÎÎñÌõ¼ş´¦Àí
function tGtPrize:get_sub(sExpression)
	sExpression = gsub(sExpression,"&"," and ");
	sExpression = gsub(sExpression,"|"," or ");
	sExpression = gsub(sExpression,"(%d+)","tGtPrize:action_prize(%1)");
	return sExpression
end

--²ÎÊı´«Èë±í´ïÊ½£¬Ö´ĞĞ
function tGtPrize:result(sExpression)
	sExpression = tGtCondition:get_sub(sExpression);
	dostring(sExpression);
end

