Include("\\script\\online\\qixi08\\light\\light_head.lua");

--µãµÆ¶Ô»°Ö÷Èë¿Ú
function aoyun_light_main()
	local szGameName,nGameID = QX08_GetTodayGame();
	if nGameID ~= GAME_ID_LIGHT then
		Talk(1,"","<color=green>§Æc sø §¹i Héi Vâ l©m<color>: H«m nay <color=yellow>"..szGameName.."<color>ho¹t ®éng b¾t ®Çu, thËt thó vŞ.");
		return
	end;
	local strtab = {
		"Héi th¾p ®Ìn, kh«ng cã g× khã kh¨n c¶, h·y thö xem./aoyun_light_try",
		"Quy t¾c Héi th¾p ®Ìn/aoyun_light_rule",
		"Ta ®Õn nhËn phÇn th­ëng HØ Rén Rµng - Vui NgËp Trµn/aoyun_light_award",
		"§Ó ta chuÈn bŞ/nothing"
	};
	Say("<color=green>§Æc sø §¹i Héi Vâ l©m<color>: Nãi giang hå, giang hå ë trong tim. §Ó chóc mõng §¹i héi tû vâ Thiªn h¹ ®Ö nhÊt, chóng t«i ®Æc biÖt cö hµnh Héi th¾p ®Ìn tû vâ Vâ L©m 2 lÇn thø nhÊt, hoan nghªnh mäi ng­êi tham gia, cµng ®«ng cµng vui. Ta ®· chuÈn bŞ cho mäi ng­êi vµi mãn quµ, ®o¸n tróng cø lÊy. Thêi gian ho¹t ®éng: <color=yellow>mçi chñ nhËt<color> më ho¹t ®éng nµy.",
		getn(strtab),
		strtab)
end

function aoyun_light_try()
	local nHour = tonumber(date("%H"));
	if nHour < 9 or nHour >= 23 then
		Talk(1,"","<color=green>§Æc sø §¹i Héi Vâ l©m<color>: Thêi gian ho¹t ®éng lµ <color=yellow>9h s¸ng-11h tèi<color>, vŞ thiÕu hiÖp nµy muèn xem giê chİnh x¸c µ.");
		return 0;
	end;
	local nDate = tonumber(date("%Y%m%d"));
	local nTeamSize = GetTeamSize();

	if nTeamSize ~= 0 and GetName() ~= GetCaptainName() then
		Talk(1,"","<color=green>§Æc sø §¹i Héi Vâ l©m<color>: Tham gia Héi th¾p ®Ìn cÇn ®éi tr­ëng khëi ®éng.");
		return
	end
	--±äÁ¿Çå0
	if nTeamSize == 0 or nTeamSize == 1 then 
		if GetTask(TSK_AOYUN_LIGHT_DATE) < nDate then
			SetTask(TSK_AOYUN_LIGHT_AWARD,0);
			SetTask(TSK_AOYUN_LIGHT_NUM,0);
			SetTask(TSK_AOYUN_LIGHT_GUAN,0);
			SetTask(TSK_AOYUN_LIGHT_DATE,nDate);
		end
	else
		local nOldPlayerIndex = PlayerIndex;
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i);
			if GetTask(TSK_AOYUN_LIGHT_DATE) < nDate then
				SetTask(TSK_AOYUN_LIGHT_AWARD,0);
				SetTask(TSK_AOYUN_LIGHT_NUM,0);
				SetTask(TSK_AOYUN_LIGHT_GUAN,0);
				SetTask(TSK_AOYUN_LIGHT_DATE,nDate);
			end			
		end
		PlayerIndex = nOldPlayerIndex;
	end
	if nTeamSize == 0 or nTeamSize == 1 then
		local nLv = GetLevel();
		if nLv <= 30 then
			Talk(1,"","<color=green>§Æc sø §¹i Héi Vâ l©m<color>: Tham gia Héi th¾p ®Ìn cÇn trªn cÊp 30.");
			return
		end	
--		if GetItemCount(2,0,1069) < 1 then
--			Talk(1,"","<color=green>ÎäÁÖ´ó»áÌØÊ¹<color>£º²Î¼ÓµãµÆ»áĞèÒª<color=yellow>ÌìÏÂµÚÒ»±ÈÎäÑûÇëº¯<color>¡£");
--			return
--		end
	else
		local nOldPlayerIndex = PlayerIndex;
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i);
			local nLv = GetLevel(); 
			if nLv	<= 30 then
				PlayerIndex = nOldPlayerIndex;
				Talk(1,"","<color=green>§Æc sø §¹i Héi Vâ l©m<color>: Tham gai Héi th¾p ®Ìn cÇn tÊt c¶ ®éi viªn trªn cÊp 30. §éi ngò cña b¹n ®iÒu kiÖn kh«ng phï hîp.");
				return
			end			
