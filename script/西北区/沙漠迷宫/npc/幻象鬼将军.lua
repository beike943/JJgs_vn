-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII É³Ä®ÃÔ¹¬NPC»ÃÏó¹í½«¾üScript
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
		nNpcIndex = CreateNpc("Nguyªn h×nh Hoan T­îng","Nguyªn h×nh Hoan T­îng",nMapId, nX, nY);
		SetNpcLifeTime(nNpcIndex,1800);
		SetNpcScript(nNpcIndex,"\\script\\Î÷±±Çø\\É³Ä®ÃÔ¹¬\\npc\\»ÃÏóÔ­ÐÎ.lua");
		TaskTip("Tiªu diÖt ¶o ¶nh Quû T­¬ng §Çu, nguyªn h×nh cña Hoan T­îng-Con trai xuÊt hiÖn!!");
		Msg2Player("Tiªu diÖt ¶o ¶nh Quû T­¬ng §Çu, nguyªn h×nh cña Hoan T­îng-Con trai xuÊt hiÖn!!");
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
      if nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				TaskTip("Tiªu diÖt ¶o ¶nh Quû T­¬ng §Çu, nguyªn h×nh cña Hoan T­îng-Con trai xuÊt hiÖn!!");
				Msg2Player("Tiªu diÖt ¶o ¶nh Quû T­¬ng §Çu, nguyªn h×nh cña Hoan T­îng-Con trai xuÊt hiÖn!!");
				if t == 0 then
					nNpcIndex = CreateNpc("Nguyªn h×nh Hoan T­îng","Nguyªn h×nh Hoan T­îng",nMapId, nX, nY);
					SetNpcLifeTime(nNpcIndex,1800);
					SetNpcScript(nNpcIndex,"\\script\\Î÷±±Çø\\É³Ä®ÃÔ¹¬\\npc\\»ÃÏóÔ­ÐÎ.lua");
					t=1;
				end
			end
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
  end;
end
