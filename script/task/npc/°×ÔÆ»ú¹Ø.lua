Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")

function main()
	if tGtTask:check_cur_task(40) == 0  then
		Talk(1,"","C¬ quan rÊt nguy hiÓm kh«ng nªn ®Õn gÇn!");
	else
		if GetTask(Task_id_005) == 1 then
			if GetMapTaskTemp(111,Map_Glb_Valve4) >= 15 then
				Talk(1,"","Qu¸ nhiÒu Muçi §éc, h·y quay l¹i sau.")
				return 0;
			end
			--Ë¢¹Ö
			local nNpcIndex;
			for i=1,15 do 
				nNpcIndex = CreateNpc("Muçi ®éc","Muçi ®éc",111,1830,2849,0,1,1,100)
				SetNpcDeathScript(nNpcIndex,"\\script\\task\\npc\\¶¾ÎÃDeath.lua");
				SetMapTaskTemp(111,Map_Glb_Valve4,GetMapTaskTemp(111,Map_Glb_Valve4)+1);
			end
			local sName = gf_GetPlayerSexName();
			Talk(1,"",format("%s cÈn thËn, xuÊt hiÖn 1 ®ît muçi ®éc",sName));
			Msg2Player(format("%s cÈn thËn, xuÊt hiÖn 1 ®ît muçi ®éc",sName));
		else
			Talk(1,"","C¬ quan rÊt nguy hiÓm kh«ng nªn ®Õn gÇn!");
		end
	end
end