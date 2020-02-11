Include("\\script\\battles\\battlehead.lua")
Include("\\script\\shinynight_head.lua")
Include("\\script\\online\\zgc_temp_fun.lua")
IncludeLib("SETTING");
MISSIONID = 20
FRAME2TIME = 18;	--18Ö¡ÓÎÏ·Ê±¼äÏàµ±ÓÚ1ÃëÖÓ
sf_aryItems = {
	{ "Tiªn Th¶o Lé", {6,1,71,1,0,0}, 20 },
	{ "Gia Bµo hoµn", {6,0,2,1,0,0}, 5 },
	{ "Cao Trung hoµn", {6,0,5,1,0,0}, 5 },
	{ "Cao ThiÓm hoµn", {6,0,4,1,0,0}, 5 },
	{ "Tr­êng MÖnh hoµn", {6,0,1,1,0,0}, 5 },
	{ "Phi Tèc hoµn", {6,0,6,1,0,0}, 5 },
	{ "§éc Phßng hoµn", {6,0,10,1,0,0}, 5 },
	{ "B¨ng Phßng hoµn", {6,0,7,1,0,0}, 5 },
	{ "Háa Phßng hoµn", {6,0,9,1,0,0}, 5 },
	{ "L«i Phßng hoµn", {6,0,8,1,0,0}, 5 },
	{ "§¹i Lùc hoµn", {6,0,3,1,0,0}, 30 },
	{ "Ph¸o hoa", {6,0,11,1,0,0}, 1 },
	{ "Hoa Hång", {6,0,20,1,0,0}, 2 },
	{ "T©m T©m T­¬ng ¸nh phï", {6,1,18,1,0,0}, 5 },
	}

SL_AWARDITEM = {
			{2,1,196,1},	--ËÎ·½Õ½Æì
			{2,1,197,1},	--½ð·½Õ½Æì
}

TIMER_1 = 20 * FRAME2TIME; --20Ãë¹«²¼Ò»ÏÂÕ½¿ö
TIMER_2 = 45 * 60  * FRAME2TIME; -- Õ½³¡Ê±¼äÎª45·ÖÖÓ£¬ÆäÖÐ±¨Ãû15·ÖÖÓ£¬¿ªÕ½Ê±¼ä30·ÖÖÓ
RUNGAME_TIME = 15 * 60 * FRAME2TIME / TIMER_1; --±¨Ãû15·ÖÖÓÖ®ºó£¬×Ô¶¯½øÈëÕ½¶·½×¶Î
CLOSE_SIGNUP_TIME = 25 * 60 * FRAME2TIME / TIMER_1	--¿ªÕ½ºó10·ÖÖÓ¹Ø±Õ±¨Ãû
MAX_MEMBERCOUNT = 100--100
TIME_PLAYER_REV = 10--10 ; -- Íæ¼ÒËÀÍö»òÍË³öÓÎÏ·ÔÙ½øÈëÊ±£¬±ØÐë3·ÖÖÓÖ®ºó²ÅÄÜÀë¿ªºóÓªµ½´óÓª
TIME_PLAYER_STAY = 120	--GetGameTime() ÒÔÃëÎªµ¥Î»
--ÒÔÏÂÊÇÄ³Ð©Öµ¼ÇÂ¼ÔÚMissionValueÖÐµÄË÷ÒýÎ»ÖÃ£¬Í¨¹ýGetMissionV(MS_XXX)À´»ñµÃÊµ¼ÊµÄÖµ
MS_butcher = 2;--¼ÇÂ¼µ±Ç°²úÉúµÄÊÇËÎ¾üÔªË§£º1£»»¹ÊÇÁÉ¾üÔªË§£º2£»»¹ÊÇ¶¼²úÉúÁË£º3£»

MS_CENTER_X1 = 4;   --ÇøÓò1£ºµ±±¨Ãû½×¶ÎÊ±£¬½ûÖ¹Íæ¼ÒÀë¿ª´óÓªÊ±£¬½«Íæ¼ÒÈÓ»Ø´óÓªµÄ×ø±ê
MS_CENTER_Y1 = 5;
MS_CENTER_X2 = 6;		--ÇøÓò2
MS_CENTER_Y2 = 7;

MS_HOMEIN_X1 = 8;    --ÇøÓò1£ººóÓªÄÚ×ø±ê
MS_HOMEIN_Y1 = 9;
MS_HOMEOUT_X1 = 10;  --ºóÓªÍâ×ø±ê
MS_HOMEOUT_Y1 = 11;
MS_HOMEIN_X2 = 12;		--ÇøÓò2
MS_HOMEIN_Y2 = 13;
MS_HOMEOUT_X2 = 14;
MS_HOMEOUT_Y2 = 15;
MS_TIMER1 = 17; --¼ÇÂ¼Timer1Ö´ÐÐµÄ´ÎÊý

MS_MOSTDEATH = 18	--Èç¹ûÒ»·½´ó½«ËÀÍö£¬ÔòÎª£º1£¨ËÎ£©»ñ2£¨ÁÉ£©£»·ñÔòÎª£º0

MS_TOTALPOINT_S = 19		--±¾´ÎÕ½ÒÛ½áÊøÊ±ÇëÁã£¬¼ÇÂ¼±¾´ÎÕ½ÒÛËÎ·½×ÜÕ½¹¦
MS_TOTALPOINT_J = 20		--±¾´ÎÕ½ÒÛ½áÊøÊ±ÇëÁã£¬¼ÇÂ¼±¾´ÎÕ½ÒÛÁÉ·½×ÜÕ½¹¦


FILE_HOMETRAP1 = "\\script\\battles\\butcher\\hometrap1.lua";
FILE_HOMETRAP2 = "\\script\\battles\\butcher\\hometrap2.lua";
FILE_CENTERTRAP = "\\script\\battles\\butcher\\centertrap.lua";
FILE_CENTERTOHOMETRAP1 = "\\script\\battles\\butcher\\homeouttrap1.lua"
FILE_CENTERTOHOMETRAP2 = "\\script\\battles\\butcher\\homeouttrap2.lua"
--ºóÓªµ½Ç°ÓªµÄtrap½Å±¾
FILE_HOME2CENTERTRAP1 = "\\script\\battles\\butcher\\home2fronttrap1.lua"
FILE_HOME2CENTERTRAP2 = "\\script\\battles\\butcher\\home2fronttrap2.lua"

