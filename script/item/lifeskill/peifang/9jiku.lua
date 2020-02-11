-------ÐÐÕß·þÅä·½Ñ§Ï°½Å±¾--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,9)
	if nGene==1 and nSKIllId==9 and nLevel>=90 then
		AddRecipe(1073)
		AddRecipe(1074)
		AddRecipe(1075)
		AddRecipe(1076)
		Msg2Player("B¹n häc ®­îc phèi ph­¬ng: tiªu chuÈn h¹ y cÊp 9")
		Msg2Player("B¹n häc ®­îc phèi ph­¬ng: kh«i ng« h¹ y cÊp 9")
		Msg2Player("B¹n häc ®­îc phèi ph­¬ng: h¹ y gîi c¶m cÊp 9")		
		Msg2Player("B¹n häc ®­îc phèi ph­¬ng: h¹ y quyÕn rò cÊp 9")
		DelItem(2,1,3049,1)
		else
			Msg2Player("Kü n¨ng chÕ t¹o h¹ y tõ cÊp 90 trë lªn míi cã thÓ häc ®­îc phèi ph­¬ng nµy, b¹n kh«ng ®ñ ®iÒu kiÖn!")	
	end
end