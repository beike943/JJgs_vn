Include("\\script\\online\\dazitie\\dzt_head.lua")

if dzt_activity_isopen() == 1 and SubWorldID2Idx(207) ~= -1 and dzt_relay_allow_time() == 1 then
	dzt_relay_create_boss();
end
