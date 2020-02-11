Include("\\script\\½á»é\\marriage_head.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua");
Include("\\script\\vng\\config\\newserver.lua");

ITEM_SATIN 			= {2, 1, 15}		-- ÐÐ¶Ð
COUNT_SATIN 		= 10				-- ÐÐ¶ÐÊýÄ¿
COUNT_MEIJIN		= 100				-- ½ð±Ò½ðÊýÁ¿

CALLBACK_FILE		= "\\script\\½á»é\\npc\\Ã½ÆÅ.lua"		-- »Øµ÷ÎÄ¼þÃû
FUTURE_DAY_COUNT	= 7					-- ¿ÉÔ¤¶¨Î´À´ÈÕÆÚµÄÌìÊý

STATUS_IDLE			= 0					-- ³¡µØ×´Ì¬£º¿ÕÏÐ
STATUS_BIDUP		= 1					-- ³¡µØ×´Ì¬£ºÕýÔÚ¾ºÍ¶
STATUS_OVER			= 2					-- ³¡µØ×´Ì¬£ºÂò¶Ï
--==================¶«Î÷µÄ¼Û¸ñ==============================================================================
HIRE_CLOTH_COST = 1;	--×âÒÂ·þËùÐè½ð×Ó
HIRE_CLOTH2_COST = 1;	--×âÖ÷»éÈËËùÐè½ð×Ó
BUY_DOOLY_COST = 1;	--×â½Î×ÓËùÐè½ð×Ó
BUY_RING_COST = 520;		--Âò½äÖ¸ËùÐè½ð×Ó
BUY_QINGTIE_PACKET = 99	--ÂòÇëÌû°üËùÐè½ð×Ó
CANCEL_MARRIAGE_COST = 500	--È¡Ïû»éÔ¼ËùÐèµÄ½ð×Ó
ANNOUCE_FRIENDS_BEGIN_COST = 20	--Í¨ÖªÍæ¼Ò»éÇì½«Òª¿ªÊ¼ËùÐèµÄ½ð×Ó 
ANNOUNCE_INVITAION_COST = 20	--
ANNOUNCE_ALL_PLAYER_COST = 20
--==========================================================================================================
g_InfoHeader = "<color=green>Bµ mai<color>:";
--Õâ¸ö½á¹¹µÄ¾ßÌåÄÚÈÝÊÇ£ºmap_fields = ÈÕÆÚ{Ê±¶Î{³¡µØÀàÐÍ{¾ßÌåÐÅÏ¢}}}
map_fields = {}

-- ÄÉáçÐèÒªµÄÎïÆ·ºÍÊýÁ¿
map_item_nazheng = {
	{1, 1, 12, 36},		-- µ¾»¨Ïã
	{1, 1, 15, 36},		-- »Æ½ð¸â
	{2, 1, 54, 36},		-- Ðå¶Ð
	{2, 9,  3, 36},		-- ÎåÉ«Ë¿
	{2, 1, 39,  1}		-- Ò¹Ã÷Öé
}

-- ÄÉ²É£ºÅ®·½Á÷³Ì
function process_nacai_girl()
	Talk(1, "",g_InfoHeader.."Bªn nam tæ ®éi víi bªn n÷ råi ®Õn gÆp ta.")
end

-- ÄÉ²É£ºÄÐ·½½»Ã½½ðºÍÀñÆ·
function process_nacai_boy_gift()
	if (GetCash() < COUNT_MEIJIN*10000 or
		GetItemCount(ITEM_SATIN[1], ITEM_SATIN[2], ITEM_SATIN[3]) < COUNT_SATIN) then
		Talk(1, "",g_InfoHeader.."LÔ vËt c­íi hái nhÊt ®Þnh kh«ng thÓ thiÕu, tÊt c¶ gåm: <color=red>100<color> tiÒn vµng vµ <color=red>10<color>c©y v¶i gÊm, mau ®i chuÈn bÞ.")
	else
		-- ¿Û³ýÃ½½ðºÍÀñÆ·
		DelItem(ITEM_SATIN[1], ITEM_SATIN[2], ITEM_SATIN[3], COUNT_SATIN)
		Pay(COUNT_MEIJIN*10000)
		-- ÉèÖÃÈÎÎñ±äÁ¿
		set_wedding_step(2)
		Talk(1, "",g_InfoHeader.."TiÒn mai mèi vµ lÔ vËt ®Òu nhËn c¶ råi cßn kh«ng mau tæ ®éi víi ý trung nh©n ®Õn ®©y gÆp ta.")
		hint_step(3)
		WriteLog("[KÕt h«n]:"..GetName().."Giao tiÒn mai mèi vµ lÔ vËt")
	end
end

-- ÄÉ²É£ºÄÐ·½Á÷³Ì
function process_nacai_boy()
	if (GetLevel() < 15) then
		Talk(1, "",g_InfoHeader.."Ng­¬i t­ chÊt còng kh«ng tÖ th¶o nµo sím t×m ®­îc ý trung nh©n, nh­ng h«n nh©n lµ chuyÖn ®¹i sù. Theo luËt, ng­êi ch­a ®Õn cÊp <color=red>15<color> th× kh«ng thÓ kÕt h«n. Ng­¬i cè g¾ng luyÖn thªm mét thêi gian n÷a råi quay l¹i nhÐ!")
	elseif (GetPlayerFaction() == 0) then
		Talk(1, "",g_InfoHeader.."Ng­¬i ph¶i gia nhËp m«n ph¸i xin ý kiÕn cña ch­ëng m«n råi míi ®­îc kÕt h«n.")
	elseif (GetTask(TASK_FACTION_OUT) == 0) then
		Talk(1, "",g_InfoHeader.."Ng­¬i"..map_faction[GetPlayerFaction()][1].." nªn b¸o cho ch­ëng m«n"..map_faction[GetPlayerFaction()][2].."H·y <color=yellow>xuÊt s­<color> råi ®Õn gÆp ta!")
	else
		set_wedding_step(1)
		hint_step(2)
		Say(g_InfoHeader.."ThÕ nµy ®i, ng­¬i h·y chuÈn bÞ (<color=red>100<color> l­îng vµng) vµ (<color=red>10<color> cuén gÊm vãc) lµm lÔ vËt, ta sÏ ®Ých th©n gióp ng­¬i lµm lÔ g¹m hái. C¸c ®«i trai g¸i quanh ®©y ®Òu do mét tay ta mai mèi, chØ cÇn cã thµnh ý, b¶o ®¶m ng­¬i sÏ c­íi ®­îc vî hiÒn. <color=yellow>NÕu nhÊt thêi t×m kh«ng ®­îc th× ng­¬i cã thÓ ®Õn Ngù c¸c mua KÕt h«n lÔ bao, nh÷ng g× cÇn cho lÔ hái ®Òu cã trong KÕt h«n lÔ bao<color>.",
			2,
			"Ta ®· chuÈn bÞ tiÒn mai mèi vµ lÔ vËt råi/process_nacai_boy_gift",
			"Ta sÏ chuÈn bÞ/cancel")
	end
end

-- ÄÉ²É
function process_nacai()
	if (GetSex() == 1) then
		Say(g_InfoHeader.."Xem ng­¬i hµo kiÖt tuÊn tó nh­ vËy ®· cã ý trung nh©n ch­a? NÕu cã råi th× chuyÖn h«n sù ®Ó ta lo liÖu. Nh­ng ta chØ gióp cho nh÷ng ng­êi ®éc th©n th«i ®Êy nhÐ!",
			2,
			"Ta ®· cã ý trung nh©n, ta muèn kÕt h«n./process_nacai_boy",
			"Ng­¬i ch­a cã ý trung nh©n, quay l¹i sau nhÐ!/cancel")
	elseif (get_lover_code(PlayerIndex) == 0) then
		Talk(1, "",g_InfoHeader.."C« n­¬ng ®· cã ng­êi t©m ®Çu ý hîp ch­a? CÇn ta gióp kh«ng?")
	else
		Say(g_InfoHeader.."C« n­¬ng yªn t©m, mäi viÖc cø ®Ó bµ mai nµy lo liÖu.",
			2,
			--"ÊÇ·ñÒªÇå¿ÕRelayÊý¾Ý£¿/clear_data",
			"Ta muèn suy nghÜ l¹i chuyÖn h«n sù./cancel_engagement",
			"VËy ta ®îi ng­¬i./cancel")
	end
end
-- ½â³ý»éÔ¼¶Ô»°£¬Å®·½
function cancel_engagement()
	local selTab = {
				"§ång ý/disengage_girl",
				"§Ó ta suy nghÜ l¹i/cancel",
				}
	Say(g_InfoHeader.."Sao thÕ? Kh«ng muèn kÕt h«n ­? NÕu ng­¬i hñy h«n ­íc ph¶i nép båi th­êng <color=yellow>"..CANCEL_MARRIAGE_COST.." LÔ kim<color>, suy nghÜ kü nhÐ!",getn(selTab),selTab)
end;

function disengage_girl()	--Å®·½È¡Ïû»éÔ¼
	if Pay(CANCEL_MARRIAGE_COST*10000) == 1 then
		clear_task();
		Talk(1,"",g_InfoHeader.."Ta ®· gióp ng­¬i hñy h«n ­íc. Hy väng lÇn sau kh«ng ph¶i nh­ vËy n÷a nhÐ, h«n nh©n kh«ng ph¶i trß ®ïa ®©u.")
		Msg2Player("B¹n ®· hñy h«n ­íc");
		WriteLog("[KÕt h«n]:"..GetName().."H«n ­íc ®· bÞ hñy");
	else
		Talk(1,"",g_InfoHeader.."TiÒn vµng mang theo kh«ng ®ñ, kh«ng thÓ hñy h«n ­íc.");
	end;
end;
-- ½â³ý»éÔ¼¶Ô»°£¬ÄÐ·½
function disengage_talk()
	Say(g_InfoHeader.."Ng­¬i muèn hñy h«n ­íc ­? Nh­ vËy nh÷ng næ lùc cña ng­¬i xem nh­ c«ng cèc, lÔ vËt ng­¬i giao còng kh«ng thÓ lÊy l¹i. Ng­¬i nghÜ kü ®i.",
		2,
		"§ång ý/disengage_boy",
		"§Ó ta suy nghÜ l¹i/cancel")
end

-- È¡Ïû»éÔ¼
function disengage_boy()
	local sub_date = GetTask(TASK_WEDDING_DATE)
	if (sub_date ~= 0 and map_fields[sub_date] ~= nil) then
		local param2 = GetTask(TASK_WEDDING_FIELD)
		local sub_year, sub_mon, sub_day = decode_date(sub_date)
		local sub_period, sub_type = decode_param2(param2)
		local field_inf = map_fields[sub_date][sub_period][sub_type]
		if (field_inf[ITEMKEY_ROLE] == GetName()) then
			local caption = format(g_InfoHeader.."B¹n ®Æt vµo <color=red>th¸ng %d ngµy %d %s<color>-<color=red>%s<color>, víi gi¸ lµ <color=red>%d<color> lÔ kim, ®ang xÕp thø 1 kh«ng thÓ hñy bá h«n nh©n. ",
				sub_mon,
				sub_day,
				map_period[sub_period][5],
				map_fieldinfo[sub_type][1],
				GetTask(TASK_WEDDING_COST))
			Talk(1, "main", caption)
			return
		end
	end
	clear_task();
	Talk(1,"",g_InfoHeader.."Ta ®· gióp ng­¬i hñy h«n ­íc. Hy väng lÇn sau kh«ng ph¶i nh­ vËy n÷a nhÐ, h«n nh©n kh«ng ph¶i trß ®ïa ®©u.");
	Msg2Player("B¹n ®· hñy h«n ­íc");
	WriteLog("[KÕt h«n]:"..GetName().."H«n ­íc ®· bÞ hñy");
end

-- ÎÊÃû
function process_wenming()
	if GetTeamSize() < 2 then
		Talk(1, "",g_InfoHeader.."TiÒn mai mèi vµ lÔ vËt ®· nhËn, tæ ®éi víi ý trung nh©n ®Õn gÆp ta.")
	elseif GetTeamSize() > 2 then
		Talk(1, "",g_InfoHeader.."H«n nh©n lµ chuyÖn ®¹i sù, kh«ng ®Ó ng­êi kh¸c can thiÖp vµo.")
	elseif GetSex() == 2 then
		Say(g_InfoHeader.."C« n­¬ng yªn t©m, mäi viÖc cø ®Ó bµ mai nµy lo liÖu.",
			2,
			--"ÊÇ·ñÒªÇë¿ÕRelayÊý¾Ý£¿/clear_data",
			"Ta muèn suy nghÜ l¹i chuyÖn h«n sù./cancel_engagement",
			"VËy ta ®îi ng­¬i./cancel")
	elseif GetCaptainName() ~= GetName() then
		Talk(1,"",g_InfoHeader.."Víi c­¬ng vÞ lµ ®éi tr­ëng ®Õn hoµn tÊt c¸c b­íc quan träng.");
	else
		local lover = get_team_lover(PlayerIndex)
		Say(g_InfoHeader.."Ng­êi nµy sÏ lµ <color=yellow>" .. GetName(lover) .. "<color> thª tö cña ng­¬i ­? ThËt lµ ®Ñp ng­êi ®Ñp nÕt. C¸c ng­¬i ®¨ng kÝ kÕt h«n lu«n chø?",
			2,
			"§óng vËy, ta muèn thµnh th©n./process_wenming_confirm",
			"§Ó ta suy nghÜ l¹i!/cancel")
	end
end

