-- Ô½ÄÏ2008 51»î¶¯

Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\randomitem.lua");

SWITCH_2008_51			= 1;
DATE_2008_51_START_V	= 20080430;		-- 51»î¶¯¿ªÊ¼ÈÕÆÚ(Õ½³¡&ÑÌ»¨)
DATE_2008_51_END_V		= 20080501;		-- 51»î¶¯½áÊøÈÕÆÚ(Õ½³¡&ÑÌ»¨)

DATE_2008_51_START_GEM	= 20080426;		-- 51»î¶¯¿ªÊ¼ÈÕÆÚ(±¦Ê¯)
DATE_2008_51_END_GEM	= 20080518;		-- 51»î¶¯¿ªÊ¼ÈÕÆÚ(±¦Ê¯)

DATE_2008_51_ITEM_END	= 20080530;		-- ÎïÆ·Ê¹ÓÃ½ØÖÁÈÕÆÚ

TASK_ID_VIET_2008_51_GEM_EXP	= 2422;	-- ±¦Ê¯»î¶¯¾­Ñé±äÁ¿

G_MAX_EXP	= 30000000;

function viet_51_battle_award(is_main_batter, is_winner)
	if is_viet_51_opened() == 1 then
		gf_SetLogCaption("20080501");
		Msg2Player("NhËn ®­îc phÇn th­ëng chiÕn tr­êng Tèng Liªu.");
		gf_Modify( "Exp", 500000 * (1 + is_winner) * (1 + is_main_batter) );
		gf_SetLogCaption("");
	end
end

function is_viet_51_opened(is_gem)
	local nDate = tonumber(date("%Y%m%d"));

	if is_gem == nil or is_gem == 0 then
		if nDate >= DATE_2008_51_START_V and nDate <= DATE_2008_51_END_V then
			return SWITCH_2008_51;
		end
	else
		if nDate >= DATE_2008_51_START_GEM and nDate <= DATE_2008_51_END_GEM then
			return SWITCH_2008_51;
		end
	end
	return 0;
end

function viet_2008_51_business_award(nFinishedTimes)
	if is_viet_51_opened(1) == 0 then
		return
	end
	if nFinishedTimes > 0 and mod(nFinishedTimes, 2) == 0 then
		gf_SetLogCaption("viet_2008_51_business_award");
		gf_AddItemEx( {2,1,30004, 1, 1}, "R­¬ng B¶o Th¹ch");
		gf_SetLogCaption("");
	end
end

function viet_2008_51_faction_award(nTimes)
	if is_viet_51_opened(1) == 0 then
		return
	end
	if nTimes >= 20 then
		return
	end
	local tAward = {3,3,6,6,9,12,15,18};
	local nAward = floor(GetLevel()/10 - 1);
	if nAward == 0 then
		return
	end

	gf_SetLogCaption("viet_2008_51_faction_award");
	gf_AddItemEx( {2,1,30004,tAward[nAward], 1}, "R­¬ng B¶o Th¹ch");
	gf_SetLogCaption("");
end

-- ²Ø½£É±ËÀ1¸ö¹Ö
function viet_2008_51_cangjian_award(nNpcIdx)
	if is_viet_51_opened(1) == 0 then
		return
	end
	if random(100) < 3 then
		gf_SetLogCaption("viet_2008_51_cangjian_award");
--		gf_AddItemEx( {2,1,30004,1, 1}, "±¦Ê¯Ïä");
		DropItem(2,1,30004,GetNpcWorldPos(nNpcIdx));
		gf_SetLogCaption("");
	end
end

-- ÉñÃØÉÌÈË¶Ô»°
function viet_2008_51_gem_talk()
	if is_viet_51_opened(1) == 0 then
		Say("Ha ha, cuéc ®êi vÉn ®Ñp sao...", 0);
		return
	end
	Say("Chóc mõng ngµy lÔ 30 th¸ng 4 vµ Quèc tÕ lao ®éng.",
		3,
		"\n§æi phÇn th­ëng/talk_award",
		"\nNéi dung ho¹t ®éng/talk_help_1",
		"Rêi khái/nothing");
end
function talk_help_1()
	Say( "Trong thêi gian ho¹t ®éng, tham gia ho¹t ®éng th­¬ng héi, nhiÖm vô s­ m«n hoÆc Tµng KiÕm S¬n Trang cã thÓ nhËn ®­îc R­¬ng b¶o th¹ch, bªn trong cã chøa 1 viªn Ngò Linh Th¹ch, Lam Tinh Th¹ch hoÆc Hoµng B¶o Th¹ch, cã thÓ dïng c¸c lo¹i b¶o th¹ch nµy ®Ó ®æi phÇn th­ëng t¹i ®©y.",
		2,
		"PhÇn th­ëng gåm nh÷ng g×?/talk_help_2",
		"Ch¼ng cã g× vui c¶/nothing()");
