Include("\\script\\online\\qianhe_tower\\qht_head.lua")
Include("\\script\\lib\\talktmp.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")

Qht_Dialog_Table = {
	"Giíi thiÖu néi dung ho¹t ®éng/qht_ds_introduce",
	"Giíi thiÖu phÇn th­ëng ho¹t ®éng/qht_ds_awardinfo",
	"T¹i h¹ ph¶i vµo Thiªn TÇm HuyÔn C¶nh/qht_ds_goto",
	"Dïng Hæ phï ®æi phÇn th­ëng/qht_ds_ibshop",
}

Qht_Npc_Name = "<color=green> §¹i Sø ho¹t ®éng: <color>";

Qht_Title = Qht_Npc_Name.."§Ó chóc mõng phiªn b¶n Hµo KiÖt L«i Tranh ra m¾t, ta më event Thiªn TÇm huyÔn c¹nh,®Ó khuyÕn khİch ng­êi ch¬i.";

function qht_ds_introduce()
	local strTitle = "Ho¹t §éng Thiªn TÇm HuyÔn C¶nh chñ yÕu nh­ sau \n";
	strTitle = strTitle.."Thêi gian ho¹t ®éng: 12/09 - 29/09\n";
	strTitle = strTitle.."Thiªn TÇm HuyÔn C¹nh, L­¬ng S¬n, V¹n KiÕm Tròng, §Şa HuyÒn Cung,Th¸i NhÊt Th¸p\n";
	strTitle = strTitle.."§iÒu kiÖn tham gia: Nh©n vËt ®¹t cÊp 85, ®· gia nhËp l­u ph¸i, vµ häc kü n¨ng cÊp 55\n";
	local tbSay = {
		"Giíi thiÖu Thiªn TÇm HuyÔn C¶nh/qht_ds_introduce_hj",
		"C¸ch thøc nhËn vµ c«ng dông cña Hæ phï/qht_ds_introduce_hf",
		"\n rót lui/nothing",
	}
	Say(Qht_Npc_Name..strTitle,getn(tbSay),tbSay);
end

function qht_ds_introduce_hj()
	local strTitle = "Thiªn TÇm HuyÔn C¹nh sinh ra tõ Thiªn TÇm Th¸p §¹i Lı, tæng céng cã 3 tÇng, ®i ®Õn tÇng cao h¬n sÏ chiªu gäi ra qu¸i vËt m¹nh h¬n, nhËn ®­îc b¶o vËt tèt h¬n.NÕu chiÕt trong mçi tÇng sÏ bŞ ®­a ra Thiªn TÇm HuyÔn C¹nh,cho nªn cÈn thËn.PhÇn th­êng cuèi cïng sau khi v­ît qua Thiªn TÇm HuyÔn C¹nh lµ : Thiªn Cang LÖnh, Thiªn M«n Kim LÖnh, Thó c­ìi vÜnh viÔn, bao thiªn kiªu lÖnh nhë, bao thiªn kiªu lÖnh lín, ®¸ quı cÊp 1-4,v.v.";
	local tbSay = {};
	tbSay.msg = Qht_Npc_Name..strTitle;
	tbSay.sel = {
		{"\n rót lui","nothing"},
	};
	temp_Talk(tbSay);
end

function qht_ds_introduce_hf()
	local strTitle = "NhÊp chuét ph¶i vµo c¸c lo¹i Hæ Phï cã thÓ më cöa tiÖm t­¬ng øng ®Ó ®æi phÇn th­ëng.\nNguån chñ yÕu sinh ra Hæ Phï:\n  1. Më r­¬ng trong Thiªn TÇm HuyÔn C¶nh, tiªu diÖt qu¸i vµ boss ®Òu sÏ nhËn ®­îc M¶nh Hæ Phï, Kim Hæ Phï.\n  2. Dïng M¶nh Hæ Phï vµ Bæ Kim Th¹ch ®Ó ghĞp thµnh Kim Hæ Phï.\n  3. §¸nh b¹i boss trong L­¬ng S¬n, V¹n KiÕm Tròng, Th«ng Thiªn HuyÔn C¶nh, §Şa HuyÒn Cung, Th¸i NhÊt Th¸p ®Òu cã c¬ héi nhËn ®­îc Hæ Phï, ¶i cµng cao th× tû lÖ boss r¬i ra Kim Hæ Phï cµng cao."
	local tbSay = {};
	tbSay.msg = Qht_Npc_Name..strTitle;
	tbSay.sel = {
		{"\n rót lui","nothing"},
	};
	temp_Talk(tbSay);
