-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ´óÀíÈÎÎñNPCåÈÂ¥ÂŞÕÙ»½ºÍËÀÍöScript
-- By StarryNight
-- 2006/01/10 PM 14:23

-- ²»ËÀÄñËÀ²»ÁË£¬ÆäÊµÄÚĞÄ¿ÉÄÜÒ²·Ç³£Í´¿à¡­¡­

-- ======================================================
-- ÒıÓÃ¾çÇéÈÎÎñÎÄ¼ş
Include("\\script\\task\\world\\´óÀí\\task_head.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnUse()

local nMapID,nWx,nWy = GetWorldPos();
	
	--ĞèÒªÔÚ·ïÑÛ¶´Ò»²ã»ò¶ş²ãÊ¹ÓÃ		
	if nMapID == 414 or nMapID == 415 then
		local nTime = GetTask(TASK_DL_LV55_TIME);
		nTime = 30*60 - (GetTime() - nTime);--Éú´æÊ±¼äÎª20·ÖÖÓ¼õÈ¥ÅÜÂ·ËùÓÃÊ±¼ä
		
		if nTime <= 0 then
			Say("Phông Hoµng linh ®· mÊt hiÖu lùc, quay l¹i M¹c Tam nhËn c¸i míi.",0);
			DelItem(2,0,373,1);
			if GetTrigger(TALK_DL_MOSAN) == 0 then
				CreateTrigger(4,201,TALK_DL_MOSAN);
			end;
			RemoveTrigger(GetTrigger(TIME_DL_PHENIX));--É¾µô¼ÆÊ±Æ÷
			return
		end
		
		if GetTask(TASK_DL_LV55_ID) == 3 then
			local nJLLIndex = CreateNpc("Phông Hoµng","Phông Hoµng",nMapID,nWx,nWy,-1,1,1,50);
			SetNpcLifeTime(nJLLIndex,nTime); 
			SetNpcScript(nJLLIndex,"\\script\\task\\world\\´óÀí\\Lv20\\åÈÂ¥ÂŞ.lua");
			ChangeNpcToFight(nJLLIndex);
			TaskTip("B¹n ®· gäi ®­îc Phông Hoµng! H·y mau tiªu diÖt!");
			Msg2Player("B¹n ®· gäi ®­îc Phông Hoµng! H·y mau tiªu diÖt!");
			DelItem(2,0,373,1);
			return
		else
			return
		end
	else
		local strTalk = {
			"N¬i ®©y kh«ng thÓ sö dông Phông Hoµng linh."
		};
		TalkEx("",strTalk);
	end;
end;

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();

	SetNpcLifeTime(index,15);--Ê¹µÃÊ¬ÌåÏûÊ§

	if GetTask(TASK_DL_LV55_ID) == 3 then
		SetTask(TASK_DL_LV55_ID,4);
		RemoveTrigger(GetTrigger(TIME_DL_PHENIX));--É¾È¥¼ÆÊ±Æ÷
		RemoveTrigger(GetTrigger(TALK_DL_MOSAN));--É¾È¥ÄªÈı¶Ô»°´¥·¢Æ÷
		TaskTip("DiÖt ®­îc Phông Hoµng, quay vÒ gÆp Cao Th¨ng TuyÒn.");
		Msg2Player("DiÖt ®­îc Phông Hoµng, quay vÒ gÆp Cao Th¨ng TuyÒn.");
	end;
	
	if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó
		if GetTask(TASK_DL_LV55_ID) == 3 then
			SetTask(TASK_DL_LV55_ID,4);
			RemoveTrigger(GetTrigger(TIME_DL_PHENIX));--É¾È¥¼ÆÊ±Æ÷
			RemoveTrigger(GetTrigger(TALK_DL_MOSAN));--É¾È¥ÄªÈı¶Ô»°´¥·¢Æ÷
			TaskTip("DiÖt ®­îc Phông Hoµng, quay vÒ gÆp Cao Th¨ng TuyÒn.");
			Msg2Player("DiÖt ®­îc Phông Hoµng, quay vÒ gÆp Cao Th¨ng TuyÒn.");
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
			if GetTask(TASK_DL_LV55_ID) == 3 then
				SetTask(TASK_DL_LV55_ID,4);
				RemoveTrigger(GetTrigger(TIME_DL_PHENIX));--É¾È¥¼ÆÊ±Æ÷
				RemoveTrigger(GetTrigger(TALK_DL_MOSAN));--É¾È¥ÄªÈı¶Ô»°´¥·¢Æ÷
				TaskTip("DiÖt ®­îc Phông Hoµng, quay vÒ gÆp Cao Th¨ng TuyÒn.");
				Msg2Player("DiÖt ®­îc Phông Hoµng, quay vÒ gÆp Cao Th¨ng TuyÒn.");
			end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
  end;
end;