--²é¿´Õ½³¡ÀïÃæµÄÒ»Ð©Í³¼ÆÐÅÏ¢
--Õ½³¡Í³¼ÆÏµÍ³ËµÃ÷£º
--Í³¼ÆÄÚÈÝÖ÷ÒªÓÐÒÔÏÂÎå´óÄ£¿é£º4¸öÕ½³¡µÄÉÏÒ»³¡Í³¼ÆÐÅÏ¢¼ÓÕ½³¡×ÜÍ³¼ÆÐÅÏ¢
--ApplyRelayShareDataµÄµÚÒ»¸ö²ÎÊýÎª"battle_statistic"£¬±íÊ¾¹²ÏíÊý¾Ý¿âÖÐµÄÕ½³¡Í³¼ÆÄ£¿é
--µÚ¶þ¸ö²ÎÊý±íÊ¾Õ½³¡µÄ¸÷ÖÖÍ³¼ÆÐÅÏ¢£¬ÆäÖÐ1ÖÁ4±íÊ¾ËÄ¸öÕ½³¡µÄÉÏÒ»³¡Í³¼ÆÐÅÏ¢£¬5±íÊ¾Õ½³¡×ÜµÄÍ³¼ÆÐÅÏ¢
--µÚÈý¸ö²ÎÊý±íÊ¾Í³¼ÆÐÅÏ¢µÄÖÖÀà,1±íÊ¾×îÖÕ½á¹ûÍ³¼Æ£¬2Îª¸öÈË»ý·ÖÅÅÃû£¬ÆäËüµÄ¸ù¾Ý²»Í¬µÄÕ½³¡»áÓÐ²»Í¬µÄ¶¨Òå
--×¢ÒâÊ¹ÓÃfunctions.luaµÄº¯ÊýÊ±²»ÒªÊ¹ÓÃÄÇÐ©ÓëMissionÓÐ¹ØµÄº¯Êý
Include("\\settings\\static_script\\kf_newbattles\\functions.lua");
BTS_MAX_ITEM_COUNT = 5;	--Ã¿Ò³×î¶àÏÔÊ¾ÐÅÏ¢ÊýÁ¿
BTS_MAX_RANK_NUM = 20;	--Ö»ÏÔÊ¾ÅÅÇ°20ÃûµÄÍæ¼Ò

BTS_TYPE_MAIN_INFOR = 1;		--×îÖÕ½á¹ûÍ³¼ÆÐÅÏ¢
BTS_TYPE_POINT_RANK = 2;		--¸öÈË»ý·ÖÅÅÐÐÐÅÏ¢
BTS_TYPE_KILL_PLAYER_COUNT = 3;	--É±ÈËÊýÅÅÐÐÐÅÏ¢
BTS_TYPE_DEATH_COUNT = 4;		--±»É±´ÎÊýÅÅÐÐÐÅÏ¢

--Í³¼ÆÄ£¿éÈë¿Ú
function BTS_ViewBattleStatistic()
	local selTab = {
				"ChiÕn tr­êng Th«n trang/BTS_ViewVillageBattle",
				"ChiÕn tr­êng Th¶o cèc/BTS_ViewResourceBattle",
				"ChiÕn tr­êng ph¸o ®µi/BTS_ViewEmplacementBattle",
				"ChiÕn tr­êng Nh¹n M«n quan/BTS_ViewMainBattle",
				"LÞch sö chiÕn tr­êng/BTS_ViewBattleHistory",
				--"»ØÖ÷¶Ô»°/main",
				"KÕt thóc/nothing",
				}
	Say("B¹n muèn xem tin tøc chiÕn tr­êng nµo?",getn(selTab),selTab);
end;
--ÉÏ³¡´åÂäÕ½³¡Í³¼ÆÐÅÏ¢
function BTS_ViewVillageBattle()
	local selTab = {
				"KÕt qu¶ cuèi cïng/#BTS_Battle_Final_Result(1)",
				--"¸öÈË»ý·ÖÅÅÃû/#BTS_Public_Rank(1,2)",
				"Quay l¹i néi dung tr­íc./BTS_ViewBattleStatistic",
				"KÕt thóc/nothing",
				}
	Say("B¹n muèn xem néi dung nµo trong ChiÕn tr­êng Th«n trang:",getn(selTab),selTab);
