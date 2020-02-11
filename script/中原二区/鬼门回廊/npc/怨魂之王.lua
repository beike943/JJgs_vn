-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Î÷±±ÈÎÎñNPCÔ¹»êÖ®ÍõÕÙ»½ºÍËÀÍöScript
-- By StarryNight
-- 2007/08/07 PM 10:23

-- ======================================================
-- ÒýÓÃ¾çÇéÈÎÎñÎÄ¼þ
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnUse()

local nMapID,nWx,nWy = GetWorldPos();
local nTime = GetTime() - GetTask(CREAT_YUANHUNZHIWANG_TIME);
	
	if nMapID == 328 and GetFightState() == 1 then
		if GetTask(TASK_XB_ID_02) == 4 then
			if nTime >= 1800 then
				local nYHIndex = CreateNpc("Chóa O¸n Hån","Chóa O¸n Hån",nMapID,nWx,nWy,-1,1,1,50);
				SetNpcLifeTime(nYHIndex,900); 
				SetNpcScript(nYHIndex,"\\script\\ÖÐÔ­¶þÇø\\¹íÃÅ»ØÀÈ\\npc\\Ô¹»êÖ®Íõ.lua");
				TaskTip("Ng­¬i ®· dÉn Chóa O¸n Hån ra thµnh c«ng, mau giÕt nã");
				Msg2Player("Ng­¬i ®· dÉn Chóa O¸n Hån ra thµnh c«ng, mau giÕt nã");
				DelItem(2,0,757,1);--¹Â»êé×
				SetTask(CREAT_YUANHUNZHIWANG_TIME,GetTime());
				return
			else
				strTalk = {
					"C¸ch 30 phót lµ dÉn Chóa O¸n Hån ra mét lÇn!"
				};
				TalkEx("",strTalk);
			end
		else
			strTalk = {
				"Xem ra t¸c dông cña b×nh nµy kh«ng lín, hay lµ vøt nã ®i.",
				}	
			TalkEx("",strTalk);
			DelItem(2,0,757,1);--¹Â»êé×
			return
		end
	elseif GetTask(TASK_XB_ID_02) == 4 then
		strTalk = {
			"H×nh nh­ kh«ng cã hiÖu qu¶ g×, theo C«n L«n m«n nh©n nãi, b×nh nµy nªn më t¹i Quû M«n Håi Lang, phßng C« Hån sÏ dÉn Chóa O¸n Hån ra."
			};
			TalkEx("",strTalk);
	else
		strTalk = {
				"Xem ra t¸c dông cña b×nh nµy kh«ng lín, hay lµ vøt nã ®i.",
				}	
		TalkEx("",strTalk);
		DelItem(2,0,757,1);--¹Â»êé×
	end
	
end;

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();
		
	SetNpcLifeTime(index,15);--Ê¹µÃÊ¬ÌåÏûÊ§
	
	if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó
		if GetTask(TASK_XB_ID_02) == 4 then
			AddItem(2,0,717,1,1);--·Ç³£µÀ·û
			SetTask(TASK_XB_ID_02,5);
			SetTask(CREAT_YUANHUNZHIWANG_TIME,0);--Çå¿ÕÊ±¼ä¼ÇÂ¼
			TaskTip("GiÕt Chóa O¸n Hån thµnh c«ng, mau nãi cho §Ö tö C«n L«n bÞ th­¬ng biÕt.");
			Msg2Player("GiÕt Chóa O¸n Hån thµnh c«ng, mau nãi cho §Ö tö C«n L«n bÞ th­¬ng biÕt.");
		end;	
  else
    for i=1,nMemCount do
       PlayerIndex = GetTeamMember(i);
       local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
       local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
       if GetTask(TASK_XB_ID_02) == 4 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
       	SetTask(TASK_XB_ID_02,5);
       	AddItem(2,0,717,1,1);--·Ç³£µÀ·û
				SetTask(CREAT_YUANHUNZHIWANG_TIME,0);--Çå¿ÕÊ±¼ä¼ÇÂ¼
				TaskTip("GiÕt Chóa O¸n Hån thµnh c«ng, mau nãi cho §Ö tö C«n L«n bÞ th­¬ng biÕt.");
				Msg2Player("GiÕt Chóa O¸n Hån thµnh c«ng, mau nãi cho §Ö tö C«n L«n bÞ th­¬ng biÕt.");
       end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
  end;
end