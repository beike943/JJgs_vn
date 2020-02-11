--08°ÂÔË»î¶¯²ÂÊı×Önpc
--´´½¨ÈÕÆÚ£º08-07-16
--´´½¨ÈË£º³ÂÄ«ÏÉ^_^
Include("\\script\\online\\qixi08\\guess\\function.lua");

guess_tb_num = {}

function aoyun_guess_main()
	local szTemp,nTemp;
	szTemp = "0";
	nTemp = -1;
	szTemp,nTemp = QX08_GetTodayGame();
	if nTemp ~= GAME_ID_GUESS then
			Talk(1,"",g_szInfoHead.."H«m nay <color=yellow>"..szTemp.."<color>ho¹t ®éng b¾t ®Çu, thËt thó vŞ.");
			return
	end;
	
	if GetTask(TSK_AOYUN_GUESS_DATE) < tonumber(date("%Y%m%d")) then
		SetTask(TSK_AOYUN_GUESS_TURN,0);
		SetTask(TSK_AOYUN_GUESS_BEST,0);
		SetTask(TSK_AOYUN_GUESS_TIMES,0);
		SetTask(TSK_AOYUN_GUESS_BCOMPLETED,0);
		SetTask(TSK_AOYUN_GUESS_BPRIZED,0);
		SetTask(TSK_AOYUN_GUESS_DATE,tonumber(date("%Y%m%d")));
	elseif 	GetTask(TSK_AOYUN_GUESS_DATE) > tonumber(date("%Y%m%d")) then
			--¡­¡­ÕâÀï²»ÓÃĞ´£¬Ò²²»Çå¿Õ£¬·ÀÖ¹·şÎñÆ÷Ê±¼ä²»Í¬ÒıÆğµÄÎÊÌâ¡£
	end
	local selTab = {
		"Ta muèn b¾t ®Çy trËn ®Êu/guess_start",
		"quy t¾c Thiªn C¬ ThÇn To¸n/guess_rule",
		"Ta ®Õn nhËn phÇn th­ëng HØ Rén Rµng - Vui NgËp Trµn/guess_prize",
		"SÏ quay l¹i sau/nothing"
	}
	Say(g_szInfoHead.."Hoan nghªnh tham gia ho¹t ®éng Thiªn C¬ ThÇn To¸n!",getn(selTab),selTab)
end

--½áÊø¶Ô»°
function nothing()
end

--È·ÈÏ²ÂÊı×ÖÓÎÏ·ÊÇ·ñ¿ªÊ¼
function guess_start()
	local nHour = tonumber(date("%H"));
	if nHour < 9 or nHour >= 23 then
		Talk(1,"",g_szInfoHead.."Thêi gian ho¹t ®éng lµ <color=yellow>9h s¸ng ®Õn 11h ®ªm<color>, ng­¬i nhí kü nhĞ.");
		return 0;
	end;
	if GetLevel() <= 30 then
		Talk(1,"aoyun_guess_main",g_szInfoHead.."Xin lçi, ®¼ng cÊp cña ng­¬i qu¸ thÊp, rÌn luyÖn thªm råi h½n ®Õn.");
	
	else
--		--ÃÅÆ±
--		if GetItemCount(2,0,1069) > 0 then
--			if DelItem(2,0,1069,1) ~= 1 then
--				WriteLog("°ÂÔË»î¶¯£º"..GetName().."É¾³ıÌìÏÂµÚÒ»±ÈÎä´ó»áÑûÇëº¯Ê§°Ü£¡");
--				Talk(1,"aoyun_guess_main",g_szInfoHead.."ÇëÈ·ÈÏÄãÉíÉÏ´øÓĞ×ã¹»µÄÌìÏÂµÚÒ»±ÈÎä´ó»áÑûÇëº¯£¡");
--				return
--			end;
--		else
--			Talk(1,"aoyun_guess_main",g_szInfoHead.."ÇëÈ·ÈÏÄãÉíÉÏ´øÓĞ×ã¹»µÄÌìÏÂµÚÒ»±ÈÎä´ó»áÑûÇëº¯£¡");
--			return
--		end;
		--Èç¹û¸ôÁËÒ»Ìì£¬ÇåÁã
		if GetTask(TSK_AOYUN_GUESS_DATE) < tonumber(date("%Y%m%d")) then
			SetTask(TSK_AOYUN_GUESS_TURN,0);
			SetTask(TSK_AOYUN_GUESS_BEST,0);
			SetTask(TSK_AOYUN_GUESS_TIMES,0);
			SetTask(TSK_AOYUN_GUESS_BCOMPLETED,0);
			SetTask(TSK_AOYUN_GUESS_BPRIZED,0);
			SetTask(TSK_AOYUN_GUESS_DATE,tonumber(date("%Y%m%d")));
		elseif 	GetTask(TSK_AOYUN_GUESS_DATE) > tonumber(date("%Y%m%d")) then
			--¡­¡­
		end
		--³õÊ¼»¯ÈÎÎñ±äÁ¿
		SetTask(TSK_AOYUN_GUESS_TURN,1)
		--ÉèÖÃËæ»úÊı
		guess_tb_num[GetName()] = random(0,100);
		local selTab = {
			"B¾t ®Çu ®o¸n/guess_comfirm",
			--"È¡Ïû/main"
		}

		Say(g_szInfoHead.."§­îc råi, mäi thø ®· chuÈn bŞ s½n sµng, b¾t ®Çu ®Õm th«i.",getn(selTab),selTab);
	end
