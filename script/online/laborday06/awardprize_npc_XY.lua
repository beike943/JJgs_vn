--File name:awardprize_npc_XY.lua
--Describe:ÏåÑô¾Û±¦Õ«ÕÆ¹ñ½Å±¾
--Create Date:2006-4-3
--Author:yanjun
Include("\\script\\online\\laborday06\\laborday_head.lua");

g_nJifenMax = 200;

function main()
	local nDate = tonumber(date("%Y%m%d"));
	if nDate > 20090107 then
		Talk(1,"","Ho¹t ®éng ®· kÕt thóc!");
		return 0;
	end
	local selTab = {
				"§æi ®iÓm tİch lòy/askforaward",
				"ThuyÕt minh viÖc ®æi ®iÓm/#knowrule(2)",
				"tra xem néi dung ho¹t ®éng./#knowdetail(2)",
				"tra xem vËt liÖu ®· nép./#queryinfor(2)",
				"NhËn s¸ch c«ng lao Tô B¶o Trai./#getbook(2)",
				"KÕt thóc ®èi tho¹i/nothing",
				};
--	local nState = Get_Laborday_State();
--	if nState == 0 then
--		Talk(1,"","<color=green>¾Û±¦Õ«ÕÆ¹ñ£º<color>»î¶¯»¹Ã»¿ªÊ¼ÄØ¡£");
--	elseif nState == 3 then
--		Talk(1,"","<color=green>¾Û±¦Õ«ÕÆ¹ñ£º<color>»î¶¯ÒÑ¾­½áÊøÁËÅ¶¡£");
--	elseif nState == 2 or nState == 1 then
		Say("HiÖn giê bæn tiÖm s­u tÇm nh÷ng vËt quı gi¸ l­u truyÒn trong giang hå, nÕu b»ng h÷u thu thËp ®­îc, sÏ cã nh÷ng phÇn th­ëng träng hËu.",getn(selTab),selTab);
--	else
--		Talk(1,"","<color=red>[ÏµÍ³]:<color>×´Ì¬³ö´í£¬ÇëÁªÏµGM¡£");
--		Write_Log("ÎåÒ»»î¶¯³ö´í","½ÚÈÕ×´Ì¬³ö´í¡£½ÚÈÕ×´Ì¬Îª"..nState);
--	end;
end;

function askforaward()	--Ñ¯ÎÊÒª²»ÒªÄÃ½±
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
	
	local nPrizeType;
	local nItemNum = GetTask(ITEMNUM);
	local nPrizeNum = 0;
	local nTotalNum = 0;
	for i=1,getn(tPrizeJifen) do
		nTotalNum = nTotalNum+tPrizeJifen[i][1];
	end
	nPrizeNum = GetOnePrize+GetTwoPrize+GetThreePrize+GetFourPrize+GetFivePrize+GetSixPrize+GetSevenPrize+GetEightPrize+GetNightPrize+GetTenPrize;	
	if nItemNum < 7 then	
		Talk(1,"","Sè l­îng vÉn ch­a ®ñ, h·y thu thËp tiÕp råi quay l¹i l·nh th­ëng.");
		return FALSE;
	elseif nItemNum >= 7 and nItemNum < 17 then
		nPrizeType = 1;
	elseif nItemNum >= 17 and nItemNum < 31 then
		nPrizeType = 2;
	elseif nItemNum >= 31 and nItemNum < 60 then
		nPrizeType = 3;
	elseif nItemNum >= 60 and nItemNum < 90 then
		nPrizeType = 4;
	elseif nItemNum >= 90 and nItemNum < 106 then
		nPrizeType = 5;
	elseif nItemNum >= 106 and nItemNum < 125 then
		nPrizeType = 6;
	elseif nItemNum >= 125 and nItemNum < 144 then
		nPrizeType = 7;
	elseif nItemNum >= 144 and nItemNum < 185 then
		nPrizeType = 8;
	elseif nItemNum >= 185 and nItemNum < 203 then
		nPrizeType = 9;
	elseif nItemNum == 203 then
		nPrizeType = 10;
	else
		Talk(1,"","[hÖ thèng]: sè liÖu bŞ sai, xin liªn hÖ víi GM.");
		Write_Log("Ho¹t ®éng tÕt lao ®éng cã sai sãt","sè l­îng thu thËp sai:"..nItemNum);
	end;
	if nPrizeNum >= nTotalNum then
		Talk(1,"","<color=green>¤ng chñ Tô B¶o Trai<color>: TuÇn nµy ng­¬i ®· ®æi phÇn th­ëng, tuÇn sau h½n ®Õn.");
		return
	else	
		if nPrizeType == 10 and GetOnePrize >= tPrizeJifen[1][1] then
			nPrizeType = 9;
		end;
		if nPrizeType == 9 and GetTwoPrize >= tPrizeJifen[2][1] then
			nPrizeType = 8;
		end;
		if nPrizeType == 8 and GetThreePrize >= tPrizeJifen[3][1] then
			nPrizeType = 7;
		end;
		if nPrizeType == 7 and GetFourPrize >= tPrizeJifen[4][1] then
			nPrizeType = 6;
		end;
		if nPrizeType == 6 and GetFivePrize >= tPrizeJifen[5][1] then
			nPrizeType = 5;
		end;
		if nPrizeType == 5 and GetSixPrize >= tPrizeJifen[6][1] then
			nPrizeType = 4;
		end;
		if nPrizeType == 4 and GetSevenPrize >= tPrizeJifen[7][1] then
			nPrizeType = 3;
		end;
		if nPrizeType == 3 and GetEightPrize >= tPrizeJifen[8][1] then
			nPrizeType = 2;
		end;
		if nPrizeType == 2 and GetNightPrize >= tPrizeJifen[9][1] then
			nPrizeType = 1;
		end;
		if nPrizeType == 1 and GetTenPrize >= tPrizeJifen[10][1] then
			Talk(1,"","<color=green>¤ng chñ Tô B¶o Trai<color>: Sè l­îng vËt phÈm ng­¬i giao kh«ng thÓ ®æi thªm phÇn th­ëng, h·y xem chó thİch liªn quan.");
			return
		end;				
	end
	local selTab = {
			"Ta muèn §æi phÇn th­ëng nµy./#getjifen("..nPrizeType..")",
			"Ta muèn tra xem phÇn th­ëng./#knowrule(2)",
			"Th«i, ®Ó lÇn sau./nothing",
			};
	Say("HiÖn giê ®· thu thËp <color=yellow>"..nItemNum.."<color> lo¹i vËt phÈm, b»ng h÷u cã thÓ ®æi lÊy <color=yellow>"..tNumTab[nPrizeType].."<color> phÇn th­ëng: <color=yellow>"..tPrizeJifen[11-nPrizeType][2].." ®iÓm<color>. Sau khi ®æi phÇn th­ëng, sè l­îng vËt phÈm ®· giao sÏ bŞ xãa, ng­¬i cã thÓ b¾t ®Çu giao l¹i. Ng­¬i x¸c nhËn muèn ®æi phÇn th­ëng chø?",getn(selTab),selTab);
