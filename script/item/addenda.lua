--Õ³ÌùĞÄµÃ
function OnUse(id)
	local nRet = InsertAddenda(id)--Õ³Ìù¸½Â¼
	if nRet == -2 then
		Msg2Player("MËt tŞch cña b¹n ®· khãa, kh«ng thÓ thªm bİ kiÕp vµo!")
	elseif nRet == -3 then
		Msg2Player("Bİ kiÕp ®· khãa! Kh«ng thÓ thªm mËt tŞch vµo!")
	end
end
