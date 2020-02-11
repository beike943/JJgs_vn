-------ÐÐÕß·þÅä·½Ñ§Ï°½Å±¾--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,7)
	if nGene==1 and nSKIllId==7 and nLevel>=80 then
		AddRecipe(1049)
		Msg2Player("B¹n häc ®­îc phèi ph­¬ng: §¶ Cao")
		DelItem(2,1,3042,1)
		else
			Msg2Player("Kü n¨ng nÊu n­íng trªn cÊp 80 míi cã thÓ häc ®­îc phèi ph­¬ng nµy, b¹n kh«ng ®ñ ®iÒu kiÖn!")	
	end
end