end
function talk_help_2()
	Say( " 2 Lam Tinh Th¹ch + 2 Hoµng B¶o Thach + 10 b¹c = 20.000 ®iÓm kinh nghiÖm\n 1 Ngò Linh Th¹ch + 2 Lam Tinh Th¹ch + 2Hoµng B¶o Th¹ch + 50 b¹c = 80.000 ®iÓm kinh nghiÖm, cã kh¶ n¨ng nhËn ®­îc phÇn th­ëng kh¸c.\nNg­êi ch¬i <color=red>cÊp 20<color> trë lªn míi cã thÓ tham gia ho¹t ®éng nµy, thêi gian ho¹t ®éng tõ <color=red>26-04-2008 ®Õn 24h00 18-05-2008<color>..",
		1,
		"Ta ®· hiÓu råi./viet_2008_51_gem_talk",
		"Rêi khái/nothing");
end
function talk_award()
	if GetLevel() < 20 then
		Say("§îi ®Õn cÊp 20 h·y ghÐ l¹i..", 0);
		return
	end
	if GetTask(TASK_ID_VIET_2008_51_GEM_EXP) >= 30000000 then
		Say("Th«ng qua ho¹t ®éng nµy, mçi ng­êi ch¬i chØ cã thÓ nhËn ®­îc tèi ®a 30 triÖu ®iÓm kinh nghiÖm.", 0);
		return
	end
	Say("Muèn ®æi phÇn th­ëng nµo??",
		3,
		"\n2 Lam Tinh Th¹ch + 2 Hoµng B¶o Th¹ch + 10 b¹c = 20.000 ®iÓm kinh nghiÖm./talk_award_1",
		"\n1 Ngò Linh Th¹ch + 2 Lam Tinh Th¹ch + 2 Hoµng B¶o Th¹ch + 50 b¹c = 80.000 ®iÓm kinh nghiÖm, ngoµi ra cã kh¶ n¨ng nhËn ®­îc phÇn th­ëng kh¸c../talk_award_2",
		"Rêi khái/nothing");
end

function talk_award_1()
	local gem_exp = GetTask(TASK_ID_VIET_2008_51_GEM_EXP);
	local msg = "Cã ®ång ý dïng 2 Lam Tinh Th¹ch + 2 Hoµng B¶o Th¹ch + 10 b¹c ®æi lÊy 20.000 ®iÓm kinh nghiÖm kh«ng??";
	if gem_exp + 20000 > G_MAX_EXP then
		local exp = G_MAX_EXP - gem_exp;
		msg = "Th«ng qua ho¹t ®éng nµy, mçi ng­êi ch¬i chØ cã thÓ nhËn ®­îc tèi ®a 30 triÖu ®iÓm kinh nghiÖm."..gem_exp.." ®iÓm kinh nghiÖm, v× thÕ lÇn trao ®æi nµy chØ cã thÓ nhËn ®­îc "..exp.." ®iÓm kinh nghiÖm.\n§ång ý dïng 2 Lam Tinh Th¹ch + 2 Hoµng B¶o Th¹ch + 10 b¹c ®æi lÊy "..exp.." ®iÓm kinh nghiÖm kh«ng??";
	end
	Say(msg,
		2,
		"Ta ®ång ý ®æi./talk_award_1_yes",
		"Ta suy nghÜ l¹i!/talk_award");
end

function talk_award_1_yes()
	if GetItemCount(2, 1, 30006) < 2 then
		Say("Lam Tinh Th¹ch mang theo kh«ng ®ñ.!", 0);
		return
	end
	if GetItemCount(2, 1, 30007) < 2 then
		Say("Hoµng B¶o Th¹ch mang theo kh«ng ®ñ.!", 0);
		return
	end
	if GetCash() < 1000 then
		Say("Kh«ng ®ñ ng©n l­îng..", 0);
		return
	end
	local gem_exp = GetTask(TASK_ID_VIET_2008_51_GEM_EXP);
	local exp = 20000;
	if gem_exp + 20000 > G_MAX_EXP then
		exp = G_MAX_EXP - gem_exp;
	end

	if DelItem(2, 1, 30006,2) and DelItem(2, 1, 30007,2) and Pay(1000) then
		SetTask(TASK_ID_VIET_2008_51_GEM_EXP, GetTask(TASK_ID_VIET_2008_51_GEM_EXP) + exp);
		gf_SetLogCaption("viet_2008_51_gem_award");
		gf_Modify("Exp", exp);
		gf_SetLogCaption("");
	end
