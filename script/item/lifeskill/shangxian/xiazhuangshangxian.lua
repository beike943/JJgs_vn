-------ĞĞÕß·şÅä·½Ñ§Ï°½Å±¾--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nLevel=GetLifeSkillLevel(1,9)
	if GetLifeSkillMaxLevel(1,9) >= 99 then
		Talk(1,"","B¹n ®· më giíi h¹n kü n¨ng nµy råi, kh«ng thÓ dïng ®­îc.");
		return
	end	
	if nLevel==79 then
		DelItem(2,1,3051,1)
		LearnLifeSkill(1, 9, 79, 99, 1)
		Say("B¹n ®· xem qua 'Luy Tæ Tµm Kinh', ®· cã thÓ t¨ng cÊp chÕ t¹o h¹ y!",0);
		else
		Say("Kü n¨ng chÕ t¹o h¹ y cÊp 79 míi häc ®­îc s¸ch nµy, b¹n kh«ng ®ñ ®iÒu kiÖn!",0);
	end
end