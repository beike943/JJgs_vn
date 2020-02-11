--Ä¥µ¶Ê¯

function OnUse()
	Say("Sö dông Ma §ao Th¹ch ngÉu nhiªn ®iÒu chØnh søc c«ng kÝch trong ph¹m vi nhÊt ®Þnh.",2,"B¾t ®Çu/StartKnife","Kh«ng cÇn ®©u/do_nothing")
end

function StartKnife()
	if GetFightState() ~= 0 then
		Talk(1,"","HiÖn t¹i kh«ng thÓ sö dông ®¹o cô nµy");
		return 0;
	end
	KnifeStone();
	return 1;
end

function do_nothing()
--do nothing
end

--Í³¼ÆµÀ¾ßµÄÊ¹ÓÃÇé¿ö
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
