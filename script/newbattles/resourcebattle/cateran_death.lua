Include("\\script\\newbattles\\resourcebattle\\resourcebattle_head.lua");
function OnDeath(nNpcIndex)
	local sNpcName = GetNpcName(nNpcIndex);
	if sNpcName == nil then
		WriteLog("[ChiÕn tr­êng b¸o lçi]: GetNpcName trong file gèc cateran_death.lua nhËn tªn NPC b¸o lçi");
		return 0;
	end;
	local nNpcCamp = get_npc_camp(sNpcName);
	SetNpcLifeTime(nNpcIndex,DEAD_BODY_TIME);
	DelGroupUnit(CATERAN_GROUP_SONG+nNpcCamp-1,nNpcIndex);
end;

function get_npc_camp(sNpcName)
	if sNpcName == "S¬n tÆc (Tèng)" then
		return SONG_ID;
	else
		return LIAO_ID;
	end; 
end;
