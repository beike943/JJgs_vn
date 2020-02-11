Include("\\script\\newbattles\\villagebattle\\villagebattle_head.lua");

function main()
	if random(1,100) == 1 then
		NpcChat(GetTargetNpc(),"Th«n trang qu¸ lín ®Ó t×m thñ lÜnh trî gióp chóng ta lµ ®iÒu kh«ng dÔ, mäi ng­êi cÇn ®ång t©m hiÖp lùc!");
	end;
	local selTab = {
				"Vµo chiÕn tr­êng/enter_battle",
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

function enter_battle()
	local nCampPlace = BT_GetCamp()
	local tPos = {
			[SONG_ID] = tSongBornPos,
			[LIAO_ID] = tLiaoBornPos,
			}
	if GetGlbValue(RANDOM_PLACE) == 1 then
		nCampPlace = 3 - nCampPlace;
	end;
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		Talk(1,"","Th¸m tö ®· ®­îc cö ®i, c¸c vÞ xin nhÉn n¹i ®îi tin tøc!.");
	else
		local nRandPos = random(1,getn(tPos[nCampPlace]));
		SetPos(tPos[nCampPlace][nRandPos][1],tPos[nCampPlace][nRandPos][2])
		BT_SetTempData(PTT_DIE_LOOP,0);
		SetFightState(1);
		BT_RestoreAll();
		CastState("state_dispear",0,INVINCIBILITY_TIME*18);
	end;
end;

function nothing()

end;
