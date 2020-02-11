Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\nhiemvudonghanh\\donghanh_head.lua")
szNPCName = "<color=green>Long Quang Ch©n Nh©n:<color> "

function OnPutinCheck(param, idx, genre, detail, particular)
	--local tbCheckList = GetPutinItem();
	if genre ~= 0 or detail ~= 107 then
		Talk(1,"",szNPCName .. "Ta chØ nhËn mËt tÞch, nh÷ng thø kh¸c ®õng ®­a ra ®©y.")
		return 0
	end
	return 1
end


function OnPutinComplete(param)
	local tbBook = GetPutinItem();
	local nCount = 0
	for i=1, getn(tbBook) do
		local nG, nD = tbBook[i][2], tbBook[i][3]
		if nG ==  0 and nD == 107 then
			nCount = nCount + 1
		else
			return 0
		end
	end
	local nQty = 0
	if DongHanh_GetMission() == 22 then
		nQty = 2
	elseif DongHanh_GetMission() == 23 then
		nQty = 3
	end
	if getn(tbBook) < nQty then
		Talk(1,"",szNPCName.."Ng­¬i kh«ng cã ®ñ sè mËt tÞch ta cÇn...")
		return 0
	end
	
	if DongHanh_GetStatus() == 0 and (DongHanh_GetMission() == 22 or DongHanh_GetMission() == 23) then
		DongHanh_SetStatus()
		for i=1, getn(tbBook) do
			DelItemByIndex(tbBook[i][1],-1)
		end
	end
	return 1
end
