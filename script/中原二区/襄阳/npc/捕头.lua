-- ====================== ÎÄ¼şĞÅÏ¢ ======================             
             
-- ½£ÏÀÇéÔµonlineII Í¨¼©ÈÎÎñÊµÌå´¦ÀíÎÄ¼ş             
-- Edited by Starry              
-- 2005/09/05 PM 16:21             
             
-- ======================================================             

--ÒıÓÃÍ¨¼©ÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\killer\\killer_head.lua");

function main()

	local strButouTitle = "<color=green>Bé ®Çu<color>:";
	local task_state = GetTask(TASK_KILLER_STATE_ID);
	local nLevel = GetLevel();
	
	if random(1,20) == 1 then
		NpcChat(GetTargetNpc(),"Nghe nãi trªn ng­êi cña bän s¸t thñ §­êng còng cã Linh Th¹ch, thiÕu hiÖp ph¶i theo dâi bän chóng!");
	end;
	
	--½ÓÊÕÈÎÎñµÄµÈ¼¶×îµÍÎª10¼¶
	if nLevel >= 10 then
	
		if task_state == 0 then
			Say(strButouTitle.."GÇn ®©y sè téi ph¹m kh¾p n¬i kh«ng ngõng t¨ng lªn, kh«ng biÕt C¸c h¹ cã thÓ ra tay t­¬ng trî gióp Quan phñ b¾t chóng quy ¸n?",
				2,
				"Ng­êi luyÖn vâ nh­ chóng ta sao cã thÓ ®øng lµm ng¬!/Task_Confirm",
				"T¹i h¹ cßn cã chuyÖn ph¶i lµm!/Taks_Exit");	
		end;
		
		if task_state >= 1 then
		
			local nSurnameID = GetTask(TASK_KILLER_SURNAME_ID);
			local nFirstnameID = GetTask(TASK_KILLER_FIRSTNAME_ID);
			local nKillerName = getKillerName(nSurnameID,nFirstnameID);
			
			local nPosID = GetTask(TASK_KILLER_MAP_ID);
			local nMapName,nMapID,nWx,nYx,nMx,nMy = getPosData(nPosID);
			
			Say(strButouTitle.."C¸c h¹ cã ph¶i ®· gióp ta ®¸nh b¹i s¸t thñ xung quanh <color=yellow>"..nMapName.."("..nMx..", "..nMy..")<color> (s¸t thñ) <color=yellow>"..nKillerName.."<color>?",
				3,
				"Ta ®· giÕt/Task_Finish",
				"T¹m thêi ch­a/Taks_Exit",
				"Ta kh«ng muèn giÕt/Task_Cancel");		
		end;
	
	else
		Say("Chê ®¼ng cÊp cña ng­¬i ®¹t <color=yellow>cÊp 10<color> h·y ®Õn t×m ta!",0)
			
	end;
end;

