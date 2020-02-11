Include("\\script\\newbattles\\resourcebattle\\resourcebattle_head.lua");

function OnUse()
	local nMapID,nMapX,nMapY = GetWorldPos();
	if nMapID ~= MAPID then
		Msg2Player("S¬n tÆc-binh kú chØ dïng ®­îc trong ChiÕn tr­êng Th¶o cèc.");
		return 0;
	end;
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT or GetFightState() == 0 then
		Msg2Player("T¹m thêi kh«ng dïng ®­îc s¬n tÆc-binh kú.");
		return 0;
	end;
	if check_place() == 1 then
		if DelItem(tBattleItem[7][2],tBattleItem[7][3],tBattleItem[7][4],1) == 1 then
			local nCamp = BT_GetCamp();
			local nEnemyCamp = 3 - nCamp;
			local nNpcIndex = CreateNpc("S¬n tÆc l©u la","S¬n tÆc l©u la ("..tCampNameZ[nCamp]..")",GetWorldPos())
			SetNpcDeathScript(nNpcIndex,"\\script\\newbattles\\resourcebattle\\cateran_louluo_death.lua");
			SetNpcLifeTime(nNpcIndex,15);
			Dec_Resource(nEnemyCamp,15);	--¿Û¶Ô·½µÄÁ¸²Ý
			Add_Resource(nCamp,15);	--Ôö¼Ó±¾·½Á¸²Ý
			if nCamp == SONG_ID then
				Msg2MSAll(MISSION_ID,"Ng­êi ch¬i phe Tèng: "..GetName().." dïng s¬n tÆc binh kú gäi ra mét s¬n tÆc l©u la, nh©n c¬ héi phe Liªu kh«ng chó ý lÊy ®i 15 bao l­¬ng th¶o");
			else
				Msg2MSAll(MISSION_ID,"Ng­êi ch¬i phe Liªu: "..GetName().." dïng s¬n tÆc binh kú gäi ra mét s¬n tÆc l©u la, nh©n c¬ héi phe Tèng kh«ng chó ý lÊy ®i 15 bao l­¬ng th¶o");
			end;
		end;
	else
		Msg2Player("Khu vùc hiÖn t¹i kh«ng dïng ®­îc s¬n tÆc-binh kú!");
	end;
end;

function check_place()
	return 1;
end;                      