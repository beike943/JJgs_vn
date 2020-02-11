Include("\\script\\lib\\string.lua");
Include("\\script\\online\\worldcup06\\worldcup_head.lua");
Include("\\script\\class\\ktabfile.lua")
Include("\\script\\online\\afterworldcup06\\award_npc.lua");

tabLVEXP = new(KTabFile, "\\settings\\uplevel.txt");

function main()
	local sContent = "";
	local nDate = tonumber(date("%m%d"));
	local selTab = {
			"L·nh phÇn th­ëng ho¹t ®éng hái ®¸p cóp thÕ giíi cã th­ëng/getaward",
			"\n*Tham gia ho¹t ®éng cóp thÕ giíi*\n\n/handinhand_main",
			"Ta chØ ®Õn xem thö/nothing",
			}
	if GetLevel() <= 10 then
		Talk(1,"","Xin lçi! Ho¹t ®ång lÇn nµy chØ dµnh cho nh©n vËt cã ®¼ng cÊp <color=yellow>lín h¬n cÊp 10<color>");
		return 0;
	end;
	if nDate > 630 then	--È¥µô¾¹²Â4Ç¿¡¢¾öÈü¶Ó¡¢¹Ú¾üÑ¡Ïî
		tinsert(selTab,1,"T×m dù ®o¸n cuèi cïng cña ta/seefinalforecast");
	end;
	Say("Chóc mõng ®éi ý ®o¹t cóp thÕ giíi 2006 ë §øc! Chóc mõng c¸c cæ ®éng viªn cña ®éi ý, cæ ®éng viªn cña ®éi kh¸c còng ®õng buån, 4 n¨m sau chóng ta l¹i gÆp nhau ë cóp thÕ giíi 2010 ë Nam Phi.",getn(selTab),selTab);
end;
--===============================================================================================
--===============================================================================================
function getaward()
	local selTab = {
			"L·nh phÇn th­ëng tÝch lòy/#getweekaward(0)",
			"L·nh phÇn th­ëng dù ®o¸n kÕt qu¶ chung cuéc/getfinalaward",
			"Ta sÏ l·nh sau/main"
			}
	Say("Ho¹t ®éng lÇn nµy chuÈn bÞ cho b¹n nh÷ng gi¶i th­ëng phong phó, b¹n muèn l·nh phÇn th­ëng nµo?",getn(selTab),selTab);
end;

