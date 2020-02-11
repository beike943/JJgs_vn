Include("\\settings\\static_script\\kf_newbattles\\villagebattle\\villagebattle_head.lua");
function main()
	local nCampPlace = BT_GetCamp()
	SubWorld = SubWorldID2Idx(MAPID);
	if GetGlbValue(RANDOM_PLACE) == 1 then
		nCampPlace = 3 - nCampPlace;
	end;
	local tPos = {
			[SONG_ID] = {1588,3546},
			[LIAO_ID] = {1752,3209},
			}
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		SetPos(ENTRANCE_POINT[nCampPlace][2],ENTRANCE_POINT[nCampPlace][3])
		Talk(1,"","Th¸m tö ®· ®­îc cö ®i, c¸c vÞ xin nhÉn n¹i ®îi tin tøc!!");
	else
		SetPos(tPos[nCampPlace][1],tPos[nCampPlace][2])
		BT_RestoreAll();
		BT_SetTempData(PTT_DIE_LOOP,0);
		SetFightState(1);
	end;
end;