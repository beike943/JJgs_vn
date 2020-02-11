-------ÐÐÕß·þÅä·½Ñ§Ï°½Å±¾--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,10)
	if nGene==1 and nSKIllId==10 and nLevel>=80 then
		AddRecipe(1053)
		AddRecipe(1054)
		AddRecipe(1055)
		AddRecipe(1056)
		AddRecipe(1077)
		AddRecipe(1078)
		AddRecipe(1079)
		AddRecipe(1080)
		Msg2Player("B¹n häc ®­îc phèi ph­¬ng: nam tiªu chuÈn ®Çu cÊp 8 ")
		Msg2Player("B¹n häc ®­îc phèi ph­¬ng: nam kh«i ng« ®Çu cÊp 8")
		Msg2Player("B¹n häc ®­îc phèi ph­¬ng: ®Çu gîi c¶m cÊp 8")		
		Msg2Player("B¹n häc ®­îc phèi ph­¬ng: tiÓu ®Çu quyÕn rò cÊp 8")
		DelItem(2,1,3044,1)
		else
			Msg2Player("Kü n¨ng chÕ t¹o nãn trªn cÊp 80 míi häc ®­îc phèi ph­¬ng nµy, b¹n kh«ng ®ñ ®Òu kiÖn!")	
	end
end