function getweekaward(nType)
	local nAnswerCount,nRightAnswerCount = 0,0;
	local nForecastCount,nRightForecastCount = 0,0;
	if nType == 0 then
		local selTab = {
				"NhËn phÇn th­ëng tÝch lòy tr¶ lêi c©u hái/#getweekaward(1)",
				"Ta sÏ l·nh sau/main",
				}
		Say("B¹n muèn l·nh phÇn th­ëng tÝch lòy nµo?",getn(selTab),selTab);
	elseif nType == 1 then
		local nWeekTag = GetTask(AWARD_WEEK1);
		if nWeekTag < 0 or nWeekTag > 4 then
			Talk(1,"main","Xin lçi! HÖ thèng b¸o lçi, xin liªn hÖ phôc vô kh¸ch hµng.");
			WriteLog("[Lçi hái ®¸p cóp thÕ giíi cã th­ëng]: Lçi trÞ GetTask(AWARD_WEEK1), AWARD_WEEK1 lµ:"..AWARD_WEEK1..". TrÞ b¸o lçi:"..nWeekTag);
			return 0;			
		end;
		if nWeekTag == WEEK1 then
			Talk(1,"main","Giai ®o¹n ®Çu (25 th¸ng 6 ®Õn 10 th¸ng 7) PhÇn th­ëng tÝch lòy tr¶ lêi c©u hái cña ®¹i hiÖp ®· nhËn ®ñ, xin ng­êi h·y tiÕp tôc tham gia chê lÇn ph¸t th­ëng sau.");
			return 0;
		end;
		nAnswerCount,nRightAnswerCount = get_answer_result();
		if nAnswerCount == 9999 then	--±íÊ¾Ê±¼äÎ´µ½
			Talk(1,"getaward","Xin lçi! Ch­a ®Õn thêi gian ph¸t th­ëng, tuÇn sau míi ph¸t th­ëng, b¹n h·y chó ý theo dâi");
			return 0;
		end;
		if nAnswerCount == 0 then
			Talk(1,"","Xin lçi! Giai ®o¹n ®Çu (25 th¸ng 6 ®Õn 10 th¸ng 7) ®¹i hiÖp kh«ng cã tham gia ho¹t ®éng tr¶ lêi c©u hái, kh«ng thÓ nhËn phÇn th­ëng.");
			return 0;
		end;
		local selTab = {
				"Ta muèn l·nh ngay/#getweekaward_confirm(1,"..nRightAnswerCount..")",
				"Ta sÏ quay l¹i sau/nothing",
				}
		if nRightAnswerCount == 0 then
			Talk(1,"main","Giai ®o¹n ®Çu (25 th¸ng 6 ®Õn 10 th¸ng 7) ®¹i hiÖp tr¶ lêi tæng céng c©u hái cña <color=yellow>"..nAnswerCount.."<color> ngµy. B¹n ®· ®¸p sai hoµn toµn, hy väng lÇn sau may m¾n h¬n.");
			return 0;
		end;
		Say("Giai ®o¹n ®Çu (25 th¸ng 6 ®Õn 10 th¸ng 7) ®¹i hiÖp tr¶ lêi tæng céng c©u hái cña <color=yellow>"..nAnswerCount.."ngµy, trong ®ã ®¸p ®óng <color=yellow>"..nRightAnswerCount.."<color> ngµy, nhËn ®­îc phÇn th­ëng <color=red>"..nRightAnswerCount.."<color>, tr­íc khi l·nh th­ëng x¸c nhËn hµnh trang cßn chç trèng vµ søc lùc, tr¸nh tæn thÊt ngoµi ý muèn, Kh¸ch quan muèn l·nh phÇn th­ëng ngay b©y giê?",getn(selTab),selTab);
	elseif nType == 2 then
		local nWeekTag = GetTask(AWARD_WEEK2);
		if nWeekTag < 0 or nWeekTag > 2 then
			Talk(1,"main","Xin lçi! HÖ thèng b¸o lçi, xin liªn hÖ phôc vô kh¸ch hµng.");
			WriteLog("[Lçi hái ®¸p cóp thÕ giíi cã th­ëng]: Lçi trÞ sè GetTask(AWARD_WEEK2), trÞ sè AWARD_WEEK2:"..AWARD_WEEK2..". TrÞ b¸o lçi:"..nWeekTag);
			return 0;			
		end;
		if nWeekTag == WEEK2 then
			Talk(1,"main","TuÇn tr­íc (16 th¸ng 6 ®Õn 23 th¸ng 6) ®¹i hiÖp ®· nhËn phÇn th­ëng tÝch lòy dù ®o¸n kÕt qu¶ thi ®Êu, b¹n h·y tiÕp tôc tham gia vµ chê lÇn ph¸t th­ëng sau.");
			return 0;
		end;
		nForecastCount,nRightForecastCount = get_forecast_result();
		if nForecastCount == 9999 then
			Talk(1,"getaward","Xin lçi! Ch­a ®Õn thêi gian ph¸t th­ëng, tuÇn sau míi ph¸t th­ëng, b¹n h·y chó ý theo dâi");
			return 0;	--±íÊ¾Ê±¼äÎ´µ½
		end;
		if nForecastCount == 0 then
			Talk(1,"","Xin lçi! TuÇn tr­íc (16 th¸ng 6 ®Õn 23 th¸ng 6) b¹n kh«ng tham gia dù ®o¸n kÕt qu¶ thi ®Êu, kh«ng thÓ nhËn phÇn th­ëng.");
			return 0;		
		end;
		local selTab = {
				"Ta muèn l·nh ngay/#getweekaward_confirm(2,"..nRightForecastCount..")",
				"Ta sÏ quay l¹i sau/nothing",
				}
		if nRightForecastCount == 0 then
			Talk(1,"main","TuÇn tr­íc (16 th¸ng 6 ®Õn 23 th¸ng 6) ®¹i hiÖp ®· dù ®o¸n tæng céng kÕt qu¶ thi ®Êu cña <color=yellow>"..nForecastCount.."<color> ngµy, ng­êi ®· dù ®o¸n sai, hy väng lÇn sau sÏ may m¾n h¬n.");
			return 0;
		end;
		Say("TuÇn tr­íc (16 th¸ng 6 ®Õn 23 th¸ng 6) ®¹i hiÖp ®· dù ®o¸n tæng céng kÕt qu¶ thi ®Êu cña <color=yellow>"..nForecastCount.."<color> ngµy, trong ®ã dù ®o¸n ®óng <color=yellow>"..nRightForecastCount.."<color> ngµy, nhËn ®­îc phÇn th­ëng <color=red>"..nRightForecastCount.."<color>, tr­íc khi l·nh th­ëng x¸c nhËn hµnh trang cßn chç trèng vµ søc lùc, tr¸nh tæn thÊt ngoµi ý muèn, Kh¸ch quan muèn l·nh phÇn th­ëng ngay b©y giê?",getn(selTab),selTab);
	end;
end;