end;
--ÉÏ³¡²Ý¹È³¡Õ½³¡Í³¼ÆÐÅÏ¢
function BTS_ViewResourceBattle()
	local selTab = {
				"KÕt qu¶ cuèi cïng/#BTS_Battle_Final_Result(2)",
				--"¸öÈË»ý·ÖÅÅÃû/#BTS_Public_Rank(2,2)",
				"Quay l¹i néi dung tr­íc./BTS_ViewBattleStatistic",
				"KÕt thóc/nothing",
				}
	Say("B¹n muèn xem néi dung nµo trong ChiÕn tr­êng Th¶o cèc:",getn(selTab),selTab);
end;
--ÉÏ³¡ÅÚÌ¨Õ½³¡Í³¼ÆÐÅÏ¢
function BTS_ViewEmplacementBattle()
	local selTab = {
				"KÕt qu¶ cuèi cïng/#BTS_Battle_Final_Result(3)",
				--"¸öÈË»ý·ÖÅÅÃû/#BTS_Public_Rank(3,2)",
				--"±¾³¡»÷µ¹µÐÈË´ÎÊýÅÅÐÐ/#BTS_Public_Rank(3,3)",
				--"±¾³¡±»»÷µ¹´ÎÊýÅÅÐÐ/#BTS_Public_Rank(3,4)",
				"Quay l¹i néi dung tr­íc./BTS_ViewBattleStatistic",
				"KÕt thóc/nothing",
				}
	Say("B¹n muèn xem néi dung nµo trong ChiÕn tr­êng ph¸o ®µi:",getn(selTab),selTab);
end;
--ÉÏ³¡ÑãÃÅ¹ØÕ½³¡Í³¼ÆÐÅÏ¢
function BTS_ViewMainBattle()
	local selTab = {
				"KÕt qu¶ cuèi cïng/#BTS_Battle_Final_Result(4)",
				--"±¾³¡¸öÈË»ý·ÖÅÅÐÐ/#BTS_Public_Rank(4,2)",
				--"±¾³¡»÷µ¹µÐÈË´ÎÊýÅÅÐÐ/#BTS_Public_Rank(4,3)",
				--"±¾³¡±»»÷µ¹´ÎÊýÅÅÐÐ/#BTS_Public_Rank(4,4)",
				--"Óª¾ÈÄÑÃñ´ÎÊýÅÅÐÐ/BTS_Main_Help_Refugee_Rank",
				"Quay l¹i néi dung tr­íc./BTS_ViewBattleStatistic",
				"KÕt thóc/nothing",
				}
	Say("B¹n muèn xem néi dung nµo trong Nh¹n M«n Quan:",getn(selTab),selTab);
end;
--²é¿´ÉÏ³¡Õ½³¡×îÖÕ½á¹û
function BTS_Battle_Final_Result(nBattleType)
	local tCallBackFunc = {
		[VILLAGE_ID] = "BTS_CB_Village_Final_Result",
		[RESOURCE_ID] = "BTS_CB_Resource_Final_Result",
		[EMPLACEMENT_ID] = "BTS_CB_Emplacement_Final_Result",
		[MAINBATTLE_ID] = "BTS_CB_Main_Final_Result",
		}
	ApplyRelayShareData(RELAY_DATA_BATTLE,nBattleType,BTS_TYPE_MAIN_INFOR,RELAY_CALLBACK_SCRIPT,tCallBackFunc[nBattleType]);
end;
--²é¿´ÉÏ³¡Õ½³¡¸öÈË»ý·ÖÅÅÐÐ
function BTS_Public_Rank(nBattleType,nRecordType)
	BT_SetTempData(PTT_SNAPSHOOT,nBattleType);
	ApplyRelayShareData(RELAY_DATA_BATTLE,nBattleType,nRecordType,RELAY_CALLBACK_SCRIPT,"BTS_CB_Show_Pub_Rank");
