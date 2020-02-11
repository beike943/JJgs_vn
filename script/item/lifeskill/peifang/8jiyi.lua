-------ÐÐÕß·þÅä·½Ñ§Ï°½Å±¾--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,5)
	if nGene==1 and nSKIllId==5 and nLevel>=80 then
		AddRecipe(1057)
		AddRecipe(1058)
		AddRecipe(1059)
		AddRecipe(1060)
		AddRecipe(1081)
		AddRecipe(1082)
		AddRecipe(1083)
		AddRecipe(1084)
		Msg2Player("B¹n häc ®­îc phèi ph­¬ng: tiªu chuÈn nam y cÊp 8")
		Msg2Player("B¹n häc ®­îc phèi ph­¬ng: kh«i ng« nam y cÊp 8")
		Msg2Player("B¹n häc ®­îc phèi ph­¬ng: y phôc gîi c¶m cÊp 8")		
		Msg2Player("B¹n häc ®­îc phèi ph­¬ng: néi y quyÕn rò cÊp 8")
		DelItem(2,1,3045,1)
		else
			Msg2Player("Kü n¨ng chÕ t¹o hé gi¸p tõ cÊp 80 trë lªn míi häc ®­îc phèi ph­¬ng nµy, b¹n kh«ng ®ñ ®Òu kiÖn!")	
	end
end