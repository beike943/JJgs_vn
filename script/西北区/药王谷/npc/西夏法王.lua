-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Ò©Íõ¹ÈNPCÎ÷ÏÄ·¨ÍõScript
-- By StarryNight
-- 2007/08/07 PM 05:51

-- ÎÒ²»ÊÇ½ðÂÖ·¨Íõ°¡£¬²»ÒªÈÏ´íÈË£¡

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
	"Xem ra Ph¸p khÝ nµy lµ vËt DiÖp Tö Thu nh¾c ®Õn cã thÓ khiÕn cho Nguyªn h×nh ¶o ¶nh_ThÇn hiÖn nguyªn h×nh, mau ®Õn Mª cung sa m¹c t×m B¹ch Thiªn Thµnh ®Ó biÕt n¬i ¶o ¶nh."
	}

	--SetNpcLifeTime(index,15);--Ê¹µÃÊ¬ÌåÏûÊ§
	
	if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó
		if GetTask(TASK_XB_ID_01) == 63 then
			AddItem(2,0,733,1,1);--»ÃÏó·¨Æ÷
			TalkEx("",strTalk);
			SetTask(TASK_XB_ID_01,64);
			TaskTip("LÊy ®­îc ph¸p khÝ ¶o ¶nh, h·y ®Õn Mª cung sa m¹c nhê B¹ch Thiªn Thµnh t×m ¶o ¶nh.");
			Msg2Player("LÊy ®­îc ph¸p khÝ ¶o ¶nh, h·y ®Õn Mª cung sa m¹c nhê B¹ch Thiªn Thµnh t×m ¶o ¶nh.");
			GivePlayerAward("Award_XB_53","Easy");
			return
		end
		if GetTask(TASK_XB_ID_01) >= 64 and GetTask(TASK_XB_ID_01) <= 66 then --»¹Ã»´ò°Ü»ÃÏóÇ°µôÂä»ÃÏó·¨Æ÷
			if GetItemCount(2,0,733) == 0 then
				AddItem(2,0,733,1,1);--»ÃÏó·¨Æ÷
				return
			end
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
      if GetTask(TASK_XB_ID_01) >= 64 and GetTask(TASK_XB_ID_01) <= 66 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then --»¹Ã»´ò°Ü»ÃÏóÇ°µôÂä»ÃÏó·¨Æ÷
				if GetItemCount(2,0,733) == 0 then
				AddItem(2,0,733,1,1);--»ÃÏó·¨Æ÷
				return
			end
			end;
			if GetTask(TASK_XB_ID_01) == 63 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				AddItem(2,0,733,1,1);--»ÃÏó·¨Æ÷
				TalkEx("",strTalk);
				SetTask(TASK_XB_ID_01,64);
				TaskTip("LÊy ®­îc ph¸p khÝ ¶o ¶nh, h·y ®Õn Mª cung sa m¹c nhê B¹ch Thiªn Thµnh t×m ¶o ¶nh.");
				Msg2Player("LÊy ®­îc ph¸p khÝ ¶o ¶nh, h·y ®Õn Mª cung sa m¹c nhê B¹ch Thiªn Thµnh t×m ¶o ¶nh.");
				GivePlayerAward("Award_XB_53","Easy");
			end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
  end;
end
