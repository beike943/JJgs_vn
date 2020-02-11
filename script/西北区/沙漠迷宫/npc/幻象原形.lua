-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII É³Ä®ÃÔ¹¬NPC¶ÀÐÐÀÏÍÓScript
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
local strSay = {
	"Khi ®¸nh b¹i nguyªn h×nh cña Hoan T­îng , theo lêi cña DiÖp Tö Thu, lóc nµy ph¶i dïng thÇn chó phong Ên nã. Xin chän c©u thÇn chó phong Ên: ",
	HUANXIANG_CURSE[1].."/#Confirm_Curse(1)",
	HUANXIANG_CURSE[2].."/#Confirm_Curse(2)",
	HUANXIANG_CURSE[3].."/#Confirm_Curse(3)",
	}

	SetNpcLifeTime(index,15);--Ê¹µÃÊ¬ÌåÏûÊ§
	
	if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó
		if GetTask(TASK_XB_ID_01) == 64 then
			SelectSay(strSay);
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
			if GetTask(TASK_XB_ID_01) == 64 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				SetPlayerScript("\\script\\Î÷±±Çø\\É³Ä®ÃÔ¹¬\\npc\\»ÃÏóÔ­ÐÎ.lua");
				SelectSay(strSay);
			end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
  end;
end

--È·ÈÏÖäÓï
function Confirm_Curse(index)

local strTalk = {};

	--·âÓ¡³É¹¦
	if GetTask(HUANGXIANG_CURSE_ID) == index then
		SetTask(TASK_XB_ID_01,65);
		strTalk = {
			"Ng­êi ch¬i: Nguyªn h×nh Hoan T­îng ®· bÞ phong Ên thµnh c«ng, sau khi tÆng ph¸p khÝ cho B¹ch Thiªn Thµnh liÒn tr¶ th¸p phong yªu cho DiÖp Tö Thu. "
			}
		Msg2Player("Sau khi tÆng ph¸p khÝ phong Ên cho B¹ch Thiªn Thµnh, th× mang tr¶ th¸p phong Ên cho DiÖp Tö Thu. ");
		TaskTip("Sau khi tÆng ph¸p khÝ phong Ên cho B¹ch Thiªn Thµnh, th× mang tr¶ th¸p phong Ên cho DiÖp Tö Thu. ");

	--·âÓ¡Ê§°Ü
	else
		strTalk = {
			"ThÇn chó kh«ng hiÖu lùc, nguyªn h×nh Hoan T­îng ®· ch¹y tho¸t!"
			}
	end
	
	TalkEx("",strTalk);

end
