--Ê¥»ğ´«µİ»î¶¯»ğ¾æÊÖ×Ê¸ñÖ¤Êé
--by vivi
--2008/05/30

Include("\\script\\online\\aoyun08\\aoyun_head.lua")

function OnUse()
	if GetTask(547) == 0 or GetTask(TASK_AOYUN_HUOJU_NUM) == 0 then
		Talk(1,"","<color=green>Chøng nhËn quyÒn r­íc ®uèc<color>: Xin lçi, b¹n kh«ng ph¶i ng­êi r­íc ®uèc.");
		return
	end
	local nTask = GetTask(TASK_AOYUN_HUOJU_NUM);
	local nStrtab = {
		"T×m hiÓu phÇn th­ëng/huojushou_award",
		"§­a ta ®Õn §µi ®uèc t­¬ng øng (50 b¹c)/goto_huojutai",
		"T×m täa ®é §µi ®uèc/huoju_zuobiao",
		"Tho¸t/nothing"
		};
	if nTask == 1 then
		Say("<color=green>Chøng nhËn quyÒn r­íc ®uèc<color>: Chóc mõng, b¹n ®· tõ <color=yellow>Th¸nh Háa §µi<color> nhËn ®­îc Th¸nh Háa, chuyÓn ®Õn <color=yellow>§µi ®uèc 1<color>, xin chuÈn bŞ trong ngµy r­íc ®uèc, chuyÓn ngän thø nhÊt! <color=yellow>Tr­íc khi Th¸nh Háa §µi bèc ch¸y<color> chuyÓn ®Õn §µi ®uèc 1, nÕu kh«ng ®Õn ®óng giê th× sÏ kh«ng nhËn ®­îc phÇn th­ëng.",
			getn(nStrtab),
			nStrtab);
	elseif nTask == 30 then
		Say("<color=green>Chøng nhËn quyÒn r­íc ®uèc<color>: Chóc mõng, b¹n ®· tõ <color=yellow>§µi ®uèc 29<color> nhËn ®­îc Th¸nh Háa, chuyÓn ®Õn <color=yellow>§µi ®uèc thŞnh thÕ<color>, xin chuÈn bŞ trong ngµy r­íc ®uèc, chuyÓn ngän cuèi cïng! <color=yellow>Tr­íc khi Th¸nh Háa §µi bèc ch¸y<color> chuyÓn ®Õn §µi ®uèc thŞnh thÕ, nÕu kh«ng ®Õn ®óng giê th× sÏ kh«ng nhËn ®­îc phÇn th­ëng.",
			getn(nStrtab),
			nStrtab);
	else
		Say("<color=green>Chøng nhËn quyÒn r­íc ®uèc<color>: Chóc mõng, tõ §µi ®uèc <color=yellow>"..(nTask-1).."<color> nhËn ®­îc Th¸nh Háa, chuyÓn ®Õn §µi ®uèc <color=yellow>"..nTask.."<color>, xin chuÈn bŞ trong ngµy r­íc ®uèc, chuyÓn ngän nµy! <color=yellow>Tr­íc khi Th¸nh Háa §µi bèc ch¸y<color> chuyÓn ®Õn §µi ®uèc "..nTask..", nÕu kh«ng ®Õn ®óng giê th× sÏ kh«ng nhËn ®­îc phÇn th­ëng.",
			getn(nStrtab),
			nStrtab);
	end
end

function huojushou_award()
	Talk(1,"","<color=green>Chøng nhËn quyÒn r­íc ®uèc<color>: PhÇn th­ëng ng­êi r­íc ®uèc nh­ sau:\nSau khi ho¹t ®éng b¾t ®Çu, chØ cÇn chuyÓn ®uèc tõ §µi ®uèc hiÖn t¹i ®Õn §µi ®uèc chØ ®Şnh lµ cã thÓ nhËn phÇn th­ëng kinh nghiÖm lËp ph­¬ng ®¼ng cÊp x 15. NÕu cÊp 99 cã thÓ nhËn 1 viªn Linh th¹ch ngÉu nhiªn cÊp 7.\nSau khi kÕt thóc ho¹t ®éng, trong 2 phót nhÊn §µi ®uèc chØ ®Şnh lµ cã thÓ nhËn phÇn th­ëng kinh nghiÖm lËp ph­¬ng ®¼ng cÊp x 10. NÕu cÊp 99 cã thÓ nhËn 1 viªn Linh th¹ch ngÉu nhiªn cÊp 6-7.")
end

function huoju_zuobiao()
	Talk(1,"huoju_zuobiao2","Phông T­êng: Th¸nh Háa §µi [228,191], §µi ®uèc 1 [209,200], §µi ®uèc 2 [207,193], §µi ®uèc 3 [222,200]\nT­¬ng D­¬ng: §µi ®uèc 4 [192,1-79], §µi ®uèc 5 [1-77,1-74], §µi ®uèc 6 [168,1-79], §µi ®uèc 7 [1-70,190], §µi ®uèc 8 [189,190]\nThµnh §«: §µi ®uèc 9 [209,229], §µi ®uèc 10 [213,21-7], §µi ®uèc 11 [232,218], §µi ®uèc 12 [220,221], §µi ®uèc 13 [233,226]\n§¹i Lı: §µi ®uèc 14 [191,182], §µi ®uèc 15 [1-78,185], §µi ®uèc 16 [181,193], §µi ®uèc 1-7 [195,194]");
end

function huoju_zuobiao2()
	Talk(1,"OnUse","TuyÒn Ch©u: §µi ®uèc 18 [169,180], §µi ®uèc 19 [169,190], §µi ®uèc 20 [189,190], §µi ®uèc 21 [188,181]\nD­¬ng Ch©u: §µi ®uèc 22 [203,191], §µi ®uèc 23 [203,198], §µi ®uèc 24 [218,198], §µi ®uèc 25 [21-7,192]\nBiÖn Kinh: §µi ®uèc 26 [158,185], §µi ®uèc 27 [183,184], §µi ®uèc 28 [183,1-73], §µi ®uèc 29 [162,1-72], §µi ®uèc thŞnh thÕ [1-70,1-79]");
end