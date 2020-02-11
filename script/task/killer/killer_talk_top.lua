-- ====================== ÎÄ¼þÐÅÏ¢ ====================== 
                                                          
-- ½£ÏÀÇéÔµonlineII Í¨¼©ÈÎÎñ¶¥¼¶É±ÊÖ¶Ô»°½Å±¾                  
-- Edited by starry night                                 
-- 2005/11/28 PM 18:26                                    
                                                          
-- ======================================================

--ÒýÓÃÍ¨¼©ÈÎÎñÍ·ÎÄ¼þ
Include("\\script\\task\\killer\\killer_head.lua");

function main()

local npcName = GetTargetNpcName();

	if npcName==nil or npcName=="" then npcName = "S¸t thñ "; end;	

	Say("<color=green>"..npcName.."<color>:……",
		2,
		"Cuèi cïng còng ®Ó ta b¾t ®­îc ng­¬i!/Killer_Fight",
		"Kh«ng cã g×/Killer_Exit");
	
end;

function Killer_Fight()

	local npcName = GetTargetNpcName();
	local npcID = GetTargetNpc();
	
		if npcID == nil or npcID == 0 or npcName == nil then
			return
		end

		Say("<color=green>"..npcName.."<color>: Kh«ng ngê ng­¬i cã thÓ ®¸nh b¹i s¸t thñ cña NhÊt PhÈm §­êng ta, thËt kh«ng ®¬n gi¶n chót nµo!",0);
		
		SetNpcScript(npcID, "\\script\\task\\killer\\killer_top_fight.lua");
		ChangeNpcToFight(npcID, 5);
		
end;


function Killer_Exit()
end;	