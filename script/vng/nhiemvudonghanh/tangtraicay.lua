Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\nhiemvudonghanh\\donghanh_head.lua")
szNPCName = "<color=green>Long Quang Ch©n Nh©n:<color> "

function OnPutinCheck(param, idx, genre, detail, particular)
	--local tbCheckList = GetPutinItem();
	if genre ~= 2 or detail ~= 1 or particular < 30164 or particular > 30183 then
		Talk(1,"",szNPCName .. "Ta chØ nhËn tr¸i c©y, nh÷ng thø kh¸c ®õng ®­a ra ®©y.")
		return 0
	end
	return 1
end


function OnPutinComplete(param)
	local tbFruit = GetPutinItem();
	local nCount = 0
	local nG, nD, nP = tbFruit[1][2], tbFruit[1][3], tbFruit[1][4]
	
	if GetItemCount(nG,nD,nP) < 20 then
		Talk(1,"",szNPCName.."Ng­¬i kh«ng cã ®ñ 20 tr¸i cña lo¹i nµy, h·y kiÕm thªm hoÆc chän lo¹i kh¸c.")
		return 0
	end
	
	if DongHanh_GetStatus() == 0 and DongHanh_GetMission() == 24 then
		if DelItem(nG,nD,nP,20) == 1 then
			DongHanh_SetStatus()
--			DelItemByIndex(tbFruit[1][1],-1)
		end
	end
	return 1
end
