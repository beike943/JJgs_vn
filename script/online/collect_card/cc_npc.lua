Include("\\script\\lib\\talktmp.lua")
Include("\\script\\online\\collect_card\\cc_head.lua")

CC_TITLE = format("M«n ph¸i míi ®· s¾p ra m¾t råi, c¸c ch­ vÞ ®¹i hiÖp ®· lùa chän gia nhËp vµo m«n ph¸i nµo hay ch­a? Nhanh nhanh ®Õn thu thËp ThÎ Kü N¨ng M«n Ph¸i Míi, nhËn phÇn th­ëng nhÐ. %d cÊp trë lªn ®· gia nhËp m«n ph¸i vµ häc hÕt toµn bé kü n¨ng cÊp 55 th× cã thÓ tham gia",CC_PLAYER_LEVEL_MIN);

CC_MAIN_DIALOG = {
	"Giíi thiÖu ho¹t ®éng/cc_introduce",	
	"KiÕn thøc vÊn ®¸p/cc_knowledge",
	"Giao nép ThÎ Tù/cc_reveive_award",
}

function cc_introduce()
	local strTitle = "ThÎ Tù ph©n biÖt lµ ThÎ L«i TÕ, ThÎ L¹c Hoa QuyÕt, ThÎ Linh Miªu VËn, kÝnh chóc c¸c ®¹i hiÖp cã nh÷ng tr¶i nghiÖm vui vÎ.";
	local tbSay = {};
	tbSay.msg = CC_NPC..strTitle;
	tbSay.sel = {
		{"Chñng lo¹i vµ nguån gèc ThÎ Tù", "cc_introduce_card"},
		{"T¸c dông ThÎ Tù", "cc_card_uesd"},
		{"Khiªu chiÕn BOSS hoang d·", "cc_fight_boss"},
		{"\n rót lui","nothing"},
	};
	temp_Talk(tbSay);
end

function cc_introduce_card()
	local strTitle = "ThÎ Tù ph©n biÖt lµ ThÎ L«i TÕ, ThÎ L¹c Hoa QuyÕt, ThÎ Linh Miªu VËn, kÝnh chóc c¸c ®¹i hiÖp cã nh÷ng tr¶i nghiÖm vui vÎ.";
	local strInfo = "\nChñng lo¹i ThÎ Tù: ThÎ L«i TÕ, ThÎ L¹c Hoa QuyÕt, ThÎ Linh Miªu VËn \n Nguån gèc ThÎ Tù: Chó ý tham gia chiÕn tr­êng Thiªn M«n TrËn, L­¬ng S¬n, V¹n KiÕm Trñng, Th«ng Thiªn HuyÔn C¶nh, ®¸p ¸n vÊn ®Ò vµ tham gia khiªu chiÕn BOSS hoang d· ®Òu cã thÓ nhËn ®­îc ThÎ Tù.";
	local tbSay = {};
	tbSay.msg = CC_NPC..strTitle..strInfo;
	tbSay.sel = {
		{"Trë l¹i trang tr­íc", "cc_introduce"},
		{"\n rót lui","nothing"},
	};
	temp_Talk(tbSay);
end

function cc_card_uesd()
	local strTitle = "ThÎ Tù ph©n biÖt lµ ThÎ L«i TÕ, ThÎ L¹c Hoa QuyÕt, ThÎ Linh Miªu VËn, kÝnh chóc c¸c ®¹i hiÖp cã nh÷ng tr¶i nghiÖm vui vÎ.";
	local strInfo = "\nT¸c dông: Thu thËp ®ñ nhãm ThÎ Tù t­¬ng øng sÏ ®æi ®­îc phÇn th­ëng t­¬ng øng, nhÊn ph¶i vµo ThÎ L«i TÕ sÏ nhËn ®­îc phÇn th­ëng kinh nghiÖm, giao nép tæ hîp thÎ‘ThÎ L«i TÕ + ThÎ L¹c Hoa QuyÕt’ vµ  tæ hîp thÎ ‘ThÎ L«i TÕ + ThÎ Linh Miªu VËn’ sÏ cã c¬ héi nhËn ®­îc phÇn th­ëng lÔ bao.";
	local tbSay = {};
	tbSay.msg = CC_NPC..strTitle..strInfo;
	tbSay.sel = {
		{"Trë l¹i trang tr­íc", "cc_introduce"},
		{"\n rót lui","nothing"},
	};
	temp_Talk(tbSay);
end

function cc_fight_boss()
	local strTitle = "ThÎ Tù ph©n biÖt lµ: ThÎ L«i TÕ, ThÎ L¹c Hoa QuyÕt, ThÎ Linh Miªu VËn, kÝnh chóc c¸c ®¹i hiÖp cã nh÷ng tr¶i nghiÖm vui vÎ.";
	local strInfo = format("\nThêi gian xuÊt hiÖn BOSS: quy t¾c phÇn th­ëng mçi ngµy %s\n tiªu diÖt boss: ng­êi ch¬i tiªu diÖt boss sau cïng sÏ nhËn ®­îc 1 tÊm thÓ 'Linh Miªu VËn', tÊt c¶ nh©n vËt  sau khi kÝch s¸t boss cã thÓ nhÊn chuét vµo b¶o r­¬ng nhËn phÇn th­ëng, b¶o r­¬ng sÏ xuÊt hiÖn trong vßng 10 phót sau ®ã sÏ biÕn mÊt.", "8:30;12:30;17:30;22:30");
	local tbSay = {};
	tbSay.msg = CC_NPC..strTitle..strInfo;
	tbSay.sel = {
		{"Trë l¹i trang tr­íc", "cc_introduce"},
		{"\n rót lui","nothing"},
	};
	temp_Talk(tbSay);
