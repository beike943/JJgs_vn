Include("\\script\\newbattles\\mainbattle\\mainbattle_head.lua");
function main()
	local nCamp = BT_GetCamp()
	local nCampPlace = nCamp;
	if GetGlbValue(RANDOM_PLACE) == 1 then
		nCampPlace = 3 - nCampPlace;
	end;
	local nRandPos = random(1,getn(tFrontBornPlace));
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_FIGHT then
		if GetMissionV(MV_FRONT_TRAP_SONG+nCamp-1) == 1 then
			SetPos(tFrontBornPlace[nRandPos][1],tFrontBornPlace[nRandPos][2]);
			BT_RestoreAll();
			SetFightState(1);
			BT_SetTempData(PTT_DIE_LOOP,0);
		else
			SetPos(ENTRANCE_POINT[nCampPlace][2],ENTRANCE_POINT[nCampPlace][3]);
			Talk(1,"","TiÒn ph­¬ng ®ang giao tranh ¸c liÖt, chóng ta kh«ng thÓ tiÕn vµo qu©n doanh");
		end;
	else
		SetPos(ENTRANCE_POINT[nCampPlace][2],ENTRANCE_POINT[nCampPlace][3])
		Talk(1,"","Th¸m tö ®· ®­îc cö ®i, c¸c vÞ xin nhÉn n¹i ®îi tin tøc!!");
	end;
end;