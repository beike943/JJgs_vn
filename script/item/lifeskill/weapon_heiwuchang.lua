-------ºÚÎŞ³£Ö®ÃÍ¶¾µ¶Åä·½Ñ§Ï°½Å±¾--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,3)
	if nGene==1 and nSKIllId==3 and nLevel>=70 then
		AddRecipe(995)
		AddRecipe(996)
		AddRecipe(997)
		AddRecipe(998)
		Msg2Player("B¹n häc ®­îc: M·nh §éc ®ao")
		DelItem(2,1,1084,1)
		else
			Msg2Player("CÇn kü n¨ng ®óc t¹o binh khİ ng¾n cÊp 70 trë lªn míi cã thÓ häc, ®iÒu kiÖn cña b¹n kh«ng ®ñ!")	
	end
end