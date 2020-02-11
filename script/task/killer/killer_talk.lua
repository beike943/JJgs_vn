-- ====================== ÎÄ¼şĞÅÏ¢ ====================== 
                                                          
-- ½£ÏÀÇéÔµonlineII Í¨¼©ÈÎÎñÉ±ÊÖ¶Ô»°½Å±¾                  
-- Edited by starry night                                 
-- 2005/09/05 PM 16:21                                    
                                                          
-- ======================================================

--ÒıÓÃÍ¨¼©ÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\killer\\killer_head.lua");

function main()

local npcName = GetTargetNpcName();

	if npcName==nil or npcName=="" then npcName = "S¸t thñ "; end;	

	Say("<color=green>"..npcName.."<color>: Ng­¬i lµm g× vËy? Cø ®i qua ®i l¹i tr­íc mÆt ta, lì kinh ®éng ®Õn Mao ®¹i gia ng­¬i cã g¸nh næi kh«ng!",
		2,
		"Ta trõ h¹i cho d©n/Killer_Fight",
		"Xin lçi! Nh×n lÇm ng­êi./Killer_Exit");
	
end;


function Killer_Fight()

local npcName = GetTargetNpcName();
local npcID = GetTargetNpc();
local nKillerID = GetTask(TASK_KILLER_NPCINDEX_ID);
local nTask_State = GetTask(TASK_KILLER_STATE_ID);
local nPlayerName = GetPlayerSex();
		
	if npcID == nKillerID and nTask_State == 1 then
		
		--10%¼¸ÂÊ²»Õ½¶øÊ¤
		if random(1,100)>90 then
			Say("<color=green>"..npcName.."<color>:"..nPlayerName.."Xin tha m¹ng! TiÓu nh©n xin theo ng­êi vÒ quy ¸n.",0);
			
			SetTask(TASK_KILLER_STATE_ID,2);--Íê³ÉÈÎÎñÉèÖÃ±äÁ¿ÖµÎª2
			TaskTip("NhiÖm vô hoµn thµnh! Xin ®Õn gÆp Bé ®Çu l·nh th­ëng!");
			--ÒÆ³ıÊ±¼ä´¥·¢Æ÷
			RemoveTrigger(GetTrigger(500));
			SetNpcScript(npcID,"");--³·Ïú¸ÃNpcËù¹Ò½Å±¾
			SetNpcLifeTime(npcID,0);
				if random(1,100) > 94 then
					AddItem(2,1,195,1,1);
				end;
		else
			Say("<color=green>"..npcName.."<color>: Hay l¾m!",0);
		
			SetNpcScript(npcID, "\\script\\task\\killer\\killer_fight.lua");
			ChangeNpcToFight(npcID);
		end;
		
	else
		Say("<color=green>"..npcName.."<color>: Tªn tiÓu tö nµy tr¸nh sang mét bªn! §õng lµm phiÒn bæn ®¹i gia!",0);
	end;
	
end;


function Killer_Exit()

end;
	