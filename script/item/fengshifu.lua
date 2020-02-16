Include("\\script\\class\\ktabfile.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua")

tabCorpseRevival = new(KTabFile, "\\settings\\skill\\corpse_revival.txt");

function OnUse(nParticular)
	local nMapID = GetWorldPos()
	if nMapID == 887 or nMapID == 606 or (nMapID == 884 and GetFightState() == 0) then 
		Talk(1,"","这个地方不能召唤");
		return 0;
	end;

	--随机释放尸体配置表
	--项格式：[particular] = {{lower = range_lower_1, upper = range_upper_1, probability = probability_1}, ..., {lower = range_lower_n, upper = range_upper_n, probability = probability_n}},
	--其中，particular：封尸符的细类；range_lower_n：第n个随机范围下限；range_upper_n：第n个随机范围上限；probability_n：第n个随机范围的概率（范围中等随机）；
	--随机范围中的取值，对应于"corpse_revival.txt"中除表头外的第几行
	--如：[10000] = {{lower = 41, upper = 70, probability = 60}, {lower = 71, upper = 71, probability = 10}, {lower = 72, upper = 81, probability = 30}}
	--细类为10000的封尸符，
	--招出"corpse_revival.txt"中除表头外的第41行到第70行尸体的概率为60 / (60 + 10 + 30) * 100% = 60%，其中[41, 70]中每个行号的概率为60% / (70 - 41 + 1) = 2%
	--招出第71行尸体的概率为10 / (60 + 10 + 30) * 100% = 10%
	--招出第72行到第81行尸体的概率为30 / (60 + 10 + 30) * 100% = 30%，其中[72, 81]中每个行号的概率为30% / (81 - 72 + 1) = 3%
	local tParticularRandom = {
	[10000] = {{lower = 1, upper = 46, probability = 2730},{lower = 47, upper = 50, probability = 190},{lower = 51, upper = 145, probability = 5640},{lower = 146, upper = 148, probability = 9},{lower = 150, upper = 150, probability = 1},{lower = 152, upper = 175, probability = 1430}}
	}

	if (tParticularRandom[nParticular] ~= nil) then
		local bRandomSuccessful = 0;

		local nTotalProbability = 0;

		local n = 0;
		while (tParticularRandom[nParticular][n + 1] ~= nil) do
			nTotalProbability = nTotalProbability + tParticularRandom[nParticular][n + 1]["probability"];
			n = n + 1;
		end

		if (nTotalProbability > 0) then
			local rand = random(nTotalProbability);
			for i = 1, n do
				if (rand <= tParticularRandom[nParticular][i]["probability"]) then
					nParticular = random(tParticularRandom[nParticular][i]["lower"], tParticularRandom[nParticular][i]["upper"]);
					bRandomSuccessful = 1;
					break;
				else
					rand = rand - tParticularRandom[nParticular][i]["probability"];
				end
			end
		end

		if (bRandomSuccessful == 0) then
			return 0;
		end
	end

	local szTemplateName = tostring(tabCorpseRevival:getCell(nParticular + 1, "NpcTemplateName"));
	local nSubwordID, nPX, nPY = GetWorldPos();
	if CreateNpcCorpse(szTemplateName, nSubwordID, nPX, nPY, 9 * 60) > 0 then
		return 1;
	else
		return 0;
	end
end
