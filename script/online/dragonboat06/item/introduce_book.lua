Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
function OnUse()
	local selTab = {
				"Giíi thiÖu quy t¾c ®ua thuyÒn rång./knowrule",
				"Giíi thiÖu c¸c lo¹i thuyÒn rång./knowboat",
				"Tra xem b¶ng xÕp h¹ng ®ua thuyÒn./seeworldrank",
				};
	if checkifinplace() == 1 then
		selTab[getn(selTab)+1] = "Tra xem tin tøc tÊt c¶ ng­êi ch¬i trong b¶n ®å./seeplayerinfo";
		selTab[getn(selTab)+1] = "Tra xem xÕp h¹ng ng­êi ch¬i hiÖn t¹i trong b¶n ®å/seerank";
	end;
	selTab[getn(selTab)+1] = "§ãng/nothing";
	Say("<color=green>S¸ch chØ dÉn ®ua thuyÒn:<color> Tæng céng b¹n ®· thi ®Êu <color=yellow>"..GetTask(ATTENDCOUNT).."trËn<color>, sè ®iÓm lµ <color=yellow>"..GetTask(BONUSPOINT).."<color>.",getn(selTab),selTab);
end;

function checkifinplace()
	local MapID = GetWorldPos();
	for i=1,3 do
		for j=0,7 do
			if MapID == i*1000+70+j then
				return 1;
			end;
		end;
	end;
	return 0;
end;
--=================================================================================
function knowrule()
	local selTab = {
			"Giíi thiÖu ®ua thuyÒn rång./knowmatch1",
			"Giíi thiÖu c¸ch ch¬i./knowtech",
			"XÕp h¹ng vµ c¸ch tİnh ®iÓm./knowbonus",
			"VÒ môc tr­íc./OnUse",
			"§ãng/nothing",
			};
	Say("<color=green>S¸ch chØ dÉn ®ua thuyÒn:<color> B¹n cã thÓ tra xem:",getn(selTab),selTab);
end;

function knowmatch1()
	Talk(1,"knowmatch2","<color=green>S¸ch chØ dÉn ®ua thuyÒn:<color> Thu thËp xong vËt liÖu ®Õn gÆp Long Chu sø gi¶ chän chÕ t¹o thuyÒn rång. Long Chu sø gi¶ kh«ng lÊy c«ng lµm thuyÒn rång. Trong ®ã x¸c suÊt nhËn ®­îc thuyÒn rång th­êng lµ rÊt lín, nÕu gÆp may m¾n cã thÓ nhËn ®­îc thuyÒn rång kü n¨ng. Sau khi cã thuyÒn rång, vÒ gÆp Long Chu sø gi¶ tham gia ®ua thuyÒn rång. Tr­íc tiªn chän tham gia ®ua thuyÒn sau ®ã chän tiÕn vµo b¶n ®å thi ®Êu. Sau 4 phót 30 gi©y kÓ tõ khi ng­êi ®Çu tiªn vµo b¶n ®å thi ®Êu hoÆc cã 8 ng­êi b¸o danh th× ®ua thuyÒn chİnh thøc b¾t ®Çu. Khi b¸o danh, trªn ng­êi kh«ng ®­îc mang vò khİ, ¸m khİ, nãn, ¸o, quÇn, trang søc, mËt tŞch nh­ng cã thÓ mang ngo¹i trang, ®ång thêi trong hµnh trang ph¶i cã 1 thuyÒn rång.");
end;
function knowmatch2()
	Talk(1,"knowmatch3","<color=green>S¸ch chØ dÉn ®ua thuyÒn:<color> Sau khi tiÕn vµo b¶n ®å thi ®Êu, ng­êi ch¬i sÏ ®­îc ®­a ®Õn ®iÓm xuÊt ph¸t. Thêi gian chuÈn bŞ lµ 30 gi©y ®Ó ng­êi ch¬i trang bŞ, lªn thuyÒn rång. Trong qu¸ tr×nh thi ®Êu ng­êi ch¬i kh«ng thÓ mÆc thªm bÊt kú trang bŞ nµo, ®ång thêi kh«ng thÓ thay ®æi thuyÒn còng nh­ xuèng thuyÒn. Sau khi tíi ®İch ®Õn, ng­êi ch¬i sÏ trë vÒ tr¹ng th¸i b×nh th­êng.");