-- ¼ì²éË«·½ÊÇ·ñÃ»ÓÐ»éÔ¼
function check_empty_contract(bridegroom, bride)
	if (get_lover_code(bridegroom) ~= 0) then
		Talk(1, "",g_InfoHeader.."Ng­¬i ®· lµ ng­êi ®Ýnh h«n, kh«ng thÓ ®¨ng kÝ thªm lÇn n÷a.")
		return 0
	elseif (get_lover_code(bride) ~= 0) then
		Talk(1, "",g_InfoHeader.."C« n­¬ng ®ã ®· ®Ýnh h«n, kh«ng thÓ thµnh th©n víi ng­¬i.")
		return 0
	else
		return 1
	end
end

-- ¼ì²éË«·½ÊÇ·ñ»¥ÏàÓÐ»éÔ¼
function check_eachother_contract(bridegroom, bride)
	local selTab = {
			"Ta muèn suy nghÜ l¹i chuyÖn h«n sù./disengage_talk",
			"BiÕt råi!/cancel",
			}
	--ÐÂÀÉ£½ÐÂÄï£¬ÐÂÄï¡«£½ÐÂÀÉ
	if (get_lover_code(bridegroom) == Hash(GetName(bride))) and (get_lover_code(bride) ~= Hash(GetName(bridegroom))) then
		if get_lover_code(bride) == 0 then
			Say(g_InfoHeader.."C« n­¬ng nµy ®· ®Ýnh h«n, nÕu muèn thµnh th©n víi ng­¬i c« Êy ph¶i hñy bá h«n ­íc tr­íc ®ã.",getn(selTab),selTab)
		else
			Say(g_InfoHeader.."C« n­¬ng ®ã ®· ®Ýnh h«n, kh«ng thÓ thµnh th©n víi ng­¬i.",getn(selTab),selTab);
		end;
		return 0
	--ÐÂÀÉ¡«£½ÐÂÄï
	elseif (get_lover_code(bride) ~= Hash(GetName(bridegroom))) then
		Say(g_InfoHeader.."Ng­¬i ®· lµ ng­êi ®Ýnh h«n, kh«ng thÓ ®¨ng kÝ thªm lÇn n÷a.",getn(selTab),selTab);
		return 0
	else
		return 1
	end
end

-- ¼ì²é½á»éÌõ¼þ£¬Õâ¸öº¯ÊýÖ»ÄÜÓÉÄÐ·½µ÷ÓÃ
function check_marriage_condition(check)
	-- ±ØÐëÄÐ·½×ö¶Ó³¤
	if (GetTeamSize() ~= 2 or GetCaptainName() ~= GetName()) then	
		local msg = {
			"Cïng tæ ®éi víi ý trung nh©n ®Õn gÆp ta.",
			"Hai ng­êi cïng tæ ®éi do bªn nam lµm ®éi tr­ëng ®Õn gÆp ta.",
		}
		Talk(1, "",g_InfoHeader..msg[GetSex()])	--ÕâÀïÓ¦¸ÃÓÐÎÊÌâ
		return 0
	end
	
	local lover = get_team_lover(PlayerIndex)
	if (GetSex(lover) == 1) then
		Talk(1, "",g_InfoHeader.."ý trung nh©n cña ng­¬i ®©y sao? Xem 2 ng­êi h¹nh phóc qu¸!")
	elseif (GetLevel(lover) < 13) then
		Talk(1, "",g_InfoHeader.."C« n­¬ng nµy cßn qu¸ trÎ. Theo luËt thiÕu n÷ ch­a ®Õn cÊp <color=red>13<color> th× kh«ng thÓ kÕt h«n. Ng­¬i cã thÓ ®îi vµ cïng c« Êy luyÖn thªm nhÐ!")
	elseif (is_married(lover) == 1) then
		Talk(1, "",g_InfoHeader.."C« n­¬ng nµy ®· kÕt h«n víi mét ng­êi kh¸c, nhÊt ®Þnh kh«ng thÓ cïng ng­¬i thµnh th©n.")
	elseif (GetPlayerFaction(PlayerIndex) == 0) then
		Talk(1, "",g_InfoHeader.."Ng­¬i ph¶i gia nhËp m«n ph¸i xin ý kiÕn cña ch­ëng m«n råi míi ®­îc kÕt h«n.")
	elseif (GetPlayerFaction(lover) == 0) then
		Talk(1, "",g_InfoHeader.."C« n­¬ng nµy vÉn ch­a cã ng­êi chøng gi¸m ­? H«n sù nh­ vÇy kh«ng thÓ gäi lµ danh chÝnh ng«n thuËn ®­îc. H·y gia nhËp m«n ph¸i ®­îc sù ®ång ý cña ch­ëng m«n sau ®ã ®Õn gÆp ta.")
	elseif (GetTask(TASK_FACTION_OUT, PlayerIndex) == 0) then
		Talk(1, "",g_InfoHeader.."Ng­¬i"..map_faction[GetPlayerFaction()][1].." nªn b¸o cho ch­ëng m«n"..map_faction[GetPlayerFaction()][2].."Ng­¬i ph¶i xuÊt s­ råi míi ®­îc kÕt h«n.")
	elseif (GetTask(TASK_FACTION_OUT, lover) == 0) then
		Talk(1, "",g_InfoHeader.."C« n­¬ng ph¶i xuÊt s­ råi míi ®­îc kÕt h«n.")
	elseif (check(PlayerIndex, lover) == 1) then
		return 1
	end
	return 0
end

-- ÎÊÃû£ºÈ·¶¨Òª½á»é
function process_wenming_confirm()
	if (check_marriage_condition(check_empty_contract) == 1) then
		local lover = get_team_lover(PlayerIndex)
		local myself = PlayerIndex
		local name = GetName()
		Say(g_InfoHeader.."§õng nãng véi, chØ cÇn c« n­¬ng Êy ®ång ý ta sÏ cho 2 ng­êi kÕt h«n.",
			2,
			"Thay ta dß th¨m ý cña c« Êy/ask_engage",
			"§Ó ta suy nghÜ l¹i/cancel")
	end
end

function ask_engage()
	if (check_marriage_condition(check_empty_contract) == 1) then
		local lover = get_team_lover(PlayerIndex)
		SetPlayerScript(CALLBACK_FILE, lover)
		Say2SomeOne(lover,
			g_InfoHeader.."Ng­¬i chÝnh lµ" .. GetName(lover) .. " c« n­¬ng, <color=yellow>" .. GetName() .. "<color> ®· nhiÒu lÇn muèn cïng c« ®Ýnh h«n, thiÕu hiÖp ®ã yªu th­¬ng c« thËt lßng. Ta ®· lµm mai cho nhiÒu ng­êi nh­ng ch­a thÊy ai tèt nh­ vËy. ThiÕu hiÖp Êy cßn s¾m c¶ sÝnh lÔ, chØ cÇn chê sù ®ång ý cña c«.",
			2,
			"§ång ý/agree_engage",
			"Kh«ng ®ång ý/disagree_engage")
	end
end

-- Å®·½¾Ü¾ø¶©»é
function disagree_engage()
	if (GetTeamSize() == 2) then
		local lover = get_team_lover(PlayerIndex)
		if (lover ~= 0 and GetSex(lover) == 1) then
			SetPlayerScript(CALLBACK_FILE, lover)		
			Talk2SomeOne(lover,
				1,
				"",
				g_InfoHeader.."Xin lçi, c« n­¬ng Êy ch­a hiÓu g× vÒ ng­¬i nªn ®· tõ chèi. Ng­¬i nªn t¹o c¬ héi ®Ó c« Êy hiÓu thªm vÒ ng­¬i.")
			Msg2Player(format("B¹n quyÕt ®Þnh cïng víi %s kÕt h«n", GetName(lover)))
		end
	end
end

-- Å®·½Í¬Òâ¶©»é
function agree_engage()
	-- DEBUG
	gf_ShowDebugInfor("agree_engage")
	if (GetTeamSize() == 2) then
		local lover = get_team_lover(PlayerIndex)
		if (lover ~= 0 and GetSex(lover) == 1) then
			local caption = format(g_InfoHeader.."Bªn nam <color=yellow>%s<color> (§¼ng cÊp %d) cÇu h«n cïng <color=yellow>%s<color> (§¼ng cÊp%d). Hai bªn ®· quyÕt ®Þnh tiÕn tíi h«n nh©n. Ta sÏ gióp c¸c ng­¬i trao ®æi danh thiÕp, 2 ng­êi chÝnh thøc ®Ýnh h«n.",
				GetName(lover),
				GetLevel(lover),
				GetName(PlayerIndex),
				GetLevel(PlayerIndex))
			SetPlayerScript(CALLBACK_FILE, lover)		
			Say2SomeOne(lover,
				caption,
				2,
				"Kh«ng cã vÊn ®Ò g×/process_wenming_confirm2",
				"Ta sÏ quay l¹i sau!/cancel")
			Msg2Player(format("Ta ®ång ý cïng %s kÕt h«n", GetName(lover)))
		end
	end
end

function process_wenming_confirm2()
	if (check_marriage_condition(check_empty_contract) == 1) then
		local lover = get_team_lover(PlayerIndex)
		local myself = PlayerIndex
		set_lover_code(lover, Hash(GetName(myself)))
		set_lover_code(myself, Hash(GetName(lover)))
		-- ÉèÖÃÈÎÎñ±äÁ¿
		set_wedding_step(3)
		Talk(1, "", g_InfoHeader.."Ta ®· gióp c¸c ng­¬i trao ®æi danh thiÕp, b©y giê bªn nam sÏ tÆng quµ cho bªn n÷.")
		SaveNow();
		PlayerIndex = lover;
		Talk(1, "", g_InfoHeader.."Ta ®· gióp c¸c ng­¬i trao ®æi danh thiÕp, b©y giê bªn nam sÏ tÆng quµ cho bªn n÷.")
		SaveNow();
		PlayerIndex = myself;
		WriteLog("[KÕt h«n]:"..GetName(myself).."cïng víi "..GetName(lover).."KiÕn lËp h«n ­íc");
	end
end

-- ÄÉ¼ª
function process_naji()
	hint_step(4)
	Say(g_InfoHeader.."§· tÆng quµ ch­a? TiÕp theo ng­¬i ph¶i chuÈn bÞ lÔ hái gåm <color=red>§¹o Hoa H­¬ng 36 b×nh<color>, <color=red>B¸nh Bét vµng 36 hép<color>, <color=red>GÊm vµng 36 xÊp<color>, <color=red>T¬ ngò s¾c 36 cuén<color>, <color=red>D¹ Minh Ch©u 5 viªn<color>. ChuÈn bÞ ®ñ råi cïng tæ ®éi víi thª tö cña ng­¬i ®Õn gÆp ta.",
		3,
		"Ta ®· chuÈn bÞ xong råi/process_naji_confirm",
		"Ta muèn suy nghÜ l¹i chuyÖn h«n sù./disengage_talk",
		"Ta vÉn ch­a chuÈn bÞ xong/cancel")
end

-- ÄÉáç£ºÈ·ÈÏ
function process_naji_confirm()
	-- ±ØÐëÄÐ·½×ö¶Ó³¤
	local msg = g_InfoHeader.."Bªn nam ®­a ý trung nh©n ®Õn gÆp ta"
	if (GetTeamSize() ~= 2 or GetCaptainName() ~= GetName()) then
		Talk(1, "", msg)
		return
	end
	
	local lover = get_team_lover(PlayerIndex)
	if (GetSex(lover) == 1) then
		Talk(1, "", g_InfoHeader.."Nµy, lÇn tr­íc ng­¬i ®­a ®Õn mét c« n­¬ng sao lÇn nµy l¹i lµ g· nµy h¶?")
		return
	elseif (get_lover_code(PlayerIndex) ~= Hash(GetName(lover))) then
		Talk(1, "", g_InfoHeader.."C« n­¬ng lÇn tr­íc ng­¬i ®­a ®Õn kh«ng ph¶i lµ ng­êi nµy.")
		return
	end
	
	local item_count = getn(map_item_nazheng)
	for i = 1, item_count do
		local item = map_item_nazheng[i]
		if (GetItemCount(item[1], item[2], item[3]) < item[4]) then
			Talk(1, "", g_InfoHeader.."ChuÈn bÞ xong lÔ hái cïng tæ ®éi víi ý trung nh©n ®Õn gÆp ta. LÔ hái gåm: <color=red>§¹o Hoa H­¬ng 36 b×nh<color>, <color=red>B¸nh Bét vµng 36 hép<color>, <color=red>GÊm vµng 36 xÊp<color>, <color=red>T¬ ngò s¾c 36 cuén<color>, <color=red>D¹ Minh Ch©u 1 viªn<color>.")
			return
		end
	end
	
	for i = 1, item_count do
		local item = map_item_nazheng[i]
		DelItem(item[1], item[2], item[3], item[4])
	end
	
	-- ÉèÖÃÈÎÎñ±äÁ¿
	set_wedding_step(4)
	process_qingqi()
	WriteLog("[KÕt h«n]:"..GetName().."Giao lÔ vËt");
end
--ÅÐ¶ÏÔ¤¶©µÄ³¡µØÊÇ·ñ¹ýÆÚ
function is_field_timeout()
	local sub_date = GetTask(TASK_WEDDING_DATE)
	local sub_period, sub_type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	local cur_date = curr_date()
	local cur_time = curr_time()
	if get_wedding_stat() == 1 then
		if sub_date > cur_date then	--µ±Ç°ÈÕÆÚÐ¡ÓÚ³¡µØÈÕÆÚ
			return 0
		elseif sub_date == cur_date then	--Í¬Ò»Ìì
			if tonumber(date("%H")) > map_period[sub_period][3]	then--±È½ÏÐ¡Ê±
				return 1
			else
				return 0;
			end;
		else
			return 1;
		end;
	else
		return 0;	
	end;
