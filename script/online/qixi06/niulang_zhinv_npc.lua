--file name:niulang_zhinv_npc.lua
--author:yanjun
--create date:2006-6-26
--describe:06ÄêÆßÏ¦»î¶¯£¬Å£ÀÉÖ¯Å®½Å±¾
Include("\\script\\online\\qixi06\\qixi06_head.lua");

function main()
	local nDate = tonumber(date("%y%m%d"));
	local nNpcIndex = GetTargetNpc();
	if nNpcIndex == 0 then
		return 0;
	end;
	local sNpcName = GetNpcName(nNpcIndex);
	if GetTask(TASK_GOTPRESENT_DATE) >= nDate then
		Talk(1,"","<color=green>"..sNpcName.."<color>: H«m nay b¹n ®· nhËn phÇn th­ëng*2 t×nh nh©n trong thiªn h¹ bªn nhau m·i m·i.");
		return 0;
	end;
	if GetTask(TASK_PLANTSTAR_DATE) == nDate then
		local selTab = {
				"Ta muèn nhËn lÔ phÈm/get_award_confirm",
				"Ta ®Õn ®Ó chóc mõng/nothing",
				}
		Say("<color=green>"..sNpcName.."<color>: Chóc c¸c ®«i t×nh nh©n trong thiªn h¹ m·i m·i bªn nhau. Chóng t«i cã chuÈn bÞ 1 mãn quµ nhá, xin h·y nhËn lÊy.",getn(selTab),selTab);
	else
		Talk(1,"","<color=green>"..sNpcName.."<color>: Chóc c¸c ®«i t×nh nh©n trong thiªn h¹ m·i m·i bªn nhau.");
	end;
end;

function get_award_confirm()
	local nNpcIndex = GetTargetNpc();
	if nNpcIndex == 0 then
		return 0;
	end;
	local sNpcName = GetNpcName(nNpcIndex);
	local selTab = {
				"§ång ý/give_award",
				"Ta sÏ quay l¹i sau/nothing",
				}
	Say("<color=green>"..sNpcName.."<color>:"..tSexName[GetSex()].."h·y x¸c nhËn chç trèng trong hµnh trang vµ søc lùc cßn ®ñ ®Ó tr¸nh tæn thÊt ®¸nh tiÕc, b¹n x¸c nhËn muèn nhËn phÇn th­ëng?",getn(selTab),selTab);
end;

function give_award()
	local nDate = tonumber(date("%y%m%d"));
	local nOldPlayerIndex = PlayerIndex;
	local nRandomNum = 0;
	local nLevel = 0;
	local nNpcIndex = GetTargetNpc();
	if nNpcIndex == 0 then
		return 0;
	end;
	local sNpcName = GetNpcName(nNpcIndex);
	if Is_Lovers_Team() == 1 then
		for i=1,2 do
			PlayerIndex = GetTeamMember(i);
			if GetTask(TASK_GOTPRESENT_DATE) < nDate and GetTask(TASK_PLANTSTAR_DATE) == nDate then	--Èç¹ûÁìÈ¡¹ýÁËµÄ»òÃ»µãÁÁ¹ýÐÇÐÇµÄ¾Í²»¸øÁË
				give_expiation_award();
				SetTask(TASK_GOTPRESENT_DATE,nDate);
				ModifyGoldenExp(700000);
				Msg2Player("B¹n nhËn ®­îc 700000 ®iÓm søc kháe");
				ModifyReputation(15,0);
				nLevel = GetLevel();
				if nLevel < 30 then
					give_random_page(20);
				elseif nLevel < 40 then
					give_random_page(30);				
				elseif nLevel < 50 then
					give_random_page(75);
				else
					give_random_page(100);
				end;
				if GetLevel() < 50 then
					AddItem(2,2,7,8)
					Msg2Player("B¹n nhËn ®­îc 8 m¶nh Thiªn th¹ch");
				else
					AddItem(2,2,8,8)
					Msg2Player("B¹n nhËn ®­îc 8 Thiªn th¹ch");		
				end;
				WriteLog("[Ho¹t ®éng ThÊt TÞch]:"..GetName().."§· nhËn phÇn th­ëng song nh©n Ng­u Lang Chøc N÷");
				Talk(1,"","<color=green>"..sNpcName.."<color>: Chóc c¸c ®«i t×nh nh©n trong thiªn h¹ m·i m·i bªn nhau.");
			else
				Msg2Player("H«m nay b¹n ®· nhËn qua phÇn th­ëng hoÆc quªn ch­a th¾p s¸ng sao, b¹n kh«ng thÓ nhËn phÇn th­ëng.")
			end;
		end;
		PlayerIndex = nOldPlayerIndex;
	else
		give_expiation_award();
		SetTask(TASK_GOTPRESENT_DATE,nDate);
		ModifyGoldenExp(500000);
		Msg2Player("B¹n nhËn ®­îc 500000 ®iÓm søc kháe");
		ModifyReputation(10,0);
		if GetLevel() < 50 then
			AddItem(2,2,7,5)
			Msg2Player("B¹n nhËn ®­îc 5 m¶nh Thiªn th¹ch");
		else
			AddItem(2,2,8,5)
			Msg2Player("B¹n nhËn ®­îc 5 Thiªn th¹ch");		
		end;
		nLevel = GetLevel();
		if nLevel < 30 then
			give_random_page(20);
		elseif nLevel < 40 then
			give_random_page(30);				
		elseif nLevel < 50 then
			give_random_page(75);
		else
			give_random_page(100);
		end;
		WriteLog("[Ho¹t ®éng ThÊt TÞch]:"..GetName().."§· nhËn phÇn th­ëng c¸ nh©n ho¹t ®éng ThÊt TÞch-Ng­u Lang Chøc N÷");
		Talk(1,"","<color=green>"..sNpcName.."<color>: Chóc c¸c ®«i t×nh nh©n trong thiªn h¹ m·i m·i bªn nhau.");
	end;
