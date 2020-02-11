
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ÈÎÎñÏµÍ³ÊµÌå´¦ÀíÎÄ¼ş
-- Edited by peres
-- 2005/05/07 PM 19:55

-- ÑÌ»¨¡£ÄÇÒ»Ò¹µÄÑÌ»¨¡£
-- Ëı¼ÇµÃËûÔÚ´óÓêµÄÈËÈºÖĞ£¬Õ¾ÔÚËıµÄ±³ºóÓµ±§×¡Ëı¡£
-- ËûÎÂÅ¯µÄÆ¤·ô£¬ËûÊìÏ¤µÄÎ¶µÀ¡£ÑÌ»¨ÕÕÁÁËıµÄÑÛ¾¦¡£
-- Ò»ÇĞÎŞ¿ÉÍì»Ø¡­¡­

-- ======================================================

-- ¶ÁÈëÈÎÎñÒıÇæÍ·ÎÄ¼ş
Include("\\script\\lib\\task_head.lua");

-- ¶ÁÈëÈÎÎñÒıÇæ±äÁ¿¹ÜÀíÎÄ¼ş
Include("\\script\\lib\\task_value.lua");

-- ¶ÁÈëÈÎÎñÒıÇæ DEBUG Ö§³ÖÎÄ¼ş
Include("\\script\\lib\\task_debug.lua");

-- ±í¸ñÎÄ¼şÀàµÄÖ§³Ö
Include("\\script\\class\\ktabfile.lua");

-- ×Ö·û´®´¦Àí¹¦ÄÜ¿â
Include("\\script\\lib\\string.lua");

-- ¶ÁÈëÊÂ¼şÃèÊö±í¸ñÎÄ¼ş
taskEventFile = new(KTabFile, "\\settings\\task\\task_event.txt");

-- ¶ÁÈëÈÎÎñ´¥·¢Ìõ¼ş±í¸ñÎÄ¼ş
taskConditionFile = new(KTabFile, "\\settings\\task\\task_condition.txt");

-- ¶ÁÈëÈÎÎñÊµÌåÍê³ÉÌõ¼ş±í¸ñÎÄ¼ş
taskEntityFile = new(KTabFile, "\\settings\\task\\task_entity.txt");

-- ¶ÁÈë½±Àø±í¸ñÎÄ¼ş
taskAwardFile = new(KTabFile, "\\settings\\task\\task_award.txt");

-- ¶ÁÈë¶Ô»°±í¸ñÎÄ¼ş
taskTalkFile = new(KTabFile, "\\settings\\task\\task_talk.txt");

-- ¹¹ÔìÈÎÎñÊı¾İË÷Òı
taskIndex = new(TaskEngine_Index,
				taskEventFile, 
				taskConditionFile, 
				taskEntityFile, 
				taskAwardFile, 
				taskTalkFile
				);