tWeapon = {
	{"V¹n NhÉn ch­a gi¸m ®Þnh",2,1,375},
	{"Háa Tinh ch­a gi¸m ®Þnh",2,1,376},
	{"LiÖt DiÖm ch­a gi¸m ®Þnh",2,1,377},
	{"M·n Thiªn Hoa Vò ch­a gi¸m ®Þnh",2,1,378},
	{"Cæ §Ýnh ch­a gi¸m ®Þnh",2,1,379},
	{"Hi Nh©n CÇm ch­a gi¸m ®Þnh",2,1,380},
	{"ThÇn Hµnh ch­a gi¸m ®Þnh",2,1,381},
	{"A La H¸n Tr­îng ch­a gi¸m ®Þnh",2,1,382},
	{"§¹i Hµo L«i Th­¬ng ch­a gi¸m ®Þnh",2,1,383},
	{"ThÇn Cung ch­a gi¸m ®Þnh",2,1,384},
	{"M·nh Hæ ch­a gi¸m ®Þnh",2,1,385},
	{"L¨ng Phong ch­a gi¸m ®Þnh",2,1,386},
}

function getweekaward_confirm(nType,nCount)
	if nType == 1 then
		local nRow = tonumber(tabLVEXP:selectRowNum("CÊp",GetLevel()+1))
		local nExp = tonumber(tabLVEXP:getCell(nRow,"Kinh nghiÖm ®¼ng cÊp nh©n vËt"))
		if nExp < 0 or nExp > 986241823 then	--ÒÔÐ¡ÓÚ0»ò´óÓÚÉý92¼¶ËùÐè¾­ÑéÎªÒì³£
			WriteLog("[Lçi hái ®¸p cóp thÕ giíi cã th­ëng]:"..GetName().."TrÞ sè ®iÓm kinh nghiÖm phÇn th­ëng nhËn ®­îc dÞ th­êng, trÞ sè lµ:"..nExp);
			return 0;
		end;
		SetTask(AWARD_WEEK1,WEEK1);
		ModifyExp(floor(nExp/100)*nCount);
		Msg2Player("B¹n nhËn ®­îc "..nCount.."% kinh nghiÖm");
		if AddItem(2,0,398,nCount) == 1 then
			Msg2Player("B¹n nhËn ®­îc "..nCount.."h¹t gièng c©y Th¸i H­ B¸t Nh·");
		end;
		if AddItem(1,0,32,3*nCount) == 1 then
			Msg2Player("B¹n nhËn ®­îc "..3*nCount.." Cöu ChuyÓn Hoµn Hån §¬n");
		end;
		WriteLog("[Hái ®¸p cóp thÕ giíi cã th­ëng]:"..GetName().."T¹i cóp thÕ giíi tuÇn thø"..WEEK1.."nhËn ®­îc phÇn th­ëng tÝch lòy tr¶ lêi c©u hái. Sè l­îng phÇn th­ëng lµ"..nCount..".");
		Talk(1,"main","§©y lµ phÇn th­ëng tÝch lòy tr¶ lêi c©u hái! Xin h·y nhËn lÊy.");
	else
		SetTask(AWARD_WEEK2,WEEK2);
		Earn(200000*nCount);
		if AddItem(2,2,8,5*nCount) == 1 then
			Msg2Player("B¹n nhËn ®­îc "..5*nCount.."Thiªn th¹ch");
		end;
		if GetLevel() >= 75 then
			for i=1,nCount do
				local nWeaponIndex = random(1,getn(tWeapon));
				if AddItem(tWeapon[nWeaponIndex][2],tWeapon[nWeaponIndex][3],tWeapon[nWeaponIndex][4],1) == 1 then
					Msg2Player("B¹n nhËn ®­îc 1 mãn vò khÝ:"..tWeapon[nWeaponIndex][1]);
				end;
			end;	
		end;
		WriteLog("[Hái ®¸p cóp thÕ giíi cã th­ëng]:"..GetName().."T¹i cóp thÕ giíi tuÇn thø"..WEEK2.."nhËn ®­îc phÇn th­ëng tÝch lòy tr¶ lêi c©u hái. Sè l­îng phÇn th­ëng lµ"..nCount..".");
		Talk(1,"main","§©y lµ phÇn th­ëng tÝch lòy dù ®o¸n bãng ®¸! Xin h·y nhËn lÊy.");
	end;
end;

function get_answer_result()	--Õâ¸öº¯ÊýÐèÒªÔÚ°æ±¾¸üÐÂµÄÊ±ºò¸üÐÂ
	local nDate = tonumber(date("%m%d"));
	local nAnswerCount,nRightAnswerCount = 0,0;
	local nAnswer = 0;
	if nDate < 714 then	--¸üÐÂÊ±Õâ¸öÒ²Òª¸Ä±ä£¬ÏÂ´ÎÊÇ626,ÔÙÏÂ´ÎÊÇ701,ÔÙÔÙÏÂ´ÎÊÇ703,ÔÙÔÙÔÙÏÂ´ÎÊÇ714
		return 9999;
	end;
	for i=16,31 do	--µÚÒ»´Î¸üÐÂºóÓ¦¸ÄÎª for i=8,15 do£¬µÚ¶þ´Î¸üÐÂºóÓ¦¸ÄÎª for i=16,23 do£¬µÚÈý´Î¸üÐÂºóÓ¦¸ÄÎª for i=24,31 do
		nAnswer = GetTask(ANSWER610+i-1);
		if nAnswer ~= 0 then
			if nAnswer == tMatchResult[i] then
				nRightAnswerCount = nRightAnswerCount + 1;
			end;
			nAnswerCount = nAnswerCount + 1;
		end;
	end;
	return nAnswerCount,nRightAnswerCount;