end;
--´åÂäÕ½³¡×îÖÕ½á¹ûÍ³¼ÆÐÅÏ¢»Øµ÷º¯Êý
function BTS_CB_Village_Final_Result(szKey,nBattleType,nRecordType,nRecordCount)
	if nRecordCount == 0 then
		Talk(1,"BTS_ViewVillageBattle","HiÖn kh«ng cã tin tøc");
		return 0;
	end;
	local _,nResult,nStepSong,nStepLiao,nYear,nMonth,nDay,nHour = GetRelayShareDataByIndex(szKey,nBattleType,nRecordType,0);
	local sResultStr = "";
	if nResult == 0 then
		sResultStr = "2 phe hßa nhau";
	else
		sResultStr = "<color=yellow>"..tCampNameZ[nResult].."<color> nhËn ®­îc"..tBattleName[nBattleType].." th¾ng lîi cuèi cïng";
	end;
	Talk(1,"BTS_ViewVillageBattle","T¹i"..nYear.."niªn"..nMonth.."NguyÖt"..nDay.."NhËt"..nHour.."kÕt qu¶ trËn ®Êu:"..sResultStr.."<enter>Phe Tèng t×m ®­îc: <color=yellow>"..nStepSong.."<color><enter>Phe Liªu t×m ®­îc: <color=yellow>"..nStepLiao.."<color>");
end;
--²Ý¹È³¡Õ½³¡×îÖÕ½á¹ûÍ³¼ÆÐÅÏ¢»Øµ÷º¯Êý
function BTS_CB_Resource_Final_Result(szKey,nBattleType,nRecordType,nRecordCount)
	if nRecordCount == 0 then
		Talk(1,"BTS_ViewResourceBattle","HiÖn kh«ng cã tin tøc");
		return 0;
	end;
	local _,nResult,nResSong,nResLiao,nYear,nMonth,nDay,nHour = GetRelayShareDataByIndex(szKey,nBattleType,nRecordType,0);
	local sResultStr = "";
	if nResult == 0 then
		sResultStr = "2 phe hßa nhau";
	else
		sResultStr = "<color=yellow>"..tCampNameZ[nResult].."<color> nhËn ®­îc"..tBattleName[nBattleType].." th¾ng lîi cuèi cïng";
	end;
	Talk(1,"BTS_ViewResourceBattle","T¹i"..nYear.."niªn"..nMonth.."NguyÖt"..nDay.."NhËt"..nHour.."kÕt qu¶ trËn ®Êu:"..sResultStr.."<enter>Sè l­¬ng th¶o phe Tèng: <color=yellow>"..nResSong.."<color><enter>Sè l­¬ng th¶o phe Liªu: <color=yellow>"..nResLiao.."<color>");
end;
--ÅÚÌ¨Õ½³¡×îÖÕ½á¹ûÍ³¼ÆÐÅÏ¢»Øµ÷º¯Êý
function BTS_CB_Emplacement_Final_Result(szKey,nBattleType,nRecordType,nRecordCount)
	if nRecordCount == 0 then
		Talk(1,"BTS_ViewEmplacementBattle","HiÖn kh«ng cã tin tøc");
		return 0;
	end;
	local _,nResult,nTimeSong,nTimeLiao,nPubPointSong,nPubPointLiao,nDeathSong,nDeathLiao,nYear,nMonth,nDay,nHour = GetRelayShareDataByIndex(szKey,nBattleType,nRecordType,0);
	local sResultStr = "";
	if nResult == 0 then
		sResultStr = "2 phe hßa nhau";
	else
		sResultStr = "<color=yellow>"..tCampNameZ[nResult].."<color> nhËn ®­îc"..tBattleName[nBattleType].." th¾ng lîi cuèi cïng";
	end;
	Talk(1,"BTS_ViewEmplacementBattle","T¹i"..nYear.."niªn"..nMonth.."NguyÖt"..nDay.."NhËt"..nHour.."kÕt qu¶ trËn ®Êu:"..sResultStr.."<enter>Thêi gian chiÕm lÜnh ph¸o ®µi cña phe Tèng: <color=yellow>"..nTimeSong.." gi©y<color> Thêi gian chiÕm lÜnh ph¸o ®µi cña phe Liªu: <color=yellow>"..nTimeLiao.." gi©y<color><enter>§iÓm tÝch lòy phe Tèng: <color=yellow>"..nPubPointSong.."<color>§iÓm tÝch lòy phe Liªu: <color=yellow>"..nPubPointLiao.."<color><enter>Sè ng­êi th­¬ng vong phe Tèng: <color=yellow>"..nDeathSong.."<color> Sè ng­êi th­¬ng vong phe Liªu: <color=yellow>"..nDeathLiao.."<color>");
