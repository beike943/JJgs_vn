Include("\\script\\online\\dazitie\\dzt_head.lua")
Include("\\script\\lib\\talktmp.lua")

DZT_NPC = "<color=green>§¹i Sø ho¹t ®éng<color>:"

DZT_TITLE = "Trung Thu ®· qua, ch÷ viÕt cña Gia C¸t Kú tÆng cho t¹i h¹ ®· bŞ ®¸nh c¾p, khiÕn t¹i h¹ rÊt ®au lßng, vŞ nµo cã thÓ gióp t×m l¹i, t¹i h¹ xin träng th­ëng hËu hÜnh!"

DZT_DIALOG_TABLE = {
	"Giíi thiÖu ho¹t ®éng/dzt_introduce",
	"Liªn quan phÇn th­ëng ho¹t ®éng/dzt_award",
	"T¹i h¹ ®· t×m l¹i ch÷ viÕt 'Hoa H¶o NguyÖt Viªn'/dzt_find_hhyy",
	"T¹i h¹ ®· t×m l¹i ch÷ viÕt 'Phæ Thiªn §ång Kh¸nh'/dzt_find_pttq",
}

function dzt_introduce()
	local strTitle = "Ho¹t ®éng ®¹i t¸c chiÕn truy t×m ch÷ viÕt lÇn nµy, chØ dµnh cho ng­êi ch¬i cÊp 80 trë lªn häc ®­îc kü n¨ng cÊp 55. Ch÷ viÕt gåm [Hoa],[H¶o],[NguyÖt],[Viªn],[Phæ Thiªn §ång Kh¸nh], trong 5 lo¹i nµy, bé phËn ch÷ viÕt bŞ ®¹o tÆc  cÊt gi÷ trong L­¬ng S¬n, V¹n KiÕm Tròng, Th«ng Thiªn HuyÔn C¶nh, ChiÕn tr­êng Thiªn M«n TrËn, phã b¶n kh¸c nhau th× x¸c suÊt sinh ra ch÷ viÕt còng kh¸c nhau.\nNh÷ng ®¹o tÆc ®¸nh c¾p ch÷ viÕt Èn h×nh trong NhŞ Long S¬n, tõ 10 giê s¸ng ®Õn 2 giê tèi mçi ngµy, cø 1 giê sÏ diÔn ra ho¹t ®éng vay b¾t ®¹o tÆc ®¸nh c¾p ch÷ , ®¸nh b¹i chóng kh«ng nh÷ng cã thÓ lÊy l¹i ch÷ mµ cßn nhËn ®­îc phÇn th­ëng thªm. [Phæ Thiªn §ång Kh¸nh] ngoµi viÖc r¬i ra tõ c¸c ¶i, ®¹o tÆc ch÷ viÕt, cßn cã thÓ th«ng qua [Bót Long](b¸n ë Ngù C¸c) hoÆc dïng vµng viÕt ch÷ [Hoa],[H¶o],[NguyÖt].[Viªn] thµnh [Phæ Thiªn §ång Kh¸nh]";
	local tbSay = {};
	tbSay.msg = DZT_NPC..strTitle;
	tbSay.sel = {
		{"\n rót lui","nothing"},
	};
	temp_Talk(tbSay);
end

function dzt_award()
	local strTitle = "PhÇn th­ëng cuèi cïng cña ho¹t ®éng nµy lµ Thiªn Cang LÖnh, Thiªn M«n Kim LÖnh. \n Nép[Hoa], [H¶o], [NguyÖt], [Viªn]: Trong thêi gian ho¹t ®éng diÔn ra mçi nh©n vËt cã thÓ nép 200 lÇn; \n Nép [Phæ Thiªn §ång Kh¸nh]: Kh«ng giíi h¹n sè lÇn nép, ngoµi phÇn th­ëng nép h»ng ngµy, cßn nhËn ®­îc:\n  Nép ®ñ 50 lÇn, nhËn ®­îc Ma §ao Th¹ch cÊp 1; ®ñ 100 lÇn nhËn ®­îc Ma §ao Th¹ch cÊp 2; \n   §ñ 200 lÇn nhËn ®­îc Linh Th¹ch cÊp 7; §ñ 400 lÇn nhËn ®­îc c­êng hãa quyÓn 13; \n   §ñ 800 lÇn nhËn ®­îc m¶nh B¹ch Kim; 1200 lÇn nhËn ®­îc c­êng hãa quyÓn 14; \n §ñ 1600 lÇn nhËn ®­îc Thiªn Cang LÖnh; \n   Nép 2200 lÇn nhËn ®­îc Thiªn M«n Kim LÖnh, sè lÇn nép thiÕt lËp vÒ 0 cã thÓ nép l¹i tõ ®Çu.";
	local tbSay = {};
	tbSay.msg = DZT_NPC..strTitle;
	tbSay.sel = {
		{"\n rót lui","nothing"},
	};
	temp_Talk(tbSay);
end

function dzt_find_hhyy()
	if dzt_check_condition() ~= 1 then
		return 0;
	end
	local strTitle = "PhÇn th­ëng nµy cÇn ph¶i nép [Hoa], [H¶o],[NguyÖt], [Viªn] mçi thø %d c¸i, trong suèt ho¹t ®éng cã thÓ nhËn %d lÇn, hiÖn t¹i c¸c h¹ ®· nhËn %d lÇn.";
	strTitle = format(strTitle, 1, DZT_HHYY_MAX, DZT_ACTIVITY_TASK_GROUP:GetTask(DZT_ACTIVITY_TASK_GROUP.HHYY));
	local tbSay = {};
	tbSay.msg = DZT_NPC..strTitle;
	tbSay.sel = {
		{"\n NhËn phÇn th­ëng","dzt_get_award_hhyy"},
		{"\n rót lui","nothing"},
	};
	temp_Talk(tbSay);
end

function dzt_find_pttq()
	if dzt_check_condition() ~= 1 then
		return 0;
	end
	local strTitle = "PhÇn th­ëng nµy cÇn ph¶i nép [Phæ Thiªn §ång Kh¸nh]%d c¸i, nép mçi lÇn nhËn ®­îc %d lÇn nép, khi nép ®ñ %d,  %d, %d, %d, %d,  %d, %d, %d nhËn ®­îc thªm phÇn th­ëng. Sau khi nhËn phÇn th­ëng lÇn %d, sè lÇn nép sÏ thiÕt lËp vÒ 0, c¸c h¹ cã thÓ nép thªm ®Ó nhËn thªm phÇn th­ëng, c¸c h¹ ®· nép %d lÇn, nép thªm %d lÇn th× cã thÓ nhËn phÇn th­ëng: %s";
	local nNum = DZT_ACTIVITY_TASK_GROUP:GetTask(DZT_ACTIVITY_TASK_GROUP.PTTQ);
	local nCount = 0;
	local nTempTb = {50, 100, 200, 400, 800, 1200, 1600, 2200};
	for i = 1, getn(nTempTb) do 
		if nNum < nTempTb[i]then
			nCount = nTempTb[i];
			break;
		end
	end	
	strTitle = format(strTitle, 1, 1, 50, 100, 200, 400, 800, 1200, 1600, 2200, 2200, nNum, nCount - nNum, DZT_SPECIAL_AWARD_TB[nCount][2]);
	local tbSay = {};
	tbSay.msg = DZT_NPC..strTitle;
	tbSay.sel = {
		{"\n NhËn phÇn th­ëng","dzt_get_award_pttq"},
		{"\n rót lui","nothing"},
	};
	temp_Talk(tbSay);
end



