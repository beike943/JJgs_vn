-------ĞĞÕß·şÅä·½Ñ§Ï°½Å±¾--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,2)
	if nGene==1 and nSKIllId==2 and nLevel>=90 then
		AddRecipe(1030)
		Msg2Player("B¹n häc ®­îc phèi ph­¬ng: D­îc S­ Tr­îng")
		DelItem(2,1,3028,1)
		else
			Msg2Player("Kü n¨ng chÕ t¹o binh khİ dµi trªn cÊp 90 míi cã thÓ häc ®­îc phèi ph­¬ng nµy, b¹n kh«ng ®ñ ®iÒu kiÖn!")	
	end
end