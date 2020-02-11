-----------------------------------------------------------------------
-- 给物品模板2
-- by windle
-- 2008-12-24 11:34
-- 说明:
--	Clause = { subclauses }
--	subclauses = [Clause, Award]*
--	Award = [Item, {Item, nRate}]		; nRate = 概率
--	Item = {name,{g,d,p,n...}}
--		  | { ["nil","Exp","Rep","School Rep", "Money"], nil, nMin, nMax}
--	类图:
--		Clause2 基类
--			ClauseAll		全给
--			ClauseRandom	联合概率
--			ClauseRandomAll	独立概率
--	Clause2调用入口 : Clause2:preprocess()
--	Clause2给物品函数 Clause2:giveClause()	可以自由重载
-----------------------------------------------------------------------
Include("\\script\\class\\mem.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\hash_callback.lua");
-----------------------------------------------------------------------
GIVEMETHOD_CHOOSEONE = 3

-- CLAUSE_TYPE
CT_CLAUSE = 1
CT_ITEM = 2
CT_MONEY = 3
CT_REPUTATION = 4

PlayersChoices = PlayersChoices or {}			-- 一个全局的玩家选择保存tab

-----------------------------------------------------------------------

------------------------------------------------------------------------------
Clause2 = {
	clausetype = CT_CLAUSE,
	subclauses = nil,
}

function Clause2:giveClause()
	if self.giveClause ~= nil then
		self:giveClause();
	else
		Clause2:giveItem(self);
	end
	if type(self.onGiveClause) == 'function' then
		self:onGiveClause();
	end
end
function Clause2:giveItem(Item)
	-- item结构
	--{ name, {g,d,p,n,...}, p3, p4 }
	-- 说明:
	--		一般情况	{物品名, {g,d,p,n,....}}
	--		空物品		{"nil"}
	--		经验,声望等	{type, nil, nMin, nMax}		type = 'Exp', 'Rep', 'Money'
	local nItemIdx = nil;
	if Item[2] == nil then
		if Item[1] == 'nil' then
			return
		end
		local nNum = Item[3];
		if Item[4] then
			nNum = random(Item[3], Item[4]);
		end
		gf_Modify(Item[1], nNum);
	else
		local nItemIdx = gf_AddItemEx(Item[2], Item[1]);
	end

	return nItemIdx;
end

function Clause2:preprocess(...)
	PlayersChoices:resetPlayerTable(self);
	local pcTable = PlayersChoices:getPlayerTable();
	pcTable.arg = arg;

	self:process();
end

function Clause2:process()
	local pcTable = PlayersChoices:getPlayerTable();
	pcTable.tCurClause = pcTable.tOpen[1];
	local tCurClause = pcTable.tCurClause;
	if not tCurClause then
		pcTable.table:giveClause(pcTable.arg);
		return
	end
	tremove(pcTable.tOpen, 1);

	if tCurClause.needChoice and tCurClause.needChoice() then
		Clause2.ShowChoices(0);
	else
		if tCurClause.subclauses then
			for _,v in tCurClause.subclauses do
				tinsert(pcTable.tOpen,1,v);
			end
		end
		self:process();
	end
end

function Clause2.ShowChoices(nPage)
	local pcTable = PlayersChoices:getPlayerTable();
	local self = pcTable.tCurClause;
	if not self then
		print("ERROR ------------------- CHOOSE");
		return
	end

	local nItemPerPage = 6;
	local nBaseIdx = nPage * nItemPerPage + 1;
	local tChoice = {}
	local tClause = self.subclauses;
	for i = nBaseIdx, nBaseIdx + nItemPerPage - 1 do
		if tClause[i] ~= nil then
			local title = tClause[i].Title or tClause[i][1];
			tinsert(tChoice, title.."/#Clause2.Choose("..i..")");
		end
	end
	if nPage > 0 then
		tinsert(tChoice, format("previous pages/#Clause2.ShowChoices(%d)", nPage-1));
	end
	if getn(tClause) >= nBaseIdx + nItemPerPage then
		tinsert(tChoice, format("next pages/#Clause2.ShowChoices(%d)", nPage+1));
	end
	tinsert(tChoice, "Close/Clause2.close");
	local choiceMsg = self.choiceMsg or "Please select:";
	Say(choiceMsg, getn(tChoice), tChoice);
end

function Clause2.Choose(n)
	local pcTable = PlayersChoices:getPlayerTable();
	tSelClause = pcTable.tCurClause.subclauses[n];
	pcTable.total_table = pcTable.total_table + 1;
	tinsert( pcTable.tOpen, 1, tSelClause);
	tinsert( pcTable, {pcTable.tCurClause, n} );
	Clause2:process();
end

function Clause2.close()
	PlayersChoices:freePlayerTable()
end
------------------------------------------------------------------------------
ClauseAll = {}
function ClauseAll:giveClause()
	for i=1, getn(self.subclauses) do
		Clause2.giveClause(self.subclauses[i]);
	end
end
ClauseAll = inherit(Clause2, ClauseAll);

------------------------------------------------------------------------------
ClauseRandom = {
	randMulti = 1,
}
function ClauseRandom:giveClause()
	local maxRand = 0;
	local randMulti = self.randMulti or 1;
	for i = 1, getn(self.subclauses) do
		maxRand = maxRand + self.subclauses[i][2]*randMulti;
	end
	local rnd = random(1,maxRand);

	for i = 1, getn(self.subclauses) do
		rnd = rnd - self.subclauses[i][2]*randMulti;
		if rnd <= 0 then
			Clause2.giveClause(self.subclauses[i][1]);
			return i;
		end
	end
	return 0;
end
ClauseRandom = inherit(Clause2, ClauseRandom);

------------------------------------------------------------------------------
ClauseRandomAll = {
	maxRand = 100,
	randMulti = 1,
}
function ClauseRandomAll:giveClause()
	local maxRand = self.maxRand;
	local randMulti = self.randMulti or 1;
	assert(maxRand > 0)
	local tLucky = {}
	for i = 1, getn(self.subclauses) do
		if random(1,maxRand*randMulti) <= self.subclauses[i][2]*randMulti then
			Clause2.giveClause(self.subclauses[i][1]);
			tLucky[i] = 1;
		end
	end
	return tLucky;
end
ClauseRandomAll = inherit(Clause2, ClauseRandomAll);

------------------------------------------------------------------------------
ClauseChoice = {}
function ClauseChoice:giveClause()
	local pcTable = PlayersChoices:getPlayerTable();
	for i = 1, pcTable.total_table do
		if self == pcTable[i][1] then
			local nCh = pcTable[i][2]
			Clause2.giveClause(self.subclauses[nCh]);
		end
	end
end
function ClauseChoice:needChoice()
	return 1
end
ClauseChoice = inherit(Clause2, ClauseChoice);
------------------------------------------------------------------------------


------------------------------------------------------------------------------
--g_PlayersChoices["xx"] = {
--	[1] = { table, choice },
--	[2] = { t2, c2 },
--	table = nil,
--	cur_table = 1,
--	total_table = 2,
--}
function PlayersChoices:resetPlayerTable(tClause)
	PlayersChoices[GetName()] = {};
	local pcTable = PlayersChoices[GetName()];
	pcTable.table = tClause;
	pcTable.cur_table = 1;
	pcTable.total_table = 0;
	pcTable.tOpen = {};
	tinsert( pcTable.tOpen, 1, tClause);
end
function PlayersChoices:getPlayerTable()
	return PlayersChoices[GetName()];
end
function PlayersChoices:freePlayerTable()
	PlayersChoices[GetName()] = nil;
end
