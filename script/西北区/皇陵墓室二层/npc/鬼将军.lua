-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII »ÊÁêÄ¹ÊÒ¶þ²ãNPC¹í½«¾üScript
-- By StarryNight
-- 2007/08/03 PM 08:15

-- Óë¹ÅÄ¹Í¬Ãß¡­¡­

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
	"Ch¼ng lÏ ®©y lµ MÆc §Êu KiÕm? Ngäc béi nµy lµ g×? Sao kh«ng thÊy mËt ®å Thiªn Hµ X· T¾c? Tr¶o V­¬ng ®· ®Òn téi, kh«ng ai cña NhÊt PhÈm §­êng vµo tÇng 2. Nh÷ng vËt nµy nhÊt ®Þnh cã liªn quan tíi vî cña T­ M· tiÒn bèi, tèt nhÊt nªn hái «ng ta tr­íc."
	};

	SetNpcLifeTime(index,15);--Ê¹µÃÊ¬ÌåÏûÊ§
	
	if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó
		if GetTask(TASK_XB_ID_01) == 27 then
			DelItem(2,0,717,1);--É¾È¥·Ç³£µÀ·û
			AddItem(2,0,718,1,1);--»ñµÃÄ«¶·
			AddItem(2,0,719,1,1);--»ñµÃÓñÅå
			TalkEx("",strTalk);
			SetTask(TASK_XB_ID_01,28);
			SetTask(CREAT_GUIJIANGJUN_TIME,0);--Çå³ý¹í½«¾üË¢ÐÂÊ±¼ä±äÁ¿
			TaskTip("Mang cho T­ M· Minh Phong nh÷ng vËt cã trong b¶o r­¬ng.");
			Msg2Player("Mang cho T­ M· Minh Phong nh÷ng vËt cã trong b¶o r­¬ng.");
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
			if GetTask(TASK_XB_ID_01) == 27 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				DelItem(2,0,717,1);--É¾È¥·Ç³£µÀ·û
				AddItem(2,0,718,1,1);--»ñµÃÄ«¶·
				AddItem(2,0,719,1,1);--»ñµÃÓñÅå
				TalkEx("",strTalk); 
				SetTask(TASK_XB_ID_01,28);
				SetTask(CREAT_GUIJIANGJUN_TIME,0);--Çå³ý¹í½«¾üË¢ÐÂÊ±¼ä±äÁ¿
				TaskTip("Mang cho T­ M· Minh Phong nh÷ng vËt cã trong b¶o r­¬ng.");
				Msg2Player("Mang cho T­ M· Minh Phong nh÷ng vËt cã trong b¶o r­¬ng.");
			end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
  end;
end
