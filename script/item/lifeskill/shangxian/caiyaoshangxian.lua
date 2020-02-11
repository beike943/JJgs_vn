-------ĞĞÕß·şÅä·½Ñ§Ï°½Å±¾--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nLevel=GetLifeSkillLevel(0,4)
	if GetLifeSkillMaxLevel(0,4) >= 99 then
		Talk(1,"","B¹n ®· më giíi h¹n kü n¨ng nµy råi, kh«ng thÓ dïng ®­îc.");
		return
	end
	if nLevel==79 then
		DelItem(2,1,3010,1)
		LearnLifeSkill(0, 4, 79, 99, 0)
		Say("B¹n ®· xem qua 'ThÇn Y B¶n Th¶o Kinh' ®· cã thÓ t¨ng cÊp h¸i thuèc!!",0);
		else
		Say("Kü n¨ng h¸i thuèc cÊp 79 míi häc ®­îc s¸ch nµy, b¹n kh«ng ®ñ ®iÒu kiÖn!",0);
	end
end