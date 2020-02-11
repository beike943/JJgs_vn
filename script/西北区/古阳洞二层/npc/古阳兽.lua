-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ¹ÅÑô¶´¶þ²ãNPC¹ÅÑôÊÞScript
-- By StarryNight
-- 2007/08/08 AM 0:46

-- °®Ò»¸öÈË¾Í²»ÒªÉËº¦Ëý

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
	"(1 ¸nh hång quang lãe lªn cïng víi tiÕng rÝt chãi tai)",
	"Ng­êi ch¬i: ??!? (¸nh hµo quang vµ tiÕng rÝt lóc n·y lµ sao? Hay nªn ®i hái DiÖp Tö Thu.)",
	}

	SetNpcLifeTime(index,15);--Ê¹µÃÊ¬ÌåÏûÊ§
	
	if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó
		if GetTask(TASK_XB_ID_02) == 17 then
			DelItem(2,0,704,1);--ËøÑý·û
			AddItem(2,0,705,1,1);--Ñª»ê¾§ÆÇ
			TalkEx("",strTalk);
			SetTask(TASK_XB_ID_02,18);
			SetTask(CREAT_GUYANGSHOU_TIME,0);--¹ÅÑôÊÞË¢ÐÂÊ±¼äÇåÁã
			TaskTip("§· ®¸nh b¹i Cæ D­¬ng Thó , trë vÒ C«n L«n gÆp DiÖp Tö Thu. ");
			Msg2Player("§· ®¸nh b¹i Cæ D­¬ng Thó , trë vÒ C«n L«n gÆp DiÖp Tö Thu. ");
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
			if GetTask(TASK_XB_ID_02) == 17 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				DelItem(2,0,704,1);--ËøÑý·û
				AddItem(2,0,705,1,1);--Ñª»ê¾§ÆÇ
				TalkEx("",strTalk);
				SetTask(TASK_XB_ID_02,18);
				SetTask(CREAT_GUYANGSHOU_TIME,0);--¹ÅÑôÊÞË¢ÐÂÊ±¼äÇåÁã
				TaskTip("§· ®¸nh b¹i Cæ D­¬ng Thó , trë vÒ C«n L«n gÆp DiÖp Tö Thu. ");
				Msg2Player("§· ®¸nh b¹i Cæ D­¬ng Thó , trë vÒ C«n L«n gÆp DiÖp Tö Thu. ");
			end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
  end;
end
