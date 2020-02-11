-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII »ÊÁêÄ¹ÊÒ¶þ²ãNPCÕòÄ¹½«¾ü¶«Script
-- By StarryNight
-- 2007/08/03 PM 04:24

-- Ç§°ÙÄêÊØÔÚÕâÀï£¬Ö»Îª±£»¤ÀïÃæµÄÈËºÍÎï¡­¡­

-- ======================================================

-- ÒýÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼þ
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();
local nBossState = {0,0,0,0};
local nBossName = {"§«ng ","Nam ","T©y ","B¾c "}
local strTalk = {
	"B¹n h·y ®¸nh b¹i 4 TrÊn Mé T­íng Qu©n trÊn gi÷ tÇng 2 vµ chØ cÇn t×m ®­îc Thñ Mé T­íng Qu©n sÏ ®¸nh thøc Quû T­íng Qu©n ®ang gi÷ b¶o r­¬ng."
	}

	--SetNpcLifeTime(index,15);--Ê¹µÃÊ¬ÌåÏûÊ§
	
	if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó
		if GetTask(TASK_XB_ID_01) == 26 then
			if GetBit(GetTask(ZHENMUJIANGJUN_STATE),1) == 0 then --ÉÐÎ´É±ËÀÕòÄ¹½«¾ü¶«
				SetTask(ZHENMUJIANGJUN_STATE,SetBit(GetTask(ZHENMUJIANGJUN_STATE),1,1));
				 --4¸ö½«¾ü¾ù´òµ¹
				 if CheckBossStata() == 1 then
					 SetTask(TASK_XB_ID_01,27);
					 SetTask(ZHENMUJIANGJUN_STATE,0);--Çå¿Õ¼ÇÂ¼ÕòÄ¹½«¾üÇé¿öµÄ±äÁ¿
					 Msg2Player("T×m ®­îc Thñ Mé T­íng Qu©n ë tÇng 2 cã thÓ ®¸nh thøc Quû T­íng Qu©n ®ang gi÷ b¶o r­¬ng.");
					 TaskTip("T×m ®­îc Thñ Mé T­íng Qu©n ë tÇng 2 cã thÓ ®¸nh thøc Quû T­íng Qu©n ®ang gi÷ b¶o r­¬ng.");
					 GivePlayerAward("Award_XB_33","Easy");
					 TalkEx("",strTalk);
				 --ÌáÊ¾ÉÐÎ´É±ËÀ4¸öÕòÄ¹½«¾ü£¬¸øÓëÌáÊ¾
				 elseif  CheckBossStata() == 0 then
					 TipBossMsg();
				 end
			--ÌáÊ¾ÒÑ¾­É±ËÀ1¸öÕòÄ¹½«¾ü£¬»¹ÓÐÎ´É±ËÀµÄ	 					
			elseif CheckBossStata() == 0 then
				TipBossMsg();
			end
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
      if GetTask(TASK_XB_ID_01) == 26 and nDist >= 0 and nDist <= 50 and IsPlayerDeath() == 0 then
				if GetBit(GetTask(ZHENMUJIANGJUN_STATE),1) == 0 then --ÉÐÎ´É±ËÀÕòÄ¹½«¾ü¶«
					SetTask(ZHENMUJIANGJUN_STATE,SetBit(GetTask(ZHENMUJIANGJUN_STATE),1,1));
					 --4¸ö½«¾ü¾ù´òµ¹
					 if CheckBossStata() == 1 then
						SetTask(TASK_XB_ID_01,27);
						SetTask(ZHENMUJIANGJUN_STATE,0);--Çå¿Õ¼ÇÂ¼ÕòÄ¹½«¾üÇé¿öµÄ±äÁ¿
						Msg2Player("T×m ®­îc Thñ Mé T­íng Qu©n ë tÇng 2 cã thÓ ®¸nh thøc Quû T­íng Qu©n ®ang gi÷ b¶o r­¬ng.");
					 	TaskTip("T×m ®­îc Thñ Mé T­íng Qu©n ë tÇng 2 cã thÓ ®¸nh thøc Quû T­íng Qu©n ®ang gi÷ b¶o r­¬ng.");
					 	GivePlayerAward("Award_XB_33","Easy");
						TalkEx("",strTalk);
					 --ÌáÊ¾ÉÐÎ´É±ËÀ4¸öÕòÄ¹½«¾ü£¬¸øÓëÌáÊ¾
					 elseif  CheckBossStata() == 0 then
						 TipBossMsg();	 	
					 end
				--ÌáÊ¾ÒÑ¾­É±ËÀ1¸öÕòÄ¹½«¾ü£¬»¹ÓÐÎ´É±ËÀµÄ	 					
				elseif CheckBossStata() == 0 then
					TipBossMsg();
				end
			end
		end;
	PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
  end;
end


--¼ì²é4¸öÕòÄ¹½«¾ü
function CheckBossStata()
	
local i=0;
local nBossState = {0,0,0,0};	
	
	for i=1,4 do
		if GetBit(GetTask(ZHENMUJIANGJUN_STATE),i) == 1 then
			nBossState[i] = 1;
		end
	end
	--¾ùÉ±ËÀ
	if nBossState[1] == 1 and nBossState[2] == 1 and nBossState[3] == 1 and nBossState[4] == 1 then
		return 1
	--¾ùÎ´É±
	elseif nBossState[1] == nBossState[2] == nBossState[3] == nBossState[4] == 0 then
		return 2
	else
		return 0
	end
	
end

--¼ì²é4¸öÕòÄ¹½«¾ü
function CheckBossStataEx()
	
local i=0;
local nBossState = {0,0,0,0};	
	
	for i=1,4 do
		if GetBit(GetTask(ZHENMUJIANGJUN_STATE),i) == 1 then
			nBossState[i] = 1;
		end
	end
	
	return nBossState
	
end

--ÌáÊ¾4¸öÕòÄ¹½«¾üÇé¿ö
function TipBossMsg()

local strMsg = "";
local strTalk = {};
local nNum = 0;
local nBossState = CheckBossStataEx();
local nBossName = {"§«ng ","Nam ","T©y ","B¾c "};

	for i=1,4 do
		if nBossState[i] == 0 then
			strMsg = strMsg..nBossName[i]
			nNum = nNum + 1
		end
	end
	
	strTalk = {
		"B¹n ®· h¹ thñ"..(4 - nNum).." TrÊn Mé T­íng Qu©n, cßn "..strMsg.." vµ "..nNum.." TrÊn Mé T­íng Qu©n ch­a ®¸nh b¹i."
		}
		
	TalkEx("",strTalk);
	
end
