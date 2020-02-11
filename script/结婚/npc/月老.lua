Include("\\script\\½á»é\\marriage_head.lua");

CALLBACK_FILE		= "\\script\\½á»é\\npc\\ÔÂÀÏ.lua"		-- »Øµ÷ÎÄ¼þÃû
MATE_TITLE			= 
{
	[1] = "Thª tö",
	[2] = "Tr­îng phu"
}
ITEM_LETTER			= {2, 1, 535}		-- ÐÝÊé
g_InfoHeader = "<color=green>NguyÖt L·o<color>:";

function main()
	AddRelayShareData("wojiubuxinhuichongming_yj",0,0,CALLBACK_FILE,"callback_main",0,"key","d",0);
end;

function callback_main()	--È·±£Íæ¼Òµã»÷µÄÊ±ºòRelayÃ»å´»ú£¬²»¹ý²»±£Ö¤µã»÷ºó²»å´
	if GetGlbValue(GLB_CLOSE_MARRIAGE) == 1 then
		Talk(1,"",g_InfoHeader.."H«n lÔ ®· kÕt thóc, xin hái ng­êi phôc vô.");
		return 0;
	end;
	if GetMateName() == "" and GetTask(TASK_MARRYDATE) ~= 0 then
		Talk(1,"",g_InfoHeader.."B¹n ®· ®­îc tù do");
		clear_marriage_info(0);
		return 0;
	end;
	if (is_married(PlayerIndex) == 1) then
		local caption = nil
		if (GetSex() == 1) then
			caption = "B»ng h÷u ®Õn t×m l·o cã viÖc g× kh«ng?"
		else
			caption = "C« n­¬ng ®Õn t×m l·o cã viÖc g× kh«ng?"
		end
		Say(g_InfoHeader..caption,
			2,
			"Ta muèn hñy bá h«n ­íc/divorce_talk",
			"Kh«ng cã viÖc g×/cancel")
		return
	elseif GetTask(TASK_WEDDING_LOVER) == 0 then
		hint_step(1)
		Talk(1, "", g_InfoHeader.."NÕu «ng t¬ bµ nguyÖt ®· se duyªn kÕt chØ, ng­¬i cïng ý trung nh©n ®Õn D­¬ng Ch©u gÆp bµ mai ®Ó lo viÖc h«n sù.")
		return
	end
	
	if (check_bride_condition() == 1) then
		Say(g_InfoHeader.."H«n nh©n lµ chuyÖn ®¹i sù, 2 ng­¬i ®· nghÜ kü ch­a?", 2,
			"Hai ta ®· quyÕt ®Þnh råi/do_marry",
			"§Ó suy nghÜ thªm./cancel")
	end
end

function do_marry()
	if get_wedding_stat() ~= 1 then
		Talk(1,"",g_InfoHeader.."§îi khi t×m ®­îc s©n khÊu kÕt h«n, ta sÏ gióp 2 ng­¬i thµnh h«n");
		return 0;
	end;
	if (check_bride_condition() == 1) then
		Talk(1, "", g_InfoHeader.."Hái xem c« n­¬ng Êy cã muèn kÕt h«n víi ng­¬i kh«ng? C¶ 2 cïng ®ång ý míi ®­îc.")
		local lover = get_team_lover(PlayerIndex)
		SetPlayerScript(CALLBACK_FILE, lover)
		Say2SomeOne(lover,
			format(g_InfoHeader.."C« n­¬ng nµy, vÞ thiÕu hiÖp %s ®©y muèn cïng c« thµnh h«n, cã ®ång ý kh«ng?", GetName(PlayerIndex)),
			2,
			"§ång ý/agree_marriage",
			"Kh«ng ®ång ý/disagree_marriage")
	end
end

function agree_marriage()
	if (check_bridegroom_condition() == 1) then
		local lover = get_team_lover(PlayerIndex)
	
		marriage_setting();

		hint_step(6)
		SetPlayerScript(CALLBACK_FILE, lover)
		local msg = g_InfoHeader.."NÕu c¸c ng­¬i muèn tiÕp nhËn <color=yellow>NhiÖm vô phu thª <color> hay häc <color=yellow>Kü n¨ng h«n nh©n<color> th× ®Õn<color=yellow>Thµnh D­¬ng Ch¸u<color> t×m <color=green>X¶o n÷<color>, c« ta ë gÇn <color=green>Bµ mai<color>. "
		Talk2SomeOne(lover, 1, "", msg)
		Talk(1, "", msg)
	end
