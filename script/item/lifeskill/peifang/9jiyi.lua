-------ÐÐÕß·þÅä·½Ñ§Ï°½Å±¾--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,5)
	if nGene==1 and nSKIllId==5 and nLevel>=90 then
		AddRecipe(1069)
		AddRecipe(1070)
		AddRecipe(1071)
		AddRecipe(1072)
		Msg2Player("B¹n häc ®­îc phèi ph­¬ng: tiªu chuÈn nam y cÊp 9")
		Msg2Player("B¹n häc ®­îc phèi ph­¬ng: kh«i ng« nam y cÊp 9")
		Msg2Player("B¹n häc ®­îc phèi ph­¬ng: y phôc gîi c¶m cÊp 9")		
		Msg2Player("B¹n häc ®­îc phèi ph­¬ng: néi y quyÕn rò cÊp 9")
		DelItem(2,1,3048,1)
		else
			Msg2Player("Kü n¨ng chÕ t¹o hé gi¸p trªn cÊp 90 míi cã thÓ häc ®­îc phèi ph­¬ng nµy, b¹n kh«ng ®ñ ®iÒu kiÖn!")	
	end
end