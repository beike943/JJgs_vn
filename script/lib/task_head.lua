
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ÈÎÎñÏµÍ³Í·ÎÄ¼ş
-- Edited by peres
-- 2005/05/07 PM 19:55

-- ÑÌ»¨¡£ÄÇÒ»Ò¹µÄÑÌ»¨¡£
-- Ëı¼ÇµÃËûÔÚ´óÓêµÄÈËÈºÖĞ£¬Õ¾ÔÚËıµÄ±³ºóÓµ±§×¡Ëı¡£
-- ËûÎÂÅ¯µÄÆ¤·ô£¬ËûÊìÏ¤µÄÎ¶µÀ¡£ÑÌ»¨ÕÕÁÁËıµÄÑÛ¾¦¡£
-- Ò»ÇĞÎŞ¿ÉÍì»Ø¡­¡­

-- ======================================================


-- ¶¨Òå¸÷ÖÖÈÎÎñ´¥·¢µÄÏûÏ¢Ã¶¾Ù
TaskCondition = {

	TaskStart = "B¾t ®Çu nhiÖm vô",
	
	TaskEnd = "KÕt thóc nhiÖm vô",
	
	LevelMore = "§¼ng cÊp lín",
	
	LevelLess = "§¼ng cÊp nhá",
	
	LevelEqual = "§¼ng cÊp = ",
	
	ValueMore = "BiÕn l­îng lín",
	
	ValueLess = "BiÕn l­îng nhá",
	
	ValueEqual = "BiÕn l­îng b»ng",
	
	ReputeMore = "Danh väng lín",
	
	HaveItem = "§Æc phÈm",
	
}

-- ¶¨Òå¸÷ÖÖÈÎÎñ·½·¨µÄÃ¶¾Ù
TaskEntity = {

	FindGoods = "T×m vËt phÈm",
	
	KillNpc = "§¸nh b¹i ai ®ã",
	
	PayMoney = "l­îng tiÒn tiªu hao",
	
	ChangeValue = "Thay ®æi biÕn l­îng",

}

-- ¶¨Òå¸÷ÖÖ½±ÀøÀàĞÍµÄÃ¶¾Ù
TaskAward = {

	AwardGoods = "VËt phÈm",
	
	AwardMoney = "Ng©n l­îng",
	
	AwardExp = "Kinh nghiÖm",
	
	AwardRepute = "Danh väng",
	
	AwardStartTask = "B¾t ®Çu nhiÖm vô",

}

-- ¶¨ÒåÈÎÎñ±ê×¼°´¼üµÄÎÄ×Ö
TaskDialogText = {

	TaskConfirm = "TiÕp nhËn nhiÖm vô",
	
	TaskCancel = "Hñy bá nhiÖm vô",
	
}


