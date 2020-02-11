-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII É³Ä®ÃÔ¹¬NPC»ÃÏó¹ÅÑôÊÞScript
-- By StarryNight
-- 2007/08/07 AM 11:58

-- ²»ÒªÆÛ¸ºÈËÍÕ±³°¡£¡

-- ======================================================

-- ÒýÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼þ
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();
local nNpcIndex = 0;
local t=0;

	SetNpcLifeTime(index,15);--Ê¹µÃÊ¬ÌåÏûÊ§
	
	if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó
		nNpcIndex = CreateNpc("Hoan T­îng (TrÊn mé T­íng qu©n)","TrÊn mé T­íng qu©nHoan T­îng ",nMapId, nX, nY);
		SetNpcLifeTime(nNpcIndex,1800);
		SetNpcScript(nNpcIndex,"\\script\\Î÷±±Çø\\É³Ä®ÃÔ¹¬\\npc\\»ÃÏóÕòÄ¹½«¾ü.lua");
		TaskTip("§· tiªu diÖt ¶o ¶nh Cæ D­¬ng thó, ¶o ¶nh biÕn thµnh TrÊn Mé T­íng Qu©n.");
		Msg2Player("§· tiªu diÖt ¶o ¶nh Cæ D­¬ng thó, ¶o ¶nh biÕn thµnh TrÊn Mé T­íng Qu©n.");
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
			if nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then	
				TaskTip("§· tiªu diÖt ¶o ¶nh Cæ D­¬ng thó, ¶o ¶nh biÕn thµnh TrÊn Mé T­íng Qu©n.");
				Msg2Player("§· tiªu diÖt ¶o ¶nh Cæ D­¬ng thó, ¶o ¶nh biÕn thµnh TrÊn Mé T­íng Qu©n.");
				if t == 0 then
					nNpcIndex = CreateNpc("Hoan T­îng (TrÊn mé T­íng qu©n)","TrÊn mé T­íng qu©nHoan T­îng ",nMapId, nX, nY);
					SetNpcLifeTime(nNpcIndex,1800);
					SetNpcScript(nNpcIndex,"\\script\\Î÷±±Çø\\É³Ä®ÃÔ¹¬\\npc\\»ÃÏóÕòÄ¹½«¾ü.lua");
					t=1;
				end
			end
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
  end;
end
