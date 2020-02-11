Include("\\settings\\static_script\\kf_newbattles\\emplacementbattle\\emplacementbattle_head.lua");
function main()
	local nCampPlace = BT_GetCamp()
	local tPos = {
			[SONG_ID] = {tFrontPointSong,tBackPointSong},
			[LIAO_ID] = {tFrontPointLiao,tBackPointLiao},
			}
	SubWorld = SubWorldID2Idx(MAPID);
	if GetGlbValue(RANDOM_PLACE) == 1 then
		nCampPlace = 3 - nCampPlace;
	end;
	local tRandPos = tPos[nCampPlace][random(1,2)];
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		SetPos(ENTRANCE_POINT[nCampPlace][2],ENTRANCE_POINT[nCampPlace][3])
		Talk(1,"","Th¸m tö ®· ®­îc cö ®i, c¸c vÞ xin nhÉn n¹i chê tin tøc!");
	else
		local nPosIndex = random(1,getn(tRandPos)); 
		SetPos(tRandPos[nPosIndex][1],tRandPos[nPosIndex][2]);
		BT_RestoreAll();
		BT_SetTempData(PTT_DIE_LOOP,0);
		SetFightState(1);
	end;
end;