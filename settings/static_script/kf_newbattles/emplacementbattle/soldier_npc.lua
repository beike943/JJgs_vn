Include("\\settings\\static_script\\kf_newbattles\\emplacementbattle\\emplacementbattle_head.lua");

function main()
	local nNpcIndex = GetTargetNpc();
	local _,nMapX,nMapY = GetNpcWorldPos(nNpcIndex);
	if BT_GetDistance(nMapX,nMapY) >= 14 then
		return 0;
	end;
	if random(1,100) == 1 then
		NpcChat(GetTargetNpc(),"Nghe nãi ph¸o ®µi nhiÒu n¨m kh«ng tu söa nªn bÞ môc n¸t, ®øng gÇn sÏ chÞu tæn th­¬ng nhÊt ®Þnh, t­íng sÜ h·y cÈn thËn!");
	end;
	local selTab = {
				" ®· tiÕn vµo tiÒn doanh/enter_front_camp",
				" ®· tiÕn vµo hËu doanh/enter_back_camp",
				"Rêi khái chiÕn tr­êng/ask_reason",
				"KÕt thóc ®èi tho¹i/nothing",
				}
	Say("T­íng sÜ phe ta kh«ng ph©n biÖt tuæi t¸c, chØ cÇn ®oµn kÕt ®¸nh ®uæi ngo¹i x©m lµ ®­îc!",getn(selTab),selTab);
end;

function ask_reason()
	AskClientForString("leave","NhÑ nhµng rêi khái...",1,32,"Sao ph¶i rêi khái?");
end;	

function leave(sLeaveMsg)
	local nBattleType = BT_GetData(PT_BATTLE_TYPE);
	local nMissionID = 0;
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(tBTMSInfo[nBattleType][2]);
	nMissionID = tBTMSInfo[nBattleType][1];
	DelMSPlayer(nMissionID,0);
	Msg2MSAll(nMissionID,"Rêi khái ®Ó l¹i tin nh¾n:"..sLeaveMsg);
	SubWorld = OldSubWorld;
end;

function enter_front_camp()
	local nCampPlace = BT_GetCamp()
	local tPos = {
			[SONG_ID] = {tFrontPointSong,tBackPointSong},
			[LIAO_ID] = {tFrontPointLiao,tBackPointLiao},
			}
	SubWorld = SubWorldID2Idx(MAPID);
	if GetGlbValue(RANDOM_PLACE) == 1 then
		nCampPlace = 3 - nCampPlace;
	end;
	local tRandPos = tPos[nCampPlace][1];
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		Talk(1,"","Th¸m tö ®· ®­îc cö ®i, c¸c vÞ xin nhÉn n¹i chê tin tøc!");
	else
		local nPosIndex = random(1,getn(tRandPos)); 
		SetPos(tRandPos[nPosIndex][1],tRandPos[nPosIndex][2]);
		BT_RestoreAll();
		BT_SetTempData(PTT_DIE_LOOP,0);
		SetFightState(1);
		CastState("state_dispear",0,INVINCIBILITY_TIME*18);
	end;
end;

function enter_back_camp()
	local nCampPlace = BT_GetCamp()
	local tPos = {
			[SONG_ID] = {tFrontPointSong,tBackPointSong},
			[LIAO_ID] = {tFrontPointLiao,tBackPointLiao},
			}
	SubWorld = SubWorldID2Idx(MAPID);
	if GetGlbValue(RANDOM_PLACE) == 1 then
		nCampPlace = 3 - nCampPlace;
	end;
	local tRandPos = tPos[nCampPlace][2];
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		Talk(1,"","Th¸m tö ®· ®­îc cö ®i, c¸c vÞ xin nhÉn n¹i chê tin tøc!");
	else
		local nPosIndex = random(1,getn(tRandPos)); 
		SetPos(tRandPos[nPosIndex][1],tRandPos[nPosIndex][2]);
		BT_RestoreAll();
		BT_SetTempData(PTT_DIE_LOOP,0);
		SetFightState(1);
		CastState("state_dispear",0,INVINCIBILITY_TIME*18);
	end;
end;

function nothing()

end;
