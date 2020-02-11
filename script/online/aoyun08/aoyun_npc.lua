--Ê¥»ğ´«µİ»î¶¯´óÊ¹
--by vivi
--2008/05/09

Include("\\script\\online\\aoyun08\\aoyun_head.lua")
Include("\\script\\online\\aoyun08\\huojushou_name.lua")

function main()
--	local strtab = {
--		"ÎÒÒª±¨Ãû²Î¼ÓÊ¥»ğ´«µİ»î¶¯/aoyun_canjia_huoju",
--		"ÎÒÒªÁË½â»ğ¾æÊÖµÄ²ÎÑ¡×Ê¸ñ/aoyun_about_huoju",
--		"ÎÒÒªÁË½â±¾´Î»î¶¯µÄ½±Àø/aoyun_about_jiangli",
--		"ÎÒÒªÁË½â±¾´Î»î¶¯°²ÅÅ/aoyun_about_anpai",
--		"ÎÒÖ»ÊÇÀ´¿´¿´/nothing"
--		};
--	Say("<color=green>Ê¥»ğ´«µİ»î¶¯´óÊ¹<color>£ºÎäÁÖ´ó»áÒÑ¾­ÕÙ¿ªÁË£¬ÌìÏÂÓ¢ĞÛÔÚ´Ë±ÈÎä½ÏÒÕ£¬ÎªÁËÌåÏÖ±ÈÎäÇĞ´è£¬¹«Æ½¹«ÕıµÄÔ­Ôò£¬ÎÒÃÇ¼´½«½øĞĞ½£Íø2ÎäÁÖÊ¥»ğ´«µİ£¬²»ÖªÄãÃÇÊÇ·ñÒ²ÓĞĞËÈ¤²Î¼Ó¡£Ö»Òªµ½´ï<color=red>70¼¶<color>¾ÍÓĞÁË±¨Ãû²Î¼ÓµÄ×Ê¸ñÁË£¬<color=red>Èç¹ûÄú²Î¼ÓÁË»ğ¾æÊÖÑ¡°Î£¬ÇëÁôÒâ¹ÙÍø¹«¸æ£¬ÎÒÃÇ»á½øĞĞ·ûºÏ»ğ¾æÊÖ×Ê¸ñµÄÍæ¼ÒÃûµ¥¹«¸æ£¬½øĞĞµÚ¶şÂÖÑ¡¾Ù¡£<color>",
--		getn(strtab),
--		strtab)
	local strtab = {
			"Ta muèn t×m hiÓu ho¹t ®éng/chuandi_detail",
			"S¾p xÕp thêi gian ho¹t ®éng tiÕp søc/chuandi_time",
			"NhËn quyÒn tham gia ho¹t ®éng/chuandi_get_prove",
			"T×m täa ®é §µi ®uèc/huoju_zuobiao",
			"Ta chØ ®Õn xem thö/nothing"
			}
	Say("<color=green>§¹i sø ho¹t ®éng r­íc Th¸nh Háa<color>: Ho¹t ®éng r­íc Th¸nh Háa Vâ L©m s¾p b¾t ®Çu, mêi nh÷ng ng­êi tham gia ®Õn ®©y nhËn quyÒn tham gia vµ t×m hiÓu néi dung ho¹t ®éng.",
		getn(strtab),
		strtab)
end

function aoyun_canjia_huoju()
	local nDate = tonumber(date("%Y%m%d"));
	if nDate > 20080612 then
		Talk(1,"","<color=green>§¹i sø ho¹t ®éng r­íc Th¸nh Háa<color>: Thêi h¹n b¸o danh ho¹t ®éng r­íc Th¸nh Háa lµ 12 th¸ng 6.");
		return
	end
	if GetTask(547) == 1 then
		Talk(1,"","<color=green>§¹i sø ho¹t ®éng r­íc Th¸nh Háa<color>: Ng­¬i ®· b¸o danh tham gia ho¹t ®éng tuyÓn chän r­íc Th¸nh Háa, xin chó ı th«ng b¸o.");
		return
	end
	if GetLevel() < 70 then
		Talk(1,"","<color=green>§¹i sø ho¹t ®éng r­íc Th¸nh Háa<color>: §¼ng cÊp tham gia ho¹t ®éng r­íc Th¸nh Háa ph¶i trªn 70.");
		return
	end
	Say("<color=green>§¹i sø ho¹t ®éng r­íc Th¸nh Háa<color>: Ng­¬i muèn tham gia ho¹t ®éng, chØ cÇn trªn cÊp 70 lµ cã thÓ b¸o danh, <color=red>30 th¸ng 6<color> sÏ b¾t ®Çu r­íc Th¸nh Háa. Xin chó ı, bÊt kú ai nÕu tham gia ho¹t ®éng ®Òu cã thÓ nhËn ®­îc phÇn th­ëng.",
		2,
		"§­îc/aoyun_ask_canjia",
		"Kh«ng cÇn/nothing")
