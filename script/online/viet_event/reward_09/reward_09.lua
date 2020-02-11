TASK_REWARD_EXP = 2428;
TASK_REWARD_GOLD = 2429;
TASK_REWARD_HORSE = 2430;

tRewardFaction =
{
	"ThiÕu L©m",
	"Vâ §ang",
	"Nga My",
	"C¸i Bang",
	"§­êng M«n",
	"D­¬ng Gia",
	"Ngò §éc",
}

tRewardRoute =
{
	[2] 	=  {"ThiÕu L©m tôc gia", 0},
	[3] 	=  {"ThiÕu L©m thiÒn t¨ng", 2},
	[4] 	=  {"ThiÕu L©m vâ t«ng", 1},
	[14] 	=  {"Vâ §ang ®¹o gia", 8},
	[15] 	=  {"Vâ §ang tôc gia", 9},
	[8] 	=  {"Nga My phËt gia", 4},
	[9] 	=  {"Nga My tôc gia", 5},
	[11] 	=  {"C¸i Bang tÜnh y", 6},
	[12] 	=  {"C¸i Bang « y", 7},
	[6] 	=  {"§­êng M«n", 3},
	[17] 	=  {"D­¬ng Gia th­¬ng", 10},
	[18] 	=  {"D­¬ng Gia cung", 11},
	[20] 	= {"Ngò §éc hiÖp ®éc", 12},
	[21] 	= {"Ngò §éc tµ ®éc", 13},
}

function funcReward()
		Say("C¸c h¹ cã thÓ nhËn c¸c  lo¹i vËt phÈm th«ng qua cÈm nang nh­ sau:", 13,
			"NhËn ®iÓm kinh nghiÖm (chØ cã thÓ nhËn 1 lÇn)/funcReward_01",
			"NhËn 50000 vµng (chØ cã thÓ nhËn 1 lÇn)/funcReward_02",
			"NhËn 20000 ®iÓm danh väng/funcReward_03", 
			"NhËn 20000 ®iÓm S­ m«n/funcReward_04",
			"NhËn Trang bŞ S­ M«n cÊp 8/funcReward_05",
			"NhËn Trang bŞ Vò khİ Bé Phi Yªn/funcReward_06",
			"S¸ch/funcReward_07",
			"YÕu quyÕt/funcReward_08",
			"NhËn S¸ch Skill trÊn ph¸i/funcReward_09",
			"NhËn D­îc phÈm/funcReward_10",
			"NhËn S©u cæ/funcReward_11",
			"NhËn c¸c vËt phÈm kh¸c/funcReward_12",
			"KÕt thóc ®èi tho¹i/cancel")
end

function funcReward_01()
	if ( GetTask(TASK_REWARD_EXP) == 0 ) then
		SetLevel(85,0)
		ModifyExp(1900000000);
		SetTask(TASK_REWARD_EXP, 1) ;
		Msg2Player("§¼ng cÊp ®­îc n©ng lªn 85 vµ nhËn ®­îc 1900000000 ®iÓm kinh nghiÖm.");
		WriteLog("[PhÇn th­ëng giang hå chØ nam]:"..GetName().." ®­îc t¨ng cÊp lªn 85 vµ nhËn ®­îc 1900000000 ®iÓm kinh nghiÖm.");
		funcReward();
	else
		Say("C¸c h¹ ®· nhËn 1 lÇn råi, kh«ng thÓ nhËn thªm ®­îc n÷a!",1, "ThËt ng¹i qu¸./funcReward");
	end
end

function funcReward_02()
	if ( GetTask(TASK_REWARD_GOLD) == 0 ) then
		Earn(500000000);
		SetTask(TASK_REWARD_GOLD, 1) ;
		Msg2Player("B¹n nhËn ®­îc 50000 vµng.");
		WriteLog("[PhÇn th­ëng giang hå chØ nam]:"..GetName().." nhËn ®­îc 50000 vµng.");
		funcReward();
	else
		Say("C¸c h¹ ®· nhËn 1 lÇn råi, kh«ng thÓ nhËn thªm ®­îc n÷a!",1, "ThËt ng¹i qu¸./funcReward");
	end
