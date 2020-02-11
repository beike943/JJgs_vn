-------ÃØ¶¾´Ì¿ÍÖ®ÒşÃØÕëÅä·½Ñ§Ï°½Å±¾--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,4)
	if nGene==1 and nSKIllId==4 and nLevel>=70 then
		AddRecipe(963)
		AddRecipe(964)
		AddRecipe(965)		
		AddRecipe(966)		
		Msg2Player("B¹n häc ®­îc: Bİ §éc ch©m")
		DelItem(2,1,1075,1)
		else
			Msg2Player("CÇn kü n¨ng ®óc t¹o binh khİ kú m«n cÊp 70 trë lªn míi cã thÓ häc, ®iÒu kiÖn cña b¹n kh«ng ®ñ!")	
	end
end