-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ´óÀíÈÎÎñNPCÑªÁÛ¶¾òþÕÙ»½ºÍËÀÍöScript
-- By StarryNight
-- 2005/12/31 PM 14:30

--ÒÒÓÏÄê  Îì×ÓÔÂ ¼º³óÈÕ 
--ÒË: ÄÉ²É ¶©ÃË ¼ÞÈ¢ ¼Àìë Æí¸£ °²Ïã ³ö»ð ³öÐÐ »áÇ×ÓÑ ¾­Âç ÇóÒ½ ÖÎ²¡ ½â³ý ²ðÐ¶ Æð»ù ÐÞÔì ¶¯ÍÁ ¶¨íß É¨Éá ÔÔÖÖ ÄÁÑø ÔìÐó³í 
--¼É: Õ«õ´ ×÷Áº ¾ò¾® ÐÐÉ¥ °²Ôá 
--¼ªÉñÒËÇ÷: ÒõµÂ ÊØÈÕ ¼ªÆÚ ÁùºÏ ²»½« ÆÕ»¤ ±¦¹â  
--Ð×ÉñÒË¼É: ËÄÀë ÈþÉ¥  
--Ã¿ÈÕÌ¥ÉñÕ¼·½: Õ¼ÃÅ²ÞÍâÕý±± 
--ÎåÐÐ: Åùö¨»ð  ³ýÖ´Î» 
--³å: ³åÑò(¹ïÎ´)É·¶« 
--Åí×æ°Ù¼É: ¼º²»ÆÆÈ¯¶þ±È²¢Íö ³ó²»¹Ú´øÖ÷²»»¹Ïç 

-- ======================================================
-- ÒýÓÃ¾çÇéÈÎÎñÎÄ¼þ
Include("\\script\\task\\world\\´óÀí\\task_head.lua");
Include("\\script\\task\\world\\´óÀí\\lv20\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnUse()

local nMapID,nWx,nWy = GetWorldPos();
local nTime = GetTime() - GetTask(1321);

	if nMapID == 407 and GetFightState() == 1 then
		if GetTask(TASK_DL_LV20_ID) == 3 then
			if nTime >= 3600 then
				local nDMIndex = CreateNpc("HuyÕt L©n §éc M·ng","HuyÕt L©n §éc M·ng",nMapID,nWx,nWy,-1,1,1,50);
				SetNpcLifeTime(nDMIndex,900); 
				SetNpcScript(nDMIndex,"\\script\\task\\world\\´óÀí\\Lv20\\ÑªÁÛ¶¾òþ.lua");
				ChangeNpcToFight(nDMIndex);
				TaskTip("B¹n ®· gäi ®­îc §éc m·ng, mau giÕt chóng.");
				Msg2Player("B¹n ®· gäi ®­îc §éc m·ng, mau giÕt chóng.");
				DelItem(2,0,365,1);--Ò©Ñª
				SetTask(1321,GetTime());
				return
			else
				local strTalk = {
					"Mçi lÇn gäi §éc m·ng, c¸ch mét giê sau míi cã thÓ gäi l¹i."
				};
				TalkEx("",strTalk);
			end
		else	
			return
		end
	else
		local strTalk = {
			"ë ®©y kh«ng thÓ gäi HuyÕt L©n §éc M·ng!"
		};
		TalkEx("",strTalk);
		end;
	return
end;

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();
		
	SetNpcLifeTime(index,15);--Ê¹µÃÊ¬ÌåÏûÊ§
	
	if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó
		if GetTask(TASK_DL_LV20_ID) == 3 then
			SetTask(TASK_DL_LV20_ID,4);
			TaskTip("DiÖt ®­îc HuyÕt L©n §éc m·ng, quay vÒ gÆp Cao Th¨ng TuyÒn.");
			Msg2Player("DiÖt ®­îc HuyÕt L©n §éc m·ng, quay vÒ gÆp Cao Th¨ng TuyÒn.");
		end;	
  else
    for i=1,nMemCount do
       PlayerIndex = GetTeamMember(i);
       local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
       local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
       if GetTask(TASK_DL_LV20_ID) == 3 and nDist >= 0 and nDist <= 50 then
       	SetTask(TASK_DL_LV20_ID, 4);
       	Msg2Player("DiÖt ®­îc HuyÕt L©n §éc m·ng, quay vÒ gÆp Cao Th¨ng TuyÒn.");
       	TaskTip("DiÖt ®­îc HuyÕt L©n §éc m·ng, quay vÒ gÆp Cao Th¨ng TuyÒn.");
       end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
  end;
end