end

function funcReward_03()
	ModifyReputation(20000, 0);
	Msg2Player("B¹n nhËn ®­îc 20000 ®iÓm Danh väng.");
	WriteLog("[PhÇn th­ëng giang hå chØ nam]:"..GetName().." nhËn ®­îc 20000 ®iÓm Danh väng.");
	funcReward();
end

function funcReward_04()
	SetTask(336, GetTask(336) + 20000);
	Msg2Player("B¹n nhËn ®­îc 20000 ®iÓm S­ m«n.");
	WriteLog("[PhÇn th­ëng giang hå chØ nam]:"..GetName().." nhËn ®­îc 20000 ®iÓm S­ m«n.");
	funcReward();
end

function funcReward_05()
	local mRoute = GetPlayerRoute();
	local mBody = GetBody()	
	
	local tType = {103, 100, 101, 102} -- M·o, Th­îng y, H¹ y, Trang søc
	local tWeapons = {0, 3, 8, 0, 0, 1,  0, 2, 10, 0, 0, 5, 0, 2, 9, 0, 6, 4, 0, 7, 11} -- Vò khİ	
	
	if mRoute ==8 or mRoute == 9 then
		mBody = mBody - 2		
	end
	
	if ( GetFreeItemRoom() < 7 ) then
		Say("Sè « trèng trong hµnh trang kh«ng ®ñ", 0);
		return
	end
	
	if CheckRoute(mRoute) == 1 then
		for i=1,3 do
			AddItem(0, tType[i], mRoute * 100 + 20 + mBody, 1, 1, -1, -1, -1, -1, -1, -1);
		end
				
		AddItem(0, tWeapons[mRoute], mRoute * 100 + 20 + mBody, 1, 1, -1, -1, -1, -1, -1, -1);	
		if mRoute == 2 then
			AddItem(0, tWeapons[12], mRoute * 100 + 20 + mBody, 1, 1, -1, -1, -1, -1, -1, -1);	
		end
		
		if mRoute == 8 or  mRoute == 9 or  mRoute == 2 or mRoute == 3 or mRoute == 4 then
			AddItem(0, tType[4], mRoute * 100 + 20 + mBody , 1, 1, -1, -1, -1, -1, -1, -1);	
			AddItem(0, tType[4], mRoute * 100 + 20 + mBody + 2, 1, 1, -1, -1, -1, -1, -1, -1);	
		else
			AddItem(0, tType[4], mRoute * 100 + 20 + mBody , 1, 1, -1, -1, -1, -1, -1, -1);	
			AddItem(0, tType[4], mRoute * 100 + 20 + mBody + 4, 1, 1, -1, -1, -1, -1, -1, -1);	
		end					
		Msg2Player("B¹n ®· nhËn ®­îc 1 bé  S­ m«n "..tRewardRoute[mRoute][1]);
		WriteLog("[PhÇn th­ëng giang hå chØ nam]:"..GetName().." ®· nhËn ®­îc 1 bé S­ m«n "..tRewardRoute[mRoute][1]);
		funcReward();
	else
		Say("C¸c h¹ ch­a gia nhËp hÖ ph¸i!",1, "ThËt ng¹i qu¸./funcReward");
	end	
end

function CheckRoute(nRoute)
	local tRoute = {0, 1, 5, 7, 10, 13, 16, 19}	
	for v,k in tRoute do
		if nRoute == tRoute[v] then
			return 0
		end
	end	
	return 1	
end

