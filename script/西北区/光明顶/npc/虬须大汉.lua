-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ¹âÃ÷¶¥NPCò°Ðë´óººScript
-- By StarryNight
-- 2007/06/20 PM 2:29

-- Ò»²½Ò»¸öÌìÑÄ

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
	"(Ta kh«ng ph¶i thµnh t©m gia nhËp NhÊt PhÈm ®­êng, sao ph¶i lµm chuyÖn h¹i ng­êi? NhÊt PhÈm ®­êng ®óng lµ téi ¸c cña vâ l©m, coi m¹ng ng­êi nh­ cá r¸c. NÕu kh«ng diÖt tËn gèc sÏ g©y häa kh«n l­êng.)",
	"(Ng­êi nµy ph¹m ph¸p trèn ch¹y ®· ®µnh, l¹i cßn cËy thÕ NhÊt PhÈm ®­êng tµn h¹i vâ l©m §¹i Tèng, lµ ng­êi Tèng mµ ph¶n béi n­íc nhµ, kh«ng cã lßng yªu n­íc, thËt lµ ®¸ng khinh… Ta nªn trë vÒ t×m Xa Lu©n B¸ V­¬ng tr­íc.",
	}

	--SetNpcLifeTime(index,15);--Ê¹µÃÊ¬ÌåÏûÊ§
	
	if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó
		if GetTask(TASK_XB_ID) == 32 then
			AddItem(2,0,697,1,1);--´òµ¹ò°Ðë´óººµÃµ½ò°Ðë´óººÊ×¼¶Ò»¸ö
			TalkEx("",strTalk);
			SetTask(TASK_XB_ID,33);
			TaskTip("LÊy ®­îc thñ cÊp cña Di Tu §¹i H¸n, lµ lóc vÒ phôc mÖnh víi Xa Lu©n Ph¸p V­¬ng.");
			Msg2Player("LÊy ®­îc thñ cÊp cña Di Tu §¹i H¸n, lµ lóc vÒ phôc mÖnh víi Xa Lu©n Ph¸p V­¬ng.");
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
			if GetTask(TASK_XB_ID) == 32 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				AddItem(2,0,697,1,1);--´òµ¹ò°Ðë´óººµÃµ½ò°Ðë´óººÊ×¼¶Ò»¸ö
				TalkEx("",strTalk); 
				SetTask(TASK_XB_ID,33);
				TaskTip("LÊy ®­îc thñ cÊp cña Di Tu §¹i H¸n, lµ lóc vÒ phôc mÖnh víi Xa Lu©n Ph¸p V­¬ng.");
				Msg2Player("LÊy ®­îc thñ cÊp cña Di Tu §¹i H¸n, lµ lóc vÒ phôc mÖnh víi Xa Lu©n Ph¸p V­¬ng.");
			end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
  end;
end