end

function disagree_marriage()
	if (check_bridegroom_condition() == 1) then
		local lover = get_team_lover(PlayerIndex)

		SetPlayerScript(CALLBACK_FILE, lover)
		local msg = g_InfoHeader.."Xem ra t©m ý cña c¸c ng­¬i vÉn ch­a t­¬ng th«ng, suy nghÜ kü råi h·y ®Õn gÆp ta."
		Talk2SomeOne(lover, 1, "", msg)
		Talk(1, "", msg)
	end
end

-- ¼ì²éÐÂÀÉÊÇ·ñÂú×ã½á»éÌõ¼þ
function check_bridegroom_condition()
	-- ±ØÐëÄÐ·½×ö¶Ó³¤
	if (GetTeamSize() ~= 2 or GetCaptainName() == GetName()) then
		Talk(1, "", g_InfoHeader.."Hai ng­êi cïng tæ ®éi do bªn nam lµm ®éi tr­ëng ®Õn gÆp ta ®Ó xin kÕt h«n.")
		return 0
	end

	local lover = get_team_lover(PlayerIndex)
	if (is_married(PlayerIndex) == 1) then
		Talk(1, "", g_InfoHeader.."Ng­¬i ®· lµ ng­êi kÕt h«n sao l¹i cßn ong b­ím nh­ vËy")
	elseif (GetSex(lover) ~= 1 or is_married(lover) == 1) then
		Talk(1, "", g_InfoHeader.."Xem ra c¸c ng­¬i nhÇn lÉn råi, NguyÖt L·o nµy chØ gióp c¸c ng­¬i nªn phu thª, nh÷ng c¸i kh¸c kh«ng ph¶i viÖc cña ta.")
	elseif (get_lover_code(lover) ~= Hash(GetName(PlayerIndex))) then		
		Talk(1, "", g_InfoHeader.."D©y t¬ hång ch­a liªn kÕt ng­¬i víi vÞ thiÕu hiÖp ®ã.")
	elseif (get_lover_code(PlayerIndex) ~= Hash(GetName(lover))) then
		Talk(1, "", g_InfoHeader.."D©y t¬ hång ch­a liªn kÕt ng­¬i víi c« n­¬ng ®ã.")
	else
		return 1
	end
	return 0
end

-- ¼ì²éÊÇ·ñÂú×ã½á»éÌõ¼þ
function check_bride_condition()
	-- ±ØÐëÄÐ·½×ö¶Ó³¤
	if GetSex() == 2 then
		Talk(1, "", g_InfoHeader.."C« n­¬ng ®Õn t×m l·o cã viÖc g× kh«ng?")
		return 0;
	end;
	if (GetTeamSize() ~= 2 or GetCaptainName() ~= GetName()) then
		Talk(1, "", g_InfoHeader.."§­a ý trung nh©n ®Õn gÆp ta.")
		return 0
	end

	local lover = get_team_lover(PlayerIndex)
	if (is_married(PlayerIndex) == 1) then
		Talk(1, "", g_InfoHeader.."Ng­¬i ®· lµ ng­êi kÕt h«n sao l¹i cßn ong b­ím nh­ vËy")
	elseif (GetSex(lover) == 1 or is_married(lover) == 1) then
		Talk(1, "", g_InfoHeader.."Xem ra c¸c ng­¬i nhÇn lÉn råi, NguyÖt L·o nµy chØ gióp c¸c ng­¬i nªn phu thª, nh÷ng c¸i kh¸c kh«ng ph¶i viÖc cña ta.")
	elseif (get_lover_code(lover) ~= Hash(GetName(PlayerIndex))) then		
		Talk(1, "", g_InfoHeader.."C« n­¬ng ®©y víi ng­¬i ch­a ®­îc «ng t¬ bµ nguyÖt kÕt chØ se duyªn")
	elseif (get_lover_code(PlayerIndex) ~= Hash(GetName(lover))) then
		Talk(1, "", g_InfoHeader.."D©y t¬ hång ®· buéc ng­¬i vµ c« n­¬ng ®ã")
	else
		return 1
	end
	return 0
