--=======================================================
--create by baiyun 2009.5.30
--describe:越南版7月份活动之一追寻长生普，礼花筒脚本
--======================================================
Include("\\script\\online\\viet_event\\200907\\event_head.lua");

function OnUse(nItemIdx)
	if DelItemByIndex(nItemIdx, 1) == 1 then
		DoFireworks(871, 1);
	end
end;