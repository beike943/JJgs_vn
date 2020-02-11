-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII É³Ä®ÃÔ¹¬NPCÎåÐÐÊ¹½ðScript
-- By StarryNight
-- 2007/08/07 PM 04:48

-- ======================================================

-- ÒýÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼þ
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();
local nBossState = {0,0,0,0,0}
local nBossName = {" Kim ","Méc","Thñy","Háa","Thæ"}
local strTalk = {
	"B¹n ®· ®¸nh b¹i Ngò Hµnh Sø, vÒ th«ng b¸o cho Th¸c B¹t Ho»ng."
	}

	SetNpcLifeTime(index,15);--Ê¹µÃÊ¬ÌåÏûÊ§
	
	if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó
		if GetTask(TASK_XB_ID_01) == 58 then
			if GetBit(GetTask(WUXINGSHI_STATE),1) == 0 then --ÉÐÎ´É±ËÀÎåÐÐÊ¹½ð
				SetTask(WUXINGSHI_STATE,SetBit(GetTask(WUXINGSHI_STATE),1,1));
				 --5¸öÎåÐÐÊ¹¾ù´òµ¹
				 if CheckBossStata() == 1 then
					 SetTask(TASK_XB_ID_01,59);
					 SetTask(WUXINGSHI_STATE,0);--Çå¿Õ¼ÇÂ¼ÎåÐÐÊ¹Çé¿öµÄ±äÁ¿
					 Msg2Player("Khi ®¸nh b¹i ®­îc Ngò Hµnh Sø, vÒ håi b¸o Th¸c B¹t Ho»ng. ");
					 TaskTip("Khi ®¸nh b¹i ®­îc Ngò Hµnh Sø, vÒ håi b¸o Th¸c B¹t Ho»ng. ");
					 TalkEx("",strTalk);
				 --ÌáÊ¾ÉÐÎ´É±ËÀ5¸öÎåÐÐÊ¹£¬¸øÓëÌáÊ¾
				 elseif  CheckBossStata() == 0 then
					 TipBossMsg();
				 end
			--ÌáÊ¾ÒÑ¾­É±ËÀ1¸öÎåÐÐÊ¹£¬»¹ÓÐÎ´É±ËÀµÄ	 					
			elseif CheckBossStata() == 0 then
				TipBossMsg();
			end
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
      if GetTask(TASK_XB_ID_01) == 58 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				if GetBit(GetTask(WUXINGSHI_STATE),1) == 0 then --ÉÐÎ´É±ËÀÎåÐÐÊ¹½ð
					SetTask(WUXINGSHI_STATE,SetBit(GetTask(WUXINGSHI_STATE),1,1));
					 --5¸öÎåÐÐÊ¹¾ù´òµ¹
					 if CheckBossStata() == 1 then
						SetTask(TASK_XB_ID_01,59);
						SetTask(WUXINGSHI_STATE,0);--Çå¿Õ¼ÇÂ¼ÎåÐÐÊ¹Çé¿öµÄ±äÁ¿
					 Msg2Player("Khi ®¸nh b¹i ®­îc Ngò Hµnh Sø, vÒ håi b¸o Th¸c B¹t Ho»ng. ");
					 TaskTip("Khi ®¸nh b¹i ®­îc Ngò Hµnh Sø, vÒ håi b¸o Th¸c B¹t Ho»ng. ");
						TalkEx("",strTalk);
					 --ÌáÊ¾ÉÐÎ´É±ËÀ5¸öÎåÐÐÊ¹£¬¸øÓëÌáÊ¾
					 elseif  CheckBossStata() == 0 then
						 TipBossMsg();	 	
					 end
				--ÌáÊ¾ÒÑ¾­É±ËÀ1¸öÎåÐÐÊ¹£¬»¹ÓÐÎ´É±ËÀµÄ	 					
				elseif CheckBossStata() == 0 then
					TipBossMsg();
				end
			end
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
  end;
end


--¼ì²é5¸öÎåÐÐÊ¹
function CheckBossStata()
	
local i=0;
local nBossState = {0,0,0,0,0};	
	
	for i=1,5 do
		if GetBit(GetTask(WUXINGSHI_STATE),i) == 1 then
			nBossState[i] = 1;
		end
	end
	--¾ùÉ±ËÀ
	if nBossState[1] == nBossState[2] == nBossState[3] == nBossState[4] == nBossState[5] == 1 then
		return 1
	--¾ùÎ´É±
	elseif nBossState[1] == nBossState[2] == nBossState[3] == nBossState[4] == nBossState[5] == 0 then
		return 2
	else
		return 0
	end
	
end

--¼ì²é5¸öÎåÐÐÊ¹
function CheckBossStataEx()
	
local i=0;
local nBossState = {0,0,0,0,0};	
	
	for i=1,5 do
		if GetBit(GetTask(WUXINGSHI_STATE),i) == 1 then
			nBossState[i] = 1;
		end
	end
	
	return nBossState
	
end

--ÌáÊ¾5¸öÎåÐÐÊ¹Çé¿ö
function TipBossMsg()

local strMsg = "";
local strTalk = {};
local nNum = 0;
local nBossState = CheckBossStataEx();
local nBossName = {" Kim ","Méc","Thñy","Háa","Thæ"}

	for i=1,5 do
		if nBossState[i] == 0 then
			strMsg = strMsg..nBossName[i]
			nNum = nNum + 1
		end
	end
	
	strTalk = {
		"B¹n ®· h¹ thñ"..(5 - nNum).." Ngò Hµnh Sø, cßn "..strMsg.." vµ "..nNum.." Ngò Hµnh Sø ch­a giÕt ®­îc."
		}
		
	TalkEx("",strTalk);
	
end
