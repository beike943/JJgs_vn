-------·ÜÎä½«¾üÖ®Í¸¼×Ç¹Åä·½Ñ§Ï°½Å±¾--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,2)
	if nGene==1 and nSKIllId==2 and nLevel>=70 then
		AddRecipe(987)
		AddRecipe(988)
		AddRecipe(989)
		AddRecipe(990)
		Msg2Player("B¹n häc ®­îc: ThÊu Gi¸p th­¬ng")
		DelItem(2,1,1082,1)
		else
			Msg2Player("CÇn kü n¨ng ®óc t¹o binh khİ dµi cÊp 70 trë lªn míi cã thÓ häc, ®iÒu kiÖn cña b¹n kh«ng ®ñ!")	
	end
end