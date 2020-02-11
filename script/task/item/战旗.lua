Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")

function OnUse(nIndex)
	local i;
	local nMapId,nX,nY = GetWorldPos();
	if nMapId ~= 6017 then
		Talk(1,"","ChiÕn kú chØ cã thÓ sö dông trªn H¾c Méc Nhai!");
		return 0;
	end
	if GetTask(Task_id_008) == 2 and tGtTask:check_cur_task(70) == 1 then
		Say("B¹n cã muèn sö dông l¹i chiÕn kú kh«ng?",2,"§ång ý/done","Ta chØ ®Õn xem thö/do_nothing")
		return 0;
	end
	--µØÍ¼Õ½ÆìÊýÁ¿²»ÄÜ³¬¹ý20¸ö
	if GetMapTaskTemp(nMapId,Map_Glb_Valve) > 20 then
		Talk(1,"","Tæng sè chiÕn kú trªn b¶n ®å kh«ng thÓ v­ît qu¸ 20 c¸i, h·y chê gi©y l¸t.")
		return 0;
	end
	if GetTask(Task_id_008) == 1 and tGtTask:check_cur_task(70) == 1 then
		if GetTrigger(1518*2) == 0 and GetTask(Task_id_009) ~= 6 then
			--´´½¨Õ½Æì
			local npcIndex = CreateNpc("DiÖt m«n lam",format(" ChiÕn Kú cña %s",GetName()),GetWorldPos());
			SetNpcDeathScript(npcIndex,"\\script\\task\\item\\Õ½ÆìDeath.lua");
			local nHp,nHp1 = GetUnitCurStates(npcIndex,1);
			if GetTask(Task_id_013) ~= 0 then
				AddUnitStates(npcIndex,1,GetTask(Task_id_013)-nHp);
			end
			SetTask(Task_id_011,npcIndex);
			SetNpcLifeTime(npcIndex,10*60);
			SetCampToNpc(npcIndex,"camp_enemy");
			SetCampToPlayer("camp_enemy");
			SetTask(Task_id_010,0)		
			CreateTrigger(1,1518,1518*2);
			ContinueTimer(GetTrigger(1518*2));
			SetTask(Task_id_008,2)
			SetMapTaskTemp(nMapId,Map_Glb_Valve,(GetMapTaskTemp(nMapId,Map_Glb_Valve) or 0) + 1);
			CreateTrigger(3,3007,3007*2);
		end
	end
	if GetTask(Task_id_008) == 0 and tGtTask:check_cur_task(70) == 1 then
		Talk(1,"","H·y tiªu diÖt H¾c V« Th­êng tr­íc råi sö dông chiÕn kú");
	end
end

function done()
	if GetTask(Task_id_009) ~= 6 then
		local nHp,nHp1 = GetUnitCurStates(GetTask(Task_id_011),1);
		SetTask(Task_id_013,nHp1);
		SetTask(Task_id_008,1);
		SetTask(Task_id_010,0);
		SetNpcLifeTime(GetTask(Task_id_011),0);
		SetTaskTemp(250,0);
		SetMapTaskTemp(6017,Map_Glb_Valve,GetMapTaskTemp(6017,Map_Glb_Valve)-1);
		RemoveTrigger(GetTrigger(1267*2));
		RemoveTrigger(GetTrigger(1268*2));
		RemoveTrigger(GetTrigger(1269*2));
		RemoveTrigger(GetTrigger(1270*2));
		RemoveTrigger(GetTrigger(1271*2));
		RemoveTrigger(GetTrigger(1272*2));
		RemoveTrigger(GetTrigger(1518*2));
		RemoveTrigger(GetTrigger(3007*2));
		Msg2Player("Phßng thñ thÊt b¹i, h·y sö dông l¹i chiÕn kú");
		return 1;
	else
		Talk(1,"","§· hoµn thµnh nhiÖm vô , kh«ng thÓ sö dông n÷a.");
		return 0;
	end
end

function do_nothing()
end