--			if GetItemCount(2,0,1069) < 1 then
--				local nName = GetName();
--				PlayerIndex = nOldPlayerIndex;
--				Talk(1,"","<color=green>ÎäÁÖ´ó»áÌØÊ¹<color>£ºÄãµÄ¶ÓÎéÖĞ "..nName.." Ã»ÓĞ<color=yellow>ÌìÏÂµÚÒ»±ÈÎäÑûÇëº¯<color>¡£");
--				return
--			end
		end
		PlayerIndex = nOldPlayerIndex;
	end
	if nTeamSize == 0 or nTeamSize == 1 then
		Say("<color=green>§Æc sø §¹i Héi Vâ l©m<color>: Mét ng­êi sÏ c« ®¬n ®Êy, sao kh«ng rñ thªm b¹n cïng ch¬i?",
			2,
			"Gäi thªm b¹n/nothing",
			"§¬n ®éc khiªu chiÕn/aoyun_light_go");
	else
		aoyun_light_go();
	end
end

function aoyun_light_go()
	--É¾³ıÃÅÆ±
--	local nTeamSize = GetTeamSize();
--	if nTeamSize == 0 or nTeamSize == 1 then	
--		if DelItem(2,0,1069,1) == 1 then
--			aoyun_light_OpenMatch();
--		end
--	else
--		local nOldPlayerIndex = PlayerIndex;
--		for i=1,nTeamSize do
--			PlayerIndex = GetTeamMember(i);
--			DelItem(2,0,1069,1);
--		end
--		PlayerIndex = nOldPlayerIndex;
--		aoyun_light_OpenMatch();
--	end
		aoyun_light_OpenMatch();
end

function aoyun_light_rule()
	Talk(1,"aoyun_light_rule2","<color=green>§Æc sø §¹i Héi Vâ l©m<color>: Héi th¾p ®Ìn ph©n 5 ¶i, ph¶i th¾p theo thø tù ®­îc th¾p qua. Më vµo mçi chñ nhËt.\n¶i 1: Tæng céng 8 ngän, hÖ thèng sÏ th¾p 1 l­ît theo thø tù ngÉu nhiªn, ghi nhí vµ th¾p theo thø tù ®ã.\n¶i 2: Tæng céng 8 ngän, hÖ thèng sÏ theo thø tù ngÉu nhiªn th¾p 8 lÇn ®Ìn, ghi nhí vµ th¾p theo thø tù ®ã.\n¶i 3: Tæng céng 12 ngän, hÖ thèng sÏ th¾p 1 l­ît theo thø tù ngÉu nhiªn, ghi nhí vµ th¾p theo thø tù ®ã.")
end

function aoyun_light_rule2()
	Talk(1,"aoyun_light_rule3","<color=green>§Æc sø §¹i Héi Vâ l©m<color>: \n¶i 4: Tæng céng 12 ngän, hÖ thèng sÏ theo thø tù ngÉu nhiªn th¾p 12 lÇn ®Ìn, ghi nhí vµ th¾p theo thø tù ®ã.\n¶i 5: Tæng céng 16 ngän, hÖ thèng sÏ th¾p 1 l­ît theo thø tù ngÉu nhiªn, ghi nhí vµ th¾p theo thø tù ®ã.")
end