tabFILE_NPCDEATH = 
	{
	"\\script\\battles\\butcher\\npcdeath_1.lua",
	"\\script\\battles\\butcher\\npcdeath_2.lua",
	"\\script\\battles\\butcher\\npcdeath_3.lua",
	"\\script\\battles\\butcher\\npcdeath_4.lua",
	"\\script\\battles\\butcher\\npcdeath_5.lua",
	"\\script\\battles\\butcher\\npcdeath_6.lua"
	}

FILE_DOCTOR1 = 	"\\script\\battles\\butcher\\doctor.lua";
FILE_DOCTOR2 = 	"\\script\\battles\\butcher\\doctor.lua";
FILE_SYMBOLNPC = ""
FILE_DEPOSIT = 	"\\script\\battles\\openbox.lua"
FILE_DEATH = "\\script\\battles\\butcher\\npcdeath.lua"

--NpcµÄÄ£°åºÅID

MAX_S_COUNT = 100;
MAX_J_COUNT = 100;

--×îÐ¡ÔÊÐíµÄÄ³Ò»ÕóÓªµÄÍæ¼ÒÊýÁ¿£¬Èç¹ûÔÚÕ½¶·ÖÐÕóÓªµÄÍæ¼ÒÊýÁ¿ÉÙÓÚ¸ÃÊýÄ¿Ôò¸ÃÕóÓªÅÐÊä£¬ÎÞÂÛÕ½¹¦Çé¿öÈçºÎ
MIN_PLAYER_COUNT_LIMIT = 10--10
MIN_PLAYER_COUNT_ING = 1--5
AVERAGE_PLAYERCOUNT = 5--20

MS_STATE = 1; --ÈÎÎñÖÐ¼ÇÂ¼ÈÎÎñ×´Ì¬µÄ±äÁ¿ID
--¸Ã±äÁ¿Ö¸ÏòµÄ×´Ì¬Öµ0±íÊ¾Õ½ÒÛÎª´ò¿ª£¬1±íÊ¾Õ½ÒÛ±¨ÃûÖÐ£¬2±íÊ¾Õ½ÒÛÕ½¶·½øÐÐÖÐ£¬3±íÊ¾Õ½ÒÛ¸Õ¸Õ½áÊøÁË

MS_KEY = 7;		--¼ÇÂ¼µ±Ç°µØÍ¼ÏÂÈÎÎñµÄÒ»¸ökey£¬¼´Ò»¸öËæ»úÉú³ÉµÄÊý¶¨

--MS_NEWSVALUE = 10; --ÈÎÎñÖÐ´æ·ÅÐÂÎÅ±äÁ¿µÄµØ·½

function sf_onplayerleave()
	RestoreOwnFeature()
	BT_SetData(PL_PARAM1 ,0)
	BT_SetData(PL_PARAM2, 0)
	ST_SyncMiniMapObj(-1, -1);
	BT_SetData(PL_LASTDEATHTIME, GetGameTime())
end

---------------------------------------------------------------------
function but_getminplayerlimit()
	return MIN_PLAYER_COUNT_LIMIT
end

function sf_winbouns( wincamp )
	oldPlayerIndex = PlayerIndex
	
	local idx = 0;
	local pidx = 0;
	local tbPlayer = {}
	local tbFailPlayer = {}
	local nCount = 1;
	
	if wincamp == 3 then	--Æ½¾Ö
		for i = 1, 500 do
			idx, pidx = GetNextPlayer(MISSIONID, idx, 0);
			if pidx > 0 then
				PlayerIndex = pidx;
				bt_addtotalpoint(350);
				local point = multiple_reward(SYS_BATTLE, 350)
				Say("TrËn nµy 2 bªn hßa nhau. B¹n nhËn ®­îc <color=yellow>"..point.."<color> ®iÓm chiÕn c«ng.", 0)
			end;
			
			if idx == 0 then
				break;
			end;
		end;
		PlayerIndex = oldPlayerIndex;
		return
	end;
	
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID, idx, wincamp);
		if( pidx > 0 ) then
			tbPlayer[nCount] = pidx
			nCount = nCount + 1;
		end
		
	 	if (idx == 0) then 
			break
		end;
	end
		--Èç¹û½áÊø¶Ô·½ÕóÓªÃ»ÓÐÍæ¼Ò£¬ÔòÊ¤·½²»¸ø½±Àø
	local failcamp = 0
	if (wincamp == 1) then
		failcamp = 2
	else
		failcamp = 1
	end
	if (GetMSPlayerCount(MISSIONID, failcamp) == 0) then
		WriteLog("Do phe b¹i kh«ng cã ng­êi ch¬i nªn phe th¾ng kh«ng ®­îc phÇn th­ëng","NhËt ký Tèng Liªu")
		return
	end
	
	nCount = 1;
	for i = 1, 500 do
		idx, pidx = GetNextPlayer(MISSIONID, idx, failcamp);
		if pidx > 0 then
			tbFailPlayer[nCount] = pidx
			nCount = nCount + 1;
		end
		
		if idx == 0 then
			break
		end;
	end;
	
	--½áÊøºó£¬Ëù¸øµÃÕ½¹¦½±Àø¸ù¾ÝÁ½·½Íæ¼ÒµÄ±ÈÀýËÍ¸øÊ¤·½
