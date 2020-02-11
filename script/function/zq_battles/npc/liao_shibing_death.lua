Include("\\script\\function\\zq_battles\\zq_define.lua")
Include("\\script\\function\\zq_battles\\zq_head.lua")

function OnDeath(id, f, x)
	SetNpcLifeTime(id, 0);
	local nNpcIndex = CreateNpc("ZM_liaoshibing", "Liªu SÜ Binh", GetNpcWorldPos(id));
	SetNpcDeathScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\liao_shibing_death.lua");
	SetCampToNpc(nNpcIndex, ZQ_tCampString[LIAO_ID]);
	if f and f ~= 0 then
		return 0;
	end
	if tGtTask:check_cur_task(112) == 1 then
		if GetTask(ZQ_KILL_PLAYER_SONG) < ZQ_KILL_PLAYER_SONG_MAX_COUNT then
			SetTask(ZQ_KILL_PLAYER_SONG, GetTask(ZQ_KILL_PLAYER_SONG) + 1);
			Msg2Player(format("Tiªu diÖt %d/%d ®Þch qu©n phe Liªu hoÆc qu©n sÜ binh Liªu", GetTask(ZQ_KILL_PLAYER_SONG), ZQ_KILL_PLAYER_SONG_MAX_COUNT));
		end
	end
end