Include("\\script\\newbattles\\resourcebattle\\resourcebattle_head.lua");
function main()
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_COMPLETE then
		Say("Cã b¶o vËt g× cho ta kh«ng?",0);
		return 0;
	end;
	local nCamp = BT_GetCamp();
	local nChangeLeft = GetMissionV(MV_CHANGEDRUMLEFT_SONG+nCamp-1);
	local selTab = {
			"§æi s¬n tÆc-binh kú (Tèn 1 viªn HuyÒn thiÕt Kho¸ng Th¹ch)/get_flag",
			"§æi s¬n tÆc-chiÕn cæ (Tèn 2 viªn HuyÒn thiÕt Kho¸ng Th¹ch, cßn ®æi ®­îc"..nChangeLeft..")/get_drum",
			"Nh©n tiÖn ghÐ qua th«i!/nothing",
			}
	Say("Cã chuyÖn g× nãi mau, kh«ng th× cót khái ®©y!",getn(selTab),selTab);
end;

function get_flag()
	local nCamp = BT_GetCamp();
	local nStoneCount = GetMissionV(MV_STONE_COUNT_SONG+nCamp-1);
	if DelItem(tBattleItem[6][2],tBattleItem[6][3],tBattleItem[6][4],1) == 1 then
		AddItem(tBattleItem[7][2],tBattleItem[7][3],tBattleItem[7][4],1);
		Msg2Player("B¹n nhËn ®­îc 1 s¬n tÆc-binh kú");
		SetMissionV(MV_STONE_COUNT_SONG+nCamp-1,nStoneCount+1);
		BT_AddPersonalPoint(1*tBPEven[BP_RESOURCE_HAND_STONE_CH]);
		Add_Resource(nCamp,1*tBPEven[BP_RESOURCE_HAND_STONE_CH]);
	else
		Talk(1,"","To gan! D¸m g¹t ta, ng­¬i kh«ng mang viªn <color=yellow>HuyÒn thiÕt Kho¸ng Th¹ch<color> nµo hÕt.");
	end;
end;

function get_drum()
	local nCamp = BT_GetCamp();
	local nChangeLeft = GetMissionV(MV_CHANGEDRUMLEFT_SONG+nCamp-1);
	local nStoneCount = GetMissionV(MV_STONE_COUNT_SONG+nCamp-1);
	if nChangeLeft <= 0 then
		Talk(1,"","Th«ng c¶m! §· hÕt chiÕn cæ ®æi cho ng­¬i råi.");
		return 0;
	end;
	if DelItem(tBattleItem[6][2],tBattleItem[6][3],tBattleItem[6][4],2) == 1 then
		AddItem(tBattleItem[8][2],tBattleItem[8][3],tBattleItem[8][4],1);
		Msg2Player("B¹n nhËn ®­îc 1 s¬n tÆc-chiÕn cæ");
		SetMissionV(MV_CHANGEDRUMLEFT_SONG+nCamp-1,nChangeLeft-1);
		SetMissionV(MV_STONE_COUNT_SONG+nCamp-1,nStoneCount+2);
		BT_AddPersonalPoint(2*tBPEven[BP_RESOURCE_HAND_STONE_CH]);
		Add_Resource(nCamp,2*tBPEven[BP_RESOURCE_HAND_STONE_CH]);
	else
		Talk(1,"","To gan! D¸m g¹t ta, ng­¬i kh«ng mang viªn <color=yellow>HuyÒn thiÕt Kho¸ng Th¹ch<color> nµo hÕt.");
	end;
end;