end;

function getfinalaward()
	if GetTask(AWARD_FINAL) == 1 then
		Talk(1,"getaward","Xin lçi! Ng­êi ®· nhËn phÇn th­ëng cuèi cïng råi.");
		return 0;
	end;
	if GetTask(AWARD_FINAL) == 2 then
		local selTab = {
					"Ta muèn l·nh ngay/get_worldcup_ring",
					"Ta sÏ quay l¹i sau/nothing",
					}
		Say("§¹i Lùc ThÇn H¹ng Liªn cña ®¹i hiÖp ®· lµm xong, b©y giê ng­êi muèn l·nh?",getn(selTab),selTab);
		return 0;
	end;
	local nDate = tonumber(date("%m%d"));
	if nDate <= 713 then
		Talk(1,"getaward","Xin lçi! Ch­a ®Õn thêi gian ph¸t th­ëng, phÇn th­ëng nµy sÏ ph¸t vµo ngµy <color=yellow>14 th¸ng 7<color>, xin b¹n chó ý.");
		return 0;
	end;	
	if GetTask(TEAM4_1) == 0 and GetTask(TEAM2_1) == 0 and GetTask(TEAM_CHAMPION) == 0 then
		Talk(1,"getaward","Xin lçi! §¹i hiÖp kh«ng cã tham gia ho¹t ®éng dù ®o¸n kÕt qu¶, kh«ng thÓ nhËn phÇn th­ëng.");
		return 0;
	end;
	local sContent = "B¹n ®· tham dù "
	local tTable = {
			{"","<color=yellow>Dù ®o¸n 4 ®éi cuèi cïng<color>,",""},
			{"","<color=yellow>Dù ®o¸n ®éi vµo chung kÕt<color>,",""},
			{"","<color=yellow>Dù ®o¸n ®éi v« ®Þch<color>,",""},
			}
	local tAward = {
			{"","<color=yellow>1 quyÓn mËt tÞch s­ m«n<color>,",""},
			{"","<color=yellow>1 quyÓn sæ tay chÕ t¹o vò khÝ<color>,",""},
			{"","<color=yellow>1 bé trang phôc ®éi bãng v« ®Þch<color>,",""},
			}
	local nResult1 = judge_team4();
	local nResult2 = judge_team2();
	local nResult3 = judge_team_champion();
	if nResult1 == 3 and nResult2 == 3 and nResult3 == 3 then
		Talk(1,"getaward","<color=green>§øa bÐ<color>:"..sContent..tTable[1][nResult1-1]..tTable[2][nResult2-1]..tTable[3][nResult3-1].."KÕt qu¶ b¹n dù ®o¸n ®· sai, hy väng b¹n sÏ may m¾n h¬n.");
		return 0;
	elseif nResult1 == 2 or nResult2 == 2 or nResult3 == 2 then
		local selTab = {
				"Ta muèn l·nh ngay/givefinalaward",
				"Ta sÏ quay l¹i sau/nothing",
				}
		local sBigPrize = "";
		if nResult1 == 2 and nResult2 == 2 and nResult3 == 2 then
			sBigPrize = "Ngoµi ra, do b¹n dù ®o¸n ®óng 3 lÇn, b¹n cßn nhËn ®­îc phÇn th­ëng ®Æc biÖt: <color=yellow>1 sîi §¹i Lùc ThÇn H¹ng Liªn<color>.";
		end;
		local sMiJi = "";
		if nResult1 == 2 then
			sMiJi = "<color=red> Chó ý: Nh©n vËt ®¼ng cÊp d­íi 50 hoÆc ch­a theo tr­êng ph¸i sÏ kh«ng nhËn ®­îc mËt tÞch s­ m«n<color>.";
		end;
		Say("B¹n dù ®o¸n,"..tTable[1][nResult1]..tTable[2][nResult2]..tTable[3][nResult3].."lµ chÝnh x¸c, phÇn th­ëng cña b¹n lµ:"..tAward[1][nResult1]..tAward[2][nResult2]..tAward[3][nResult3]..sBigPrize.."B©y giê ph¸t phÇn th­ëng cho b¹n"..sMiJi.."Xin x¸c nhËn hµnh trang cßn chç trèng",getn(selTab),selTab);
	else
		Talk(1,"","Xin lçi! Dù ®o¸n cña b¹n kh«ng chÝnh x¸c, kh«ng thÓ nhËn phÇn th­ëng.");
	end;
