-- ====================== 文件信息 ====================== 
                                                          
-- 剑侠情缘onlineII 通缉任务顶级杀手对话脚本                  
-- Edited by starry night                                 
-- 2005/11/28 PM 18:26                                    
                                                          
-- ======================================================

--引用通缉任务头文件
Include("\\script\\task\\killer\\killer_head.lua");

function main()

local npcName = GetTargetNpcName();

	if npcName==nil or npcName=="" then npcName = "S竧 th?"; end;	

	Say("<color=green>"..npcName.."<color>:厖",
		2,
		"杀你回去领赏/Killer_Fight",
		"没事,我只是路过/Killer_Exit");
	
end;

function Killer_Fight()

	local npcName = GetTargetNpcName();
	local npcID = GetTargetNpc();
	
		if npcID == nil or npcID == 0 or npcName == nil then
			return
		end

		Say("<color=green>"..npcName.."<color>: 兄弟挺厉害啊!",0);
		
		SetNpcScript(npcID, "\\script\\task\\killer\\killer_top_fight.lua");
		ChangeNpcToFight(npcID, 5);
		
end;


function Killer_Exit()
end;	