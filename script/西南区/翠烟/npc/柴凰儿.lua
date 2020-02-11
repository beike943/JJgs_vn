-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ´äÑÌÃÅNPC²Ê·ï¶ùScript
-- By StarryNight
-- 2006/03/22 PM 17:20

-- Ö±Ãæ×Ô¼ºµÄÄÚĞÄ°É£¡

--´å³¤£º2009-03-09 Ôö¼ÓÊµÖÊµÄ¶«Î÷
--ÒÔÇ°¶¼ÊÇ¼¸¸ö²ß»®¸ãÒ»¸ö¿ª·¢£¬ÏÖÔÚËæ×ÅÊ±´úµÄ½ø²½£¬±ä³ÉÁËÒ»¸ö²ß»®¸ã¼¸¸ö¿ª·¢£¡
-- ======================================================
Include("\\script\\task\\world\\task_head.lua")
Include("\\script\\½á»é\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı
Include("\\script\\task\\faction\\faction_head.lua");
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- Ê¦ÃÅÈÎÎñÁ´µÄÍ·ÎÄ¼ş
Include("\\script\\task\\faction\\faction_main_sl.lua"); -- ÃÅÅÉÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\practice\\practice_main.lua")
TASKID_CUIYAN_JOIN_TASK = 1019
TB_FACTION_TASKID_LIST = {1001,1002,1003,1004,1005,1031,1032,1033,1017,1018}
NPC_NAME = "<color=green>Sµi Hoµng Nhi<color>: "
function main()
	local t_dia_sel = {
		"Nguån gèc Thóy Yªn/say1_1",
		"Vâ c«ng Thóy Yªn/say1_2",
		"§iÒu kiÖn nhËp m«n/say1_3",
		--"ÎÒÒª¼ÓÈë´äÑÌ/say1_4",
		"Ta muèn lµm nhiÖm vô S­ M«n/#ftask_repeat_main(10)",
		--"±Õ¹ØĞŞÁ¶/#practice_main(10)",
		"Ta s¾p thµnh th©n nªn ph¶i xuÊt s­/#faction_graduate(10)",
		"Chµo hái ch­ëng m«n/end_dialog"
	}
		Say(NPC_NAME.."Thóy Yªn bèn mïa ®Òu lµ mïa xu©n, hoa r¬i l¶ t¶, ng­êi tµi tÒ tô.",
			getn(t_dia_sel),
			t_dia_sel
			)
end;	
function say1_1()
	Talk(4,"main",
		NPC_NAME.." Vµo n¨m §­êng Minh Hoµng, An Léc S¬n ph¶n lo¹n, b¸ t¸nh lÇm than. Hä v× tù b¶o vÖ mµ lËp nªn c¸c nhãm trong d©n gian, trong ®ã Thóy Yªn M«n do “Vò N­¬ng” t¹o thµnh. Trong chiÕn lo¹n, c¸c m«n ph¸i ®Òu khã kh¨n, ph¸i ta linh ho¹t nªn cã kh«ng gian sinh tån, tõ ®ã thu hót ngµy cµng nhiÒu vâ l©m nh©n sÜ gia nhËp.",
		NPC_NAME.."Nh­ng ®Õn khi 2 kú tµi vâ häc L­u C¶nh vµ L­u Th­êng xuÊt hiÖn míi lµm ph¸i ta thµnh m«n ph¸i vâ l©m thËt sù. Huynh ®Ö L­u thŞ chia vâ c«ng bæn ph¸i thµnh 2 h­íng: Linh N÷ giái vÒ ®iÒu khiÓn TiÓu §iªu vµ Vò Tiªn giái móa, ®êi sau gäi hä lµ “Thóy Yªn NhŞ Tæ”. Sau ®ã L­u C¶nh mÊt sím, L­u Th­êng gÆp t×nh biÕn, tøc giËn ®uæi hÕt ®Ö tö nam, chØ thu n¹p n÷ ®Ö tö.",
		NPC_NAME.." Cuèi ®êi §­êng, chiÕn tranh l¹i næi lªn, c¸c m«n ph¸i lo chóng ta thõa lóc hçn lo¹n më réng thÕ lùc nªn ®· ®uæi bæn m«n khái Trung Nguyªn. Ch­ëng m«n Sµi Hoµng Nhi cã khóc m¾c víi Tèng §×nh nªn cã th¸i ®é thï ®Şch víi c¸c m«n ph¸i Trung Nguyªn, do vËy kh«ng cã ®ång minh trong giang hå.",
		NPC_NAME.."Bæn m«n næi danh giang hå kh«ng chØ v× vâ c«ng v­ît tréi, cßn v× c¸c ®Ö tö ®Òu lµ mü n÷ tuyÖt s¾c, khiÕn v« sè nam nh©n giang hå si mª. C¸c B¸ch Hoa Sø, ai còng hoa nh­êng nguyÖt thÑn, chim sa c¸ lÆn."
		)
end
function say1_2()
	Talk(3,"main",
		NPC_NAME.."Vâ c«ng bæn m«n gåm 2 ph¸i, <color=yellow>Vò Tiªn<color> vµ <color=yellow>Linh N÷<color>. <color=yellow>MÉu §¬n Sø Chu Tö V¨n<color> truyÒn vâ c«ng <color=yellow>Vò Tiªn<color>, vâ c«ng <color=yellow>Linh N÷<color> do <color=yellow>T­êng Vi Sø Hå Man Thµnh<color> truyÒn thô.",
		"<color=yellow>Vò Tiªn<color> chØ dµnh cho n÷ nh©n biÕt vò ®¹o. Thêi §­êng cã C«ng T«n ®¹i n­¬ng khi móa kiÕm khİ vang déi tø ph­¬ng. Vò ®¹o bæn m«n lµ vò ®¹o hßa t©m ı b¶n th©n vµo ®iÖu móa, ng­êi xem lay ®éng theo t©m ı ng­êi móa. KÎ ®Şch nh×n vµo, sÏ mÊt hÕt ı chİ chiÕn ®Êu. H¶o h÷u nh×n vµo, ı chİ chiÕn ®Êu t¨ng cao, cã thÓ häc ®­îc kü n¨ng trÊn ph¸i <color=yellow>Loan Phông Cöu Thiªn<color>.",
		"<color=yellow>Linh N÷<color> chØ dµnh cho n÷ nh©n cã t©m hån tù do. Linh N÷ hßa hîp víi v¹n vËt nªn ®­îc nhiÒu ®éng vËt nhá quı mÕn, hä nu«i §iªu lµm b¹n, khi chiÕn ®Êu còng khèng chÕ TiÓu §iªu s¸t th­¬ng ®Şch. Ng­êi vµ §iªu phèi hîp, uy lùc phi th­êng, §iªu hµnh ®éng theo lÖnh khiÕn kÎ thï bŞ cho¸ng vµ gi¸n ®o¹n vâ c«ng, kh«ng ®­îc xem th­êng, cã thÓ häc ®­îc vâ c«ng trÊn ph¸i <color=yellow>Cöu Vü Hoa Tiªn QuyÕt<color>"
		)
end
function say1_3()
	Talk(1,"main","<color=green>Sµi Hoµng Nhi<color>: Giai nh©n tuyÖt s¾c trong thiªn h¹ chØ cÇn cã tÊm lßng l­¬ng thiÖn, kh«ng ph¶i ph¶n ®å bæn m«n, ®Òu ®­îc gia nhËp bæn m«n, nh­ng ®Ö tö sau khi nhËp ph¸i ph¶i yªu th­¬ng nhau, kh«ng ®­îc qua l¹i víi nam nh©n.")
end 
function say1_4()
	local task_step = GetTask(TASKID_CUIYAN_JOIN_TASK)
	local s_dia_no_pass = ""
	if GetSex() == 1 then
		 s_dia_no_pass = "ThiÕu hiÖp ®­êng xa ®Õn ®©y, thËt vÊt v¶. Nh­ng Thóy Yªn M«n kh«ng nhËn <color=red>®Ö tö nam<color>."
	elseif GetLevel() < 10 then
		s_dia_no_pass = "Ng­¬i kh«ng ®ñ cÊp, ®¹t cÊp <color=red>10<color> h·y ®Õn t×m ta."
	elseif GetPlayerRoute() ~= 0 then
		s_dia_no_pass =  "N÷ hiÖp ®· cã <color=red>m«n ph¸i<color>, ta kh«ng thÓ nhËn."
	elseif GetPlayerFaction() == 8 then
		s_dia_no_pass =  "Ng­¬i ®· lµ ng­êi cña Thóy Yªn M«n, mau ®i luyÖn c«ng."
	else
		for i = 1,getn(TB_FACTION_TASKID_LIST) do
			if GetTask(TB_FACTION_TASKID_LIST[i]) > 0 then
				s_dia_no_pass = "N÷ hiÖp ®· nhËn nhiÖm vô nhËp m«n cña m«n ph¸i kh¸c, kh«ng thÓ gia nhËp bæn m«n."
				break
			end
		end
	end
	if task_step == 5 then
		Talk(2,"",
			NPC_NAME.."Kh«ng sai, hai vŞ <color=green>B¸ch Hoa Sø<color> rÊt hµi lßng vÒ ng­¬i, ng­¬i cã thÓ gia nhËp bæn m«n, nhËp m«n ph¶i tu©n thñ quy ®Şnh, kh«ng ®­îc qua l¹i víi nam nh©n.",
			NPC_NAME.."Vâ c«ng bæn m«n gåm <color=yellow>Vò Tiªn<color> vµ <color=yellow>Linh N÷<color>, sau khi nhËp m«n ng­¬i cã thÓ t×m <color=yellow>Chu Tö V¨n<color> hoÆc <color=yellow>Hå Man Thµnh<color> ®Ó häc, <color=yellow>Chu Tö V¨n<color> tinh th«ng vò ®¹o, ng­¬i cã thÓ häc ®­îc ®iÖu nh¶y mª hoÆc vµ t©m ph¸p say hån cña nµng Êy; <color=yellow>Hå Man Thµnh<color> tõ nhá yªu ®éng vËt, rÊt thİch nu«i §iªu, kü n¨ng dïng Tiªu khèng chÕ <color=yellow>TiÓu §iªu<color> ®· ®¹t ®Õn møc xuÊt quû nhËp thÇn."
		)
		SetPlayerFaction(10)
		SetPlayerRoute(28)
		TaskTip("Ng­¬i ®· gia nhËp Thóy Yªn M«n")
		SetTask(TASKID_CUIYAN_JOIN_TASK,6)
	elseif s_dia_no_pass == "" then
		if task_step == 0 then
			Talk(2,"",NPC_NAME.."Giai nh©n tuyÖt s¾c trong thiªn h¹ cã thÓ gia nhËp bæn m«n, nh­ng ng­¬i ph¶i b¸i kiÕn hai vŞ <color=green>B¸ch Hoa Sø<color> trong Thóy Yªn M«n, hä sÏ nãi ng­¬i biÕt nªn lµm thÕ nµo, h·y t×m <color=green>MÉu §¬n Sø Chu Tö V¨n<color> (190/170) tr­íc.","<color=green>Ng­êi ch¬i<color>: §­îc, ta ®i ngay!")
			TaskTip("T×m MÉu §¬n Sø Chu Tö V¨n")
			Msg2Player("T×m MÉu §¬n Sø Chu Tö V¨n (190/170)")
			SetTask(TASKID_CUIYAN_JOIN_TASK,1)
			return
		else
			Talk(1,"",NPC_NAME.."Muèn vµo bæn m«n h·y t×m <color=yellow>Chu Tö V¨n<color> hoÆc <color=yellow>Hå Man Thµnh<color>!")
			return
		end
	else
		Talk(1,"",NPC_NAME..s_dia_no_pass)
		return
	end
end

function say1_5()
	
end

function say1_6()
	
end

