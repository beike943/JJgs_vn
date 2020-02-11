--File name:collector_npc_CD.lua
--Describe:ãê¾©¾Û±¦Õ«ÉÌÈË½Å±¾
--Create Date:2006-4-3
--Author:yanjun
Include("\\script\\online\\laborday06\\laborday_head.lua");

function main()
	local nDate = tonumber(date("%Y%m%d"));
	if nDate > 20090107 then
		Talk(1,"","<color=green>Nhµ bu«n Tô B¶o Trai: <color>Ho¹t ®éng ®· kÕt thóc.");
		return 0;
	end
	local selTab = {
			"§æi lÊy phÇn th­ëng./handin",
			"Lµm sao ®Ó b¸n vËt phÈm?/knowhow",
			"Xem néi dung ho¹t ®éng./#knowdetail(1)",
			"tra xem vËt liÖu ®· nép./#queryinfor(1)",
			"NhËn s¸ch c«ng lao Tô B¶o Trai./#getbook(1)",
			"KÕt thóc ®èi tho¹i/nothing",
			};
--	local nState = Get_Laborday_State();
--	if nState == 0 then
--		Talk(1,"","<color=green>¾Û±¦Õ«ÉÌÈË£º<color>»î¶¯»¹Ã»¿ªÊ¼ÄØ¡£");
--	elseif nState == 3 then
--		Talk(1,"","<color=green>¾Û±¦Õ«ÉÌÈË£º<color>»î¶¯ÒÑ¾­½áÊøÁË¡£");
--	elseif nState == 2 then
--		Talk(1,"","<color=green>¾Û±¦Õ«ÉÌÈË£º<color>ÏÖÔÚÒÑ¾­²»ÄÜÉÏ½»²ÄÁÏÁË£¬Çë¿ìµ½Áì½±ÈËÄÇÀï»»½±Àø°É¡£");
--	elseif nState == 1 then
		Say("<color=green>Nhµ bu«n Tô B¶o Trai: <color>Bæn tiÖm sÏ thu nh÷ng thø thu thËp ®­îc trªn giang hå, ng­¬i cã thÓ giao vËt thu thËp cho ta ®Ó §æi ®iÓm.",getn(selTab),selTab);
--	else
--		Talk(1,"","×´Ì¬³ö´í£¬ÇëÁªÏµGM¡£");
--		Write_Log("ÎåÒ»»î¶¯³ö´í","½ÚÈÕ×´Ì¬³ö´í¡£½ÚÈÕ×´Ì¬Îª"..nState);
--	end
end;

