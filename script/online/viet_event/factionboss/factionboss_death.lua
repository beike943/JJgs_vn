--=============================================
-- Event Héi Ngé Cao Thñ
-- Created by TuanNA5
--=============================================

Include("\\script\\online\\viet_event\\factionboss\\head_factionboss.lua");

function OnDeath(nNpcIndex)
	SetNpcLifeTime(nNpcIndex, 30);
	local szNpcName = GetNpcName(nNpcIndex)	
	local nMapID, nWx, nWy = GetNpcWorldPos(nNpcIndex)
	local nAddX,nAddY = 0,0	
	local nTargetNpc = 0		
	local nFactionState = CheckFactionState(szNpcName)	
	for i = 1, 50 do
		nAddX = random(-30, 30)
		nAddY = random(-30, 30)
		nTargetNpc = CreateNpc("Tói cao thñ", "Tói cña "..szNpcName, nMapID, nWx + nAddX, nWy + nAddY)
		AddUnitStates(nTargetNpc,0,nFactionState-1)
		SetNpcLifeTime(nTargetNpc, 5*60)
		SetNpcScript(nTargetNpc, "\\script\\online\\viet_event\\factionboss\\factionboss_baoguo.lua")
	end	
	SetNpcLifeTime(nNpcIndex, 0);
	local nHour = tonumber(date("%H"))
	local nTime = 0
	if nHour >= 22 then
		nTime = 3
	elseif nHour >= 16 then
		nTime = 2
	elseif nHour >= 8 then
		nTime = 1
	else
		nTime = 0
	end
	call_faction_boss_new(nTime, nMapID, nWx, nWy)
end