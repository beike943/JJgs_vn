-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII »ÊÁêÄ¹ÊÒÒ»²ãNPCÕòÄ¹ÊÞScript
-- By StarryNight
-- 2007/08/03 PM 04:16

-- Ç§°ÙÄêÊØÔÚÕâÀï£¬Ö»Îª±£»¤ÀïÃæµÄÈËºÍÎï¡­¡­

-- ======================================================

-- ÒýÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼þ
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();
local strTalk = {
	"Mét ©m thanh lín vang lªn, lèi vµo tÇng 2 ®· më, mau chãng vµo lÊy b¶o r­¬ng dùa theo chØ dÉn cña mËt hµm T©y H¹ Ph¸p v­¬ng."
	}

	SetNpcLifeTime(index,15);--Ê¹µÃÊ¬ÌåÏûÊ§
	
	if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó
		if GetTask(TASK_XB_ID_01) == 25 then
			TalkEx("",strTalk);
			SetTask(TASK_XB_ID_01,26);
			SetTask(CREAT_ZHENMUSHOU_TIME,0);--Çå³ýÕòÄ¹ÊÞË¢ÐÂÊ±¼ä±äÁ¿
			TaskTip("Mau vµo lÊy b¶o r­¬ng dùa theo chØ dÉn cña mËt hµm T©y H¹ Ph¸p v­¬ng.");
			Msg2Player("Mau vµo lÊy b¶o r­¬ng dùa theo chØ dÉn cña mËt hµm T©y H¹ Ph¸p v­¬ng.");
			GivePlayerAward("Award_XB_32","Easy");
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
			if GetTask(TASK_XB_ID_01) == 25 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				TalkEx("",strTalk); 
				SetTask(TASK_XB_ID_01,26);
				SetTask(CREAT_ZHENMUSHOU_TIME,0);--Çå³ýÕòÄ¹ÊÞË¢ÐÂÊ±¼ä±äÁ¿
				TaskTip("Mau vµo lÊy b¶o r­¬ng dùa theo chØ dÉn cña mËt hµm T©y H¹ Ph¸p v­¬ng.");
				Msg2Player("Mau vµo lÊy b¶o r­¬ng dùa theo chØ dÉn cña mËt hµm T©y H¹ Ph¸p v­¬ng.");
				GivePlayerAward("Award_XB_32","Easy");
			end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
  end;
end
