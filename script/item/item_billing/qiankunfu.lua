-- Ç¬À¤·û

tQKF = {2, 0, 555}

tItem =
{
	{0, 102, 24, "§«ng Ph­¬ng Long Ch©u"},
	{0, 102, 23, "Nh­ ý"},
	{0, 102, 22, "C¸t T­êng"},		
	{0, 102, 8840, "Huy Hoµng Chi Thñy"},
	{0, 102, 8841, "Vinh Dù Chi Thñy"},
	{0, 102, 8842, "Huy Hoµng Chi KÕ"},
	{0, 102, 8843, "Vinh Dù Chi KÕ"},
	{0, 102, 8844, "Huy Hoµng QuËt Khëi"},
	{0, 102, 8845, "Vinh Dù QuËt Khëi"},
	{0, 101, 8001, "Viªm §Õ trang (Nam Tiªu ChuÈn)"},
	{0, 101, 8002, "Viªm §Õ trang (Nam Kh«i Ng«)"},
	{0, 101, 8003, "Viªm §Õ trang (N÷ Gîi C¶m)"},
	{0, 101, 8004, "Viªm §Õ trang (KiÒu N÷)"},
	{0, 101, 8055,"Thiªn Chi Viªm §Õ Trang (Nam Tiªu ChuÈn)"},
	{0, 101, 8056,"Thiªn Chi Viªm §Õ Trang (Nam Kh«i Ng«)"},
	{0, 101, 8057,"Thiªn Chi Viªm §Õ Trang (N÷ Gîi C¶m)"},
	{0, 101, 8058,"Thiªn Chi Viªm §Õ Trang (KiÒu N÷)"},
	{0, 3, 8851, "Tö Quang To¸i Vò §ao"},
	{0 ,5, 8852, "Tö Quang To¸i Vò C«n"},
	{0, 8, 8853, "Tö Quang Cöu Nh­ Tr­îng"},
	{0, 0, 8854, "Tö Quang H¹o Nhiªn Thñ"},
	{0, 1, 8855, "Tö Quang V« H×nh Ch©m"},
	{0, 2, 8856, "Tö Quang Tö Tinh KiÕm"},
	{0, 10, 8857, "Tö Quang Phông Hoµng CÇm"},
	{0, 0, 8858, "Tö Quang Ngò Nh¹c Thñ"},
	{0, 5, 8859, "Tö Quang Ph¸ Thiªn C«n"},
	{0, 2, 8860, "Tö Quang Hång Qu©n KiÕm"},
	{0, 9, 8861, "Tö Quang Sinh Tö Bót"},
	{0, 6, 8862, "Tö Quang Ph¸ Qu©n Th­¬ng"},
	{0, 4, 8863, "Tö Quang Khai Thiªn Cung"},
	{0, 7, 8864, "Tö Quang ¢m D­¬ng NhÉn"},
	{0, 11, 8865, "Tö Quang U Minh Tr¶o"},	
	{0, 102, 8851, "Tö Viªn ChiÕn"},
	{0, 102, 8853, "Tö Viªn ChiÕn"},
	{0, 102, 8855, "Tö Viªn ChiÕn"},
	{0, 102, 8857, "Tö Viªn ChiÕn"},
	{0, 102, 8859, "Tö Viªn ChiÕn"},
	{0, 102, 8861, "Tö Viªn ChiÕn"},
	{0, 102, 8863, "Tö Viªn ChiÕn"},
	{0, 102, 8865, "Tö Viªn ChiÕn"},
	{0, 102, 8867, "Tö Viªn ChiÕn"},
	{0, 102, 8869, "Tö Viªn ChiÕn"},
	{0, 102, 8871, "Tö Viªn ChiÕn"},
	{0, 102, 8873, "Tö Viªn ChiÕn"},
	{0, 102, 8875, "Tö Viªn ChiÕn"},
	{0, 102, 8877, "Tö Viªn ChiÕn"},
	{0, 102, 8852, "Tö Viªn §Êu"},
	{0, 102, 8854, "Tö Viªn §Êu"},
	{0, 102, 8856, "Tö Viªn §Êu"},
	{0, 102, 8858, "Tö Viªn §Êu"},
	{0, 102, 8860, "Tö Viªn §Êu"},
	{0, 102, 8862, "Tö Viªn §Êu"},
	{0, 102, 8864, "Tö Viªn §Êu"},
	{0, 102, 8866, "Tö Viªn §Êu"},
	{0, 102, 8868, "Tö Viªn §Êu"},
	{0, 102, 8870, "Tö Viªn §Êu"},
	{0, 102, 8872, "Tö Viªn §Êu"},
	{0,102, 8874,"Tö Viªn §Êu"},
	{0,102, 8876,"Tö Viªn §Êu"},
	{0,102, 8878,"Tö Viªn §Êu"},
	{2, 0, 1083, "Th¸i dÞch hçn nguyªn phæ"},
	{0, 105, 38, "L­u V©n Kú L©n Thó"},
	{2, 0, 1084, "Thiªn Qu¸i Th¹ch"},
	{0,102,8846, "Huy Hoµng"},
	{0,102,8847, "Vinh Dù"},
	{0, 105, 30038, "NguyÖt L­îng Thè"},
}