--	local wincamp_count = GetMSPlayerCount(MISSIONID, wincamp)
--	local failcamp_count = GetMSPlayerCount(MISSIONID, failcamp)
--	local AVRCUN = (wincamp_count + failcamp_count) / 2
--	local bonuscff1 = 0
--	if (AVRCUN == 0) then
--		bonuscff1 = 1
--		bonuscff2 = 1
--	else
--		bonuscff1 = 1 - ( ( wincamp_count - AVRCUN ) / AVRCUN )
--		bonuscff2 = 1 - ( ( failcamp_count - AVRCUN ) / AVRCUN )
--	end
--	bonuscff1 = floor(1000 * bonuscff1)	--×îÖÕËù¸øµÄ½±Àø¼¸·Ö
--	if( bonuscff1 < 500 ) then
--		bonuscff1 = 500
--	end
--	WriteLog("Ê¤Àû·½ËÍ¸øµÄ½±ÀøÕ½¹¦Îª\t"..bonuscff1,"ËÎÁÉÈÕÖ¾")

	local wincamp_count = GetMSPlayerCount(MISSIONID, wincamp)
	local failcamp_count = GetMSPlayerCount(MISSIONID, failcamp)
	local bonus_s = GetMissionV(MS_TOTALPOINT_S);
	local bonus_j = GetMissionV(MS_TOTALPOINT_J);
	local nMax = 0;
	local nMin = 0;
	
	if bonus_s > bonus_j then
		nMax = bonus_s
		nMin = bonus_j
	else
		nMax = bonus_j
		nMin = bonus_s
	end
	
	local nWinBouns = floor(1000 + nMax / wincamp_count)
	local nFailBouns = floor(350 + nMin / failcamp_count)
	local nLevel = 0;
	local nGoldenExp = 0;
	local nExp = 0;
	local nDate = tonumber(date("%y%m%d"));
	for i = 1, getn(tbPlayer) do
		PlayerIndex = tbPlayer[i]
		if nDate > GetTask(762) then
			SetTask(763,0);
		end;
		bt_addtotalpoint(nWinBouns)
		SetTask(763,GetTask(763)+1);	--´ÎÊý£«£±
		SetTask(762,nDate);
		nLevel = GetLevel();
		nGoldenExp = GetGoldenExp();
		if nGoldenExp >= 1500000 then
			nGoldenExp = 1500000
		end;
		if IsPlayerDeath() == 0 then	--²»ÊÇËÀÍö×´Ì¬
			ModifyGoldenExp(-nGoldenExp);
			ModifyExp(nGoldenExp);
		end;
		local sExpString = "";
		if GetTask(763) <= 2 then
			if nLevel >= 40 and nLevel < 60 then
				nExp = floor(1000000*0.3);
			elseif nLevel >= 60 and nLevel < 70 then
				nExp = floor(1000000*0.6);
			elseif nLevel >= 70 and nLevel < 80 then
				nExp = floor(1000000*0.8);
			else
				nExp = 1000000;
			end;
			if IsPlayerDeath() == 0 then	--²»ÊÇËÀÍö×´Ì¬
				ModifyExp(nExp);
				sExpString = "B¹n nhËn ®­îc thªm"..nExp.."®iÓm kinh nghiÖm. Mçi ng­êi mçi ngµy chØ nhËn ®­îc thªm 2 lÇn ®iÓm kinh nghiÖm.";
			end;
		end;
		if IsPlayerDeath() == 0 then	--²»ÊÇËÀÍö×´Ì¬
			Msg2Player("Do phe b¹n giµnh ®­îc th¾ng lîi, nhËn ®­îc ban th­ëng cña nguyªn so¸i,"..nGoldenExp.."®iÓm søc kháe nhanh chãng ®æi thµnh kinh nghiÖm."..sExpString);
		end;
		local point = multiple_reward(SYS_BATTLE, nWinBouns)
		--AddItem(SL_AWARDITEM[wincamp][1], SL_AWARDITEM[wincamp][2], SL_AWARDITEM[wincamp][3], SL_AWARDITEM[wincamp][4])
		Say("Phe ta ®¹i th¾ng trËn nµy. B¹n nhËn ®­îc <color=yellow>"..point.."<color> ®iÓm chiÕn c«ng.", 0)
	end
	sExpString = "";
	for i = 1, getn(tbFailPlayer) do
		PlayerIndex = tbFailPlayer[i]
		if nDate > GetTask(762) then
			SetTask(763,0);
		end;
		bt_addtotalpoint(nFailBouns)
		SetTask(763,GetTask(763)+1);	--´ÎÊý£«£±
		SetTask(762,nDate);
		nLevel = GetLevel();
		nGoldenExp = GetGoldenExp();
		if nGoldenExp >= 500000 then
			nGoldenExp = 500000
		end;
		if IsPlayerDeath() == 0 then	--²»ÊÇËÀÍö×´Ì¬
			ModifyGoldenExp(-nGoldenExp);
			ModifyExp(nGoldenExp);
		end;
		local sExpString = "";
		if GetTask(763) <= 2 then
			if nLevel >= 40 and nLevel < 60 then
				nExp = floor(300000*0.3);
			elseif nLevel >= 60 and nLevel < 70 then
				nExp = floor(300000*0.6);
			elseif nLevel >= 70 and nLevel < 80 then
				nExp = floor(300000*0.8);
			else
				nExp = 300000;
			end;
			if IsPlayerDeath() == 0 then	--²»ÊÇËÀÍö×´Ì¬
				ModifyExp(nExp);
				sExpString = "B¹n nhËn ®­îc thªm"..nExp.."®iÓm kinh nghiÖm. Mçi ng­êi mçi ngµy chØ nhËn ®­îc thªm 2 lÇn ®iÓm kinh nghiÖm.";
			end;
		end;
		if IsPlayerDeath() == 0 then	--²»ÊÇËÀÍö×´Ì¬
			Msg2Player("Do phe b¹n thua cuéc, nguyªn so¸i ®Ých th©n chØ ®¹o,"..nGoldenExp.."®iÓm søc kháe nhanh chãng ®æi thµnh kinh nghiÖm. Hy väng næ lùc h¬n!"..sExpString);
		end;
		local point = multiple_reward(SYS_BATTLE, nFailBouns)
		Say("B¹n ®· anh dòng chiÕn ®Êu, lËp nhiÒu c«ng tr¹ng. §Ó khÝch lÖ t­íng sÜ, Th¸nh Th­îng anh minh ban th­ëng <color=yellow>"..point.."<color> ®iÓm chiÕn c«ng.", 0);
	end;
	
	PlayerIndex = oldPlayerIndex
