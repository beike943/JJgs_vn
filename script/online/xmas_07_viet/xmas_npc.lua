--
-- ½£ÏÀÇéÔµÍøÂç°æ2
-- xmas_npc.lua
-- 2007Ô½ÄÏÊ¥µ®»î¶¯ npc½Å±¾
-- 2007-12-12
-- by wuwei1
--

Include("\\script\\online\\xmas_07_viet\\xmas_head.lua");

function main()
	local npc_name = "<color=green>"..GetTargetNpcName()..":<color>";
	if xmas_v07_is_open() == 1 then
		Say(npc_name.."Gi¸ng sinh vui vÎ! Ta cã rÊt nhiÒu quµ muèn tÆng cho mäi ng­êi! Trong thêi gian diÔn ra ho¹t ®éng, mçi ngµy c¸c cao thñ vâ l©m cã thÓ nhËn lÊy 1 lÇn!", 
			4,
			"nhËn quµ Gi¸ng sinh/xmas_give_gift",
			"Xem néi dung ho¹t ®éng./xmas_help",
			"T×m hiÓu c¸ch trång c©y th«ng vµ phÇn th­ëng/xmas_plant",
			"T¹m biÖt!/nothing");
	else
		Say(npc_name.."Sau Gi¸ng Sinh còng vui vÎ!", 0);
	end
end

function xmas_help()
	local npc_name = "<color=green>"..GetTargetNpcName()..":<color>";
	Talk(3,"",
	npc_name.."Mçi dŞp Gi¸ng Sinh vÒ, chóng ta cïng nhau chóc mäi ng­êi trªn thÕ gian cã nhiÒu niÒm vui.",
	npc_name.."Mçi ngµy cã thÓ ®Õn ®©y nhËn 1 <color=yellow>Nh¸nh Th«ng Gi¸o Héi<color> vµ 3 <color=yellow>vËt phÈm trang trİ<color>. B¹n cã thÓ trång <color=yellow>Nh¸nh Th«ng Gi¸o Héi<color> vµ treo <color=yellow>vËt phÈm trang trİ<color> ®Ó th¨ng cÊp c©y, nhËn ®­îc c¸c phÇn th­ëng!",
	npc_name.."Mçi ngµy khi b¹n lµm nhiÖm vô Th­¬ng Héi vµ nhiÖm vô S­ M«n cã thÓ nhËn ®­îc <color=yellow>nh¸nh th«ng mü lÖ<color> vµ <color=yellow>vËt phÈm trang trİ<color>, c¸ch trång gièng víi trång <color=yellow>c©y th«ng Gi¸o Héi<color>."
	);
end

function xmas_give_gift()
	local npc_name = "<color=green>"..GetTargetNpcName()..":<color>";
	local ndate = tonumber(date("%Y%m%d"));
	local nlast_date = GetTask(TASKID_XMAS_JH_GIFT);
	if ndate > nlast_date then
		if gf_Judge_Room_Weight(5, 10) == 0 then
			Say( npc_name.."Hµnh trang vµ søc lùc cña b¹n kh«ng ®ñ, dän dÑp hµnh trang råi h·y quay l¹i!.", 0);
			return 0;
		end
		SetTask(TASKID_XMAS_JH_GIFT, ndate);
		gf_SetLogCaption("xmas");
		gf_AddItemEx( {2, 0, 573, 1, 1}, "Nh¸nh th«ng gi¸o héi");
		gf_AddItemEx( {2, 0, 577, 3, 1}, "3 vËt phÈm trang trİ th«ng Gi¸o Héi");
		gf_SetLogCaption("");
	else
		Say( npc_name.."H«m nay b¹n ®· nhËn vËt phÈm, mçi ngµy chØ cã thÓ nhËn 1 lÇn. Ngµy mai h·y quay l¹i tham gia ho¹t ®éng!", 0);
	end
end

function xmas_plant()
	local npc_name = "<color=green>"..GetTargetNpcName()..":<color>";
	Talk(5,"",
	npc_name.."Trong thêi gian ho¹t ®éng, tõ <color=yellow>22-12-2007<color> ®Õn <color=yellow>06-01-2008<color>, t¹i 3 thµnh TuyÒn Ch©u, Thµnh §«, BiÖn Kinh ng­êi ch¬i cã thÓ trång c©y th«ng.\n C¸ch thøc nh­ sau: nhÊp chuét ph¶i vµo cµnh th«ng gi¸o héi hoÆc cµnh th«ng mü lÖ,lµm theo h­íng dÉn ®Ó trång c©y.\n B¹n cã thÓ trang trİ c©y th«ng b»ng c¸ch treo vËt trang trİ lªn ®ã..",
	npc_name.."Vµo <color=red>phót thø 5, 10, 15<color> ng­êi ch¬i cã thÓ treo vËt trang trİ lªn th«ng gi¸o héi, mçi lÇn sÏ mÊt 2 phót ®Ó hoµn thµnh viÖc treo quµ, nÕu kh«ng th× ph¶i ®îi lÇn treo quµ kÕ tiÕp, ë <color=red>phót thø 5, 7,9,11,13,15<color> ng­êi ch¬i cã thÓ treo vËt trang trİ lªn th«ng mü lÖ, mçi lÇn tèn 1 phót ®Ó hoµn thµnh viÖc treo quµ, nÕu kh«ng th× ph¶i ®îi lÇn treo quµ kÕ tiÕp..",
	npc_name.."Sau giai ®o¹n treo quµ, ng­êi ch¬i sÏ nhËn ®­îc phÇn th­ëng.n\phÇn th­ëng c©y th«ng gi¸o héi lµ 1 mãn ngo¹i trang ngÉu nhiªn vµ 1000, 2000 ®Õn 5000 ®iÓm kinh nghiÖm, ®iÒu kiÖn ®Ó nhËn lµ cÇn treo 3 mãn vËt trang trİ.\n PhÇn th­ëng c©y th«ng mü lÖ sÏ c¨n cø vµo tæng ®iÓm cña vËt trang trİ..",
	npc_name.."§iÓm sè trang trİ t­¬ng øng: \n  Lo¹i vËt trang trİ        §iÓm\n    VËt trang trİ 1        1    \n    VËt trang trİ 2        2\n    VËt trang trİ 3        3\n    VËt trang trİ 4        4",
	npc_name.."PhÇn th­ëng t­¬ng øng:\n    Tæng ®iÓm        PhÇn th­ëng\n    3-5            5 §¹i Hoµn §¬n    \n    6-9            5 B¹ch V©n T¸n\n    10-15        5 Ngäc Linh T¸n\n    16-18        10 Håi Thµnh Phï \n    19-21        1 Tiªu KiÕp T¸n\n    22-24        1  ThÇn N«ng §¬n"
	);	
end

	