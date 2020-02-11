Include("\\script\\missions\\kuafu_battle\\kf_head.lua")

function CanEquip()
	return 0;
end;

function OnUse()
	local nMapCurrID, nMapID = gf_GetCurMapID();
	if nMapID ~= KF_MAP_ID then
		Msg2Player("Trong chiÕn tr­êng liªn ®Êu míi cã thÓ dïng");
		return 1;	--²»ÄÜ´©
	end;
	return 0;
end;

function OnEquip()
	return 0;
end

function OnUnEquip()
	return 0
end