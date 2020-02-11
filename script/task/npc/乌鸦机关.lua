Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")

function main()
	if tGtTask:check_cur_task(40) == 0  then
		Talk(1,"","C¬ quan rÊt nguy hiÓm kh«ng nªn ®Õn gÇn!");
	else
		if GetTask(Task_id_005) == 3 then
			if GetMapTaskTemp(111,Map_Glb_Valve5) >= 8 then
				Talk(1,"","Qu¸ nhiÒu Niªn Thó lín, h·y quay l¹i sau.")
				return 0;
			end
			--Ë¢¹Ö
			local nNpcIndex;
			nNpcIndex = CreateNpc("Niªn thó to lín","Niªn thó to lín",111,1698,3114,0,1,1,100)
			SetNpcDeathScript(nNpcIndex,"\\script\\task\\npc\\ÄêÊŞDeath.lua");
			SetMapTaskTemp(111,Map_Glb_Valve5,GetMapTaskTemp(111,Map_Glb_Valve5)+1);
			local sName = gf_GetPlayerSexName();
			Talk(1,"",format("%s cÈn thËn, xuÊt hiÖn 1 Niªn Thó to lín.",sName));
			Msg2Player(format("%s cÈn thËn, xuÊt hiÖn 1 Niªn Thó to lín.",sName));
		else
			Talk(1,"","C¬ quan rÊt nguy hiÓm kh«ng nªn ®Õn gÇn!");
		end
	end
end