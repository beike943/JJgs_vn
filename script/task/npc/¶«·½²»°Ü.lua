Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")

function OnDeath(nNpcIndex)
	--print(GetNpcName(nNpcIndex));
	--删除触发器
	if GetTrigger(1521*2) ~= 0 then
		RemoveTrigger(GetTrigger(1521*2));
		SetTaskTemp(250,0);
	end
	--标记重置，npc删除
	SetNpcLifeTime(GetMapTaskTemp(6017,Map_Glb_Valve6),0);
	SetNpcLifeTime(GetMapTaskTemp(6017,Map_Glb_Valve7),0);
	SetNpcLifeTime(GetMapTaskTemp(6017,Map_Glb_Valve8),0);
	SetNpcLifeTime(nNpcIndex,0);
	SetMapTaskTemp(6017,Map_Glb_Valve1,0);
	--组队完成任务
	local nSize = GetTeamSize();
	local oldPlayerIndex = PlayerIndex;
	for i = 1, nSize do
		PlayerIndex = GetTeamMember(i);
		if tGtTask:check_cur_task(72) == 1 and GetTask(Task_id_014) == 0 then
			SetTask(Task_id_014,1);
			Msg2Player("Х nh b筰 Йng Phng B蕋 B筰");
		end
	end
	PlayerIndex = oldPlayerIndex;
end