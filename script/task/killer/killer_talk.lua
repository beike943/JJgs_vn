-- ====================== 文件信息 ====================== 
                                                          
-- 剑侠情缘onlineII 通缉任务杀手对话脚本                  
-- Edited by starry night                                 
-- 2005/09/05 PM 16:21                                    
                                                          
-- ======================================================

--引用通缉任务头文件
Include("\\script\\task\\killer\\killer_head.lua");

function main()

local npcName = GetTargetNpcName();

	if npcName==nil or npcName=="" then npcName = "S竧 th?"; end;	

	Say("<color=green>"..npcName.."<color>: 你要干什么在我前面来回转悠....",
		2,
		"杀了你，回去领赏/Killer_Fight",
		"没事，就是路过/Killer_Exit");
	
end;


function Killer_Fight()

local npcName = GetTargetNpcName();
local npcID = GetTargetNpc();
local nKillerID = GetTask(TASK_KILLER_NPCINDEX_ID);
local nTask_State = GetTask(TASK_KILLER_STATE_ID);
local nPlayerName = GetPlayerSex();
		
	if npcID == nKillerID and nTask_State == 1 then
		
		--10%几率不战而胜
		if random(1,100)>90 then
			Say("<color=green>"..npcName.."<color>:"..nPlayerName.."大侠别杀我,我和你回去...",0);
			
			SetTask(TASK_KILLER_STATE_ID,2);--完成任务设置变量值为2
			TaskTip("任务完成！ 请找捕头接受奖励!");
			--移除时间触发器
			RemoveTrigger(GetTrigger(500));
			SetNpcScript(npcID,"");--撤销该Npc所挂脚本
			SetNpcLifeTime(npcID,0);
				if random(1,100) > 94 then
					AddItem(2,1,195,1,1);
				end;
		else
			Say("<color=green>"..npcName.."<color>: 好啊!来试试我这把刀!",0);
		
			SetNpcScript(npcID, "\\script\\task\\killer\\killer_fight.lua");
			ChangeNpcToFight(npcID);
		end;
		
	else
		Say("<color=green>"..npcName.."<color>: 滚开,别挡着老子!",0);
	end;
	
end;


function Killer_Exit()

end;
	