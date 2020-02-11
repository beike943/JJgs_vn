-------ĞĞÕß·şÅä·½Ñ§Ï°½Å±¾--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,4)
	if nGene==1 and nSKIllId==4 and nLevel>=80 then
		AddRecipe(1035)
		Msg2Player("B¹n häc ®­îc phèi ph­¬ng: V« Ng©n")
		DelItem(2,1,3033,1)
		else
			Msg2Player("Kü n¨ng chÕ t¹o binh khİ kú m«n trªn cÊp 80 míi cã thÓ häc ®­îc phèi ph­¬ng nµy, b¹n kh«ng ®ñ ®iÒu kiÖn!")	
	end
end