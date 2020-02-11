	prize_use_start_time = 13447
	prize_use_end_time = 13463
function main()
	local palyer_sex = "§¹i hiÖp"
	if GetSex() == 2 then
		palyer_sex = "N÷ hiÖp "
	end
	if day_num_return() < prize_use_start_time or day_num_return() > prize_use_end_time then
		Say("VŞ "..palyer_sex.."NÕu muèn x­ng b¸ vâ l©m th× cÇn ph¶i rÌn luyÖn thªm.",
		1,
		"Ta biÕt råi/end_dialog")
	else
	Say("TÕt Trïng D­¬ng kh«ng ®­îc ®¨ng s¬n th­ëng töu th× thËt ®¸ng tiÕc!",
	3,
	"Ta muèn ®Õn Hoa S¬n/goto_huashan",
	"T×m hiÓu vÒ ho¹t ®éng cña tÕt Trïng D­¬ng/double_nineth_con",
	"KÕt thóc ®èi tho¹i/end_dialog"
	)
	end
end
--******************************´«ËÍµ½»ªÉ½******************************************
function goto_huashan()
		NewWorld(969,1633,3263)
end
function double_nineth_con()
	Talk(2,"dialog_next",
		"\n Thêi gian ho¹t ®éng tõ: <color=yellow>0:00/ 27/10-24:00/ 05/11<color>. \n Thêi h¹n sö dông phÇn th­ëng: <color=yellow>24:00/ 12/11<color>. \n §iÒu kiÖn tham gia: nh©n vËt cÊp <color=yellow>11<color>. \n Tèi ®a nhËn phÇn th­ëng: <color=yellow>6<color> lÇn/ngµy. \n Tæng sè phÇn th­ëng nhËn: <color=yellow>42<color> lÇn.",
		"C¸c b­íc ho¹t ®éng: \n 1.T¹i tam ®¹i thµnh thŞ: TuyÒn Ch©u, BiÖn Kinh, Thµnh §« cø c¸ch nhau 5 phót 3 loµi hoa: Cóc vµng, Thï Du, Cóc tİm l¹i në hoa. NhÊp vµo cã thÓ h¸i ®­îc. \n 2.Thu thËp mçi loµi ®ñ 9 hoa, nhÊp chuét ph¶i vµo tõng lo¹i ®Ó chÕ biÕn thµnh: Cóc Hoa Töu, Thï Du Thóc, Cóc Hoa Cao. \n 3. Cóc Hoa Töu, Thï Du Thóc, Cóc Hoa Cao chØ lªn ®Ønh <color=red>Hoa S¬n<color> míi cã thÓ sö dông (H¹n sö dông ®Õn 24:00/12/11). Mäi ng­êi cã thÓ ®Õn BiÖn Kinh, Thµnh §«, TuyÒn Ch©u gÆp <color=yellow>Vâ L©m TruyÒn Nh©n<color> ®Ó ®­îc ®­a lªn Hoa S¬n!"
		)
end
function dialog_next()
	Talk(2,"",
		"PhÇn th­ëng ho¹t ®éng: \n 9 ®ãa <color=yellow>Cóc vµng<color> tinh chÕ thµnh <color=yellow>Cóc Hoa Töu<color>. Sö dông: 500000 ®iÓm søc kháe chuyÓn hãa thµnh ®iÓm kinh nghiÖm.\n 9 ®ãa <color=yellow>Thï Du<color> tinh chÕ thµnh <color=yellow>Thï Du Thóc<color>.Sö dông: T¨ng 500000 ®iÓm søc kháe.\n 9 ®ãa <color=yellow>Cóc tİm<color> tinh chÕ thµnh <color=yellow>Cóc Hoa Cao<color>. Sö dông: T¨ng 10 ®iÓm danh väng vµ 200000 ®iÓm søc kháe chuyÓn hãa thµnh 200000 ®iÓm kinh nghiÖm.",
		"Chó ı: \n 1.Tèi ®a nhËn phÇn th­ëng mçi ngµy 6 lÇn. \n 2. Tæng sè lÇn nhËn th­ëng trong suèt thêi gian ho¹t ®éng: 42 lÇn. \n 3. NÕu ®iÓm søc kháe=0 th× <color=red>Kh«ng thÓ sö dông<color>Cóc Hoa Töu vµ Cóc Hoa Cao. \n 4. Mäi ng­êi nªn tİch lòy ®iÓm søc kháe ®Ó sö dông Cóc Hoa Töu vµ Cóc Hoa Cao."
	)
end
function end_dialog()
end
--**************************ÂÖ´Î¼ÆËãº¯Êı******************************************
function day_num_return()
	local times_return = floor((GetTime() - 57600)/(86400))
	return times_return
end