-------°×ÎŞ³£Ö®¹î¶¾×¦Åä·½Ñ§Ï°½Å±¾--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,4)
	if nGene==1 and nSKIllId==4 and nLevel>=70 then
		AddRecipe(999)
		AddRecipe(1000)
		AddRecipe(1001)
		AddRecipe(1002)
		Msg2Player("B¹n häc ®­îc: Ngôy §éc tr¶o")
		DelItem(2,1,1085,1)
		else
			Msg2Player("CÇn kü n¨ng ®óc t¹o binh khİ kú m«n cÊp 70 trë lªn míi cã thÓ häc, ®iÒu kiÖn cña b¹n kh«ng ®ñ!")	
	end
end