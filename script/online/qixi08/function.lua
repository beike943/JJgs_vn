Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\qixi08\\head.lua");

--»ñµÃµ±ÌìµÄ»î¶¯Ãû×ÖºÍ»î¶¯ID
function QX08_GetTodayGame()
	local nCurWeekDate = tonumber(date("%w"));
	return tostring(g_tbGameSchedule[nCurWeekDate][1]),g_tbGameSchedule[nCurWeekDate][2];
end;
--»ñµÃÈÕÆÚĞÅÏ¢
function QX08_GetDate(nDate)
	local nYear = tonumber(strsub(nDate,1,4));
	local nMonth = tonumber(strsub(nDate,5,6)); 
	local nDay = tonumber(strsub(nDate,7,8));
	return nYear,nMonth,nDay;
end;
--½±ÀøµÄÍ³Ò»½Ó¿Ú¡£×¢Òâ£¬´Ëº¯Êı±ØĞëÔÚ¸÷¸ö»î¶¯NPCµÄ½Å±¾ÉÏµ÷ÓÃ
--nType:»î¶¯ID
--nAwardLevel:½±ÀøµÈ¼¶
--nTaskID:¼ÇÂ¼½ñÌìÊÇ·ñÁìÈ¡¹ı½±ÀøµÄÈÎÎñ±äÁ¿ID
function QX08_GetAward(nType,nAwardLevel,nTaskID)
	if nAwardLevel == 0 then
		Talk(1,"",g_szInfoHead.."H«m nay ng­¬i kh«ng cã thµnh tİch g×, kh«ng thÓ nhËn th­ëng.");
		return 0;
	end;
	if nAwardLevel < 0 or nAwardLevel > 5 then
		WriteLog("[Ho¹t ®éng Olympic sai]:"..GetName().."nAwardLevel bŞ lçi, trŞ lçi: "..nAwardLevel);
		return 0;
	end;
	local szAwardInfo = "";
	local nLevel = GetLevel();
	local nExpAward = 0;
	local nGoldenExpAward = 0;
	local nPoint = g_tbAward[nAwardLevel][4];
	local nBagNum = g_tbAward[nAwardLevel][3];
	local szTitleAward = "";
	local bGotTitle = 0;
	if nType == GAME_ID_GUESS then
		if GetTask(TSK_AOYUN_GUESS_BCOMPLETED) >= 10 then
			szTitleAward = "Ngoµi ra, do h«m nay ng­¬i liªn tóc 10 lÇn trë lªn ®o¸n ®óng sè, ng­¬i nhËn ®­îc danh hiÖu <color=yellow>'Thiªn C¬ ThÇn To¸n'<color>.";
			bGotTitle = 1;
		end;
	elseif nType == GAME_ID_BOX then
		if GetTask(Box_prize_9_times) >= 10 then
			szTitleAward = "Ngoµi ra, do h«m nay ng­¬i liªn tôc 10 lÇn v­ît ¶i thµnh c«ng, ng­¬i nhËn ®­îc danh hiÖu <color=yellow>'§o¹t B¶o Kú Binh'<color>.";
			bGotTitle = 1;
		end;
	elseif nType == GAME_ID_LIGHT then
		if GetTask(TSK_AOYUN_LIGHT_NUM) >= 10 then
			szTitleAward = "Ngoµi ra, do h«m nay ng­¬i liªn tôc 10 lÇn v­ît ¶i thµnh c«ng, ng­¬i nhËn ®­îc danh hiÖu <color=yellow>'Xai §¨ng V­¬ng'<color>.";
			bGotTitle = 1;
		end;
	end;
	local szOtherAward = "";
	if nLevel == 99 then
		szOtherAward = "<color=yellow>"..nBagNum.."<color> Tói b¶o th¹ch, <color=yellow>"..nPoint.."<color> ®iÓm tİch lòy ho¹t ®éng."
	else
		szOtherAward = "<color=yellow>"..nPoint.."<color> ®iÓm tİch lòy ho¹t ®éng."
	end;
	local selTab = {
				"NhËn /#QX08_GetAward_1("..nType..","..nAwardLevel..","..nTaskID..","..bGotTitle..")",
				"T¹m thêi kh«ng nhËn/nothing",
				}
	if IB_VERSION == 1 then	--Ãâ·Ñ
		if nLevel ~= 99 then
			nExpAward = floor((nLevel^2)/(80^2)*g_tbAward[nAwardLevel][2][1]*10000);
			szAwardInfo = "Ng­¬i nhËn ®­îc phÇn th­ëng cÊp <color=yellow>"..nAwardLevel.."<color>, néi dung phÇn th­ëng lµ: <color=yellow>"..nExpAward.." ®iÓm kinh nghiÖm<color>,"..szOtherAward..szTitleAward.."§ång ı nhËn kh«ng?"
		else
			szAwardInfo = "Ng­¬i nhËn ®­îc phÇn th­ëng cÊp <color=yellow>"..nAwardLevel.."<color>, néi dung phÇn th­ëng lµ:"..szOtherAward..szTitleAward.."§ång ı nhËn kh«ng?";
		end;
	else
		if nLevel ~= 99 then
			local nCurGoldenExp = GetGoldenExp();
			nGoldenExpAward = floor((nLevel^2)/(80^2)*g_tbAward[nAwardLevel][1][1]*10000);
			nExpAward = floor((nLevel^2)/(80^2)*g_tbAward[nAwardLevel][1][2]*10000);
			szAwardInfo = "Ng­¬i nhËn ®­îc phÇn th­ëng cÊp <color=yellow>"..nAwardLevel.."<color>, néi dung phÇn th­ëng lµ: chuyÓn <color=yellow>"..nGoldenExpAward.."<color> ®iÓm søc kháe thµnh ®iÓm kinh nghiÖm (hiÖn t¹i ®iÓm søc kháe lµ "..nCurGoldenExp.."),<color=yellow>"..nExpAward.."<color>,"..szOtherAward..szTitleAward.."§ång ı nhËn kh«ng?"
		else
			szAwardInfo = "Ng­¬i nhËn ®­îc phÇn th­ëng cÊp <color=yellow>"..nAwardLevel.."<color>, néi dung phÇn th­ëng lµ:"..szOtherAward..szTitleAward.."§ång ı nhËn kh«ng?";
		end;
	end;
	Say(g_szInfoHead..szAwardInfo,getn(selTab),selTab);
