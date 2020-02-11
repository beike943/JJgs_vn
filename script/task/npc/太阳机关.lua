Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")

function main()
	if tGtTask:check_cur_task(40) == 0  then
		Talk(1,"","C¬ quan rÊt nguy hiÓm kh«ng nªn ®Õn gÇn!");
	else
		if GetTask(Task_id_005) == 0 then
			if GetMapTaskTemp(111,Map_Glb_Valve2) >= 10 then
				Talk(1,"","Qu¸ nhiÒu H¾c Tinh Tinh, h·y quay l¹i sau.")
				return 0;
			end
			--Ë¢¹Ö
			local nNpcIndex;
			for i=1,10 do 
				nNpcIndex = CreateNpc("H¾c Tinh Tinh","H¾c Tinh Tinh",111,1862,3040,0,1,1,100)
				SetNpcDeathScript(nNpcIndex,"\\script\\task\\npc\\ºÚĞÉĞÉDeath.lua");
				SetMapTaskTemp(111,Map_Glb_Valve2,GetMapTaskTemp(111,Map_Glb_Valve2)+1);
			end
			local sName = gf_GetPlayerSexName();
			Talk(1,"",format("%s cÈn thËn, xuÊt hiÖn 1 ®ît H¾c Tinh Tinh",sName));
			Msg2Player(format("%s cÈn thËn, xuÊt hiÖn 1 ®ît H¾c Tinh Tinh",sName));
		else
			Talk(1,"","C¬ quan rÊt nguy hiÓm kh«ng nªn ®Õn gÇn!");
		end
	end
end