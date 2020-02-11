-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ÇØÊ¼»ÊÁêNPC¶Ï±ÛScript
-- By StarryNight
-- 2007/06/26 PM 4:12

-- °²°²¾²¾²µØ£¬°²°²¾²¾²µØÉú»î¡­¡­

-- ======================================================

-- ÒýÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼þ
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();
local strTalk = {};

	--SetNpcLifeTime(index,15);--Ê¹µÃÊ¬ÌåÏûÊ§
	
	if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó
		if GetTask(TASK_XB_ID_01) == 13 then
			--µÚÒ»´ÎÉ±ËÀ¶Ï±Û
			if GetTask(DUANBI_DEAD_STATE) == 0 then
				AddItem(2,0,750,1,1);--´òµ¹¶Ï±ÛµÃµ½Ò»Æ·½ð¸ÕÁîÖ®¶Ï±Û
				SetTask(DUANBI_DEAD_STATE,1);
				--»¹Ã»É±ËÀ²ÐÍÈ
				if GetTask(CANTUI_DEAD_STATE) == 0 then
					strTalk = {};
					--TalkEx("",strTalk);
					TaskTip("§i tiªu diÖt nèt nh÷ng tªn cßn l¹i.");
					Msg2Player("§i tiªu diÖt nèt nh÷ng tªn cßn l¹i.");
				--ÒÑ¾­É±ËÀ²ÐÍÈ
				elseif GetTask(CANTUI_DEAD_STATE) == 1 then
					strTalk = {};
					--TalkEx("",strTalk);
					SetTask(TASK_XB_ID_01,14);--»ØÈ¥ÕÒ³µÂÖ°ÔÍõ
					TaskTip("§· gi¶i quyÕt xong nh÷ng tªn cßn l¹i nªn quay vÒ t×m Xa Lu©n B¸ V­¬ng.");
					Msg2Player("§· gi¶i quyÕt xong nh÷ng tªn cßn l¹i nªn quay vÒ t×m Xa Lu©n B¸ V­¬ng.");
				end
			--Ö®Ç°ÒÑ¾­É±ËÀ¶Ï±Û
			elseif GetTask(CANTUI_DEAD_STATE) == 0 then
				strTalk = {};
				--TalkEx("",strTalk);
				TaskTip("§i tiªu diÖt nèt nh÷ng tªn cßn l¹i.");
				Msg2Player("§i tiªu diÖt nèt nh÷ng tªn cßn l¹i.");
			elseif GetTask(CANTUI_DEAD_STATE) == 1 then
				strTalk = {};
				--TalkEx("",strTalk);
				SetTask(TASK_XB_ID_01,14);--»ØÈ¥ÕÒ³µÂÖ°ÔÍõ
				TaskTip("§· gi¶i quyÕt xong nh÷ng tªn cßn l¹i nªn quay vÒ t×m Xa Lu©n B¸ V­¬ng.");
				Msg2Player("§· gi¶i quyÕt xong nh÷ng tªn cßn l¹i nªn quay vÒ t×m Xa Lu©n B¸ V­¬ng.");
			end
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
			if GetTask(TASK_XB_ID_01) == 13 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
			--µÚÒ»´ÎÉ±ËÀ¶Ï±Û
			if GetTask(DUANBI_DEAD_STATE) == 0 then
				AddItem(2,0,750,1,1);--´òµ¹¶Ï±ÛµÃµ½Ò»Æ·½ð¸ÕÁîÖ®¶Ï±Û
				SetTask(DUANBI_DEAD_STATE,1);
				--»¹Ã»É±ËÀ²ÐÍÈ
				if GetTask(CANTUI_DEAD_STATE) == 0 then
					strTalk = {};
					--TalkEx("",strTalk);
					TaskTip("§i tiªu diÖt nèt nh÷ng tªn cßn l¹i.");
					Msg2Player("§i tiªu diÖt nèt nh÷ng tªn cßn l¹i.");
				--ÒÑ¾­É±ËÀ²ÐÍÈ
				elseif GetTask(CANTUI_DEAD_STATE) == 1 then
					strTalk = {};
					--TalkEx("",strTalk);
					SetTask(TASK_XB_ID_01,14);--»ØÈ¥ÕÒ³µÂÖ°ÔÍõ
					TaskTip("Quay vÒ t×m Xa Lu©n B¸ V­¬ng");
					Msg2Player("Quay vÒ t×m Xa Lu©n B¸ V­¬ng");
				end
			--Ö®Ç°ÒÑ¾­É±ËÀ¶Ï±Û
			elseif GetTask(CANTUI_DEAD_STATE) == 0 then
				strTalk = {};
				--TalkEx("",strTalk);
				TaskTip("§i tiªu diÖt nèt nh÷ng tªn cßn l¹i.");
				Msg2Player("§i tiªu diÖt nèt nh÷ng tªn cßn l¹i.");
			elseif GetTask(CANTUI_DEAD_STATE) == 1 then
				strTalk = {};
				--TalkEx("",strTalk);
				SetTask(TASK_XB_ID_01,14);--»ØÈ¥ÕÒ³µÂÖ°ÔÍõ
				TaskTip("§· gi¶i quyÕt xong nh÷ng tªn cßn l¹i nªn quay vÒ t×m Xa Lu©n B¸ V­¬ng.");
				Msg2Player("§· gi¶i quyÕt xong nh÷ng tªn cßn l¹i nªn quay vÒ t×m Xa Lu©n B¸ V­¬ng.");
			end
		end;
	end;
	PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
  end;
end