function aoyun_light_rule3()
	if IB_VERSION == 0 then
		Talk(1,"aoyun_light_rule4","<color=green>§Æc sø §¹i Héi Vâ l©m<color>: PhÇn th­ëng nh­ sau:\n    Ng­êi v­ît qua 5 ¶i cã thÓ nhËn b×nh ph­¬ng ®¼ng cÊp/b×nh ph­¬ng 80*200w kinh nghiÖm, cßn cã thÓ chuyÓn b×nh ph­¬ng ®¼ng cÊp/b×nh ph­¬ng 80*400w søc kháe. Ng­êi ch¬i cÊp 99 tÆng 6 Tói b¶o th¹ch.\n    Ng­êi v­ît qua 4 ¶i cã thÓ nhËn b×nh ph­¬ng ®¼ng cÊp/b×nh ph­¬ng 80*100w kinh nghiÖm, cßn cã thÓ chuyÓn b×nh ph­¬ng ®¼ng cÊp/b×nh ph­¬ng 80*400w søc kháe. Ng­êi ch¬i cÊp 99 tÆng 5 Tói b¶o th¹ch.\n    Ng­êi v­ît qua 3 ¶i cã thÓ nhËn b×nh ph­¬ng ®¼ng cÊp/b×nh ph­¬ng 80*100w kinh nghiÖm, cßn cã thÓ chuyÓn b×nh ph­¬ng ®¼ng cÊp/b×nh ph­¬ng 80*350w søc kháe. Ng­êi ch¬i cÊp 99 tÆng 4 Tói b¶o th¹ch.")
	else
		Talk(1,"aoyun_light_rule5","<color=green>§Æc sø §¹i Héi Vâ l©m<color>: PhÇn th­ëng nh­ sau:\n    Ng­êi v­ît qua 5 ¶i cã thÓ nhËn b×nh ph­¬ng ®¼ng cÊp/b×nh ph­¬ng 80*500w kinh nghiÖm, ng­êi ch¬i cÊp 99 tÆng 6 Tói b¶o th¹ch.\n    Ng­êi v­ît qua 4 ¶i cã thÓ nhËn b×nh ph­¬ng ®¼ng cÊp/b×nh ph­¬ng 80*420w kinh nghiÖm, ng­êi ch¬i cÊp 99 tÆng 5 Tói b¶o th¹ch.\n    Ng­êi v­ît qua 3 ¶i cã thÓ nhËn b×nh ph­¬ng ®¼ng cÊp/b×nh ph­¬ng 80*380w kinh nghiÖm, ng­êi ch¬i cÊp 99 tÆng 4 Tói b¶o th¹ch.\n    Ng­êi v­ît qua 2 ¶i cã thÓ nhËn b×nh ph­¬ng ®¼ng cÊp/b×nh ph­¬ng 80*350w kinh nghiÖm, ng­êi ch¬i cÊp 99 tÆng 3 Tói b¶o th¹ch.\n    Ng­êi v­ît qua 1 ¶i cã thÓ nhËn b×nh ph­¬ng ®¼ng cÊp/b×nh ph­¬ng 80*300w kinh nghiÖm, ng­êi ch¬i cÊp 99 tÆng 2 Tói b¶o th¹ch.")	
	end
end

function aoyun_light_rule4()
	Talk(1,"aoyun_light_rule5","<color=green>§Æc sø §¹i Héi Vâ l©m<color>: \n    Ng­êi v­ît qua 2 ¶i cã thÓ nhËn b×nh ph­¬ng ®¼ng cÊp/b×nh ph­¬ng 80*100w kinh nghiÖm, cßn cã thÓ chuyÓn b×nh ph­¬ng ®¼ng cÊp/b×nh ph­¬ng 80*300w søc kháe. Ng­êi ch¬i cÊp 99 tÆng 3 Tói b¶o th¹ch.\n    Ng­êi v­ît qua 1 ¶i cã thÓ nhËn b×nh ph­¬ng ®¼ng cÊp/b×nh ph­¬ng 80*100w kinh nghiÖm, cßn cã thÓ chuyÓn b×nh ph­¬ng ®¼ng cÊp/b×nh ph­¬ng 80*250w søc kháe. Ng­êi ch¬i cÊp 99 tÆng 2 Tói b¶o th¹ch.")
end

function aoyun_light_rule5()
	Talk(1,"aoyun_light_main","<color=green>§Æc sø §¹i Héi Vâ l©m<color>: NÕu v­ît 5 ¶i 10 lÇn liªn tôc, khi nhËn phÇn th­ëng cã thÓ nhËn danh hiÖu ®Æc biÖt--'Vua ®o¸n ®Ìn'! <color=red>Chó ı: PhÇn th­ëng tham gia ho¹t ®éng h«m ®ã ph¶i nhËn trong ngµy.<color>\n")
end

function aoyun_light_award()
	local nDate = tonumber(date("%Y%m%d"));
	if GetTask(TSK_AOYUN_LIGHT_DATE) < nDate then
		SetTask(TSK_AOYUN_LIGHT_AWARD,0);
		SetTask(TSK_AOYUN_LIGHT_NUM,0);
		SetTask(TSK_AOYUN_LIGHT_GUAN,0);
		SetTask(TSK_AOYUN_LIGHT_DATE,nDate);
	end	
	if GetTask(TSK_AOYUN_LIGHT_AWARD) ~= 0  then
		Talk(1,"","<color=green>§Æc sø §¹i Héi Vâ l©m<color>: B¹n ®· nhËn phÇn th­ëng tuÇn nµy.");
	else
		local nGuan = GetTask(TSK_AOYUN_LIGHT_GUAN);
		local nNum = GetTask(TSK_AOYUN_LIGHT_NUM);
		if nGuan == 0 then
			Talk(1,"","<color=green>§Æc sø §¹i Héi Vâ l©m<color>: ¶i 1 ch­a qua, ch¶ tr¸ch kh«ng tr¶ lêi ®­îc, h·y thö l¹i, qua ¶i råi h·y ®Õn nhËn phÇn th­ëng.");
		else
			QX08_GetAward(3,6-nGuan,TSK_AOYUN_LIGHT_AWARD);
		end
	end
end