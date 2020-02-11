-------ÐÐÕß·þÅä·½Ñ§Ï°½Å±¾--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,5)
	if nGene==1 and nSKIllId==5 and nLevel>=50 then
		AddRecipe(879)
		AddRecipe(880)
		AddRecipe(881)
		AddRecipe(882)
		Msg2Player("B¹n häc ®­îc c¸ch lµm: NhËp Quan Ph¸p Bµo")
		DelItem(2,1,450,1)
		else
			Msg2Player("CÊp 50 trë lªn míi häc ®­îc kü n¨ng chÕ t¹o hé gi¸p, ®iÒu kiÖn cña b¹n ch­a ®ñ!")	
	end
end