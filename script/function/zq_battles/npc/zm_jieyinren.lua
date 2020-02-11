--ÕæÄ§½ÓÒıÈË
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\function\\zq_battles\\zq_head.lua")
Include("\\script\\equip_shop\\equip_shop_head.lua")

ZMJYR_NpcName = "<color=green>Ch©n Ma tiÕp dÉn sø: <color>";

function main()
	local tSay = {
		format("\nTiÕn vµo Ma Hãa Thiªn M«n TrËn (tiªu hao: %d vµng)/join_zm_battle", ZQ_TICKET_CAST / 10000),
		"\nT×m hiÓu Ch©n Ma Thiªn M«n TrËn/know_battle_situation",
		"\nCöa hµng ®æi ma tinh/mojing_exchange_shop",
		"\n rót lui/nothing",
	};
	Say(ZMJYR_NpcName..format("Thiªn M«n TrËn ®· bŞ ma hãa, ®¹i quan Tèng Liªu ®Òu bŞ v©y bªn trong, cÇn sù t­¬ng trî cña %s. Ng­êi t­¬ng trî sÏ c¨n cø vµo trËn doanh mµ ®­îc chuyÓn ®Õn doanh Tèng hoÆc Liªu (trËn doanh khi tham gia chiÕn tr­êng) trong Ma Hãa Thiªn M«n TrËn, nÕu ch­a cã trËn doanh cÇn chän trËn doanh tr­íc khi vµo.", gf_GetPlayerSexName()), getn(tSay), tSay);
end

function join_zm_battle()
	local tSay = {};
	local nValue = ZQ_GetCamp();
	if nValue == ALL_ID then
		tinsert(tSay, "T­¬ng trî phe Liªu/join_liao_zm_battle");
		tinsert(tSay, "T­¬ng trî phe Tèng/join_song_zm_battle");
	elseif nValue == SONG_ID then
		tinsert(tSay, "T­¬ng trî phe Tèng/join_song_zm_battle");
	elseif nValue == LIAO_ID then
		tinsert(tSay, "T­¬ng trî phe Liªu/join_liao_zm_battle");
	end
	tinsert(tSay, "\n Ph¶n håi/main")
	tinsert(tSay, "Ra khi/nothing");
	Say(ZMJYR_NpcName.."C¸c h¹ muèn t­¬ng trî phe nµo, chän phe t¹i ®©y còng sÏ quyÕt ®Şnh phe trËn doanh sau nµy cña c¸c h¹. C¸c h¹ còng cã thÓ ®Õn quan b¸o danh chiÕn tr­êng ®Ó t×m hiÓu thªm vµ quyÕt ®Şnh chän trËn doanh nµo.", getn(tSay), tSay);
end

function know_battle_situation()
	local tSay = {}
	tinsert(tSay, "\n Ph¶n håi/main")
	tinsert(tSay, "Ra khi/nothing");
	Say(ZMJYR_NpcName.."KÓ tõ khi NhËm Ng· Hµnh ®ét nhËp vµo Th­îng Cæ Thiªn M«n TrËn, s¬ xuÊt tİ n÷a lµ bŞ Th«ng Linh L·o Tæ phï ma nhËp th©n, kÓ tõ ®ã Thiªn M«n TrËn trë nªn ma khİ ngËp trêi, v« sè binh sÜ bŞ ma hãa, ®Şch ta kh«ng ph©n, giÕt ng­êi ®iªn d¹i. Qu©n ®éi Tèng Liªu 2 bªn ®Òu bŞ v©y khèn bªn trong.", getn(tSay), tSay);
end

function join_song_zm_battle()
	local tJoinPos = {
		{1582, 3792},
	};
	join_zm_battle_deal(SONG_ID ,tJoinPos);
end

function join_liao_zm_battle()
	local tJoinPos = {
		{1905, 3288},
	};
	join_zm_battle_deal(LIAO_ID ,tJoinPos);
end

function join_zm_battle_deal(nCamp, tJoinPos)
	if nCamp ~= 1 and nCamp ~= 2 then
		return 0;
	end
	if not tJoinPos then
		return 0;
	end
	if GetCash() < ZQ_TICKET_CAST then
		Talk(1,"",format("Hµnh trang kh«ng ®ñ %d vµng, kh«ng thÓ vµo.", ZQ_TICKET_CAST/10000));
		return 0;
	end
	if MeridianGetLevel() < 1 then
		Talk(1,"","§· kİch ho¹t kinh m¹ch, ®¹t c¶nh giíi trªn Vâ Gi¶ míi cã thÓ vµo.");
		return 0;
	end
	if gf_Judge_Room_Weight(1, 1, " ") ~= 1 then
		return 0;
	end
	--½â³ıÇ£ÊÖ×´Ì¬
	CleanInteractive();
	local nRandIndex = random(getn(tJoinPos));
	if 1 == NewWorld(ZQ_MAP_ID, tJoinPos[nRandIndex][1], tJoinPos[nRandIndex][2]) then
		--¿ÛÇ®
		if Pay(ZQ_TICKET_CAST) ~= 1 then
			return 0;
		end
		if GetItemCount(ZQ_ITEM_FLAG[nCamp][1], ZQ_ITEM_FLAG[nCamp][2], ZQ_ITEM_FLAG[nCamp][3]) < 1 then
			AddItem(ZQ_ITEM_FLAG[nCamp][1], ZQ_ITEM_FLAG[nCamp][2], ZQ_ITEM_FLAG[nCamp][3], 1);
		end
		ZQ_SetCamp(nCamp);
		ZQ_SetPlayerState();
		Msg2Player("C¸c h¹ ®· vµo Ch©n Ma ThiÖn M«n TrËn");
	end	
end

function mojing_exchange_shop()
	local tSay = {
		"Cöa hµng Ma Tinh Giíi ChØ cÊp 3/#show_equip_shop(3027)",
		"Cöa hµng Ma Tinh Trang BŞ S­ M«n/mojing_shimen_shop",
		"Cöa hµng Ma Tinh T¹p Hãa/#show_equip_shop(3026)",
		"\n Ph¶n håi/main",
		"Ra khi/nothing",
	}
	Say(ZMJYR_NpcName.."Tham gia chiÕn tr­êng ch©n khİ, khiªu chiÕn cöa ¶i nhá cã tû lÖ nhÊt ®Şnh nhËn ®­îc Ma Tinh, tİch lòy l­îng ma tinh cã thÓ ®æi ®­îc ®¹o cô t­¬ng øng.",getn(tSay), tSay);
end


function mojing_shimen_shop()
	local tSay = {
		"Ma Tinh ®æi s­ m«n bé 4/#show_equip_shop(3)",
		"Ma Tinh ®æi s­ m«n bé 5/#show_equip_shop(6)",
		"\n Ph¶n håi/mojing_exchange_shop",
		"Ra khi/nothing",
	}
	Say(ZMJYR_NpcName.."Tham gia chiÕn tr­êng ch©n khİ, khiªu chiÕn cöa ¶i nhá cã tû lÖ nhÊt ®Şnh nhËn ®­îc Ma Tinh, tİch lòy l­îng ma tinh cã thÓ ®æi ®­îc ®¹o cô t­¬ng øng.",getn(tSay), tSay);
end