function funcReward_06()
	mFaction = GetPlayerRoute();
	
	if CheckRoute(mFaction) == 1 then
		if (  (GetFreeItemRoom() < 2 and mRoute == 2) or GetFreeItemRoom() < 1 ) then
			Say("Sè « trèng trong hµnh trang kh«ng ®ñ", 0);
			return
		end
		if ( mFaction == 2 ) then
			AddItem(0, 5, 6002, 1, 1, -1, -1, -1, -1, -1, -1);
			AddItem(0, 3, 6001, 1, 1, -1, -1, -1, -1, -1, -1);
			Msg2Player("B¹n ®· nhËn ®­îc Ph¸ Yªn c«n vµ Ph¸ Yªn §ao.");
			WriteLog("[PhÇn th­ëng giang hå chØ nam]:"..GetName().." ®· nhËn ®­îc Ph¸ Yªn c«n  vµ Ph¸ Yªn §ao.");
		elseif ( mFaction == 3 ) then
			AddItem(0, 8, 6003, 1, 1, -1, -1, -1, -1, -1, -1);
			Msg2Player("B¹n ®· nhËn ®­îc Phï Yªn tr­îng.");
			WriteLog("[PhÇn th­ëng giang hå chØ nam]:"..GetName().." ®· nhËn ®­îc Phï Yªn tr­îng.");
		elseif ( mFaction == 4 ) then
			AddItem(0, 0, 6004, 1, 1, -1, -1, -1, -1, -1, -1);
			Msg2Player("B¹n ®· nhËn ®­îc Hµm Yªn thñ.");
			WriteLog("[PhÇn th­ëng giang hå chØ nam]:"..GetName().." ®· nhËn ®­îc Hµm Yªn thñ.");
		elseif ( mFaction == 6 ) then
			AddItem(0, 1, 6005, 1, 1, -1, -1, -1, -1, -1, -1);
			Msg2Player("B¹n ®· nhËn ®­îc Tµng Yªn ch©m.");
			WriteLog("[PhÇn th­ëng giang hå chØ nam]:"..GetName().." ®· nhËn ®­îc Tµng Yªn ch©m.");
		elseif ( mFaction == 8 ) then
			AddItem(0, 2, 6006, 1, 1, -1, -1, -1, -1, -1, -1);
			Msg2Player("B¹n ®· nhËn ®­îc Phi Yªn kiÕm.");
			WriteLog("[PhÇn th­ëng giang hå chØ nam]:"..GetName().." ®· nhËn ®­îc Phi Yªn kiÕm.");
		elseif ( mFaction == 9 ) then
			AddItem(0, 10, 6007, 1, 1, -1, -1, -1, -1, -1, -1);
			Msg2Player("B¹n ®· nhËn ®­îc VËn Yªn cÇm.");
			WriteLog("[PhÇn th­ëng giang hå chØ nam]:"..GetName().." ®· nhËn ®­îc VËn Yªn cÇm.");
		elseif ( mFaction == 11 ) then
			AddItem(0, 0, 6008, 1, 1, -1, -1, -1, -1, -1, -1);
			Msg2Player("B¹n ®· nhËn ®­îc V©n Yªn thñ.");
			WriteLog("[PhÇn th­ëng giang hå chØ nam]:"..GetName().." ®· nhËn ®­îc V©n Yªn thñ.");
		elseif ( mFaction == 12 ) then
			AddItem(0, 5, 6009, 1, 1, -1, -1, -1, -1, -1, -1);
			Msg2Player("B¹n ®· nhËn ®­îc L­u Yªn c«n.");
			WriteLog("[PhÇn th­ëng giang hå chØ nam]:"..GetName().." ®· nhËn ®­îc L­u Yªn c«n.");
		elseif ( mFaction == 14 ) then
			AddItem(0, 2, 6010, 1, 1, -1, -1, -1, -1, -1, -1);
			Msg2Player("B¹n ®· nhËn ®­îc HuyÒn Yªn kiÕm.");
			WriteLog("[PhÇn th­ëng giang hå chØ nam]:"..GetName().." ®· nhËn ®­îc HuyÒn Yªn kiÕm.");
		elseif ( mFaction == 15 ) then
			AddItem(0, 9, 6011, 1, 1, -1, -1, -1, -1, -1, -1);
			Msg2Player("B¹n ®· nhËn ®­îc Vò Yªn bót.");
			WriteLog("[PhÇn th­ëng giang hå chØ nam]:"..GetName().." ®· nhËn ®­îc Vò Yªn bót.");
		elseif ( mFaction == 17 ) then
			AddItem(0, 6, 6012, 1, 1, -1, -1, -1, -1, -1, -1);
			Msg2Player("B¹n ®· nhËn ®­îc Hµ Tiªm Th­¬ng.");
			WriteLog("[PhÇn th­ëng giang hå chØ nam]:"..GetName().." ®· nhËn ®­îc Hµ Tiªm Th­¬ng.");
		elseif ( mFaction == 18 ) then
			AddItem(0, 4, 6013, 1, 1, -1, -1, -1, -1, -1, -1);
			Msg2Player("B¹n ®· nhËn ®­îc Hµnh Yªn Cung.");
			WriteLog("[PhÇn th­ëng giang hå chØ nam]:"..GetName().." ®· nhËn ®­îc Hµnh Yªn Cung.");
		elseif ( mFaction == 20 ) then
			AddItem(0, 7, 6014, 1, 1, -1, -1, -1, -1, -1, -1);
			Msg2Player("B¹n ®· nhËn ®­îc Träc Yªn nhÉn.");
			WriteLog("[PhÇn th­ëng giang hå chØ nam]:"..GetName().." ®· nhËn ®­îc Träc Yªn nhÉn..");
		elseif ( mFaction == 21 ) then
			AddItem(0, 11, 6015, 1, 1, -1, -1, -1, -1, -1, -1);
			Msg2Player("B¹n ®· nhËn ®­îc Yªu Yªn tr¶o.");
			WriteLog("[PhÇn th­ëng giang hå chØ nam]:"..GetName().." ®· nhËn ®­îc Yªu Yªn tr¶o.");
		end
		funcReward();
	else
		Say("C¸c h¹ ch­a gia nhËp hÖ ph¸i!",1, "ThËt ng¹i qu¸./funcReward");
	end	