end

function talk_award_2()
	local gem_exp = GetTask(TASK_ID_VIET_2008_51_GEM_EXP);
	local msg = "Cã ®ång ý dïng 1 Ngò Linh Th¹ch + 2 Lam Tinh Th¹ch + 2 Hoµng B¶o Th¹ch + 50 b¹c = 80.000 ®iÓm kinh nghiÖm kh«ng? Ngoµi ra cßn cã thÓ nhËn ®­îc phÇn th­ëng kh¸c..";
	if gem_exp + 80000 > G_MAX_EXP then
		local exp = G_MAX_EXP - gem_exp;
		msg = "Th«ng qua ho¹t ®éng nµy, mçi ng­êi ch¬i chØ cã thÓ nhËn ®­îc tèi ®a 30 triÖu ®iÓm kinh nghiÖm."..gem_exp.." ®iÓm kinh nghiÖm, v× thÕ lÇn trao ®æi nµy chØ cã thÓ nhËn ®­îc "..exp.." ®iÓm kinh nghiÖm.\n§ång ý dïng 1 Ngò Linh Th¹ch + 2 Lam Tinh Th¹ch + 2 Hoµng B¶o Th¹ch + 10 b¹c ®æi lÊy "..exp.." ®iÓm kinh nghiÖm kh«ng? Ngoµi ra cßn cã x¸c suÊt nhËn ®­îc phÇn th­ëng kh¸c..";
	end
	Say(msg,
		2,
		"Ta ®ång ý ®æi./talk_award_2_yes",
		"Ta suy nghÜ l¹i!/talk_award");
end
t_gem_item_award = {
	{68489,         "Ch­a", {0,0,0,1,1} },
	{    1,     "Chiªm Y Phæ", {0,107,66,1,1} },
	{    5,   "Thiªn Hµ MËt tÞch", {0,107,64,1,1} },
	{    5,   "Tö Hµ MËt tÞch", {0,107,65,1,1} },
	{  500,   "Bæ Kim MËt tÞch", {0,107,61,1,1} },
	{  500,   "Bæ Th¹ch MËt tÞch", {0,107,62,1,1} },
	{  500,   "Ngò Quû MËt tÞch", {0,107,63,1,1} },
	{  500,   "M¶nh Thiªn th¹ch", {2,2,7,1,1} },
	{  500,       "Thiªn th¹ch", {2,2,8,1,1} },
	{ 5000,       "B¨ng th¹ch", {2,1,149,1,1} },
	{ 5000,   "M¶nh B¨ng th¹ch", {2,1,148,1,1} },
	{ 3500,   "C©y B¸t Nh·", {2,0,398,1,1} },
	{ 5500, "C©y B¸t Nh· nhá", {2,0,504,1,1} },
	{10000,       "Lé thñy", {2,0,351,1,1} },
}
function talk_award_2_yes()
	if GetItemCount(2, 1, 30005) < 1 then
		Say("Ngò Linh Th¹ch mang theo kh«ng ®ñ.!", 0);
		return
	end
	if GetItemCount(2, 1, 30006) < 2 then
		Say("Lam Tinh Th¹ch mang theo kh«ng ®ñ.!", 0);
		return
	end
	if GetItemCount(2, 1, 30007) < 2 then
		Say("Hoµng B¶o Th¹ch mang theo kh«ng ®ñ.!", 0);
		return
	end
	if GetCash() < 5000 then
		Say("Kh«ng ®ñ ng©n l­îng..", 0);
		return
	end

	local gem_exp = GetTask(TASK_ID_VIET_2008_51_GEM_EXP);
	local nItem = get_random_item(t_gem_item_award);
	if nItem == 0 then
		print("error table: t_gem_item_award!!!");
		return
	end

	local exp = 80000;
	if gem_exp + 80000 > G_MAX_EXP then
		exp = G_MAX_EXP - gem_exp;
	end

	if DelItem(2, 1, 30005,1) and DelItem(2, 1, 30006,2) and DelItem(2, 1, 30007,2) and Pay(5000) then
		SetTask(TASK_ID_VIET_2008_51_GEM_EXP, GetTask(TASK_ID_VIET_2008_51_GEM_EXP) + exp);
		gf_SetLogCaption("viet_2008_51_gem_award");
		gf_Modify("Exp", exp);
		if nItem ~= 1 then
			gf_AddItemEx( t_gem_item_award[nItem][3], t_gem_item_award[nItem][2] );
		end
		gf_SetLogCaption("");
	end
end

function nothing()
end