end;
--ÑãÃÅ¹ØÕ½³¡×îÖÕ½á¹ûÍ³¼ÆÐÅÏ¢»Øµ÷º¯Êý
function BTS_CB_Main_Final_Result(szKey,nBattleType,nRecordType,nRecordCount)
	if nRecordCount == 0 then
		Talk(1,"BTS_ViewMainBattle","HiÖn kh«ng cã tin tøc");
		return 0;
	end;
	local _,nResult,nPubPointSong,nPubPointLiao,nHelpRefugeeSong,nHelpRefugeeLiao,nDeathSong,nDeathLiao,nYear,nMonth,nDay,nHour = GetRelayShareDataByIndex(szKey,nBattleType,nRecordType,0);
	local sResultStr = "";
	if nResult == 0 then
		sResultStr = "2 phe hßa nhau";
	else
		sResultStr = "<color=yellow>"..tCampNameZ[nResult].."<color> nhËn ®­îc"..tBattleName[nBattleType].." th¾ng lîi cuèi cïng";
	end;
	Talk(1,"BTS_ViewMainBattle","T¹i"..nYear.."niªn"..nMonth.."NguyÖt"..nDay.."NhËt"..nHour.."kÕt qu¶ trËn ®Êu:"..sResultStr.."<enter>§iÓm tÝch lòy phe Tèng: <color=yellow>"..nPubPointSong.."<color>§iÓm tÝch lòy phe Liªu: <color=yellow>"..nPubPointLiao.."<color><enter>Sè n¹n d©n phe Tèng cøu: <color=yellow>"..nHelpRefugeeSong.."<color> Sè n¹n d©n phe Liªu cøu: <color=yellow>"..nHelpRefugeeLiao.."<color><enter>Sè ng­êi th­¬ng vong phe Tèng: <color=yellow>"..nDeathSong.."<color> Sè ng­êi th­¬ng vong phe Liªu: <color=yellow>"..nDeathLiao.."<color>");
end;
--Õ½³¡¸öÈË»ý·ÖÅÅÐÐÍ³¼ÆÐÅÏ¢»Øµ÷º¯Êý£¬Ö»ÊÊÓÃÓÚËùÓÐÕ½³¡¹²Í¬µÄÄÇÐ©ÅÅÃû
function BTS_CB_Show_Pub_Rank(szKey,nBattleType,nRecordType,nRecordCount)
	local tTitle = {""," TÝch lòy c¸ nh©n","Sè lÇn giÕt ®Þch ","Sè lÇn bÞ giÕt"};	--µÚÒ»¸ö±»ÓÃ×÷Í³¼Æ×îÖÕ½á¹ûÁË¡£ÕâÑùÉè¼ÆºÃÏñ²»Ì«Í×£¬ÔÝÊ±²»¹Ü°É
	local tReturnFunc = {"BTS_ViewVillageBattle","BTS_ViewResourceBattle","BTS_ViewEmplacementBattle","BTS_ViewMainBattle"};
	if nRecordCount == 0 then
		Talk(1,tReturnFunc[BT_GetTempData(PTT_SNAPSHOOT)],"HiÖn kh«ng cã tin tøc");
		return 0;
	end;
	if nRecordCount > BTS_MAX_RANK_NUM then
		nRecordCount = BTS_MAX_RANK_NUM;	--Ö»ÅÅÇ°BTS_MAX_RANK_NUMÃû
	end;
	BTS_Show_Rank_Page(tTitle[nRecordType],1,szKey,nBattleType,nRecordType,nRecordCount);