end

function funcReward_07()
	Say ( "C¸c h¹ cã thÓ nhËn c¸c vËt phÈm sau ®©y:", 8,
		"NhËn Thiªn Hµ MËt TŞch/funcReward_7_1",
		"NhËn Tö Hµ MËt TŞch/funcReward_7_2",
		"NhËn Chiªm Y MËt TŞch/funcReward_7_3",
		"NhËn MËt tŞch M«n Ph¸i/funcReward_7_4",
		"NhËn Tu Ch©n YÕu QuyÕt/funcReward_7_5",
		"NhËn Nh©n S©m Qu¶/funcReward_7_6",
		"LuyÖn nhanh mËt tŞch chİnh/funcReward_7_7",
		"NhËn vËt phÈm kh¸c!/funcReward"
		)
end

function funcReward_08()
	local nRoute  = GetPlayerRoute();
	local nFaction = GetPlayerFaction()
	if ( GetFreeItemRoom() < 1 ) then
		Say("Sè « trèng trong hµnh trang kh«ng ®ñ", 0);
		return
	end
	
	-- Faction §­êng M«n vµ Vâ §ang bŞ ®¶o ng­îc
	if nFaction == 5 then
		nFaction = 2
	elseif nFaction == 2 then
		nFaction = 5
	end	
	
	if CheckRoute(nRoute) == 1 then
		AddItem(2, 0, nFaction + 606, 1, 1);
		Msg2Player("B¹n ®· nhËn ®­îc 1 tói bİ kiÕp "..tRewardFaction[GetPlayerFaction()]);
		WriteLog("[PhÇn th­ëng giang hå chØ nam]:"..GetName().." ®· nhËn ®­îc 1 tói bİ kiÕp "..tRewardFaction[GetPlayerFaction()]);
		funcReward();
	else
		Say("C¸c h¹ ch­a gia nhËp hÖ ph¸i!",1, "ThËt ng¹i qu¸./funcReward");
	end	
end

