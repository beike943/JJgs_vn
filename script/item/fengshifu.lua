Include("\\script\\class\\ktabfile.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua")

tabCorpseRevival = new(KTabFile, "\\settings\\skill\\corpse_revival.txt");

function OnUse(nParticular)
	local nMapID = GetWorldPos()
	if nMapID == 887 or nMapID == 606 or (nMapID == 884 and GetFightState() == 0) then 
		Talk(1,"","Khu vùc nµy kh«ng thÓ gäi Thi !!!");
		return 0;
	end;

	--Ëæ»úÊÍ·ÅÊ¬ÌåÅäÖÃ±í
	--Ïî¸ñÊ½£º[particular] = {{lower = range_lower_1, upper = range_upper_1, probability = probability_1}, ..., {lower = range_lower_n, upper = range_upper_n, probability = probability_n}},
	--ÆäÖÐ£¬particular£º·âÊ¬·ûµÄÏ¸Àà£»range_lower_n£ºµÚn¸öËæ»ú·¶Î§ÏÂÏÞ£»range_upper_n£ºµÚn¸öËæ»ú·¶Î§ÉÏÏÞ£»probability_n£ºµÚn¸öËæ»ú·¶Î§µÄ¸ÅÂÊ£¨·¶Î§ÖÐµÈËæ»ú£©£»
	--Ëæ»ú·¶Î§ÖÐµÄÈ¡Öµ£¬¶ÔÓ¦ÓÚ"corpse_revival.txt"ÖÐ³ý±íÍ·ÍâµÄµÚ¼¸ÐÐ
	--Èç£º[10000] = {{lower = 41, upper = 70, probability = 60}, {lower = 71, upper = 71, probability = 10}, {lower = 72, upper = 81, probability = 30}}
	--Ï¸ÀàÎª10000µÄ·âÊ¬·û£¬
	--ÕÐ³ö"corpse_revival.txt"ÖÐ³ý±íÍ·ÍâµÄµÚ41ÐÐµ½µÚ70ÐÐÊ¬ÌåµÄ¸ÅÂÊÎª60 / (60 + 10 + 30) * 100% = 60%£¬ÆäÖÐ[41, 70]ÖÐÃ¿¸öÐÐºÅµÄ¸ÅÂÊÎª60% / (70 - 41 + 1) = 2%
	--ÕÐ³öµÚ71ÐÐÊ¬ÌåµÄ¸ÅÂÊÎª10 / (60 + 10 + 30) * 100% = 10%
	--ÕÐ³öµÚ72ÐÐµ½µÚ81ÐÐÊ¬ÌåµÄ¸ÅÂÊÎª30 / (60 + 10 + 30) * 100% = 30%£¬ÆäÖÐ[72, 81]ÖÐÃ¿¸öÐÐºÅµÄ¸ÅÂÊÎª30% / (81 - 72 + 1) = 3%
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