end;

function getaward(nPrizeType)	--NPC·¢½±
	local nDate = tonumber(date("%d"));	--Íæ¼ÒÓĞ¿ÉÄÜÔÚÇ°Ò»Ìì´ò¿ªÑ¯ÎÊ¶Ô»°¿ò£¬µ«ÔÚ½ñÌì²ÅÁì½±£¬Èç¹û²»ÔÙ×öÕâĞ©´¦ÀíµÄ»°£¬¾ÍÓĞ¿ÉÄÜµ¼ÖÂÍæ¼ÒÔÚ½ñÌìÖ»ÁìÒ»´Î¾Í²»ÄÜÔÙÁìµÄÇé¿ö
	if Get_Task_Byte(GET_PRIZE,1) ~= nDate then
		SetTask(GET_PRIZE,0);
		SetTask(GET_PRIZE2,0);
	end;
	if nPrizeType <= 7 then
		if Get_Task_Byte(tPrizeMapByte[nPrizeType][1],tPrizeMapByte[nPrizeType][2]) >= 3 then
			Talk(1,"","Mçi ngµy ng­êi ch¬i chØ ®æi 3 <color=yellow>"..tNumTab[nPrizeType].."<color> phÇn th­ëng.");
			return FALSE;
		end;
	end;
	local nItemNum = GetTask(ITEMNUM);
	Write_Log("§æi phÇn th­ëng tÕt lao ®éng","Ta muèn sö dông"..nItemNum.." vËt thu thËp ®æi phÇn th­ëng");
	local nGetNum = Get_Task_Byte(tPrizeMapByte[nPrizeType][1],tPrizeMapByte[nPrizeType][2]);
	Set_Task_Byte(tPrizeMapByte[nPrizeType][1],tPrizeMapByte[nPrizeType][2],nGetNum+1);	--¼ÇÂ¼Íæ¼ÒÁìÈ¡½±ÀøµÄÇé¿ö¡£1×Ö½Ú¼ÇÂ¼ÁìÈ¡ÈÕÆÚ£¬2×Ö½Ú¼ÇÂ¼ÁìÈ¡´ÎÊı
	Set_Task_Byte(GET_PRIZE,1,nDate);
	Clear_HandIn_State();
	giveprize(nPrizeType);
end;

function getjifen(nPrizeType)
	if Get_Task_Byte(tPrizeMapByte[nPrizeType][1],tPrizeMapByte[nPrizeType][2]) >= tPrizeJifen[11-nPrizeType][1] then
		Talk(1,"","<color=green>¤ng chñ Tô B¶o Trai: <color>Mçi ng­êi mçi tuÇn chØ cã thÓ ®æi "..tPrizeJifen[11-nPrizeType][1].." lÇn<color=yellow>"..tNumTab[nPrizeType].."<color> phÇn th­ëng.");
		return FALSE;
	end;
	Set_Task_Byte(tPrizeMapByte[nPrizeType][1],tPrizeMapByte[nPrizeType][2],Get_Task_Byte(tPrizeMapByte[nPrizeType][1],tPrizeMapByte[nPrizeType][2])+1);
	SetTask(1351,GetTask(1351)+tPrizeJifen[11-nPrizeType][2]);
	if GetTask(1351) > g_nJifenMax then
		SetTask(1351,g_nJifenMax);
		Msg2Player("B¹n nhËn ®­îc "..tPrizeJifen[11-nPrizeType][2].." ®iÓm");
		Msg2Player("§iÓm cña ng­¬i ®· ®¹t ®Õn "..g_nJifenMax.." ®iÓm, mçi ng­êi nhiÒu nhÊt cã thÓ tİch lòy "..g_nJifenMax.." ®iÓm.");
	else	
		Msg2Player("B¹n nhËn ®­îc "..tPrizeJifen[11-nPrizeType][2].." ®iÓm");
	end
	Clear_HandIn_State();
end