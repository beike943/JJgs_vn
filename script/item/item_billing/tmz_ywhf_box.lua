--ÌìÃÅÒøÎÄ»¢·ûÏä

tItemName = {
	{"R­¬ng Thiªn M«n Ng©n V¨n Hæ Phï",2,100,47},
	{"Thiªn M«n Ng©n V¨n Hæ Phï",2,100,44,10}
}
function OnUse()
	Say("B¾t ®Çu"..tItemName[1][1].."Cã thÓ nhËn ®­îc <color=yellow>"..tItemName[2][5].."c¸i"..tItemName[2][1].."<color>, cã khëi ®éng?",
		2,
		"\n§óng/confirm_use",
		"\nKh«ng cÇn/nothing")
end

function nothing()

end

function confirm_use()
	if DelItem(tItemName[1][2],tItemName[1][3],tItemName[1][4],1) == 1 then
		local nRet,nIdx = AddItem(tItemName[2][2],tItemName[2][3],tItemName[2][4],tItemName[2][5],5);
		if nRet == 1 then
			Msg2Player("B¹n nhËn ®­îc ["..tItemName[2][1].."]x"..tItemName[2][5]);
		end
		WriteLog("["..tItemName[1][1].."]: tµi kho¶n:"..tostring(GetAccount())..",Tªn:"..tostring(GetName())..",Thêi gian:"..tonumber(date("%Y%m%d"))..",[më"..tItemName[1][1].."NhËn ®­îc"..tItemName[2][1].."x"..tItemName[2][5].."], ký hiÖu:"..nRet)
	end
end