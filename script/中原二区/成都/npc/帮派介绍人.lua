Include("\\script\\online\\viet_event\\vng_task_control.lua");
Include("\\script\\vng\\config\\newserver.lua");
---------------------------------------------------------
--	°ï»á½éÉÜÈË
--	°ï»áµÄ½Ó¿ÚÈË - Jeep tag
---------------------------------------------------------

function main()
--	Talk(1,"","Ta ®ang trong giai ®o¹n nghØ ng¬i, ng­¬i h·y quay l¹i sau nhĞ.")
--	do	return	end
	
	local nDate = tonumber(date("%Y%m%d"))
	if tbGioiHanBangHoi[GetGlbValue(GLB_TSK_SERVER_ID)] ~= nil then
		if nDate < tbGioiHanBangHoi[GetGlbValue(GLB_TSK_SERVER_ID)] then
			Talk(1,"","Ch­a ®Õn thêi gian më tİnh n¨ng Bang Héi, ng­êi h·y quay l¹i sau nhĞ!!!");				
			do	return	end
		end
	end
	
	local bWantCreateTong = GetTask(297)
	local bWantDestoryTong = GetTask(295)
	
	local bIsTongMember = IsTongMember()	-- ÊÇ°ï»á³ÉÔ±µÄ»°£¬¾Í°Ñ½¨Á¢°ï»áµÄÌõ¼ş¸Éµô£¬²»ÈÃËû¸ãÁË£¡£¡£¡
	if (bIsTongMember == 1) then
		bWantCreateTong = 0;
		SetTask(297, 0)
	end
	
	-- <bWantDestoryTong == 1>±íÊ¾Íæ¼ÒÒÑ¾­µ½°ï»á½éÉÜÈË´¦ÉêÇë½âÉ¢°ï»á£¬À´ÕâÀïÉêÇë
	-- <bWantDestoryTong == 2>±íÊ¾Íæ¼ÒÒÑ¾­ÔÚÕâÀïÉêÇë¹ı½âÉ¢°ï»á£¬ÓÖÀ´É§ÈÅ½ğÉ½ÕÆÃÅÈËÁË
	-- <bWantDestoryTong == 3>±íÊ¾½ğÉ½ÕÆÃÅÈËÒÑ¾­´ğÓ¦ÁË½âÉ¢°ï»áµÄÉêÇë
	
	-- <bWantCreateTong == 1>±íÊ¾Íæ¼ÒÒÑ¾­µ½°ï»á½éÉÜÈË´¦ÉêÇë½¨Á¢°ï»á£¬À´ÕâÀïÉêÇë
	-- <bWantCreateTong == 2>±íÊ¾Íæ¼ÒÒÑ¾­»ñµÃÁË½ğÉ½ÕÆÃÅÈËµÄÈÏ¿É£¬µÃµ½ÁË(»áÃËÁîÅÆ)
	
-- ½âÉ¢°ï»áµÄ²¿·Ö·Ö¸îÏß -- ¿ªÊ¼ ------------------------------------------------------------------------------
	if ((bWantDestoryTong == 1) or (bWantDestoryTong == 2)) then	-- ÒÑ¾­ÉêÇëÁË½âÉ¢°ï»á£¬µ«ÊÇ»¹Ã»ÓĞµÃµ½½ğÉ½ÕÆÃÅÈËµÄ×îºóÈ·ÈÏ
		Say("Lêi thØnh cÇu gi¶i t¸n bang héi cña b»ng h÷u ®· ®­îc tiÕp nhËn! §îi Minh Chñ Kim S¬n ®ång ı, B»ng h÷u cã thÓ tiÕn hµnh gi¶i t¸n bang héi!", 0)
		return
	end
	
	if (bWantDestoryTong == 3) then		-- ½ğÉ½ÕÆÃÅÈËÒÑ¾­Í¬ÒâÁË½âÉ¢°ï»áÄØ
		SetTask(295, 0)
		SetTask(296, 0)
		SetTask(297, 0)
		Talk(1,"","Phông lÖnh Minh Chñ Kim S¬n, ®· chİnh thøc gi¶i t¸n bang héi cña b»ng h÷u!")
		DestroyTong()
		return
	end
	
-- ½âÉ¢°ï»áµÄ²¿·Ö·Ö¸îÏß -- ½áÊø ------------------------------------------------------------------------------