end

function qht_ds_awardinfo()
	local strTitle = "PhÇn th­ëng cña ho¹t ®éng lÇn nµy gåm cã 4 nguån sinh ra.\n  1. Trong Thiªn TÇm Th¸p ®¸nh b¹i kÎ ®Şch, më r­¬ng sÏ nhËn ®­îc phÇn th­ëng\n  2. Dïng Kim Hæ Phï vµo trong cöa hµng t­¬ng øng ®Ó ®æi phÇn th­ëng\n  3. 12:30 vµ 22:00 h»ng ngµy, trong c¸c tÇng cña Thiªn TÇm HuyÔn C¶nh ®Òu cã t¹o míi 1 BOSS Hoµng Kim, tÇng cµng cai th× phÇn th­ëng do BOSS Hoµng Kim r¬i ra cµng tèt\n  4. §¸nh b¹i BOSS Hoµng Kim sÏ nhËn ®­îc ChiÕn Kú Bang Héi ®Ó dïng ë c¸c thµnh chİnh, tÊt c¶ thµnh viªn trong bang tháa ®iÒu kiÖn ®Òu cã thÓ ®Õn chç ChiÕn Kú ®Ó nhËn phÇn th­ëng.\n  PhÇn th­ëng cña ho¹t ®éng lÇn nµy gåm cã: Thiªn Cang LÖnh, Thiªn M«n Kim LÖnh, ®¸ quı cÊp 1-4, thó c­ìi vÜnh viÔn, Thiªn Kiªu LÖnh, ThiÕt HuyÕt Bang Héi ChiÕn Kú...";
	local tbSay = {};
	tbSay.msg = Qht_Npc_Name..strTitle;
	tbSay.sel = {
		{"\n rót lui","nothing"},
	};
	temp_Talk(tbSay);	
end

function qht_ds_goto()
	local strTitle = "Ng­¬i cã thÓ vµo Thiªn TÇm HuyÔn C¶nh 1 m×nh hoÆc tæ ®éi ®Ó ®i vµo."--"½øÈëÒ»²ã»Ã¾³Ãâ·Ñ£¬½øÈë¶ş²ã»Ã¾³ĞèÒªÏûºÄ1¸öÍ­ÎÆ»¢·û/ÈË£¬½øÈëÈı²ã»Ã¾³ĞèÒªÏûºÄ1¸öÒøÎÆ»¢·û/ÈË¡£";
	local tbSay = {
		"Vµo Thiªn TÇm HuyÔn C¶nh tÇng 1/#qht_ds_goto_qht(1)",
		--"½øÈëÇ§Ñ°»Ã¾³¶ş²ã/#qht_ds_goto_qht(2)",
		--"½øÈëÇ§Ñ°»Ã¾³Èı²ã/#qht_ds_goto_qht(3)",
		"\n rót lui/nothing",
	}
	Say(Qht_Npc_Name..strTitle,getn(tbSay),tbSay);
end

function qht_ds_ibshop()
	local strTitle = "C¸c h¹ muèn më cöa tiÖm ®æi nµo vËy?";
	local tbSay = {
		--"Í­ÎÆ»¢·ûÉÌµê/qht_ds_ibshop_tw",
		--"ÒøÎÆ»¢·ûÉÌµê/qht_ds_ibshop_yw",
		"Cöa tiÖm Kim Hæ phï/qht_ds_ibshop_jw",
		"\n rót lui/nothing",
	}
	Say(Qht_Npc_Name..strTitle,getn(tbSay),tbSay);
end

function qht_ds_ibshop_tw()
	if qht_activity_isopen() ~= 1 then
		Talk(1,"","Event ®· hÕt h¹n");
		return 0;
	end
	show_equip_shop(3022);
end

function qht_ds_ibshop_yw()
	if qht_activity_isopen() ~= 1 then
		Talk(1,"","Event ®· hÕt h¹n");
		return 0;
	end
	show_equip_shop(3023);
end

function qht_ds_ibshop_jw()
	if qht_activity_isopen() ~= 1 then
		Talk(1,"","Event ®· hÕt h¹n");
		return 0;
	end
	show_equip_shop(3024);
end