end;
--ÏÔÊ¾»ý·ÖÅÅÐÐµÄº¯Êý¡£µÚÒ»¸ö²ÎÊýÊÇÒªÅÅÐÐÏîÄ¿µÄ×Ö·û´®ÃèÊö£»µÚ¶þ¸ö²ÎÊýÊÇµ±Ç°ÒªÏÔÊ¾µÄÒ³Êý£»
function BTS_Show_Rank_Page(sTitle,nPageNum,szKey,nBattleType,nRecordType,nRecordCount)
	local tReturnFunc = {"BTS_ViewVillageBattle","BTS_ViewResourceBattle","BTS_ViewEmplacementBattle","BTS_ViewMainBattle"};
	local selTab = {};
	local GetMaxItemCountPerPage = function(nPN,nRC)	--Õâ¸öº¯ÊýÊÇÓÃÀ´»ñµÃµ±Ç°Ò³ÊýµÄ×î´óÏÔÊ¾ÏîÄ¿ÊýµÄ
		local nCount = nRC-(nPN-1)*BTS_MAX_ITEM_COUNT;
		if nCount >= BTS_MAX_ITEM_COUNT then
			return BTS_MAX_ITEM_COUNT
		else
			return mod(nCount,BTS_MAX_ITEM_COUNT);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nRecordCount);
	local nCurStartIndex = (nPageNum-1)*BTS_MAX_ITEM_COUNT
	local sName,nData,nRoute,nLevel,nCamp = "",0,0,0,0;
	local sContent = gf_FormatStringLength("H¹ng",6)..gf_FormatStringLength("Tªn",18)..gf_FormatStringLength("M«n ph¸i",10)..gf_FormatStringLength("CÊp",6)..gf_FormatStringLength(sTitle,strlen(sTitle)+2)..gf_FormatStringLength("Phe",4).."<enter>";
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		sName,nData,nRoute,nLevel,nCamp = GetRelayShareDataByIndex(szKey,nBattleType,nRecordType,i)
		sContent = sContent..gf_FormatStringLength(i+1,6)..gf_FormatStringLength(sName,18)..gf_FormatStringLength(tRoute[nRoute],10)..gf_FormatStringLength(nLevel,6)..gf_FormatStringLength(nData,strlen(sTitle)+2)..gf_FormatStringLength(tCampNameZ[nCamp],4).."<enter>"
	end;
	if nPageNum ~= 1 then
		tinsert(selTab,"Trang tr­íc/#BTS_Show_Rank_Page(\""..sTitle.."\","..(nPageNum-1)..",\""..szKey.."\","..nBattleType..","..nRecordType..","..nRecordCount..")");
	end;
	if nPageNum ~= ceil(nRecordCount/BTS_MAX_ITEM_COUNT) then
		tinsert(selTab,"Trang kÕ/#BTS_Show_Rank_Page(\""..sTitle.."\","..(nPageNum+1)..",\""..szKey.."\","..nBattleType..","..nRecordType..","..nRecordCount..")");	
	end;
	tinsert(selTab,"Quay l¹i néi dung tr­íc./"..tReturnFunc[nBattleType]);
	local nLength = strlen(sContent);
	sContent = strsub(sContent,1,nLength-7);
	Say(sContent,getn(selTab),selTab);
end
--²é¿´Õ½³¡ÀúÊ·¼ÇÂ¼
function BTS_ViewBattleHistory()
	ApplyRelayShareData(RELAY_DATA_BATTLE,5,1,RELAY_CALLBACK_SCRIPT,"BTS_CB_History_Record_V");
	ApplyRelayShareData(RELAY_DATA_BATTLE,5,2,RELAY_CALLBACK_SCRIPT,"BTS_CB_History_Record_R");
	ApplyRelayShareData(RELAY_DATA_BATTLE,5,3,RELAY_CALLBACK_SCRIPT,"BTS_CB_History_Record_E");
	ApplyRelayShareData(RELAY_DATA_BATTLE,5,4,RELAY_CALLBACK_SCRIPT,"BTS_CB_History_Record_M");
end;

function BTS_CB_History_Record_V(szKey, nKey1, nKey2, nRecordCount)

end;

function BTS_CB_History_Record_R(szKey, nKey1, nKey2, nRecordCount)

end;

function BTS_CB_History_Record_E(szKey, nKey1, nKey2, nRecordCount)

end;