end;
function knowmatch3()
	Talk(1,"knowmatch4","<color=green>S¸ch chØ dÉn ®ua thuyÒn:<color> Trong qu¸ tr×nh thi ®Êu, ng­êi ch¬i cã thÓ sö dông kü n¨ng cña thuyÒn rång. Trong b¶n ®å thi ®Êu cã nh÷ng cæng cê. NÕu nh­ ®i qua 2 cæng cê cã mµu chØ ®Şnh sÏ cã hiÖu qu¶ nµo ®ã. Nh÷ng cæng cê cã mµu hång, vµng, xanh sÏ cã hiÖu qu¶ cã lîi, cßn mµu cam, mµu tİm sÏ cã hiÖu qu¶ bÊt lîi. Trong b¶n ®å sÏ ngÉu nhiªn xuÊt hiÖn b¶o r­¬ng, khi më sÏ cã hiÖu qu¶ ngÉu nhiªn. §ua thuyÒn sÏ chiÕu theo thø tù ®Õn ®İch ®Ó xÕp h¹ng.");
end;
function knowmatch4()
	Talk(1,"OnUse","<color=green>S¸ch chØ dÉn ®ua thuyÒn:<color> Sè ng­êi tham dù nhiÒu İt, thø h¹ng sÏ ¶nh h­ëng ®Õn ®iÓm tİch lòy.<enter>2 ng­êi: 1, 0<enter>3 ng­êi: 2, 1, 0<enter>4 ng­êi: 2, 1, 1, 0<enter>5 ng­êi: 3, 2, 1, 0, 0<enter>6 ng­êi: 3, 2, 1, 1, 0, 0<enter>7 ng­êi: 4, 3, 2, 1, 1, 0, 0<enter>8 ng­êi: 5, 4, 3, 2, 1, 1, 0, 0");
end;


function knowtech()
	Talk(1,"knowrule","<color=green>S¸ch chØ dÉn ®ua thuyÒn:<color> Trong qu¸ tr×nh thi ®Êu b¹n cã thÓ sö dông kü n¨ng cña thuyÒn rång ®Ó c«ng kİch ng­êi ch¬i kh¸c, ®ång thêi cã thÓ v­ît qua 2 cæng cê ®Ó cã 1 hiÖu qu¶ ®Æc biÖt, vİ dô: mçi lÇn v­ît qua cæng cê mµu ®á vµ mµu xanh sÏ lµm cho¸ng ng­êi ®øng ®Çu trong 2 gi©y. §ång thêi trªn mÆt s«ng sÏ xuÊt hiÖn ngÉu nhiªn 1 sè b¶o r­¬ng khi më sÏ cã hiÖu qu¶ bÊt ngê. Ng­êi ch¬i lîi dông nh÷ng kü n¨ng nµy ®Ó ®¸nh b¹i c¸c ®èi thñ kh¸c tranh giµnh vŞ trİ thø nhÊt.");
end;

function knowbonus()
	Talk(1,"knowrule","<color=green>S¸ch chØ dÉn ®ua thuyÒn:<color> ChØ cã ng­êi ch¬i nhËn ®­îc b¶ng thµnh tİch míi xem nh­ hoµn thµnh 1 trËn ®Êu. Thø h¹ng ®­îc tİnh nh­ sau: dùa vµo thø tù vÒ ®İch ®Ó xÕp h¹ng, ng­êi ch¬i nµo vÉn ch­a hoµn thµnh sÏ chiÕu theo ng­êi ch¬i vÒ ®İch sau cïng khi kÕt thóc cuéc ®ua thuyÒn ®Ó xÕp h¹ng, nÕu cïng vÒ ®İch ng­êi ch¬i nµo cã ®iÓm İt h¬n sÏ xÕp trªn, nÕu b»ng ®iÓm th× ng­êi ch¬i nµo vµo b¶n ®å thi ®Êu tr­íc sÏ xÕp trªn. Sau khi trËn ®Êu kÕt thóc sè ®iÓm nhËn ®­îc vµ sè tuyÓn thñ hoµn thµnh ®­êng ®ua cã liªn quan, sè ng­êi cµng nhiÒu th× ®iÓm sÏ cµng cao.");