end

--È·ÈÏÍæ¼Ò²ÂµÄÊı×Ö
function guess_comfirm()
	AskClientForNumber("guess_num_confirm",0,100,"H·y nhËp sè vµo");
end

function guess_num_confirm(nCount)
	--Ôö¼ÓÂÖ´Î
	local nTempTurn = 0;
	SetTask(TSK_AOYUN_GUESS_TURN,GetTask(TSK_AOYUN_GUESS_TURN) + 1);
	nTempTurn = GetTask(TSK_AOYUN_GUESS_TURN);
	if nTempTurn > 6 or (nTempTurn == 6 and nCount ~= guess_tb_num[GetName()]) then
		--³¬¹ı5´ÎÁË
		SetTask(TSK_AOYUN_GUESS_TIMES,0);--Á¬Ğø²ÂÖĞÊıÇåÁã
		Talk(1,"aoyun_guess_main",g_szInfoHead.."Xin lçi, b¹n ®· ®o¸n sai 5 lÇn. §¸p ¸n chİnh x¸c lµ "..guess_tb_num[GetName()]);
		return
	end
	if nCount == guess_tb_num[GetName()] and nTempTurn <= 6 then
		--²Â¶ÔÁË
		if GetTask(TSK_AOYUN_GUESS_BEST) > nTempTurn - 1 or GetTask(TSK_AOYUN_GUESS_BEST) == 0 then
			--Ë¢ĞÂ×îºÃ³É¼¨
			SetTask(TSK_AOYUN_GUESS_BEST,nTempTurn - 1);
		end
		SetTask(TSK_AOYUN_GUESS_TIMES,GetTask(TSK_AOYUN_GUESS_TIMES) + 1)
		if GetTask(TSK_AOYUN_GUESS_TIMES) >= 10 and GetTask(TSK_AOYUN_GUESS_TIMES) > GetTask(TSK_AOYUN_GUESS_BCOMPLETED) then
			--Á¬Ğø²ÂÖĞ10´ÎÒÔÉÏ
			SetTask(TSK_AOYUN_GUESS_BCOMPLETED,GetTask(TSK_AOYUN_GUESS_TIMES));--¼ÇÂ¼Ôø¾­Á¬Ğø²ÂÖĞÊ®´ÎÒÔÉÏ
		end
		local szTemp;
		szTemp = "§óng råi!";
		if nTempTurn <= 3 then
			szTemp = "C¸c h¹ thiªn t­ bÊt phµm, sau nµy ¾t sÏ nªn nghiÖp lín!";
		elseif nTempTurn <= 4 then
			szTemp = "Kh¸ khen kh¸ khen, ®¹i hiÖp qu¶ lµ v¨n vâ song toµn!";
		else
			szTemp = "Chóc mõng b¹n, ®· ®o¸n ®óng!";
		end
		Say(g_szInfoHead..szTemp.."§¸p ¸n chİnh x¸c lµ "..guess_tb_num[GetName()].."!",1,"trë l¹i/aoyun_guess_main");
		
	else
	--Íæ¼Ò²ÂµÄÊı×Ö±ÈÏµÍ³Ö¸¶¨Êı×Ö´ó50ÒÔÉÏ	´óÌ«¶àÁË£¬¼ÌĞøÅ¬Á¦£¡	
	--Íæ¼Ò²ÂµÄÊı×Ö±ÈÏµÍ³Ö¸¶¨Êı×Ö´ó30£­50	ÓĞµãÌ«´óÁËÅ¶£¬¼ÓÓÍ£¡	
	--Íæ¼Ò²ÂµÄÊı×Ö±ÈÏµÍ³Ö¸¶¨Êı×Ö´ó10£­30	ÓĞµã½Ó½üÁË£¬²»¹ı»¹ÊÇ´óÁËµã¡£	
	--Íæ¼Ò²ÂµÄÊı×Ö±ÈÏµÍ³Ö¸¶¨Êı×Ö´ó10ÒÔÏÂ	ºÃ½ôÕÅ°¡£¬´óÁËÒ»µãµã£¬¿ìÒªÖĞÁË£¡	
	--Íæ¼Ò²ÂµÄÊı×Ö±ÈÏµÍ³Ö¸¶¨Êı×ÖĞ¡50ÒÔÉÏ	Ğ¡Ì«¶àÁË£¬ÔõÃ´¿ÉÄÜ¾ÍÄÇÃ´Ğ¡£¿	
	--Íæ¼Ò²ÂµÄÊı×Ö±ÈÏµÍ³Ö¸¶¨Êı×ÖĞ¡30£­50	ÓĞµãÌ«Ğ¡ÁËÅ¶£¬¼ÓÓÍ£¡	
	--Íæ¼Ò²ÂµÄÊı×Ö±ÈÏµÍ³Ö¸¶¨Êı×ÖĞ¡10£­30	ÓĞµã½Ó½üÁË£¬²»¹ı»¹ÊÇĞ¡ÁËµã¡£	
	--Íæ¼Ò²ÂµÄÊı×Ö±ÈÏµÍ³Ö¸¶¨Êı×ÖĞ¡10ÒÔÏÂ	ºÃ½ôÕÅ°¡,Ğ¡ÁËÒ»µãµã£¬¿ìÒªÖĞÁË£¡
		local szTemp2;
		szTemp2 = "Sai";
		if nCount - guess_tb_num[GetName()] > 50 then
			szTemp2 = "Ch­a chİnh x¸c, cè g¾ng lªn!";
		elseif nCount - guess_tb_num[GetName()] > 30 then
			szTemp2 = "Ch­a chİnh x¸c, cè g¾ng lªn!";
		elseif nCount - guess_tb_num[GetName()] > 10 then
			szTemp2 = "§o¸n s¾p ®óng råi, lín mét chót n÷a.";
		elseif nCount - guess_tb_num[GetName()] > 0 then
			szTemp2 = "C¨ng th¼ng qu¸, lín mét chót, s¾p tróng råi!";
		elseif nCount - guess_tb_num[GetName()] < -50 then
			szTemp2 = "Nhá qu¸, sao l¹i nhá nh­ thÕ ®­îc?";
		elseif nCount - guess_tb_num[GetName()] < -30 then
			szTemp2 = "Qu¸ nhá råi, cè lªn!"
		elseif nCount - guess_tb_num[GetName()] < -10 then
			szTemp2 = "§o¸n s¾p ®óng råi, nhá mét chót n÷a.";
		elseif nCount - guess_tb_num[GetName()] < 0 then
			szTemp2 = "C¨ng th¼ng qu¸, nhá 1 chót, s¾p tróng råi!";
		end
		Talk(1,"guess_comfirm",g_szInfoHead..szTemp2.."B©y giê b¾t ®Çu ®o¸n lÇn thø "..nTempTurn.." lÇn.");
	end
