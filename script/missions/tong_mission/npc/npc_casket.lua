Include("\\script\\missions\\tong_mission\\main_function.lua");

g_tbLuckInfo = 
{
	[0] = {0,"VÞ Tri"}, 
	[1] = {-4,"§¹i hung"},
	[2] = {-3,"Trung hung"},
	[3] = {-2,"TiÓu hung"},
	[4] = {0,"Trung"},
	[5] = {1,"TiÓu c¸t"},
	[6] = {2,"Trung c¸t"},
	[7] = {3,"§¹i c¸t"},
}

g_nBaseValue = 8;	--»ù´¡Öµ

function main()
	local nNpcIdx = GetTargetNpc();
	local nCasketHashCode = GetUnitCurStates(nNpcIdx,4);
	local nStage = GetUnitCurStates(nNpcIdx,3);
	local nPlayerHashCode = GetTask(TSK_CASKET_HASH_CODE);
	local nDay = tonumber(date("%y%m%d"));
	if GetTask(617) < nDay then
		SetTask(617,nDay); 
		SetTask(618,0);	--ÍÃÐ¡Ñ¾ÔËÆøÖµ
	end;
	local nLuck = GetTask(618);
	if nPlayerHashCode ~= 0 and nPlayerHashCode == nCasketHashCode then
		local selTab = {
					"Hép nhá sè 1/#open_casket(1,"..nStage..")",
					"Hép nhá sè 2/#open_casket(2,"..nStage..")",
					"Hép nhá sè 3/#open_casket(3,"..nStage..")",
					"Hép nhá sè 4/#open_casket(4,"..nStage..")",
					"Hép nhá sè 5/#open_casket(5,"..nStage..")",
					}
		Say("Xin chän më hép nhá, ch÷ sè Èn trong ®ã t­îng tr­ng cho sè l­îng HiÖp kh¸ch ch­¬ng nhËn ®­îc, chóc may m¾n!",getn(selTab),selTab);
	else
		Msg2Player("B¹n kh«ng thÓ më Hép may m¾n nµy");
		return 0;
	end;
end;

function open_casket(nCasketID,nStage)
	if gf_JudgeRoomWeight(2,20,"") ~= 1 then
		return 0;
	end;
	nStage = gf_MinMax(nStage,1,6);	--È·±£nStageµÄÖµÕýÈ·
	local nLuck = GetTask(618);
	local nLuckAdj = 0;
	if not g_tbLuckInfo[nLuck] then	--Èç¹ûÃ»²âÔËÆø»ònLuckÎª·Ç·¨Öµ
		nLuckAdj = 0;
	else
		nLuckAdj = g_tbLuckInfo[nLuck][1];
	end;
	local nX = 1;	--Ë¥¼õÏµÊý
	local nOpenTimes = GetTask(TSK_CASKET_STAGE_1+nStage-1)+1;
	if nOpenTimes == 2 then
		nX = 4/5;
	elseif nOpenTimes == 3 then
		nX = 3/5;
	elseif nOpenTimes >= 4 and nOpenTimes <= 7 then
		nX = 1/10;
	elseif nOpenTimes >= 8 then
		nX = 0;
	end;
	--ÖÐÖµ=ceil((»ù´¡Öµ+ÔËÆøÐÞÕýÖµ)*Ë¥¼õÏµÊý)
	local nMidValue = (g_nBaseValue+nLuckAdj)*nX;
	local nLowValue = ceil(nMidValue*0.8);	--µÍÖµ
	local nHighValue = ceil(nMidValue*1.2);	--¸ßÖµ
	local tbNum = get_num_table(nLowValue,nHighValue,5);	--È¡5¸öÊý×Ö
	local nGotNum = tbNum[nCasketID];
	local nTotalNum = BigGetItemCount(2,0,1091);
	if nTotalNum + nGotNum > MAX_XIEKEHUIZHANG then
		TaskTip("Sè l­îng HiÖp kh¸ch ch­¬ng ®· ®¹t tèi ®a "..MAX_XIEKEHUIZHANG.." , h·y mau dïng HiÖp kh¸ch ch­¬ng ®æi phÇn th­ëng");
		Msg2Player("Sè l­îng HiÖp kh¸ch ch­¬ng ®· ®¹t tèi ®a "..MAX_XIEKEHUIZHANG.." , h·y mau dïng HiÖp kh¸ch ch­¬ng ®æi phÇn th­ëng");
		nGotNum = MAX_XIEKEHUIZHANG - nTotalNum;
	end;
	Msg2Player("Trong tuÇn nµy ®¹i hiÖp ®©y lµ lÇn thø "..nOpenTimes.." më hép may m¾n ë ¶i  "..nStage.." , ®­îc "..nGotNum.." HiÖp kh¸ch ch­¬ng");
	SetTask(TSK_CASKET_HASH_CODE,0);
	SetTask(TSK_CASKET_STAGE_1+nStage-1,nOpenTimes);
	if nGotNum > 0 then
		AddItem(2,0,1091,nGotNum);
	end;
	Say("B¹n ®· chän Hép nhá sè <color=yellow>"..nCasketID.."<color>, nhËn ®­îc <color=yellow>"..nGotNum.."<color> HiÖp kh¸ch ch­¬ng.\nHép nhá sè 1: "..tbNum[1].." c¸i\nHép nhá sè 2: "..tbNum[2].." c¸i\nHép nhá sè 3: "..tbNum[3].." c¸i\nHép nhá sè 4: "..tbNum[4].." c¸i\nHép nhá sè 5: "..tbNum[5].."c¸i",0);
	gf_WriteLog("Tö Quang C¸c","TuÇn nµy ë ¶i sè "..nOpenTimes.." më hép may m¾n ë ¶i  "..nStage.." më Hép may m¾n, ®­îc "..nGotNum.." HiÖp kh¸ch ch­¬ng");
end;

function get_num_table(nLowValue,nHighValue,nNum)
	local tbInit = {};
	local tbRetTable = {};
	for i=nLowValue,nHighValue do
		tinsert(tbInit,i);
	end;
	local nRandIdx = 0;
	for i=1,nNum do
		if getn(tbInit) ~= 0 then
			nRandIdx = random(1,getn(tbInit));
			tinsert(tbRetTable,tbInit[nRandIdx]);
			tremove(tbInit,nRandIdx);
		else
			tinsert(tbRetTable,random(nLowValue,nHighValue));
		end;
	end;
	return tbRetTable;
end;