-------ĞĞÕß·şÅä·½Ñ§Ï°½Å±¾--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,3)
	if nGene==1 and nSKIllId==3 and nLevel>=80 then
		AddRecipe(1015)
		Msg2Player("B¹n häc ®­îc phèi ph­¬ng: ThÇn Quy")
		DelItem(2,1,3013,1)
		else
			Msg2Player("Kü n¨ng chÕ t¹o binh khİ ng¾n trªn cÊp 80 míi cã thÓ häc ®­îc phèi ph­¬ng nµy, b¹n kh«ng ®ñ ®iÒu kiÖn!")	
	end
end