--Ë«½£ÖïĞ°Í·ÎÄ¼ş
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\define.lua");
Include("\\script\\lib\\sdb.lua");
Include("\\script\\lib\\talktmp.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

--Ê¹ÓÃÎïÆ·ÕÙ»½¹ÖËÀÍö½Å±¾
--nGTaskID£º		gtaskID
--nTaskID£º		¼ÇÂ¼NpcIDµÄ±äÁ¿
--·µ»ØÖµ
--1£º³É¹¦
--2£ºÃ»ÓĞ½ÓÈÎÎñ
--3£º½ÓÁËÈÎÎñ£¬µ«ÊÇ²»ÊÇËûµÄ¹Ö
function CallNpcOnDeath(nGTaskID, nTaskID, nNpcIdx)
	if tGtCondition:check_taskid(nGTaskID, 2) ~= nil then
		--Msg2Player(GetTargetNpc());
		if GetTask(nTaskID) == 0 or GetTask(nTaskID) == 1 or GetTask(nTaskID) == nNpcIdx then
			return 3
		else
			local nNpcIdx = GetTask(nTaskID);
			SetNpcLifeTime(nNpcIdx, 0);
			SetTask(nTaskID, 1);
			
			return 1
		end
	else
		return 2
	end
end

--Ê¹ÓÃÎïÆ·ÕĞ¹Ö
--nGTaskID£º 	gtaskID
--tMapID£º		µØÍ¼ID
--nTaskID£º	¼ÇÂ¼NpcIDµÄÈÎÎñ±äÁ¿
--szNpcName£º		ÕÙ»½NpcÃû×Ö
--szNpcTemp£º		ÕÙ»½NpcÄ£°å
--szNpcScript£º		ÕÙ»½Npc½Å±¾
--·µ»ØÖµ
--1£º³É¹¦
--2£ºµØÍ¼²»¶Ô
--3£ºÉÏÒ»´ÎÕÙ»½³öÀ´µÄ¹Ö»¹´æÔÚ
--4£ºÕÙ»½ÒÑ¾­ÒâÍâËÀµôÁË
--5£ºÃ»ÓĞ½ÓÈÎÎñ
--Àı×Ó
--local ret = CallNpcOnUser(525, tMap, 3378, "Ñ©¾«Áé", "Ñıºü2", "\\script\\task\\2011_newtask_newnpc\\xuejinling.lua");
function CallNpcOnUser(nGTaskID, tMap, nTaskID, szNpcName, szNpcTemp, szNpcScript)
	if tGtCondition:check_taskid(nGTaskID, 2) ~= nil then
		--¼ì²âµØÍ¼
		if tMap ~= nil and type(tMap) == "table" then
			local nMapID, nMapX, nMapY = GetWorldPos();
			if tMap[1] ~= nil and tMap[1] == nMapID then
				if tMap[2] ~= nil and tMap[3] ~= nil then
					if tMap[2] ~= nMapX or tMap[3] ~= nMapY then
						return 2
					end
				end
			else
				return 2
			end
		end
		
		if GetTask(nTaskID) == 0 then
			local nNpcIdx = CreateNpc(szNpcName, szNpcTemp, GetWorldPos());
			SetTask(nTaskID, nNpcIdx);
			SetNpcScript(nNpcIdx, szNpcScript);
			SetNpcLifeTime(nNpcIdx, 120);
			return 1
		else
			local nCurNpcID = GetTask(nTaskID);
			local nNpcIdx = GetNpcID(nNpcIdx);
			if nNpcIdx == 0 or nNpcIdx ~= nCurNpcID then	--ÕÙ»½¹ÖÒÑ¾­ÏûÊ§£¬»òÕß±»±ğÈË´òËÀ
				return 4
			else
				return 3
			end
		end
	else
		return 5
	end
end

--É±10¸ö±Ø³ö£¬ÅäºÏÉ±¹Ö´¥·¢Æ÷Ê¹ÓÃ
-- nGTaskID: gtask ÖĞµÄÈÎÎñID
-- nTaskID: ÈÎÎñ±äÁ¿£¬ÓÃÀ´¼ÇÂ¼É±¹Ö´ÎÊıµÄ
-- nKillTriggerID : ËÀÍö´¥·¢Æ÷
-- nKillTriggerCustonID: ËÀÍö´¥·¢Æ÷×Ô¼ºµÄID
-- szTalk: Íê³É¶Ô»°
-- tItem: µôÂäÎïÆ·£¬×¢ÒâÖ»ÄÜÊÇÒ»¸ö¡£¡£¡£
-- strItemName: µôÂäÎïÆ·µÄÃû³Æ
function kill10or1(nGTaskID, nTaskID, nKillTriggerID, nKillTriggerCustomID, szTalk, tItem, strItemName, funDo)
	--2011ĞÂÊÖ¸Ä½øÖ®ºó
	if tGtCondition:check_taskid(nGTaskID, 2) ~= nil then
		if GetTask(nTaskID) ~= 10 then
			RemoveTrigger(GetTrigger(nKillTriggerCustomID));
			local nOver = 0;
			SetTask(nTaskID, GetTask(nTaskID) + 1);
			
			if GetTask(nTaskID) == 10 then
				nOver = 1;
			end
			
			local nRand = random(1, 10);
			if nRand == 1 then
				nOver = 1;
			end
			
			if nOver == 1 then
				if szTalk == nil then
					szTalk= {
						"§· t×m ®­îc vËt yªu cÇu, cã thÓ ®i tr¶ nhiÖm vô råi!",
					};
				end
				Talk(1, "", szTalk);
				
				if tItem ~= nil and strItemName ~= nil then
					gf_AddItemEx(tItem, strItemName);
				end
				
				if funDo ~= nil then
					funDo()
				end
				
				SetTask(nTaskID, 10);
				return 
			end
			if GetTrigger(nKillTriggerCustomID) == 0 then
				CreateTrigger(0, nKillTriggerID, nKillTriggerCustomID);
			end
		else
			Talk(1, "", "ThiÕu hiÖp ®· t×m ®­îc vËt yªu cÇu chø? Nh÷ng thø nµy cÇn t×m thªm vµi lÇn míi ®ñ, h·y mau t×m ®i!")
		end
	end
	--2011ĞÂÊÖ¸Ä½øÖ®Ç°
end

--É±N¸ö¹Ö´¥·¢Æ÷
--ÔÚ´¥·¢Æ÷ÖĞ±»µ÷ÓÃ£¬´¥·¢Æ÷ÖĞĞèÒªÖªµÀtaskID + ¹ÖÎïµÄÃû×Ö
--nTaskID 			¼ÇÂ¼É±¹Ö¸öÊıµÄÈÎÎñID
--nSum				ĞèÒªÉ±¶àÉÙ¸ö
-- nKillTriggerID	ËÀÍö´¥·¢Æ÷
-- nKillTriggerCustonID	ËÀÍö´¥·¢Æ÷×Ô¼ºµÄID
--szTalk				¶Ô»°
--tItem				ÎïÆ·
--szItemName	ÎïÆ·Ãû³Æ	
function KillAction(nTaskID, nSum, nKillTriggerID, nKillTriggerCustonID,szTalk, tItem, szItemName)
	nTaskID = tonumber(nTaskID);
	nSum = tonumber(nSum);
	nProbability = tonumber(nProbability);
	
	SetTask(GetTask(nTaskID) + 1);
	local nNum = GetTask(nTaskID);
	--Ã¿´Î¶¼ÒªÒÆ³ı´¥·¢Æ÷
	RemoveTrigger(GetTrigger(nKillTriggerCustomID));
	if nSum == nNum then	--Íê³ÉÈÎÎñ£¬¸Ï½ô½áÊø
		--1¡¢¶Ô»°
		if szTalk ~= nil then
			Talk(1, "", szTalk);
		end
		
		--2¡¢ÎïÆ·
		if tItem ~= nil and strItemName ~= nil then
			gf_AddItemEx(tItem, strItemName);
		end
	else
		if GetTrigger(nKillTriggerCustonID) == 0 then
			CreateTrigger(0, nKillTriggerID, nKillTriggerCustonID);
		end
	end
end