-- ÓÃÓÚ¹¹ÔìÈÎÎñ¸÷ÖÖÊıÖµË÷ÒıµÄÀà
TaskEngine_Index = {

	-- ¶ÔÍâÊı¾İ£¬ÊÂ¼şÁĞ±í£¬´¥·¢Ìõ¼ş£¬ÈÎÎñÊµÌå£¬½±ÀøÁĞ±í£¬ÈÎÎñ¶Ô»°µÄË÷Òı
	EventIndex = nil,
	ConditionIndex = nil,
	EntityIndex = nil,
	AwardIndex = nil,
	TalkIndex = nil,

	-- ¹¹Ôìº¯Êı£¬¶ÁÈë´¥·¢¡¢ÊµÌåÓë½±ÀøµÄ±í¸ñ£¬¹¹ÔìË÷Òı
	__new = function(self, arg)
		self.EventIndex = self:AssignEventIndex(arg[1]);
		self.ConditionIndex = self:AssignConditionIndex(arg[2]);
		self.EntityIndex = self:AssignEntityIndex(arg[3]);
		self.AwardIndex = self:AssignAwardIndex(arg[4]);
		self.TalkIndex = self:AssignTalkIndex(arg[5])
	end,

	-- ¹¹ÔìÈÎÎñ´¥·¢Ìõ¼şµÄË÷Òı
	-- ¾ßÌå¸ñÊ½Îª£º{ÈÎÎñÃû³Æ£¬ÈÎÎñID£¬ĞĞÊı£¬¹éÊôµÄÊÂ¼şID}
	AssignConditionIndex = function(self, tabFile)
	
		local nRow = tonumber(tabFile:getRow()); -- »ñÈ¡±í¸ñµÄ×ÜĞĞÊı
		local nEvent = 0;
		local i,j = 0,0;
		
		local nConditionData = {}; -- ×îºó·µ»ØµÄ´¥·¢Ìõ¼şË÷Òı

			for i=2, nRow do
				j = j + 1;
				
				-- ÓĞĞ©ÈÎÎñ¿ÉÄÜÃ»ÓĞÊÂ¼ş¹éÊô
				nEvent = tabFile:getCell(i,"EventID");
				if nEvent~="" then
					nEvent = tonumber(nEvent);
				else
					nEvent = 0;
				end;
				
				tinsert(nConditionData, 
						getn(nConditionData) + 1, 
							{	
								tabFile:getCell(i,"TaskName"), 
								tonumber(tabFile:getCell(i,"TaskID")), 
								i,
								nEvent
							}
						);
			end;
			
			return nConditionData;
	end,
	
	-- ¹¹ÔìÈÎÎñÊµÌåÊı¾İµÄË÷Òı
	-- ¾ßÌå¸ñÊ½Îª£º{ÈÎÎñÃû³Æ£¬ĞĞÊı}
	AssignEntityIndex = function(self, tabFile)
	
		local nRow = tonumber(tabFile:getRow()); -- »ñÈ¡±í¸ñµÄ×ÜĞĞÊı
		local i,j = 0,0;
		
		local nEntityData = {}; -- ×îºó·µ»ØµÄÊµÌåÊı¾İË÷Òı
		
			for i=2, nRow do
				j = j + 1;
				tinsert(nEntityData, 
						getn(nEntityData) + 1, 
						{tabFile:getCell(i,"TaskName"), i}
						);				
			end;
			
			return nEntityData;
	end,
	
	-- ¹¹ÔìÈÎÎñ½±ÀøÊı¾İµÄË÷Òı
	-- ¾ßÌå¸ñÊ½Îª£º{ÈÎÎñÃû³Æ£¬ĞĞÊı}
	AssignAwardIndex = function(self, tabFile)

		local nRow = tonumber(tabFile:getRow()); -- »ñÈ¡±í¸ñµÄ×ÜĞĞÊı
		local i,j = 0,0;
		
		local nAwardData = {}; -- ×îºó·µ»ØµÄ½±ÀøÊı¾İË÷Òı
		
			for i=2, nRow do
				tinsert(nAwardData, 
						getn(nAwardData) + 1, 
						{tabFile:getCell(i,"TaskName"), i}
						);				
			end;
			
			return nAwardData;	
	end,
	
	-- ¹¹ÔìÊÂ¼şËµÃ÷Ë÷Òı
	-- ¾ßÌå¸ñÊ½Îª£º{ÊÂ¼şID£¬ÊÂ¼şËµÃ÷£¬ÊÇ·ñ¿ÉÒÔ¹²Ïí£¬ĞĞÊı}
	AssignEventIndex = function(self, tabFile)
	
		local nRow = tonumber(tabFile:getRow()); -- »ñÈ¡±í¸ñµÄ×ÜĞĞÊı
		local i,j = 0,0;
		
		local nEventData = {}; -- ×îºó·µ»ØµÄ½±ÀøÊı¾İË÷Òı
		
			for i=2, nRow do
				tinsert(nEventData, 
						getn(nEventData) + 1, 
						{tonumber(tabFile:getCell(i,"EventID")),
						 tabFile:getCell(i,"EventText"),
						 tonumber(tabFile:getCell(i,"CanShare")),
						 i}
						);				
			end;
			
			return nEventData;
	end,
	
	-- ¹¹ÔìÈÎÎñ¶Ô»°Êı¾İµÄË÷Òı
	-- ¾ßÌå¸ñÊ½Îª£º{ÈÎÎñÃû³Æ£¬ĞĞÊı}
	AssignTalkIndex = function(self, tabFile)

		local nRow = tonumber(tabFile:getRow()); -- »ñÈ¡±í¸ñµÄ×ÜĞĞÊı
		local i,j = 0,0;
		
		local nTalkData = {}; -- ×îºó·µ»ØµÄ½±ÀøÊı¾İË÷Òı
		
			for i=2, nRow do
				tinsert(nTalkData, 
						getn(nTalkData) + 1, 
						{tabFile:getCell(i,"TaskName"), i}
						);				
			end;
			
			return nTalkData;	
	end,

}