end

function aoyun_ask_canjia()
	Say("<color=green>§¹i sø ho¹t ®éng r­íc Th¸nh Háa<color>: Xin chó ı, mçi tµi kho¶n chØ cã thÓ cã 1 nh©n vËt ®­îc chän lµm ng­êi r­íc ®uèc, nÕu b¸o danh cïng lóc nhiÒu nh©n vËt th× sÏ chän ng­êi cã ®iÓm tİch lòy cao nhÊt.",
		2,
		"§­îc/aoyun_confirm_canjia",
		"Kh«ng cÇn/nothing")
end

function aoyun_confirm_canjia()
	SetTask(547,1);
	Talk(1,"","<color=green>§¹i sø ho¹t ®éng r­íc Th¸nh Háa<color>: Ng­¬i ®· b¸o danh tham gia ho¹t ®éng tuyÓn chän r­íc Th¸nh Háa, xin chó ı th«ng b¸o.")
end

function aoyun_about_huoju()
	Talk(1,"aoyun_about_huoju2","<color=green>§¹i sø ho¹t ®éng r­íc Th¸nh Háa<color>: Mäi ng­êi ®Òu cã t­ c¸ch tham gia r­íc ®uèc, chóng t«i sÏ c¨n cø th©n phËn trong Vâ L©m 2 ®Ó tuyÓn chän ng­êi r­íc ®uèc, thËm chİ khi b¹n kh«ng ®­îc chän vÉn cã thÓ lµm ng­êi cæ vò ®Ó tham gia hoÆt ®éng vµ nhËn phÇn th­ëng, tuyÓn cö ng­êi r­íc ®uèc chñ yÕu tham kh¶o nh­ phİa d­íc:\n1. §¼ng cÊp vµ thø h¹ng\n2. Qu©n ch­¬ng\n3. Qu©n c«ng\n4. §iÔm tİch lòy n¹p thÎ\n5. Danh väng\n6. §é cèng hiÕn s­ m«n\n7. Thµnh tİch §¹i héi vâ l©m");
end

function aoyun_about_huoju2()
	Talk(1,"main","<color=green>§¹i sø ho¹t ®éng r­íc Th¸nh Háa<color>: Sau khi b¸o danh, xin l­u ı trang chñ, ng­êi ch¬i cã ®iÒu kiÖn phï hîp tuyÓn chän ng­êi r­íc ®uèc, tõ <color=red>18/6 ®Õn 25/6<color> chóng t«i sÏ th«ng b¸o trªn trang chñ, vµ do ng­êi ch¬i bá phiÕu vßng 2.\n<color=red>Xin chó ı, n¨ng lùc tuyÓn chän lµ n¨ng lùc b¸o danh ngµy cuèi cïng, tr­íc nµy cuèi cïng b¹n cã thÓ t¨ng t­ c¸ch liªn quan.<color>")
end

function aoyun_about_jiangli()
	Talk(1,"main","<color=green>§¹i sø ho¹t ®éng r­íc Th¸nh Háa<color>: ChØ cÇn b¹n b¸o danh ho¹t ®éng r­íc ®uèc th× dï b¹n lµ ng­êi r­íc ®uèc hay ng­êi cæ vò còng ®Òu cã thÓ nhËn ®­îc phÇn th­ëng phong phó.")
end

