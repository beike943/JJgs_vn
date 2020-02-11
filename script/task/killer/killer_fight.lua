-- ====================== ÎÄ¼şĞÅÏ¢ ====================== 
                                                          
-- ½£ÏÀÇéÔµonlineII Í¨¼©ÈÎÎñÉ±ÊÖNpcÕ½¶·ËÀÍö½Å±¾                  
-- Edited by starry night                                 
-- 2005/09/12 PM 14:17                                    
                                                          
-- ======================================================

--ÒıÓÃÍ¨¼©ÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\killer\\killer_head.lua");
Include("\\script\\lib\\lingshi_head.lua");

function OnDeath(NpcIndex)

local nSurnameID = GetTask(TASK_KILLER_SURNAME_ID);
local nFirstnameID = GetTask(TASK_KILLER_FIRSTNAME_ID);
local nKillerName = "S¸t thñ "..getKillerName(nSurnameID,nFirstnameID);
local nKillerParName = nKillerName.." ®ång hµnh ";
local nNum = random(3,5);--Ëæ»ú³öÏÖ¸´³ğÍ¬°éÊıÁ¿£¨3¡«5¸ö£©
local nKillerParModeID = getKillerParModeID();
local nKillerParMode = getKillerParMode(nKillerParModeID);
local nMapID,nWx,nWy = GetWorldPos();
local i = 0;
local argKillerParIndex = {};
local nKillerIndex = GetTask(TASK_KILLER_NPCINDEX_ID);
local NpcIndex = tonumber(NpcIndex)
local nState = GetTask(TASK_KILLER_STATE_ID);

	SetNpcLifeTime(NpcIndex,0);--Ê¹µÃÊ¬ÌåÏûÊ§
	SetNpcScript(NpcIndex,"");--³·Ïú¸ÃNpcËù¹Ò½Å±¾
	
	if nState == 1 and nKillerIndex == NpcIndex then--ÅĞ¶ÏÉ±ËÀ¸ÃÉ±ÊÖµÄÍæ¼ÒÊÇ·ñÎªÁì¸ÃÈÎÎñµÄÍæ¼Ò	 
	
		SetTask(TASK_KILLER_STATE_ID,2);--Íê³ÉÈÎÎñÉèÖÃ±äÁ¿ÖµÎª2
		
		local nExp = GetLevel()*GetLevel()*12;
		ModifyExp(nExp);
		Msg2Player("B¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm");
		
		TaskTip("NhiÖm vô hoµn thµnh! Xin ®Õn gÆp Bé ®Çu l·nh th­ëng!");
		
		--ÒÆ³ıÊ±¼ä´¥·¢Æ÷
		RemoveTrigger(GetTrigger(500));
	
		--30%´¥·¢ÌØÊâÊÂ¼ş
		if random(1,100) <= 30 then
		
			--80%³öÏÖ¸´³ğÍ¬°éthen
			if random(1,100) <= 80 then
				
				Talk(1,"","<color=green>"..nKillerName.."<color>: §ång hµnh cña ta sÏ kh«ng tha cho ng­¬i……");
				
				nNum,argKillerParIndex = CreateNpc(nKillerParMode,nKillerParName,nMapID,nWx,nWy,-1,nNum,1,200);
				
				nNum = nNum-1;
				
				--ÉèÖÃÉ±ÊÖÍ¬°é½Å±¾
				for i=0,nNum do
				
					SetNpcScript(argKillerParIndex[i], "\\script\\task\\killer\\killer_par_fight.lua");
					SetNpcLifeTime(argKillerParIndex[i],600);

				end;
				
			else
				Talk(2,"","<color=green>"..nKillerName.."<color>: Ta cã lµm ma còng sÏ kh«ng tha cho ng­¬i……","B¹n ®¸nh b¹i <color=yellow>"..nKillerName.."<color> lÊy ®­îc 1 <color=yellow>lÖnh bµi S¸t thñ<color>.");
				--µôÂäÉ±ÊÖÁî
				AddItem(2,1,195,1,1);
			end;
			
		else
		
			Talk(1,"","<color=green>"..nKillerName.."<color>: Ta cã lµm ma còng sÏ kh«ng tha cho ng­¬i……");
		
		end;
		local nLevel = GetLevel();
		if random(1,100) <= 10 then
			local nLSLevel = 0;
			if nLevel <= 30 then
				nLSLevel = 1;		
			elseif nLevel <= 40 then
				nLSLevel = random(1,2);
			elseif nLevel <= 50 then
				nLSLevel = random(1,3);
			elseif nLevel <= 60 then
				nLSLevel = random(1,4);
			elseif nLevel <= 80 then
				nLSLevel = random(1,5);
			elseif nLevel <= 100 then
				nLSLevel = random(2,5);
			end;
			lspf_AddLingShiInBottle(nLSLevel,1);
			if nLSLevel ~= 0 then
				Msg2Player("B¹n nhËn ®­îc 1 "..nLSLevel.." (cÊp) Linh th¹ch, ®· nhËp vµo Tô Linh §Ønh");		
			end;
		end;
	end;
end;
