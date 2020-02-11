Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\nhiemvuphucsinh2\\phucsinh2_head.lua")

szNPCName = "<color=green>Long Quang Ch©n Nh©n:<color> "

function OnPutinCheck(param, idx, genre, detail, particular)
	--local tbCheckList = GetPutinItem();
--	if PhucSinh2_CheckActive() ~= 1 then
--		return 0
--	end
--	if PhucSinh2_GetStatus() == 1 then
--		return 0
--	end
	
	if genre ~= 2 then
		Talk(1,"",szNPCName .. "Ta chØ nhËn ®óng vËt phÈm ta yªu cÇu, nh÷ng thø kh¸c vui lßng cÊt ®i.")
		return 0
	end
	if detail ~= 1 then
		Talk(1,"",szNPCName .. "Ta chØ nhËn ®óng vËt phÈm ta yªu cÇu, nh÷ng thø kh¸c vui lßng cÊt ®i.")
		return 0
	end
	if particular < 30164 or particular > 30183 then
		Talk(1,"",szNPCName .. "Ta chØ nhËn ®óng vËt phÈm ta yªu cÇu, nh÷ng thø kh¸c vui lßng cÊt ®i.")
		return 0
	end
	return 1
end


function OnPutinComplete(param)
	local nTraiCay = 39
	local nXu = 69
	local tbItem = GetPutinItem();
	local nCount = 0
	local nG, nD, nP = tbItem[1][2], tbItem[1][3], tbItem[1][4]
	
	if GetItemCount(nG,nD,nP) < nTraiCay then
		Talk(1,"",szNPCName.."Ng­¬i kh«ng cã ®ñ <color=yellow>"..nTraiCay.." "..GetItemName(nG,nD,nP).."<color>, h·y chuÈn bŞ thªm.")
		return 0
	end
	
	if GetItemCount(2,1,30230) < nXu then
		Talk(1,"",szNPCName.."Ng­¬i kh«ng cã ®ñ <color=yellow>"..nXu.." "..GetItemName(2,1,30230).."<color>, h·y chuÈn bŞ thªm.")
		return 0
	end
	
--	if PhucSinh2_GetStatus() == 0 then
		if DelItem(nG,nD,nP,nTraiCay) == 1 and DelItem(2,1,30230,nXu) == 1 then
			PhucSinh2_AddCount()
--			DelItemByIndex(tbItem[1][1],-1)
		end
--	end
	return 1
end
