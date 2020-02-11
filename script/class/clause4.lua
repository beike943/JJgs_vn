#ÎªClause¼ÓÉÏÐÂµÄLogDB

Include("\\script\\class\\clause2.lua");


Clause4 = Clause2

function Clause4:giveItem(Item)
	-- item½á¹¹
	--{ name, {g,d,p,n,...}, p3, p4 }
	-- ËµÃ÷:
	--		Ò»°ãÇé¿ö	{ÎïÆ·Ãû, {g,d,p,n,....}}
	--		¿ÕÎïÆ·		{ nil }
	--		¾­Ñé,ÉùÍûµÈ	{{type, num or func}}		type = 'Exp', 'Rep', 'Money'
	local nRet, nItemIdx;
	local szNotice = Item[3] or "";
	local nItemIdx = nil;
	local nNum = 0;
	if Item[1] == nil then
		return
	end
	if type(Item[1]) == "table" then
		szType = Item[1][1];
		nNum = Item[1][2];
		if type(nNum) == "function" then
			nNum = nNum();
		end
		gf_Modify(szType, nNum);
		gf_Log(format("%s\t%d", szType, nNum))
		if szNotice then
			local t = {Exp="Kinh nghiÖm",SchoolRep="Danh väng s­ m«n",Money="Vµng vâ l©m"};
			local szItemName = t[szType];
			szNotice = gsub(szNotice,"%$i",format("[%s] x%d", szItemName,nNum));
		end
		nRet, nItemIdx = 1, nil;
	else
		local tExpireTime = Item[4];
		if type(tExpireTime) == "table" then
			for i = 1, Item[2][4] do
				nRet, nItemIdx = gf_AddItems(Item[2], Item[1], 1);
				gf_SetItemExpireTime(nItemIdx, gf_UnPack(tExpireTime));
			end
		else
			nRet, nItemIdx = gf_AddItems(Item[2], Item[1]);
		end
		szNotice = gsub(szNotice,"%$i",format("[%s] x%d", Item[1], Item[2][4]));
	end
	szNotice = gsub(szNotice,"%$n",GetName());
	if szNotice ~= "" then
		Msg2Global(szNotice);
	end
	return nRet, nItemIdx;
end

function Clause4:giveClause()
	if type(self.onGiveClause) == 'function' then
		self:onGiveClause();
	end
	if self ~= Clause4 and self.giveClause ~= nil then
		return self:giveClause();
	else
		return Clause2:giveItem(self);
	end
end

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
			return Clause2.giveClause(self.subclauses[i][1]), i;
		end
	end
	return 0;
end

function ClauseRandomAll:giveClause()
	local maxRand = self.maxRand;
	local randMulti = self.randMulti or 1;
	assert(maxRand > 0)
	local tLucky = {}
	for i = 1, getn(self.subclauses) do
		if random(1,maxRand*randMulti) <= self.subclauses[i][2]*randMulti then
			tLucky[i] = Clause2.giveClause(self.subclauses[i][1]);
		end
	end
	return 1, tLucky;
end