end

-- Àë»é
function divorce_talk()
	local seperation_date = GetTask(TASK_SEPERATION_DATE)
	if (seperation_date ~= 0) then
		seperation_divorce(seperation_date, lover)
	else
		-- Ö±½ÓÀë»é
		direct_divorce()
	end
end

-- ·Ö¾ÓÀë»é
function seperation_divorce(seperation_date, lover)
	local day = seperation_date
	for i = 1, INTERVAL_SEPERATION do
		day = next_date(day)
	end
	if (curr_date() >= day) then
		-- ¹ýÁËÆßÌì
		Say(g_InfoHeader.."§· 7 ngµy råi, suy nghÜ kü ch­a? Ng­¬i muèn chia tay hay gi¶i hßa ®©y?",
			5,
			"Chia tay/part",
			"Gi¶i hßa/reconcile_confirm",
			"Ta kh«ng ®îi ®­îc n÷a, ta muèn ly h«n./direct_divorce_letter",
			"T×nh c¶m cña ta ®· r¹n nøc råi/direct_divorce_estrangement",
			"§Ó ta suy nghÜ l¹i/cancel")
	else
		-- »¹Ã»µ½ÆßÌì
		Say(g_InfoHeader.."VÉn ch­a hÕt 7 ngµy, c¸c ng­¬i suy nghÜ thªm ®i.",
			4,
			"Gi¶i hßa/reconcile_confirm",
			"Ta kh«ng ®îi ®­îc n÷a, ta muèn ly h«n./direct_divorce_letter",
			"T×nh c¶m cña ta ®· r¹n nøc råi/direct_divorce_estrangement",
			"Hñy bá/reconcile_cancel")
	end
end

-- ·Ö¾Ó¸´ºÏÈ·¶¨
function reconcile_confirm()
	-- ·Ö¾ÓÀë»é±ØÐë×é¶Ó
	local lover = get_team_lover(PlayerIndex)
	if (lover == 0 or GetMateName() ~= GetName(lover)) then
		if (GetSex() == 1) then
			Talk(1, "", g_InfoHeader.."Ng­¬i vµ thª tö cïng tæ ®éi ®Õn gÆp ta")
		else
			Talk(1, "", g_InfoHeader.."Ng­¬i vµ phu qu©n cïng tæ ®éi ®Õn gÆp ta")
		end
	else
		SetTask(TASK_SEPERATION_DATE, 0)
		SetTask(TASK_SEPERATION_DATE, 0,  0, lover)
		Talk(1, "", g_InfoHeader.."Ta ®· hµn g¾n c¸c ng­¬i l¹i, tõ nay ta kh«ng muèn c¸c ng­¬i ®Õn gÆp ta ®Ó ly h«n n÷a. Chóc 2 ng­¬i b¸ch niªn giai l·o!")
	end
end

-- ·Ö¾Ó¸´ºÏÈ¡Ïû
function reconcile_cancel()
	Talk(1, "", g_InfoHeader.."Kh«ng muèn gi¶i hßa µ? VÉn ch­a hÕt 7 ngµy, ng­¬i suy nghÜ thªm ®i nhÐ!")
end

-- ·ÖÊÖ
function part()
	local lover = get_team_lover(PlayerIndex)
	if (lover == 0 or GetMateName() ~= GetName(lover)) then
		Talk(1, "", g_InfoHeader.."Ng­¬i vµ" .. MATE_TITLE[GetSex()] .. "tæ ®éi víi nhau råi ®Õn gÆp ta")
		return
	end
	Talk(1, "", g_InfoHeader.."VÉn muèn ly h«n µ? §­îc," .. MATE_TITLE[GetSex()])

	-- Ñ¯ÎÊÅäÅ¼
	SetPlayerScript(CALLBACK_FILE, lover)
	Say2SomeOne(lover, g_InfoHeader.."Ng­¬i vÉn muèn ly h«n µ?",
		2,
		"§ång ý/agree_part",
		"Hñy bá/disagree_part")