end;
--==================================================================================
function seeplayerinfo()
	if checkifinplace() == 0 then
		return 0;
	end;
	local MSIDTab = {};
	local PIDTab = {};
	local playerTab = {};
	local OldPlayerIndex = PlayerIndex;
	local tabIndex = 0;
	local msidx = 0;
	local sidx = 0;
	for i=1,GetMSPlayerCount(MISSION_ID,CAMP_PLAYER) do
		msidx,sidx = GetNextPlayer(MISSION_ID,msidx,CAMP_PLAYER);
		if sidx > 0 then
			MSIDTab[i] = msidx;
			PIDTab[i] = sidx;
		end
	end
	for i=1,getn(PIDTab) do
		PlayerIndex = PIDTab[i];
		if PlayerIndex > 0 then
			if GetTask(STATUS) == CAMP_PLAYER then
				playerTab[tabIndex+1] = GetName().."/#moreinfo("..MSIDTab[i]..")";
				tabIndex = tabIndex +1;
			end;
		else
			Write_Log("PlayerIndex Error","introduce_book.lua,seeplayerinfo()");
		end;
	end;
	playerTab[getn(playerTab)+1] = "VÒ môc lôc tr­íc./OnUse";
	playerTab[getn(playerTab)+1] = "§ãng/nothing";
	PlayerIndex = OldPlayerIndex;
	Say("<color=green>S¸ch chØ dÉn ®ua thuyÒn:<color> NÕu muèn tra xem tin tøc ng­êi ch¬i nµo ®ã h·y chän tªn ng­êi ®ã.",getn(playerTab),playerTab);
end;

function moreinfo(msid)
	if checkifinplace() == 0 then
		return 0;
	end;
	local OldPlayerIndex = PlayerIndex;
	local sContent = "";
	local sTime = "";
	local nMin,nSec = 0,0;
	PlayerIndex = MSDIdx2PIdx(MISSION_ID,msid);
	if PlayerIndex >0 then
		local nBestTime = GetTask(BEST_TIME);
		if nBestTime == 0 then
			sResult = "Kh«ng cã thµnh tİch.";
		else
			nBestTime = nBestTime/18;
			nMin = floor(nBestTime/60);
			nSec = format("%.2f",nBestTime - nMin*60);	--Ğ¡ÊıµãºóÁ½Î»¾Í¹»ÁË
			sTime = "<color=red>"..nMin.." Phót "..nSec.." gi©y<color>"
		end;
		sContent = "                                  <color=green>Tin tøc ng­êi ch¬i<color><enter> Tªn:<color=yellow>"..GetName().."<color><enter>Sè lÇn ®ua:<color=yellow>"..GetTask(ATTENDCOUNT).."<color><enter>HiÖn t¹i ®iÓm:<color=yellow>"..GetTask(BONUSPOINT).."<color><enter>Thêi gian nhanh nhÊt:"..sTime;
	else
		Write_Log("PlayerIndex Error","introduce_book.lua,moreinfo()");
	end;
	PlayerIndex = OldPlayerIndex;
	Talk(1,"seeplayerinfo",sContent);
end;
--==================================================================================
function seerank()
	if checkifinplace() == 0 then
		return 0;
	end;
	local sContent = "";
	local OldPlayerIndex = PlayerIndex;
	local RankTab = Get_Rank();
	local nPlayerCount = getn(RankTab);
	for i=1,nPlayerCount do
		PlayerIndex = RankTab[i];
		if PlayerIndex > 0 then
			sContent = sContent.."thø"..NumTab[i].." h¹ng:<color=yellow>"..GetName().."<color><enter>";
		else
			Write_Log("PlayerIndex Error","introduce_book.lua,seerank()");
		end;
	end;
	PlayerIndex = OldPlayerIndex;
	Talk(1,"OnUse",sContent);
end;

function knowboat()
	local selTab = {};
	for i=1,getn(BoatInfo) do
		selTab[i] = BoatInfo[i][1].."/#knowboatdetail("..i..")";
	end;
	selTab[getn(selTab)+1] = "Quay l¹i môc lôc tr­íc./OnUse";
	selTab[getn(selTab)+1] = "§ãng/nothing";
	Say("<color=green>S¸ch chØ dÉn ®ua thuyÒn:<color> B¹n muèn t×m hiÓu thuyÒn rång nµo?",getn(selTab),selTab);
end;

function knowboatdetail(nType)
	local sContent = ""
	if nType > 7 or nType <= 0 then
		Write_Log("Ho¹t ®éng tÕt §oan Ngä sai sãt","Lo¹i thuyÒn rång sai! Tªn nh©n vËt:"..GetName())
		return 0;
	end;
	sConten = "<color=green>S¸ch chØ dÉn ®ua thuyÒn:<color><color=yellow>"..BoatInfo[nType][1].."<color>:"..BoatInfo[nType][2];
	Talk(1,"knowboat",sConten);
end;

function seeworldrank()
	OpenRankWindow(100);
end;