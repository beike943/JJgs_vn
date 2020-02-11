--file name:trigger.lua
--author:yanjun(yim)
--create date:2006-7-7
--describe:Ê±¼ä´¥·¢Æ÷½Å±¾
Include("\\script\\online\\afterworldcup06\\hand_in_hand_head.lua");
function OnTimer()
	RemoveTrigger(GetTrigger(TRIGGER_ID));
	local nFellowIndex = GetInteractivePlayerIndex();
	if nFellowIndex ~= 0 then
		ask_question(1);
	end;
end;

function ask_question(nPageNum)
	local nFellowIndex = GetInteractivePlayerIndex();
	if nFellowIndex == 0 then
		Say("§èi ph­¬ng ®· xãa bá tæ ®éi, kh«ng thÓ nhËn ®­îc card!",0);
		return 0;
	end;
	local selTab = {};
	local nTeamIndexBase = (nPageNum-1)*4;
	selTab[1] = tTeamName[nTeamIndexBase+1].."/#select("..(nTeamIndexBase+1)..")";
	selTab[2] = tTeamName[nTeamIndexBase+2].."/#select("..(nTeamIndexBase+2)..")";
	selTab[3] = tTeamName[nTeamIndexBase+3].."/#select("..(nTeamIndexBase+3)..")";
	selTab[4] = tTeamName[nTeamIndexBase+4].."/#select("..(nTeamIndexBase+4)..")";
	selTab[5] = "Trang tr­íc/#ask_question("..(nPageNum-1)..")";
	selTab[6] = "Trang sau/#ask_question("..(nPageNum+1)..")";
	if nPageNum == 1 then
		tremove(selTab,5);
	end;
	if nPageNum == 8 then
		tremove(selTab,6);
	end
	Say("§éi bãng b¹n thÝch nhÊt lµ:",getn(selTab),selTab);
end;

function select(nTeamIndex)
	local nFellowIndex = GetInteractivePlayerIndex();
	if nFellowIndex == 0 then
		Say("§èi ph­¬ng ®· xãa bá tæ ®éi, kh«ng thÓ nhËn ®­îc card!",0);
		return 0;
	end;
	local selTab = {
				"§ång ý/#confirm("..nTeamIndex..")",
				"Chän l¹i/#ask_question(1)",
				}
	Say("B¹n chän <color=yellow>"..tTeamName[nTeamIndex].."<color>. X¸c ®Þnh chø?",getn(selTab),selTab);
end;

function confirm(nTeamIndex)
	local nFellowIndex = GetInteractivePlayerIndex();
	local nOldPlayerIndex = PlayerIndex;
	local nLevel1,nLevel2 = 0,0;
	local nErrStr = "";
	local sName = "";
	local nDate = tonumber(date("%y%m%d"));
	if nFellowIndex == 0 then
		Say("§èi ph­¬ng ®· xãa bá tæ ®éi, kh«ng thÓ nhËn ®­îc card!",0);
		return 0;
	end;
	local nProbability = 0;
	SetTask(TASK_TEAMINDEX,nTeamIndex);
	nLevel1 = GetLevel();
	PlayerIndex = nFellowIndex;
	nLevel2 = GetLevel();
	if GetTask(TASK_TEAMINDEX) ~= 0 then
		if GetTask(TASK_TEAMINDEX) == nTeamIndex then	--Á½ÈËÑ¡ÔñµÄÊÇÏàÍ¬µÄ¶ÓÎé
			if nTeamIndex == 1 then
				nProbability = tItemCard[nTeamIndex][5]+1000;
			else
				nProbability = (tItemCard[nTeamIndex][5]-tItemCard[nTeamIndex-1][5])+1000;
			end;
		else
			if nTeamIndex == 1 then
				nProbability = tItemCard[nTeamIndex][5]+500;
			else
				nProbability = (tItemCard[nTeamIndex][5]-tItemCard[nTeamIndex-1][5])+500;
			end;
		end;
		if random(1,100) <= nLevel1 + nLevel2 then
			if GetTask(TASK_GOTCARD_DATE) < nDate then
				SetTask(TASK_GOTCARD_COUNT,0);
			end;
			SetTask(TASK_GOTCARD_COUNT,GetTask(TASK_GOTCARD_COUNT)+1);
			give_random_card(nProbability,GetTask(TASK_TEAMINDEX));	--Ëæ»ú¸øÒ»ÕÅ¿¨\
			PlayerIndex = nOldPlayerIndex;
			if GetTask(TASK_GOTCARD_DATE) < nDate then
				SetTask(TASK_GOTCARD_COUNT,0);
			end;
			SetTask(TASK_GOTCARD_COUNT,GetTask(TASK_GOTCARD_COUNT)+1);
			give_random_card(nProbability,GetTask(TASK_TEAMINDEX));
		else
			PlayerIndex = nOldPlayerIndex;
			if GetTask(TASK_GOTCARD_DATE) < nDate then
				SetTask(TASK_GOTCARD_COUNT,0);
			end;
			SetTask(TASK_GOTCARD_COUNT,GetTask(TASK_GOTCARD_COUNT)+1);
			Say("Xin lçi! Do ®¼ng cÊp cña 2 ng­êi céng l¹i vÉn ch­a ®¹t cÊp 100 cho nªn kh«ng thÓ nhËn ®­îc thÎ 100%. NhËn thÎ thÊt b¹i.",0);
			PlayerIndex = nFellowIndex;
			if GetTask(TASK_GOTCARD_DATE) < nDate then
				SetTask(TASK_GOTCARD_COUNT,0);
			end;
			SetTask(TASK_GOTCARD_COUNT,GetTask(TASK_GOTCARD_COUNT)+1);
			Say("Xin lçi! Do ®¼ng cÊp cña 2 ng­êi céng l¹i vÉn ch­a ®¹t cÊp 100 cho nªn kh«ng thÓ nhËn ®­îc thÎ 100%. NhËn thÎ thÊt b¹i.",0);
		end;
		PlayerIndex = nOldPlayerIndex;
	end;