end

--ÓÎÏ·¹æÔò
function guess_rule()
	if IB_VERSION == 0 then--ÊÕ·ÑÇø
		Talk(2,"guess_rule_2",g_szInfoHead.."Sau khi trËn ®Êu b¾t ®Çu, hÖ thèng sÏ chän mét sè nguyªn ngÉu nhiªn tõ 0-100, b¹n h·y nhËp sè tõ 0-100 ®Ó ®o¸n, khi sè ®o¸n qu¸ lín hoÆc qu¸ nhá th× hÖ thèng sÏ th«ng b¸o. Mçi ng­êi cã thÓ ®o¸n nhiÒu nhÊt lµ 5 lÇn. (Mçi ngµy mçi ng­êi chØ cã 1 lÇn nhËn th­ëng, gi¶i th­ëng sÏ c¨n cø vµo thµnh tİch tèt nhÊt cña b¹n h«m nay)\n ",g_szInfoHead.."Khi nhËn phÇn th­ëng sÏ c¨n cø vµo thµnh tİch tèt nhÊt cña b¹n.\n ");
	else--Ãâ·ÑÇø
		Talk(2,"guess_rule_2",g_szInfoHead.."Sau khi trËn ®Êu b¾t ®Çu, hÖ thèng sÏ chän mét sè nguyªn ngÉu nhiªn tõ 0-100, b¹n h·y nhËp sè tõ 0-100 ®Ó ®o¸n, khi sè ®o¸n qu¸ lín hoÆc qu¸ nhá th× hÖ thèng sÏ th«ng b¸o. Mçi ng­êi cã thÓ ®o¸n nhiÒu nhÊt lµ 5 lÇn. (Mçi ngµy mçi ng­êi chØ cã 1 lÇn nhËn th­ëng, gi¶i th­ëng sÏ c¨n cø vµo thµnh tİch tèt nhÊt cña b¹n h«m nay)\n ",g_szInfoHead.."Khi nhËn phÇn th­ëng sÏ c¨n cø vµo thµnh tİch tèt nhÊt cña b¹n.\n  NÕu chän ®óng trong mét lÇn, sÏ nhËn ®­îc b×nh ph­¬ng ®¼ng cÊp/b×nh ph­¬ng 80*500 v¹n kinh nghiÖm.  Ng­êi cÊp 99 tÆng 6 Tói b¶o th¹ch. §­îc 5 ®iÓm tİch lòy.\n  NÕu ®o¸n ®óng trong hai lÇn, sÏ nhËn ®­îc b×nh ph­¬ng ®¼ng cÊp/b×nh ph­¬ng 80*420 v¹n kinh nghiÖm. Ng­êi ch¬i cÊp 99 tÆng 5 Tói b¶o th¹ch. §­îc 4 ®iÓm tİch lòy.\n NÕu ®o¸n ®óng trong 3 lÇn, sÏ nhËn ®­îc b×nh ph­¬ng ®¼ng cÊp/b×nh ph­¬ng 80*380 v¹n kinh nghiÖm. Ng­êi ch¬i cÊp 99 tÆng 4 Tói b¶o th¹ch. §­îc 3 ®iÓm tİch lòy.");
	end;