function OnTimer()
	local i;
	local nMapId,nX,nY = GetWorldPos();
	local nMap,nX,nY = GetNpcWorldPos(GetTask(Task_id_011));
	if nMapId ~= nMap then
		SetTask(Task_id_010,(10 * 60) / 30);
	end
	SetTask(Task_id_010,GetTask(Task_id_010)+1);
	if GetTask(Task_id_010) >= (10 * 60) / 30 or GetTask(Task_id_009) == 6 then
		if GetTask(Task_id_009) ~= 6 then
			SetTask(Task_id_008,1);
			SetTask(Task_id_010,0);
			SetNpcLifeTime(GetTask(Task_id_011),0);
			SetTaskTemp(250,0);
			Msg2Player("Phßng thñ thÊt b¹i, h·y sö dông l¹i chiÕn kú");
		else
			if DelItem(2,0,30040,1) == 1 then 
				SetNpcLifeTime(GetTask(Task_id_011),0);
				Msg2Player("Phßng thñ thµnh c«ng!");
			else
				SetTask(Task_id_008,0);
				SetTask(Task_id_009,0);
				SetTask(Task_id_010,0);
				SetNpcLifeTime(GetTask(Task_id_011),0);
				SetTask(Task_id_011,0);
				SetTask(Task_id_013,0);
				SetTaskTemp(250,0);
				DelItem(2,0,30040,1)
				Msg2Player("NhiÖm vô kh¸c th­êng, h·y hñy bá nhiÖm vô vµ b¾t ®Çu thö l¹i!")
			end
		end
		SetMapTaskTemp(6017,Map_Glb_Valve,GetMapTaskTemp(6017,Map_Glb_Valve)-1);
		RemoveTrigger(GetTrigger(1267*2));
		RemoveTrigger(GetTrigger(1268*2));
		RemoveTrigger(GetTrigger(1269*2));
		RemoveTrigger(GetTrigger(1270*2));
		RemoveTrigger(GetTrigger(1271*2));
		RemoveTrigger(GetTrigger(1272*2));
		RemoveTrigger(GetRunningTrigger());
		RemoveTrigger(GetTrigger(3007*2));
		return 0;
	end
	local nNum = GetTask(Task_id_009);
	local nIndexNpc;
	if nNum == 0 then
		if GetTrigger(1267*2) ~= 0 then
		--if mod(GetTask(Task_id_010),12) == 0 then
			if GetTaskTemp(250) <= 12 then
				local i = random(2);
				local j = random(2);
				local tbTemp = {2,-2};
				nIndexNpc = CreateNpc("ThÝch Kh¸ch Hoµng Kú","ThÝch Kh¸ch Hoµng Kú",nMap,nX+tbTemp[i],nY+tbTemp[j]);
				SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\Õ½Æì.lua");
				SetNpcLifeTime(nIndexNpc,3*60);
				SetTaskTemp(250,GetTaskTemp(250)+1);
			end
		--end
		else
			CreateTrigger(0,1267,1267*2);
			Msg2Player("Xung quanh chiÕn kú xuÊt hiÖn ®ît tÊn c«ng thø 1!");
			SetTaskTemp(250,4);
			local nHp,nHp1 = GetUnitCurStates(GetTask(Task_id_011),1);
			SetTask(Task_id_013,nHp1);
			nIndexNpc = CreateNpc("ThÝch Kh¸ch Hoµng Kú","ThÝch Kh¸ch Hoµng Kú",nMap,nX+2,nY+2);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\Õ½Æì.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
			nIndexNpc = CreateNpc("ThÝch Kh¸ch Hoµng Kú","ThÝch Kh¸ch Hoµng Kú",nMap,nX-2,nY-2);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\Õ½Æì.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
			nIndexNpc = CreateNpc("ThÝch Kh¸ch Hoµng Kú","ThÝch Kh¸ch Hoµng Kú",nMap,nX+2,nY-2);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\Õ½Æì.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
			nIndexNpc = CreateNpc("ThÝch Kh¸ch Hoµng Kú","ThÝch Kh¸ch Hoµng Kú",nMap,nX-2,nY+2);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\Õ½Æì.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
		end
	elseif nNum == 1 then
		if GetTrigger(1268*2) ~= 0 then
			--if mod(GetTask(Task_id_010),12) == 0 then
			if GetTaskTemp(250) <= 12 then
				local i = random(2);
				local j = random(2);
				local tbTemp = {2,-2};
				nIndexNpc = CreateNpc("ThÝch Kh¸ch Hång Kú","ThÝch Kh¸ch Hång Kú",nMap,nX+tbTemp[i],nY+tbTemp[j]);
				SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\Õ½Æì.lua");
				SetNpcLifeTime(nIndexNpc,3*60);
				SetTaskTemp(250,GetTaskTemp(250)+1);
			end
			--end
		else
			CreateTrigger(0,1268,1268*2);
			Msg2Player("Xung quanh chiÕn kú xuÊt hiÖn ®ît tÊn c«ng thø 2!");
			SetTaskTemp(250,4);
			local nHp,nHp1 = GetUnitCurStates(GetTask(Task_id_011),1);
			SetTask(Task_id_013,nHp1);
			nIndexNpc = CreateNpc("ThÝch Kh¸ch Hång Kú","ThÝch Kh¸ch Hång Kú",nMap,nX+2,nY+2);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\Õ½Æì.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
			nIndexNpc = CreateNpc("ThÝch Kh¸ch Hång Kú","ThÝch Kh¸ch Hång Kú",nMap,nX-2,nY-2);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\Õ½Æì.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
			nIndexNpc = CreateNpc("ThÝch Kh¸ch Hång Kú","ThÝch Kh¸ch Hång Kú",nMap,nX+2,nY-2);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\Õ½Æì.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
			nIndexNpc = CreateNpc("ThÝch Kh¸ch Hång Kú","ThÝch Kh¸ch Hång Kú",nMap,nX-2,nY+2);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\Õ½Æì.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
		end
	elseif nNum == 2 then
		if GetTrigger(1269*2) ~= 0 then
			--if mod(GetTask(Task_id_010),12) == 0 then
			if GetTaskTemp(250) <= 12 then
				local i = random(2);
				local j = random(2);
				local tbTemp = {2,-2};
				nIndexNpc = CreateNpc("ThÝch Kh¸ch B¹ch Kú","ThÝch Kh¸ch B¹ch Kú",nMap,nX+tbTemp[i],nY+tbTemp[j]);
				SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\Õ½Æì.lua");
				SetNpcLifeTime(nIndexNpc,3*60);
				SetTaskTemp(250,GetTaskTemp(250)+1);
			end
			--end
		else
			CreateTrigger(0,1269,1269*2);
			Msg2Player("Xung quanh chiÕn kú xuÊt hiÖn ®ît tÊn c«ng thø 3!");
			SetTaskTemp(250,4);
			local nHp,nHp1 = GetUnitCurStates(GetTask(Task_id_011),1);
			SetTask(Task_id_013,nHp1);
			nIndexNpc = CreateNpc("ThÝch Kh¸ch B¹ch Kú","ThÝch Kh¸ch B¹ch Kú",nMap,nX+2,nY+2);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\Õ½Æì.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
	
			nIndexNpc = CreateNpc("ThÝch Kh¸ch B¹ch Kú","ThÝch Kh¸ch B¹ch Kú",nMap,nX-2,nY-2);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\Õ½Æì.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
		
			nIndexNpc = CreateNpc("ThÝch Kh¸ch B¹ch Kú","ThÝch Kh¸ch B¹ch Kú",nMap,nX+2,nY-2);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\Õ½Æì.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
		
			nIndexNpc = CreateNpc("ThÝch Kh¸ch B¹ch Kú","ThÝch Kh¸ch B¹ch Kú",nMap,nX-2,nY+2);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\Õ½Æì.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
		end
	elseif nNum == 3 then
		if GetTrigger(1270*2) ~= 0 then
			--if mod(GetTask(Task_id_010),12) == 0 then
			if GetTaskTemp(250) <= 12 then
				local i = random(2);
				local j = random(2);
				local tbTemp = {2,-2};
				nIndexNpc = CreateNpc("Lam Kú ThÝch Kh¸ch","Lam Kú ThÝch Kh¸ch",nMap,nX+tbTemp[i],nY+tbTemp[j]);
				SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\Õ½Æì.lua");
				SetNpcLifeTime(nIndexNpc,3*60);
				SetTaskTemp(250,GetTaskTemp(250)+1);
			end
			--end
		else
			CreateTrigger(0,1270,1270*2);
			Msg2Player("Xung quanh chiÕn kú xuÊt hiÖn ®ît tÊn c«ng thø 4!");
			SetTaskTemp(250,4);
			local nHp,nHp1 = GetUnitCurStates(GetTask(Task_id_011),1);
			SetTask(Task_id_013,nHp1);
			nIndexNpc = CreateNpc("Lam Kú ThÝch Kh¸ch","Lam Kú ThÝch Kh¸ch",nMap,nX+2,nY+2);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\Õ½Æì.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
		
			nIndexNpc = CreateNpc("Lam Kú ThÝch Kh¸ch","Lam Kú ThÝch Kh¸ch",nMap,nX-2,nY-2);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\Õ½Æì.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
		
			nIndexNpc = CreateNpc("Lam Kú ThÝch Kh¸ch","Lam Kú ThÝch Kh¸ch",nMap,nX+2,nY-2);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\Õ½Æì.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
		
			nIndexNpc = CreateNpc("Lam Kú ThÝch Kh¸ch","Lam Kú ThÝch Kh¸ch",nMap,nX-2,nY+2);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\Õ½Æì.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
		end
	elseif nNum == 4 then
		if GetTrigger(1271*2) ~= 0 then
			--if mod(GetTask(Task_id_010),12) == 0 then
			if GetTaskTemp(250) <= 12 then
				local i = random(2);
				local j = random(2);
				local tbTemp = {2,-2};
				nIndexNpc = CreateNpc("ThÝch Kh¸ch H¾c Kú","ThÝch Kh¸ch H¾c Kú",nMap,nX+tbTemp[i],nY+tbTemp[j]);
				SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\Õ½Æì.lua");
				SetNpcLifeTime(nIndexNpc,3*60);
				SetTaskTemp(250,GetTaskTemp(250)+1);
			end
			--end
		else
			CreateTrigger(0,1271,1271*2);
			Msg2Player("Xung quanh chiÕn kú xuÊt hiÖn ®ît tÊn c«ng thø 5!");
			SetTaskTemp(250,4);
			local nHp,nHp1 = GetUnitCurStates(GetTask(Task_id_011),1);
			SetTask(Task_id_013,nHp1);
			nIndexNpc = CreateNpc("ThÝch Kh¸ch H¾c Kú","ThÝch Kh¸ch H¾c Kú",nMap,nX+2,nY+2);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\Õ½Æì.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
		
			nIndexNpc = CreateNpc("ThÝch Kh¸ch H¾c Kú","ThÝch Kh¸ch H¾c Kú",nMap,nX-2,nY-2);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\Õ½Æì.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
		
			nIndexNpc = CreateNpc("ThÝch Kh¸ch H¾c Kú","ThÝch Kh¸ch H¾c Kú",nMap,nX+2,nY-2);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\Õ½Æì.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
		
			nIndexNpc = CreateNpc("ThÝch Kh¸ch H¾c Kú","ThÝch Kh¸ch H¾c Kú",nMap,nX-2,nY+2);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\Õ½Æì.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
		end		
	elseif nNum == 5 then
		if GetTrigger(1272*2) ~= 0 then
			if mod(GetTask(Task_id_010),3) == 0 then
				if GetTaskTemp(250) < 1 then
					local i = random(2);
					local j = random(2);
					local tbTemp = {2,-2};
					nIndexNpc = CreateNpc("H÷u hé ph¸p Lý Tam §ao","H÷u hé ph¸p Lý Tam §ao",nMap,nX+tbTemp[i],nY+tbTemp[j]);
					SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\Õ½Æì.lua");
					SetNpcLifeTime(nIndexNpc,3*60);
					SetTaskTemp(250,GetTaskTemp(250)+1);
				end
			end
		else
			CreateTrigger(0,1272,1272*2);
			Msg2Player("Xung quanh chiÕn kú xuÊt hiÖn ®ît tÊn c«ng thø 6!");
			SetTaskTemp(250,1);
			local nHp,nHp1 = GetUnitCurStates(GetTask(Task_id_011),1);
			SetTask(Task_id_013,nHp1);
			nIndexNpc = CreateNpc("H÷u hé ph¸p Lý Tam §ao","H÷u hé ph¸p Lý Tam §ao",nMap,nX,nY+1);
			SetNpcDeathScript(nIndexNpc,"\\script\\task\\item\\Õ½Æì.lua");
			SetNpcLifeTime(nIndexNpc,3*60);
			SetCampToNpc(nIndexNpc,"camp_evil");
		end
	end