end;
-- »éÀñ³¡µØÔ¤¶©×´Ì¬£¬·µ»ØÖµ0£ºÃ»ÓÐÔ¤¶©£¬1£ºÔ¤¶©³É¹¦£¬2£ºÔ¤¶©Ê§°Ü£¬3£ºÔ¤¶©ÁìÏÈ£¬4£ºÔ¤¶©Âäºó£¬-1£ºÔ¤¶©¹ýÆÚ
function get_sub_stat()
	local sub_date = GetTask(TASK_WEDDING_DATE)
	local sub_period, sub_type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	local cur_date = curr_date()
	local cur_time = curr_time()
	if (sub_date == 0) then
		return 0		-- Ã»ÓÐÔ¤¶©
	elseif (map_fields[sub_date] == nil) then	--map_fields±»ÖØÐÂ³õÊ¼»¯ÁË£¬ËùÒÔ¾ÍÎªnilÁË
		return -1		-- Ô¤¶©¹ýÆÚ
	else	--Èç¹ûmap_fieldsÃ»±»³õÊ¼»¯¾Í¿¿ÏÂÃæµÄÀ´ÅÐ¶ÏÊÇ·ñ¹ýÆÚÁË
		local sub_time = encode_time(map_period[sub_period][3], map_period[sub_period][4], 0)
		if (cmp_datetime(sub_date, sub_time, cur_date, cur_time) <= 0) then
			return -1	-- Ô¤¶©¹ýÆÚ
		end
	end
	
	local field = map_fields[sub_date][sub_period][sub_type]
	local name = GetName()
	local field_stat = field[ITEMKEY_STAT]
	if (field_stat == STATUS_OVER or
		cmp_datetime(field[ITEMKEY_CLOSEDATE], field[ITEMKEY_CLOSETIME], cur_date, cur_time) <= 0) then
		if (name == field[ITEMKEY_ROLE]) then
			return 1	-- Ô¤¶©³É¹¦
		else
			return 2	-- Ô¤¶©Ê§°Ü
		end
	else
		if (name == field[ITEMKEY_ROLE]) then
			return 3	-- Ô¤¶©ÁìÏÈ
		else
			return 4	-- Ô¤¶©Âäºó
		end
	end
end

-- ÇëÆÚ
function process_qingqi()
	-- »éÀñ³¡µØÔ¤¶©×´Ì¬£¬·µ»ØÖµ0£ºÃ»ÓÐÔ¤¶©£¬1£ºÔ¤¶©³É¹¦£¬2£ºÔ¤¶©Ê§°Ü£¬3£ºÔ¤¶©ÁìÏÈ£¬4£ºÔ¤¶©Âäºó£¬-1£ºÔ¤¶©¹ýÆÚ
	local sub_stat = get_sub_stat()
	-- DEBUG
	gf_ShowDebugInfor(format("process_qingqi: sub_stat==%d", sub_stat))
	local talk = {
		"§Ó ta xem s©n khÊu h«n lÔ ë ®©u/process_qingqi_selectfield",
		"Ta muèn xem bªn trong s©n khÊu/preview_fields",
--		"§­îc! Ta tæ chøc h«n lÔ mµ kh«ng cÇn s©n khÊu/process_qingqi_nofield",
		"Ta muèn suy nghÜ l¹i chuyÖn h«n sù./disengage_talk",
		"§Ó ta suy nghÜ l¹i/cancel"
	}
	local caption = g_InfoHeader.."LÔ hái ®· chuÈn bÞ xong, b©y giê ®Õn <color=yellow>ThØnh kú<color>. Ta cã vµi chç nµy ng­¬i thö ®Õn ®ã xem sao."

	local sub_year, sub_mon, sub_day = decode_date(GetTask(TASK_WEDDING_DATE))
	local sub_period, sub_type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	if get_wedding_stat() == 1 and sub_stat ~= 0 then	--Èç¹ûÔ¤¶¨³É¹¦ºó»¹ÔÚÇëÆÚ½×¶Î£¬ÄÇÃ´¾ÍÊÇÃ»ÁìÈ¡ÇëÌû°ü
		caption = format(g_InfoHeader.."B¹n ®Æt vµo thµnh c«ng <color=red>th¸ng %d ngµy %d %s<color> - <color=red>%s<color>. §©y lµ b¶n chØ dÉn c¸ch sö dông s©n khÊu h«n lÔ,  cã g× ch­a râ ng­¬i cø ®Õn t×m ta. ",
			sub_mon,
			sub_day,
			map_period[sub_period][5],
			map_fieldinfo[sub_type][1])
		Say(caption, 2,
			format("NhËn thiÖp mêi vµ kÕt h«n lÔ bao/#take_invitation(%d)", map_fieldinfo[sub_type][4]),
			"§Ó ta nghÜ l¹i/cancel")		
		return 0;
	end;
	if (sub_stat == -1) then	--¹ýÆÚÁË
		caption = format(g_InfoHeader.."B¹n ®Æt <color=red>th¸ng %d ngµy %d %s<color> - <color=red>%s<color> ®· qu¸ h¹n,  kh«ng thÓ lÊy l¹i tiÒn ®Êu gi¸. H·y chän l¹i khu vùc h«n lÔ.",
			sub_mon,
			sub_day,
			map_period[sub_period][5],
			map_fieldinfo[sub_type][1])
		clear_subs();
		Say(caption, getn(talk), talk)
	elseif (sub_stat == 0) then	--Ã»ÓÐÔ¤¶©
		if (get_wedding_stat() == 1) then
			hint_step(5)
			Say(g_InfoHeader.."NÕu kh«ng kÕt h«n ë s©n khÊu h«n lÔ c¸c ng­¬i cã thÓ tæ ®éi víi nhau ®Õn <color=red>Thóy Yªn<color> gÆp <color=red>NguyÖt L·o<color>.",
				2,
				"Ta muèn suy nghÜ l¹i chuyÖn h«n sù./disengage_talk",
				"VËy chóng ta sÏ ®Õn gÆp NguyÖt L·o/cancel")
		elseif (check_marriage_condition(check_eachother_contract) ~= 0 or get_sub_stat() ~= 0) then
			Say(caption, getn(talk), talk)
		end
	elseif (sub_stat == 1) then
		if (get_wedding_stat() == 0) then
			on_sub_success()
		else
			hint_step(5)
			Say(g_InfoHeader.."Ng­¬i ®· ®Æt s©n khÊu ®Ó kÕt h«n, nhÊt ®Þnh ph¶i ®óng giê. KÕt h«n ë ®©y, th«ng qua c¸c nghi thøc c¸c ng­¬i sÏ trë thµnh phu thª. NÕu muèn ®¬n gi¶n h¬n ng­¬i còng cã thÓ ®Õn Thóy Yªn gÆp NguyÖt L·o.",
				1,
				"Ta biÕt råi/main")
		end
		--set_wedding_step(5);	--½ÓÏÂÀ´¾Íµ½Ç×Ó­À²
	elseif (sub_stat == 2) then	--Ô¤¶©Ê§°Ü
		Say(g_InfoHeader.."Ng­¬i ®· kh«ng ®Æt ®­îc s©n khÊu h«n lÔ.",
			getn(talk), talk)
	elseif (sub_stat == 3 or	--3£ºÔ¤¶©ÁìÏÈ
			sub_stat == 4) then	--4£ºÔ¤¶©Âäºó
		Say(caption, 2,
			"§Ó chóng ta xem l¹i/process_qingqi_selectfield",
			--"ÎÒÏëÖØÐÂ¿¼ÂÇÒ»ÏÂÎÒµÄ»éÊÂ/disengage_talk",
			"§Ó ta suy nghÜ l¹i/cancel")
	end
end

function preview_fields()
	local selTab = {
			"YÕt chi tiÓu tróc/#preview_fields_confirm(1)",
			"C« ®¶o/#preview_fields_confirm(2)",
			"§éng phßng hoa chóc/#preview_fields_confirm(3)",
			"V©n S¬n ®Ønh/#preview_fields_confirm(4)",
			"Kh«ng cÇn ®©u/cancel",
			}
	Say(g_InfoHeader.."S©n khÊu ë ®©y lµ ®Ñp nhÊt, cã muèn tham quan kh«ng?",getn(selTab),selTab);
end;

function preview_fields_confirm(nType)
	local nOldPlayerIndex = PlayerIndex;
	local nFellowIndex = GetInteractivePlayerIndex();
	local nMyName = GetName();
	if nFellowIndex ~= 0 then
		if GetTask(TASK_WEDDING_LOVER,nFellowIndex) ~= Hash(nMyName) then	--Èç¹û¶Ô·½Óë×Ô¼ºÃ»»éÔ¼
			CleanInteractive();
		end;
	end;
	local tField = {
			[1] = {855,1543, 3220},
			[2] = {856,1603, 3276},
			[3] = {857,1544, 3213},
			[4] = {858,1603, 3326},
			}
	NewWorld(tField[nType][1],tField[nType][2],tField[nType][3]);
end

-- ÏòRelayÇëÇó³¡µØÔ¤¶©ÐÅÏ¢
function process_qingqi_selectfield()
	set_wedding_stat(0);	--±íÊ¾Î´¾º±ê³É¹¦
	show_subs()
end

-- ¼ì²éÄ³ÌìÊÇ·ñÓÐ¿ÕÏÐ³¡µØ
function check_idle_date(fields)
	for i = 1, getn(fields) do
		if (check_idle_period(fields[i]) == 0) then
			return 0
		end
	end
	return 1
end

-- ¼ì²éÄ³Ê±¶ÎÊÇ·ñÓÐ¿ÕÏÐ³¡µØ
function check_idle_period(fields)
	local date = curr_date()
	local time = curr_time()
	for i = 1, getn(map_fieldinfo) do
		local stat = fields[i][ITEMKEY_STAT]
		if (stat == STATUS_IDLE) then
			-- ¿ÕÏÐ
			return 1
		elseif (stat == STATUS_BIDUP and
			cmp_datetime(fields[i][ITEMKEY_CLOSEDATE], fields[i][ITEMKEY_CLOSETIME], date, time) > 0) then
			-- ¾ºÍ¶ÖÐ£¬Î´µ½ÆÚ
			return 1						
		end
	end
	return 0
end

-- ÏÔÊ¾³¡µØÔ¤¶©ÐÅÏ¢
function show_subs()
	local future = future_days(2, FUTURE_DAY_COUNT)
	local talk = {}
	local count = getn(future)
	
	for i = 1, count do
		local date = future[i]
		local year, mon, day = decode_date(date)
		if (map_fields[date] == nil) then
			-- DEBUG
			gf_ShowDebugInfor(format("show_subs: init map_fields[%d]", date))
			map_fields[date] = init_date_field()
		end
		
		if (check_idle_date(map_fields[date]) == 1) then
			talk[i] = format("th¸ng %d ngµy %d/#show_subs_date(%d,%d,%d)", mon, day, year, mon, day)
		else
			talk[i] = format("th¸ng %d ngµy %d (TÊt c¶ c¸c s©n khÊu ®Òu trèng)/cancel", mon, day)
		end	
	end	
	
	--talk[count + 1] = "ÎÒµÄÍ¶±êÇé¿ö/show_mysubs"
	--talk[count + 2] = "ÎÒÒªÈ¡»Ø¾ºÍ¶µÄÀñ½ð/withdraw"
	talk[count + 1] = "Quay l¹i ®èi tho¹i tr­íc/main"
	talk[count + 2] = "SÏ quay l¹i sau/cancel"
	Say(g_InfoHeader.."Xin chän ngµy", getn(talk), talk)
end

function withdraw()
	if gf_JudgeRoomWeight(11,50) ~= 1 then
		Talk(1,"",g_InfoHeader.."Ng­¬i cÇn s¾p xÕp l¹i hµnh lý, kho¶ng trèng kh«ng ®ñ.");
		return 0;
	end;
	local task_cost = GetTask(TASK_WEDDING_COST)
	if (task_cost == 0) then
		Talk(1, "main", g_InfoHeader.."Ch­a ®Æt lêi")
		return
	end
	
	local task_date = GetTask(TASK_WEDDING_DATE)
	local task_time, task_type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	local year, mon, day = decode_date(task_date)
	local this_date = curr_date()
	local this_time = curr_time()
	if (task_date < curr_date()) then
		local caption = format(g_InfoHeader.."B¹n ®Æt vµo <color=red>th¸ng %d ngµy %d %s<color>-<color=red>%s<color>, víi gi¸ lµ <color=red>%d<color> lÔ kim. §· qu¸ h¹n,  kh«ng thÓ lÊy l¹i tiÒn ®Æt cäc ",
			mon,
			day,
			map_period[task_time][5],
			map_fieldinfo[task_type][1],
			task_cost)
		Talk(1, "main", caption)
		return
	else
		local field = map_fields[task_date][task_time][task_type]
		if (field[ITEMKEY_ROLE] == GetName()) then
			local close_date = field[ITEMKEY_CLOSEDATE]
			local close_time = field[ITEMKEY_CLOSETIME]
			local caption = nil
			if (field[ITEMKEY_STAT] == STATUS_OVER or
				cmp_datetime(close_date, close_time, this_date, this_time) <= 0) then
				caption = format(g_InfoHeader.."B¹n ®Æt vµo <color=red>th¸ng %d ngµy %d %s<color>-<color=red>%s<color>,  gi¸ tiÒn lµ<color=red>%d<color>. B¹n ®Æt tiÒn thµnh c«ng.",
					mon,
					day,
					map_period[task_time][5],
					map_fieldinfo[task_type][1],
					task_cost)
			else
				caption = format(g_InfoHeader.."B¹n ®Æt vµo <color=red>th¸ng %d ngµy %d %s<color>-<color=red>%s<color>,  gi¸ tiÒn lµ<color=red>%d<color>. B¹n ®ang xÕp thø 1, kh«ng thÓ rót l¹i tiÒn ®· ®Æt.",
					mon,
					day,
					map_period[task_time][5],
					map_fieldinfo[task_type][1],
					task_cost)
			end
			Talk(1, "main", caption)
			return
		end
	end
	AddItem(ITEM_COIN[1], ITEM_COIN[2], ITEM_COIN[3], task_cost)
	clear_subs()
	Msg2Player(format("Ng­¬i ®· ®Æt %d LÔ kim.", task_cost))
	WriteLog("[KÕt h«n]:"..GetName().."Do mét sè nguyªn nh©n ®· rót l¹i"..task_cost.." LÔ kim, t¹i hµm sè withdraw")