-- ½¨Á¢°ï»áµÄ²¿·Ö·Ö¸îÏß -- ¿ªÊ¼ ------------------------------------------------------------------------------	
	if (bWantCreateTong == 1) then		-- ÒÑ¾­ÉêÇëÁË½¨Á¢°ï»á£¬»¹Ã»ÓĞµÃµ½ÕÆÃÅÈËµÄ×îºóÍ¬Òâ
		Talk(1,"","Muèn x©y dùng bang héi ph¶i ®­îc Minh Chñ Kim S¬n ®ång ı. B»ng h÷u cÇn giao nép <color=yellow>Héi Minh lÖnh bµi<color> Minh Chñ Kim S¬n xem xĞt, ®­îc ch­ëng m«n chÊp nhËn míi cã thÓ chİnh thøc x©y dùng bang héi. H·y ®Õn T­¬ng D­¬ng t×m Minh Chñ Kim S¬n!")
		return
	end
	
	if (bWantCreateTong == 2) then		-- ÒÑ¾­¸ãµ½ÁË»áÃËÁîÅÆ
		Say("Ng­¬i thËt xuÊt s¾c! Minh Chñ Kim S¬n ®· ®ång ı cho ng­¬i x©y dùng bang héi!",
		    1,
		    "Xin ®a t¹! Mong gióp t¹i h¹ tiÕn hµnh x©y dùng bang héi!/create_tong_formally")
		return
	end
-- ½¨Á¢°ï»áµÄ²¿·Ö·Ö¸îÏß -- ½áÊø ------------------------------------------------------------------------------


	--ÏĞÁÄ
	Say("Ta phông lÖnh Vâ l©m minh chñ xö lı chuyÖn bang héi! B»ng h÷u cã chuyÖn g× kh«ng?",
	    6,
	    "X©y dùng bang héi yªu cÇu nh÷ng ®iÒu kiÖn g×?/introduce_about_create_tong",
	    "Cã ph¶i nh©n khİ bang héi cao cã thÓ nhËn ®­îc phÇn th­ëng ®Æc biÖt?/introduce_about_population",
	    "Ta muèn s¸ng lËp bang ph¸i, triÖu tËp anh hïng thiªn h¹!/apply_create_tong_normal",
	    "Ta muèn t¨ng cÊp, khuÕch tr­¬ng thÕ lùc bang héi ta!/apply_level_up_tong",
	    "Ta muèn gi¶i t¸n bang héi, lui vÒ chèn s¬n l©m!/apply_destroy_tong_normal",
	    "Kh«ng cã g×! ChØ tiÖn thÓ hái th¨m th«i!/chat_xxx")
end;



-- ÕæµÄ¿ÉÒÔ½¨Á¢°ï»áÁË£¬ÊÕÁËÇ®£¬ÓĞÁîÅÆ¾ÍÂíÉÏ°ïÄã°ìÊÖĞø
function create_tong_formally()
	local bCardIsExist = GetItemCount(2,0,125)  -- ÊÇ·ñÓĞ»áÃËÁîÅÆ
	if (bCardIsExist < 1) then
		Say("B»ng h÷u ph¶i chuÈn bŞ <color=yellow>Héi Minh lÖnh bµi<color> ®Ó x©y dùng bang héi!", 0)
		return
	end
        if GetItemCount(2, 0, 555) < 1 then
            Say("<color=green>Sø gi¶ bang héi<color>: LËp bang cÇn <color=yellow>Cµn Kh«n Phï<color>, ®¹i hiÖp nªn mang theo ®¹o cô nµy khi lËp bang nhĞ!", 0);
            return
        end

	local nMoney = GetCash()	--»ñµÃÉíÉÏµÄÇ®
	if (nMoney < 5000000) then	-- ¹»Ç®
		Talk(1,"","<color=green>Sø gi¶ bang héi<color>: LËp bang cßn cÇn 500 l­îng vµng, quyªn gãp cho vâ l©m minh chñ ®Ó gióp b¸ tİnh thiªn h¹. HiÖn t¹i ®¹i hiÖp vÉn ch­a ®ñ tiÒn ®Ó lËp bang!")
		return
	end
        if GetReputation() < 1000 then
            Say("<color=green>Sø gi¶ bang héi<color>: KiÕn lËp bang héi cÇn <color=yellow>1000 danh väng<color>, ®¹i hiÖp luyÖn thªm thêi gian n÷a råi h½ng lËp bang héi!", 0);
            return
        end
	
	CreateTongDialog()
end;

-- ½éÉÜ½¨Á¢°ï»áËùĞèÒªµÄÌõ¼ş
function introduce_about_create_tong()
	Talk(1,"","<color=green>Sø gi¶ bang héi<color>: §iÒu kiÖn lËp bang cÇn nh©n vËt <color=yellow>cÊp 50<color> trë lªn vµ ph¶i mang <color=yellow>500 vµng <color> víi <color=yellow>Minh Héi LÖnh Bµi<color> vµ<color=yellow>cµn kh«n phï<color>")
end;

