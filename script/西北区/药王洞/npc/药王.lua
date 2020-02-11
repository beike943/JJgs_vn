-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Ò©Íõ¶´NPCÒ©ÍõScript
-- By StarryNight
-- 2007/08/06 PM 9:26

-- ÆäÊµÒ©ÈËÖ»²»¹ýÊÇÐ¡°ÑÏ·¶øÒÑ£¬ÕæÕýµÄÏ·ÓñÊÇ×³ÑôÒ©£¡

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
	"Ta ®· chuÈn bÞ cho ng­êi 100 d­îc nh©n. D­îc Nh©n d­îc ph­¬ng nghiÖp ®· phèi thµnh, ®Òu dïng nguyªn liªu D­îc Nh©n Th¶o trong d­îc v­¬ng ®éng.",
	"Kh«ng hay råi, T©y H¹ muèn t¹o ra ®éi qu©n D­îc Nh©n, giê ph­¬ng thuèc ®· n»m trong tay ta, ph¶i vÒ gÆp ¢u D­¬ng tiÒn bèi.",
	}

	SetNpcLifeTime(index,15);--Ê¹µÃÊ¬ÌåÏûÊ§
	
	if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó
		if GetTask(TASK_XB_ID_01) == 47 then
			SetTask(CREAT_YAOWANG_TIME,0);--Ë¢ÐÂÒ©ÍõÊ±¼äÇåÁã
			AddItem(2,0,726,1,1);--´òµ¹Ò©ÍõµÃµ½Ò©ÈËÒ©·½
			AddItem(2,0,727,1,1);--Î÷ÏÄ·¨ÍõÊéº¯
			DelItem(2,0,760,1);--É¾È¥Ò©ÍõÒ×ÈÝ×°
			TalkEx("",strTalk);
			SetTask(TASK_XB_ID_01,48);
			TaskTip("Håi b¸o ¢u D­¬ng Häa, T©y H¹ Cèc t×m ph­¬ng thuèc D­îc V­¬ng t¹o ra ®éi qu©n D­îc Nh©n, viÖc nµy v« cïng cÊp b¸ch.");
			Msg2Player("Håi b¸o ¢u D­¬ng Häa, T©y H¹ Cèc t×m ph­¬ng thuèc D­îc V­¬ng t¹o ra ®éi qu©n D­îc Nh©n, viÖc nµy v« cïng cÊp b¸ch.");
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
			if GetTask(TASK_XB_ID_01) == 47 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				SetTask(CREAT_YAOWANG_TIME,0);--Ë¢ÐÂÒ©ÍõÊ±¼äÇåÁã
				AddItem(2,0,726,1,1);--´òµ¹Ò©ÍõµÃµ½Ò©ÈËÒ©·½
				AddItem(2,0,727,1,1);--Î÷ÏÄ·¨ÍõÊéº¯
				TalkEx("",strTalk); 
				SetTask(TASK_XB_ID_01,48);
				TaskTip("Håi b¸o ¢u D­¬ng Häa, T©y H¹ Cèc t×m ph­¬ng thuèc D­îc V­¬ng t¹o ra ®éi qu©n D­îc Nh©n, viÖc nµy v« cïng cÊp b¸ch.");
				Msg2Player("Håi b¸o ¢u D­¬ng Häa, T©y H¹ Cèc t×m ph­¬ng thuèc D­îc V­¬ng t¹o ra ®éi qu©n D­îc Nh©n, viÖc nµy v« cïng cÊp b¸ch.");
			end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
  end;
end