end

function diff_time(time1, time2)
	local hour1, min1, sec1 = decode_time(time1)
	local hour2, min2, sec2 = decode_time(time2)
	local t1 = hour1 * 3600 + min1 * 60 + sec1
	local t2 = hour2 * 3600 + min2 * 60 + sec2
	if (t1 < t2) then
		t1 = t1 + 24 * 3600
	end
	return t1 - t2
end

-- Í¶±ê³É¹¦
function on_sub_success()
	local wedding_stat = get_wedding_stat()
	local year, mon, day = decode_date(GetTask(TASK_WEDDING_DATE))
	local task_time, task_type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	if (wedding_stat == 1) then
		local task_cost = GetTask(TASK_WEDDING_COST)
		local caption = format(g_InfoHeader.."B¹n ®Æt <color=red>th¸ng %d ngµy %d %s<color>-<color=red>%s,  víi gi¸ lµ <color=red>%d<color> lÔ kim. Phiªn ®Êu gi¸ ®· kÕt thóc,  b¹n ®· ®Êu gi¸ thµnh c«ng vµ nhËn ®­îc quyÒn sö dông khu vùc h«n lÔ.",
			mon,
			day,
			map_period[task_time][5],
			map_fieldinfo[task_type][1],
			task_cost)
		Talk(1, "", caption)
	else
		local caption = format(g_InfoHeader.."B¹n ®· dù ®Þnh thµnh c«ng <color=red>th¸ng %d ngµy %d %s<color> - <color=red>%s<color>. §©y lµ b¶n chØ dÉn c¸ch sö dông s©n khÊu h«n lÔ,  cã g× ch­a râ ng­¬i cø ®Õn t×m ta. ",
			mon,
			day,
			map_period[task_time][5],
			map_fieldinfo[task_type][1])
		Say(caption, 2,
			format("NhËn thiÖp mêi vµ kÕt h«n lÔ bao/#take_invitation(%d)", map_fieldinfo[task_type][4]),
			"§Ó ta nghÜ l¹i/cancel")
	end
	set_wedding_stat(1)		--±íÊ¾¾º±ê³¡µØ³É¹¦
	WriteLog("[KÕt h«n]:"..GetName().."§Æt ®­îc s©n khÊu, thêi gian:"..GetTask(TASK_WEDDING_DATE)..", thêi gian vµ lo¹i:"..GetTask(TASK_WEDDING_FIELD));
end

-- ½ÓÊÕÇëÌû
function take_invitation(count)
	if GetTask(TASK_GOT_INVITATION) == 1 then
		Talk(1,"",g_InfoHeader.."B¹n ®· nhËn thiÖp mêi vµ KÕt h«n lÔ bao");
		return 0;
	end
	if gf_JudgeRoomWeight(15,50) == 0 then
		Talk(1,"",g_InfoHeader.."Kho¶ng trèng trong hµnh trang cña b¹n kh«ng ®ñ");
		return 0;
	end;
	SetTask(TASK_GOT_INVITATION,1)
	local wedding_stat = get_wedding_stat()
	-- ÉèÖÃÇëÌûÊôÐÔ
	local task_date = GetTask(TASK_WEDDING_DATE)
	local task_para = GetTask(TASK_WEDDING_FIELD)
	add_invitation(count, task_date, task_para)
	local _,nFieldType = decode_param2(task_para)
	AddItem(ITEM_MARRIAGE_PACKET[nFieldType][1],ITEM_MARRIAGE_PACKET[nFieldType][2],ITEM_MARRIAGE_PACKET[nFieldType][3],1)
	Msg2Player("B¹n nhËn ®­îc "..ITEM_MARRIAGE_PACKET[nFieldType][4]);
	set_wedding_step(5);	--½ÓÏÂÀ´¾Íµ½Ç×Ó­À²
	WriteLog("[KÕt h«n]:"..GetName().."thiÖp mêi vµ KÕt h«n lÔ bao"..nFieldType);
end

-- ÎÒµÄÍ¶±êÇé¿ö
function show_mysubs()
	local cost = GetTask(TASK_WEDDING_COST)
	local date = GetTask(TASK_WEDDING_DATE)
	local period, type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	local year, mon, day = decode_date(date)
	-- »éÀñ³¡µØÔ¤¶©×´Ì¬£¬·µ»ØÖµ0£ºÃ»ÓÐÔ¤¶©£¬1£ºÔ¤¶©³É¹¦£¬2£ºÔ¤¶©Ê§°Ü£¬3£ºÔ¤¶©ÁìÏÈ£¬4£ºÔ¤¶©Âäºó£¬-1£ºÔ¤¶©¹ýÆÚ
	local sub_stat = get_sub_stat()
	if (sub_stat == -1) then
		local caption = format(g_InfoHeader.."B¹n ®Æt <color=red>th¸ng %d ngµy %d %s<color>-<color=red>%s,  víi gi¸ lµ <color=red>%d<color> lÔ kim. Phiªn ®Êu gi¸ ®· hÕt h¹n.",
			mon,
			day,
			map_period[period][5],
			map_fieldinfo[type][1],
			cost)
		Talk(1, "", caption)
	elseif (sub_stat == 0) then
		Talk(1, "main", g_InfoHeader.."Ch­a ®Æt lêi")
	elseif (sub_stat == 1) then
		on_sub_success()
	elseif (sub_stat == 2) then
		local field = map_fields[date][period][type]
		caption = format(g_InfoHeader.."B¹n ®Æt <color=red>th¸ng %d ngµy %d %s<color>-<color=red>%s,  víi gi¸ lµ <color=red>%d<color> lÔ kim. Phiªn ®Êu gi¸ ®· kÕt thóc,  b¹n ®Êu gi¸ thÊt b¹i,  kh«ng nhËn ®­îc quyÒn sö dông khu vùc h«n lÔ.",
			mon,
			day,
			map_period[period][5],
			map_fieldinfo[type][1],
			cost,
			field[ITEMKEY_COST])
		Talk(1, "", caption)
	else
		local field = map_fields[date][period][type]
		local left_sec = diff_time(field[ITEMKEY_CLOSETIME], curr_time())
		local left_hour = floor(left_sec / 3600)
		local left_min = floor(mod(left_sec, 3600) / 60) 
		if (sub_stat == 3) then	-- Í¶±êÁìÏÈ
			keep_ahead(year, mon, day, period, type, left_hour, left_min)
		else
			drop_behind(field, year, mon, day, period, type, left_hour, left_min)
		end
	end
end

-- ÏÔÊ¾Ä³Ò»ÌìµÄÔ¤¶©Çé¿ö
function show_subs_date(year, mon, day)
	year = tonumber(year)
	mon = tonumber(mon)
	day = tonumber(day)
	
	local date = encode_date(year, mon, day)
	local talk = {}
	if (map_fields[date] == nil) then
		-- DEBUG
		gf_ShowDebugInfor(format("show_subs_date: init map_fields[%d]", date))
		map_fields[date] = init_date_field()
	end
	
	local fields = map_fields[date]
	local count = getn(fields)
	for i = 1, count do
		if (check_idle_period(fields[i]) == 0) then
			talk[i] = format("%s (TÊt c¶ c¸c s©n khÊu ®Òu trèng)/cancel",
				map_period[i][5])
		else
			talk[i] = format("%s/#show_subs_period(%d,%d,%d,%d)",
				map_period[i][5],
				year,
				mon,
				day,
				i)
		end
	end
	--talk[count + 1] = "ÎÒµÄÍ¶±êÇé¿ö/show_mysubs"
	talk[count + 1] = "Chän l¹i ngµy kh¸c/show_subs"
	talk[count + 2] = "SÏ quay l¹i sau/cancel"
	Say(format(g_InfoHeader.."Thêi gian s©n khÊu cßn trèng: n¨m %d th¸ng %d ngµy %d. Xin chän ngµy: ",year, mon, day), getn(talk), talk)
end