end;

function givefinalaward()
	local nResult1 = judge_team4();
	local nResult2 = judge_team2();
	local nResult3 = judge_team_champion();
	local nRetCode = 0;
	SetTask(AWARD_FINAL,1);
	if nResult1 == 2 then
		if GetLevel() < 50 then
			nRetCode = AddItem(0,107,random(59,60),1,1);
			if nRetCode == 1 then
				Msg2Player("B¹n nhËn ®­îc 1 quyÓn mËt tÞch");
			else
				WriteLog("[Lçi hái ®¸p cóp thÕ giíi cã th­ëng]:"..GetName().."AddItem(0,107,random(59,60),1,1) trÞ quay l¹i lµ:"..nRetCode);
			end;
			WriteLog("[Hái ®¸p cóp thÕ giíi cã th­ëng]:"..GetName().."NhËn ®­îc quyÓn mËt tÞch (PhÇn th­ëng cña ®¼ng cÊp nhá h¬n 50)");
		else
			local nPlayerRoute = GetPlayerRoute();
			if nPlayerRoute == 2 then	--ÉÙË×
				give_book({0,107,1},{0,107,2});
			elseif nPlayerRoute == 3 then	--ìøÉ®
				give_book({0,107,5},{0,107,6});
			elseif nPlayerRoute == 4 then	--ÎäÉ®
				give_book({0,107,3},{0,107,4});
			elseif nPlayerRoute == 6 then 	--ÌÆÃÅ
				give_book({0,107,7},{0,107,8});
			elseif nPlayerRoute == 8 then	--FMM
				give_book({0,107,9},{0,107,10});
			elseif nPlayerRoute == 9 then	--QMM
				give_book({0,107,11},{0,107,12});
			elseif nPlayerRoute == 11 then	--¾»ÒÂ
				give_book({0,107,13},{0,107,14});
			elseif nPlayerRoute == 12 then	--ÎÛÒÂ
				give_book({0,107,15},{0,107,16});
			elseif nPlayerRoute == 14 then	--ÎäµÀ
				give_book({0,107,17},{0,107,18});
			elseif nPlayerRoute == 15 then	--ÎäË×
				give_book({0,107,19},{0,107,20});
			elseif nPlayerRoute == 17 then	--ÑîÇ¹
				give_book({0,107,21},{0,107,22});
			elseif nPlayerRoute == 18 then	--Ñî¹­
				give_book({0,107,23},{0,107,24});
			elseif nPlayerRoute == 20 then	--Ð°ÏÀ
				give_book({0,107,25},{0,107,26});
			elseif nPlayerRoute == 21 then	--¹ÆÊ¦
				give_book({0,107,27},{0,107,28});
			else
				nRetCode = AddItem(0,107,66,1,1);
				if nRetCode == 1 then
					Msg2Player("B¹n nhËn ®­îc 1 quyÓn Niªm Y Phæ");
				else
					WriteLog("[Lçi hái ®¸p cóp thÕ giíi cã th­ëng]:"..GetName().."AddItem(0,107,66,1,1) trÞ quay l¹i lµ:"..nRetCode);
				end;
				WriteLog("[Hái ®¸p cóp thÕ giíi cã th­ëng]:"..GetName().."NhËn ®­îc 1 quyÓn Niªm Y Phæ, ®­êng m«n ph¸i ng­êi ch¬i theo lµ:"..nPlayerRoute);			
			end;
		end;
	end;
	if nResult2 == 2 then
		nRetCode = AddItem(2,0,397,1);
		if nRetCode == 1 then
			Msg2Player("B¹n nhËn ®­îc 1 quyÓn sæ tay chÕ t¹o vò khÝ");
		else
			WriteLog("[Lçi hái ®¸p cóp thÕ giíi cã th­ëng]:"..GetName().."AddItem(2,0,397,1) trÞ quay l¹i lµ:"..nRetCode);
		end;
		WriteLog("[Hái ®¸p cóp thÕ giíi cã th­ëng]:"..GetName().."NhËn ®­îc 1 quyÓn sæ tay chÕ t¹o vò khÝ");
	end;
	if nResult3 == 2 then
		local nBodyType = GetBody();
		if nBodyType == 1 then
			nRetCode = AddItem(0,109,149,1);
		elseif nBodyType == 2 then
			nRetCode = AddItem(0,109,150,1);
		elseif nBodyType == 3 then
			nRetCode = AddItem(0,109,151,1);
		else
			nRetCode = AddItem(0,109,152,1);
		end
		if nRetCode == 1 then
			Msg2Player("B¹n nhËn ®­îc 1 bé trang phôc ®éi bãng v« ®Þch");
		else
			WriteLog("[Lçi hái ®¸p cóp thÕ giíi cã th­ëng]:"..GetName().."AddItem(trang phôc ®éi bãng v« ®Þch,1) trÞ quay l¹i lµ:"..nRetCode);
		end;
		WriteLog("[Hái ®¸p cóp thÕ giíi cã th­ëng]:"..GetName().."B¹n nhËn ®­îc 1 bé trang phôc ®éi bãng v« ®Þch");
	end;
	if nResult1 == 2 and nResult2 == 2 and nResult3 == 2 then
		nRetCode = AddItem(0,102,28,1,1,-1,-1,-1,-1,-1,-1);
		if nRetCode == 1 then
			Msg2Player("B¹n nhËn ®­îc 1 sîi §¹i Lùc ThÇn H¹ng Liªn");
		else
			WriteLog("[Lçi hái ®¸p cóp thÕ giíi cã th­ëng]:"..GetName().."AddItem(§¹i Lùc ThÇn H¹ng Liªn,1) trÞ quay l¹i lµ:"..nRetCode);
		end;
		WriteLog("[Hái ®¸p cóp thÕ giíi cã th­ëng]:"..GetName().."NhËn ®­îc 1 sîi §¹i Lùc ThÇn H¹ng Liªn");	
	end;
	Talk(1,"main","§©y lµ phÇn th­ëng cuèi cïng cña ®¹i hiÖp, h·y nhËn lÊy.");