end;
--Õë¶Ô½¡¿µ¾­Ñé²»¹»¶øÔö¼ÓµÄÒ»¸öÁ÷³Ì
function QX08_GetAward_1(nType,nAwardLevel,nTaskID,bGotTitle)
	if nAwardLevel < 0 or nAwardLevel > 5 then
		WriteLog("[Ho¹t ®éng Olympic sai]:"..GetName().."nAwardLevel bŞ lçi, trŞ lçi: "..nAwardLevel);
		return 0;
	end;
	local nLevel = GetLevel();
	local nCurGoldenExp = GetGoldenExp();
	local nGoldenExpAward = floor((nLevel^2)/(80^2)*g_tbAward[nAwardLevel][1][1]*10000);
	if IB_VERSION ~= 1 and nLevel ~= 99 and nGoldenExpAward > nCurGoldenExp then
		local selTab = {
					"§ång ı/#QX08_GetAward_2("..nType..","..nAwardLevel..","..nTaskID..","..bGotTitle..")",
					"Hñy bá/nothing",
					}
		Say(g_szInfoHead.." ng­¬i cã thÓ chuyÓn <color=yellow>"..nGoldenExpAward.."<color> ®iÓm søc kháe, nh­ng ®iÓm søc kháe hiÖn t¹i lµ <color=yellow>"..nCurGoldenExp.."<color> ®iÓm, <color=red>nhá h¬n<color> ®iÓm søc kháe ng­¬i cã thÓ chuyÓn, ng­¬i cã muèn chuyÓn kh«ng?",getn(selTab),selTab);
	else
		QX08_GetAward_2(nType,nAwardLevel,nTaskID,bGotTitle)
	end;
end;

