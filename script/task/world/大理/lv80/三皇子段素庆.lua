-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ´óÀíÈÎÎñNPC´óÀíÈý»Ê×Ó£¬ÁúÏó·¨É®ÕÙ»½ºÍËÀÍöScript
-- By StarryNight
-- 2006/01/13 PM 21:07

--ÒÒÓÏÄê  Îì×ÓÔÂ ¼º³óÈÕ 

-- ======================================================
-- ÒýÓÃ¾çÇéÈÎÎñÎÄ¼þ
Include("\\script\\task\\world\\´óÀí\\task_head.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnUse()

local nMapID,nWx,nWy = GetWorldPos();

	if nMapID == 411 then
		local n3HZIndex = CreateNpc("Tam Hoµng Tö §¹i Lý","Tam Hoµng Tö §oµn Tè Kh¸nh",nMapID,nWx,nWy,-1,1,1,70);
		local nFS1Index = CreateNpc("Long T­îng Ph¸p T¨ng","Long T­îng Ph¸p T¨ng",nMapID,nWx,nWy,-1,1,1,70);
		local nFS2Index = CreateNpc("Long T­îng Ph¸p T¨ng","Long Hæ ph¸p t¨ng",nMapID,nWx,nWy,-1,1,1,70);
		SetNpcLifeTime(n3HZIndex,1200);
		SetNpcLifeTime(nFS1Index,1200);
		SetNpcLifeTime(nFS2Index,1200);
		SetNpcScript(n3HZIndex,"\\script\\task\\world\\´óÀí\\Lv80\\Èý»Ê×Ó¶ÎËØÇì.lua");
		SetNpcScript(nFS1Index,"\\script\\task\\world\\´óÀí\\Lv80\\ÁúÏó·¨É®.lua");
		SetNpcScript(nFS2Index,"\\script\\task\\world\\´óÀí\\Lv80\\ÁúÏó·¨É®.lua");
		ChangeNpcToFight(n3HZIndex);
		ChangeNpcToFight(nFS1Index);
		ChangeNpcToFight(nFS2Index);
		TaskTip("Tam Hoµng Tö ®· xuÊt hiÖn, mau b¾t l¹i!");
		Msg2Player("Tam Hoµng Tö ®· xuÊt hiÖn, mau b¾t l¹i!");
		DelItem(2,0,384,1);--É¾µôÕÙ»½Îï¼þ
		return
	else
		local strTalk = {
			"ë ®©y kh«ng thÓ dïng ph¸o!"
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
        if GetTask(TASK_DL_LV80_ID) == 8 then
        	SetTask(TASK_DL_LV80_ID, 9);
        	Msg2Player("§· ®¸nh b¹i Tam Hoµng Tö, quay vÒ §¹i Lý håi b¸o §æng Quèc S­.");
        	TaskTip("§· ®¸nh b¹i Tam Hoµng Tö, quay vÒ §¹i Lý håi b¸o §æng Quèc S­.");
        end;
    else
        for i=1,nMemCount do
           PlayerIndex = GetTeamMember(i);
           local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
           local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
           if GetTask(TASK_DL_LV80_ID) == 8 and nDist >= 0 and nDist <= 50 then
           	SetTask(TASK_DL_LV80_ID, 9);
           	Msg2Player("§· ®¸nh b¹i Tam Hoµng Tö, quay vÒ §¹i Lý håi b¸o §æng Quèc S­.");
           	TaskTip("§· ®¸nh b¹i Tam Hoµng Tö, quay vÒ §¹i Lý håi b¸o §æng Quèc S­.");
           end;
				end;
		PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
    end;
end