end

function sf_winbouns_old(wincamp)	--×÷·Ï
	--Èç¹û½áÊø¶Ô·½ÕóÓªÃ»ÓÐÍæ¼Ò£¬ÔòÊ¤·½²»¸ø½±Àø
	if (wincamp == 1) then
		failcamp =2
	else
		failcamp =1
	end
	if (GetMSPlayerCount(MISSIONID, failcamp) == 0) then
		WriteLog("Do phe b¹i kh«ng cã ng­êi ch¬i nªn phe th¾ng kh«ng ®­îc phÇn th­ëng","NhËt ký Tèng Liªu")
		return
	end
	
	--½áÊøºó£¬Ëù¸øµÃÕ½¹¦½±Àø¸ù¾ÝÁ½·½Íæ¼ÒµÄ±ÈÀýËÍ¸øÊ¤·½
	local CAMP1CUN = GetMSPlayerCount(MISSIONID, wincamp)
	local CAMP2CUN = GetMSPlayerCount(MISSIONID, failcamp)
	local AVRCUN = (CAMP1CUN + CAMP2CUN)/2
	
	if (AVRCUN == 0) then
		bonuscff1 = 1
		bonuscff2 = 1
	else
		bonuscff1 = 1-(CAMP1CUN-AVRCUN)/AVRCUN
		bonuscff2 = 1-(CAMP2CUN-AVRCUN)/AVRCUN
	end
	bonuscff1 = floor(1000 * bonuscff1)	--×îÖÕËù¸øµÄ½±Àø¼¸·Ö
	WriteLog("PhÇn th­ëng chiÕn c«ng phe th¾ng nhËn ®­îc lµ:"..bonuscff1,"NhËt ký Tèng Liªu")
	
	sf_itemcount = getn(sf_aryItems)
	idx = 0;
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID, idx, wincamp);
	 	if (idx == 0) then 
			break
		end;
 
 		if (pidx > 0) then
   			PlayerIndex = pidx;
	   		AddRepute(3);			
	   		Msg2Player("B¹n ®­îc thªm 3 ®iÓm danh väng!")
			bt_addtotalpoint(bonuscff1)
			Msg2Player("B¹n nhËn ®­îc "..bonuscff1.."®iÓm chiÕn c«ng!")
			Say("Chóc mõng b¹n giµnh ®­îc chiÕn th¾ng trong trËn chiÕn nµy, b¹n ®­îc thªm <color=yellow>3<color> ®iÓm danh väng vµ <color=yellow>"..bonuscff1.."<color> ®iÓm chiÕn c«ng + <color=yellow>HuyÒn Tinh Kho¸ng Th¹ch<color>!", 0)
				if (GetLevel() >= 40 and GetLevel() < 60) then
					AddItem(6,1,147,1,0,0);
				end
				if (GetLevel() >= 60 and GetLevel() < 90) then
					AddItem(6,1,147,2,0,0);
				end
				if (GetLevel() >= 90 ) then
					AddItem(6,1,147,3,0,0);
				end
				randitem = random(1, sf_itemcount);
			if (randitem > 0) then
				local szItemName = sf_aryItems[randitem][1];
				local arySelItemID =  sf_aryItems[randitem][2];
				AddItem( arySelItemID[1], arySelItemID[2], arySelItemID[3], arySelItemID[4], arySelItemID[5], arySelItemID[6], 0);
				Msg2Player("<#> Chóc mõng b¹n nhËn ®­îc phÇn th­ëng"..szItemName);
			end;
 		end;
	end
end;

function but_addmissionpoint(totalpoint)
print( "but_addmissionpoint=="..totalpoint )
	if (totalpoint == 0) then
		return
	end
	if (GetCurCamp() == 1) then
		SetMissionV(MS_TOTALPOINT_S, GetMissionV(MS_TOTALPOINT_S)+totalpoint)
		print("GetMissionV(MS_TOTALPOINT_S)=="..GetMissionV(MS_TOTALPOINT_S))
	else
		SetMissionV(MS_TOTALPOINT_J, GetMissionV(MS_TOTALPOINT_J)+totalpoint)
		print("GetMissionV(MS_TOTALPOINT_J)=="..GetMissionV(MS_TOTALPOINT_J))
	end
end

function GameOver()
	local bonus_s = GetMissionV(MS_TOTALPOINT_S)
	local bonus_j = GetMissionV(MS_TOTALPOINT_J)
	local resultstr = "";
	local lsf_level = BT_GetGameData(GAME_LEVEL)
	WriteLog(szGAME_GAMELEVEL[ lsf_level ].."battle is ending\tsongmemcount\t"..GetMSPlayerCount(MISSIONID, 1).."\tliaomemcount\t"..GetMSPlayerCount(MISSIONID, 2).."\tsongpoint\t"..bonus_s.."\tliaopoint\t"..bonus_j,"NhËt ký Tèng Liªu")
	
	--¸üÐÂËÎÁÉÏà¹ØµÄÊÀ½çÅÅÃû°ñ

--	--Ä£Ê½×ÜÅÅÐÐ°ñ

		BT_SortWorldLadder(PL_TOTALPOINT, 10147)
		BT_SortWorldLadder(PL_KILLPLAYER, 10148)
		BT_SortWorldLadder(PL_MAXSERIESKILL, 10149)
		BT_SortWorldLadder(PL_GETITEM, 10150)

	--Ä£Ê½¼ÓµÈ¼¶ÅÅÐÐ°ñ