function aoyun_about_anpai()
	Talk(1,"main","<color=green>§¹i sø ho¹t ®éng r­íc Th¸nh Háa<color>: Thêi gian b¸o danh ho¹t ®éng nµy tõ <color=red>b©y giê ®Õn 12/6<color>, mäi ng­êi cã thÓ b¸o danh tuyÓn chän ng­êi r­íc ®uèc.\nTõ <color=red>13/6 ®Õn 1-7/6<color>, chóng t«i sÏ tuyÓn chän b­íc ®Çu.\nTõ <color=red>18/6 ®Õn 25/6<color>, sÏ tiÕn hµnh bá phiÕu trªn trang chñ, trong 50 ng­êi s¬ tuyÓn chän ra 30 ng­êi.\nTõ <color=red>26/6 ®Õn 29/6<color>, c«ng bè danh s¸ch cuèi cïng trªn trang chñ.\n<color=red>30/6<color> lµ ngµy r­íc ®uèc, mäi ng­êi cïng nhau ®ã Th¸nh Háa.")
end

function chuandi_detail()
	Talk(1,"chuandi_detail2","<color=green>§¹i sø ho¹t ®éng r­íc Th¸nh Háa<color>: Nãi thö vÒ ho¹t ®éng lÇn nµy.\nHo¹t ®éng r­íc ®uèc:\nChØ cÇn ng­¬i tham gia b¸o danh lµ cã thÓ nhËn 'Chøng nhËn quyÒn r­íc ®uèc' vµ 'Chøng nhËn quyÒn cæ vò' t¹i ®©y, cÇn c¨n cø b¹n ®ñ t­ c¸ch liªn quan kh«ng.\nPhİm ph¶i tra xem 'Chøng nhËn quyÒn r­íc ®uèc' vµ 'Chøng nhËn quyÒn cæ vò' cña m×nh, x¸c nhËn nhiÖm vô m×nh cÇn hoµn thµnh vµ ®iÓm thêi gian r­íc ®uèc.\nSau khi ®Õn ®iÓm thêi gian r­íc ®uèc, r­íc ®uèc vµ cæ vò theo h­íng dÉn.");
end

function chuandi_detail2()
	Talk(1,"main","<color=green>§¹i sø ho¹t ®éng r­íc Th¸nh Háa<color>: Ho¹t ®éng ®¹i héi tû vâ mõng Th¸nh Háa:\nSau khi ho¹t ®éng b¾t ®Çu 30/3, khi kh«ng ph¶i thêi gian ngµy r­íc ®uèc m¸y chñ nµy, ai còng cã thÓ mua '§ång phôc r­íc ®uèc' t¹i t¹p hãa, tõ Th¸nh Háa §µi b¾t ®Çu th¾p ®uèc, qua tÊt c¶ §µi ®uèc, sau khi ®Õn Th¸nh Háa §µi ThŞnh ThÕ cuèi cïng, ®Òu cã thÓ nhËn phÇn th­ëng, nh­ng cÇn chó ı r»ng mçi ng­êi mçi ngµy chØ nhËn ®­îc mét lÇn.");
end

function chuandi_time()
	Talk(1,"chuandi_time2","<color=green>§¹i sø ho¹t ®éng r­íc Th¸nh Háa<color>: Thêi gian nh­ sau, ho¹t ®éng b¾t ®Çu tõ 30/6 ®Õn 6/8 kÕt thóc.\nB¾t ®Çu tõ 30/6, tuÇn ®Çu 30/6 lµ khu thu phİ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 r­íc ®uèc.\nTuÇn 2 7/7 lµ khu thu phİ 11, 12, 13, 14, 15, 16, 1-7, 18, 19, 20 r­íc ®uèc.\nTuÇn 3 14/7 lµ khu thu phİ 21, 22, 23, 24, 25, 26, 27, 28, 29, 30 r­íc ®uèc.");
end

function chuandi_time2()
	Talk(1,"main","<color=green>§¹i sø ho¹t ®éng r­íc Th¸nh Háa<color>: TuÇn 4 21/7 lµ khu thu phİ 31, 32, 33, 34, 35, 36, 37, 38, 39, 40 r­íc ®uèc.\nTuÇn 5 28/7 lµ khu thu phİ 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52 r­íc ®uèc.\nTuÇn 6 4/8 toµn bé khu miÔn phİ r­íc ®uèc.\nThêi gian ho¹t ®éng chuyÓn ®uèc lµ <color=yellow>20 giê ®Õm 21 giê tèi<color>.")
end

