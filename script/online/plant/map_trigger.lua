Include("\\script\\online\\plant\\tree_head.lua");
--note:07年2月9日由于取消种树的时间限制，种树地图改为死亡有惩罚地区
function EnterMap()
	SetDeathScript("");
	SetTask(TASK_TREEINDEX,0);	--
	SetTask(TASK_TREEGROW,0);	--
	SetTask(TASK_PLANTTIME,0);
	Create_Map_Trigger();
	if checktime() == 1 and checkplace() == 1 then
		--SetDeathPunish(0);
		--Msg2Player("进入种植地图，在这里将不会有死亡惩罚");
	end;
end;

function LeaveMap()
	if checkplace() == 1 then
		--Msg2Player("离开种植地图，恢复死亡惩罚");
	end;
	if GetTime() - GetTask(TASK_PLANTTIME) > TREELIFETIME then	--如果离开地图的时候树已自然死亡
		SetTask(TASK_TREEINDEX,0);	--
	end;
	local npcIndex = GetTask(TASK_TREEINDEX);
	if npcIndex > 0 then	--如果离开地图的时候树还活着
		SetNpcScript(npcIndex,"");
		SetNpcLifeTime(npcIndex,0);
	end;
	SetDeathScript("");	--设置死亡脚本为空
	SetTask(TASK_TREEINDEX,0);	--
	SetTask(TASK_TREEGROW,0);	--
	SetTask(TASK_PLANTTIME,0);	
	--SetDeathPunish(1);

	Create_Map_Trigger();
end;
