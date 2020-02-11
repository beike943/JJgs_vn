-------ÐÐÕß·þÅä·½Ñ§Ï°½Å±¾--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,8)
	if nGene==1 and nSKIllId==8 and nLevel>=80 then
		AddRecipe(1048)
		Msg2Player("B¹n häc ®­îc phèi ph­¬ng: V¹n Linh Ch©u")
		DelItem(2,1,3039,1)
		else
			Msg2Player("Kü n¨ng chÕ phï trªn cÊp 80 míi cã thÓ häc ®­îc phèi ph­¬ng nµy, b¹n kh«ng ®ñ ®iÒu kiÖn!")	
	end
end