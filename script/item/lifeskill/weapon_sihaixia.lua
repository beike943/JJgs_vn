-------ËÄº£ÏÀÖ®ºÀÆøÊÖÅä·½Ñ§Ï°½Å±¾--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,3)
	if nGene==1 and nSKIllId==3 and nLevel>=70 then
		AddRecipe(971)
		AddRecipe(972)
		AddRecipe(973)
		AddRecipe(974)		
		Msg2Player("B¹n häc ®­îc: Hµo Khİ thñ")
		DelItem(2,1,1078,1)
		else
			Msg2Player("CÇn kü n¨ng ®óc t¹o binh khİ ng¾n cÊp 70 trë lªn míi cã thÓ häc, ®iÒu kiÖn cña b¹n kh«ng ®ñ!")	
	end
end