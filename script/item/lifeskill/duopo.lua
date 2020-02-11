-------ÐÐÕß·þÅä·½Ñ§Ï°½Å±¾--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,5)
	if nGene==1 and nSKIllId==5 and nLevel>=40 then
		AddRecipe(923)
		AddRecipe(924)
		AddRecipe(925)
		AddRecipe(926)
		Msg2Player("B¹n häc ®­îc c¸ch lµm: §o¹t Ph¸ch y")
		DelItem(2,1,461,1)
		else
			Msg2Player("CÊp 40 trë lªn míi häc ®­îc kü n¨ng chÕ t¹o hé gi¸p, ®iÒu kiÖn cña b¹n ch­a ®ñ!")	
	end
end