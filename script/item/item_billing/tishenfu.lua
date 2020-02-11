-- ÌæÉí·û
--Çë²»ÒªËæ±ãĞŞ¸´
--Óë³ÌĞòÏà¹ØÁª

function OnUse(nIndex)
	if ChkCanUse() == 1 then
		UseDummy(1, nIndex)
	else
		Msg2Player("Khu vùc hiÖn t¹i kh«ng thÓ sö dông ThÕ Th©n Phï. ")
	end
end

function ChkCanUse()
	local nMapID = GetWorldPos()
	if GetItemCount(2,0,556) <= 0 then
		return 0;
	end
	if nMapID >= 839 and nMapID <= 842 then
		return 0
	end
	if GetMissionS(10) == "¶i s­ m«n" then	--¿´¿´ÊÇ²»ÊÇÔÚÌØÊâ¹Ø¿¨ÀïÃæ
		return 0;
	end;
	return 1
end

function OnRevive()
	if ChkCanUse() == 1 and DelItem(2,0,556,1) == 1 then
		CureWound(2);
		return 1;
	end
	return 0;
end

function OnCureWound()
	CureWound(2);
end