end;

function give_book(tBook1,tBook2)
	local nRetCode = 0;
	if random(1,2) == 1 then
		nRetCode = AddItem(tBook1[1],tBook1[2],tBook1[3],1,1);
		if nRetCode == 1 then
			Msg2Player("B¹n nhËn ®­îc 1 quyÓn mËt tÞch");
			WriteLog("[Hái ®¸p cóp thÕ giíi cã th­ëng]:"..GetName().."NhËn ®­îc quyÓn mËt tÞch");
		else
			WriteLog("[Lçi hái ®¸p cóp thÕ giíi cã th­ëng]:"..GetName().."Trong hµm sè give_book trÞ quay l¹i AddItem lµ:"..nRetCode);
		end;
	else
		nRetCode = AddItem(tBook2[1],tBook2[2],tBook2[3],1,1);
		if nRetCode == 1 then
			Msg2Player("B¹n nhËn ®­îc 1 quyÓn mËt tÞch");
			WriteLog("[Hái ®¸p cóp thÕ giíi cã th­ëng]:"..GetName().."NhËn ®­îc quyÓn mËt tÞch");
		else
			WriteLog("[Lçi hái ®¸p cóp thÕ giíi cã th­ëng]:"..GetName().."Trong hµm sè give_book trÞ quay l¹i AddItem lµ:"..nRetCode);
		end;
	end;
end;

function judge_team4()
	if GetTask(TEAM4_1) == 0 then
		return 1;	--±íÊ¾Ã»²Î¼Ó¹ýÔ¤²â
	end;
	for i=TEAM4_1,TEAM4_4 do
		for j=1,4 do
			if GetTask(i) == tTeam4Result[j] then
				break;
			else
				if j == 4 then
					return 3;	--±íÊ¾Ã»ÓÐÍêÈ«Ô¤²â¶Ô
				end;
			end;
		end;
	end;
	return 2;	--±íÊ¾Ô¤²âÈ«¶Ô
end;

function judge_team2()
	if GetTask(TEAM2_1) == 0 then
		return 1;
	end;
	for i=TEAM2_1,TEAM2_2 do
		for j=1,2 do
			if GetTask(i) == tTeam2Result[j] then
				break;
			else
				if j == 2 then
					return 3;
				end;
			end;
		end;
	end;
	return 2;
end;

function judge_team_champion()
	if GetTask(TEAM_CHAMPION) == 0 then
		return 1;
	end;
	if GetTask(TEAM_CHAMPION) ~= nTeamChampion then
		return 3;
	else
		return 2;
	end;
end;
--===============================================================================================
--===============================================================================================
function checktime()
	local nHour = tonumber(date("%H"));
	if nHour >= 12 and nHour < 21 then	--ÖÐÎç12µãÖÁÍíÉÏ9µã»Ø´ðÎÊÌâºÍÔ¤²â±ÈÈüÊ±¼ä
		return 1;
	else
		return 1;
	end;
end;

function confirm()
	Talk(1,"main","C¸m ¬n §¹i hiÖp ®· tham gia, xin tiÕp tôc theo dâi cóp thÕ giíi, VLTK 2 sÏ cïng b¹n tËn h­ëng niÒm vui nµy.");
end;

function knowdetail()
	local selTab = {
			"Lµm sao tr¶ lêi c©u hái?/howtoanswer",
			"Lµm sao dù ®o¸n c©u hái?/howtoforecast",
			"Lµm sao nhËn phÇn th­ëng?/howtogetaward",
			"Ta ®· hiÓu råi/main",
			}
	Say("§¹i hiÖp cã g× kh«ng hiÓu xin cø hái ch¸u!",getn(selTab),selTab);
