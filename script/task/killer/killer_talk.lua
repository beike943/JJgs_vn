-- ====================== �ļ���Ϣ ====================== 
                                                          
-- ������ԵonlineII ͨ������ɱ�ֶԻ��ű�                  
-- Edited by starry night                                 
-- 2005/09/05 PM 16:21                                    
                                                          
-- ======================================================

--����ͨ������ͷ�ļ�
Include("\\script\\task\\killer\\killer_head.lua");

function main()

local npcName = GetTargetNpcName();

	if npcName==nil or npcName=="" then npcName = "S�t th?"; end;	

	Say("<color=green>"..npcName.."<color>: ��Ҫ��ʲô����ǰ������ת��....",
		2,
		"ɱ���㣬��ȥ����/Killer_Fight",
		"û�£�����·��/Killer_Exit");
	
end;


function Killer_Fight()

local npcName = GetTargetNpcName();
local npcID = GetTargetNpc();
local nKillerID = GetTask(TASK_KILLER_NPCINDEX_ID);
local nTask_State = GetTask(TASK_KILLER_STATE_ID);
local nPlayerName = GetPlayerSex();
		
	if npcID == nKillerID and nTask_State == 1 then
		
		--10%���ʲ�ս��ʤ
		if random(1,100)>90 then
			Say("<color=green>"..npcName.."<color>:"..nPlayerName.."������ɱ��,�Һ����ȥ...",0);
			
			SetTask(TASK_KILLER_STATE_ID,2);--����������ñ���ֵΪ2
			TaskTip("������ɣ� ���Ҳ�ͷ���ܽ���!");
			--�Ƴ�ʱ�䴥����
			RemoveTrigger(GetTrigger(500));
			SetNpcScript(npcID,"");--������Npc���ҽű�
			SetNpcLifeTime(npcID,0);
				if random(1,100) > 94 then
					AddItem(2,1,195,1,1);
				end;
		else
			Say("<color=green>"..npcName.."<color>: �ð�!����������ѵ�!",0);
		
			SetNpcScript(npcID, "\\script\\task\\killer\\killer_fight.lua");
			ChangeNpcToFight(npcID);
		end;
		
	else
		Say("<color=green>"..npcName.."<color>: ����,��������!",0);
	end;
	
end;


function Killer_Exit()

end;
	