function handin()
	local selTab = {
			"§ång ı/confirm",
			"ThuyÕt minh viÖc ®æi vËt phÈm/#knowrule(1)",
			"§Ó ta s¾p xÕp l¹i./nothing",
			}
	local selTab2 = {
		"§ång ı/confirm",
		"Ta vÉn ch­a hiÓu./knowmore",
		"ThuyÕt minh viÖc ®æi vËt phÈm/#knowrule(1)",
--		"ÖªµÀÁË£¬ÒÔºó²»ĞèÒªÔÙÌáĞÑÎÒÁË/donotnoteme",
		"§Ó ta s¾p xÕp l¹i./nothing",
		}
	local nWeek = GetWeekSequence(1,0);
	if GetTask(TSK_LABORDAY_WEEK) < nWeek then
		SetTask(TSK_LABORDAY_WEEK,nWeek);
		Set_Task_Byte(GET_PRIZE,2,0);
		Set_Task_Byte(GET_PRIZE,3,0);
		Set_Task_Byte(GET_PRIZE,4,0);
		Set_Task_Byte(GET_PRIZE2,1,0);
		Set_Task_Byte(GET_PRIZE2,2,0);
		Set_Task_Byte(GET_PRIZE2,3,0);
		Set_Task_Byte(GET_PRIZE2,4,0);
		Set_Task_Byte(BIG_PRIZE,1,0);
		Set_Task_Byte(BIG_PRIZE,2,0);
		Set_Task_Byte(BIG_PRIZE,3,0);
	end 
	local GetOnePrize = Get_Task_Byte(BIG_PRIZE,1); --1
	local GetTwoPrize = Get_Task_Byte(BIG_PRIZE,2); --2
	local GetThreePrize = Get_Task_Byte(BIG_PRIZE,3);--3
	local GetFourPrize = Get_Task_Byte(GET_PRIZE,2); --4
	local GetFivePrize = Get_Task_Byte(GET_PRIZE,3); --5
	local GetSixPrize = Get_Task_Byte(GET_PRIZE,4); --6
	local GetSevenPrize = Get_Task_Byte(GET_PRIZE2,1); --7
	local GetEightPrize = Get_Task_Byte(GET_PRIZE2,2); --8
	local GetNightPrize = Get_Task_Byte(GET_PRIZE2,3); --9
	local GetTenPrize = Get_Task_Byte(GET_PRIZE2,4); --10
	local nPrizeNum = 0;
	local nTotalNum = 0;
	local nTag = Get_Task_Byte(BIG_PRIZE,4);
	for i=1,getn(tPrizeJifen) do
		nTotalNum = nTotalNum+tPrizeJifen[i][1];
	end
	nPrizeNum = GetOnePrize+GetTwoPrize+GetThreePrize+GetFourPrize+GetFivePrize+GetSixPrize+GetSevenPrize+GetEightPrize+GetNightPrize+GetTenPrize;
	if nPrizeNum >= nTotalNum then
		Talk(1,"","<color=green>Nhµ bu«n Tô B¶o Trai<color>: TuÇn nµy ng­¬i ®· ®æi tÊt c¶ phÇn th­ëng, tuÇn sau l¹i ®Õn.");
		return
	elseif nPrizeNum == 0 then
		Say("B»ng h÷u cã ®ång ı giao nép toµn bé sè l­îng vËt thu thËp cã trong hµnh trang kh«ng? Sè l­îng vËt liÖu cÇn thiÕt xin h·y tra trong <color=yellow>S¸ch c«ng lao Tô B¶o Trai<color>.",getn(selTab),selTab);
	else
		local sContent = "<color=green>Nhµ bu«n Tô B¶o Trai<color>: Chó ı, tuÇn nµy ng­¬i ®· ®æi ";
		if GetOnePrize >= tPrizeJifen[1][1] then
			sContent = sContent.."<color=yellow>PhÇn th­ëng lo¹i 1 "..tPrizeJifen[1][1].." lÇn<color>,";
		end;		
		if GetTwoPrize >= tPrizeJifen[2][1] then
			sContent = sContent.."<color=yellow>PhÇn th­ëng lo¹i 2 "..tPrizeJifen[2][1].." lÇn<color>,";
		end;
		if GetThreePrize >= tPrizeJifen[3][1] then
			sContent = sContent.."<color=yellow>PhÇn th­ëng lo¹i 3"..tPrizeJifen[3][1].." lÇn<color>,";
		end;			
		if GetFourPrize >= tPrizeJifen[4][1] then
			sContent = sContent.."<color=yellow>PhÇn th­ëng lo¹i 4"..tPrizeJifen[4][1].." lÇn<color>,";
		end;
		if GetFivePrize >= tPrizeJifen[5][1] then
			sContent = sContent.."<color=yellow>PhÇn th­ëng lo¹i 5"..tPrizeJifen[5][1].." lÇn<color>,";
		end;
		if GetSixPrize >= tPrizeJifen[6][1] then
			sContent = sContent.."<color=yellow>PhÇn th­ëng lo¹i 6"..tPrizeJifen[6][1].." lÇn<color>,";
		end;
		if GetSevenPrize >= tPrizeJifen[7][1] then
			sContent = sContent.."<color=yellow>PhÇn th­ëng lo¹i 7"..tPrizeJifen[7][1].." lÇn<color>,";
		end;
		if GetEightPrize >= tPrizeJifen[8][1] then
			sContent = sContent.."<color=yellow>PhÇn th­ëng lo¹i 8"..tPrizeJifen[8][1].." lÇn<color>,";
		end;
		if GetNightPrize >= tPrizeJifen[9][1] then
			sContent = sContent.."<color=yellow>PhÇn th­ëng lo¹i 9"..tPrizeJifen[9][1].." lÇn<color>,";
		end;
		if GetTenPrize >= tPrizeJifen[10][1] then
			sContent = sContent.."<color=yellow>PhÇn th­ëng lo¹i 10"..tPrizeJifen[10][1].." lÇn<color>,";
		end;	
		sContent = sContent.."TuÇn nµy b¹n kh«ng thÓ nhËn phÇn th­ëng nµy n÷a, chØ cã thÓ nhËn phÇn th­ëng kh¸c. Sè l­îng vËt phÈm b¹n ®· nép lµ <color=yellow>"..GetTask(ITEMNUM).."<color>. H·y chän lo¹i phÇn th­ëng. B»ng h÷u cã ®ång ı giao nép sè l­îng vËt thu thËp trong hµnh trang kh«ng?";
		Say(sContent,getn(selTab2),selTab2);
	end;