end

-- Í¬ÒâÀë»é
function agree_part()
	local lover = get_team_lover(PlayerIndex)
	if (lover ~= 0 and GetMateName() == GetName(lover)) then
		UnMarry()
		local caption = g_InfoHeader.."C¸c ng­¬i ®· hñy bá h«n ­íc, tõ nay ®­êng ai nÊy ®i!"
		Talk(1, "", caption)
		Talk2SomeOne(lover, 1, "", caption)
		clear_marriage_info(3);	--·Ö¾Ó7ÌìºóÀë»é
	end
end

-- ²»Í¬ÒâÀë»é
function disagree_part()
	local lover = get_team_lover(PlayerIndex)
	if (lover ~= 0 and GetMateName() == GetName(lover)) then
		Talk2SomeOne(lover,
			1, "", g_InfoHeader.."Hai ng­¬i vÉn ch­a thèng nhÊt ý kiÕn, suy nghÜ thªm ®i nhÐ.")			
	end
end

-- Ö±½ÓÀë»é
function direct_divorce()
	Say(g_InfoHeader.."Hñy bá h«n ­íc? Ng­¬i suy nghÜ kü ch­a?",
		2,
		"§ång ý/direct_divorce_option",
		"Hñy bá/cancel")
end

-- Ö±½ÓÀë»éÑ¡Ïî
function direct_divorce_option()
	Say(g_InfoHeader.."Muèn ly h«n ­? §· thÕ th× ta còng kh«ng cßn c¸ch nµo. H·y ®Õn Ngù c¸c mua 1 tê <color=yellow>GiÊy ly h«n<color> x¸c nhËn c¸c ng­¬i ®· kh«ng cßn t×nh c¶m. Ly h«n trÞ §ång T©m cña c¸c ng­¬i sÏ bÞ trõ <color=red>50<color> ®iÓm.",
		4,
		"Ta ®· cã giÊy ly h«n!/direct_divorce_letter",
		"T×nh c¶m cña ta ®· r¹n nøc råi/direct_divorce_estrangement",
		"Chóng t«i ®· ®Õn/direct_divorce_team",
		"§Ó ta suy nghÜ l¹i/cancel")
	-- TODO: here
end

-- ÐÝÊé
function direct_divorce_letter()
	if (GetItemCount(ITEM_LETTER[1], ITEM_LETTER[2], ITEM_LETTER[3]) == 0) then
		Talk(1, "", g_InfoHeader.."Kh«ng cã giÊy ly h«n lµm sao ly h«n? §Õn {Ngù c¸c} mua råi quay l¹i ®©y!")
	else
		Say(g_InfoHeader.."Ng­¬i quyÕt ®Þnh ly h«n th× ta còng kh«ng cßn c¸ch nµo, nh­ng ®é h¶o c¶m sÏ gi¶m xuèng = 0! Suy nghÜ kü ch­a?",
			2,
			"§ång ý/direct_divorce_letter_confirm",
			"Hñy bá/cancel")
	end
end

-- Àë»é
--nType:0ÊÇÅäÅ¼Àë»éºó×Ô¼ºµãÔÂÀÏÀë»é£¬1ÊÇÖ±½ÓÀë»é£¬2ÊÇÍ¬ÐÄÖµÐ¡ÓÚ50Àë»é£¬3ÊÇ·Ö¾Ó7ÌìºóÀë»é
function divorce(nType)
	UnMarry()
	SetTask(TASK_LOVEGRADE, 0)
	if (GetSex() == 1) then
		Talk(1, "",
			g_InfoHeader.."Ng­¬i ®· ly h«n, ®Ó ta th«ng b¸o víi n­¬ng tö tr­íc cña ng­¬i")
	else
		Talk(1, "",
			g_InfoHeader.."Ng­¬i ®· ly h«n, ®Ó ta th«ng b¸o víi vÞ phu qu©n tr­íc cña ng­¬i.")
	end
	clear_marriage_info(nType);
end

