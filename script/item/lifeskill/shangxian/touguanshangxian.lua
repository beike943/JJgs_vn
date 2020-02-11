-------ĞĞÕß·şÅä·½Ñ§Ï°½Å±¾--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nLevel=GetLifeSkillLevel(1,10)
	if GetLifeSkillMaxLevel(1,10) >= 99 then
		Talk(1,"","B¹n ®· më giíi h¹n kü n¨ng nµy råi, kh«ng thÓ dïng ®­îc.");
		return
	end	
	if nLevel==79 then
		DelItem(2,1,3050,1)
		LearnLifeSkill(1, 10, 79, 99, 1)
		Say("B¹n ®· xem qua 'Chøc N÷ Kinh', ®· cã thÓ t¨ng cÊp chÕ t¹o nãn!",0);
		else
		Say("Kû n¨ng chÕ t¹o nãn cÊp 79 míi häc ®­îc s¸ch nµy, b¹n kh«ng ®ñ ®iÒu kiÖn!",0);
	end
end