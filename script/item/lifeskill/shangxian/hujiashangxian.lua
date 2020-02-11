-------ĞĞÕß·şÅä·½Ñ§Ï°½Å±¾--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nLevel=GetLifeSkillLevel(1,5)
	if GetLifeSkillMaxLevel(1,5) >= 99 then
		Talk(1,"","B¹n ®· më giíi h¹n kü n¨ng nµy råi, kh«ng thÓ dïng ®­îc.");
		return
	end
	if nLevel==79 then
		DelItem(2,1,3000,1)
		LearnLifeSkill(1, 5, 79, 99, 1)
		Say("B¹n ®· xem qua 'Thiªn Y Phæ', ®· cã thÓ t¨ng cÊp chÕ t¹o hé gi¸p!",0);
		else
		Say("Kü n¨ng chÕ t¹o hé gi¸p cÊp 79 míi häc ®­îc s¸ch nµy, b¹n kh«ng ®ñ ®iÒu kiÖn!",0);
	end
end