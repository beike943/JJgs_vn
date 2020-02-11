-------ÐÐÕß·þÅä·½Ñ§Ï°½Å±¾--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,10)
	if nGene==1 and nSKIllId==10 and nLevel>=90 then
		AddRecipe(1065)
		AddRecipe(1066)
		AddRecipe(1067)
		AddRecipe(1068)
		Msg2Player("B¹n häc ®­îc phèi ph­¬ng: nam tiªu chuÈn ®Çu cÊp 9")
		Msg2Player("B¹n häc ®­îc phèi ph­¬ng: nam kh«i ng« ®Çu cÊp 9")
		Msg2Player("B¹n häc ®­îc phèi ph­¬ng: ®Çu gîi c¶m cÊp 9")		
		Msg2Player("B¹n häc ®­îc phèi ph­¬ng: tiÓu ®Çu quyÕn rò cÊp 9")
		DelItem(2,1,3047,1)
		else
			Msg2Player("Kü n¨ng chÕ t¹o nãn trªn cÊp 90 míi cã thÓ häc ®­îc phèi ph­¬ng nµy, b¹n kh«ng ®ñ ®iÒu kiÖn!")	
	end
end