--		if (lsf_level == 3) then
--			BT_SortWorldLadder(PL_KILLPLAYER, 10151)
--			BT_SortWorldLadder(PL_MAXSERIESKILL, 10152)
--			BT_SortWorldLadder(PL_GETITEM, 10153)
--			BT_SortWorldLadder(PL_TOTALPOINT, 10154)
		if (lsf_level == 2) then
			BT_SortWorldLadder(PL_KILLPLAYER, 10155)
			BT_SortWorldLadder(PL_MAXSERIESKILL, 10156)
			BT_SortWorldLadder(PL_GETITEM, 10157)
			BT_SortWorldLadder(PL_TOTALPOINT, 10158)
		elseif (lsf_level == 1) then
			BT_SortWorldLadder(PL_KILLPLAYER, 10159)
			BT_SortWorldLadder(PL_MAXSERIESKILL, 10160)
			BT_SortWorldLadder(PL_GETITEM, 10161)
			BT_SortWorldLadder(PL_TOTALPOINT, 10162)
		end

	
	BT_SortWorldLadder(PL_TOTALPOINT, 10085)
	BT_SortWorldLadder(PL_BATTLEPOINT, 10086)
	BT_SortWorldLadder(PL_KILLPLAYER, 10087)
	BT_SortWorldLadder(PL_MAXSERIESKILL, 10089)
	BT_SortWorldLadder(PL_GETITEM, 10090)
	
	if (lsf_level == 1) then
		resultstr = "Khu vùc s¬ cÊp"
	elseif (lsf_level == 2) then
		resultstr = "Khu vùc cao cÊp"
	end
	
	if (GetMissionV(MS_MOSTDEATH) == 0) then
		if (bonus_s > bonus_j ) then
			resultstr = resultstr.."ChiÕn ®Êu kÕt thóc, tæng chiÕn c«ng hai phe Tèng Liªu nhËn ®­îc lµ"..bonus_s..":"..bonus_j..", phe Tèng giµnh chiÕn th¾ng!";
			Msg2MSAll(MISSIONID, resultstr)
			WriteLog(resultstr,"NhËt ký Tèng Liªu")
			BT_ReportResult(1)
			RecordBTCount_Win(1)		--ÔÚÃ¿¸öÈËÈÎÎñ±äÁ¿Àï¼ÇÂ¼Ëü´Ë´ÎËÎÁÉÕ½³¡Ê¤¸º×´¿ö
			sf_winbouns(1)
		elseif (bonus_s < bonus_j) then
			resultstr = resultstr.."ChiÕn ®Êu kÕt thóc, tæng chiÕn c«ng hai phe Tèng Liªu nhËn ®­îc lµ"..bonus_s..":"..bonus_j..", phe Liªu giµnh chiÕn th¾ng!"
			Msg2MSAll(MISSIONID, resultstr)
			WriteLog(resultstr,"NhËt ký Tèng Liªu")
			BT_ReportResult(2)
			RecordBTCount_Win(2)	--ÔÚÃ¿¸öÈËÈÎÎñ±äÁ¿Àï¼ÇÂ¼Ëü´Ë´ÎËÎÁÉÕ½³¡Ê¤¸º×´¿ö
			sf_winbouns(2)
		else
			resultstr = resultstr.."ChiÕn ®Êu kÕt thóc, tæng chiÕn c«ng hai phe Tèng Liªu nhËn ®­îc lµ"..bonus_s..":"..bonus_j..", chiÕn dÞch lÇn nµy bÊt ph©n th¾ng b¹i"
			Msg2MSAll(MISSIONID, resultstr)
			sf_winbouns(3);	--Æ½¾Ö
			WriteLog(resultstr,"NhËt ký Tèng Liªu")
		end;

		AddGlobalNews(resultstr)

	elseif (GetMissionV(MS_MOSTDEATH) == 1) then
		resultstr = resultstr.."Thêi gian khai chiÕn ®· ®Õn, nh­ng sè ng­êi hai phe kh«ng ®¹t yªu cÇu. Hñy trËn chiÕn!"
		Msg2MSAll(MISSIONID, resultstr)
		WriteLog(resultstr,"NhËt ký Tèng Liªu")
		AddGlobalNews(resultstr)
	elseif( GetMissionV(MS_MOSTDEATH) == 2 ) then
		resultstr = resultstr.."Do qu©n sÜ phe Liªu ®µo ngò trong chiÕn dÞch nªn phe Tèng giµnh chiÕn th¾ng!"
		Msg2MSAll(MISSIONID, resultstr)
		WriteLog(resultstr,"NhËt ký Tèng Liªu")
		AddGlobalNews(resultstr)
		BT_ReportResult(1)
		RecordBTCount_Win(1)	--ÔÚÃ¿¸öÈËÈÎÎñ±äÁ¿Àï¼ÇÂ¼Ëü´Ë´ÎËÎÁÉÕ½³¡Ê¤¸º×´¿ö
		sf_winbouns(1)
	elseif( GetMissionV(MS_MOSTDEATH) == 3 ) then
		resultstr = resultstr.."Do qu©n sÜ phe Tèng ®µo ngò trong chiÕn dÞch nªn phe Liªu giµnh chiÕn th¾ng!"
		Msg2MSAll(MISSIONID, resultstr)
		WriteLog(resultstr,"NhËt ký Tèng Liªu")
		AddGlobalNews(resultstr)
		BT_ReportResult(2)
		RecordBTCount_Win(2)	--ÔÚÃ¿¸öÈËÈÎÎñ±äÁ¿Àï¼ÇÂ¼Ëü´Ë´ÎËÎÁÉÕ½³¡Ê¤¸º×´¿ö
		sf_winbouns(2)
	end
	Msg2Global(resultstr)
	local tbPlayer = {};
	local idx = 0;
	local pidx = 0;
	for i = 1 , 500 do
		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
		if( pidx > 0 ) then
			tbPlayer[getn(tbPlayer)+1] = pidx
		end
		if (idx <= 0) then
	 		break
	 	end
	end 	

 	for i= 1, getn(tbPlayer) do 
	 	PlayerIndex = tbPlayer[i];
	 	Xmas_prize_get(1)	--Ê¥µ®½±Àø
	 	l_curcamp = GetCurCamp();
		camp = GetCamp();
		SetCurCamp(camp);
		SetTaskTemp(200,0);
		SetCreateTeam(0);
		SetDeathScript("");
		SetFightState(0)		-- ´òÍêÕÌºó¸ÄÎª·ÇÕ½¶·×´Ì¬£¨by Dan_Deng£©
		SetPunish(1)
		ForbidChangePK(0);
		SetPKFlag(0, 0)
		level = BT_GetGameData(GAME_LEVEL);
		UseScrollEnable(1);
		local temp_mapid,temp_posx, temp_posy = bt_getsignpos(l_curcamp)
		local campname = ""	
		if (l_curcamp == 1) then
			SetRevPos(tbGAME_SIGNMAP[lsf_level], tbGAME_SIGNMAP[lsf_level])
			NewWorld(bt_getsignpos(1))
			campname = "Tèng\t"
		else	
			SetRevPos(tbGAME_SIGNMAP[lsf_level], (tbGAME_SIGNMAP[lsf_level] + 1))
			NewWorld(bt_getsignpos(2))
			campname = "Liªu\t"
		end;
		WriteLog( campname..GetName().."\t§¼ng cÊp\t"..GetLevel().."\tM«n ph¸i\t"..GetPlayerRoute().."\t§iÓm tÝch lòy vßng nµy\t"..BT_GetData( PL_KILLPLAYER ),"NhËt ký Tèng Liªu" )
		SetTempRevPos( temp_mapid, temp_posx * 32, temp_posy * 32 )
		SetLogoutRV(0);
	end;