function show_subs_period(year, mon, day, period)
	year = tonumber(year)
	mon = tonumber(mon)
	day = tonumber(day)
	period = tonumber(period)
	
	local date = encode_date(year, mon, day)
	local fields = map_fields[date][period]
	local count = getn(fields)
	local talk = {}
	for i = 1, count do
		local stat = fields[i][ITEMKEY_STAT]
		local cost = fields[i][ITEMKEY_COST]
		if (stat == STATUS_IDLE) then
			talk[i] = format("%s: gi¸ %d/#select_field(%d,%d,%d,%d,%d)",
				map_fieldinfo[i][1], map_fieldinfo[i][2], year, mon, day, period, i)
		elseif (stat == STATUS_OVER or cost >= map_fieldinfo[i][3]) then
			local role = fields[i][ITEMKEY_ROLE]
			talk[i] = format("%s: §· cã %s ®Æt víi gi¸ lµ %d LÔ kim/cancel",
				map_fieldinfo[i][1], role, cost)
		else
			if (cmp_datetime(fields[i][ITEMKEY_CLOSEDATE], fields[i][ITEMKEY_CLOSETIME], curr_date(), curr_time()) <= 0) then
				talk[i] = format("%s: §Æt xong, gi¸ %d/cancel",
					map_fieldinfo[i][1], fields[i][ITEMKEY_COST])
			else
				local close_date = fields[i][ITEMKEY_CLOSEDATE]
				local close_time = fields[i][ITEMKEY_CLOSETIME]			
				local this_date = curr_date()
				local this_time = curr_time()
			
				local diff = diff_time(close_time, this_time)
				local left_hour = floor(diff / 3600)
				local left_min = (diff - left_hour * 3600) / 60
				-- talk[i] = format("%s£ºÓÐÈËÍ¶±ê£¬ÏÖ¼Û%d¸öÀñ½ð£¬Ã¿´Î¼Ó¼Û%d¸öÀñ½ð£¬¾àÀëÍ¶±ê½áÊø»¹ÓÐ%dÐ¡Ê±%d·Ö/#select_field(%d,%d,%d,%d,%d)",
				talk[i] = format("%s: Gi¸ tiÖn t¹i %d LÔ kim, mçi lÇn t¨ng %d LÔ kim. Thêi gian ®¨ng ký cßn %d giê %d phót/#select_field(%d,%d,%d,%d,%d)",
					map_fieldinfo[i][1],
					fields[i][ITEMKEY_COST],
					map_fieldinfo[i][6],
					left_hour,
					left_min,
					year, mon, day, period, i)
			end
		end
	end
	
	talk[count + 1] = format("Chän l¹i thêi gian kh¸c/#show_subs_date(%d,%d,%d)",year, mon, day);
	talk[count + 2] = "SÏ quay l¹i sau/cancel"
	local caption = format(g_InfoHeader.."T×nh h×nh s©n khÊu n¨m %d th¸ng %d ngµy%d %s, chän s©n khÊu b¹n cÇn.",
			year,
			mon,
			day,
			map_period[period][5])
	Say(caption, getn(talk), talk)
end

-- Í¶±ê£¬ÁìÏÈ
function keep_ahead(year, mon, day, period, type, left_hour, left_min)
	local nCurrLost = GetTask(TASK_WEDDING_COST);
	local nMaxPrice = map_fieldinfo[type][3];
	local caption = format(g_InfoHeader.."B¹n ®Æt <color=red>th¸ng %d ngµy %d giê %s<color>-%s,  gi¸ lµ <color=red>%d<color> lÔ kim. HiÖn cßn %d giê %d phót kÕt thóc ®Êu gi¸. Gi¸ cuèi cïng lµ <color=yellow> "..nMaxPrice.."<color> LÔ kim, b¹n ph¶i ra gi¸ <color=yellow>"..(nMaxPrice-nCurrLost).."<color> míi cã thÓ mua ®øt s©n khÊu nµy. §ång ý kh«ng?",
		mon,
		day,
		map_period[period][5],
		map_fieldinfo[type][1],
		GetTask(TASK_WEDDING_COST),
		left_hour,
		left_min)
	local talk = {}
	talk[1] = format("Ta mua ®øt s©n khÊu nµy!/#buy(%d,%d,%d,%d,%d)", year, mon, day, period, type)
	talk[2] = "§Ó ta suy nghÜ l¹i/cancel"
	Say(caption, getn(talk), talk)
end

-- Í¶±ê£¬±»±ðÈË³¬¹ý
function drop_behind(field, year, mon, day, period, type, left_hour, left_min)
	-- DEBUG
	gf_ShowDebugInfor(format("\ndrop_behind(%d,%d,%d,%d,%d,%d,%d)", year, mon, day, period, type, left_hour, left_min))
	
	local last_bidup = GetTask(TASK_WEDDING_COST)
	local curr_price = field[ITEMKEY_COST]
	local base_price = map_fieldinfo[type][6]	--¼Ó¼Û
	local need_money = curr_price + base_price - last_bidup
	
	caption = format(g_InfoHeader.."B¹n ®Æt <color=red>th¸ng %d ngµy %d %s<color>-%s,  gi¸ b¹n ®­a ra lµ <color=red>%d<color> lÔ kim,  ®· cã ng­êi kh¸c ra gi¸ cao h¬n. Gi¸ hiÖn t¹i lµ <color=red>%d<color> LÔ kim. Thêi gian ®Êu gi¸ cßn <color=red>%d giê %d phót<color>. NÕu muèn tiÕp tôc ®Êu gi¸ b¹n ph¶i t¨ng thªm <color=red>%d<color> LÔ kim.",
		mon,
		day,
		map_period[period][5],
		map_fieldinfo[type][1],
		last_bidup,
		curr_price,
		left_hour,
		left_min,
		need_money)
	talk = {}
	talk[1] = format("Muèn ®Êu víi ta µ? §­îc! T¨ng thªm %d LÔ kim, tæng céng lµ %d LÔ kim!/#bidup(%d,%d,%d,%d,%d)",
		need_money,
		need_money + last_bidup,
		year,
		mon,
		day,
		period,
		type)
	talk[2] = format("S©n khÊu nµy ®¹i gia ta mua ®øt råi, gi¸ %d LÔ kim!/#buy(%d,%d,%d,%d,%d)",
		map_fieldinfo[type][3], year, mon, day, period, type)
	talk[3] = "Ta muèn thu håi l¹i sè tiÒn ®· bá ra ë s©n khÊu nµy/rollback"
	talk[4] = format("Chän s©n khÊu kh¸c/#show_subs_period(%d,%d,%d,%d)",
		year, mon, day, period)
	talk[5] = "SÏ quay l¹i sau/cancel"
	Say(caption, getn(talk), talk)
end

-- Í¶±êÊÇ·ñÊ§°Ü
function is_bidup_failed(field, role)
	if (field[ITEMKEY_ROLE] == role) then
		return 0
	elseif (field[ITEMKEY_STAT] == STATUS_OVER) then
		return 1
	elseif (cmp_datetime(field[ITEMKEY_CLOSEDATE], field[ITEMKEY_CLOSETIME], curr_date(), curr_time()) <= 0) then
		return 1
	else
		return 0
	end
end

-- Ñ¡ÔñÄ³¸öÊ±¶ÎµÄÄ³¸ö³¡µØ
function select_field(year, mon, day, period, type)
	year = tonumber(year)
	mon = tonumber(mon)
	day = tonumber(day)
	period = tonumber(period)
	type = tonumber(type)
	
	-- DEBUG
	gf_ShowDebugInfor(format("\nselect_field(%d, %d, %d, %d, %d)", year, mon, day, period, type))
	
	local subs_date = encode_date(year, mon, day)
	local task_date = GetTask(TASK_WEDDING_DATE)
	local task_time, task_type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	local myself = GetName()
	
	-- ÒÑ¾­¾ºÍ¶¹ý
	if ((task_date ~= 0 and task_date ~= subs_date) or
		(task_time ~= 0 and task_time ~= period) or
		(task_type ~= 0 and task_type ~= type)) then
		-- Èç¹ûÉÏ´Î¾ºÍ¶Ê§°Ü£¬ÔòÔÊÐíÖØÐÂ¾ºÍ¶
		if (map_fields[task_date] ~= nil) then
			local field = map_fields[task_date][task_time][task_type]
			if (is_bidup_failed(field, myself) == 0) then
				local task_year, task_mon, task_day = decode_date(task_date)
				Talk(1, "", format(g_InfoHeader.."B¹n ®· ®Æt n¨m <color=red>%d<color> th¸ng <color=red>%d<color> ngµy <color=red>%d<color> - <color=red>%s<color>  color=red>%s<color>",
					task_year,
					task_mon,
					task_day,
					map_period[task_time][5],
					map_fieldinfo[task_type][1]))
				return
			end
		end
	end

	local caption = ""
	local talk = {}
	local date = encode_date(year, mon, day)
	local field = map_fields[date][period][type]
	local curr_cost = field[ITEMKEY_COST]	-- µ±Ç°µÄ¾º±ê¼Û¸ñ
	
	-- ÒÔÇ°Ã»ÓÐÍ¶±ê»òÕßÉÏ´ÎÍ¶±êÊ§°Ü
	if (GetTask(TASK_WEDDING_COST) == 0 or
		map_fields[task_date] == nil or
		is_bidup_failed(map_fields[task_date][task_time][task_type], myself) == 1) then
		caption = format(g_InfoHeader.."B¹n ®· chän: n¨m %d th¸ng %d ngµy %d %s - %s,  quyÕt ®Þnh ®Æt chø?",
			year,
			mon,
			day,
			map_period[period][5],
			map_fieldinfo[type][1])
--		if curr_cost == 0 then	--Èç¹ûÖ®Ç°Ã»ÓÐÈË¾º±ê
--			talk[1] = format("ÎÒÒª¾º±ê£¬ÎÒ³ö%d¸öÀñ½ð/#bidup(%d,%d,%d,%d,%d)",map_fieldinfo[type][2], year, mon, day, period, type)
--		else
--			talk[1] = format("ÎÒÒª¾º±ê£¬ÎÒ¶à³ö%d¸öÀñ½ð£¬Ò»¹²ÊÇ%d¸öÀñ½ð/#bidup(%d,%d,%d,%d,%d)",map_fieldinfo[type][6],curr_cost+map_fieldinfo[type][6], year, mon, day, period, type)
--		end;
			
		talk[1] = format("§ång ý, gi¸ %d LÔ kim!/#buy(%d,%d,%d,%d,%d)",
			map_fieldinfo[type][2], year, mon, day, period, type)
		talk[2] = format("Hay lµ chän s©n khÊu kh¸c/#show_subs_period(%d,%d,%d,%d)",
			year, mon, day, period)
		talk[3] = "SÏ quay l¹i sau/cancel"
		Say(caption, getn(talk), talk)
	else
		local diff = diff_time(field[ITEMKEY_CLOSETIME], curr_time())
		local left_hour = floor(diff / 3600)
		local left_min = (diff - left_hour * 3600) / 60
		if (field[ITEMKEY_ROLE] == GetName()) then	-- ÒÑ¾­Í¶¹ý±êÎ´³¬¹ý
			keep_ahead(year, mon, day, period, type, left_hour, left_min)
		else										-- ÒÑ¾­Í¶¹ý±ê±»³¬¹ý
			drop_behind(field, year, mon, day, period, type, left_hour, left_min)
		end
	end
end

function callback_adddata(result)
	gf_ShowDebugInfor("callback_adddata")
	WriteLog("[KÕt h«n]: File gèc thay ®æi c¸c th«ng sè liªn quan ®Õn kÕt h«n thµnh c«ng");
	-- TODO: here
end

-- ÐÞ¸ÄÕûÐÍ¹²ÏíÊý¾Ý
function update_sharedata_int(param1, param2, key, data)
	AddRelayShareData(KEY_WEDDING,
		param1,
		param2,
		CALLBACK_FILE,
		"callback_adddata",		-- TODO: »Øµ÷º¯Êý
		0,
		key,
		"d",
		data)
	-- DEBUG
	gf_ShowDebugInfor(format("update_sharedata_int(%d, %d, %s, %d)", param1, param2, key, data))
	DelRelayShareDataCopy(KEY_WEDDING,param1,param2);
	WriteLog("[KÕt h«n]: File gèc thay ®æi c¸c th«ng sè liªn quan ®Õn s©n khÊu kÕt h«n. Lo¹i: §øng th¼ng");
end

-- ÐÞ¸Ä×Ö·û´®ÐÍ¹²ÏíÊý¾Ý
function update_sharedata_str(param1, param2, key, data)
	AddRelayShareData(KEY_WEDDING,
		param1,
		param2,
		CALLBACK_FILE,
		"callback_adddata",		-- TODO: »Øµ÷º¯Êý
		0,
		key,
		"s",
		data)
	-- DEBUG
	gf_ShowDebugInfor(format("update_sharedata_str(%d, %d, %s, %s)", param1, param2, key, data))
	DelRelayShareDataCopy(KEY_WEDDING,param1,param2);
	WriteLog("[KÕt h«n]: File gèc thay ®æi c¸c th«ng sè liªn quan ®Õn s©n khÊu kÕt h«n. Lo¹i: Chuçi ký tù");
end

-- ¾ºÍ¶ÌáÊ¾
function bidup_hint(mon, day, period, type, cost)
	local caption = format("§Êu gi¸ th¸ng %d ngµy %d_ %s %s, gi¸ %d LÔ kim.",
		mon,
		day,
		map_period[period][5],
		map_fieldinfo[type][1],
		cost)
	Msg2Player(caption)
	caption = g_InfoHeader..caption;
	Talk(1, "", caption)
end

function global_msg(mon, day, period, type, cost)
	local sMsg = "";
	if type == 1 then
		sMsg = ""
	elseif type == 2 then
	
	elseif type == 3 then
	
	else
	
	end;
	AddGlobalNews(sMsg)
	Msg2Global(sMsg)
end;

-- Âò¶ÏÌáÊ¾
function buy_hint(mon, day, period, type, cost)
	local caption = format("dù ®Þnh th¸ng %d ngµy %d_ %s %s, gi¸ %d LÔ kim.",
		mon,
		day,
		map_period[period][5],
		map_fieldinfo[type][1],
		cost)
	Msg2Player(caption)
	caption = g_InfoHeader..caption;
	Talk(1, "", caption)
	local sMsg = "";
	local sMsg1 = "";
	local lover = get_team_lover(PlayerIndex);
	local sBoyName = GetName();
	local sGirlName = GetName(lover);
	local nHour = map_period[period][1];
	if type == 1 then
		sMsg = "HiÖp sÜ giang hå <color=yellow>"..sBoyName.."<color> tõ <color=red>"..mon.."NguyÖt"..day.."Ngµy <color> lóc <color=red>"..nHour.."<color> t¹i <color=yellow>YÕt Chi tiÓu tróc<color> cïng víi <color=yellow>"..sGirlName.."<color> c« n­¬ng kÕt h«n. Sù cã mÆt cña c¸c vÞ b»ng h÷u lµ niÒm vinh h¹nh cho t©n nh©n!";
		sMsg1 = "HiÖp sÜ giang hå"..sBoyName.."Vu"..mon.."NguyÖt"..day.."Ngµy"..nHour.." giê t¹i Yªn Chi tiÓu tróc cïng víi"..sGirlName.." kÕt h«n. Sù cã mÆt cña b»ng h÷u lµ niÒm vinh h¹nh cho t©n nh©n";
	elseif type == 2 then
		sMsg = "<color=yellow>"..sBoyName.."<color> vµ <color=yellow>"..sGirlName.."<color> lóc <color=red>"..mon.."NguyÖt"..day.."Ngµy <color> lóc <color=red>"..nHour.."<color> sÏ kÕt h«n t¹i C« §¶o, mäi ng­êi ®Õn ®ã chóc mõng!";
		sMsg1 = "Gia nh©n"..sBoyName.."cïng víi "..sGirlName.."lóc"..mon.."NguyÖt"..day.."Ngµy"..nHour.." giê kÕt h«n t¹i C« ®¶o, mêi c¸c anh hïng kü n÷ ®Õn chóc mõng!";
	elseif type == 3 then
		sMsg = "Cao thñ <color=yellow>"..sBoyName.."<color> kÕt h«n cïng <color=red>"..mon.."NguyÖt"..day.."Ngµy <color> lóc <color=red>"..nHour.."<color> giai nh©n <color=yellow>"..sGirlName.."<color>, c¸c vÞ ®ång ®¹o Vâ l©m ®Õn chóc mõng";
		sMsg1 = "Cao thñ"..sBoyName.."kÕt h«n cïng"..mon.."NguyÖt"..day.."Ngµy"..nHour.."Gia nh©n"..sGirlName..", c¸c vÞ ®ång ®¹o ®Õn chóc mõng";
	else
		sMsg = "Nam cao thñ <color=yellow>"..sBoyName.."<color> s¸nh duyªn cïng giai nh©n <color=red>"..mon.."NguyÖt"..day.."Ngµy <color> lóc <color=red>"..nHour.."<color> t¹i <color=yellow>"..sGirlName.."<color>, chóc hai ng­êi b¸ch niªn giai l·o!";
		sMsg1 = "Nam cao thñ"..sBoyName.."s¸nh duyªn cïng n÷ giai nh©n"..mon.."NguyÖt"..day.."Ngµy"..nHour.."t¹i"..sGirlName..". Chóc 2 ng­êi b¸ch niªn giai l·o!";
	end;
	AddGlobalNews(sMsg);
	Msg2Global(sMsg1);
end

-- ¾º±ê
function bidup(year, mon, day, period, type)
	if (check_marriage_condition(check_eachother_contract) == 0) then
		return
	end
	
	local subs_date = encode_date(year, mon, day)
	local task_date = GetTask(TASK_WEDDING_DATE)
	local task_time, task_type = decode_param2(GetTask(TASK_WEDDING_FIELD))	
	
	if ((task_date ~= 0 and task_date ~= subs_date) or
		(task_time ~= 0 and task_time ~= period) or
		(task_type ~= 0 and task_type ~= type)) then
		local task_year, task_mon, task_day = decode_date(task_date)
		-- Èç¹ûÉÏ´Î¾ºÍ¶Ê§°Ü£¬ÔòÔÊÐíÖØÐÂ¾ºÍ¶
		if (map_fields[task_date] ~= nil and
			is_bidup_failed(map_fields[task_date][task_time][task_type], myself) == 0) then
			Talk(1, "", format(g_InfoHeader.."B¹n chän: n¨m %d th¸ng %d ngµy %d_ %s %s",
				task_year,
				task_mon,
				task_day,
				map_period[task_time][5],
				map_fieldinfo[task_type][1]))
			return
		end
	end
	
	local date = encode_date(year, mon, day)
	if (map_fields[subs_date] == nil) then
		-- DEBUG
		gf_ShowDebugInfor(format("bidup: init map_fields[%d]", subs_date))
		map_fields[subs_date] = init_date_field()
	end
	local field = map_fields[subs_date][period][type]
	
	-- ¼ì²éÊÇ·ñÒÑ¾­±»Âò¶Ï
	if (field[ITEMKEY_STAT] == STATUS_OVER) then
		Talk(1, "", format(g_InfoHeader.."S©n khÊu nµy ®· ®­îc %s ®Æt", field[ITEMKEY_ROLE]))
		return
	end
	
	-- ¼ì²éÉíÉÏÀñ½ðÊÇ·ñ×ã¹»
	local last_price = GetTask(TASK_WEDDING_COST)								-- ÉÏ´Î¾ºÍ¶µÄ¼Û¸ñ
	local curr_money = GetItemCount(ITEM_COIN[1], ITEM_COIN[2], ITEM_COIN[3])	-- ÉíÉÏµÄÀñ½ð¸öÊý
	local base_price = map_fieldinfo[type][2]									-- ³¡µØÆð±ê¼Û
	local curr_price = field[ITEMKEY_COST]										-- µ±Ç°¾ºÍ¶×î¸ß¼Û
	local add_price  = map_fieldinfo[type][6]									-- Ã¿´ÎµÄ¼Ó¼ÛÖµ
	local need_money = curr_price + add_price - last_price						-- ¼Ó¼ÛµÄÀñ½ð¸öÊý
	if (curr_money < need_money) then
		Talk(1, "", g_InfoHeader.."TiÒn vµng cña b¹n kh«ng ®ñ ")
		return
	end
	
	local wife = get_team_lover(PlayerIndex)
	-- ¼ì²é¾ºÍ¶ÊÇ·ñ½áÊø
	local param2 = encode_param2(period, type)
	if (field[ITEMKEY_STAT] == STATUS_BIDUP) then
		local close_date = field[ITEMKEY_CLOSEDATE]
		local close_time = field[ITEMKEY_CLOSETIME]
		if (curr_price >= map_fieldinfo[type][3] or
			cmp_datetime(close_date, close_time, curr_date(), curr_time()) <= 0) then
			-- ¾ºÍ¶½áÊø
			Talk(1, "", format(g_InfoHeader.."§Êu gi¸ kÕt thóc, s©n khÊu ®­îc %s mua víi gi¸ %d LÔ kim",
				field[ITEMKEY_ROLE], curr_price))
			return
		else
			-- ¾ºÍ¶½øÐÐÖÐ
			if DelItem(ITEM_COIN[1], ITEM_COIN[2], ITEM_COIN[3], need_money) ~= 1 then
				Talk(1, "", g_InfoHeader.."TiÒn vµng cña b¹n kh«ng ®ñ ")
				return			
			end;
			if (last_price == 0) then
				SetTask(TASK_WEDDING_DATE, subs_date)
				SetTask(TASK_WEDDING_FIELD, param2)
			end
			local pay = last_price + need_money
			SetTask(TASK_WEDDING_COST, pay)
			
			local husband_name = GetName(PlayerIndex)
			local wife_name = GetName(wife)
			
			field[ITEMKEY_WIFE] = wife_name
			field[ITEMKEY_ROLE] = husband_name
			field[ITEMKEY_COST] = pay
			
			update_sharedata_str(subs_date, param2, ITEMKEY_WIFE, wife_name)
			update_sharedata_str(subs_date, param2, ITEMKEY_ROLE, husband_name)
			update_sharedata_int(subs_date, param2, ITEMKEY_COST, pay)
			
			bidup_hint(mon, day, period, type, pay)
			return
		end
	end
	
	if DelItem(ITEM_COIN[1], ITEM_COIN[2], ITEM_COIN[3], base_price) ~= 1 then
		Talk(1, "", g_InfoHeader.."TiÒn vµng cña b¹n kh«ng ®ñ ")
		return
	end;
	-- Éè¶¨½ØÖÁÈÕÆÚÎª24Ð¡Ê±ÒÔºó
	local close_date = next_date(curr_date())
	local close_time = curr_time()
	field[ITEMKEY_CLOSEDATE] = close_date
	field[ITEMKEY_CLOSETIME] = close_time
	update_sharedata_int(date, param2, ITEMKEY_CLOSEDATE, close_date)
	update_sharedata_int(date, param2, ITEMKEY_CLOSETIME, close_time)
	
	local husband_name = GetName(PlayerIndex)
	local wife_name = GetName(wife)
	
	field[ITEMKEY_WIFE] = wife_name
	field[ITEMKEY_ROLE] = husband_name
	field[ITEMKEY_COST] = base_price
	field[ITEMKEY_STAT] = STATUS_BIDUP
	
	update_sharedata_str(date, param2, ITEMKEY_WIFE, wife_name)
	update_sharedata_str(date, param2, ITEMKEY_ROLE, husband_name)
	update_sharedata_int(date, param2, ITEMKEY_COST, base_price)
	update_sharedata_int(date, param2, ITEMKEY_STAT, STATUS_BIDUP)
	
	-- ¼ÇÂ¼¾ºÍ¶µÄÈÕÆÚÊ±¼äºÍ³¡µØ
	SetTask(TASK_WEDDING_COST, base_price)
	SetTask(TASK_WEDDING_DATE, subs_date)
	SetTask(TASK_WEDDING_FIELD, param2)
	
	bidup_hint(mon, day, period, type, base_price)
	WriteLog("[KÕt h«n]:"..GetName().."§Êu gi¸ s©n khÊu, tèn"..base_price.." LÔ kim, th«ng tin:"..subs_date..","..param2);
end

-- È¡»Ø¾ºÍ¶µÄÀñ½ð
function rollback()
	if gf_JudgeRoomWeight(11,50) ~= 1 then
		Talk(1,"",g_InfoHeader.."Ng­¬i cÇn s¾p xÕp l¹i hµnh lý, kho¶ng trèng kh«ng ®ñ.");
		return 0;
	end;
	local cost = GetTask(TASK_WEDDING_COST)
	if (cost == 0) then
		return
	end
	local date = GetTask(TASK_WEDDING_DATE)
	local time, type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	if (cost > map_fieldinfo[type][3]) then
		cost = map_fieldinfo[type][3]
	end

	-- Èç¹ûÊÇ¾ºÍ¶ÁìÏÈ£¬Ôò²»ÄÜÈ¡»Ø¾ºÍ¶µÄÀñ½ð
	local fields = map_fields[date]
	if (fields ~= nil) then
		local times = map_fields[date][time]
		if (times ~= nil) then
			local types = times[type]
			if (types ~= nil and types[ITEMKEY_ROLE] == GetName()) then
				Talk(1,"",g_InfoHeader.."§Êu gi¸ cña b¹n thÊp h¬n, kh«ng thÓ lÊy l¹i LÔ kim!");
				return
			end
		end
	end
	-- ·µ»¹Àñ½ð
	AddItem(ITEM_COIN[1], ITEM_COIN[2], ITEM_COIN[3], cost)
	clear_subs()
	Msg2Player(format("Ng­¬i ®· ®Æt %d LÔ kim.", cost));
	-- TODO: ÈÕÖ¾
	WriteLog("[KÕt h«n]:"..GetName().."§· cã ng­êi bá phiÕu cao h¬n, nhËn"..cost.." LÔ kim");
end

-- Âò¶Ï
function buy(year, mon, day, period, type)
	-- DEBUG
	gf_ShowDebugInfor(format("buy(%d,%d,%d,%d,%d)", year, mon, day, period, type))

	local subs_date = encode_date(year, mon, day)
	local task_date = GetTask(TASK_WEDDING_DATE)
	local task_time, task_type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	
	if (check_marriage_condition(check_eachother_contract) == 0) then
		-- DEBUG
		gf_ShowDebugInfor("buy: check_marriage_condition fail")
		return
	end
		
	if ((task_date ~= 0 and task_date ~= subs_date) or
		(task_time ~= 0 and task_time ~= period) or
		(task_type ~= 0 and task_type ~= type)) then
		local task_year, task_mon, task_day = decode_date(task_date)
		Talk(1, "", format(g_InfoHeader.."B¹n ®· ®Æt th¸ng %d ngµy %d_ %s %s",
			task_mon,
			task_day,
			map_period[task_time][5],
			map_fieldinfo[task_type][1]))
		return
	end

	-- ¼ì²éÉíÉÏÀñ½ðÊÇ·ñ×ã¹»
	local lost_count = GetTask(TASK_WEDDING_COST)
	local curr_count = GetItemCount(ITEM_COIN[1], ITEM_COIN[2], ITEM_COIN[3])
	local over_count = map_fieldinfo[type][2]	-- Âò¶Ï¼Û¸ñ
	local nPrice = map_fieldinfo[type][2]	--Æð±ê¼Û
	if (lost_count + curr_count < over_count) then
		Talk(1, "", g_InfoHeader.."LÔ kim cña b¹n kh«ng ®ñ ")
		return
	end

	local field = map_fields[subs_date][period][type]
	-- ¼ì²éÊÇ·ñÒÑ¾­±»Âò¶Ï
	if (field[ITEMKEY_STAT] == STATUS_OVER) then
		Talk(1, "", format(g_InfoHeader.."S©n khÊu nµy ®· ®­îc %s ®Æt", field[ITEMKEY_ROLE]))
		return
	end
	
	-- ¼ì²é¾ºÍ¶ÊÇ·ñ½áÊø
	if (field[ITEMKEY_STAT] == STATUS_BIDUP) then
		if (cmp_datetime(field[ITEMKEY_CLOSEDATE], field[ITEMKEY_CLOSETIME], curr_date(), curr_time()) <= 0) then
			-- ¾ºÍ¶ÒÑ¾­½áÊø
			Talk(1, "", format(g_InfoHeader.."§Êu gi¸ kÕt thóc, s©n khÊu ®­îc %s mua víi gi¸ %d LÔ kim",
				field[ITEMKEY_ROLE], field[ITEMKEY_COST]))
			return
		end
	end
	
	if (lost_count < over_count) then
		if DelItem(ITEM_COIN[1], ITEM_COIN[2], ITEM_COIN[3], over_count - lost_count) ~= 1 then
			Talk(1, "", g_InfoHeader.."LÔ kim cña b¹n kh«ng ®ñ ")
			return 0;
		end;
	end

	local wife = get_team_lover(PlayerIndex)
	local param2 = encode_param2(period, type)
	local husband_name = GetName(PlayerIndex)
	local wife_name = GetName(wife)

	field[ITEMKEY_STAT] = STATUS_OVER
	field[ITEMKEY_WIFE] = wife_name
	field[ITEMKEY_ROLE] = husband_name
	field[ITEMKEY_COST] = over_count
	
	update_sharedata_int(subs_date, param2, ITEMKEY_STAT, STATUS_OVER)
	update_sharedata_str(subs_date, param2, ITEMKEY_WIFE, wife_name)
	update_sharedata_str(subs_date, param2, ITEMKEY_ROLE, husband_name)
	update_sharedata_int(subs_date, param2, ITEMKEY_COST, over_count)

	SetTask(TASK_WEDDING_COST, over_count)
	SetTask(TASK_WEDDING_DATE, subs_date)
	SetTask(TASK_WEDDING_FIELD, param2)
	
	buy_hint(mon, day, period, type, over_count)
	set_wedding_stat(1)		--±íÊ¾¾º±ê³¡µØ³É¹¦
	WriteLog("[KÕt h«n]:"..GetName().."Dïng thÎ"..(over_count - lost_count).." LÔ kim mua ®øt s©n khÊu,"..subs_date..","..encode_param2(period, type));
	SaveNow();
end

function process_qingqi_nofield()
	Say(g_InfoHeader.."Hai vÞ kh«ng muèn ®Æt s©n khÊu n÷a sao? Sau nµy kh«ng thÓ ®Õn <color=red>thuª<color> n÷a.",
		2,
		"§óng vËy, kh«ng thuª n÷a!/process_qingqi_nofield_confirm",
		"§Ó ta suy nghÜ l¹i/cancel")
end

function process_qingqi_nofield_confirm()
	local sub_date = GetTask(TASK_WEDDING_DATE)
	local sub_year, sub_mon, sub_day = decode_date(sub_date)
	local sub_period, sub_type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	
	if (map_fields[sub_date] ~= nil) then	--Èç¹ûÖ®Ç°Ã»ÓÐ¶©¹ý³¡µØ£¬ÄÇÃ´map_fields[0]¾ÍÊÇnil
		local field = map_fields[sub_date][sub_period][sub_type]
		if (field[ITEMKEY_ROLE] == GetName()) then	--¶©ÁË³¡µØºó»¹¿ÉÒÔÑ¡Ôñ²»ÓÃ³¡µØ½á»éÂð£¿¿ÉÒÔ£¬¹ýÆÚÁË¾Í¿ÉÒÔÖØÐÂÑ¡ÔñÁË
			local caption = nil
			if (field[ITEMKEY_STAT] == STATUS_OVER) then	--Âò¶Ïºó¹ýÆÚÁË
				caption = format(g_InfoHeader.."B¹n ®· ®Æt <color=red>n¨m %d th¸ng %d ngµy %d<color>_<color=red>%s %s<color>, kh«ng thÓ hñy bá",
					sub_year,
					sub_mon,
					sub_day,
					map_period[sub_period][5],
					map_fieldinfo[sub_type][1])
			else	--´¦ÓÚÁìÈ¡µÄÇé¿öÏÂ¹ýÆÚÁË
				caption = format(g_InfoHeader.."B¹n ®· ®Æt <color=red>n¨m %d th¸ng %d ngµy %d_ %s<color> <color=red>%s<color>, kh«ng thÓ hñy bá",
					sub_year,
					sub_mon,
					sub_day,
					map_period[sub_period][5],
					map_fieldinfo[sub_type][1])
			end
			Talk(1, "", caption)
			return
		end
	end
	
	-- Çå³ýÔ¤¶¨ÐÅÏ¢
	clear_subs()
	set_wedding_stat(1)
	Talk(1, "",g_InfoHeader.."Hai vÞ kh«ng kÕt h«n ë S©n khÊu còng kh«ng sao. Hai ng­êi cïng tæ ®éi ®Õn <color=red>Thóy Yªn<color> nhê <color=red>NguyÖt L·o<color> chøng gi¸m cho 2 ng­êi.")
	WriteLog("[KÕt h«n]:"..GetName().."Kh«ng dïng s©n khÊu kÕt h«n.")
end

-- ÏÔÊ¾ÎÒµÄ»éÀñ³¡µØÇé¿ö
function show_myfield()
	local year, mon, day = decode_date(GetTask(TASK_WEDDING_DATE))
	local period, type = decode_param2(GetTask(TASK_WEDDING_FIELD))
	local this_year, this_mon, this_day = decode_date(curr_date())
	local this_hour, this_min, this_sec = decode_time(curr_time())
	local caption = format(g_InfoHeader.."B¹n ®Æt vµo <color=red>th¸ng %d ngµy %d %s<color>-<color=red>%s<color>. B©y giê lµ <color=red>th¸ng %d ngµy %d %d giê %d phót<color>! ",
		mon,
		day,
		map_period[period][5],
		map_fieldinfo[type][1],
		this_mon,
		this_day,
		this_hour,
		this_min)
	Talk(1, "", caption)
end

-- Ç×Ó­
function process_qinying()
	local sub_date = GetTask(TASK_WEDDING_DATE)
	local sub_period, sub_field = decode_param2(GetTask(TASK_WEDDING_FIELD))
	local sub_hour = map_period[sub_period][1]
	local sub_min = map_period[sub_period][2]
	local sub_close_hour = map_period[sub_period][3]
	local sub_close_min	= map_period[sub_period][4]
	local sub_time = encode_time(sub_hour, sub_min, 0)	
	local sub_close_time = encode_time(sub_close_hour,sub_close_min,0);
	local nDesMapID = map_fieldpos[sub_field][1];
	if cmp_datetime(sub_date,sub_close_time,curr_date(), curr_time()) <= 0 then	--Èç¹û¹ýÆÚÁË»¹Ã»½á»é
		clear_subs();			--Çå³ýËùÓÐÔ¤¶¨ÐÅÏ¢
		set_wedding_stat(0);	--±íÊ¾Î´¾º±ê³É¹¦
		set_wedding_step(4);	--»Øµ½ÇëÆÚ½×¶Î
		local selTab = {
				"Ta muèn chän l¹i s©n khÊu/process_qingqi_selectfield",
				"Ta muèn hñy h«n ­íc/disengage_talk",
				"Kh«ng cã g×/cancel",
				}
		Say(g_InfoHeader.."S©n khÊu kÕt h«n ®· qu¸ h¹n",getn(selTab),selTab);
		return 0
	end;
	--Èç¹ûÊ±¼äµ½ÁË²¢ÇÒ½á»é³¡µØ¿ªÁË
	if (cmp_datetime(sub_date, sub_time, curr_date(), curr_time()) <= 0) and mf_GetMissionV(MISSION_ID,MV_FIELD_STATE,nDesMapID) ~= MS_STATE_IDEL then
		Say(g_InfoHeader.."Chóc mõng hai vÞ! §Õn gÆp <color=yellow>Ng­êi dÉn ch­¬ng tr×nh<color> sau ®ã vµo s©n khÊu ®Ó cö hµnh h«n lÔ. NÕu cÇn thuª trang phôc hay trang søc xin gÆp <color=yellow>Hû N­¬ng<color>",
			4,
			"Xem s©n khÊu h«n lÔ/show_myfield",
			"Ta muèn mua mét Ýt vËt phÈm/buy_thing",
			"Ta cÇn th«ng b¸o cho b»ng h÷u, h«n lÔ b¾t ®Çu/#global_annouce(1)",
			"Kh«ng mua/cancel")
	else
		talk = {
			"Ta muèn mua thiÖp mêi (Tèn"..BUY_QINGTIE_PACKET.." tiÒn vµng)/talk_buy_invitation",
			"Ta cÇn th«ng b¸o cho b»ng h÷u ®Õn nhËn thiÖp/#global_annouce(2)",
			"Ta muèn th«ng b¸o cho toµn thÓ ng­êi ch¬i thêi gian kÕt h«n/#global_annouce(3)",						
			"Xem s©n khÊu h«n lÔ/show_myfield",
			"§Ó ta nghÜ l¹i/cancel"
		}
		Say(g_InfoHeader.."S©n khÊu kÕt h«n c¸c ng­¬i ®· ®Æt xong, mäi viÖc liªn quan ®Õn h«n sù nÕu cÇn g× cø ®Õn t×m ta.",
			getn(talk),
			talk)
	end
end

tAnnouce = {
	[1] = {20,"Th«ng b¸o cho tÊt c¶ th©n thuéc b»ng h÷u biÕt thêi gian cö hµnh h«n lÔ tèn <color=yellow>"..ANNOUCE_FRIENDS_BEGIN_COST.."<color> tiÒn vµng, ng­¬i ®ång ý chø?","LÔ thµnh h«n cña T©n lang <color=red>%s<color> vµ t©n n­¬ng <color=red>%s<color> b¾t ®Çu. Nh÷ng ai mang theo thiÖp xin mêi vµo s©n khÊu.","LÔ thµnh h«n cña T©n lang %s vµ T©n n­¬ng %s b¾t ®Çu, nh÷ng ai mang theo thiÖp xin mêi vµo s©n khÊu."},
	[2] = {20,"Th«ng b¸o cho b»ng h÷u ®Õn nhËn thiÖp cÇn<color=yellow>"..ANNOUNCE_INVITAION_COST.."<color> tiÒn vµng, ng­¬i ®ång ý chø?","Mêi b»ng h÷u cña T©n lang <color=red>%s<color> vµ t©n n­¬ng <color=red>%s<color> ®Õn D­¬ng Ch©u gÆp bµ mai nhËn <color=yellow>thiÖp mêi<color>","Mêi b»ng h÷u cña T©n lang %s vµ t©n n­¬ng %s ®Õn D­¬ng Ch©u gÆp bµ mai nhËn thiÖp mêi "},
	[3] = {20,"Th«ng b¸o cho toµn thÓ Vâ l©m biÕt r»ng b¹n s¾p thµnh h«n, cÇn <color=yellow>"..ANNOUNCE_ALL_PLAYER_COST.."<color> tiÒn vµng, ng­¬i ®ång ý chø?","T©n lang <color=red>%s<color> vµ t©n n­¬ng <color=red>%s<color> sÏ cö hµnh h«n lÔ vµo n¨m <color=yellow>%d<color> th¸ng <color=yellow>%d<color> ngµy <color=yellow>%d<color> <color=yellow>%d<color> giê!","T©n lang %s vµ t©n n­¬ng %s sÏ cö hµnh h«n lÔ vµo %d-%d-%d! lóc %d giê."},
	}

function global_annouce(nType)
	Say(g_InfoHeader..tAnnouce[nType][2],
		2,
		format("§ång ý/#global_annouce_confirm(%d)",nType),
		"Hñy bá/cancel")	
end;

function global_annouce_confirm(nType)
	if Pay(tAnnouce[nType][1]*10000) == 1 then
		local nYear,nMonth,nDay = decode_date(GetTask(TASK_WEDDING_DATE));
		local nPeriod = decode_param2(GetTask(TASK_WEDDING_FIELD))
		local caption = format(tAnnouce[nType][3],
			GetName(), 
			GetMateName(),
			nYear,
			nMonth,
			nDay,
			map_period[nPeriod][1])
		local caption1 = format(tAnnouce[nType][4],
			GetName(), 
			GetMateName(),
			nYear,
			nMonth,
			nDay,
			map_period[nPeriod][1])
		AddGlobalNews(caption)
		Msg2Global(caption1);
	else
		Talk(1,"",g_InfoHeader.."Ng­¬i kh«ng ®ñ tiÒn vµng");
	end;
end;

function buy_thing()
	local selTab = {
				"Thuª y phôc h«n lÔ/buy_cloth",
				"Thuª y phôc cho chñ h«n/buy_cloth2",
				"Thuª kiÖu hoa/buy_dooly",
				"Mua nhÉn c­íi/buy_ring",
				"Ta muèn mua thiÖp mêi (Tèn"..BUY_QINGTIE_PACKET.." tiÒn vµng)/talk_buy_invitation",
				"Kh«ng mua/process_qinying",
				};
	Say(g_InfoHeader.."VËt phÈm ®Ó phôc vô h«n lÔ chç ta kh«ng thiÕu, ng­¬i cÇn g×?",getn(selTab),selTab);
end;

function buy_cloth()
	local selTab = {
			"Ta muèn thuª 1 bé lÔ phôc (cÇn"..HIRE_CLOTH_COST.."l­îng tiÒn vµng)/buy_cloth_confirm",
			"Ta muèn thuª 1 bé lÔ phôc cho t©n n­¬ng ( cÇn"..HIRE_CLOTH_COST.."l­îng tiÒn vµng)/buy_bride_cloth_confirm",
			"§Ó ta xem/buy_thing",
			"Kh«ng cÇn ®©u/cancel",
			}
	Say(g_InfoHeader.."Thuª lÔ phôc néi trong 24 giê ph¶i hoµn tr¶. NÕu cÇn thuª lÔ phôc cho t©n n­¬ng th× 2 ng­êi tæ ®éi ®Õn ®©y gÆp ta",getn(selTab),selTab);
end;

function buy_cloth2()
	local selTab = {
			"Ta muèn thuª 1 bé y phôc cho chñ h«n (cÇn"..HIRE_CLOTH2_COST.."l­îng tiÒn vµng)/buy_cloth2_confirm",
			"§Ó ta xem/buy_thing",
			"Kh«ng cÇn ®©u/cancel",
			}
	Say(g_InfoHeader.."Thuª y phôc cho chñ h«n, néi trong 24 giê ph¶i hoµn tr¶.",getn(selTab),selTab);
end;
--ÒÂ·þ±àºÅÓëÃÅÅÉµÄ¶ÔÓ¦¹ØÏµ
tCloth_Faction = {--Í·ÊÎ£¬ÒÂ·þ
		{131,173},
		{143,189},
		{147,193},
		{151,197},
		{155,201},
		{159,205},
		{163,209},
		{550,550},
		{554,554},
		{558,558},
		};
function buy_bride_cloth_confirm()
	if GetTeamSize() ~= 2 then
		Talk(1,"",g_InfoHeader.."Tæ ®éi víi t©n n­¬ng cïng ®Õn thuª lÔ phôc nhÐ!");
		return 0;
	end;
	local nOldPlayerIndex = PlayerIndex;
	local nBrideIndex = get_team_lover(PlayerIndex);
	if get_lover_code(nBrideIndex) ~= Hash(GetName()) then
		Talk(1,"",g_InfoHeader.."Ng­êi ta ch¼ng cã h«n ­íc g× víi ng­¬i");
		return 0;
	end;
	PlayerIndex = nBrideIndex;
	if gf_JudgeRoomWeight(3,50) ~= 1 then
		PlayerIndex = nOldPlayerIndex
		Talk(1,"",g_InfoHeader.."Kho¶ng trèng trong hµnh trang kh«ng ®ñ");
		return 0;
	end;
	local nRetCode,nItemIdx = 0,0;
	local nFaction = GetPlayerFaction();
	local nBody = GetBody();
	PlayerIndex = nOldPlayerIndex;
	if Pay(HIRE_CLOTH_COST*10000) == 1 then
		PlayerIndex = nBrideIndex;
		nRetCode = AddItem(0,108,tCloth_Faction[nFaction][1]+nBody-1,1)
		local nCreateTime = GetTime();
		if nRetCode ~= 0 then
			Msg2SomeOne(nOldPlayerIndex,"Thµnh c«ng: "..GetName().." 1 c¸i nãn")
			Msg2Player(GetName(nOldPlayerIndex).."Cho ng­¬i thuª 1 c¸i nãn");
			WriteLog("[KÕt h«n]:"..GetName(nOldPlayerIndex).."Cho "..GetName(nBrideIndex).."Thuª ®­îc 1 c¸i nãn, nRetCode:"..nRetCode);
		end;
		nRetCode = AddItem(0,109,tCloth_Faction[nFaction][2]+nBody-1,1)
		if nRetCode ~= 0 then
			Msg2SomeOne(nOldPlayerIndex,"Thµnh c«ng: "..GetName().."Thuª ®­îc 1 bé lÔ phôc")
			Msg2Player(GetName(nOldPlayerIndex).."Cho ng­¬i thª 1 bé lÔ phôc");
			WriteLog("[KÕt h«n]:"..GetName(nOldPlayerIndex).."Cho "..GetName(nBrideIndex).."Thuª ®­îc 1 c¸i nãn, nRetCode:"..nRetCode);
		end;
	else
		Talk(1,"",g_InfoHeader.."TiÒn vµng cña b¹n kh«ng ®ñ, cÇn <color=yellow>"..HIRE_CLOTH_COST.."<color> tiÒn vµng.");
	end;
	PlayerIndex = nOldPlayerIndex;
end;
function buy_cloth_confirm()
	if gf_JudgeRoomWeight(3,50) ~= 1 then
		Talk(1,"",g_InfoHeader.."Kho¶ng trèng trong tói hµnh trang kh«ng ®ñ");
		return 0;
	end;
	local nRetCode,nItemIdx = 0,0;
	local nFaction = GetPlayerFaction();
	local nBody = GetBody();
	if Pay(HIRE_CLOTH_COST*10000) == 1 then
		nRetCode = AddItem(0,108,tCloth_Faction[nFaction][1]+nBody-1,1)
		local nCreateTime = GetTime();
		if nRetCode ~= 0 then
			Msg2Player("B¹n thuª ®­îc 1 c¸i nãn");
			WriteLog("[KÕt h«n]:"..GetName().."Thuª ®­îc 1 c¸i nãn, nRetCode:"..nRetCode);
		end;
		nRetCode = AddItem(0,109,tCloth_Faction[nFaction][2]+nBody-1,1)
		if nRetCode ~= 0 then
			Msg2Player("B¹n thuª ®­îc 1 bé lÔ phôc");
			WriteLog("[KÕt h«n]:"..GetName().."B¹n thuª ®­îc 1 bé lÔ phôc, nRetCode:"..nRetCode);
		end;
	else
		Talk(1,"",g_InfoHeader.."TiÒn vµng cña b¹n kh«ng ®ñ, cÇn <color=yellow>"..HIRE_CLOTH_COST.."<color> tiÒn vµng.");
	end;
end;

function buy_cloth2_confirm()
	local selTab = {
				"Nam tiªu chuÈn/#buy_cloth2_confirm2(1)",
				"Nam kh«i ng«/#buy_cloth2_confirm2(2)",
				"N÷ gîi c¶m/#buy_cloth2_confirm2(3)",
				"KiÒu n÷/#buy_cloth2_confirm2(4)",
				"§Ó ta xem/buy_thing",
				}
	Say(g_InfoHeader.."Xin chän size:",getn(selTab),selTab);
end;

function buy_cloth2_confirm2(nBody)
	if gf_JudgeRoomWeight(2,50) ~= 1 then
		Talk(1,"",g_InfoHeader.."Kho¶ng trèng trong tói hµnh trang kh«ng ®ñ");
		return 0;
	end;
	if Pay(HIRE_CLOTH2_COST*10000) == 1 then
		local nRetCode = AddItem(0,109,177+nBody-1,1)
		if nRetCode ~= 0 then
			Msg2Player("B¹n thuª ®­îc 1 bé lÔ phôc cho chñ h«n.");
			WriteLog("[KÕt h«n]:"..GetName().."B¹n thuª ®­îc 1 bé lÔ phôc cho chñ h«n, size:"..nBody)
		end;
	else
		Talk(1,"",g_InfoHeader.."TiÒn vµng cña b¹n kh«ng ®ñ, cÇn <color=yellow>"..HIRE_CLOTH2_COST.."<color> tiÒn vµng.");
	end;	
end;

function buy_dooly()
	local selTab = {
				"§ång ý/buy_dooly_confirm",
				"§Ó ta xem/buy_thing",
				"Kh«ng cÇn ®©u/cancel",
				}
	Say(g_InfoHeader.."Ng­¬i cã muèn thuª <color=yellow>KiÖu hoa<color> kh«ng? Tèn <color=yellow>"..BUY_DOOLY_COST.."<color> tiÒn vµng",getn(selTab),selTab);
end;

function buy_dooly_confirm()
	if gf_JudgeRoomWeight(1,20) ~= 1 then
		Talk(1,"",g_InfoHeader.."Kho¶ng trèng trong tói hµnh trang kh«ng ®ñ");
		return 0;
	end;
	if Pay(BUY_DOOLY_COST*10000) == 1 then
		if AddItem(ITEM_DOOLY[1],ITEM_DOOLY[2],ITEM_DOOLY[3],1) ~= 0 then
			Msg2Player("B¹n thuª ®­îc 1 kiÖu hoa");
			WriteLog("[KÕt h«n]:"..GetName().."B¹n thuª ®­îc 1 kiÖu hoa")
		end;
	else
		Talk(1,"",g_InfoHeader.."TiÒn vµng cña b¹n kh«ng ®ñ, cÇn <color=yellow>"..BUY_DOOLY_COST.."<color> tiÒn vµng.");
	end;
end;

function buy_ring()
	local selTab = {
				"Ta muèn mua nhÉn nam/#buy_ring_confirm(1)",
				"Ta muèn mua nhÉn n÷/#buy_ring_confirm(2)",
				"§Ó ta xem/buy_thing",
				"Kh«ng cÇn ®©u/cancel",
				}
	Say(g_InfoHeader.."Ng­¬i muèn mua <color=yellow>nhÉn<color> kh«ng? CÇn <color=yellow>"..BUY_RING_COST.."<color> tiÒn vµng.",getn(selTab),selTab);
end;

function buy_ring_confirm(nType)
	if gf_JudgeRoomWeight(1,20) ~= 1 then
		Talk(1,"",g_InfoHeader.."Kho¶ng trèng trong tói hµnh trang kh«ng ®ñ");
		return 0;
	end;
	local nBuyRingInfo = GetTask(TASK_BUY_RING);
	if nType == 1 then
		if mod(nBuyRingInfo,10) ~= 0 then
			Talk(1,"",g_InfoHeader.."Ng­¬i ®· mua nhÉn nam, kh«ng thÓ mua tiÕp.");
			return 0;
		end;
	else
		if floor(nBuyRingInfo/10) ~= 0 then
			Talk(1,"",g_InfoHeader.."Ng­¬i ®· mua nhÉn n÷, kh«ng thÓ mua tiÕp.");
			return 0;
		end;
	end;
	if Pay(BUY_RING_COST*10000) == 1 then
		if AddItem(0,102,103+nType,1) ~= 0 then
			if nType == 1 then
				SetTask(TASK_BUY_RING,nBuyRingInfo+1);	--°Ñ¸öÎ»±ä³É1
			else
				SetTask(TASK_BUY_RING,nBuyRingInfo+10);	--°ÑÊ®Î»±ä³É1
			end;
			Msg2Player("B¹n mua ®­îc 1 chiÕc nhÉn");
			WriteLog("[KÕt h«n]:"..GetName().."Mua ®­îc 1 chiÕc nhÉn, lo¹i:"..nType)
		end;
	else
		Talk(1,"",g_InfoHeader.."TiÒn vµng cña b¹n kh«ng ®ñ, cÇn <color=yellow>"..BUY_RING_COST.." <color> tiÒn vµng.");
	end;
end;

-- ¹ºÂòÇëÌû¶Ô»°
function talk_buy_invitation()
	local nRetCode,nItemIdx = 0,0;
	if Pay(BUY_QINGTIE_PACKET*10000) == 1 then
		add_qingtie_packet(1)
	else
		Talk(1,"",g_InfoHeader.."TiÒn vµng cña b¹n kh«ng ®ñ");
	end;
end

map_process = {
	[0] = process_nacai,	-- ÄÉ²É
	[1] = process_nacai_boy,-- ÄÉ²É2
	[2] = process_wenming,	-- ÎÊÃû
	[3] = process_naji,		-- ÄÉ¼ª
	[4] = process_qingqi,	-- ÇëÆÚ
	[5] = process_qinying,	-- Ç×Ó­
}
--³õÊ¼»¯ËùÓÐÊ±¶ÎËùÓÐ³¡µØµÄÐÅÏ¢
function init_date_field()
	local fields = {}
	-- Ê±¶Î
	for j = 1, getn(map_period) do
		fields[j] = {}
		-- ³¡µØ
		for k = 1, getn(map_fieldinfo) do
			fields[j][k] = {
				[ITEMKEY_STAT] = STATUS_IDLE,
				[ITEMKEY_COST] = 0
			}
		end
	end
	return fields
end

apply_count = 0
recv_count 	= 0
inited 		= 0		-- ÊÇ·ñÒÑ¾­³õÊ¼»¯

function main()
	local nDate = tonumber(date("%Y%m%d"))
	if tbGioiHanKetHon[GetGlbValue(GLB_TSK_SERVER_ID)] ~= nil then
		if nDate < tbGioiHanKetHon[GetGlbValue(GLB_TSK_SERVER_ID)] then
			Talk(1,"",g_InfoHeader.."Ch­a ®Õn thêi gian ®¨ng ký kÕt h«n, ng­êi h·y quay l¹i sau nhÐ!!!");		
		do	return	end
		end
	end
	AddRelayShareData("wojiubuxinhuichongming_yj",0,0,CALLBACK_FILE,"callback_main",0,"key","d",0);
end;

function callback_main()	
	if GetGlbValue(GLB_CLOSE_MARRIAGE) == 1 then
		Talk(1,"",g_InfoHeader.."H«n lÔ ®· kÕt thóc, xin hái ng­êi phôc vô.");
		return 0;
	end;
	if (GetTask(TASK_WEDDING_DATE) == 0 and GetMateName() ~= "") or --Ñ¡Ôñ²»ÓÃ³¡µØ½á»éºó
		(is_field_timeout() == 1 and GetMateName() ~= "") or --³¡µØ¹ýÆÚ½á»éºó
		(GetSex() == 2 and GetMateName() ~= "") then	--Å®·½½á»éºó
		local selTab= {
				"§a t¹!/cancel",
				}
		Say(g_InfoHeader.."§Õn c¶m ¬n ta ­? Chóc c¸c ng­¬i h¹nh phóc!",getn(selTab),selTab);
		return 0;
	end;
	if (inited == 0) then
		init()
		return
	end
	
	local step = get_wedding_step()
	-- DEBUG
	gf_ShowDebugInfor(format("main step:%d", step))
	local process = map_process[step]
	if (process) then
		process()
	end
end


function init()
	apply_count = 0
	recv_count = 0
	local days = future_days(0, FUTURE_DAY_COUNT + 2)
	for i = 1, getn(days) do
		-- ÈÕÆÚ
		local date = days[i]
		-- ÏÈ°Ñ³¡µØÔ¤¶©ÐÅÏ¢È«²¿ÉèÎª¿ÕÏÐ
		map_fields[date] = init_date_field()
	
		-- ÏòrelayÇëÇó³¡µØÔ¤¶©ÐÅÏ¢
		for j = 1, getn(map_period) do
			for k = 1, getn(map_fieldinfo) do
				local param2 = encode_param2(j, k)
				ApplyRelayShareData(KEY_WEDDING, date, param2, CALLBACK_FILE, "hook_recvsubs")
				apply_count = apply_count + 1
			end
		end
	end
	WriteLog("[KÕt h«n]: S©n khÊu kÕt h«n");
end

-- DEBUG
-- »Øµ÷º¯Êý£º¶ÁÈ¡³¡µØÔ¤¶©ÐÅÏ¢
function hook_clearsubs(...)
	-- Do nothig	
end

-- »Øµ÷º¯Êý£º¶ÁÈ¡³¡µØÔ¤¶©ÐÅÏ¢
function hook_recvsubs(key, param1, param2, count)
	-- ¸Ã³¡µØ¸ÃÊ±¶Î¿ÕÏÐ
	if (count ~= 0) then
		-- DEBUG
		gf_ShowDebugInfor(format("\nhook_recvsubs(%d,%d,%d)", param1, param2, count))
		local date = param1
		local period, type = decode_param2(param2)	
		local stat, index = GetRelayShareDataByKey(KEY_WEDDING, param1, param2, ITEMKEY_STAT)
		local wife, index = GetRelayShareDataByKey(KEY_WEDDING, param1, param2, ITEMKEY_WIFE)
		local role, index = GetRelayShareDataByKey(KEY_WEDDING, param1, param2, ITEMKEY_ROLE)
		local cost, index = GetRelayShareDataByKey(KEY_WEDDING, param1, param2, ITEMKEY_COST)
		local close_date, index = GetRelayShareDataByKey(KEY_WEDDING, param1, param2, ITEMKEY_CLOSEDATE)
		local close_time, index = GetRelayShareDataByKey(KEY_WEDDING, param1, param2, ITEMKEY_CLOSETIME)
		
		if (map_fields[date] == nil) then
			-- DEBUG
			gf_ShowDebugInfor(format("\nhook_recvsubs: init map_fields[%d]", date))
			map_fields[date] = {}
		end
		if (map_fields[date][period] == nil) then
			map_fields[date][period] = {}
		end
		if (map_fields[date][period][type] == nil) then
			map_fields[date][period][type] = {}
		end
		
		local field = map_fields[date][period][type]	--fieldÏàµ±ÓÚÈ«¾Ö±äÁ¿map_fields[date][period][type]µÄÒ»¸öÒýÓÃ
		field[ITEMKEY_STAT] = stat
		field[ITEMKEY_WIFE] = wife
		field[ITEMKEY_ROLE] = role
		field[ITEMKEY_COST] = cost
		if (stat ~= STATUS_OVER) then
			field[ITEMKEY_CLOSEDATE] = close_date
			field[ITEMKEY_CLOSETIME] = close_time
		end
	end
	recv_count = recv_count + 1
	if (recv_count == apply_count) then
		inited = 1
		main()
	end
	WriteLog("[KÕt h«n]: S©n khÊu kÕt h«n kÕt thóc");
end
