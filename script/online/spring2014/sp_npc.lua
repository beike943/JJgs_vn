Include("\\script\\online\\spring2014\\sp_head.lua")
Include("\\script\\lib\\talktmp.lua")

SP_NPC_NAME = "<color=green> §¹i Sø ho¹t ®éng: <color>";

SP_TITLE = "N¨m Míi Vui VÎ, Cung Chóc Ph¸t Tµi! Ta chuÈn bÞ cho c¸c ®¹i hiÖp nh÷ng ho¹t ®éng vui vÎ, nhanh ch©n ®Õn tham gia ®Ó nhËn th­ëng nhÐ!";

SP_NPC_TALK = {
--	"Ho¹t ®éng Chóc TÕt/sp_BaiNian",
	"Ho¹t ®éng §¸nh Niªn Thó/sp_DaNianShou",
};

function sp_ReturnMain()
	SetPlayerScript("\\script\\online\\activity_ambassador.lua");
	SendScript2VM("\\script\\online\\activity_ambassador.lua", "main()");
end

function sp_BaiNian()
	local tSay = {
		"Giíi thiÖu ho¹t ®éng chóc tÕt/sp_BaiNian_Intro",
		"Giíi thiÖu phÇn th­ëng ho¹t ®éng chóc tÕt/sp_BaiNian_AwardInfo",
		"NhËn bao l× x×/sp_BaiNian_GetLiShiBao",
		"trë l¹i/sp_ReturnMain",
		"Ra khái/nothing",
	};
	Say(SP_NPC_NAME..SP_TITLE, getn(tSay), tSay);
end

function sp_BaiNian_Intro()
	local tSay = {};
	tSay.msg = SP_NPC_NAME.."Xu©n ®Õn råi, ®¹i hiÖp nhanh ®Õn chç cña ta nhËn bao L× X×, më bao L× X× ra sÏ nh×n thÊy nhiÖm vô chóc TÕt, chØ cÇn ng­¬i hoµn thµnh hÕt c¸c nhiÖm vô chóc TÕt, th× cã thÓ nhËn ®­îc phÇn th­ëng trong Bao L× X×. NÕu nh­ cã høng thó, mçi ngµy ®Òu cã thÓ ®i chóc TÕt, phÇn th­ëng trong bao L× X× rÊt phong phó, c¸c ®¹i hiÖp h·y cè g¾ng lªn nhÐ!";
	tSay.sel = {
		{"\n Ph¶n håi", "sp_BaiNian"},
		{"KÕt thóc ®èi tho¹i", "nothing"},
	};
	temp_Talk(tSay);
end

function sp_BaiNian_AwardInfo()
	local tSay = {};
	tSay.msg = SP_NPC_NAME.."Më Bao L× X× nhËn ®­îc kinh nghiÖm, ch©n khÝ, ph¸o. Mçi ngµy ®Òu tham gia ho¹t déng, phÇn th­ëng sÏ th¨ng thªm. Ph¸o lµ mét lo¹i truyÒn thèng, cã thÓ dïng ®Ó ®uæi Niªn Thó ®i.";
	tSay.sel = {
		{"\n Ph¶n håi", "sp_BaiNian"},
		{"KÕt thóc ®èi tho¹i", "nothing"},
	};
	temp_Talk(tSay);
end

function sp_BaiNian_GetLiShiBao()
	if gf_GetPlayerRebornCount() <= 0 and gf_CheckBaseCondition(85) ~= 1 then
			return 0;
	end
	if BigGetItemCount(2, 1, 30624) > 0 then
		Talk(1,"",SP_NPC_NAME..format("%s hµnh trang kh«ng gian ®· cã Bao L× X× råi", gf_GetPlayerSexName()));
		return 0;
	end
	if gf_Judge_Room_Weight(1, 1, " ") ~= 1 then
		return 0;
	end
	gf_AddItemEx2({2, 1, 30624, 1}, "Bao L× X× N¨m Míi", "Event TÕt Kingsoft", "NhËn bao l× x×", 0, 1);
end

