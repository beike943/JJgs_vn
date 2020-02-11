-------ĞĞÕß·şÅä·½Ñ§Ï°½Å±¾--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,8)
	if nGene==1 and nSKIllId==8 and nLevel>=90 then
		AddRecipe(1040)
		Msg2Player("B¹n häc ®­îc phèi ph­¬ng: ThÇn Hµnh Gi¸p M·")
		DelItem(2,1,3038,1)
		else
			Msg2Player("Kü n¨ng chÕ phï trªn cÊp 90 míi cã thÓ häc ®­îc phèi ph­¬ng nµy, b¹n kh«ng ®ñ ®iÒu kiÖn!")	
	end
end