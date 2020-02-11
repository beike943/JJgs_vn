Include("\\script\\function\\zq_battles\\zq_define.lua")
Include("\\script\\function\\zq_battles\\zq_head.lua")

function OnDeath(id, f, x)
	SetNpcLifeTime(id, 0);
	local nNpcIndex = CreateNpc("ZM_songshibing", "Tèng SÜ Binh", GetNpcWorldPos(id));
	SetNpcDeathScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\song_shibing_death.lua");
	SetCampToNpc(nNpcIndex, ZQ_tCampString[SONG_ID]);
	if f and f ~= 0 then
		return 0;
	end
	if tGtTask:check_cur_task(117) == 1 then		
		if GetTask(ZQ_KILL_PLAYER_LIAO) < ZQ_KILL_PLAYER_LIAO_MAX_COUNT then
			SetTask(ZQ_KILL_PLAYER_LIAO, GetTask(ZQ_KILL_PLAYER_LIAO) + 1);
			Msg2Player(format("Tiªu diÖt %d/%d ®Þch qu©n phe Tèng hoÆc qu©n sÜ binh Tèng", GetTask(ZQ_KILL_PLAYER_LIAO), ZQ_KILL_PLAYER_LIAO_MAX_COUNT));
		end
	end
end