function chuandi_get_prove()
	if GetTask(547) ~= 0 then
		local sName = tostring(GetName());
		local nIsHuojushou = 0;
		for i=1,getn(tHuojushouName) do
			for j=1,getn(tHuojushouName[i]) do
				if sName == tHuojushouName[i][j] then
					nIsHuojushou = j;
					break
				end
			end
		end
		if nIsHuojushou == 0 then
			Say("<color=green>§¹i sø ho¹t ®éng r­íc Th¸nh Háa<color>: Ng­¬i ®ang lµ ng­êi cæ vò, ng­¬i muèn nhËn <color=yellow>quyÒn tham gia cæ vò<color> kh«ng?",
				2,
				"Ta muèn nhËn /#chuandi_confirm_get(1)",
				"§Ó nhËn sau/nothing")
		else
			SetTask(TASK_AOYUN_HUOJU_NUM,nIsHuojushou);
			Say("<color=green>§¹i sø ho¹t ®éng r­íc Th¸nh Háa<color>: Ng­¬i ®ang lµ ng­êi r­íc ®uèc, muèn nhËn <color=yellow>Chøng nhËn quyÒn r­íc ®uèc<color> kh«ng?",
				2,
				"Ta muèn nhËn /#chuandi_confirm_get(2)",
				"§Ó nhËn sau/nothing")
		end
	else
		Talk(1,"","<color=green>§¹i sø ho¹t ®éng r­íc Th¸nh Háa<color>: Ng­¬i ch­a b¸o danh tham gia ho¹t ®éng.");
	end
end

function chuandi_confirm_get(nType)
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	if nType == 1 then
		if BigGetItemCount(2,1,3377) < 1 then
			AddItem(2,1,3377,1); --ÖúÍşÕß×Ê¸ñÖ¤Êé
		else
			Talk(1,"","<color=green>§¹i sø ho¹t ®éng r­íc Th¸nh Háa<color>: Kh«ng ph¶i ng­¬i ®· cã råi sao?")
		end 
	elseif nType == 2 then
		local nBody = GetBody();
		if BigGetItemCount(0,105,44+nBody) < 1 then
			AddItem(0,105,44+nBody,1); --»ğ¾æÊÖ·şÊÎ
		end		
		if BigGetItemCount(2,1,3376) < 1 then
			AddItem(2,1,3376,1); --»ğ¾æÊÖ×Ê¸ñÖ¤Êé
		else
			Talk(1,"","<color=green>§¹i sø ho¹t ®éng r­íc Th¸nh Háa<color>: Kh«ng ph¶i ng­¬i ®· cã råi sao?")
		end
	end
end

function huoju_zuobiao()
	Talk(1,"huoju_zuobiao2","Phông T­êng: Th¸nh Háa §µi [228,191], §µi ®uèc 1 [209,200], §µi ®uèc 2 [207,193], §µi ®uèc 3 [222,200]\nT­¬ng D­¬ng: §µi ®uèc 4 [192,1-79], §µi ®uèc 5 [1-77,1-74], §µi ®uèc 6 [168,1-79], §µi ®uèc 7 [1-70,190], §µi ®uèc 8 [189,190]\nThµnh §«: §µi ®uèc 9 [209,229], §µi ®uèc 10 [213,21-7], §µi ®uèc 11 [232,218], §µi ®uèc 12 [220,221], §µi ®uèc 13 [233,226]\n§¹i Lı: §µi ®uèc 14 [191,182], §µi ®uèc 15 [1-78,185], §µi ®uèc 16 [181,193], §µi ®uèc 1-7 [195,194]");
end

function huoju_zuobiao2()
	Talk(1,"OnUse","TuyÒn Ch©u: §µi ®uèc 18 [169,180], §µi ®uèc 19 [169,190], §µi ®uèc 20 [189,190], §µi ®uèc 21 [188,181]\nD­¬ng Ch©u: §µi ®uèc 22 [203,191], §µi ®uèc 23 [203,198], §µi ®uèc 24 [218,198], §µi ®uèc 25 [21-7,192]\nBiÖn Kinh: §µi ®uèc 26 [158,185], §µi ®uèc 27 [183,184], §µi ®uèc 28 [183,1-73], §µi ®uèc 29 [162,1-72], §µi ®uèc thŞnh thÕ [1-70,1-79]");
end