end

function guess_rule_2()
	if IB_VERSION == 0 then--ÊÕ·ÑÇø
		Talk(1,"aoyun_guess_main",g_szInfoHead.."	NÕu ®o¸n ®óng trong 4 lÇn, sÏ nhËn ®­îc b×nh ph­¬ng ®¼ng cÊp/b×nh ph­¬ng 80*100 v¹n kinh nghiÖm, cã thÓ chuyÓn b×nh ph­¬ng ®¼ng cÊp/b×nh ph­¬ng 80*300 v¹n søc kháe. CÊp 99 tÆng 3 Tói b¶o th¹ch. §­îc 2 ®iÓm tİch lòy.\n NÕu ®o¸n ®óng trong 5 lÇn, sÏ nhËn ®­îc b×nh ph­¬ng ®¼ng cÊp/b×nh ph­¬ng 80*100 v¹n kinh nghiÖm, cã thÓ chuyÓn b×nh ph­¬ng ®¼ng cÊp/b×nh ph­¬ng 80*250 v¹n søc kháe. Ng­íi ch¬i cÊp 99 tÆng 2 Tói b¶o th¹ch. §­îc 1 ®iÓm tİch lòy.\n ");
	else
		Talk(1,"aoyun_guess_main",g_szInfoHead.."	NÕu ®o¸n ®óng trong 4 lÇn, sÏ nhËn ®­îc b×nh ph­¬ng ®¼ng cÊp/b×nh ph­¬ng 80*350 v¹n kinh nghiÖm. Ng­êi ch¬i cÊp 99 tÆng 3 Tói b¶o th¹ch. §­îc 2 ®iÓm tİch lòy\n NÕu ®o¸n ®óng trong 5 lÇn, sÏ nhËn ®­îc b×nh ph­¬ng ®¼ng cÊp/b×nh ph­¬ng 80*300 v¹n kinh nghiÖm. Ng­êi ch¬i cÊp 99 tÆng 2 Tói b¶o th¹ch. §­îc 1 ®iÓm tİch lòy.\n ");
	end;
end;

--ÓÎÏ·½±Àø
function guess_prize()
	if GetTask(TSK_AOYUN_GUESS_BPRIZED) == 1 then
		Talk(1,"aoyun_guess_main",g_szInfoHead.."Xin lçi, h«m nay ng­¬i ®· nhËn phÇn th­ëng råi!");
		return
	end;
	guess_prize_real();
end;

function guess_prize_real()
	if GetTask(TSK_AOYUN_GUESS_BCOMPLETED) >= 10 or (GetTask(TSK_AOYUN_GUESS_BEST) > 0 and GetTask(TSK_AOYUN_GUESS_BEST) <= 5) then
		QX08_GetAward(1,GetTask(TSK_AOYUN_GUESS_BEST),TSK_AOYUN_GUESS_BPRIZED);--µ÷ÓÃÍ·ÎÄ¼şµÄº¯Êı
		return
	else
		Talk(1,"aoyun_guess_main",g_szInfoHead.."Ng­¬i kh«ng ®o¸n ®óng ®­îc lÇn nµo, cßn muèn nhËn phÇn th­ëng g× chø? Thö l¹i lÇn n÷a ®i!");
		return
	end;
end;