-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ´óÀíÈÎÎñNPCÑªÁÛ¶¾òşÕÙ»½ºÍËÀÍöScript
-- By StarryNight
-- 2006/01/09 PM 14:40

--ÒÒÓÏÄê  Îì×ÓÔÂ ¼º³óÈÕ 
--ÒË: ÄÉ²É ¶©ÃË ¼ŞÈ¢ ¼Àìë Æí¸£ °²Ïã ³ö»ğ ³öĞĞ »áÇ×ÓÑ ¾­Âç ÇóÒ½ ÖÎ²¡ ½â³ı ²ğĞ¶ Æğ»ù ĞŞÔì ¶¯ÍÁ ¶¨íß É¨Éá ÔÔÖÖ ÄÁÑø ÔìĞó³í 
--¼É: Õ«õ´ ×÷Áº ¾ò¾® ĞĞÉ¥ °²Ôá 
--¼ªÉñÒËÇ÷: ÒõµÂ ÊØÈÕ ¼ªÆÚ ÁùºÏ ²»½« ÆÕ»¤ ±¦¹â  
--Ğ×ÉñÒË¼É: ËÄÀë ÈşÉ¥  
--Ã¿ÈÕÌ¥ÉñÕ¼·½: Õ¼ÃÅ²ŞÍâÕı±± 
--ÎåĞĞ: Åùö¨»ğ  ³ıÖ´Î» 
--³å: ³åÑò(¹ïÎ´)É·¶« 
--Åí×æ°Ù¼É: ¼º²»ÆÆÈ¯¶ş±È²¢Íö ³ó²»¹Ú´øÖ÷²»»¹Ïç 

-- ======================================================
-- ÒıÓÃ¾çÇéÈÎÎñÎÄ¼ş
Include("\\script\\task\\world\\´óÀí\\task_head.lua");
Include("\\script\\task\\world\\´óÀí\\lv10\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnUse()

local nMapID,nWx,nWy = GetWorldPos();

	if nMapID == 420 and GetTask(TASK_DL_LV45_ID) == 2 then
		local nLSIndex = CreateNpc("Miªu LÜnh Lùc SÜ","Miªu LÜnh Lùc SÜ",nMapID,nWx,nWy,-1,1,1,50);
		SetNpcLifeTime(nLSIndex,900); 
		SetNpcScript(nLSIndex,"\\script\\task\\world\\´óÀí\\Lv10\\ÃçÁëÁ¦Ê¿.lua");
		ChangeNpcToFight(nLSIndex);
		TaskTip("B¹n ®· gäi ®­îc sø gi¶ Miªu LÜnh, mau giÕt h¾n.");
		Msg2Player("B¹n ®· gäi ®­îc sø gi¶ Miªu LÜnh, mau giÕt h¾n.");
		DelItem(2,0,367,1);--É¾È¥Á¦Ê¿ĞÅÉÚ
		return
	else
		local strTalk = {
			"Ph¶i ®Õn YÕn Tö §éng tÇng 1 míi dïng ®­îc Tİn tiªu nµy gäi Miªu LÜnh Lùc SÜ"
		};
		TalkEx("",strTalk);
	end;
end;

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();

	SetNpcLifeTime(index,15);--Ê¹µÃÊ¬ÌåÏûÊ§
	
	if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó
		if GetTask(TASK_DL_LV45_ID) == 2 then
			AddItem(2,0,369,1);--´òµ¹ÃçÁëÁ¦Ê¿µÃµ½Ò»·âĞÅ
			SetTask(TASK_DL_LV45_ID,3);
			TaskTip("§em th­ vÒ cho TrŞnh Qu¸n Chi");
			Msg2Player("§em th­ vÒ cho TrŞnh Qu¸n Chi");
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
			if GetTask(TASK_DL_LV45_ID) == 2 then
				AddItem(2,0,369,1);--´òµ¹ÃçÁëÁ¦Ê¿µÃµ½Ò»·âĞÅ 
				SetTask(TASK_DL_LV45_ID,3);
				TaskTip("§em th­ vÒ cho TrŞnh Qu¸n Chi");
				Msg2Player("§em th­ vÒ cho TrŞnh Qu¸n Chi");
			end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
  end;
end
