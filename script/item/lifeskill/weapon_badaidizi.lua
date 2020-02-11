-------°Ë´üµÜ×ÓÖ®¾ÛÒå°ôÅä·½Ñ§Ï°½Å±¾--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,2)
	if nGene==1 and nSKIllId==2 and nLevel>=70 then
		AddRecipe(975)
		AddRecipe(976)
		AddRecipe(977)
		AddRecipe(978)
		Msg2Player("B¹n häc ®­îc: Tô NghÜa bæng")
		DelItem(2,1,1079,1)
		else
			Msg2Player("CÇn kü n¨ng ®óc t¹o binh khİ dµi cÊp 70 trë lªn míi cã thÓ häc, ®iÒu kiÖn cña b¹n kh«ng ®ñ!")	
	end
end