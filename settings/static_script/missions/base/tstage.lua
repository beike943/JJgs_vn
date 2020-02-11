--------------------------------------------------------------------
-- stage template
-- by windle
-- 2010-3-28 21:00
--------------------------------------------------------------------
--IncludeDbgLib("\\FSM\\fsm_handler.lua")

--emptyPhase = {
--	onTimer = function() print("[empty timer]") end,
--	onInit = function() print("[empty init]") end,
--}

tStageBase = {
	tPhases = {},
	rule = {},

	nStageStepLimit = 2;
}

function tStageBase:onInit()
	g_theMS:SetMissionV(MV_TIMER_STEP, 0)
end

function tStageBase:setStates(tStates)
	states = tStates;
end

function tStageBase:onTimer(nStep)
	self:getPhase():onTimer(nStep);
end

function tStageBase:onTalk()
	local phase = self:getPhase();
	if phase.onTalk then
		phase:onTalk()
	end
end

function tStageBase:onNpcDeath(npcIdx)
	local phase = self:getPhase();
	if phase.onNpcDeath then
		phase:onNpcDeath(npcIdx)
	end
end

function tStageBase:onTrap(nId)
	local phase = self:getPhase();
	if phase.onTrap then
		phase:onTrap(nId)
	end
end
--------------------------------------------------------------------

function tStageBase:getPhase()
	local n = g_theMS:GetMissionV(MV_PHASE)
	local s = self.tPhases[n];
	if not s then
		print(format("[error] [tStageBase:getPhase] [n=%s, s=%s]", tostring(n), tostring(s)));
		return emptyPhase;
	end
	return s;
end
function tStageBase:setPhase(nPhase)
	g_theMS:SetMissionV(MV_PHASE, nPhase);
	g_theMS:SetMissionV(MV_TIMER_STEP, 0)
	self:getPhase():onInit();
end

function tStageBase:action(act)
	local p = self.rule[act];
	if type(p) == "function" then
		return p(act);
	end
	if not p then
		print(format("[tStage1:action] [error Action] [act=%s]", tostring(act)));
		return
	end
	self:setPhase(p);
end

---------------------------------------------------------------------
function stageAction(act)
	getStage():action(act);
end

function getStage(t)
	t = t or g_theMS;
	local n = t:GetMissionV(MV_STAGE);
	local s = t.stages[n];
	if not s then
		print(format("lv=%s, s=%s", tostring(n), tostring(s)));
	end
	return s;
end

function setStage(n)
	if n <= 0 or n > getn(g_theMS.stages) then
		print(format("[setStage] [error stage id] [id = %s]", tostring(n)));
		return
	end
	g_theMS:SetMissionV(MV_STAGE, n);
	getStage():onInit();
end
