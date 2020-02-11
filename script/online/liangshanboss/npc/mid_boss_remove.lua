--BOSS被移除的时候执行的处理
Include("\\script\\online\\liangshanboss\\lsb_head.lua")

function OnRemove()
--	print("OnRemove");
	--清理
	local nMapId1,nMapId2 = SubWorldIdx2ID(SubWorld);
	SetMapTaskTemp(nMapId1,LSB_MAP_TASK_TEMP,GetMapTaskTemp(nMapId1,LSB_MAP_TASK_TEMP) - 1);
	return 1;
end