function funcReward_09()
	mRoute = GetPlayerRoute();
	if ( GetFreeItemRoom() < 1 ) then
		Say("Sè « trèng trong hµnh trang kh«ng ®ñ", 0);
		return
	end
	if CheckRoute(mRoute) == 1 then
		AddItem(0, 112, tRewardRoute[mRoute][2] + 101, 1);
		Msg2Player("B¹n ®· nhËn ®­îc 1 s¸ch skill trÊn ph¸i "..tRewardRoute[mRoute][1]);
		WriteLog("[PhÇn th­ëng giang hå chØ nam]:"..GetName().." ®· nhËn ®­îc 1 s¸ch skill trÊn ph¸i "..tRewardRoute[mRoute][1]);
		funcReward();
	else
		Say("C¸c h¹ ch­a gia nhËp hÖ ph¸i!",1, "ThËt ng¹i qu¸./funcReward");
	end	
end

function funcReward_10()
	if ( GetFreeItemRoom() < 3 ) then
		Say("Sè « trèng trong hµnh trang kh«ng ®ñ", 0);
		return
	end
	AddItem(2, 1, 484, 1);
	AddItem(2, 1, 490, 1);
	AddItem(2, 1, 496, 1);
	
	Msg2Player("B¹n ®· nhËn ®­îc 1 Sinh Sinh Hãa T¸n (®¹i), 1 H¾c Ngäc §o¹n Tôc Cao (®¹i) vµ 1 V¹n VËt Quy Nguyªn §¬n (®¹i).");
	WriteLog("[PhÇn th­ëng giang hå chØ nam]:"..GetName().." ®· nhËn ®­îc 1 Sinh Sinh Hãa T¸n (®¹i), 1 H¾c Ngäc §o¹n Tôc Cao (®¹i) vµ 1 V¹n VËt Quy Nguyªn §¬n (®¹i).");
	funcReward();
end

function funcReward_11()
	if ( GetFreeItemRoom() < 30 ) then
		Say("Sè « trèng trong hµnh trang kh«ng ®ñ", 0);
		return
	end
	for mCount = 0, 29 do 
		AddItem(2, 17, 2 + mCount, 100, 1); 
	end
	Msg2Player("B¹n ®· nhËn ®­îc 30 s©u cæ.");
	WriteLog("[PhÇn th­ëng giang hå chØ nam]:"..GetName().." ®· nhËn ®­îc 30 s©u cæ.");
	funcReward();
end

function funcReward_12()
	Say ( "C¸c h¹ cã thÓ nhËn c¸c vËt phÈm sau ®©y:", 8,
		"NhËn ngùa Phiªu Vò( chØ nhËn 1 lÇn)/funcReward_12_1",
		"NhËn ThÇn Hµnh B¶o §iÓn/funcReward_12_2",
		"NhËn Thiªn Th¹ch Linh Th¹ch/funcReward_12_3",
		"NhËn MÆt n¹ S¸t thñ §­êng/funcReward_12_4",
		"NhËn Héi Minh LÖnh Bµi/funcReward_12_5",
		"NhËn KÕt H«n LÔ Bao/funcReward_12_6",		
		"NhËn Vâ L©m LÖnh Bµi/funcReward_12_8",
		"NhËn vËt phÈm kh¸c!/funcReward"
		)
end

function funcReward_12_1()
	if ( GetTask(TASK_REWARD_HORSE) == 0 ) then
		if ( GetFreeItemRoom() < 1 ) then
			Say("Sè « trèng trong hµnh trang kh«ng ®ñ", 0);
			return
		end
		AddItem(0, 105, 15, 1, 1, -1, -1, -1, -1, -1, -1);
		SetTask(TASK_REWARD_HORSE, 1) ;
		Msg2Player("B¹n ®· nhËn ®­îc 1ngùa Phiªu Vò.");
		WriteLog("[PhÇn th­ëng giang hå chØ nam]:"..GetName().." ®· nhËn ®­îc ngùa Phiªu Vò.");
		funcReward();
	else
		Say("C¸c h¹ ®· nhËn Ngùa råi, kh«ng thÓ nhËn thªm ®­îc n÷a!",1, "ThËt ng¹i qu¸./funcReward");
	end
