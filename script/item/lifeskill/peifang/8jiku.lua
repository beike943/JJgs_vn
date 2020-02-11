-------ÐÐÕß·þÅä·½Ñ§Ï°½Å±¾--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,9)
	if nGene==1 and nSKIllId==9 and nLevel>=80 then
		AddRecipe(1061)
		AddRecipe(1062)
		AddRecipe(1063)
		AddRecipe(1064)
		AddRecipe(1085)
		AddRecipe(1086)
		AddRecipe(1087)
		AddRecipe(1088)
		Msg2Player("B¹n häc ®­îc phèi ph­¬ng: Tiªu chuÈn h¹ y cÊp 8")
		Msg2Player("B¹n häc ®­îc phèi ph­¬ng: kh«i ng« h¹ y cÊp 8")
		Msg2Player("B¹n häc ®­îc phèi ph­¬ng: h¹ y gîi c¶m cÊp 8")		
		Msg2Player("B¹n häc ®­îc phèi ph­¬ng: h¹ y quyÕn rò cÊp 8")
		DelItem(2,1,3046,1)
		else
			Msg2Player("Kü n¨ng chÕ t¹o h¹ y kho¶ng cÊp 80 míi häc ®­îc phèi ph­¬ng nµy, b¹n kh«ng ®ñ ®Òu kiÖn!")	
	end
end