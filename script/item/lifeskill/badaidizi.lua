-------ÐÐÕß·þÅä·½Ñ§Ï°½Å±¾--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,5)
	if nGene==1 and nSKIllId==5 and nLevel>=70 then
		AddRecipe(871)
		AddRecipe(872)
		AddRecipe(873)
		AddRecipe(874)
		Msg2Player("B¹n häc ®­îc c¸ch lµm: Tô NghÜa th­êng")
		DelItem(2,1,448,1)
		else
			Msg2Player("CÊp 70 trë lªn míi häc ®­îc kü n¨ng chÕ t¹o hé gi¸p, ®iÒu kiÖn cña b¹n ch­a ®ñ!")	
	end
end