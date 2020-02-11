-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII »ÊÁêÄ¹ÊÒÒ»²ãNPC±øÂíÙ¸Í³ÁìScript
-- By StarryNight
-- 2007/06/29 AM 11:57

-- ÇÒÐÐÇÒÕäÏ§

-- ======================================================

-- ÒýÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼þ
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();

	SetNpcLifeTime(index,15);--Ê¹µÃÊ¬ÌåÏûÊ§
	
	if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó
		if GetTask(TASK_XB_ID_01) == 19 then
			AddItem(2,0,712,1,1);--´òµ¹±øÂíÙ¸Í³ÁìµÃµ½Ãþ½ð·û
			SetTask(TASK_XB_ID_01,20);
			TaskTip("NhËn ®­îc M« Kim Phï, trë vÒ Phông T­êng giao cho LiÔu Tung V©n ®Ó hái vÒ chuyÖn mé thÊt.");
			Msg2Player("NhËn ®­îc M« Kim Phï, trë vÒ Phông T­êng giao cho LiÔu Tung V©n ®Ó hái vÒ chuyÖn mé thÊt.");
			GivePlayerAward("Award_XB_29","Easy");
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
			if GetTask(TASK_XB_ID_01) == 19 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				AddItem(2,0,712,1,1);--´òµ¹±øÂíÙ¸Í³ÁìµÃµ½Ãþ½ð·û 
				SetTask(TASK_XB_ID_01,20);
				TaskTip("NhËn ®­îc M« Kim Phï, trë vÒ Phông T­êng giao cho LiÔu Tung V©n ®Ó hái vÒ chuyÖn mé thÊt.");
				Msg2Player("NhËn ®­îc M« Kim Phï, trë vÒ Phông T­êng giao cho LiÔu Tung V©n ®Ó hái vÒ chuyÖn mé thÊt.");
				GivePlayerAward("Award_XB_29","Easy");
			end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
  end;
end