-- ½éÉÜ°ï»áÈËÆøÅÅÃûµÄ×÷ÓÃ
function introduce_about_population()
	Talk(1,"","B»ng h÷u qu¶ nhiªn b¾t tin nhanh nh¹y. Mçi ngµy chóng ta ®Òu ph¸i c¸c truyÒn nh©n n¾m b¾t t×nh h×nh nh©n khİ cña mçi bang héi. NÕu sè huynh ®Ö trong bang cµng nhiÒu, vâ nghÖ cao c­êng hoÆc thêi gian g¾n bã trong bang dµi ®Òu cã cèng hiÕn lín cho nh©n khİ cña bang héi. C¸c h¹ng ®Çu trong b¶ng xÕp h¹ng nh©n khİ bang héi ®Òu nhËn ®­îc phÇn th­ëng ®Æc biÖt cña Minh Chñ Kim S¬n!")
end;

-- ÏëÒª³¢ÊÔ½¨Á¢°ï»á
function apply_create_tong_normal()
	local bIsTongMember = IsTongMember()
	if (bIsTongMember == 1) then
		Talk(1,"","B»ng h÷u ®· lµ ng­êi cña bang héi kh«ng thÓ khai s¸ng bang héi!")
		return
	end

	local nCurPlayerLevel = GetLevel()
	if (nCurPlayerLevel < 50) then
		Talk(1,"","B»ng h÷u ch­a ®Õn cÊp 50! Cè g¾ng khæ luyÖn thªm råi h·y ®Õn!")
	else
		SetTask(297, 1)
		Talk(1,"","Muèn x©y dùng bang héi ph¶i ®­îc Minh Chñ Kim S¬n ®ång ı. B»ng h÷u cÇn giao nép <color=yellow>Héi Minh lÖnh bµi<color> Minh Chñ Kim S¬n xem xĞt, ®­îc ch­ëng m«n chÊp nhËn míi cã thÓ chİnh thøc x©y dùng bang héi. H·y ®Õn T­¬ng D­¬ng t×m Minh Chñ Kim S¬n!")
	end
end;

-- ÉêÇë½âÉ¢°ï»á£¬Ö®ºó¾Í±»´ò·¢µ½½ğÉ½ÕÆÃÅÈËÄÇÀïÈ¥ÁË
function apply_destroy_tong_normal()
	local bIsTongMaster = IsTongMaster()
	if (bIsTongMaster == 0)	then	-- ²»ÊÇ°ïÖ÷
		Talk(1,"","B»ng h÷u kh«ng ph¶i bang chñ cña bang nµo, sao l¹i cã thÓ gi¶i t¸n bang héi chø!")
		return
	end
	
	SetTask(295, 1)
	Talk(1,"","Lêi thØnh cÇu gi¶i t¸n bang héi cña b»ng h÷u ®· ®­îc tiÕp nhËn! §îi Minh Chñ Kim S¬n ®ång ı, B»ng h÷u cã thÓ tiÕn hµnh gi¶i t¸n bang héi!")
end;

-- Õı×ÚÏĞÁÄ£¬²»ÓÃ»¨Ç®£¬°üÄãÂúÒâ
function chat_xxx()
	Talk(1,"","§a t¹ b»ng h÷u quan t©m! Nh­ng gÇn ®©y c«ng viÖc qu¸ nhiÒu, ®îi lóc r¶nh rçi sÏ trß chuyÖn víi b»ng h÷u!")
end;

