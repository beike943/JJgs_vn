-- ====================== �ļ���Ϣ ====================== 
                                                          
-- ������ԵonlineII ͨ�����񶥼�ɱ��ս�������ű�                  
-- Edited by starry night                                 
-- 2005/09/12 PM 14:17                                    
                                                          
-- ======================================================
Include("\\script\\lib\\lingshi_head.lua");
function OnDeath(NpcIndex)

	SetNpcLifeTime(NpcIndex,0);--ʹ��ʬ����ʧ
	SetNpcScript(NpcIndex,"");--������Npc���ҽű�
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
			Msg2Player("���� 1�� "..nLSLevel.." (��) ��ʯ, �ѷ�����鶦");		
		end;		
	end;
end;