--½ÓÊÜÈÎÎñ
function Task_Confirm()

	local nKillerName = "";
	local nKillerMode = "";
	local nMapName = "";
	local nMapID = 0;
	local nWx,nWy,nMx,nMy = 0,0,0,0;
	local strButouTitle = "<color=green>Bé ®Çu<color>:";
	local nDoNum = GetTask(TASK_KILLER_DONUM);
	local nTriggerID = 0;
	local nCustomID = 0;
	
	if Is_1stTask() == 1 then --½øÈëÓÎÏ·µÚÒ»´Î×öÈÎÎñ
	
		--Éú³ÉÒ»¸öÉ±ÊÖÊı¾İ
		nKillerName,nKillerMode,nMapName,nMapID,nWx,nWy,nMx,nMy = createKillerData();

		Say(strButouTitle.."Theo tin th¸m b¸o, s¸t thñ <color=yellow>"..nKillerName.."<color> gÇn ®©y hay xuÊt hiÖn t¹i <color=yellow>"..nMapName.."("..nMx..","..nMy..")<color>. H·y mau ®i diÖt trõ!",0);

		SetTask(TASK_KILLER_STATE_ID,1);--½ÓÊÜÒ»¸öÍ¨¼©ÈÎÎñ£¬ÖÃ±äÁ¿Îª 1
		SetTask(TASK_KILLER_DONUM,1);--¼ÇÂ¼½Ó»ñÈÎÎñ´ÎÊı	
		SetTask(TASK_PLAYER_LEVEL,GetLevel());--¼ÇÂ¼Íæ¼Ò½Ó»ñÈÎÎñÊ±µÄµÈ¼¶
		
		--Éú³ÉÊ±¼ä´¥·¢Æ÷£¬¼ÆÊıÖµÎª900
		CreateTrigger(2,400,500);
		ContinueTimer(GetTrigger(500));
		
		--Éú³ÉµØÍ¼´¥·¢Æ÷
		nTriggerID,nCustomID = GetTriggerID(nMapID);
		CreateTrigger(2,nTriggerID,600);
		
		--±£´æµØÍ¼´¥·¢Æ÷ID
		SetTask(TASK_TRIGGER_ID,nTriggerID);
		
		if GetItemCount(2,0,338) <= 0 then
			AddItem(2,0,338,1,1);
		end;
		
		TaskTip("B¹n nhËn ®­îc mét nhiÖm vô truy n·, trong 15 phót ph¶i ®Õn khu vùc ®ã, th«ng tin chi tiÕt cã thÓ xem trong Truy N· lÖnh!");
		
	else
		if Is_1stTask_day() == 1 then -- Ò»ÌìÄÚµÚÒ»´Î×öÈÎÎñ
		 
		 	--ÔÚÖ¸¶¨µØ·½Éú³ÉÒ»¸öÉ±ÊÖÊı¾İ
			nKillerName,nKillerMode,nMapName,nMapID,nWx,nWy,nMx,nMy = createKillerData();
			
			Say(strButouTitle.."Theo tin th¸m b¸o, s¸t thñ <color=yellow>"..nKillerName.."<color> gÇn ®©y hay xuÊt hiÖn t¹i <color=yellow>"..nMapName.."("..nMx..","..nMy..")<color>. H·y mau ®i diÖt trõ!",0);			
			
			SetTask(TASK_KILLER_STATE_ID,1);--½ÓÊÜÒ»¸öÍ¨¼©ÈÎÎñ£¬ÖÃ±äÁ¿Îª 1
			SetTask(TASK_KILLER_DONUM,1);--¼ÇÂ¼½Ó»ñÈÎÎñ´ÎÊı
			SetTask(TASK_PLAYER_LEVEL,GetLevel());--¼ÇÂ¼Íæ¼Ò½Ó»ñÈÎÎñÊ±µÄµÈ¼¶
			
			--Éú³ÉÊ±¼ä´¥·¢Æ÷£¬¼ÆÊıÖµÎª1800
			CreateTrigger(2,400,500);
			ContinueTimer(GetTrigger(500));
			
			--Éú³ÉµØÍ¼´¥·¢Æ÷
			nTriggerID,nCustomID = GetTriggerID(nMapID);
			CreateTrigger(2,nTriggerID,600);
		
			--±£´æµØÍ¼´¥·¢Æ÷ID
			SetTask(TASK_TRIGGER_ID,nTriggerID);
			
			--µÃµ½ÈÎÎñÎïÆ·Í¨¼©Áî
			if GetItemCount(2,0,338) <= 0 then
				AddItem(2,0,338,1,1);
			end;
			
			TaskTip("B¹n nhËn ®­îc mét nhiÖm vô truy n·, trong 15 phót ph¶i ®Õn khu vùc ®ã, th«ng tin chi tiÕt cã thÓ xem trong Truy N· lÖnh!");
		
		else
			if nDoNum < 20 then --Ò»ÌìÄÚ½Ó»ñÈÎÎñ´ÎÊıÉÙÓÚ20
			
				--ÔÚÖ¸¶¨µØ·½Éú³ÉÒ»¸öÉ±ÊÖÊı¾İ
				nKillerName,nKillerMode,nMapName,nMapID,nWx,nWy,nMx,nMy = createKillerData();
			
				Say(strButouTitle.."Theo tin th¸m b¸o, s¸t thñ <color=yellow>"..nKillerName.."<color> gÇn ®©y hay xuÊt hiÖn t¹i <color=yellow>"..nMapName.."("..nMx..","..nMy..")<color>. H·y mau ®i diÖt trõ!",0);
			
				SetTask(TASK_KILLER_STATE_ID,1);--½ÓÊÜÒ»¸öÍ¨¼©ÈÎÎñ£¬ÖÃ±äÁ¿Îª 1
				SetTask(TASK_KILLER_DONUM,nDoNum+1);--¼ÇÂ¼½Ó»ñÈÎÎñ´ÎÊı
				SetTask(TASK_PLAYER_LEVEL,GetLevel());--¼ÇÂ¼Íæ¼Ò½Ó»ñÈÎÎñÊ±µÄµÈ¼¶
				
				--Éú³ÉÊ±¼ä´¥·¢Æ÷£¬¼ÆÊıÖµÎª1800
				CreateTrigger(2,400,500);
				ContinueTimer(GetTrigger(500));
				
				--Éú³ÉµØÍ¼´¥·¢Æ÷
				nTriggerID,nCustomID = GetTriggerID(nMapID);
				CreateTrigger(2,nTriggerID,600);
		
				--±£´æµØÍ¼´¥·¢Æ÷ID
				SetTask(TASK_TRIGGER_ID,nTriggerID);
				
				if GetItemCount(2,0,338) <= 0 then
					AddItem(2,0,338,1,1);
			end;
			
			TaskTip("B¹n nhËn ®­îc mét nhiÖm vô truy n·, trong 15 phót ph¶i ®Õn khu vùc ®ã, th«ng tin chi tiÕt cã thÓ xem trong Truy N· lÖnh!");
				
			else
				 Say(strButouTitle.."H«m nay C¸c h¹ ®· gióp ta tiªu diÖt s¸t thñ ®­îc 20 lÇn, t¹m thêi kh«ng phiÒn C¸c h¹ n÷a.",0);
				 
			end;
			
		end;
		
	end;
		