function BTS_CB_History_Record_M(szKey, nKey1, nKey2, nRecordCount)
	local nSongWinV,nLiaoWinV,nDrawV = 0,0,0;
	local nSongWinR,nLiaoWinR,nDrawR = 0,0,0;
	local nSongWinE,nLiaoWinE,nDrawE = 0,0,0;
	local nSongWinM,nLiaoWinM,nDrawM = 0,0,0;
	local nTotalSongWin,nTotalLiaoWin,nTotalDraw
	local szKey = RELAY_DATA_BATTLE;
	local nKey1 = 5;
	nSongWinV,nLiaoWinV,nDrawV = GetRelayShareDataByKey(szKey,nKey1,1,"history_record")
	if nSongWinV == nil then
		nSongWinV = 0;
	end;
	if nLiaoWinV == nil then
		nLiaoWinV = 0;
	end;
	if nDrawV == nil then
		nDrawV = 0;
	end;
	nSongWinR,nLiaoWinR,nDrawR = GetRelayShareDataByKey(szKey,nKey1,2,"history_record")
	if nSongWinR == nil then
		nSongWinR = 0;
	end;
	if nLiaoWinR == nil then
		nLiaoWinR = 0;
	end;
	if nDrawR == nil then
		nDrawR = 0;
	end;
	nSongWinE,nLiaoWinE,nDrawE = GetRelayShareDataByKey(szKey,nKey1,3,"history_record")
	if nSongWinE == nil then
		nSongWinE = 0;
	end;
	if nLiaoWinE == nil then
		nLiaoWinE = 0;
	end;
	if nDrawE == nil then
		nDrawE = 0;
	end;
	nSongWinM,nLiaoWinM,nDrawM = GetRelayShareDataByKey(szKey,nKey1,4,"history_record")
	if nSongWinM == nil then
		nSongWinM = 0;
	end;
	if nLiaoWinM == nil then
		nLiaoWinM = 0;
	end;
	if nDrawM == nil then
		nDrawM = 0;
	end;
	nTotalSongWin = nSongWinV + nSongWinR + nSongWinE + nSongWinM;
	nTotalLiaoWin = nLiaoWinV + nLiaoWinR + nLiaoWinE + nLiaoWinM
	nTotalDraw = nDrawV + nDrawR + nDrawE + nDrawM;
	BT_ShowDebugInfor("nSongWinV:"..nSongWinV..", nLiaoWinV:"..nLiaoWinV..", nDrawV:"..nDrawV);
	BT_ShowDebugInfor("nSongWinR:"..nSongWinR..", nLiaoWinR:"..nLiaoWinR..", nDrawR:"..nDrawR);
	BT_ShowDebugInfor("nSongWinE:"..nSongWinE..", nLiaoWinE:"..nLiaoWinE..", nDrawE:"..nDrawE);
	BT_ShowDebugInfor("nSongWinM:"..nSongWinM..", nLiaoWinM:"..nLiaoWinM..", nDrawM:"..nDrawM);
	Talk(1,"BTS_ViewBattleStatistic","LÞch sö chiÕn tr­êng Tèng-Liªu: <enter>"
		..gf_FormatStringLength(" ",20).."<color=yellow>"..gf_FormatStringLength("Sè lÇn phe Tèng th¾ng",11).."<color=green>"..gf_FormatStringLength("Sè lÇn phe Liªu th¾ng",11).."<color=red>"..gf_FormatStringLength("Sè lÇn ®«i bªn hßa",11).."\n"
		..gf_FormatStringLength("ChiÕn tr­êng Th«n trang",25).."<color=yellow>"..gf_FormatStringLength(nSongWinV,11).."<color=green>"..gf_FormatStringLength(nLiaoWinV,11).."<color=red>"..gf_FormatStringLength(nDrawV,11).."<color>\n"
		..gf_FormatStringLength("ChiÕn tr­êng Th¶o cèc",25).."<color=yellow>"..gf_FormatStringLength(nSongWinR,11).."<color=green>"..gf_FormatStringLength(nLiaoWinR,11).."<color=red>"..gf_FormatStringLength(nDrawR,11).."<color>\n"
		..gf_FormatStringLength("ChiÕn tr­êng ph¸o ®µi",25).."<color=yellow>"..gf_FormatStringLength(nSongWinE,11).."<color=green>"..gf_FormatStringLength(nLiaoWinE,11).."<color=red>"..gf_FormatStringLength(nDrawE,11).."<color>\n"
		..gf_FormatStringLength("ChiÕn tr­êng Nh¹n M«n quan",25).."<color=yellow>"..gf_FormatStringLength(nSongWinM,11).."<color=green>"..gf_FormatStringLength(nLiaoWinM,11).."<color=red>"..gf_FormatStringLength(nDrawM,11).."<color>\n"
		..gf_FormatStringLength("tæng céng",25).."<color=yellow>"..gf_FormatStringLength(nTotalSongWin,11).."<color=green>"..gf_FormatStringLength(nTotalLiaoWin,11).."<color=red>"..gf_FormatStringLength(nTotalDraw,11).."<color>");
end;

function nothing()

end;