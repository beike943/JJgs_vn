-- ====================== 文件信息 ====================== 
                                                          
-- 剑侠情缘onlineII 通缉任务杀手Npc同伴战斗死亡脚本                  
-- Edited by starry night                                 
-- 2005/09/12 PM 17:03                                    
                                                          
-- ======================================================

function OnDeath(NpcIndex)
NpcIndex = tonumber(NpcIndex);
	SetNpcLifeTime(NpcIndex,0);--使得尸体消失
	SetNpcScript(NpcIndex,"");--撤销该Npc所挂脚本
	if random(1,100) <= 4 then
		--掉落杀手令
		AddItem(2,1,195,1,1);
	end;
end;