end


function cc_knowledge()
	local strTitle = "C¸c ®¹i hiÖp ®õng quªn xem quy t¾c tr¶ lêi nhÐ, chóc c¸c ®¹i hiÖp hoµn thµnh ®¸p ¸n.";
	local tbSay = {};
	tbSay.msg = CC_NPC..strTitle;
	tbSay.sel = {
		{"Quy t¾c ®¸p ¸n", "cc_knowledge_info"},
		{"PhÇn th­ëng ®¸p ¸n", "cc_knowledge_award"},
		{"B¾t ®Çu ®¸p ¸n", "cc_knowledge_start"},
		{"\n rót lui","nothing"},
	};
	temp_Talk(tbSay);
end

function cc_knowledge_info()
	local strTitle = "C¸c ®¹i hiÖp ®õng quªn xem quy t¾c tr¶ lêi nhÐ, chóc c¸c ®¹i hiÖp hoµn thµnh ®¸p ¸n.";
	local strInfo = "\nQuy t¾c: Mçi mét nh©n vËt 1 ngµy nhiÒu nhÊt chØ ®­îc tr¶ lêi 3 vÊn ®Ò, chØ cÇn tr¶ lêi ®­îc c©u hái th× sÏ nhËn ®­îc phÇn th­ëng."
	local tbSay = {};
	tbSay.msg = CC_NPC..strTitle..strInfo;
	tbSay.sel = {
		{"Trë l¹i trang tr­íc", "cc_knowledge"},
		{"\n rót lui","nothing"},
	};
	temp_Talk(tbSay);
end

function cc_knowledge_award()
	local strTitle = "C¸c ®¹i hiÖp ®õng quªn xem quy t¾c tr¶ lêi nhÐ, chóc c¸c ®¹i hiÖp hoµn thµnh ®¸p ¸n.";
	local strInfo = "\n phÇn th­ëng: Tr¶ lêi ®óng 1 c©u sÏ nhËn ®­îc 1 tÊm ThÎ Tù vµ phÇn th­ëng kinh nghiÖm; tr¶ lêi sai th× chØ nhËn ®­îc phÇn th­ëng kinh nghiÖm"
	local tbSay = {};
	tbSay.msg = CC_NPC..strTitle..strInfo;
	tbSay.sel = {
		{"Trë l¹i trang tr­íc", "cc_knowledge"},
		{"\n rót lui","nothing"},
	};
	temp_Talk(tbSay);
end

function cc_knowledge_start()
	cc_answer_question();
end

function cc_reveive_award()
	local strTitle = "Nhãm ThÎ Tù lµ ‘ThÎ L«i TÕ + ThÎ L¹c Hoa QuyÕt’, ‘ThÎ L«i TÕ + ThÎ Linh Miªu VËn’, ®¹i hiÖp nhanh nhanh nhËn lÊy phÇn th­ëng.";
	local tbSay = {};
	tbSay.msg = CC_NPC..strTitle;
	tbSay.sel = {
		--{"ÉÏ½»À×¼À¿¨Áì½±", "cc_reveive_award_1"},
		{"Giao nép ThÎ L«i TÕ + ThÎ L¹c Hoa QuyÕt", "cc_reveive_award_2"},
		{"Giao nép ThÎ L«i TÕ + ThÎ Linh Miªu VËn ", "cc_reveive_award_3"},
		{"\n rót lui","nothing"},
	};
	temp_Talk(tbSay);	
end

function cc_reveive_award_1()
	local nItemCount = GetItemCount(2, 1, 30505);
	AskClientForNumber("cc_reveive_award_1_deal", 0, min(nItemCount, 200),"Xin h·y nhËp sè l­îng cÇn giao nép","")
end

function cc_reveive_award_2()
	local nCard2Times = CC_ACTIVITY_TASK_GROUP:GetTask(CC_ACTIVITY_TASK_GROUP.CARD2_TIMES);
	if nCard2Times >= CC_CARD2_MAX then
		Talk(1,"",format("Ng­¬i ®· giao nép sè l­îng ThÎ Tù v­ît qu¸ %d lÇn, kh«ng thÓ tiÕp tôc giao nép n÷a.", CC_CARD2_MAX));
		return 0;
	end
	local nSpace = min(GetFreeItemRoom(), CC_CARD2_MAX - nCard2Times);
	local nItemCount = min(GetItemCount(2, 1, 30505), GetItemCount(2, 1, 30506));
	AskClientForNumber("cc_reveive_award_2_deal", 0, min(nSpace, nItemCount),"Xin h·y nhËp sè l­îng cÇn giao nép","")
end

function cc_reveive_award_3()
	local nSpace = GetFreeItemRoom();
	local nItemCount = min(GetItemCount(2, 1, 30505), GetItemCount(2, 1, 30507));
	AskClientForNumber("cc_reveive_award_3_deal", 0, min(nSpace, nItemCount),"Xin h·y nhËp sè l­îng cÇn giao nép","")
end


function cc_reveive_award_1_deal(nNum)
	for i = 1, nNum do
		cc_get_award(1);
	end
end

function cc_reveive_award_2_deal(nNum)
	for i = 1, nNum do
		cc_get_award(2);
	end
end

function cc_reveive_award_3_deal(nNum)
	for i = 1, nNum do
		cc_get_award(3);
	end
end

