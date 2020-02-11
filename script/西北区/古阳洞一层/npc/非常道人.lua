-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ¹ÅÑô¶´Ò»²ãNPC·Ç³£µÀÈËScript
-- By StarryNight
-- 2007/06/21 PM 3:27

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
	"Cã 1 bøc \'MËt th­ T©y H¹\', xem thö néi dung g×…",
	"MËt th­ T©y H¹: Cßn 3 ngµy n÷a lµ ng­¬i sÏ thu phôc ®­îc Cæ D­¬ng dÞ thó, lóc ®ã T©y H¹ sÏ gióp ng­¬i ph¶n c«ng C«n L«n, nÕu ng­¬i cã ®­îc chøc tr­ëng m«n C«n L«n, T©y H¹ chØ lÊy ph­¬ng ph¸p luyÖn Tr­êng Sinh BÊt L·o ®¬n, th­ nµy lµm chøng, göi Phi Th­êng §¹o Nh©n.",
	"Kh«ng ngê Phi Th­êng §¹o Nh©n l¹i cã quan hÖ víi NhÊt PhÈm ®­êng, ®em M¶nh Háa LuyÖn Kim §¬n vÒ giao cho DiÖp Tö Thu cã lÏ sÏ hiÓu ®­îc néi t×nh."
	}

	--SetNpcLifeTime(index,15);--Ê¹µÃÊ¬ÌåÏûÊ§
	
	if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó
		if GetTask(TASK_XB_ID_02) == 14 then
			AddItem(2,0,700,1,1);--´òµ¹·Ç³£µÀÈËµÃµ½»ðÁ¶½ðµ¤ËéÆ¬
			AddItem(2,0,701,1,1);--´òµ¹·Ç³£µÀÈËµÃµ½Î÷ÏÄÃÜÐÅ
			TalkEx("",strTalk);
			SetTask(TASK_XB_ID_02,15);
			TaskTip("§· ®¸nh b¹i Phi Th­êng §¹o Nh©n, trë vÒ C«n L«n t×m DiÖp Tö Thu.");
			Msg2Player("§· ®¸nh b¹i Phi Th­êng §¹o Nh©n, trë vÒ C«n L«n t×m DiÖp Tö Thu.");
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
			if GetTask(TASK_XB_ID_02) == 14 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				AddItem(2,0,700,1,1);--´òµ¹·Ç³£µÀÈËµÃµ½»ðÁ¶½ðµ¤ËéÆ¬
				AddItem(2,0,701,1,1);--´òµ¹·Ç³£µÀÈËµÃµ½Î÷ÏÄÃÜÐÅ
				TalkEx("",strTalk); 
				SetTask(TASK_XB_ID_02,15);
				TaskTip("§· ®¸nh b¹i Phi Th­êng §¹o Nh©n, trë vÒ C«n L«n t×m DiÖp Tö Thu.");
				Msg2Player("§· ®¸nh b¹i Phi Th­êng §¹o Nh©n, trë vÒ C«n L«n t×m DiÖp Tö Thu.");
			end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
  end;
end