function QX08_GetAward_2(nType,nAwardLevel,nTaskID,bGotTitle)
	if gf_JudgeRoomWeight(6,20,g_szInfoHead) == 0 then
		return 0;
	end;
	if nAwardLevel < 0 or nAwardLevel > 5 then
		WriteLog("[Ho¹t ®éng Olympic sai]:"..GetName().."nAwardLevel bŞ lçi, trŞ lçi: "..nAwardLevel);
		return 0;
	end;
	local nLevel = GetLevel();
	local nExpAward = 0;
	local nGoldenExpAward = 0;
	SetTask(nTaskID,1);
	if bGotTitle == 1 then
		if nType == GAME_ID_GUESS then
			SetTask(TSK_AOYUN_GUESS_BCOMPLETED,0);
		elseif nType == GAME_ID_BOX then
			SetTask(Box_prize_9_times,0);
		elseif nType == GAME_ID_LIGHT then
			SetTask(TSK_AOYUN_LIGHT_NUM,0);
		end;
		AddTitle(53,nType);
		SetTitleTime(53,nType,GetTime()+24*3600);
		Msg2Player("B¹n nhËn ®­îc danh hiÖu"..g_tbTitleName[nType].." ' danh hiÖu");
		WriteLog("[Ho¹t ®éng Olympic]:"..GetTime().."NhËn ®­îc "..g_tbTitleName[nType].."HiÖu");
	end;
	local nPoint = g_tbAward[nAwardLevel][4];
	SetTask(TSK_AOYUN_POINT,GetTask(TSK_AOYUN_POINT)+nPoint);
	if GetTask(TSK_AOYUN_POINT) > g_nJifenMax then
		SetTask(TSK_AOYUN_POINT,g_nJifenMax);
		Msg2Player("B¹n nhËn ®­îc "..nPoint.."§iÓm tİch lòy ho¹t ®éng");
		Msg2Player("§iÓm cña ng­¬i ®· ®¹t ®Õn "..g_nJifenMax.." ®iÓm, mçi ng­êi nhiÒu nhÊt cã thÓ tİch lòy "..g_nJifenMax.." ®iÓm.");
	else	
		Msg2Player("B¹n nhËn ®­îc "..nPoint.."§iÓm tİch lòy ho¹t ®éng");
	end
	if nLevel == 99 then	--99¼¶½±Àø¡£ÊÕ·ÑÃâ·ÑÒ»ÑùµÄ
		local nNum = g_tbAward[nAwardLevel][3];
		AddItem(2,1,2642,nNum);
		Msg2Player("B¹n nhËn ®­îc "..nNum.." Tói b¶o th¹ch");
		WriteLog("[Ho¹t ®éng Olympic]:"..GetName().."§· nhËn "..nType.."sè"..nAwardLevel.." - phÇn th­ëng ho¹t ®éng:"..nNum.." Tói b¶o th¹ch.");
		return 1;
	end;
	if IB_VERSION == 1 then	--Ãâ·Ñ
		nExpAward = floor((nLevel^2)/(80^2)*g_tbAward[nAwardLevel][2][1]*10000);
		ModifyExp(nExpAward);
		Msg2Player("B¹n nhËn ®­îc "..nExpAward.." ®iÓm kinh nghiÖm");
		WriteLog("[Ho¹t ®éng Olympic]:"..GetName().."§· nhËn "..nType.."sè"..nAwardLevel.." - phÇn th­ëng ho¹t ®éng:"..nExpAward.." ®iÓm kinh nghiÖm");
	else	--ÊÕ·Ñ
		local nCurGoldenExp = GetGoldenExp();
		nGoldenExpAward = floor((nLevel^2)/(80^2)*g_tbAward[nAwardLevel][1][1]*10000);
		nExpAward = floor((nLevel^2)/(80^2)*g_tbAward[nAwardLevel][1][2]*10000);
		ModifyExp(nExpAward);
		Msg2Player("B¹n nhËn ®­îc "..nExpAward.." ®iÓm kinh nghiÖm");
		gf_GoldenExp2Exp(nGoldenExpAward);
		WriteLog("[Ho¹t ®éng Olympic]:"..GetName().."§· nhËn "..nType.."sè"..nAwardLevel.." - phÇn th­ëng ho¹t ®éng: ChuyÓn"..nGoldenExpAward.." ®iÓm søc kháe; "..nExpAward.." ®iÓm kinh nghiÖm");
	end;
end;

function nothing()

end;

--=====================¹«Ôª2008Äê11ÔÂ5ÈÕĞÂ¼Ó=========================
function GetTimeZoneInfo()
	local nCurTime = GetTime();
	local nTimeZoneDiff = floor((nCurTime - MkTime(GmTime(nCurTime)))/3600);
	return nTimeZoneDiff;
end;

--¼ÆËãÖÜµÄĞòÊı
function GetWeekSequence(nWeekDay,nHour,nCurTime)
	nWeekDay = nWeekDay or 1;
	nHour = nHour or 0;
	nCurTime = nCurTime or GetTime();
	local nTimeZoneDiff = GetTimeZoneInfo();
	nCurTime = nCurTime + nTimeZoneDiff*3600;		--´¦ÀíÊ±²î
	nCurTime = nCurTime - 4*24*3600;	--¶ÔÆëµ½1970Äê1ÔÂ1ÈÕ£¨ĞÇÆÚËÄ£©ºóµÄµÚÒ»¸öÖÜÒ»Áè³¿¡£
	local nWeekSecond = 7*24*3600;	--Ò»ÖÜ¶àÉÙÃë
	local nOffset = ((nWeekDay-1)*24+nHour)*3600;	--¼ÆËãÆ«ÒÆÊ±¼ä
	local nTotalTime = nCurTime - nOffset;	--¼ÆËãºóµÄ×ÜÊ±¼ä
	local nWeekSeq = floor(nTotalTime/nWeekSecond);	--¼ÆËãÖÜµÄĞòÊı
	return nWeekSeq;
end;