--filename:qingrenjie_item.lua
--create date:2006-01-19
--author:yanjun
--describe:ÇéÈË½á½Å±¾
Include("\\script\\online\\qingrenyuanxiao\\qryx_head.lua")

function OnUse()
	local selTab = {}
	selTab[1] = "Xem néi dung ho¹t ®éng./know_detail"
	selTab[2] = "Ta nhËn ®­îc gièng hoa hång, sö dông nh­ thÕ nµo?/know_useseed"
	selTab[3] = "Ta hiÓu råi!/nothing"
	
	if GetTask(TASK_GOT_QRJ) == 0 then
		Say("D­êng nh­ ng­¬i vÉn ch­a tr¾c nghiÖm chØ sè duyªn phËn, lµm sao tham gia lÔ t×nh nh©n ®©y?",0)
		return 0
	else
		Say("ChØ sè duyªn phËn cña b¹n lµ: <color=yellow>"..GetTask(TASK_YUANFEN).."<color>.",3,selTab)
	end
end

function know_detail()
	Talk(4,"","Khi ho¹t ®éng diÔn ra, c¸c b¹n cã thÓ ®Õn gÆp NguyÖt l·o tr¾c nghiÖm chØ sè duyªn phËn. Sau ®ã cÆp nam n÷ ®· tr¶i qua tr¾c nghiÖm, cã thÓ gióp NguyÖt L·o t¸c hîp 4 ®«i uyªn ­¬ng.",
				"H·y gióp NguyÖt L·o t¸c hîp 4 ®«i t×nh nh©n, sau ®ã quay vÒ nhËn th­ëng!",
				"§©y xem nh­ lµ 4 nhiÖm vô nhá, mçi nhiÖm vô mçi ngµy mçi ng­êi chØ cã thÓ lµm 1 lÇn. §ång thêi ®«i nam n÷ vÉn trong tæ ®éi th× míi hoµn thµnh nhiÖm vô, nÕu kh«ng th× nhiÖm vô h«m ®ã xem nh­ kh«ng hoµn thµnh.",
				"Sù kh¸c nhau chØ sè duyªn phËn vµ ®é th©n thiÖn cña 2 ng­êi sÏ ¶nh h­ëng ®Õn x¸c suÊt r¬i vËt phÈm nhiÖm vô. NÕu chØ sè duyªn phËn t­¬ng ®ång hoÆc ®é th©n thiÖn lín h¬n 2000 th× x¸c suÊt r¬i vËt phÈm cao nhÊt, ng­îc l¹i sÏ thÊp dÇn.")
end

function know_useseed()
	Talk(3,"","Sau khi hoµn thµnh nhiÖm vô t×nh yªu, nh©n vËt nam gÆp NguyÖt L·o ®Ó nhËn h¹t gièng hoa hång vµ lé thñy, chØ cã ng­êi nam trong tæ ®éi míi cã thÓ trång h¹t gièng hoa hång, sau khi trång, t¹i vŞ trİ ng­êi nam ®ang ®øng sÏ hiÖn lªn 1 c©y con mang tªn nh©n vËt n÷.",
				"Cø 30 phót cã thÓ t­íi lé thñy cho c©y con mét lÇn, trong qu¸ tr×nh t­íi n­íc 2 ng­êi vÉn trong tæ ®éi. NÕu nh­ trong vßng 1h, kh«ng t­íi n­íc, hoa hång sÏ kh« chÕt.",
				"Mçi lÇn t­íi n­íc, hoa sÏ lín lªn, sau 30 phót ë tr¹ng th¸i hoa hång, ng­êi n÷ míi cã thÓ h¸i xuèng.")
end