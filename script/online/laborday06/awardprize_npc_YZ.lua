--File name:awardprize_npc_XY.lua
--Describe:ÑïÖİ¾Û±¦Õ«ÕÆ¹ñ½Å±¾
--Create Date:2006-4-3
--Author:yanjun
Include("\\script\\online\\laborday06\\laborday_head.lua");

function main()
	local selTab = {
				"®æi lÊy phÇn th­ëng./askforaward",
				"thuyÕt minh phÇn th­ëng./#knowrule(2)",
				"tra xem néi dung ho¹t ®éng./#knowdetail(2)",
				"tra xem vËt liÖu ®· nép./#queryinfor(2)",
				"NhËn s¸ch c«ng lao Tô B¶o Trai./#getbook(2)",
				"KÕt thóc ®èi tho¹i/nothing",
				};
	local nState = Get_Laborday_State();
	if nState == 0 then
		Talk(1,"","Ho¹t ®éng ch­a b¾t ®Çu");
	elseif nState == 3 then
		Talk(1,"","Ho¹t ®éng ®· kÕt thóc!");
	elseif nState == 2 or nState == 1 then
		Say("HiÖn giê bæn tiÖm s­u tÇm nh÷ng vËt quı gi¸ l­u truyÒn trong giang hå, nÕu b»ng h÷u thu thËp ®­îc, sÏ cã nh÷ng phÇn th­ëng träng hËu.",getn(selTab),selTab);
	else
		Talk(1,"","<color=red>[hÖ thèng]:<color> tr¹ng th¸i bŞ sai sãt, h·y liªn hÖ víi bé phËn qu¶n lı!");
		Write_Log("Ho¹t ®éng tÕt lao ®éng cã sai sãt","Ho¹t ®éng sai sãt:"..nState);
	end;
end;

function askforaward()	--Ñ¯ÎÊÒª²»ÒªÄÃ½±
	local nDate = tonumber(date("%d"));
	if Get_Task_Byte(GET_PRIZE,1) ~= nDate then
		SetTask(GET_PRIZE,0);
		SetTask(GET_PRIZE2,0);
	end;
	local GetOnePrize = Get_Task_Byte(BIG_PRIZE,1);
	local GetTwoPrize = Get_Task_Byte(BIG_PRIZE,2);
	local GetThreePrize = Get_Task_Byte(BIG_PRIZE,3);
	
	local nPrizeType;
	local nItemNum = GetTask(ITEMNUM);
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
	if nPrizeType == 10 and GetOnePrize >= 1 then
		nPrizeType = 9;
	end;
	if nPrizeType == 9 and GetTwoPrize >= 1 then
		nPrizeType = 8;
	end;
	if nPrizeType == 8 and GetThreePrize >= 3 then
		nPrizeType = 7;
	end;
	if nPrizeType <= 7 then
		if Get_Task_Byte(tPrizeMapByte[nPrizeType][1],tPrizeMapByte[nPrizeType][2]) >= 3 then
			Talk(1,"","Mçi ngµy ng­êi ch¬i chØ ®æi 3 <color=yellow>"..tNumTab[nPrizeType].."<color> phÇn th­ëng.");
			return FALSE;
		end;
	end;
	local selTab = {
			"Ta muèn §æi phÇn th­ëng nµy./#getaward("..nPrizeType..")",
			"Ta muèn tra xem phÇn th­ëng./#knowrule(2)",
			"Th«i, ®Ó lÇn sau./nothing",
			};
	Say("HiÖn giê ®· thu thËp <color=yellow>"..nItemNum.."<color> lo¹i vËt phÈm, b»ng h÷u cã thÓ ®æi lÊy <color=yellow>"..tNumTab[nPrizeType].."<color> phÇn th­ëng: <color=yellow>"..PrizeTab[nPrizeType][1].."<color> sau khi ®æi lÊy phÇn th­ëng, sè l­îng vËt phÈm ®· nép sÏ mÊt hÕt. B»ng h÷u cã ®ång ı ®æi lÊy phÇn th­ëng nµy kh«ng?",getn(selTab),selTab);
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

