-- ====================== �ļ���Ϣ ====================== 
                                                          
-- ������ԵonlineII ͨ������ɱ��Npcͬ��ս�������ű�                  
-- Edited by starry night                                 
-- 2005/09/12 PM 17:03                                    
                                                          
-- ======================================================

function OnDeath(NpcIndex)
NpcIndex = tonumber(NpcIndex);
	SetNpcLifeTime(NpcIndex,0);--ʹ��ʬ����ʧ
	SetNpcScript(NpcIndex,"");--������Npc���ҽű�
	if random(1,100) <= 50 then
		--����ɱ����
		AddItem(2,1,195,1,1);
	end;
end;