-- ÈÎÎñÒıÇæÊµÌå´¦Àí·½·¨
CTask = {

--  /////////////////////////////////////////////
-- //			ÈÎÎñÁ÷³Ì´¦ÀíÏà¹Ø²¿·Ö		  //
--/////////////////////////////////////////////

	-- ¿ªÊ¼Ò»¸öĞÂÈÎÎñ£¬Íâ²¿µ÷ÓÃº¯Êı
	StartTask = function(self, taskName)
	
		local strTaskText = "";		
		local nRow = 0;	
		local nCheck;
		
		-- Èç¹ûÈÎÎñ»¹Ã»¿ªÊ¼£¬Ôò¼ì²âÊÇ·ñ¿ÉÒÔ¿ªÊ¼×ö
		if self:GetTaskState(taskName)==0 then
		
			nCheck = self:CheckCanStart(taskName);
			if nCheck==1 then
			
				CDebug:MessageOut(taskName.." NhiÖm vô chİnh thøc b¾t ®Çu");
				
				self:SetTaskStateStart(taskName);
				
				-- µ¯³öÈÎÎñÌáÊ¾ĞÅÏ¢
				nRow = self:GetTaskRow(taskIndex.ConditionIndex, taskName);
				strTaskText = taskConditionFile:getCell(nRow, "TaskText");
				
				if strTaskText~="" and strTaskText~=nil then
					TaskTip(self:SetTaskSayColor(strTaskText));
				end;
				
				return 1;
			else
				return nil;
			end;
			
		end;
		
	end,
	
	-- ÊÖ¶¯½áÊøÒ»¸öÈÎÎñ£¬Íâ²¿µ÷ÓÃº¯Êı
	-- Èç¹ûÓĞÈÎÎñÎïÆ·µÄ»°ÔòÉ¾³ı
	-- Èç¹ûÓĞÆäËüÁÙÊ±×´Ì¬Ò²ÔÚÕâÀïÇå³ı
	FinishTask = function(self, taskName)
		
		CDebug:MessageOut("KÕt thóc nhiÖm vô :"..taskName);
		
		-- É¾³ıÈÎÎñÎïÆ·²¿·Ö
	
		-- ÓÃÓÚ´æ·ÅÓë´ËÈÎÎñÏà¹ØµÄÊµÌåÊı¾İµÄÊı×é
		local aryTaskEntity = {};
		-- ÈÎÎñÊµÌåµÄÀàĞÍ
		local strTaskEntity = "";
		local aryGoods = {0,0,0,0};
		
		local i=0;
		
		-- ½«Ë÷ÒıÖĞÓë´ËÈÎÎñÏà¹ØµÄĞĞÊıÈ¡³öÀ´
		for i=1, getn(taskIndex.EntityIndex) do
			if taskIndex.EntityIndex[i][1]==taskName then
				tinsert(aryTaskEntity,
						getn(aryTaskEntity) + 1,
						taskIndex.EntityIndex[i][2]);
			end;
		end;	
		-- ¿ªÊ¼Ñ­»·±éÀúÈÎÎñÎïÆ·¼°ÆäËüÌõ¼ş
		for i=1, getn(aryTaskEntity) do
			strTaskEntity = taskEntityFile:getCell(aryTaskEntity[i],"TaskType");
			-- Èç¹ûÊÇÊÕ¼¯ÎïÆ·µÄÈÎÎñ
			if strTaskEntity==TaskEntity.FindGoods then
				aryGoods[1] = tonumber(taskEntityFile:getCell(aryTaskEntity[i],"Genre"));
				aryGoods[2] = tonumber(taskEntityFile:getCell(aryTaskEntity[i],"Detail"));
				aryGoods[3] = tonumber(taskEntityFile:getCell(aryTaskEntity[i],"Particular"));
				aryGoods[4] = tonumber(taskEntityFile:getCell(aryTaskEntity[i],"GoodsNum"));
				-- Èç¹û¸ÃÈÎÎñÎïÆ·ÊÇÒªÉ¾³ıµÄ»°£¬ÔòÉ¾³ı
				if tonumber(taskEntityFile:getCell(aryTaskEntity[i],"DelGoods"))==1 then
					CDebug:MessageOut(taskName.." §· xãa 1 vËt phÈm trong nhiÖm vô");
					DelItem(aryGoods[1],aryGoods[2],aryGoods[3],aryGoods[4]);
				end;
			end;
			
		end;
		-- Ñ­»·½áÊø£¬½«ÈÎÎñÉèÖÃÎª½áÊø
		self:SetTaskStateEnd(taskName);
		
	end,
	
	
	-- ÅĞ¶ÏÒ»¸öÈÎÎñÊÇ·ñÍê³É£¬Íâ²¿µ÷ÓÃº¯Êı£¬Èç¹û³É¹¦Ôò·µ»Ø 1£¬·ñÔò·µ»Ø 0
	CheckTask = function(self, taskName)
	
		CDebug:MessageOut("B¾t ®Çu ph¸n ®o¸n cã hoµn thµnh nhiÖm vô hay kh«ng:"..taskName);
		
		-- ÓÃÓÚ´æ·ÅÓë´ËÈÎÎñÏà¹ØµÄÊµÌåÊı¾İµÄÊı×é
		local aryTaskEntity = {};
		
		local nCheck = 0; -- Í³¼ÆÈÎÎñ´ï³ÉÌõ¼ş´ÎÊıµÄÁÙÊ±±äÁ¿
		
		local strTaskEntity = "";
		local aryGoods = {0,0,0,0};
		local nMoney = 0;
		
		local i=0;
		
		-- Èç¹ûÈÎÎñ²»ÊÇÕıÔÚ½øĞĞÖĞÊ±£¬Ö±½Ó·µ»Ø·ñ
		if self:GetTaskState(taskName)~=1 then
			CDebug:MessageOut(taskName.." NhiÖm vô ch­a thùc hiÖn");
			return 0;
		end;		
		
		-- ½«Ë÷ÒıÖĞÓë´ËÈÎÎñÏà¹ØµÄĞĞÊıÈ¡³öÀ´
		for i=1, getn(taskIndex.EntityIndex) do
			if taskIndex.EntityIndex[i][1]==taskName then
				tinsert(aryTaskEntity,
						getn(aryTaskEntity) + 1,
						taskIndex.EntityIndex[i][2]);
			end;
		end;
		
		-- Èç¹ûÒ»¸öÌõ¼şÒ²Ã»ÓĞÔò·µ»Ø¿ÉÒÔÍê³É
		if getn(aryTaskEntity)==0 then
			CDebug:MessageOut(taskName.." NhiÖm vô cã thÓ hoµn thµnh");
			return 1;
		end;
		
		-- ¿ªÊ¼Ñ­»·±éÀúÈÎÎñÌõ¼şÊÇ·ñ¶¼ÒÑ¾­Íê³É
		for i=1, getn(aryTaskEntity) do
			strTaskEntity = taskEntityFile:getCell(aryTaskEntity[i],"TaskType");
			
			-- Èç¹ûÊÇÊÕ¼¯ÎïÆ·µÄÈÎÎñ
			if strTaskEntity==TaskEntity.FindGoods then
				aryGoods[1] = tonumber(taskEntityFile:getCell(aryTaskEntity[i],"Genre"));
				aryGoods[2] = tonumber(taskEntityFile:getCell(aryTaskEntity[i],"Detail"));
				aryGoods[3] = tonumber(taskEntityFile:getCell(aryTaskEntity[i],"Particular"));
				aryGoods[4] = tonumber(taskEntityFile:getCell(aryTaskEntity[i],"GoodsNum"));
				
				if GetItemCount(aryGoods[1],aryGoods[2],aryGoods[3]) >= aryGoods[4] then
					nCheck = nCheck + 1;
				end;
				
			end;
			
			-- Èç¹ûÊÇÖ§¸¶½ğÇ®µÄÈÎÎñ
			if strTaskEntity==TaskEntity.PayMoney then
				nMoney = tonumber(taskEntityFile:getCell(aryTaskEntity[i],"PayMoney"));
				if Pay(nMoney)==1 then
					nCheck = nCheck + 1;
				end;
			end;
			
		end;
		
		if nCheck == getn(aryTaskEntity) then
			CDebug:MessageOut(taskName.." §¹t ®­îc toµn bé "..nCheck.."  ®iÒu kiÖn nhiÖm vô toµn bé ®¹t ®Õn.");
			return 1;
		else
			return 0;
		end;
	
	end,
	
	
	-- ¸øÍæ¼Ò·¢Óè½±Àø
	PayAward = function(self, taskName)
		
		CDebug:MessageOut("B¾t ®Çu ph¸t tÆng cho ng­êi ch¬i "..taskName.." phÇn th­ëng nhiÖm vô");
		
		-- ½±ÀøµÄÊı×é£¬¸ñÊ½Îª {½±ÀøÀàĞÍ£¬ĞĞÊı}
		local aryTaskAward = {};
		local strAward = "";
		
		local aryGoods = {0,0,0,0};
		local nMoney = 0;
		local nExp = 0;
		local nRepute = 0;
		local strTask = "";
		
		local i=0;
		
		-- ½«Óë´ËÈÎÎñÏà¹ØµÄ½±ÀøÈ¡³öÀ´
		for i=1, getn(taskIndex.AwardIndex) do
			--strAward = taskAwardFile:getCell();
			if taskIndex.AwardIndex[i][1]==taskName then
				tinsert(aryTaskAward,
						getn(aryTaskAward) + 1,
						{taskIndex.AwardIndex[i][1], taskIndex.AwardIndex[i][2]});			
			end;
		end;
				
		-- ¿ªÊ¼Ñ­»·±éÀú·¢½±
		for i=1, getn(aryTaskAward) do
		
			strAward = taskAwardFile:getCell(aryTaskAward[i][2], "AwardType");
			
			-- Èç¹û½±ÀøµÄÀàĞÍÊÇÎïÆ·
			if strAward==TaskAward.AwardGoods then
				aryGoods[1] = tonumber(taskAwardFile:getCell(aryTaskAward[i][2],"Genre"));
				aryGoods[2] = tonumber(taskAwardFile:getCell(aryTaskAward[i][2],"Detail"));
				aryGoods[3] = tonumber(taskAwardFile:getCell(aryTaskAward[i][2],"Particular"));
				aryGoods[4] = tonumber(taskAwardFile:getCell(aryTaskAward[i][2],"GoodsNum"));
				AddItem(aryGoods[1],aryGoods[2],aryGoods[3],aryGoods[4]);
				CDebug:MessageOut("Ph¸t tÆng "..taskName.." PhÇn th­ëng vËt phÈm");
			end;
			
			-- Èç¹û½±ÀøµÄÀàĞÍÊÇ½ğÇ®
			if strAward==TaskAward.AwardMoney then
				nMoney = tonumber(taskAwardFile:getCell(aryTaskAward[i][2],"MoneyNum"));
				Earn(nMoney);
				CDebug:MessageOut("Ph¸t tÆng "..taskName.." PhÇn th­ëng ng©n l­îng:"..nMoney);
			end;

			-- Èç¹û½±ÀøµÄÀàĞÍÊÇ¾­Ñé
			if strAward==TaskAward.AwardExp then
				nExp = tonumber(taskAwardFile:getCell(aryTaskAward[i][2],"ExpNum"));
				ModifyExp(nExp);
				CDebug:MessageOut("Ph¸t tÆng "..taskName.." PhÇn th­ëng kinh nghiÖm:"..nExp);
			end;

			-- Èç¹û½±ÀøµÄÀàĞÍÊÇÉùÍû
			if strAward==TaskAward.AwardRepute then
				nRepute = tonumber(taskAwardFile:getCell(aryTaskAward[i][2],"ReputeNum"));
				ModifyReputation(nRepute, 0); -- ÎŞÏŞÖÆÀàĞÍÔö¼ÓÉùÍû
				CDebug:MessageOut("Ph¸t tÆng "..taskName.." PhÇn th­ëng danh väng:"..nRepute);
			end;
			
			-- Èç¹û½±ÀøÊÇ¿ªÊ¼Ò»¸öĞÂÈÎÎñ
			if strAward==TaskAward.AwardStartTask then
				strTask = taskAwardFile:getCell(aryTaskAward[i][2],"TaskString");
				
				if strTask~="" and strTask~=nil then
					self:StartTask(strTask);
					CDebug:MessageOut("Ph¸t tÆng "..taskName.." PhÇn th­ëng nhiÖm vô míi:"..strTask);
				end;
			end;

		end;
		
	end,
	
	
	-- ¼ì²âÒ»¸öÈÎÎñÊÇ·ñ¿ÉÒÔ¿ªÊ¼Æô¶¯
	-- ·µ»Ø 1 ÔòÎª¿ÉÒÔÆô¶¯£¬·µ»Ø 0 ÔòÎª²»ÄÜÆô¶¯
	CheckCanStart = function(self, taskName)

		CDebug:MessageOut("Ph¸n ®o¸n nhiÖm vô cã thÓ b¾t ®Çu hay kh«ng:"..taskName);
	
		-- »ñÈ¡Õâ¸öÈÎÎñËùÔÚ´¥·¢Ìõ¼ş±í¸ñµÄĞĞÊı
		local nRow = self:GetTaskRow(taskIndex.ConditionIndex, taskName);
		
		-- ÈÎÎñ¿ªÊ¼Ìõ¼şÊı×é
		local taskCondition = {};
		
		-- ÈÎÎñÍê³ÉÌõ¼şµÄÀÛ¼Ó£¬Èç¹û´ï³ÉÔò + 1
		local nCheck = 0;
		
		-- ÓÃÓÚ¶ÁÈ¡ÈÎÎñÅĞ¶ÏÄÚÈİµÄÁÙÊ±±äÁ¿
		local nStartType = ""; -- ¶ÁÈ¡Ìõ¼şÃ¶¾Ù×Ö·û
		local nTask = ""; -- ĞèÒªÅĞ¶ÏµÄÈÎÎñ±êÊ¶
		local nTaskID = 0; -- ĞèÒªÅĞ¶ÏµÄÈÎÎñ ID
		local nTaskState = 0; -- ĞèÒªÅĞ¶ÏµÄÈÎÎñ×´Ì¬
		local nLevel = 0; -- ĞèÒªÅĞ¶ÏµÄÈËÎïµÈ¼¶
		local nValue = 0; -- ĞèÒªÅĞ¶ÏµÄÈÎÎñ±äÁ¿
		local nRepute = 0; -- ĞèÒªÅĞ¶ÏÉùÍûµÄ±äÁ¿
		local strGoods = ""; -- ĞèÒªÅĞ¶ÏÊÇ·ñ³ÖÓĞÎïÆ·µÄ×Ö·û´®
		local nGoodsID = nil; -- ĞèÒªÅĞ¶ÏÊÇ·ñ³ÖÓĞÎïÆ·µÄÊı×é
		
		local i=0;
		
		-- Èç¹ûÈÎÎñÒÑ¾­¿ªÊ¼»òÕßÒÑ¾­Íê³ÉÁË£¬Ö±½Ó·µ»Ø·ñ
		if self:GetTaskState(taskName)~=0 then
			return 0;
		end;
		
		for i=1,5 do
		
			nStartType = taskConditionFile:getCell(nRow, "StartType"..i);
			
			-- ½«ÈÎÎñµÄ´¥·¢Ìõ¼ş¶ÁÈë taskCondition Êı×é
			if nStartType~="n" and nStartType~=nil and nStartType~="" then
				tinsert(taskCondition,
						getn(taskCondition) + 1,
						nStartType);
			end;
			
		end;
		
		for i=1, getn(taskCondition) do
		
			-- ÈÎÎñÊÇ·ñÒÑ¾­¿ªÊ¼Ìõ¼şµÄÅĞ¶Ï
			if taskCondition[i] == TaskCondition.TaskStart then
				nTask = taskConditionFile:getCell(nRow, "StartDes"..i);
				nTaskID = tonumber(self:GetTaskID(nTask));
				nTaskState = CTaskValue:GetTaskState(nTaskID);
				
				if nTaskState==1 then
					CDebug:MessageOut(taskName.." Ph¸n ®o¸n nhiÖm vô cã thÓ b¾t ®Çu hay kh«ng: Cïng b¾t ®Çu th«ng qua");					
					nCheck = nCheck + 1;
				end;
				
			end;
			
			-- ÈÎÎñÊÇ·ñÕıÒÑ¾­½áÊøµÄÌõ¼şµÄÅĞ¶Ï
			if taskCondition[i] == TaskCondition.TaskEnd then
				nTask = taskConditionFile:getCell(nRow, "StartDes"..i);
				nTaskID = tonumber(self:GetTaskID(nTask));
				nTaskState = CTaskValue:GetTaskState(nTaskID);
				
				if nTaskState==2 then
					CDebug:MessageOut(taskName.." Ph¸n ®o¸n nhiÖm vô cã thÓ b¾t ®Çu hay kh«ng: Cïng kÕt thóc th«ng qua");	
					nCheck = nCheck + 1;
				end;
				
			end;
			
			-- µÈ¼¶ÊÇ·ñ´óÓÚµÄÌõ¼şÅĞ¶Ï
			if taskCondition[i] == TaskCondition.LevelMore then
				nLevel = tonumber(taskConditionFile:getCell(nRow, "StartDes"..i));
				if GetLevel()>=nLevel then
					CDebug:MessageOut(taskName.." Ph¸n ®o¸n nhiÖm vô cã thÓ b¾t ®Çu hay kh«ng: §¼ng cÊp lín th«ng qua");	
					nCheck = nCheck + 1;
				end;
			end;
			
			-- µÈ¼¶ÊÇ·ñĞ¡ÓÚµÄÌõ¼şÅĞ¶Ï
			if taskCondition[i] == TaskCondition.LevelLess then
				nLevel = tonumber(taskConditionFile:getCell(nRow, "StartDes"..i));
				if GetLevel()<=nLevel then
					CDebug:MessageOut(taskName.." Ph¸n ®o¸n nhiÖm vô cã thÓ b¾t ®Çu hay kh«ng: §¼ng cÊp nhá th«ng qua");	
					nCheck = nCheck + 1;
				end;
			end;

			-- µÈ¼¶ÊÇ·ñµÈÓÚµÄÌõ¼şÅĞ¶Ï
			if taskCondition[i] == TaskCondition.LevelEqual then
				nLevel = tonumber(taskConditionFile:getCell(nRow, "StartDes"..i));
				if GetLevel()==nLevel then
					CDebug:MessageOut(taskName.." Ph¸n ®o¸n nhiÖm vô cã thÓ b¾t ®Çu hay kh«ng: §¼ng cÊp b»ng th«ng qua");	
					nCheck = nCheck + 1;
				end;
			end;

			-- ÉùÍûÊÇ·ñ´óÓÚµÄÌõ¼şÅĞ¶Ï
			if taskCondition[i] == TaskCondition.ReputeMore then
				nRepute = tonumber(taskConditionFile:getCell(nRow, "StartDes"..i));
				if GetReputation()>=nRepute then
					CDebug:MessageOut(taskName.." Ph¸n ®o¸n nhiÖm vô cã thÓ b¾t ®Çu hay kh«ng: Danh väng lín th«ng qua");	
					nCheck = nCheck + 1;
				end;
			end;
			
			-- ÊÇ·ñ³ÖÓĞÄ³¸öÎïÆ·µÄÌõ¼şÅĞ¶Ï
			if taskCondition[i] == TaskCondition.HaveItem then
				strGoods = taskConditionFile:getCell(nRow, "StartDes"..i);
				nGoodsID = split(strGoods, "|");
				
				-- ±ØĞë±£Ö¤ÎïÆ·´úÂëµÄ4Î»ÕıÈ·ĞÔ²ÅÄÜ×öÏÂÒ»²½ÅĞ¶Ï
				if getn(nGoodsID)==4 then
					if GetItemCount( tonumber(nGoodsID[1]), tonumber(nGoodsID[2]), tonumber(nGoodsID[3]) ) >= tonumber(nGoodsID[4]) then
						CDebug:MessageOut(taskName.." Ph¸n ®o¸n nhiÖm vô cã thÓ b¾t ®Çu hay kh«ng: Gi÷ vËt phÈm th«ng qua");							
						nCheck = nCheck + 1;
					end;
				end;
			end;
			
		end;
		
		if nCheck==getn(taskCondition) then
			CDebug:MessageOut(taskName.." §¹t ®­îc toµn bé "..getn(taskCondition).."  ®iÒu kiÖn nhiÖm vô toµn bé ®¹t ®Õn ");	
			return 1;
		else
			return 0;
		end;
		
	end,
	
	-- Ö´ĞĞÒ»¸ö¿ªÊ¼ÈÎÎñËùÓĞµÄÁ÷³Ì
	DoTask = function(self, taskName)
		
		-- Èç¹ûÈÎÎñÒÑ¾­Íê³ÉÔòÖ±½Ó·µ»Ø¿ÕÖµ
		if self:IsTaskFinish(taskName) then return nil; end;
		
		-- Èç¹ûÈÎÎñ»¹Ã»ÓĞ¿ªÊ¼£¬Ôò¿ªÊ¼ÈÎÎñ
		if not self:IsTaskStart(taskName) then
			-- ÏÈÅĞ¶ÏÊÇ·ñÄÜ¿ªÊ¼
			if self:CheckCanStart(taskName)==1 then
			
				-- ÅĞ¶ÏÊÇ·ñĞèÒªÑ¯ÎÊ²ÅÄÜ¿ªÊ¼ÈÎÎñ
				if self:GetTaskIsAsk(taskName)==1 then
					CDebug:MessageOut("Dß hái ®Ó b¾t ®Çu 1 nhiÖm vô míi:"..taskName);
					self:TaskAskSay(taskName);
				else
					-- Ëµ¿ªÊ¼ÈÎÎñÊ±µÄÓï¾ä
					self:TaskSay(taskName, 0);
				end;
				return 1;
				
			end;
		end;
		
		-- Èç¹û¿ªÊ¼ÈÎÎñÁË£¬Ôò¸ø³öÖĞ¼ä×´Ì¬
		if self:IsTaskStart(taskName) then
			-- Èç¹ûÃ»ÖĞ¼ä×´Ì¬µÄ¶Ô»°Ôò·µ»Ø¿ÕÖµ
			if self:GetTaskText(taskName, 1) then
				self:TaskSay(taskName, 1);
				return 1;
			else
				return nil;
			end;
			
		end;
		
		-- Èç¹ûÒÔÉÏ¹ı³Ì¶¼²»Ö´ĞĞÔò·µ»Ø¿ÕÖµ
		return nil;
		
	end,
	
	-- ½áÊøÒ»¸öÈÎÎñµÄËùÓĞÁ÷³Ì
	EndTask = function(self, taskName)
	
		-- Èç¹ûÈÎÎñÒÑ¾­Íê³ÉÔòÖ±½Ó·µ»Ø¿ÕÖµ
		if self:IsTaskFinish(taskName) then return nil; end;
		
		-- Èç¹ûÈÎÎñ»¹Ã»ÓĞ¿ªÊ¼£¬ÔòÒ²Ö±½Ó·µ»Ø¿ÕÖµ
		if not self:IsTaskStart(taskName) then
			return nil;
		end;
		
		-- Èç¹ûÈÎÎñÒÑ¾­¿ªÊ¼ÁË£¬Ôò¼ì²éÈÎÎñÊÇ·ñÍê³É£¬Íê³ÉÔò·¢½±
		if self:IsTaskStart(taskName) then
			if self:CheckTask(taskName)==1 then
				-- Èç¹û½áÊø¶Ô»°²»Îª¿ÕÔò¶Ô»°£¬·ñÔòÖ±½Ó·¢½±
				if self:GetTaskText(taskName, 2)~="" then
					self:TaskSay(taskName, 2);
				else
					self:FinishTask(taskName);
					self:PayAward(taskName);
				end;
				return 1;
			end;
		else
			-- ·ñÔò»¹ÊÇÖ±½Ó·µ»Ø¿ÕÖµ
			return nil
		end;

		-- Èç¹ûÒÔÉÏ¹ı³Ì¶¼²»Ö´ĞĞÔò·µ»Ø¿ÕÖµ
		return nil;
				
	end,
	
	-- ÈÎÎñ¿ªÊ¼µÄ¶Ô»°»Øµ÷º¯Êı
	_FunStart = function(self, taskID)
		local taskName = self:GetTaskName(taskID);
		self:StartTask(taskName);
	end,
	
	-- ÈÎÎñ½øĞĞÖĞµÄ¶Ô»°»Øµ÷º¯Êı
	_FunNow = function(self, taskID)
		local taskName = self:GetTaskName(taskID);
		return
	end,
	
	-- ÈÎÎñ½áÊøÊ±µÄ¶Ô»°»Øµ÷º¯Êı
	_FunEnd = function(self, taskID)
		local taskName = self:GetTaskName(taskID);
		self:FinishTask(taskName);
		self:PayAward(taskName);
	end,
	
	-- ÈÎÎñÑ¯ÎÊÃæ°æÈ·ÈÏ½ÓÊÜÈÎÎñµÄ»Øµ÷º¯Êı
	_FunAskStart = function(self, taskID)
		local taskName = self:GetTaskName(taskID);
		self:StartTask(taskName);
	end,
	
	-- ÈÎÎñÑ¯ÎÊÃæ°æÈ¡ÏûÈÎÎñµÄ»Øµ÷º¯Êı
	_FunAskCancel = function(self, taskID)
		return
	end,
	
	-- Ö´ĞĞÈÎÎñµÄ¶Ô»°£¬´«Èë²ÎÊıÎªÈÎÎñµÄ×´Ì¬£º
	-- 0Îª»¹Î´¿ªÊ¼ÈÎÎñ£¬½ÓÈÎÎñÊ±µÄ¶Ô»°
	-- 1ÎªÒÑ¾­½ÓÁËÈÎÎñµÄ¶Ô»°
	-- 2ÎªÍê³ÉÈÎÎñÊ±µÄ¶Ô»°
	TaskSay = function(self, taskName, taskState)
		local strTalk = self:GetTaskText(taskName, taskState);
		
		local nTaskID = self:GetTaskID(taskName);
		
		local strFunBack = {
			[0]="#CTask:_FunStart("..nTaskID..")",
			[1]="#CTask:_FunNow("..nTaskID..")",
			[2]="#CTask:_FunEnd("..nTaskID..")",
		}
		
		-- Èç¹û×Ö·û´®ÊÇ¿ÕµÄÔòÖ±½Ó·µ»Ø
		if strTalk=="" or strTalk==nil then return ""; end;
		
		-- ¿ªÊ¼¶Ô»°£¬²¢ÉèÖÃºÃ·µ»Øº¯Êı
		self:TaskTalk(strFunBack[taskState], strTalk);
		
	end,
	
	
	-- »ñÈ¡Ò»¸öÈÎÎñÖ¸¶¨µÄ¶Ô»°¶Î£¬Ö±½Ó·µ»Ø×Ö·û´®
	GetTaskText = function(self, taskName, taskState)
		local strTask = ""
		local nRow = 0;
		local i=0;
		
		local strTitle = {
			[0]="TaskStartTalk",
			[1]="TaskNowTalk",
			[2]="TaskEndTalk",
		}
			for i=1, getn(taskIndex.TalkIndex) do
				if taskIndex.TalkIndex[i][1]==taskName then
					nRow = taskIndex.TalkIndex[i][2];
				end;
			end;

			if nRow~=0 then
				strTask = taskTalkFile:getCell(nRow, strTitle[taskState]);
				if strTask~="" then
					return strTask;
				else
					return nil;
				end;
			end;

	end,
	
	
	-- »ñÈ¡Ò»¸öÈÎÎñËùÔÚ´¥·¢Ìõ¼ş±í¸ñµÄĞĞÊı
	GetTaskRow = function(self, nIndex, strName)
		local i = 0;
		for i=1, getn(nIndex) do
			if nIndex[i][1]==strName then
				return nIndex[i][3];
			end;
		end;
		-- Ê²Ã´Ò²ÕÒ²»µ½·µ»Ø 0
		return 0;
	end,
	
	
	-- »ñÈ¡Ò»¸öÈÎÎñËù¶ÔÓ¦µÄ±äÁ¿ ID
	GetTaskID = function(self, strName)
		local i = 0;
		for i=1, getn(taskIndex.ConditionIndex) do
			if taskIndex.ConditionIndex[i][1]==strName then
				return taskIndex.ConditionIndex[i][2];
			end;
		end;
		-- Ê²Ã´Ò²ÕÒ²»µ½·µ»Ø 0
		return 0;		
	end,
	
	
	-- ÒÑÖªÒ»¸öÈÎÎñID»ñÈ¡Ïà¶ÔÓ¦µÄÃû×Ö
	GetTaskName = function(self, taskID)
	
		local strName = "";
		local i=0;
		
		for i=1, getn(taskIndex.ConditionIndex) do
			if taskIndex.ConditionIndex[i][2]==taskID then
				return taskIndex.ConditionIndex[i][1];
			end;
		end;
		-- Ê²Ã´Ò²ÕÒ²»µ½·µ»Ø 0
		return strName;
		
	end,
	
	-- »ñÈ¡Ò»¸öÈÎÎñÊÇ·ñĞèÒªÑ¯ÎÊ²ÅÄÜ¿ªÊ¼
	GetTaskIsAsk = function(self, taskName)
	
		local nRow = 0;
		local nAsk = 0;
		local i=0;

		for i=1,getn(taskIndex.ConditionIndex) do
			if taskIndex.ConditionIndex[i][1]==taskName then
				nRow = taskIndex.ConditionIndex[i][3];
				break;
			end;
		end;
		
		nAsk = taskConditionFile:getCell(nRow, "IsAsk");
		
		if nAsk~="" then
			return 1;
		else
			return nil;
		end;
		
	end,
	
	-- ¶ÁÈ¡ÈÎÎñ¶Ô»°ÎÄ±¾Õ¹¿ªÒ»¶Î¶Ô»°
	TaskTalk = function(self, funBack, strTask)
		
		local aryTaskText;
		local i=0;
		
		if strTask~=nil and strTask~="n" and strTask~="" then
			aryTaskText = split(strTask, "|");
		end;
		
		-- Èç¹û·µ»ØµÄÊı×éÎª1¸ö³ÉÔ±ÔòÖ±½ÓÓÃ SAY£¬·ñÔòÓÃ TALK ½øĞĞ¶à·Ö¶Î
		if getn(aryTaskText)==1 then
			aryTaskText[1] = self:SetTaskSayColor(aryTaskText[1]);
			Say(aryTaskText[1],1,"KÕt thóc ®èi tho¹i/"..funBack);
		else
			for i=1, getn(aryTaskText) do
				aryTaskText[i] = self:SetTaskSayColor(aryTaskText[i]);
			end;
			self:TalkEx(funBack, aryTaskText);
		end;
		
	end,
	
	-- ÈÎÎñ¿ªÊ¼Ê±Ñ¯ÎÊÊÇ·ñ×öÈÎÎñµÄ¶Ô»°
	TaskAskSay = function(self, taskName)
		local strTalk = self:GetTaskText(taskName, 0);
		local nTaskID = self:GetTaskID(taskName);
		Say(
				self:SetTaskSayColor(strTalk),
				2,
				TaskDialogText.TaskConfirm.."/#CTask:_FunAskStart("..nTaskID..")",
				TaskDialogText.TaskCancel.."/#CTask:_FunAskCancel("..nTaskID..")"
			);
	end,
	
	
	-- ½«Ò»¸öÈÎÎñÉèÖÃÎª¿ªÊ¼
	SetTaskStateStart = function(self, strName)
		local nTaskID = self:GetTaskID(strName)
		CTaskValue:AssignTask(nTaskID);
	end,
	
	-- ½«Ò»¸öÈÎÎñÉèÖÃÎª½áÊø
	SetTaskStateEnd = function(self, strName)
		local nTaskID = self:GetTaskID(strName)
		CTaskValue:CompleteTask(nTaskID);	
	end,
	
	-- ½«Ò»¸öÈÎÎñÉèÖÃÎª»¹Ã»¿ªÊ¼
	SetTaskStateClean = function(self, strName)
		local nTaskID = self:GetTaskID(strName)
		CTaskValue:ClearTask(nTaskID);	
	end,
	
	-- »ñÈ¡Ò»¸öÈÎÎñµÄ½øÕ¹×´Ì¬
	GetTaskState = function(self, strName)
		local nTaskID = self:GetTaskID(strName)
		return CTaskValue:GetTaskState(nTaskID);
	end,
	
	-- Íâ²¿µ÷ÓÃº¯Êı£¬ÅĞ¶ÏÒ»¸öÈÎÎñÊÇ·ñÍê³É
	IsTaskFinish = function(self, strName)
		if self:GetTaskState(strName)==2 then
			return 1;
		else
			return nil;
		end;
	end,
	
	-- Íâ²¿µ÷ÓÃº¯Êı£¬ÅĞ¶ÏÒ»¸öÈÎÎñÊÇ·ñÒÑ¾­¿ªÊ¼
	IsTaskStart = function(self, strName)
		if self:GetTaskState(strName)==1 then
			return 1;
		else
			return nil;
		end;
	end,
	
	-- »ñÈ¡Ò»¸öÈÎÎñµÄÃèÊö
	GetTaskTipText = function(self, taskName)
		local nRow = self:GetTaskRow(taskIndex.ConditionIndex, taskName);
		local strTaskText = taskConditionFile:getCell(nRow, "TaskText");	
		return strTaskText;
	end,
	
	-- Íâ²¿µ÷ÓÃº¯Êı£¬¶ÔËùÓĞµÄ¶ÓÓÑ×öÍ¬Ò»¼şÊÂÇé
	-- ´«Èë²ÎÊıÎª¹ı³ÌÃû "Function Name"
	-- nMode£ºÖ´ĞĞÄ£Ê½£¬1 ÊÇ·¢³öÕßÁ¬Í¬¶ÓÓÑÒ»ÆğÖ´ĞĞ£¬2 ÊÇÖ»Ö´ĞĞ¶ÓÓÑ
	DoWithTeammate = function(self, funName, nMode)
		local nPreservedPlayerIndex = PlayerIndex;
		local nMemCount = GetTeamSize();
		local i=0;
		
			if (nMemCount == 0) then -- Èç¹ûÍæ¼Òµ½ÕâÒ»²½Î´×é¶Ó£¬ÔòÖ´ĞĞÁË¹ı³ÌÖ®ºó·µ»Ø
				funName();
				return
			else
				if nMode==1 then
					for i=1,nMemCount do
						PlayerIndex = GetTeamMember(i);
						funName(); -- Ö´ĞĞ´«ÈëµÄÕâ¸ö¹ı³Ì
					end;
				end;
				if nMode==2 then
					for i=1,nMemCount do
						PlayerIndex = GetTeamMember(i);
						if PlayerIndex~=nPreservedPlayerIndex then
							funName(); -- Ö´ĞĞ´«ÈëµÄÕâ¸ö¹ı³Ì
						end;
					end;
				end;				
				PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
			end;
	end,
	
	-- ×Ô¶¯¸ü»»ÈÎÎñ¶Ô»°ÖĞµÄÈËÃûÒÔ¼°ÖØµã±êÊ¶µÄÎÄ×ÖÑÕÉ«
	SetTaskSayColor = function(self, str)
		local strKey = ":";
		local strKeyLeft = "{";
		local strKeyRight = "}";
		local strPoint = strfind(str,strKey,1)
		local strName = "";
		local strColorText = str;
		
		if strPoint~=nil and strPoint>=1 then 
			strName = strsub(str, 1, strPoint-1);
			-- ´¦ÀíÈËÎïÃû³ÆÑÕÉ«
			strColorText = "<color=green>"..strName.."<color>"..strsub(str, strPoint, strlen(str));
		end;
				
		-- ´¦ÀíÖØµã±êÊ¶ÑÕÉ«
		strColorText = join(split(strColorText,strKeyLeft), "<color=yellow>");
		strColorText = join(split(strColorText,strKeyRight), "<color>");
		
		str = strColorText;
		return str;
		
	end,

--  /////////////////////////////////////////////
-- //			ÊÂ¼ş¹¦ÄÜ´¦ÀíÏà¹Ø²¿·Ö		  //
--/////////////////////////////////////////////

	-- ¼ì²éÒ»¸öÊÂ¼şµÄ×´Ì¬
	-- 0 Îª´ÓÀ´Ã»ÓĞ¿ªÊ¼
	-- 1 ÎªÕıÔÚ½øĞĞÖĞ
	-- 2 ÎªÒÑ¾­È«²¿Íê³É
	CheckEvent = function(self, aryEvent)
		
		local nNever, nNow, nEnd = 0,0,0;
		local i=0;
		
		for i=1, getn(aryEvent) do
			if aryEvent[i][2]==0 then
				nNever = nNever + 1;
			end;
			
			if aryEvent[i][2]==1 then
				nNow = nNow + 1;
			end;
			
			if aryEvent[i][2]==2 then
				nEnd = nEnd + 1;
			end;		
		end;
		
		if nNever==getn(aryEvent) then
			return 0;
		end;
		
		if nNow>=1 then
			return 1;
		end;
		
		if nEnd==getn(aryEvent) then
			return 2;
		end;
		
		return 0;

	end,

	-- Ã¶¾ÙÄ¿Ç°ÕıÔÚ¾­ÀúµÄËùÓĞÊÂ¼ş£¬²¢·µ»ØÊÂ¼şµÄ×´Ì¬
	-- ¸ñÊ½Îª£º{ÊÂ¼şID£¬ÊÂ¼ş×´Ì¬}
	EnumTotalEvent = function(self)
		local aryEventState = {};
		local eventID = 0;
		local i=0;
		
		for i=1, getn(taskIndex.EventIndex) do
			eventID = taskIndex.EventIndex[i][1];
			rawset(aryEventState,
					getn(aryEventState)+1,
					{eventID, self:CheckEvent(self:EnumEventTask(eventID))}
				   );
		end;
		
		return aryEventState;
	end,
	
	-- Ã¶¾ÙÒ»¸öÊÂ¼şËù°üº¬µÄÈÎÎñ£¬²¢·µ»Ø¸÷¸öÈÎÎñµÄ×´Ì¬
	-- ¸ñÊ½Îª£º{ÈÎÎñÃû³Æ£¬ÈÎÎñ×´Ì¬}
	EnumEventTask = function(self, eventID)
		
		local taskName = "";
		local aryContainTask = {};
		local i=0;
		
		for i=1, getn(taskIndex.ConditionIndex) do
			taskName = taskIndex.ConditionIndex[i][1];
			if taskIndex.ConditionIndex[i][4]==eventID then
				rawset(aryContainTask, 
						getn(aryContainTask)+1,
						{taskName, self:GetTaskState(taskName)}
					   );
			end;
		end;
		
		if getn(aryContainTask)>0 then
			return aryContainTask;
		else
			return nil;
		end;
		
	end,
	
	-- »ñÈ¡Ò»¸öÊÂ¼şÊÇ·ñÓĞ¹²ÏíÊôĞÔ
	IsEventShare = function(self, eventID)
		local nShare = 0;
		local i=0;
		
		for i=1, getn(taskIndex.EventIndex) do
			if taskIndex.EventIndex[i][1]==eventID then
				nShare = taskIndex.EventIndex[i][3];
			end;
		end;
		
		if nShare==1 then
			return 1;
		else
			return nil;
		end;
	end,
	
	-- È·¶¨Ò»¸öÊÂ¼şÊÇ·ñ¿ÉÒÔ¹²Ïí£¬nType 1ÎªËŞÖ÷·¢³öÅĞ¶Ï£¬2Îª½ÓÊÕÕßÅĞ¶Ï
	CanEventShare = function(self, eventID, nType)
		local aryTask = self:EnumEventTask(eventID);
		local nState = 0;
		local i=0;
		
		if nType==1 then
			-- Èç¹û´ËÊÂ¼ş¿ÉÒÔ¹²Ïí²Å¿ªÊ¼ÅĞ¶Ï
			if self:IsEventShare(eventID) then
				return 1;
			else
				return nil;
			end;
		end;
		
		if nType==2 then
			if self:CheckEvent(aryTask)==0 then
				return 1;
			else
				return nil;
			end;
		end;
		
	end,
	
	-- »ñÈ¡Ò»¸öÊÂ¼şµÄÃèÊö
	GetEventText = function(self, eventID)
		local i=0;
		
		for i=1, getn(taskIndex.EventIndex) do
			if taskIndex.EventIndex[i][1]==eventID then
				return taskIndex.EventIndex[i][2];
			end;
		end;
		
		return "";
	end,


--  /////////////////////////////////////////////
-- //			ÈÎÎñ¹¦ÄÜÀ©Õ¹Ïà¹Ø²¿·Ö		  //
--/////////////////////////////////////////////

	-- ¶Ô Talk ¹¦ÄÜµÄÀ©Õ¹
	TalkEx = function(self, fun, szMsg)
	
		local num = getn(szMsg);
		local szmsg = "";
		
		if fun==nil then fun = ""; end;
		
		for i=1,num-1 do
			szmsg = szmsg..format("%q",szMsg[i])..",";
		end;
		
		szmsg = szmsg .. format("%q",szMsg[num]);
		szmsg = "Talk("..num..","..format("%q",fun)..","..szmsg..")";
		dostring(szmsg);
		
	end,
	
	-- ¶Ô Say ¹¦ÄÜµÄÀ©Õ¹
	SayEx = function(self, strSay)
	
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
				strMsg = "Say("..format("%q", strSay[1])..","..(strNum - 1)..","..strSel..");";
			elseif strNum == 2 then
				strSel = format("%q", strSay[strNum]);
				strMsg = "Say("..format("%q", strSay[1])..",1"..","..strSel..");";
			end;
			
			dostring(strMsg);
		
	end,
	
	-- Ö±½Ó»ñÈ¡ĞÔ±ğµÄ×Ö·û
	GetSexName = function(self)
	
		local mySex -- ÓÃÒÔÏÔÊ¾ÈËÎïĞÔ±ğµÄ×Ö·û
	
		if (GetSex() == 1) then
			mySex = "C«ng tö";
		elseif (GetSex() == 2) then
			mySex = "N÷ hiÖp ";
		end;
		
		return mySex;
		
	end,
	
}
