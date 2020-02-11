-- =====================================================
-- File : Ò©Æ·npc¶Ô»°½Å±¾
-- Desc : ºÍnpc¶Ô»°£¬È¡µÃÒ©Æ·
-- Creator : Tony(Jizheng)
-- =====================================================

Include("\\script\\yaopin_npc_head.lua")

nTotalItemCount = 2					-- ×Ü¹²ÓĞ¶àÉÙ²É¼¯ÎïÆ·

szItemGenre = 		{2,2}			-- ²É¼¯ÎïÆ·µÄ´óÀà
szItemDetail = 		{2,2}			-- ²É¼¯ÎïÆ·µÄ¸±Àà
szItemParticular = 	{46,22}			-- ²É¼¯ÎïÆ·µÄÏêÏ¸Àà±ğ
szItemGailv = 		{85,100}		-- ²É¼¯ÎïÆ·µÄ¸ÅÂÊ£¨ÕâÀïÌîµÄÊ±ºò£¬ºóÃæÒ»¸öÒª¼ÓÉÏÇ°ÃæÒ»¸öµÄ¸ÅÂÊ£©
szItemLowCount =	{25,5}		-- ²É¼¯ÎïÆ·×îµÍÊıÁ¿
szItemHighCount =	{40,8}		-- ²É¼¯ÎïÆ·×î¸ßÊıÁ¿

nSkillType = 0						-- ²É¼¯ÀàÉú»î¼¼ÄÜ´óÀàĞÍ
nSkillID = 2						-- ÖÆÆ¤¼¼ÄÜID
nSkillLevelLow = 41					-- ĞèÒª´ïµ½µÄ²É¼¯¼¼ÄÜ×îµÍµÈ¼¶
nSkillLevelHigh = 50				-- ĞèÒª´ïµ½µÄ²É¼¯¼¼ÄÜ×î¸ßµÈ¼¶

nDigToolCount = 2							-- ²É¼¯¹¤¾ßÖÖÀàÊıÁ¿
nDigToolGenre = {0, 0}				-- ²É¼¯¹¤¾ß´óÀà
nDigToolDetail = {200, 200}				-- ²É¼¯¹¤¾ß¸±Àà
nDigToolParticular = {12, 24}		-- ²É¼¯¹¤¾ßÏêÏ¸Àà
nEndureCount = 90							-- ²É¼¯Õâ¸ö¶«Î÷ÒªÏûºÄµÄÄÍ¾Ã¶È

-- Ä¬ÈÏÈë¿Úº¯Êı
function main()
	local nCurNpcIndex = GetTargetNpc()
	if (nCurNpcIndex == 0) then
		return
	end
	local nCurLevel = GetUnitCurStates(nCurNpcIndex, 0)
	if (nCurLevel == 99) then
		return
	end
	AddUnitStates(nCurNpcIndex, 0, 100)		-- ´Ë¶Î·ÀË¢

	local nCanDig = check_dig_condition(nSkillType, nSkillID, nSkillLevelLow)
	
	-- ¼ì²éÊÇ·ñÓĞ²É¼¯¹¤¾ß
	local nCanDigTool = 0
	for i = 1, nDigToolCount do
		local bHaveDigTool = GetItemCount(nDigToolGenre[i], nDigToolDetail[i], nDigToolParticular[i])
		if (bHaveDigTool ~= 0) then
			nCanDigTool = 1
			break
		end
	end
	
	-- Èç¹ûÍæ¼Ò¿ÉÒÔÍÚÕâ¸öÒ©Æ·£¬½øÈëÏÂÃæÖ´ĞĞ¶Î
	if (nCanDig == 1 and nCanDigTool == 1) then
		if (DoFireworks(890, 1) == 1) then
			Msg2Player("Thu thËp......");
			CastState("state_fetter", 1, 5 * 18)
			ProgressSlot(5 * 18)
			
			local nMapID, nX, nY = GetWorldPos()
			MedicNpcDeath(nMapID, nCurNpcIndex)
			SetNpcLifeTime(nCurNpcIndex, 0)
			SetNpcScript(nCurNpcIndex, "")
			AbradeDigTool(nSkillID, nSkillLevelLow, nEndureCount)	-- ÏûºÄ²É¼¯¹¤¾ßµÄÄÍ¾Ã
		else
			Msg2Player("Kh«ng thÓ lµm ®éng t¸c nµy ë tr¹ng th¸i ngåi")
		end
	end
	
	if nCanDigTool == 0 then
		Msg2Player("B¹n kh«ng mang theo c«ng cô cÇn thiÕt!")
	end
		
	-- Èç¹ûÍæ¼Ò²»ÄÜÍÚÕâ¸öÒ©Æ·£¬ÈÃ±ğÈË¿ÉÒÔ¼ÌĞøÍÚ
	AddUnitStates(nCurNpcIndex, 0, -100)	-- ´Ë¶Î·ÀË¢
end;

-- ÍÚ¾ò½áÊøÒÔºóµÄ»Øµ÷º¯Êı
function OnProgressCallback()
	local nExpMultiCount = get_dig_multi_count(nSkillType, nSkillID, nSkillLevelHigh)	-- »ñµÃµÃ¾­ÑéµÄÊ±ºòµÄ¼Ó³É±¶Êı
	
	local nSel = random(1, 99)
	local nChoice = 0
	local nSelCount = 0
	
	for i = 1, nTotalItemCount do
		if (nSel < szItemGailv[i]) then
			nChoice = i			
			break
		end
	end
	
	-- Ëæ»úµ½¿ÉÒÔµÃµ½¶«Î÷
	if (nChoice ~= 0) then
		nSelCount = random(szItemLowCount[nChoice], szItemHighCount[nChoice])
		AddItem(szItemGenre[nChoice], szItemDetail[nChoice], szItemParticular[nChoice], nSelCount)	-- ¼ÓÎïÆ·
		AddLifeSkillExp(nSkillType, nSkillID, nExpMultiCount * nSelCount)							-- ¼Ó¾­Ñé
	end
	
	-- ÌáÊ¾
	if (nChoice == 1) then
		Say("MÊy tÊm da nµy rÊt tèt, b¹n t×m ®­îc "..nSelCount.." Da hæ tr¾ng!", 0)
	elseif (nChoice == 2) then
		Say("Kh«ng ngê bªn trong cßn gãi hµng, b¹n nhËn ®­îc "..nSelCount.." tÊm Chøc cÈm!", 0)
	else
		Say("MÊy tÊm da nµy ®· r¸ch n¸t, ng­¬i vÉn ch­a t×m ®­îc ®å cÇn dïng!", 0)
	end
	
end;

