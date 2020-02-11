-------ĞĞÕß·şÅä·½Ñ§Ï°½Å±¾--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nLevel=GetLifeSkillLevel(1,7)
	if GetLifeSkillMaxLevel(1,7) >= 99 then
		Talk(1,"","B¹n ®· më giíi h¹n kü n¨ng nµy råi, kh«ng thÓ dïng ®­îc.");
		return
	end
	if nLevel==79 then
		DelItem(2,1,3005,1)
		LearnLifeSkill(1, 7, 79, 99, 1)
		Say("B¹n ®· xem qua 'Bµo §inh Gi¶i Ng­u §å' ®· cã thÓ t¨ng cÊp nÊu n­íng!",0);	
		else
		Say("Kü n¨ng nÊu n­íng cÊp 79 míi häc ®­îc s¸ch nµy, b¹n kh«ng ®ñ ®iÒu kiÖn!",0);	
	end
end