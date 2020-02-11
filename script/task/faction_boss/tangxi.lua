-- =============================================================
-- FileName : tangxi.lua
-- Desc     : ÌÆÏ²µÄ½Å±¾£¬ÌÆÃÅµôÏä×Ó
-- Date     : Dec 20 2006
-- Creator  : Tony(Jizheng)
-- =============================================================

function OnDeath(nNpcIndex)

	-- µÃµ½µ±Ç°µÄnpc×ø±ê
	local nMapID, nWx, nWy = GetWorldPos()
	local nAddX = 0
	local nAddY = 0
	local nTargetNpc = 0
	
	-- call³öÀ´10¸öËæ»úÉ¢ÂäµÄÏä×Ó
	for i = 1, 10 do
		nAddX = random(-15, 15)
		nAddY = random(-15, 15)
		
		nTargetNpc = CreateNpc("Tói cao thñ", "Tói h¹nh phóc", nMapID, nWx + nAddX, nWy + nAddY)
		SetNpcLifeTime(nTargetNpc, 300)
		SetNpcScript(nTargetNpc, "\\script\\task\\faction_boss\\boss_baoxiang_tangmen.lua")
	end
	
	-- ÏûÊ§×Ô¼º
	SetNpcLifeTime(nNpcIndex, 0)
	SetNpcScript(nNpcIndex, "")
end;