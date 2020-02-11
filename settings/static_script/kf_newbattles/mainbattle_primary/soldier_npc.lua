Include("\\settings\\static_script\\kf_newbattles\\mainbattle_primary\\mainbattle_head.lua");

function main()
	if random(1,100) == 1 then
		NpcChat(GetTargetNpc(),"Mäi ng­êi cÇn ra søc b¶o vÖ tæ quèc!");
	end;
	local selTab = {
				" ®· tiÕn vµo hËu doanh/enter_back_camp",						
				"Rêi khái chiÕn tr­êng/ask_reason",
				"KÕt thóc ®èi tho¹i/nothing",
				}
	local nCamp = BT_GetCamp()
	if nCamp == SONG_ID and GetMissionV(MV_MID_TRAP_SONG) == 1 then
		tinsert(selTab,2," tiÕn vµo bªn trong chiÕn tr­êng/enter_mid_camp");
	elseif nCamp == LIAO_ID and GetMissionV(MV_MID_TRAP_LIAO) == 1 then
		tinsert(selTab,2," tiÕn vµo bªn trong chiÕn tr­êng/enter_mid_camp");
	end;
	local nCamp = BT_GetCamp()
	local nRandPos = 0;
	if nCamp == SONG_ID and GetMissionV(MV_FRONT_TRAP_SONG) == 1 then
		tinsert(selTab,3," ®· tiÕn vµo tiÒn doanh/enter_front_camp");
	elseif nCamp == LIAO_ID and GetMissionV(MV_FRONT_TRAP_LIAO) == 1 then
		tinsert(selTab,3," ®· tiÕn vµo tiÒn doanh/enter_front_camp");
	end;
	Say("T­íng sÜ phe ta kh«ng ph©n biÖt tuæi t¸c, chØ cÇn ®oµn kÕt ®¸nh ®uæi ngo¹i x©m lµ ®­îc!",getn(selTab),selTab);
end;

function ask_reason()
	if BT_GetTempData(PTT_ROOMINDEX) ~= 0 then	--Èç¹ûÔÚµ¥Ìô³¡µØÖÐ
		return 0;
	end;
	AskClientForString("leave","NhÑ nhµng rêi khái...",1,32,"Sao ph¶i rêi khái?");
end;	

function leave(sLeaveMsg)
	DelMSPlayer(MISSION_ID,0);
	Msg2MSAll(MISSION_ID,"Rêi khái ®Ó l¹i tin nh¾n:"..sLeaveMsg);
end;

function enter_back_camp()
	local nCampPlace = BT_GetCamp()
	local nRandPos = 0;
	if BT_GetTempData(PTT_ROOMINDEX) ~= 0 then	--Èç¹ûÔÚµ¥Ìô³¡µØÖÐ
		return 0;
	end;
	local tPos = {tBackBornPlaceSong,tBackBornPlaceLiao};
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_FIGHT then
		nRandPos = random(1,getn(tPos[nCampPlace]));
		SetPos(tPos[nCampPlace][nRandPos][1],tPos[nCampPlace][nRandPos][2]);
		BT_RestoreAll();
		BT_SetTempData(PTT_DIE_LOOP,0);
		SetFightState(1);
		CastState("state_dispear",0,INVINCIBILITY_TIME*18);
	else
		Talk(1,"","Th¸m tö ®· ®­îc cö ®i, c¸c vÞ xin nhÉn n¹i ®îi tin tøc!.");
	end;
end;

function enter_mid_camp()
	local nCamp = BT_GetCamp()
	local nCampPlace = nCamp;
	local nRandPos = 0;
	if BT_GetTempData(PTT_ROOMINDEX) ~= 0 then	--Èç¹ûÔÚµ¥Ìô³¡µØÖÐ
		return 0;
	end;
	local tPos = {tMidBornPlaceSong,tMidBornPlaceLiao};
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_FIGHT then
		if GetMissionV(MV_MID_TRAP_SONG+nCamp-1) == 1 then
			nRandPos = random(1,getn(tPos[nCampPlace]));
			SetPos(tPos[nCampPlace][nRandPos][1],tPos[nCampPlace][nRandPos][2]);
			BT_RestoreAll();
			SetFightState(1);
			BT_SetTempData(PTT_DIE_LOOP,0);
			CastState("state_dispear",0,INVINCIBILITY_TIME*18);
		else
			Talk(1,"","TiÒn ph­¬ng ®ang giao tranh ¸c liÖt, chóng ta kh«ng thÓ tiÕn vµo qu©n doanh");
		end;
	else
		Talk(1,"","Th¸m tö ®· ®­îc cö ®i, c¸c vÞ xin nhÉn n¹i ®îi tin tøc!.");
	end;
end;

function enter_front_camp()
	local nCamp = BT_GetCamp()
	local nRandPos = random(1,getn(tFrontBornPlace));
	if BT_GetTempData(PTT_ROOMINDEX) ~= 0 then	--Èç¹ûÔÚµ¥Ìô³¡µØÖÐ
		return 0;
	end;
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_FIGHT then
		if GetMissionV(MV_FRONT_TRAP_SONG+nCamp-1) == 1 then
			SetPos(tFrontBornPlace[nRandPos][1],tFrontBornPlace[nRandPos][2]);
			BT_RestoreAll();
			SetFightState(1);
			BT_SetTempData(PTT_DIE_LOOP,0);
			CastState("state_dispear",0,INVINCIBILITY_TIME*18);
		else
			Talk(1,"","TiÒn ph­¬ng ®ang giao tranh ¸c liÖt, chóng ta kh«ng thÓ tiÕn vµo qu©n doanh");
		end;
	else
		Talk(1,"","Th¸m tö ®· ®­îc cö ®i, c¸c vÞ xin nhÉn n¹i ®îi tin tøc!.");
	end;
end;

function nothing()

end;