end;

--Íê³ÉÈÎÎñ¼°½±ÀøÅäÈ¡
function Task_Finish()

	local strButouTitle = "<color=green>Bé ®Çu<color>:";
	local task_state = GetTask(TASK_KILLER_STATE_ID);
	local nDoNum = GetTask(TASK_KILLER_DONUM);
	
	if task_state == 2 then
		Say(strButouTitle.."Ta thay mÆt Quan phñ vµ b¸ t¸nh c¶m t¹ C¸c h¹! Xin nhËn chót phÇn th­ëng!",0);
		KillerAward();
		SetTask(TASK_KILLER_STATE_ID,0);--Íê³ÉÈÎÎñ£¬ÈÎÎñ×´Ì¬ÖÃ0
		SetTask(TASK_KILLER_DONUM,nDoNum+1);--Íê³ÉÈÎÎñ£¬´ÎÊı¼Ó1
		
		--É¾È¥Í¨¼©Áî
		if GetItemCount(2,0,338) > 0 then
			DelItem(2,0,338,1,1);
		end;
		-- Ê¦Í½ÈÎÎñ £¨É±ÊÖ£©
		local nChance, nMaxChance = CustomDataRead("mp_shashou")
		if nChance ~= nil then
			nChance = nChance + 1
			if nChance < nMaxChance then
				CustomDataSave("mp_shashou", "dd", nChance, nMaxChance)
				Msg2Player("Hoµn thµnh nhiÖm vô s­ ®å-s¸t thñ:"..nChance.."/"..nMaxChance)
			else
				PrenticeCompleteTask()
			end
		end
	else
		Say(strButouTitle.."Hõ! Tuæi cßn nhá mµ d¸m g¹t ta ­?",0);
	end;
end;

--È¡ÏûÈÎÎñ
function Task_Cancel()

local strButouTitle = "<color=green>Bé ®Çu<color>:";

	Say(strButouTitle.."Sao dÔ n¶n lßng vËy?",
	2,
	"§­îc ta sÏ diÖt trõ bän chóng!/Task_Exit",
	"Ta kh«ng giÕt th× sao!/Task_CancelConfirm");
	
end;

--ÔÙ´ÎÈ·ÈÏÈ¡ÏûÈÎÎñ
function Task_CancelConfirm()

local strButouTitle = "<color=green>Bé ®Çu<color>:";
local nDoNum = GetTask(TASK_KILLER_DONUM);
	
	SetTask(TASK_KILLER_DONUM,nDoNum+1);--È¡ÏûÈÎÎñ£¬´ÎÊı¼Ó1
	SetTask(TASK_KILLER_STATE_ID,0);--È¡ÏûÈÎÎñ£¬ÈÎÎñ×´Ì¬ÖÃ0
	SetTask(TASK_KILLER_STATE_STAR,0);
	Say(strButouTitle.."Hõ! §å v« dông!",0);

		--É¾È¥Í¨¼©Áî
		if GetItemCount(2,0,338) > 0 then
			DelItem(2,0,338,1,1);
		end;	
	
	--É¾µô¸ÃµØÍ¼´¥·¢Æ÷
	RemoveTrigger(GetTrigger(600));
	--É¾µôÊ±¼ä´¥·¢Æ÷
	RemoveTrigger(GetTrigger(500));
	
end;
	
	
--¿Õº¯Êı£¬²»×öÈÎºÎÊÂ
function Taks_Exit()

end;
