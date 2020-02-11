--Ê¥»ğ´«µİ»î¶¯ÖúÍşÕß×Ê¸ñÖ¤Êé
--by vivi
--2008/05/30

Include("\\script\\online\\aoyun08\\aoyun_head.lua")

function OnUse()
	if GetTask(547) == 0 then
		Talk(1,"","<color=green>Chøng nhËn quyÒn cæ vò<color>: Xin lçi, b¹n kh«ng ph¶i ng­êi cæ vò.");
		return
	end
	if GetTask(TASK_AOYUN_ZHUWEI_NUM) == 0 then
		local nRand = random(1,31);
		SetTask(TASK_AOYUN_ZHUWEI_NUM,nRand);
	end
	local nTask = GetTask(TASK_AOYUN_ZHUWEI_NUM);
	local nStrtab = {
		"T×m hiÓu phÇn th­ëng ng­êi cæ vò/zhuweizhe_award",
		"§­a ta ®Õn §µi ®uèc t­¬ng øng (50 b¹c)/goto_huojutai",
		"T×m täa ®é §µi ®uèc/huoju_zuobiao",
		"Tho¸t/nothing"
		};
	if nTask == 1 then
		Say("<color=green>Chøng nhËn quyÒn cæ vò<color>: Chóc mõng b¹n nhËn ®­îc quyÒn cæ vò t¹i <color=yellow>Th¸nh Háa §µi<color>, sau khi ®uèc ®­îc th¾p, b¹n cã thÓ nhËn phÇn th­ëng t¹i Th¸nh Háa §µi. (NhÊn phİm ph¶i)",
			getn(nStrtab),
			nStrtab);
	elseif nTask == 31 then
		Say("<color=green>Chøng nhËn quyÒn cæ vò<color>: Chóc mõng b¹n nhËn ®­îc quyÒn cæ vò t¹i <color=yellow>§µi ®uèc thŞnh thÕ<color>, sau khi ®uèc ®­îc th¾p, b¹n cã thÓ nhËn phÇn th­ëng t¹i §µi ®uèc thŞnh thÕ. (NhÊn phİm ph¶i)",
			getn(nStrtab),
			nStrtab);
	else
		Say("<color=green>Chøng nhËn quyÒn cæ vò<color>:  Chóc mõng b¹n nhËn ®­îc quyÒn cæ vò t¹i §µi ®uèc <color=yellow>"..(nTask-1).."<color>, sau khi ®uèc ®­îc th¾p, b¹n cã thÓ nhËn phÇn th­ëng t¹i §µi ®uèc "..(nTask-1)..".(NhÊn phİm ph¶i)",
			getn(nStrtab),
			nStrtab);
	end
end

function zhuweizhe_award()
	Talk(1,"","<color=green>Chøng nhËn quyÒn cæ vò<color>: PhÇn th­ëng ng­êi cæ vò nh­ sau:\nKhi ho¹t ®éng b¾t ®Çu, Th¸nh Háa §µi chØ ®Şnh ®­îc th¾p lªn, lµ cã thÓ nhËn 1 'Loa cæ vò' t¹i §µi ®uèc, sau khi dïng ph¸t ra lêi chóc phóc cña m×nh cã thÓ nhËn 1 vËt phÈm thuéc hÖ Bång Lai, vµ phÇn th­ëng kinh nghiÖm lËp ph­¬ng ®¼ng cÊp x 8. NÕu cÊp 99 cã thÓ nhËn 1 viªn Linh th¹ch ngÉu nhiªn cÊp 6-7.\nTrong thêi gian ho¹t ®éng, t¹i §µi ®uèc chØ ®Şnh chê 1 phót cã thÓ nhËn phÇn th­ëng kinh nghiÖm lËp ph­¬ng ®¼ng cÊp x 6. NÕu cÊp 99 cã x¸c suÊt 20% nhËn ®­îc 1 viªn Linh th¹ch ngÉu nhiªn cÊp 1-7.\nKhi ho¹t ®éng kÕt thóc trong 2 phót nhÊn §µi ®uèc chØ ®Şnh lµ cã thÓ nhËn phÇn th­ëng kinh nghiÖm lËp ph­¬ng ®¼ng cÊp x 5. NÕu cÊp 99 cã thÓ nhËn ®­îc 1 Linh th¹ch ngÉu nhiªn cÊp 6.")
end

function huoju_zuobiao()
	Talk(1,"huoju_zuobiao2","Phông T­êng: Th¸nh Háa §µi [228,191], §µi ®uèc 1 [209,200], §µi ®uèc 2 [207,193], §µi ®uèc 3 [222,200]\nT­¬ng D­¬ng: §µi ®uèc 4 [192,1-79], §µi ®uèc 5 [1-77,1-74], §µi ®uèc 6 [168,1-79], §µi ®uèc 7 [1-70,190], §µi ®uèc 8 [189,190]\nThµnh §«: §µi ®uèc 9 [209,229], §µi ®uèc 10 [213,21-7], §µi ®uèc 11 [232,218], §µi ®uèc 12 [220,221], §µi ®uèc 13 [233,226]\n§¹i Lı: §µi ®uèc 14 [191,182], §µi ®uèc 15 [1-78,185], §µi ®uèc 16 [181,193], §µi ®uèc 1-7 [195,194]");
end

function huoju_zuobiao2()
	Talk(1,"OnUse","TuyÒn Ch©u: §µi ®uèc 18 [169,180], §µi ®uèc 19 [169,190], §µi ®uèc 20 [189,190], §µi ®uèc 21 [188,181]\nD­¬ng Ch©u: §µi ®uèc 22 [203,191], §µi ®uèc 23 [203,198], §µi ®uèc 24 [218,198], §µi ®uèc 25 [21-7,192]\nBiÖn Kinh: §µi ®uèc 26 [158,185], §µi ®uèc 27 [183,184], §µi ®uèc 28 [183,1-73], §µi ®uèc 29 [162,1-72], §µi ®uèc thŞnh thÕ [1-70,1-79]");
end