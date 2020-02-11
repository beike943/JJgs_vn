-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII »ÊÁêÄ¹ÊÒÒ»²ãNPC×¦ÍõScript
-- By StarryNight
-- 2007/06/29 PM 16:55

-- ĞÄÆ½ÆøºÍÒ»µã (*^__^*) ÎûÎû¡­¡­

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();
local strTalk = {
	"LÊy ®­îc Ph¸ Phong Chïy, chØ cÇn dïng La Canh t×m ra huyÖt phong thñy th× cã thÓ dïng chïy ®Ó më c¸nh cöa tÇng 2."
	}

	--SetNpcLifeTime(index,15);--Ê¹µÃÊ¬ÌåÏûÊ§
	
	if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó
		if GetTask(TASK_XB_ID_01) == 23 then
			AddItem(2,0,715,1,1);--´òµ¹×¦ÍõµÃµ½ÆÆ·çé³
			AddItem(2,0,716,1,1);--´òµ¹×¦ÍõµÃµ½Î÷ÏÄ·¨ÍõÃÜº¯
			AddItem(2,0,717,1,1);--´òµ¹×¦ÍõµÃµ½·Ç³£µÀ·û
			TalkEx("",strTalk);
			SetTask(TASK_XB_ID_01,24);
			TaskTip("H×nh nh­ cã tin tøc trong mËt hµm nµy mau më ra xem.");
			Msg2Player("H×nh nh­ cã tin tøc trong mËt hµm nµy mau më ra xem.");
			GivePlayerAward("Award_XB_31","Easy");
		end;
		if GetTask(TASK_XB_ID_01) == 24 and GetItemCount(2,0,715) < 1 then
			AddItem(2,0,715,1,1);--´òµ¹×¦ÍõµÃµ½ÆÆ·çé³
		end
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
			if GetTask(TASK_XB_ID_01) == 23 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				AddItem(2,0,715,1,1);--´òµ¹×¦ÍõµÃµ½ÆÆ·çé³
				AddItem(2,0,716,1,1);--´òµ¹×¦ÍõµÃµ½Î÷ÏÄ·¨ÍõÃÜº¯
				AddItem(2,0,717,1,1);--´òµ¹×¦ÍõµÃµ½·Ç³£µÀ·û
				TalkEx("",strTalk); 
				SetTask(TASK_XB_ID_01,24);
				TaskTip("H×nh nh­ cã tin tøc trong mËt hµm nµy mau më ra xem.");
				Msg2Player("H×nh nh­ cã tin tøc trong mËt hµm nµy mau më ra xem.");
				GivePlayerAward("Award_XB_31","Easy");
			end;
			if GetTask(TASK_XB_ID_01) == 24 and GetItemCount(2,0,715) < 1 then
				AddItem(2,0,715,1,1);--´òµ¹×¦ÍõµÃµ½ÆÆ·çé³
			end
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
  end;
end
