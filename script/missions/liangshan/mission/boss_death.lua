function OnDeath(npcIdx)
	SendScript2VM("\\script\\missions\\liangshan\\mission\\mission.lua", format("OnBossDeath(%d)",npcIdx))
end