end;

function howtoanswer()
	Talk(1,"knowdetail","<color=yellow>Mçi ngµy tõ 12 giê tr­a ®Õn 9 giê tèi<color>, ng­êi cã thÓ ®Õn ®©y tr¶ lêi t×nh h×nh cóp thÕ giíi tèi qua vµ r¹ng s¸ng nay, ng­êi chØ cÇn c¨n cø kÕt qu¶ thi ®Êu chän c©u tr¶ lêi chÝnh x¸c, ho¹t ®éng tr¶ lêi c©u hái kÐo dµi ®Õn khi cóp thÕ giíi kÕt thóc.");
end;

function howtoforecast()
	Talk(3,"knowdetail","<color=yellow>Mçi ngµy tõ 12 giê tr­a ®Õn 9 giê tèi<color>, ng­êi cã thÓ ®Õn ®©y dù ®o¸n kÕt qu¶ thi ®Êu bãng ®¸ tèi nay vµ r¹ng s¸ng mai, c¨n cø vµo kinh nghiÖm vµ trùc gi¸c ®Ó chän, ch¸u sÏ ghi l¹i kÕt qu¶ ng­êi dù ®o¸n, sau mét thêi gian ng­êi cã thÓ ®Õn ®©y nhËn phÇn th­ëng.",
					"Ng­êi cã thÓ ®Õn ®Ó thay ®æi lùa chän cña m×nh tr­íc 9 giê tèi.",
					"Sau khi vßng b¶ng cóp thÕ giíi kÕt thóc, dù ®o¸n giai ®o¹n vßng b¶ng còng sÏ chÊm døt, ng­êi cã thÓ b¾t ®Çu dù ®o¸n 4 ®éi vµo b¸n kÕt, ®éi h¹ng 2 vµ ®éi v« ®Þch, thêi gian dù ®o¸n chÊm døt tr­íc vßng tø kÕt, tøc 9 giê ngµy 30 th¸ng 6.");
end;

function howtogetaward()
	local selTab = {
	"Gi¶i tham gia mçi ngµy/#awarddetail(1)",
	"Gi¶i tr¶ lêi c©u hái tÝch lòy/#awarddetail(2)",
	"Gi¶i dù ®o¸n kÕt qu¶ thi ®Êu tÝch lòy/#awarddetail(3)",
	"Gi¶i dù ®o¸n 4 ®éi vµo b¸n kÕt/#awarddetail(4)",
	"Gi¶i dù ®o¸n ®éi vµo chung kÕt/#awarddetail(5)",
	"Gi¶i dù ®o¸n ®éi v« ®Þch/#awarddetail(6)",
	"Gi¶i ®Æc biÖt/#awarddetail(7)",
	"Ta hiÓu råi!/knowdetail",
	};
	Say("Gi¶i th­ëng ho¹t ®éng nµy rÊt phong phó, chØ cÇn tham gia lµ cã th­ëng. Gi¶i th­ëng chia lµm nhiÒu d¹ng: gi¶i tham gia mçi ngµy, gi¶i tr¶ lêi c©u hái tÝch lòy, gi¶i dù ®o¸n kÕt qu¶ tÝch lòy, gi¶i dù ®o¸n 4 ®éi vµo b¸n kÕt, gi¶i",getn(selTab),selTab);
end;

