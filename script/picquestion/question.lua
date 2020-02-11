--ÎÊÌâ´ğ¶ÔºóµÄ½±Àø

AwardExp = {
	20,
	50,
	360,
	630,
	1000,
	1800,
	3700,
	5700,
	16000,
	40000,
}

-- »Ø´ğÕıÈ·µÄ¾­Ñé½±Àø
function QuesAward()
--	 AddItem(1,0,2,1)
	 nLevel = GetAwardLevel()
	 nAddExp = AwardExp[nLevel / 10] 
	 nRandom = random(1,1000)
	
	 if ( nRandom == 999 ) then
		nAddExp = nAddExp * 20
	 end
	 
     ModifyExp(nAddExp)
end


--³¬¹ı¹æ¶¨´ÎÊıµÄÎÊÌâ´ğ´íºóµÄ³Í·£
function Punish(nParam)
	 UseSkillEnable(0)
	 if (nParam > 0) then
		Talk(1,"","<color=red>**<color>: B¹n ®· sö dông ch­¬ng tr×nh auto, sÏ bŞ bá tï, xin h·y yªu thİch trß ch¬i, ®õng dïng auto!")
	 else
		Talk(1,"","<color=red>**<color>: B¹n ®· sö dông ch­¬ng tr×nh auto, nh©n vËt sÏ bŞ ®ãng b¨ng, xin h·y yªu thİch trß ch¬i, ®õng dïng auto!")
	 end
end

--ÌÓ±Ü´ğÌâµÄ³Í·£
function PunishAnnouce(nParam)
	 UseSkillEnable(0)
	 Talk(1,"","<color=red>**<color>: B¹n bŞ ®iÓm huyÖt ®¹o, trong"..nParam.." phót b¹n sÏ kh«ng thÓ sö dông vâ c«ng!")
end

--»Ö¸´ÌÓ±Ü´ğÌâµÄ³Í·£
function PunishEndAnnouce()
	 UseSkillEnable(1)
	 Talk(1,"","<color=red>**<color>: HuyÖt ®¹o cña b¹n ®· ®­îc gi¶i, cã thÓ sö dông l¹i vâ c«ng!")
end

-- ±»¾Ù±¨ºó»Ø´ğÕıÈ·µÄ½±Àø
function QuesAward2()
     Restore()
end

-- ¹ØÈëÌìÀÎµÄÈËĞÌÂúÊÍ·ÅºóµÄ¹«¸æ
function ReleaseAnnouce()
	 Talk(1,"","<color=red>**<color>: Thêi gian thô h×nh cña b¹n ®· ®ñ, cã thÓ t×m cai ngôc ®Ó rêi thiªn lao!")
end

-- ¹ØÈëÌìÀÎµÄÈËĞÌÂúÒ»°ëºóµÄ»ßÂ¸ÌáÊ¾
function BribeAnnouce()
	 Talk(1,"","<color=red>**<color>: B¹n ®· ë ®©y ®­îc mét thêi gian, cã thÓ t×m cai ngôc ®Ó ra tï!")
end