end;

function donotnoteme()
	Set_Task_Byte(BIG_PRIZE,4,1);
	main();
end;

function confirm()
	local nHandInNum = 0;
	for i=1,g_TotalItemNum do
		if Hand_In_Item(i) == TRUE then
			nHandInNum = nHandInNum + 1;
			Msg2Player("§· nép sè hiÖu lµ:"..i.."vËt phÈm: "..ItemTab[i][5]);
		end;
	end;
	if nHandInNum == 0 then
		Talk(1,"","LÇn nµy b»ng h÷u vÉn ch­a nép vËt phÈm nµo c¶, h·y x¸c nhËn cã ®ñ vËt liÖu vµ ch­a nép qua vËt phÈm nµy.");
		return FALSE;
	else
		Talk(1,"","LÇn nµy tæng céng ®· nép <color=yellow>"..nHandInNum.."<color> lo¹i vËt thu thËp, h·y tra xem tin tøc hÖ thèng ®Ó biÕt thªm chi tiÕt.");
		Write_Log("Nép vËt phÈm.","§· nép"..nHandInNum.."lo¹i vËt phÈm");
		return TRUE;
	end;		
end;

function knowhow()
	Talk(1,"main","B»ng h÷u chØ cÇn ®Ó vËt muèn nép trong hµnh trang, ta sÏ gióp s¾p xÕp l¹i. NÕu sè l­îng kh«ng ®ñ ta sÏ kh«ng lÊy!");
end;

function knowmore()
	Talk(1,"handin","Trong thêi gian diÔn ra ho¹t ®éng, phÇn th­ëng lo¹i 1 vµ lo¹i 2 chØ cã thÓ nhËn 1 lÇn. PhÇn th­ëng lo¹i 3 tèi ®a nhËn 3 lÇn, phÇn th­ëng kh¸c mçi ngµy cã thÓ nhËn 3 lÇn. NÕu nh­ sè lÇn §æi phÇn th­ëng ®· ®Çy, th× ®¼ng cÊp phÇn th­ëng sÏ gi¶m 1 cÊp. Vİ dô: nÕu ng­êi ch¬i thu thËp 203 lo¹i vËt phÈm, ®· ®æi phÇn th­ëng lo¹i 1, khi Êy chØ cã thÓ ®æi phÇn th­ëng lo¹i 2, nÕu ®· §æi phÇn th­ëng lo¹i 2 th× chØ cã thÓ §æi phÇn th­ëng lo¹i 3. NÕu sè lÇn §æi phÇn th­ëng lo¹i 3 ®· ®Çy th× chØ cã thÓ §æi phÇn th­ëng lo¹i 4");
end;
