Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
Include("\\script\\lib\\define.lua")

function OnUse(nItem)
	if tGtTask:check_cur_task(257) ~= 1 then
		DelItemByIndex(nItem, 1);
		return 0;
	end
	local nMapId = GetWorldPos();
	if nMapId ~= 218 then
		Msg2Player("H·y ®Õn Linh B¶o S¬n triÖu håi L«i KiÕp Thó!");
		return 0;
	end
	Say("X¸c nhËn muèn triÖu håi L«i KiÕp Thó?", 2, "§ång ý/_TiaoZhanljs", "Hñy bá/nothing")
end

function _TiaoZhanljs()
	if GetTime() - GetTask(TASKID_LEIJIESHOU_TIME) < 15 * 60 then
		Say("T¹m thêi kh«ng thÓ triÖu håi L«i KiÕp Thó, h·y thö l¹i sau!", 0);
		return 0;
	end
	local npcIndex = CreateNpc("leijieshou","L«i KiÕp Thó", GetWorldPos());
	if npcIndex > 0 then
		SetNpcDeathScript(npcIndex, "\\script\\task\\item\\leijiefu.lua");
		SetNpcLifeTime(npcIndex, 15 * 60);
		SetTask(TASKID_LEIJIESHOU_TIME, GetTime());
	end
end

function OnDeath(id)
	BigDelItem(2,1,30723,BigGetItemCount(2,1,30723));
	SetNpcLifeTime(id, 0);
end