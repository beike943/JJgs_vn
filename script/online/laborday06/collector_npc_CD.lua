--File name:collector_npc_CD.lua
--Describe:³É¶¼¾Û±¦Õ«ÉÌÈË½Å±¾
--Create Date:2006-4-3
--Author:yanjun
Include("\\script\\online\\laborday06\\laborday_head.lua");

function main()
	local selTab = {
			"§æi lÊy phÇn th­ëng./handin",
			"Lµm sao ®Ó b¸n vËt phÈm?/knowhow",
			"Xem néi dung ho¹t ®éng./#knowdetail(1)",
			"tra xem vËt liÖu ®· nép./#queryinfor(1)",
			"NhËn s¸ch c«ng lao Tô B¶o Trai./#getbook(1)",
			"KÕt thóc ®èi tho¹i/nothing",
			};
	local nState = Get_Laborday_State();
	if nState == 0 then
		Talk(1,"","Ho¹t ®éng ch­a b¾t ®Çu");
	elseif nState == 3 then
		Talk(1,"","Ho¹t ®éng ®· kÕt thóc!");
	elseif nState == 2 then
		Talk(1,"","B»ng h÷u ®· nép vËt liÖu råi mµ, h·y mau ®Õn l·nh th­ëng!");
	elseif nState == 1 then
		Say("HiÖn giê bæn tiÖm s­u tÇm nh÷ng vËt quı gi¸ l­u truyÒn trong giang hå, nÕu b»ng h÷u thu thËp ®­îc sÏ cã nh÷ng phÇn th­ëng träng hËu.",getn(selTab),selTab);
	else
		Talk(1,"","Tr¹ng th¸i bŞ sai sãt, h·y liªn hÖ víi bé phËn qu¶n lı");
		Write_Log("Ho¹t ®éng tÕt lao ®éng cã sai sãt","Ho¹t ®éng sai sãt:"..nState);
	end
end;

function handin()
	local selTab = {
			"§ång ı/confirm",
			"thuyÕt minh phÇn th­ëng./#knowrule(1)",
			"§Ó ta s¾p xÕp l¹i./nothing",
			}
	local selTab2 = {
		"§ång ı/confirm",
		"Ta vÉn ch­a hiÓu./knowmore",
		"thuyÕt minh phÇn th­ëng./#knowrule(1)",
		"Ta hiÓu råi!/donotnoteme",
		"§Ó ta s¾p xÕp l¹i./nothing",
		}
	local GetOnePrize = Get_Task_Byte(BIG_PRIZE,1);
	local GetTwoPrize = Get_Task_Byte(BIG_PRIZE,2);
	local GetThreePrize = Get_Task_Byte(BIG_PRIZE,3);
	local nTag = Get_Task_Byte(BIG_PRIZE,4);
	if nTag == 0 then
		local sContent = "Chó ı! B»ng h÷u hiÖn ®· ";
		if GetThreePrize >= 3 then
			sContent = sContent.."<color=yellow>®· nhËn 3 lÇn phÇn th­ëng lo¹i 3<color>,";
		end;
		if GetTwoPrize >= 1 then
			sContent = sContent.."<color=yellow>1 lÇn phÇn th­ëng lo¹i 2<color>,";
		end;
		if GetOnePrize >= 1 then
			sContent = sContent.."<color=yellow>1 lÇn phÇn th­ëng lo¹i 1<color>,";
		end;
		sContent = sContent.."cho dï cã nép ®ñ vËt thu thËp còng chØ nhËn ®­îc phÇn th­ëng lo¹i 4 (tøc gi¶m 1 cÊp). Sè l­îng vËt phÈm hiÖn t¹i B»ng h÷u ®· nép lµ: <color=yellow>"..GetTask(ITEMNUM).."<color>. H·y chän lo¹i phÇn th­ëng. B»ng h÷u cã ®ång ı giao nép sè l­îng vËt thu thËp trong hµnh trang kh«ng?";
		if GetOnePrize >= 1 or GetTwoPrize >= 3 or GetThreePrize >= 3 then
			Say(sContent,getn(selTab2),selTab2);
			return TRUE;
		end;
	end;
	Say("B»ng h÷u cã ®ång ı giao nép toµn bé sè l­îng vËt thu thËp cã trong hµnh trang kh«ng? Sè l­îng vËt liÖu cÇn thiÕt xin h·y tra trong <color=yellow>S¸ch c«ng lao Tô B¶o Trai<color>.",getn(selTab),selTab);
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
	Talk(1,"handin","Trong thêi gian diÔn ra ho¹t ®éng, phÇn th­ëng lo¹i 1 vµ lo¹i 2 chØ cã thÓ nhËn 1 lÇn. PhÇn th­ëng lo¹i 3 tèi ®a nhËn 3 lÇn, phÇn th­ëng kh¸c mçi ngµy cã thÓ nhËn 3 lÇn. NÕu nh­ sè lÇn ®æi lÊy phÇn th­ëng ®· ®Çy, th× ®¼ng cÊp phÇn th­ëng sÏ gi¶m 1 cÊp. Vİ dô: nÕu ng­êi ch¬i thu thËp 203 lo¹i vËt phÈm, ®· §æi phÇn th­ëng lo¹i 1, khi Êy chØ cã thÓ §æi phÇn th­ëng lo¹i 2, nÕu ®· ®æi lÊy phÇn th­ëng lo¹i 2 th× chØ cã thÓ ®æi lÊy phÇn th­ëng lo¹i 3. NÕu sè lÇn ®æi lÊy phÇn th­ëng lo¹i 3 ®· ®Çy th× chØ cã thÓ ®æi lÊy phÇn th­ëng lo¹i 4.");
end;
