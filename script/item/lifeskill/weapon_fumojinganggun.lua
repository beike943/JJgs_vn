-------·üÄ§½ğ¸ÕÖ®Õ½Òâ¹÷Åä·½Ñ§Ï°½Å±¾--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,2)
	if nGene==1 and nSKIllId==2 and nLevel>=70 then
		AddRecipe(957)
		AddRecipe(958)
		Msg2Player("B¹n häc ®­îc: ChiÕn ı c«n")
		DelItem(2,1,1072,1)
		else
			Msg2Player("CÇn kü n¨ng ®óc t¹o binh khİ dµi cÊp 70 trë lªn míi cã thÓ häc, ®iÒu kiÖn cña b¹n kh«ng ®ñ!")	
	end
end