end;

tSpecialPage = {10,18,29,43,52,70,78,88,99,114,128,137,147,167}	--ÌØÊâ¾÷ÒªÏêÏ¸Àà±ð
tNormalPage = {1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,19,20,21,22,23,24,25,26,27,28,30,31,32,
			   33,34,35,36,37,38,39,40,41,42,44,45,46,47,48,49,50,51,53,54,55,56,57,58,59,60,
			   61,62,63,64,65,66,67,68,69,71,72,73,74,75,76,77,79,80,81,82,83,84,85,86,87,89,
			   90,91,92,93,94,95,96,97,98,100,101,102,103,104,105,106,107,108,109,110,111,112,
			   113,115,116,117,118,119,120,121,122,123,124,125,126,127,129,130,131,132,133,134,
			   135,136,138,139,140,141,142,143,144,145,146,148,149,150,151,152,153,154,155,156,
			   157,158,159,160,161,162,163,164,165,166,168}
function give_random_page(nProbability)
	local nRandomNum = random(1,100);
	if nRandomNum <= nProbability then
		nRandomNum = random(1,322);
		if nRandomNum <= 14 then
			AddItem(2,6,tSpecialPage[random(1,getn(tSpecialPage))],1);
		else
			AddItem(2,6,tNormalPage[random(1,getn(tNormalPage))],1);
		end;
		Msg2Player("B¹n nhËn ®­îc 1 quyÓn bÝ kiÕp");
	end;
end;

function give_expiation_award()
	if GetTask(TASK_EXPIATION_AWARD) == 1 then
		return 0;
	end;
	SetTask(TASK_EXPIATION_AWARD,1);
	local nMultiple = 0;
	local nPlantCount = GetTask(TASK_PLANT_STAR_COUNT);
	if nPlantCount == 1 then
		return 0;
	elseif nPlantCount == 2 and GetTask(TASK_GOTPRESENT_DATE) == 060729 then
		return 0;
	elseif nPlantCount == 2 and GetTask(TASK_GOTPRESENT_DATE) ~= 060729 then
		nMultiple = 1;
	elseif nPlantCount == 3 and GetTask(TASK_GOTPRESENT_DATE) == 060729 then
		nMultiple = 1
	elseif nPlantCount == 3 and GetTask(TASK_GOTPRESENT_DATE) ~= 060729 then
		nMultiple = 2
	end;
	if nMultiple == 0 then
		return 0;
	end;
	for i=1,nMultiple do
		ModifyGoldenExp(700000);
		Msg2Player("B¹n nhËn ®­îc 700000 ®iÓm søc kháe");
		ModifyReputation(15,0);
		nLevel = GetLevel();
		if nLevel < 30 then
			give_random_page(20);
		elseif nLevel < 40 then
			give_random_page(30);				
		elseif nLevel < 50 then
			give_random_page(75);
		else
			give_random_page(100);
		end;
		if GetLevel() < 50 then
			AddItem(2,2,7,8)
			Msg2Player("B¹n nhËn ®­îc 8 m¶nh Thiªn th¹ch");
		else
			AddItem(2,2,8,8)
			Msg2Player("B¹n nhËn ®­îc 8 Thiªn th¹ch");		
		end;
	end;
	WriteLog("[Ho¹t ®éng ThÊt TÞch]:"..GetName().."§· nhËn phÇn th­ëng båi th­êng ho¹t ®éng ThÊt TÞch, béi sè:"..nMultiple);
	local sNpcName = GetTargetNpcName();
	Say("<color=green>"..sNpcName.."<color>: Do 2 ngµy 28 vµ 29 cã chót trôc trÆc, chóng t«i quyÕt ®Þnh båi th­êng phÇn th­ëng 2 ngµy nµy cho b¹n, xin h·y th«ng c¶m.",0);
end;