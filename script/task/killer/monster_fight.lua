-- ====================== 文件信息 ====================== 
                                                          
-- 剑侠情缘onlineII 藏宝图妖怪战斗死亡脚本                  
-- Edited by starry night                                 
-- 2005/10/20 PM 17:29                                    
                                                          
-- ======================================================
--引用藏宝图头文件
Include("\\script\\task\\killer\\cangbaotu_head.lua");

function OnDeath(NpcIndex)
local NpcIndex = tonumber(NpcIndex);

	SetNpcLifeTime(NpcIndex,0);--使得尸体消失
	SetNpcScript(NpcIndex,"");--撤销该Npc所挂脚本

		PayEquip(1);

end;