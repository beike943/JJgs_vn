Include("\\script\\online\\viet_event\\ip_bonus\\ip_head.lua") -- IP bonus

function viet_playerlogout_main()
	IpBonusClose()
	if GetTrigger(2509) ~= 0 then
		RemoveTrigger(GetTrigger(2509))
		SetCurrentNpcSFX(PIdx2NpcIdx(),917,1,1)
	end
end
