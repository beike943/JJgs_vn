--08´º½ÚÌìÊ±×¢½â½Å±¾
--by vivi
--2008/01/14

function OnUse()
	Say("Sö dông Thiªn Thêi Chó Gi¶i sÏ t¨ng 1000 kinh nghiÖm thu thËp kü n¨ng, b¹n muèn t¨ng kü n¨ng kinh nghiÖm sèng nµo? <color=yellow>Chó ı: t¨ng kinh nghiÖm sÏ kh«ng v­ît qu¸ ®¼ng cÊp kü n¨ng sèng tr­íc ®©y.<color>",
		5,
		"§èn c©y/#get_lifeskill_exp(1)",
		"Lµm da/#get_lifeskill_exp(2)",
		"§µo kho¸ng/#get_lifeskill_exp(5)",
		"KĞo t¬/#get_lifeskill_exp(6)",
		"Kh«ng sö dông/")
end

function get_lifeskill_exp(nType)
	if GetLifeSkillLevel(0,nType) == 0 then
		Talk(1,"","B¹n ch­a häc ®­îc kü n¨ng sèng nµy.");
	elseif GetLifeSkillLevel(0,nType) >= 99 then
		Talk(1,"","Kü n¨ng sèng cña b¹n ®· ®¹t tíi cÊp 99, kh«ng thÓ nhËn tiÕp kinh nghiÖm.");
	else
		if GetLifeSkillLevel(0,nType) == 79 and GetLifeSkillMaxLevel(0,nType) == 79 then
			Talk(1,"","Kinh nghiÖm sèng hiÖn t¹i cña b¹n ®· v­ît giíi h¹n, kh«ng thÓ t¨ng kinh nghiÖm ®­îc n÷a.");
			return
		end 
		if DelItem(2,1,3210,1) == 1 then
			AddLifeSkillExp(0,nType,1000);
		end
	end
end