function OnUse()
	EnterQKBind()
end

function OnItemLock()
	Say("Trang bÞ ®· khãa kh«ng thÓ sö dông Cµn Kh«n phï", 0)
end

function OnBindCheck(nGeren, nDetail, nParticular, bIsBind)
	if bIsBind > 0 then		-- ÒÑ¾­ÊÇ°ó¶¨×°±¸ÁË
		Say("Trang bÞ ®· cã thÓ giao dÞch.", 0)
		return 0
	end

	local nIndex = CheckInItemList(nGeren, nDetail, nParticular)
	if nIndex == 0 then
		local szMsg = "ChØ cã <color=yellow>"
		for i = 1, getn(tItem) do
			if i ~= getn(tItem) then
				szMsg = szMsg..tItem[i][4].."<color>,<color=yellow>"
			else
				szMsg = szMsg..tItem[i][4].."<color>"
			end
		end
		szMsg =  "ChØ cã <color=yellow>§«ng Ph­¬ng Long Ch©u, Nh­ ý, C¸t T­êng, Huy Hoµng Chi Thñy, Vinh Dù Chi Thñy, Huy Hoµng Chi KÕ, Vinh Dù Chi KÕ, Viªm §Ó Trang, Thiªn Chi Viªm §Õ Trang, Vò khÝ Tö Quang n©ng cÊp, Tö Quang ChiÕn, Tö Quang §Êu, Th¸i dÞch hçn nguyªn phæ, L­u V©n Kú L©n Thó, Huy Hoµng QuËt Khëi, Vinh Dù QuËt Khëi, Thiªn Qu¸i Th¹ch, Huy Hoµng, Vinh Dù <color>"
		szMsg = szMsg.." míi dïng ®­îc Cµn Kh«n phï më ra, tiÕn hµnh giao dÞch!"
		Say(szMsg, 0)
		return 0
	else
		-- É¾³ýÇ¬À¤·û£¬Ò»¶¨Òª¼ÇµÃÉ¾³ý°¡°¡°¡°¡
		if DelItem(tQKF[1], tQKF[2], tQKF[3], 1) == 1 then
			local szMsg = tItem[nIndex][4].."®· më ®­îc cã thÓ tiÕn hµnh giao dÞch."
			Say(szMsg, 0)
			return 1
		else
			Msg2Player("B¹n kh«ng cã Cµn Kh«n phï")
			return 0
		end
	end
end


function CheckInItemList(nGeren, nDetail, nParticular)	
	local isExist = 0
	for index, value in tItem do
		if nGeren == value[1] and nDetail == value[2] and nParticular == value[3] then
			isExist = index
			break
		end
	end
	return isExist
end
