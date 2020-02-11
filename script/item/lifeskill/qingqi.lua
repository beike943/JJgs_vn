-------ÐÐÕß·þÅä·½Ñ§Ï°½Å±¾--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,5)
	if nGene==1 and nSKIllId==5 and nLevel>=40 then
		AddRecipe(899)
		AddRecipe(900)
		AddRecipe(901)
		AddRecipe(902)
		Msg2Player("B¹n häc ®­îc c¸ch lµm: Khinh Kþ gi¸p")
		DelItem(2,1,455,1)
		else
			Msg2Player("CÊp 40 trë lªn míi häc ®­îc kü n¨ng chÕ t¹o hé gi¸p, ®iÒu kiÖn cña b¹n ch­a ®ñ!")	
	end
end