-- ÉêÇëÉı¼¶°ï»áµÈ¼¶
function apply_level_up_tong()
	local bIsTongMaster = IsTongMaster()
	if (bIsTongMaster == 0)	then	-- ²»ÊÇ°ïÖ÷
		Talk(1,"","B»ng h÷u kh«ng ph¶i bang chñ! Muèn t¨ng cÊp bang héi, yªu cÇu bang chñ cña ng­¬i ®İch th©n ®Õn!")
		return
	end
	
	local nTongLevel = GetTongLevel()
	if (nTongLevel >= 5) then		-- °ï»áÏÖÔÚÖ»ÄÜÉı¼¶µ½ 5 ¼¶£¬ÒÔºóµÄÒªµÈ°ï»á½¨Éè¹¦ÄÜ³öÁËÔÙÏòÉÏÃæÉı¼¶
		Talk(1,"","TiÒn chØ cã thÓ t¨ng cÊp bang héi ®Õn cÊp 5. NÕu muèn tiÕp tôc t¨ng cÊp cÇn ph¶i kiÕn thiÕt bang héi míi cã thÓ tiÕp tôc t¨ng cÊp, nh­ng chøc n¨ng nµy t¹m thêi ch­a më. Xin c¸c bang chñ chê ®îi th«ng b¸o míi cña Minh Chñ Kim S¬n!")
		return
	end
	
	if (nTongLevel == 0) then		-- ÁÙÊ±°ï»á£¬Ö±½Ó´ò·¢×ß£¬TMD£¡£¡
		Talk(1,"","Bang héi t¹m thêi cña b»ng h÷u hiÖn ch­a ®ñ sè ng­êi, cÇn thu nhËn thªm! §îi ®Õn khi x©y dùng bang héi chİnh thøc h·y ®Õn t×m ta!")
		return
	end
	
	-- ÒÔÏÂ¿ªÊ¼ÊÇ1-4¼¶°ï»áµÄÉı¼¶¹¦ÄÜ£¬ÎÒÊÇÏëÒªÃ¿Ò»¼¶±ğ½²µÄ»°¶¼²»Í¬À²
	local strTalk = {
			"Bang héi hiÖn t¹i cña b»ng h÷u chØ lµ bang héi cÊp thÊp! CÇn t¨ng cÊp bang héi ®Ó ph¸t d­¬ng danh tiÕng trong giang hå, cã thÓ thu nhËn ®­îc nhiÒu huynh ®Ö. Bang héi khi t¨ng cÊp cã thÓ më réng quy m« nh­ng cÇn bá ra <color=yellow>170 tiÒn vµng<color>. B»ng h÷u b»ng lßng giao n¹p tiÒn t¨ng cÊp kh«ng?",
			"Bang héi cña ng­¬i trô trªn giang hå ®· l©u nh­ng cÇn t¨ng cÊp ®Õn <color=yellow>bang héi cÊp 3<color> vµ ®­îc triÒu ®×nh thõa nhËn ®Ó tiÖn triÖu tËp huynh ®Ö cña quı bang khi Quèc gia h÷u sù. CÇn nép <color=yellow>400 tiÒn vµng<color> ®¨ng kı víi triÒu ®×nh, bang chñ cã mang ®ñ tiÒn kh«ng?",
			"Buæi ®Çu x©y dùng bang héi, cÇn ph¶i v× thiªn h¹ b¸ t¸nh. N¹n d©n ë Giang T©n th«n tr«i d¹t kh¾p n¬i. Minh Chñ Kim S¬n ®ang dèc søc trî gióp hä, ®· ®Õn lóc chóng ta ph¶i gãp søc. §Ó t¨ng cÊp bang héi m×nh, h·y quyªn gãp chót tiÒn cøu ®é b¸ t¸nh. Theo quy m« cña bang héi, cÇn quyªn gãp <color=yellow>800 tiÒn vµng<color>!",
			"Bang héi cña ng­¬i tuy ph¸t triÓn nhanh chãng nh­ng cÇn th¨ng lªn <color=yellow>bang héi cÊp 5<color> nh­ng ng­¬i hiÖn ch­a ®ñ danh tiÕng giang hå. H·y triÖu tËp ®¹i héi vâ l©m liªn minh, mêi bang chñ cña c¸c bang héi lín vµ anh hïng hµo kiÖt cïng tham gia ®Ó n©ng cao danh tiÕng vµ ph¸t d­¬ng thÕ lùc cña bang héi nh­ng cÇn tiªu tèn ®Õn <color=yellow>1400 tiÒn vµng<color>. Ng­¬i thÊy thÕ nµo?",
			}
	
	Say(strTalk[nTongLevel], 
	    2,
	    "Hay l¾m! Huynh ®Ö nãi thËt cã lı! Ta sÏ giao tiÒn, chuyÖn cßn l¹i b»ng h÷u tù lo liÖu!/agree_add_tong_level",
	    "§©y kh«ng ph¶i sè tiÒn nhá. T¹i h¹ ph¶i vÒ bµn b¹c víi c¸c huynh ®Ö trong bang!/disagree_add_tong_level")
end;

function agree_add_tong_level()
	local nNeedMoney = {1700000, 4000000, 8000000, 14000000}
		
	local nCurTongLevel = GetTongLevel()
	local nCurHaveMoney = GetCash()
	
	if (nCurHaveMoney < nNeedMoney[nCurTongLevel]) then		-- Ç®²»¹»£¬¸ñÀÏ×ÓµÄÆ­ÈË£¡£¡
		Say("HiÖn ng­¬i kh«ng cã ®ñ tiÒn. Cã tiÒn ®ñ råi ta bµn tiÕp!", 0)
		return
	end
	
	Pay(nNeedMoney[nCurTongLevel])
	AddTongLevel()
	Talk(1,"","Chóc mõng bang héi cña b»ng h÷u ®­îc t¨ng cÊp! B»ng h÷u h·y quay vÒ chÊn h­ng bang héi, nhÊt ®Şnh thµnh tùu sÏ v­ît tréi trªn chèn giang hå!")
end;

function disagree_add_tong_level()
	Talk(1,"","Hay l¾m! B»ng h÷u qu¶ nhiªn cã t­ chÊt bang chñ! QuyÕt ®Şnh xong cã thÓ quay l¹i t×m ta!")
end;

