Include("\\script\\online\\viet_event\\firework_10\\head.lua")

function OnUse(nItemIndex)

	local nHour = tonumber(date("%H%M"))
	if nHour < 0800 or ( nHour > 1000 and nHour < 1500 ) or ( nHour > 1700  and nHour < 2000 ) or ( nHour > 2200 )  then
		Talk ( 1, "", "Ho¹t ®éng ®èt ph¸o hoa diÔn ra trong 3 ®ît thêi gian tõ: 8giê ®Õn 10giê, 15giê ®Õn 17giê, 20giê ®Õn 22giê !!!!" )
		return
	end
	local nDate = tonumber( date( "%y%m%d" ))
	local nCurDate = VNG_GetTaskPos(FIREWORK_CNDSK_USE, 9, 4)
	if nCurDate ~= nDate then
		VNG_SetTaskPos(FIREWORK_CNDSK_USE, 0, 3, 3) 
	end
	local nCheck = VNG_GetTaskPos(FIREWORK_CNDSK_USE, 3, 3)
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "Th«ng tin chi tiÕt ho¹t ®éng ®ång ®¹o cã thÓ xem trªn trang chñ <color=green>http://volam2.zing.vn<color>."
	if nCheck == 0 then
		tinsert(tbSayDialog, "Ta muèn nh©n ®«i kinh nghiÖm (tiªu hao 139 vµng)/#use_firework("..nItemIndex..", 1)")
		tinsert(tbSayDialog, "Ta chØ sö dông b×nh th­êng/#use_firework("..nItemIndex..", 2)")
		nSaySize = getn(tbSayDialog);
		Say(szSayHead, nSaySize, tbSayDialog);
	else
		use_firework(nItemIndex)	
	end
	

end