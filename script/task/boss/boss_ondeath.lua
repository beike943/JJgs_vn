Include("\\script\\online\\newyear08\\newyear08_head.lua");--08ʥ����
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");

function OnDeath(npcIndex)
	SetNpcLifeTime(npcIndex, 30);
	local npcIndex,npcModel,npcName = GetTriggeringUnit();
	if get_chrims_state() == 1 then
		local nRand = random(1,1000);
		if nRand <= 1000 then
			AddItem(2,1,1192,1);
			Msg2Player("B�n nh�n ���c m�t t�i l� v�t Gi�ng Sinh");
		end
	end
	if npcName == "����������" then
		local npcIndex = CreateNpc("B�c L�c L�m l�nh","��������",GetNpcWorldPos(npcIndex));
		SetNpcScript(npcIndex,"\\script\\task\\tasklink\\taskitem.lua");
		SetNpcLifeTime(npcIndex,5*60);	--����ʱ�䣺������
		-- �õ���ǰ��npc����
		local nMapID, nWx, nWy = GetNpcWorldPos(npcIndex)
		local nAddX = 0
		local nAddY = 0
		local nTargetNpc = 0
		
		-- call����10�����ɢ�������
		for i = 1, 50 do
			nAddX = random(-30, 30)
			nAddY = random(-30, 30)
			
			nTargetNpc = CreateNpc("T�i cao th�", "�����������İ���", nMapID, nWx + nAddX, nWy + nAddY)
			AddUnitStates(nTargetNpc, 6, GetTime())
			SetNpcLifeTime(nTargetNpc, 600)
			SetNpcScript(nTargetNpc, "\\script\\task\\boss\\boss_baoguo.lua")
		end		
	elseif npcName == "ǹ��Ӯ��" then
		local npcIndex = CreateNpc("Tr�c �nh Th��ng","��Ӱǹ",GetNpcWorldPos(npcIndex));
		SetNpcScript(npcIndex,"\\script\\task\\tasklink\\taskitem.lua");
		SetNpcLifeTime(npcIndex,5*60);	--����ʱ�䣺������	
		-- �õ���ǰ��npc����
		local nMapID, nWx, nWy = GetNpcWorldPos(npcIndex)
		local nAddX = 0
		local nAddY = 0
		local nTargetNpc = 0
		
		-- call����10�����ɢ�������
		for i = 1, 50 do
			nAddX = random(-30, 30)
			nAddY = random(-30, 30)
			
			nTargetNpc = CreateNpc("T�i cao th�", "ǹ��Ӯ��İ���", nMapID, nWx + nAddX, nWy + nAddY)
			AddUnitStates(nTargetNpc, 6, GetTime())
			SetNpcLifeTime(nTargetNpc, 600)
			SetNpcScript(nTargetNpc, "\\script\\task\\boss\\boss_baoguo.lua")
		end		
	elseif npcName == "������" then
		---- Nhi�m v� chuy�n sinh 5
	local nTeamSize = GetTeamSize()
	if nTeamSize >= 2 then
		local nOldPlayerIdx = PlayerIndex
		for i = 1, nTeamSize do
			PlayerIndex = GetTeamMember(i)
			if GetTask(TRANSLIFE_MISSION_ID) == 35 and GetTask(TRANSLIFE_TASK_5_2) < 1 then 
				SetTask(TRANSLIFE_TASK_5_2,1)
			end
			if GetTask(TRANSLIFE_TASK_5_2) == 1 then
				TaskTip("Ho�n th�nh y�u c�u c�a Nh� Ho�ng T� �o�n T� Thu�n ti�u di�t h�n ma L�nh H��ng L�ng  ")
			end
		end
		PlayerIndex = nOldPlayerIdx
	else
		if GetTask(TRANSLIFE_MISSION_ID) == 35 and GetTask(TRANSLIFE_TASK_5_2) < 1 then 
				SetTask(TRANSLIFE_TASK_5_2,1)
		end
		if GetTask(TRANSLIFE_TASK_5_2) == 1 then
				TaskTip("Ho�n th�nh y�u c�u c�a Nh� Ho�ng T� �o�n T� Thu�n ti�u di�t h�n ma L�nh H��ng L�ng  ")
		end
	end
		
		local npcIndex = CreateNpc("Tuy�t T�nh Th�ch","����ʯ",GetNpcWorldPos(npcIndex));
		SetNpcScript(npcIndex,"\\script\\task\\tasklink\\taskitem.lua");
		SetNpcLifeTime(npcIndex,5*60);	--����ʱ�䣺������	
		-- �õ���ǰ��npc����
		local nMapID, nWx, nWy = GetNpcWorldPos(npcIndex)
		local nAddX = 0
		local nAddY = 0
		local nTargetNpc = 0
		
		-- call����10�����ɢ�������
		for i = 1, 50 do
			nAddX = random(-30, 30)
			nAddY = random(-30, 30)
			
			nTargetNpc = CreateNpc("T�i cao th�", "������İ���", nMapID, nWx + nAddX, nWy + nAddY)
			AddUnitStates(nTargetNpc, 6, GetTime())
			SetNpcLifeTime(nTargetNpc, 600)
			SetNpcScript(nTargetNpc, "\\script\\task\\boss\\boss_baoguo.lua")
		end			
	else
		Talk(1,"","B�n nh�n xung quanh v�n kh�ng ph�t hi�n g�.");
	end;
end
