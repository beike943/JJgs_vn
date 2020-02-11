-- TuanNA5 edited

Include("\\script\\lib\\globalfunctions.lua")

tHorse = {
	{"§»ng Vô",{0,105,20,1,1,-1,-1,-1,-1,-1,-1},1,10,1},
	{"Siªu Quang",{0,105,19,1,1,-1,-1,-1,-1,-1,-1},1,10,1},
	{"B«n Tiªu",{0,105,16,1,1,-1,-1,-1,-1,-1,-1},1,10,1},
	{"Phiªu Vò",{0,105,15,1,1,-1,-1,-1,-1,-1,-1},1,10,1},
	{"Phï Dùc",{0,105,39,1,1,3,403,0,0,0,0},1,10,1},
	{"V¹n Lý Yªn V©n Tr¸o",{0,105,36,1,1,3,403,0,0,0,0},1,10,1},
	{"TuÇn Léc",{0,105,35,1,1,-1,-1,-1,-1,-1,-1},1,10,1},
}

function OnUse(nItemIdx)
	local selTab = {				
				format("Ta muèn nhËn §»ng Vô/#use(%d,%d)",1,nItemIdx),
				format("Ta muèn nhËn Siªu Quang/#use(%d,%d)",2,nItemIdx),
				format("Ta muèn nhËn B«n Tiªu/#use(%d,%d)",3,nItemIdx),
				format("Ta muèn nhËn Phiªu Vò/#use(%d,%d)",4,nItemIdx),
				format("Ta muèn nhËn Phï Dùc/#use(%d,%d)",5,nItemIdx),
				format("Ta muèn nhËn V¹n Lý Yªn V©n Tr¸o/#use(%d,%d)",6,nItemIdx),
--				format("Ta muèn nhËn TuÇn Léc/#use(%d,%d)",7,nItemIdx),
				"Sau nµy míi sö dông/nothing",
				}
	Say("Sö dông M· Bµi cã thÓ nhËn ®­îc 1 con chiÕn m·. B¹n muèn sö dông kh«ng?",getn(selTab),selTab);
end;

function use(nIndex, nItemIdx)
	if gf_Judge_Room_Weight(tHorse[nIndex][3], tHorse[nIndex][4], "") == 0 then			
		return
	end	
	local nItemIndex = tonumber(nItemIdx)
	local nExpireTime = GetItemExpireTime(nItemIndex) or 30*24*3600	
	if DelItemByIndex(nItemIdx,-1) == 1 then	
		local nRetCode, nItem = gf_AddItemEx(tHorse[nIndex][2], tHorse[nIndex][1]);
		if nRetCode == 1 then
			if nExpireTime ~= 0 then
				SetItemExpireTime(nItem, nExpireTime)
			end						
			WriteLogEx("Ma Bai","nhËn",tHorse[nIndex][2][4],tHorse[nIndex][1]);
		else
			WriteLogEx("Ma Bai","AddItem thÊt b¹i",tHorse[nIndex][2][4],tHorse[nIndex][1]);
		end
	end
end;

function nothing()
end;