function sp_DaNianShou()
	local tSay = {
		"Giíi thiÖu ho¹t déng §¸nh Niªn Thó/sp_DaNianShou_Intro",
		"Giíi thiÖu phÇn th­ëng ho¹t ®éng §¸nh Niªn Thó/sp_DaNianShou_AwardInfo",
		"Mua ph¸o/sp_DaNianShou_Buy",
		"trë l¹i/sp_ReturnMain",
		"Ra khái/nothing",
	};
	Say(SP_NPC_NAME..SP_TITLE, getn(tSay), tSay);
end

function sp_DaNianShou_Intro()
	local tSay = {};
	tSay.msg = SP_NPC_NAME.."Chóc mõng c¸c ®¹i hiÖp n¨m míi vui vÎ, Niªn Thó xuÊt hiÖn, mäi ng­êi ®ång t©m hiÖp lùc ®Ó ®¸nh ®uæi Niªn Thó ®i, ®Ó chóng ta cã c¸i TÕt trän vÑn vui t­¬i! Mçi ngµy vµo lóc 12:00 ®Õn 13:00, buæi tèi vµo lóc 21:00 ®Õn 22:00, Niªn Thó sÏ ngÉu nhiªn xuÊt hiÖn t¹i BiÖn Kinh, D­¬ng Ch©u, Phông T­êng, T­¬ng D­¬ng, Thµnh §«, TuyÒn Ch©u. Sau khi c¸c ®¹i hiÖp nh×n thÊy Niªn Thó xuÊt hiÖn, th× nhanh chãng ®èt ph¸o gÇn xung quanh Niªn Thó, tham gia ho¹t ®éng cã c¬ héi nhËn ®­îc ph¸o, còng cã thÓ mua t¹i chç cña ta ®©y!";
	tSay.sel = {
		{"\n Ph¶n håi", "sp_DaNianShou"},
		{"KÕt thóc ®èi tho¹i", "nothing"},
	};
	temp_Talk(tSay);
end

function sp_DaNianShou_AwardInfo()
	local tSay = {};
	tSay.msg = SP_NPC_NAME.."Toµn th©n Niªn Thó ®Òu lµ b¶o vËt, khi ®¹i hiÖp ®¸nh Niªn Thó cã thÓ nhËn ®­îc ®iÓm kinh nghiÖm, ch©n khÝ, thiÕt tinh, thiªn huyÔn kh¾c b¶n, qu©n c«ng ch­¬ng, l¨ng ba vi bé vµ c¸c phÇn th­ëng phong phó kh¸c. NÕu nh­ ®¹i hiÖp thÝch Niªn Thó, liªn tôc 15 ngµy, ngµy ngµy ®¸nh Niªn Thó, Niªn Thó nhÊt ®Þnh sÏ tÆng cho ®¹i hiÖp 1 cuèn mËt tÞch s­ m«n. Nhanh ch©n ®Õn ®ã t×m Niªn Thó nhÐ!";
	tSay.sel = {
		{"\n Ph¶n håi", "sp_DaNianShou"},
		{"KÕt thóc ®èi tho¹i", "nothing"},
	};
	temp_Talk(tSay);
end

function sp_DaNianShou_Buy()
	if gf_GetPlayerRebornCount() <= 0 and gf_CheckBaseCondition(85) ~= 1 then
			return 0;
	end
	local nFreeRoom = GetFreeItemRoom()*1000;
	local nMax = min(floor(GetCash() / 1000), nFreeRoom);
	AskClientForNumber("sp_DaNianShou_Buy_deal", 0, nMax,"H·y nhËp sè l­îng cÇn mua","")
end

function sp_DaNianShou_Buy_deal(nNum)
	if nNum <= 0 then
		return 0;
	end
	if GetCash() < nNum * 1000 then
		Talk(1,"","TiÒn trong hµnh trang kh«ng ®ñ");
		return 0;
	end
	if GetFreeItemRoom()*1000 < nNum then
		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
		return 0;
	end
	if Pay(nNum * 1000) == 1 then
		gf_AddItemEx2({2, 1, 30625, nNum}, "Ph¸o N¨m Míi", "Event TÕt Kingsoft", "Ho¹t ®éng §¸nh Niªn Thó", 0, 1);
	end
end
