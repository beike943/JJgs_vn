-------ĞĞÕß·şÅä·½Ñ§Ï°½Å±¾--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,7)
	if nGene==1 and nSKIllId==7 and nLevel>=90 then
		AddRecipe(1050)
		Msg2Player("B¹n häc ®­îc phèi ph­¬ng: Hå Bİnh")
		DelItem(2,1,3043,1)
		else
			Msg2Player("Kü n¨ng chÕ thuèc trªn cÊp 90 míi cã thÓ häc ®­îc phèi ph­¬ng nµy, b¹n kh«ng ®ñ ®iÒu kiÖn!")	
	end
end