end;

-------------------------------------------------------------------------
function sf_join(camp)
	LeaveTeam()
	if (GetMSPlayerCount(MISSIONID, camp) >= MAX_MEMBERCOUNT ) then
		if (camp==1) then
			Msg2Player("Binh lùc qu©n ta hiÖn ®· ®ñ tiªu diÖt giÆc Liªu, vÉn cßn nhiÒu c¬ héi lËp c«ng! Anh hïng! Xin ®îi lÇn sau!")
		elseif (camp==2) then
			Msg2Player("Binh lùc qu©n ta hiÖn ®· ®ñ tiªu diÖt giÆc Tèng, vÉn cßn nhiÒu c¬ héi lËp c«ng! Anh hïng! Xin ®îi lÇn sau!")
			return
		end
	end
	
	local ownmscount = GetMSPlayerCount(MISSIONID, camp)
	local countstr = ""
	if( camp == 1 ) then
		emymscount = GetMSPlayerCount(MISSIONID, 2)
		countstr = "Sè ng­êi b¸o danh hai phe v­ît qu¸"..AVERAGE_PLAYERCOUNT..", hiÖn sè ng­êi phe Tèng qu¸ nhiÒu. B¹n kh«ng gia nhËp ®­îc!"
	else
		emymscount = GetMSPlayerCount(MISSIONID, 1)
		countstr = "Sè ng­êi b¸o danh hai phe v­ît qu¸"..AVERAGE_PLAYERCOUNT..", hiÖn sè ng­êi phe Liªu qu¸ nhiÒu. B¹n kh«ng gia nhËp ®­îc!"
	end
	
	if( (ownmscount - emymscount) >= AVERAGE_PLAYERCOUNT ) then
		Talk(1, "", countstr)
		return
	end
	
	local timer1 = BT_GetTimer1()
	if (timer1 >= CLOSE_SIGNUP_TIME and BT_GetData(PL_KEYNUMBER) ~= BT_GetGameData(GAME_KEY)) then
		Talk(1, "", "TiÒn ph­¬ng Nh¹n M«n quan ®ang trong håi kÞch liÖt, ®­êng vµo chiÕn tr­êng cña mçi bªn ®· bÞ phong táa. ViÖn qu©n chØ cã thÓ l­u l¹i n¬i nµy ®îi tin chiÕn b¸o!")
		Msg2Player("Khai chiÕn ®­îc 10 phót, ®­êng ®Õn chiÕn tr­êng Nh¹n M«n Quan ®· bÞ phong táa.")
		return
	end
	result = bt_checklastbattle(camp)
	
	if (result == 2) then
		if (camp==1) then
			Talk(1,"","Bän Liªu cÈu c¸c ng­¬i x©m ph¹m bê câi ta, giÕt h¹i ®ång bµo ta, hËn cao nh­ nói! Ta thÒ sÏ quyÕt chiÕn ®Õn cïng röa hËn cho §¹i Tèng!")
		else
			Talk(1,"","Liªu Quèc chóng ta t­íng sÜ ng­êi ng­êi ®Òu thiÖn chiÕn. Bän Tèng Quèc thèi n¸t kia sao ®ñ søc chèng tr¶! Ha! Ha! Ha!")
			return
		end
	end

if (result == 0) then
--	if (GetCash() >= 3000) then
--		Pay(3000)
		BT_LeaveBattle() -- Çå³ýÍæ¼Ò¿Í»§¶Ëµ±Ç°µÄÅÅÃûÊý¾Ý
		BT_ClearPlayerData()
--		Msg2Player("Õ½³¡ÌáÊ¾£ºÕ½³¡ÖÐ¿ÉÒÔ°´¼üÅÌ×óÉÏ½ÇµÄ¡«¼üÇÐ»»ÏÔÊ¾µ±Ç°Õ½¶·µÄÇé¿ö");
		BT_SetData(PL_ROUND,BT_GetGameData(GAME_ROUND))
--	else
--		Say("¶Ô²»Æð£¬²Î¼Ó±¾´ÎËÎÁÉ´óÕ½£¬Äã±ØÐë¸¶±¨Ãû·Ñ3000Á½", 0)
--		return 
--	end
	if( camp == 1 ) then
		Msg2Player("Hoan nghªnh hiÖp kh¸ch gia nhËp Tèng qu©n. HiÖn Liªu binh ch­a xuÊt hiÖn, t­íng sÜ h·y t¹m nghØ ng¬i. §îi hiÖu lÖnh cïng x«ng lªn giÕt giÆt!")
	else
		Msg2Player("Hoan nghªnh hiÖp kh¸ch gia nhËp Liªu qu©n. HiÖn Liªu binh ch­a xuÊt hiÖn, t­íng sÜ h·y t¹m nghØ ng¬i. §îi hiÖu lÖnh cïng x«ng lªn giÕt giÆt!")
	end
