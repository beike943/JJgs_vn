Include("\\script\\missions\\kuafu_battle\\kf_head.lua")
Include("\\script\\lib\\talktmp.lua")

function main()
	local tSay = {}
	local string1 = "Tranh ®o¹t trªn chiÕn tr­êng liªn ®Êu v« cïng khèc liÖt, nÕu kh«ng n¾m râ c¸c yÕu quyÕt sau sÏ khã lßng mµ giµnh chiÕn th¾ng.\n"
	local string2 = format("ChiÕn tr­êng th¾ng lîi: muèn nhËn ®­îc th¾ng lîi cÇn ph¶i nhËn ®­îc ®Çy ®ñ ®iÓm tİch lòy chiÕn tr­êng. §iÓm tİch lòy chiÕn tr­êng nÕu bªn nµo ®¹t ®Õn sè ®iÓm giíi h¹n tr­íc sÏ giµnh th¾ng lîi. Giíi h¹n ®iÓm tİch lòy th«ng qua nh©n sè khi chiÕn tr­êng b¾t ®Çu ®Ó quyÕt ®Şnh, nh©n sè cµng nhiÒu th× chiÕn tr­êng cµng kŞch liÖt ®iÓm tİch lòy yªu cÇu sÏ cµng nhiÒu. §iÓm tİch lòy chiÕn tr­êng cã thÓ th«ng qua tiªu diÖt ng­êi ch¬i ®èi ph­¬ng, binh lİnh ®èi ph­¬ng, t­íng lÜnh, ®o¹t kú ®Ó nhËn ®­îc. \n");
	local string3 = "PhÇn th­ëng chiÕn tr­êng: Muèn nhËn ®­îc phÇn th­ëng tèt sau khi chiÕn ®Êu, cÇn ph¶i næ lùc giµnh ®­îc th¾ng lîi. PhÇn th­ëng bªn th¾ng sÏ tèt h¬n phÇn th­ëng bªn thua. Ngoµi ra trong chiÕn tr­êng cã thÓ th«ng qua viÖc ®¸nh b¹i ng­êi ch¬i ®èi ph­¬ng, binh lİnh, t­íng lÜnh, qu¸i, ®o¹t kú vµ nhiÒu h×nh thøc ®Ó nhËn ®­îc ®iÓm n¨ng ®éng. §iÓm n¨ng ®éng cµng cao th× sÏ nhËn ®­îc mét sè phÇn th­ëng v­ît møc. \n"
	local string4 = format("Hç trî trªn chiÕn tr­êng: trªn chiÕn tr­êng cã rÊt nhiÒu qu¸i vËt trung lËp, ®¸nh b¹i chóng toµn ®éi ®Òu cã thÓ nhËn ®­îc hiÖu øng hç trî kh¸ tèt. Trªn chiÕn tr­êng cßn cã %d Boss, ®¸nh b¹i chóng kh«ng nh÷ng nhËn ®­îc trang bŞ siªu m¹nh, mµ toµn phe ®Òu cã thÓ nhËn ®­îc hiÖu øng hç trî.\n", 2);
	tSay.msg = "<color=green>Liªu Qu©n Nhu Quan: <color>"..string1..string2..string3..string4;
	tSay.sel = {
		{"Ta biÕt råi", "nothing"},
	}
	temp_Talk(tSay);
end