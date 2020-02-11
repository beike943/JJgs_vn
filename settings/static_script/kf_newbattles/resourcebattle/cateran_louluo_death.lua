Include("\\settings\\static_script\\kf_newbattles\\resourcebattle\\resourcebattle_head.lua");
function OnDeath(nNpcIndex)
	local sNpcName = GetNpcName(nNpcIndex);
	if sNpcName == nil then
		WriteLog("[ChiÕn tr­êng b¸o lçi]: GetNpcName trong file gèc cateran_death.lua nhËn tªn NPC b¸o lçi");
		return 0;
	end;
	local nPlayerCamp = BT_GetCamp();
	local nEnemyCamp = 3 - nPlayerCamp;
	local nNpcCamp = get_npc_camp(sNpcName);
	if nPlayerCamp == nNpcCamp then
		if nPlayerCamp == SONG_ID then
			Msg2MSAll(MISSION_ID,"Tèng"..GetName().." lì tay giÕt chÕt s¬n tÆc l©u la, phe Liªu nh©n c¬ héi thu håi 15 bao l­¬ng th¶o")
		else
			Msg2MSAll(MISSION_ID,"Liªu"..GetName().." lì tay giÕt chÕt s¬n tÆc l©u la, phe Tèng nh©n c¬ héi thu håi 15 bao l­¬ng th¶o")
		end;
		Add_Resource(nEnemyCamp,15);
		Dec_Resource(nPlayerCamp,15);
	else
		Add_Resource(nPlayerCamp,15);
		Dec_Resource(nEnemyCamp,15);
		if nPlayerCamp == SONG_ID then
			Msg2MSAll(MISSION_ID,"Tèng"..GetName().."T×m S¬n tÆc l©u la ®o¹t vÒ 15 bao l­¬ng th¶o");
		else
			Msg2MSAll(MISSION_ID,"Liªu"..GetName().."T×m S¬n tÆc l©u la ®o¹t vÒ 15 bao l­¬ng th¶o");
		end;
	end;
	SetNpcLifeTime(nNpcIndex,DEAD_BODY_TIME);
end;

function get_npc_camp(sNpcName)
	if sNpcName == "S¬n tÆc l©u la (Tèng)" then
		return SONG_ID;
	else
		return LIAO_ID;
	end; 
end;