--ĞÂÊÖÖ¸Òı
--lijinyong

function main()
	if HaveLearnedSkill("Vâ §ang kiÕm kinh") == 1 and HaveLearnedSkill("L­u Quang kiÕm ph¸p") == 1 and HaveLearnedSkill("Ngù KiÕm QuyÕt") == 1 then
		Talk(1, "", "KAO! Ng­¬i ®· häc hÕt vâ c«ng cña l·o n­¬ng, cßn ®Õn häc g× n÷a!?")
	else
		Say("L·o n­¬ng sÏ d¹y ng­¬i chót vâ c«ng! Ng­¬i muèn häc vâ c«ng g×?", 4, "Vâ §ang kiÕm kinh/learn_wdjj", "L­u Quang kiÕm ph¸p/learn_lgjf", "Ngù KiÕm QuyÕt/learn_yjj", "Kh«ng häc!!!/endtalk")
	end
end;

function learn_wdjj()
	if HaveLearnedSkill(1) == 1 and HaveLearnedSkill(2) == 1 then
		LearnSkill("Vâ §ang kiÕm kinh")
		Talk(1, "", "TiÓu tö! Ng­¬i ®· häc ®­îc Vâ §ang kiÕm kinh! Thi triÓn thö xem!")
	else
		Talk(1, "", "TiÓu tö! Søc lùc cña ng­¬i kh«ng ®ñ! Kh«ng häc ®­îc Vâ §ang kiÕm kinh. H·y trau dåi Kh«ng Thñ c«ng c¬ b¶n vµ KiÕm c«ng c¬ b¶n tr­íc!")
	end
end;

function learn_lgjf()
	if HaveLearnedSkill("Vâ §ang kiÕm kinh") == 1 then
		LearnSkill("L­u Quang kiÕm ph¸p")
		Talk(1, "", "TiÓu tö! Ng­¬i ®· häc ®­îc L­u Quang kiÕm ph¸p! Thi triÓn thö xem!")
	else
		Talk(1, "", "TiÓu tö! Søc lùc cña ng­¬i kh«ng ®ñ! Kh«ng häc ®­îc L­u Quang kiÕm ph¸p. Ph¶i häc ®­îc Vâ §ang kiÕm kinh tr­íc!")
	end
end;

function learn_yjj()
	if HaveLearnedSkill("L­u Quang kiÕm ph¸p") == 1 then
		LearnSkill("Ngù KiÕm QuyÕt")
		Talk(1, "", "TiÓu tö! Ng­¬i ®· häc ®­îc Ngù KiÕm QuyÕt! Thi triÓn thö xem!")
	else
		Talk(1, "", "TiÓu tö! Søc lùc cña ng­¬i kh«ng ®ñ! Kh«ng häc ®­îc Ngù KiÕm QuyÕt. Ph¶i häc ®­îc L­u Quang kiÕm ph¸p!")
	end
end;

function endtalk()
	Talk(1, "", "Kh«ng häc th× th«i! Tµi c¸n g× chø!")
end;