end

function funcReward_12_2()
	if ( GetFreeItemRoom() < 1 ) then
		Say("Sè « trèng trong hµnh trang kh«ng ®ñ", 0);
		return
	end
	AddItem(0, 200, 40, 1, 1);
	Msg2Player("B¹n ®· nhËn ®­îc 1 ThÇn Hµnh B¶o §iÓn.");
	WriteLog("[PhÇn th­ëng giang hå chØ nam]:"..GetName().." ®· nhËn ®­îc 1 ThÇn Hµnh B¶o §iÓn.");
	funcReward();
end

function funcReward_12_3()
	if ( GetFreeItemRoom() < 1 ) then
		Say("Sè « trèng trong hµnh trang kh«ng ®ñ", 0);
		return
	end
	AddItem(2, 1, 1068, 1, 1);
	Msg2Player("B¹n ®· nhËn ®­îc 1 Thiªn Th¹ch Linh Th¹ch.");
	WriteLog("[PhÇn th­ëng giang hå chØ nam]:"..GetName().." ®· nhËn ®­îc 1 Thiªn Th¹ch Linh Th¹ch.");
	funcReward();
end

function funcReward_12_4()
	if ( GetFreeItemRoom() < 1 ) then
		Say("Sè « trèng trong hµnh trang kh«ng ®ñ", 0);
		return
	end
	AddItem(2, 1, 1087, 1, 1);
	Msg2Player("B¹n ®· nhËn ®­îc 1 MÆt n¹ S¸t thñ §­êng.");
	WriteLog("[PhÇn th­ëng giang hå chØ nam]:"..GetName().." ®· nhËn ®­îc 1 MÆt n¹ S¸t thñ §­êng.");
	funcReward();
end

function funcReward_12_5()
	if ( GetFreeItemRoom() < 1 ) then
		Say("Sè « trèng trong hµnh trang kh«ng ®ñ", 0);
		return
	end
	AddItem(2, 0, 125, 1, 1);
	Msg2Player("B¹n ®· nhËn ®­îc 1 Héi Minh LÖnh Bµi.");
	WriteLog("[PhÇn th­ëng giang hå chØ nam]:"..GetName().." ®· nhËn ®­îc 1 Héi Minh LÖnh Bµi.");
	funcReward();
end

function funcReward_12_6()
	if ( GetFreeItemRoom() < 1 ) then
		Say("Sè « trèng trong hµnh trang kh«ng ®ñ", 0);
		return
	end
	AddItem(2, 1, 585, 1, 1);
	Msg2Player("B¹n ®· nhËn ®­îc 1 KÕt H«n LÔ Bao.");
	WriteLog("[PhÇn th­ëng giang hå chØ nam]:"..GetName().." ®· nhËn ®­îc 1 KÕt H«n LÔ Bao.");
	funcReward();
end

function funcReward_12_7()
	if ( GetFreeItemRoom() < 1 ) then
		Say("Sè « trèng trong hµnh trang kh«ng ®ñ.",0);
		return
	end
	AddItem(2, 0, 141, 1, 1);
	Msg2Player("B¹n ®· nhËn ®­îc 1 Tiªu KiÕp T¸n.");
	WriteLog("[PhÇn th­ëng giang hå chØ nam]:"..GetName().." ®· nhËn ®­îc 1 Tiªu KiÕp T¸n.");
	funcReward();
end

function funcReward_12_8()
	if ( GetFreeItemRoom() < 1 ) then
		Say("Sè « trèng trong hµnh trang kh«ng ®ñ", 0);
		return
	end
	AddItem(2, 1, 29000, 1, 1);
	Msg2Player("B¹n ®· nhËn ®­îc 1 Vâ L©m LÖnh Bµi.");
	WriteLog("[PhÇn th­ëng giang hå chØ nam]:"..GetName().." ®· nhËn ®­îc 1 Vâ L©m LÖnh Bµi.");
	funcReward();
