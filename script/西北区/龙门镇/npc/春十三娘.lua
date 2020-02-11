-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Î÷±±ÈÎÎñNPC´ºÊ®ÈýÄïËÀÍöScript
-- By StarryNight
-- 2007/06/7 PM 5:00

--Ïà°®ºÜÄÑ 

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
	"Xin c« n­¬ng cho m­în vËt tïy th©n ®Ó cøu ng­êi, ®a t¹.",
	"Ng­¬i cøu ai liªn quan g× ®Õn ta? Ng­¬i dùa vµo g× ®Ó m­în ®å ta chø? §îi ®Êy ng­¬i d¸m v« lÔ víi bµ µ.",
	"Xin ®¾c téi víi c« n­¬ng.",
	}

	--SetNpcLifeTime(index,15);--Ê¹µÃÊ¬ÌåÏûÊ§
	
	if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó
		if GetTask(TASK_XB_ID) == 12 then
			AddItem(2,0,690,1,1);--´òµ¹´ºÊ®ÈýÄïµÃµ½Ò»¸ö¶Ç¶µ
			TalkEx("",strTalk);
			SetTask(TASK_XB_ID,13);
			TaskTip("Mau ®em yÕm giao cho T«n NhÞ LiÖm ®Ó gi¶i nçi sÇu t­¬ng t­.");
			Msg2Player("Mau ®em yÕm giao cho T«n NhÞ LiÖm ®Ó gi¶i nçi sÇu t­¬ng t­.");
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
			if GetTask(TASK_XB_ID) == 12 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				AddItem(2,0,690,1,1);--´òµ¹´ºÊ®ÈýÄïµÃµ½Ò»¸ö¶Ç¶µ
				TalkEx("",strTalk); 
				SetTask(TASK_XB_ID,13);
				TaskTip("Mau ®em yÕm giao cho T«n NhÞ LiÖm ®Ó gi¶i nçi sÇu t­¬ng t­.");
				Msg2Player("Mau ®em yÕm giao cho T«n NhÞ LiÖm ®Ó gi¶i nçi sÇu t­¬ng t­.");
			end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
  end;
end