function awarddetail(nType)
	if nType == 1 then
		Talk(1,"howtogetaward","Gi¶i tham gia mçi ngµy lµ phÇn th­ëng sau khi tr¶ lêi xong c©u hái hoÆc dù ®o¸n kÕt qu¶ thi ®Êu ng­êi cã thÓ l·nh, phÇn th­ëng lµ <color=yellow>1% ®iÓm kinh nghiÖm vµ 1 miÕng Thiªn th¹ch<color>.");
	elseif nType == 2 then
		Talk(1,"howtogetaward","Gi¶i tr¶ lêi c©u hái tÝch lòy sÏ l·nh ®Þnh kú, th­êng lµ sau khi server b¶o tr× vµo ngµy thø 2. Ng­êi tr¶ lêi ®óng c©u hái cña mÊy ngµy sÏ nhËn phÇn th­ëng t­¬ng øng, phÇn th­ëng lµ <color=yellow>1% ®iÓm kinh nghiÖm, 1 h¹t gièng Th¸i H­ B¸t Nh· vµ 3 Cöu ChuyÓn Hoµn Hån §¬n<color>");
	elseif nType == 3 then
		Talk(1,"howtogetaward","Gi¶i dù ®o¸n kÕt qu¶ tÝch lòy sÏ l·nh ®Þnh kú, th­êng lµ thø 2 sau khi server b¶o tr×. Ng­êi dù ®o¸n ®óng kÕt qu¶ cña mÊy ngµy th× sÏ nhËn phÇn th­ëng t­¬ng øng, phÇn th­ëng lµ <color=yellow>20 tiÒn vµng, 5 thiªn th¹ch vµ 1 mãn vò khÝ ngÉu nhiªn (®¼ng cÊp yªu cÇu trªn 75)<color>, chó ý: <color=red>nÕu b¹n ®o¸n ®óng nhiÒu lÇn sÏ ®­îc nhiÒu vò khÝ nh­ng nã sÏ ¶nh h­ëng ®Õn søc søc lùc, h·y s¾p xÕp l¹i hµnh trang råi míi nhËn th­ëng.<color>");
	elseif nType == 4 then
		Talk(1,"howtogetaward","Gi¶i dù ®o¸n 4 ®éi vµo b¸n kÕt, ng­êi cã thÓ chän 4 ®éi trong 16 ®éi m¹nh ®Ó lµm lùa chän cuèi cïng. NÕu dù ®o¸n chÝnh x¸c, ng­êi sÏ nhËn ®­îc phÇn th­ëng <color=yellow>MËt tÞch s­ m«n hoÆc 1 quyÓn T©m ph¸p<color><color=red>(®¼ng cÊp trªn 50 vµ ®· vµo l­u ph¸i)<color>.");
	elseif nType == 5 then
		Talk(1,"howtogetaward","Gi¶i dù ®o¸n ®éi vµo chung kÕt, ng­êi cã thÓ chän 2 trong sè 16 ®éi lµm lùa chän cuèi cïng. NÕu nh­ dù ®o¸n chÝnh x¸c, ng­êi sÏ nhËn ®­îc <color=yellow>1 quyÓn sæ tay chÕ t¹o vò khÝ<color>.");
	elseif nType == 6 then
		Talk(1,"howtogetaward","Gi¶i dù ®o¸n ®éi v« ®Þch, ng­êi cã thÓ chän 1 trong 16 ®éi ®Ó lµm lùa chän cuèi cïng. NÕu dù ®o¸n chÝnh x¸c, ng­êi sÏ nhËn ®­îc <color=yellow>1 bé trang phôc ®éi v« ®Þch<color>.");
	elseif nType == 7 then
		Talk(1,"howtogetaward","Khi 4 ®éi ng­êi dù ®o¸n vµo b¸n kÕt, ®éi vµo chung kÕt vµ ®éi v« ®Þch ®Òu ®óng, ng­êi sÏ nhËn ®­îc gi¶i th­ëng ®Æc biÖt.");
	end;
end;

function seefinalforecast()
	local str1,str2,str3 = "","","";
	if GetTask(TEAM4_4) == 0 then
		str1 = "B¹n ch­a dù ®o¸n hoÆc ch­a chän xong 4 ®éi m¹nh";
	else
		str1 = "B¹n dù ®o¸n ®éi h¹ng 4 lµ: <color=yellow>"..tTeam16[GetTask(TEAM4_1)]..","..tTeam16[GetTask(TEAM4_2)]..","..tTeam16[GetTask(TEAM4_3)]..","..tTeam16[GetTask(TEAM4_4)].."<color>";
	end;
	if GetTask(TEAM2_2) == 0 then
		str2 = "B¹n ch­a dù ®o¸n hoÆc ch­a chän xong ®éi vµo chung kÕt";
	else
		str2 = "B¹n dù ®o¸n ®éi vµo chung kÕt: <color=yellow>"..tTeam16[GetTask(TEAM2_1)]..","..tTeam16[GetTask(TEAM2_2)].."<color>";
	end;
	if GetTask(TEAM_CHAMPION) == 0 then
		str3 = "B¹n kh«ng dù ®o¸n ®éi v« ®Þch";
	else
		str3 = "B¹n dù ®o¸n ®éi v« ®Þch lµ: <color=yellow>"..tTeam16[GetTask(TEAM_CHAMPION)].."<color>";
	end;
	Talk(1,"main","<color=green>§øa bÐ<color>:<enter>"..str1.."<enter>"..str2.."<enter>"..str3);
end;

function nothing()

end;

function get_worldcup_ring()
	SetTask(AWARD_FINAL,1);
	local nRetCode = AddItem(0,102,28,1,1,-1,-1,-1,-1,-1,-1);
	if nRetCode == 1 then
		Msg2Player("B¹n nhËn ®­îc 1 sîi §¹i Lùc ThÇn H¹ng Liªn");
	else
		WriteLog("[Lçi hái ®¸p cóp thÕ giíi cã th­ëng]:"..GetName().."AddItem(§¹i Lùc ThÇn H¹ng Liªn,1) trÞ quay l¹i lµ:"..nRetCode);
	end;
	WriteLog("[Hái ®¸p cóp thÕ giíi cã th­ëng]:"..GetName().."NhËn ®­îc 1 sîi §¹i Lùc ThÇn H¹ng Liªn");	
end;