end

if( result == 1 and GetMissionV(MS_STATE) == 1 ) then
	if( camp == 1 ) then
		Msg2Player("Hoan nghªnh hiÖp kh¸ch gia nhËp Tèng qu©n. HiÖn Liªu binh ch­a xuÊt hiÖn, t­íng sÜ h·y t¹m nghØ ng¬i. §îi hiÖu lÖnh cïng x«ng lªn giÕt giÆt!")
	else
		Msg2Player("Hoan nghªnh hiÖp kh¸ch gia nhËp Liªu qu©n. HiÖn Liªu binh ch­a xuÊt hiÖn, t­íng sÜ h·y t¹m nghØ ng¬i. §îi hiÖu lÖnh cïng x«ng lªn giÕt giÆt!")
	end
end

gametime = floor(GetMSRestTime(MISSIONID, 40) / 18);
AddMSPlayer(MISSIONID,camp);
BT_UpdateMemberCount();
SetCurCamp(camp);

SetTaskTemp(200,1)
SetFightState(0);
SetLogoutRV(1);

SetPunish(0);

level = BT_GetGameData(GAME_LEVEL)
if (BT_GetData(PL_CURRANK) > 0) then
	Title_AddTitle(BT_GetData(PL_CURRANK), 0, 399999)
	Title_ActiveTitle(BT_GetData(PL_CURRANK))
end

if (camp == 1) then
	posx = GetMissionV(MS_HOMEIN_X1)
	posy = GetMissionV(MS_HOMEIN_Y1)
	str = GetName().." ®· gia nhËp phe Tèng."
	EnterChannel(PlayerIndex, "Tèng"..szGAME_GAMELEVEL[level].."D¹ng thøc cõu s¸t")
else
	posx = GetMissionV(MS_HOMEIN_X2)
	posy = GetMissionV(MS_HOMEIN_Y2)
	str = GetName().." ®· gia nhËp phe Liªu."
	EnterChannel(PlayerIndex, "Liªu"..szGAME_GAMELEVEL[level].."D¹ng thøc cõu s¸t")
end

BT_SetData(PL_PARAM1,0)
BT_SetData(PL_PARAM2,0)
sf_mapid = SubWorldIdx2ID(SubWorld)

if (camp == 1) then
	SetRevPos(tbGAME_SIGNMAP[level], tbGAME_SIGNMAP[level] )
else
	SetRevPos(tbGAME_SIGNMAP[level], tbGAME_SIGNMAP[level] + 1)
end

NewWorld(sf_mapid, posx, posy);
UseScrollEnable(0);	--½ûÖ¹Ê¹ÓÃ»Ø³Ç·û
SetLogoutRV(1);
SetTempRevPos(sf_mapid, posx * 32, posy * 32);
BT_SetData(PL_LASTDEATHTIME, GetGameTime())

SetCreateTeam(1);
BT_SetData(PL_KEYNUMBER, BT_GetGameData(GAME_KEY))
BT_SetData(PL_BATTLEID, BT_GetGameData(GAME_BATTLEID))
BT_SetData(PL_RULEID, BT_GetGameData(GAME_RULEID))
BT_SetData( PL_MAXSERIESKILL, 0 )
--BT_SetData( PL_SERIESKILL, 0 )  --²»ÒªÇå0,¼ÓÈëÐÂÕ½³¡µÄÊ±ºò²ÅÇå
--BT_SetData( PL_KILLPLAYER, 0 )  --Í¬ÉÏ
BT_SetData( PL_TOTALPOINT, 0 )
BT_SetData( PL_LEAVETIME, 0 )

BT_BroadView();
BT_BroadAllLadder();
BT_SetRestTime(gametime);
BT_BroadGameData();
BT_SortLadder();
BT_BroadSelf();
BT_BroadBattleDesc();
BT_ViewBattleStart();
SetFightState(0)
Msg2MSAll(MISSIONID,str);
SetPKFlag(1, camp)
ForbidChangePK(1);
SetDeathScript("\\script\\battles\\butcher\\playerdeath.lua");

Say( "§¹i chiÕn Nh¹n M«n quan: <enter>Mçi lÇn ®¸nh b¹i mçi ®èi ph­¬ng sÏ nhËn ®­îc ®iÓm chiÕn c«ng nhÊt ®Þnh. Cuèi cïng, c¨n cø vµo tæng chiÕn c«ng cña hai bªn ®Ó ph©n ®Þnh th¾ng b¹i. NÕu hßa ®iÓm nhau th× phe nµo cã sè ng­êi tham chiÕn (bao gåm ë hËu doanh) Ýt h¬n 1 ng­êi sÏ bÞ xö thua. <enter> HiÖn phe Tèng cßn:"..GetMSPlayerCount(MISSIONID, 1).." ng­êi; Phe Liªu cßn:"..GetMSPlayerCount(MISSIONID, 2).." ng­êi", 0 )

end;
------------------------------------------------------------------

-----½«Ãë´«»»³É·ÖÓëÃë£¬±ÈÈç62s = 1m2s
function GetMinAndSec(nSec)
nRestMin = floor(nSec / 60);
nRestSec = mod(nSec,60)
return nRestMin, nRestSec;
end;

------------------------------------------------------

