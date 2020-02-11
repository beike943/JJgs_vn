-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Î÷±±ÈÎÎñNPCÑªÄ§ÈËÕÙ»½ºÍËÀÍöScript
-- By StarryNight
-- 2007/08/08 AM 10:31

-- ======================================================
-- ÒýÓÃ¾çÇéÈÎÎñÎÄ¼þ
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnUse()

local nMapID,nWx,nWy = GetWorldPos();
local nTime = GetTime() - GetTask(CREAT_XUEMOREN_TIME);
local strTalk = {};

	if nMapID == 512 and GetFightState() == 1 then
		if GetTask(TASK_XB_ID_02) == 19 then
			if nTime >= 1800 then
				local nYHIndex = CreateNpc("HuyÕt Ma Nh©n","HuyÕt Ma Nh©n",nMapID,nWx,nWy,-1,1,1,50);
				SetNpcLifeTime(nYHIndex,900); 
				SetNpcScript(nYHIndex,"\\script\\Î÷±±Çø\\¹ÅÑô¶´¶þ²ã\\npc\\ÑªÄ§ÈË.lua");
				TaskTip("B¹n ®· triÖu gäi HuyÕt Ma Nh©n h·y tiªu diÖt nã.");
				Msg2Player("B¹n ®· triÖu gäi HuyÕt Ma Nh©n h·y tiªu diÖt nã.");
				DelItem(2,0,706,1);--¾ÛÁéØ°Ê×
				SetTask(CREAT_XUEMOREN_TIME,GetTime());
				return
			else
				strTalk = {
					"Sau mçi lÇn triÖu gäi HuyÕt Ma Nh©n chê 30 phót míi ®­îc lÆp l¹i."
				};
				TalkEx("",strTalk);
			end
		else
			strTalk = {
				"Xem ra con dao nµy kh«ng cßn t¸c dông råi chi b»ng vøt ®i. ",
				}	
			TalkEx("",strTalk);
			DelItem(2,0,706,1);--¾ÛÁéØ°Ê×
			return
		end
	elseif GetTask(TASK_XB_ID_02) == 19 then
		strTalk = {
			"Theo lêi cña DiÖp Tö Thu th× con dao nµy ph¶i hîp víi HuyÕt Hån Tinh Ph¸ch trong Cæ D­¬ng ®éng_2 míi cã thÓ triÖu gäi Ma vËt trong bông Cæ D­¬ng Thó."
			};
			TalkEx("",strTalk);
	else
		strTalk = {
				"Xem ra con dao nµy kh«ng cßn t¸c dông råi chi b»ng vøt ®i. ",
				}	
		TalkEx("",strTalk);
		DelItem(2,0,706,1);--¾ÛÁéØ°Ê×
	end
end;

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();
		
	SetNpcLifeTime(index,15);--Ê¹µÃÊ¬ÌåÏûÊ§
	
	if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó
		if GetTask(TASK_XB_ID_02) == 19 then
			DelItem(2,0,705,1);--Ñª»ê¾§ÆÇ
			AddItem(2,0,707,1,1);--°ë¿éÓñÅå
			SetTask(TASK_XB_ID_02,20);
			SetTask(CREAT_YUANHUNZHIWANG_TIME,0);--Çå¿ÕÊ±¼ä¼ÇÂ¼
			TaskTip("§· tiªu diÖt HuyÕt Ma Nh©n, vÒ C«n L«n b¸o cho DiÖp Tö Thu.");
			Msg2Player("§· tiªu diÖt HuyÕt Ma Nh©n, vÒ C«n L«n b¸o cho DiÖp Tö Thu.");
		end;	
  else
    for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
      if GetTask(TASK_XB_ID_02) == 19 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				DelItem(2,0,705,1);--Ñª»ê¾§ÆÇ
				AddItem(2,0,707,1,1);--°ë¿éÓñÅå
				SetTask(TASK_XB_ID_02,20);
				SetTask(CREAT_YUANHUNZHIWANG_TIME,0);--Çå¿ÕÊ±¼ä¼ÇÂ¼
				TaskTip("§· tiªu diÖt HuyÕt Ma Nh©n, vÒ C«n L«n b¸o cho DiÖp Tö Thu.");
				Msg2Player("§· tiªu diÖt HuyÕt Ma Nh©n, vÒ C«n L«n b¸o cho DiÖp Tö Thu.");
      end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
  end;
end