end

function huangqicike_118()
	SetTask(Task_id_009,GetTask(Task_id_009)+1);
	RemoveTrigger(GetRunningTrigger());
end

function hongqicike_118()
	SetTask(Task_id_009,GetTask(Task_id_009)+1);
	RemoveTrigger(GetRunningTrigger());
end

function baiqicike_118()
	SetTask(Task_id_009,GetTask(Task_id_009)+1);
	RemoveTrigger(GetRunningTrigger());
end

function lanqicike_118()
	SetTask(Task_id_009,GetTask(Task_id_009)+1);
	RemoveTrigger(GetRunningTrigger());
end

function heiqicike_118()
	SetTask(Task_id_009,GetTask(Task_id_009)+1);
	RemoveTrigger(GetRunningTrigger());
end

function lisandao_118()
	SetTask(Task_id_009,GetTask(Task_id_009)+1);
	RemoveTrigger(GetRunningTrigger());
end

function OnDeath(npcIndex)
	SetNpcLifeTime(npcIndex,0);
end

function Leave_Game()
		RemoveTrigger(GetTrigger(1267*2));
		RemoveTrigger(GetTrigger(1268*2));
		RemoveTrigger(GetTrigger(1269*2));
		RemoveTrigger(GetTrigger(1270*2));
		RemoveTrigger(GetTrigger(1271*2));
		RemoveTrigger(GetTrigger(1272*2));
		RemoveTrigger(GetTrigger(1518*2));
		local nHp,nHp1 = GetUnitCurStates(GetTask(Task_id_011),1);
		SetTask(Task_id_013,nHp1);
		if GetTask(Task_id_009) ~= 6 or GetTask(Task_id_008) ~= 2 then
			SetTask(Task_id_008,1);
		end
		SetNpcLifeTime(GetTask(Task_id_011),0);
		SetTask(Task_id_011,0);
		SetTask(Task_id_010,0);
		SetTaskTemp(250,0);
		RemoveTrigger(GetRunningTrigger());
		SetMapTaskTemp(6017,Map_Glb_Valve,GetMapTaskTemp(6017,Map_Glb_Valve)-1);
end