function RecordBTCount_Win(camp)		--ÔÚÃ¿¸öÈËÈÎÎñ±äÁ¿Àï¼ÇÂ¼Ëü´Ë´ÎËÎÁÉÕ½³¡Ê¤¸º×´¿ö
	if (camp ~= 1 and camp ~= 2) then
		print("ERROR: Tèng Liªu kÕt thóc, Log th¾ng thua bÞ lçi!")
		return
	end
	idx = 0
	pidx = 0
	if (camp == 1) then
		for i = 1 , 500 do 
			idx, pidx = GetNextPlayer(MISSIONID,idx, 1);
			if (idx == 0) then 
		 		break
		 	end			 	
		 	PlayerIndex = pidx
		 	if (PlayerIndex > 0) then
		 		nt_setTask(1072, nt_getTask(1072) + 1)
		 	end
		end
		for i = 1 , 500 do 
			idx, pidx = GetNextPlayer(MISSIONID,idx, 2);
			if (idx == 0) then 
		 		break
		 	end			 	
		 	PlayerIndex = pidx
		 	if (PlayerIndex > 0) then
		 		nt_setTask(1073, nt_getTask(1073) + 1)
		 	end
		end
	else
		for i = 1 , 500 do 
			idx, pidx = GetNextPlayer(MISSIONID,idx, 2)
			if (idx == 0) then 
		 		break
		 	end			 	
		 	PlayerIndex = pidx
		 	if (PlayerIndex > 0) then
		 		nt_setTask(1072, nt_getTask(1072) + 1)
		 	end
		end
		for i = 1 , 500 do 
			idx, pidx = GetNextPlayer(MISSIONID,idx, 1)
			if (idx == 0) then 
		 		break
		 	end			 	
		 	PlayerIndex = pidx
		 	if (PlayerIndex > 0) then
		 		nt_setTask(1073, nt_getTask(1073) + 1)
		 	end
		end
	end
end

-- ÉèÖÃÈÎÎñ×´Ì¬
function nt_setTask(nTaskID, nTaskValue)
	SetTask(nTaskID, nTaskValue)
	SyncTaskValue(nTaskID) -- Í¬²½µ½¿Í»§¶Ë
end

-- »ñÈ¡ÈÎÎñ×´Ì¬
function nt_getTask(nTaskID)
	return GetTask(nTaskID)
end

function but_pop2home( camp )
	oldPlayerIndex = PlayerIndex
	tbPlayer = { }
	tbRMPlayer = {}
	count = 0
	count_remain = 0
	idx = 0;
	pidx = 0
	for i = 1 , 500 do
		idx, pidx = GetNextPlayer( MISSIONID,idx, camp );
		if( pidx > 0 ) then
			PlayerIndex = pidx
			if ( GetFightState( ) == 0 and ( ( GetGameTime() - BT_GetData( PL_LASTDEATHTIME ) ) >= TIME_PLAYER_STAY ) ) then
		 		count = count + 1
		 		tbPlayer[ count ] = pidx
			elseif ( GetFightState( ) == 0 ) then
		 		count_remain = count_remain + 1
		 		tbRMPlayer[ count_remain ] = pidx
			end
		end
		if (idx == 0) then 
	 		break
	 	end;
	end 

	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	local temprevposx = 0
	local temprevposy = 0
	if ( count > 0 ) then
		if ( camp == 1 ) then
			area = BT_GetGameData(GAME_CAMP1AREA);
			temprevposx = GetMissionV(MS_HOMEIN_X1) * 32
			temprevposy = GetMissionV(MS_HOMEIN_Y1) * 32
		else
			area = BT_GetGameData(GAME_CAMP2AREA);
			temprevposx = GetMissionV(MS_HOMEIN_X2) * 32
			temprevposy = GetMissionV(MS_HOMEIN_Y2) * 32
		end
		npcfile = GetIniFileData(mapfile, "Area_"..area, tbNPCPOS[random(2)]);
		for i = 1, count do
			PlayerIndex = tbPlayer[ i ]
			x,y = bt_getadata(npcfile)
			print("but_pop2home  but_pop2home  but_pop2home  but_pop2home")
			SetPos(floor(x/32), floor(y/32))
			SetTempRevPos(SubWorldIdx2ID(SubWorld) , temprevposx, temprevposy);
			SetFightState(1)
			Msg2Player("B¹n kh«ng thÓ tiÕp tôc l­u l¹i ë HËu doanh.")
		end
	end

	if ( count_remain > 0 ) then
		for i = 1, count_remain do
			PlayerIndex = tbRMPlayer[ i ]
			remain_time = TIME_PLAYER_STAY - ( GetGameTime() - BT_GetData( PL_LASTDEATHTIME ) )
			if( remain_time > 0) then
				Msg2Player("B¹n cã thÓ l­u l¹i ë HËu doanh"..remain_time.." Gi©y ")
			end
		end
	end
	PlayerIndex = oldPlayerIndex
end

function sj_getfrontpos( camp )
	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	local area = 0
	if( camp == 1 ) then
		area = BT_GetGameData( GAME_CAMP1AREA )
	else
		area = BT_GetGameData( GAME_CAMP2AREA )
	end
	local area_section = "Area_"..area;
-------------------------------------------------------------------------
--¶ÁÈ¡Á½¸öÇøÓòµÄ´óÓªÄÚµã×ø±ê
	--´Ó´óÓªµ½ºóÓªÊ±µÄ×ø±êµã
    frontpos = GetIniFileData(mapfile, area_section , "frontpos")
    x,y =bt_str2xydata(frontpos)
    return x, y
end

--Õ½ÒÛ½øÐÐÖÐ£¬Èç¹ûÒ»·½ÈËÊý²»Âú×ã×îÐ¡ÈËÊýÏÞÖÆ£¬ÔòÅÐÊä
function wl_search_memcount()
	local group1count = GetMSPlayerCount(MISSIONID, 1)
	local group2count = GetMSPlayerCount(MISSIONID, 2)
	
	if( group1count >= MIN_PLAYER_COUNT_ING and group2count >= MIN_PLAYER_COUNT_ING ) then
		return
	end
	
	if( group1count > group2count ) then
		SetMissionV(MS_MOSTDEATH, 2)
	elseif( group1count < group2count ) then
		SetMissionV(MS_MOSTDEATH, 3)
	end
	return 1
end

function sl_clearbattledata()	--±¾´ÎÕ½¶·½áÊøºó£¬Çå³ýÕ½³¡ÐÅÏ¢
	for i = 1, 14 do
		BT_SetGameData( i, 0 )
	end
end