function clear_marriage_info(nType)
	local szTaskInfo = "";
	for i=2000,2029 do
		szTaskInfo = szTaskInfo.."("..i..":"..GetTask(i)..");"
	end;
	clear_task();
	ma_skill_remove()
	WriteLog("[KÕt h«n]:"..GetName().."BiÕn l­îng nhiÖm vô tr­íc li h«n:"..szTaskInfo);
	WriteLog("[KÕt h«n]:"..GetName().."Li h«n råi, lo¹i li h«n:"..tostring(nType));
end;

-- ÐÝÊéÈ·ÈÏ
function direct_divorce_letter_confirm()
	local genre = ITEM_LETTER[1]
	local detail = ITEM_LETTER[2]
	local particular = ITEM_LETTER[3]
	if (GetItemCount(genre, detail, particular) > 0) then
		DelItem(genre, detail, particular, 1)
		divorce(1)
	end
end

-- ¸ÐÇéÆÆÁÑ
function direct_divorce_estrangement()
	if (GetTask(TASK_LOVEGRADE) > 50) then
		Talk(1, "", g_InfoHeader.."Ta thÊy 2 ng­¬i vÉn cßn t×nh c¶m, h·y suy nghÜ l¹i ®i.")
	else
		Say(g_InfoHeader.."Ly h«n ®é h¶o c¶m cña c¸c ng­¬i sÏ = 0. C¸c ng­¬i suy nghÜ kü ®i",
			2,
			"§ång ý/#divorce(2)",
			"Hñy bá/cancel")
	end
end

-- ×é¶ÓÀë»é
function direct_divorce_team()
	local count = GetTeamSize()
	local title = MATE_TITLE[GetSex()]
	if (count == 0) then
		Talk(1, "", g_InfoHeader.."Thêi gian sö dông" .. title .. "ë ®©u, sao ta kh«ng thÊy")
	elseif (count > 2) then
		Talk(1, "", g_InfoHeader.."ChuyÖn nh­ thÕ nµy ®Ó ng­êi kh¸c lo, ng­¬i vµ" .. title .. "2 ng­êi l¹i ®©y.")
	else
		local lover = get_team_lover(PlayerIndex)
		if (GetName(lover) ~= GetMateName()) then
			Talk(1, "", g_InfoHeader.."Thêi gian sö dông" .. title .. "ë ®©u, sao ta kh«ng thÊy")
		else
			Say(g_InfoHeader.."C¸c ng­¬i quyÕt ®Þnh ly h«n ­?",
				2,
				"§ång ý/direct_divorce_team_confirm",
				"Hñy bá/cancel")
		end
	end
end

-- ×é¶ÓÀë»éÈ·¶¨
function direct_divorce_team_confirm()
	local lover = get_team_lover(PlayerIndex)
	if (lover ~= 0 and GetName(lover) == GetMateName()) then
		Talk(1, "", g_InfoHeader.."Ta hái ng­¬i" .. MATE_TITLE[GetSex()])
	
		-- Ñ¯ÎÊÅäÅ¼
		SetPlayerScript(CALLBACK_FILE, lover)
		Say2SomeOne(lover, g_InfoHeader.."Ng­¬i ®ång ý ly h«n chø?",
			2,
			"§ång ý/agree_seperation",
			"Hñy bá/disagree_part")
	end
end

-- Í¬Òâ·Ö¾Ó
function agree_seperation()
	local lover = get_team_lover(PlayerIndex)
	if (lover ~= 0 and GetName(lover) == GetMateName()) then
		local day = curr_date()
		SetTask(TASK_SEPERATION_DATE, day,  0, lover)
		SetTask(TASK_SEPERATION_DATE, day)

		local caption = g_InfoHeader.."Ta cho c¸c ng­¬i thªm <color=yellow>7 ngµy<color> ®Ó suy nghÜ, sau ®ã ®Õn gÆp ta. NÕu lóc ®ã c¸c ng­¬i vÉn quyÕt ®Þnh ly h«n th× ta còng kh«ng cßn c¸ch nµo"
		Talk(1, "", caption)
		Talk2SomeOne(lover, 1, "", caption)
	end
end
--´å³¤£º2007-05-28Ôö¼ÓÀë»é¼¼ÄÜÉ¾³ý
function ma_skill_remove()
	for i = 865,867 do
		if GetSkillLevel(i) ~= 0 then
			RemoveSkill(i)
		end
	end
	return
end