end;

function give_random_card(nProbability,nTeamIndex)
	RemoveTrigger(GetTrigger(TRIGGER_ID));	--²»¹ÜÁË£¬É¾µô×î±£ÏÕ
	local nRandomNum = random(1,10000);
	local nDate = tonumber(date("%y%m%d"));
	SetTask(TASK_TEAMINDEX,0);
	SetTask(TASK_GOTCARD_TIME,GetTime());
	SetTask(TASK_GOTCARD_DATE,nDate);
	if nRandomNum <= nProbability then
		AddItem(tItemCard[nTeamIndex][2],tItemCard[nTeamIndex][3],tItemCard[nTeamIndex][4],1);
		Say("B¹n nhËn ®­îc 1 tÊm <color=yellow>"..tItemCard[nTeamIndex][1].."<color>. H«m nay b¹n ®· tham gia <color=yellow>"..GetTask(TASK_GOTCARD_COUNT).."<color> lÇn ho¹t ®éng cóp thÕ giíi, b¹n cã thÓ tham gia thªm <color=yellow>"..(6-GetTask(TASK_GOTCARD_COUNT)).."<color> lÇn.",0);
		WriteLog("[Vui ho¹t ®éng cóp thÕ giíi]:"..GetName().."NhËn ®­îc"..tItemCard[nTeamIndex][1]);
	else
		nRandomNum = random(1,10000);
		for i=1,getn(tItemCard) do
			if nRandomNum <= tItemCard[i][5] then
				if i == 34 and GetTask(TASK_GOTCHINA_CARD) ~= 0 then	--Èç¹ûµÃ¹ýÖÐ¹ú¶ÓÖ®¿¨
					nTeamIndex = random(1,33);
				else
					nTeamIndex = i;
				end;
				AddItem(tItemCard[nTeamIndex][2],tItemCard[nTeamIndex][3],tItemCard[nTeamIndex][4],1);
				Say("B¹n nhËn ®­îc 1 tÊm <color=yellow>"..tItemCard[nTeamIndex][1].."<color>. H«m nay b¹n ®· tham gia <color=yellow>"..GetTask(TASK_GOTCARD_COUNT).."<color> lÇn ho¹t ®éng cóp thÕ giíi, b¹n cã thÓ tham gia thªm <color=yellow>"..(6-GetTask(TASK_GOTCARD_COUNT)).."<color> lÇn.",0);
				if nTeamIndex == 34 then	--Èç¹ûÊÇÖÐ¹ú¶ÓÖ®¿¨
					SetTask(TASK_GOTCHINA_CARD,1);
				end;
				WriteLog("[Vui ho¹t ®éng cóp thÕ giíi]:"..GetName().."NhËn ®­îc"..tItemCard[nTeamIndex][1]);
				break;
			end;
		end;
	end;
end;