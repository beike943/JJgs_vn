--磨刀石

function OnUse()
	Say("使用磨刀石可以在一定范围内随机调整武器的攻击力.",2,"开始/StartKnife","不需要/do_nothing")
end

function StartKnife()
	if GetFightState() ~= 0 then
		Talk(1,"","现在不能使用这个道具");
		return 0;
	end
	KnifeStone();
	return 1;
end

function do_nothing()
--do nothing
end

--统计道具的使用情况
function Knife_Stone_Statistics(nG, nD, nP, nNum)
	--print("Knife_Stone_Statistics",nG, nD, nP,nNum);
	if nNum and nNum > 0 then
		local tTable = {
			[1] = {2, 1, 30428},
			[2] = {2, 1, 30429},
			[3] = {2, 1, 30430},
		}
		for i = 1, getn(tTable) do
			if nG == tTable[i][1] and nD == tTable[i][2] and nP == tTable[i][3] then
				AddRuntimeStat(6, i, 0, tonumber(nNum));
			end
		end
	end
end