end

function funcReward_7_1()
	if ( GetFreeItemRoom() < 1 ) then
		Say("Sè « trèng trong hµnh trang kh«ng ®ñ", 0);
		return
	end
	AddItem(0, 107, 64, 1, 1);
	Msg2Player("B¹n ®· nhËn ®­îc 1 Thiªn Hµ MËt TŞch.");
	WriteLog("[PhÇn th­ëng giang hå chØ nam]:"..GetName().." ®· nhËn ®­îc 1 Thiªn Hµ MËt TŞch.");
	funcReward();
end

function funcReward_7_2()
	if ( GetFreeItemRoom() < 1 ) then
		Say("Sè « trèng trong hµnh trang kh«ng ®ñ", 0);
		return
	end
	AddItem(0, 107, 65, 1, 1);
	Msg2Player("B¹n ®· nhËn ®­îc 1 Tö Hµ MËt TŞch.");
	WriteLog("[PhÇn th­ëng giang hå chØ nam]:"..GetName().." ®· nhËn ®­îc 1 Tö Hµ MËt TŞch.");
	funcReward();
end

function funcReward_7_3()
	if ( GetFreeItemRoom() < 1 ) then
		Say("Sè « trèng trong hµnh trang kh«ng ®ñ", 0);
		return
	end
	AddItem(0, 107, 66, 1, 1);
	Msg2Player("B¹n ®· nhËn ®­îc 1 Chiªm Y MËt TŞch.");
	WriteLog("[PhÇn th­ëng giang hå chØ nam]:"..GetName().." ®· nhËn ®­îc 1 Chiªm Y MËt TŞch.");
	funcReward();
end

function funcReward_7_4()
	mRoute = GetPlayerRoute();
	if ( GetFreeItemRoom() < 2 ) then
		Say("Sè « trèng trong hµnh trang kh«ng ®ñ", 0);
		return
	end
	if CheckRoute(mRoute) == 1 then
		AddItem(0, 107, tRewardRoute[mRoute][2] + 166, 1, 1);		
		Msg2Player("B¹n ®· nhËn ®­îc 1 MËt tŞch m«n ph¸i "..tRewardRoute[mRoute][1]);
		WriteLog("[PhÇn th­ëng giang hå chØ nam]:"..GetName().." ®· nhËn ®­îc 1 MËt tŞch m«n ph¸i "..tRewardRoute[mRoute][1]);
		funcReward();
	else
		Say("C¸c h¹ ch­a gia nhËp hÖ ph¸i!",1, "ThËt ng¹i qu¸./funcReward");
	end	
end

function funcReward_7_5()
	if ( GetFreeItemRoom() < 1 ) then
		Say("Sè « trèng trong hµnh trang kh«ng ®ñ", 0);
		return
	end
	AddItem(2, 0, 554, 1, 1 );
	Msg2Player("B¹n ®· nhËn ®­îc 1 Tu Ch©n YÕu QuyÕt.");
	WriteLog("[PhÇn th­ëng giang hå chØ nam]:"..GetName().." ®· nhËn ®­îc 1 Tu Ch©n YÕu QuyÕt.");
	funcReward();
end

function funcReward_7_6()
	if ( GetFreeItemRoom() < 1 ) then
		Say("Sè « trèng trong hµnh trang kh«ng ®ñ", 0);
		return
	end
	AddItem(2, 0, 553, 1, 1);
	Msg2Player("B¹n ®· nhËn ®­îc 1 §¹i Nh©n S©m.");
	WriteLog("[PhÇn th­ëng giang hå chØ nam]:"..GetName().." ®· nhËn ®­îc 1 §¹i Nh©n S©m.");
	funcReward();
end

function funcReward_7_7()	
	for i=1,100 do LevelUpBook() end                    
	Msg2Player("MËt tŞch ®· ®­îc luyÖn ®Õn møc tèi ®a.");
	funcReward()
end

function cancel()
end
