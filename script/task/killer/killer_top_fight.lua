-- ====================== 文件信息 ====================== 
                                                          
-- 剑侠情缘onlineII 通缉任务顶级杀手战斗死亡脚本                  
-- Edited by starry night                                 
-- 2005/09/12 PM 14:17                                    
                                                          
-- ======================================================
Include("\\script\\lib\\lingshi_head.lua");
function OnDeath(NpcIndex)

	SetNpcLifeTime(NpcIndex,0);--使得尸体消失
	SetNpcScript(NpcIndex,"");--撤销该Npc所挂脚本
	local nLevel = GetLevel();
	if random(1,100) <= 50 then
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
			Msg2Player("你获得 1个 "..nLSLevel.." (级) 灵石, 已放入聚灵鼎");		
		end;		
	end;
end;
