-------ÐÐÕß·þÅä·½Ñ§Ï°½Å±¾--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nLevel=GetLifeSkillLevel(0,2)
	if GetLifeSkillMaxLevel(0,2) >= 99 then
		Talk(1,"","B¹n ®· më giíi h¹n kü n¨ng nµy råi, kh«ng thÓ dïng ®­îc.");
		return
	end	
	if nLevel==79 then
		DelItem(2,1,3008,1)
		LearnLifeSkill(0, 2, 79, 99, 0)
		Say("B¹n ®· xem qua'V¹n Thó Phæ' ®· cã thÓ t¨ng cÊp Thuéc da!",0);
		else
		Say("Kü n¨ng thuéc daca61p 79 míi häc ®­îc s¸ch nµy, b¹n kh«ng ®ñ ®iÒu kiÖn!",0);
	end
end