Include("\\script\\function\\zq_battles\\zq_head.lua")

NPC_SONG_NAME = "<color=green>Tèng th­¬ng binh: <color>"

function main()
	if ZQ_JugdeCamp(LIAO_ID) == 1 then
		return 0;
	end
	local tTalk = {
		"§Çu cña ta ®au qu¸, ®au qu¸!!!",
		"Ai ®ang ca h¸t trong ®Çu ta, lµ ai?! Lµ ng­¬i sao. ®õng h¸t n÷a, ta nãi ®õng h¸t n÷a!!!! AAAAA",
		"Ta chÝnh lµ ®¹i t­íng qu©n, ta lµ ®¹i t­íng quan, haha, cuèi cïng ta ®· trë thµnh ®¹i t­íng qu©n.",
		"L¹nh qu¸, l¹nh qu¸, cã thÓ mang cho ta 1 chiªc ¸o Êm kh«ng?",
		"Mang ®ao ®Õn cho ta, h·y mang ®ao ®Õn cho ta, ta sÏ kh«ng giÕt ng­¬i, ta sÏ kh«ng giÕt ng­¬i ®©u, hahaha.",
	}
	Talk(1,"task_deal",NPC_SONG_NAME..tTalk[mod(GetTargetNpc() or 0, getn(tTalk)) + 1]);
end

function task_deal()
	if tGtTask:check_cur_task(124) == 1 then
		if GetItemCount(2,0,30061) < 1 then
			Talk(1,"","Kh«ng cã thuèc trÞ liÖu:".."Thanh T©m t¸n");
			return 0;
		end
		local nCount = GetTask(ZQ_CURE_SONG);
		if nCount < ZQ_CURE_SONG_MAX_COUNT then
			if random(100) > 50 then
				SetTask(ZQ_CURE_SONG, nCount + 1);
				if ZQ_CURE_SONG_MAX_COUNT == nCount + 1 then
					Msg2Player(format("TrÞ liÖu th­¬ng binh %d/%d", nCount + 1, ZQ_CURE_SONG_MAX_COUNT).."(Hoµn thµnh)");
				else
					Msg2Player(format("TrÞ liÖu th­¬ng binh %d/%d", nCount + 1, ZQ_CURE_SONG_MAX_COUNT));
				end
				Talk(1,"",NPC_SONG_NAME.."§a t¹, ta c¶m thÊy kháe h¬n råi.");
			else
--				local nNpcIndex = GetTargetNpc();
--				ChangeNpcToFight(nNpcIndex, 10, 1);
--				SetNpcDeathScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_songshangbing.lua");
--				SetNpcRemoveScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_songshangbing.lua");
--				SetNpcLifeTime(nNpcIndex, 10 * 60);
				Talk(1,"fail_punish",NPC_SONG_NAME.."Ng­¬i kh«ng cho ta ¨n, ¬, kh«ng……");
			end
		end
	end
end

function fail_punish()
		CastState("state_fetter", 100, 18*10);
		local npcIndex = CreateNpc("ZM_mohuasongbing", "Ma Hãa Tèng Binh", GetWorldPos());
		SetNpcLifeTime(npcIndex, 6 * 60);
end

--function OnDeath(NpcIdx)
--	local nMapID, nX, nY;
--	if NpcIdx then
--		nMapID, nX, nY = GetNpcWorldPos(NpcIdx);
--		local nNpcIndex = CreateNpc("ZM_songshangbing", "ËÎ¾üÉË±ø", ZQ_MAP_ID, nX, nY);
--		SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_songshangbing.lua");
--	end
--	SetNpcLifeTime(NpcIdx, 0);
--end

--function OnRemove(NpcIdx)
----	local nMapID, nX, nY;
----	if NpcIdx then
----		nMapID, nX, nY = GetNpcWorldPos(NpcIdx);
----		local nNpcIndex = CreateNpc("ZM_songshangbing", "ËÎ¾üÉË±ø", ZQ_MAP_ID, nX, nY);
----		SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_songshangbing.lua");
----	end
--end