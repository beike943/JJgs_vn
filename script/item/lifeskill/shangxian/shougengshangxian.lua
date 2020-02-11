-------ĞĞÕß·şÅä·½Ñ§Ï°½Å±¾--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nLevel=GetLifeSkillLevel(0,3)
	if GetLifeSkillMaxLevel(0,3) >= 99 then
		Talk(1,"","B¹n ®· më giíi h¹n kü n¨ng nµy råi, kh«ng thÓ dïng ®­îc.");
		return
	end
	if nLevel==79 then
		DelItem(2,1,3009,1)
		LearnLifeSkill(0, 3, 79, 99, 0)
		Say("B¹n ®· xem qua 'Thñy Kinh Chó' ®· cã thÓ t¨ng cÊp canh t¸c!",0);
		else
		Say("Kü n¨ng canh t¸c cÊp 79 míi häc ®­îc s¸ch nµy, b¹n kh«ng ®ñ ®iÒu kiÖn!",0);
	end
end