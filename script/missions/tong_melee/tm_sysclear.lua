Include("\\script\\missions\\tong_melee\\tm_head.lua")

function main()
	if IsTongMeleeSystemOpen() ~= 1 then
		return
	end
	local today = Date();
	if today:week() ~= 5 then
		return 0;
	end
	local nVersion,nCurGs = GetRealmType();
	if nCurGs == 0 then
		local s = SDB(TM_RANK_INSOURCEREALM, 0, 0);
		s:delete();
		DebugOutput("INSOURCEREALM clear!!!");
	else
		local s = SDB(TM_RANK_INMATCHREALM, 0, 0);
		s:delete();
		DebugOutput("INMATCHREALM clear!!!");
	end
end