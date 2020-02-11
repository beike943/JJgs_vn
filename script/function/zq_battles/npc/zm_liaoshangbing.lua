Include("\\script\\function\\zq_battles\\zq_head.lua")

NPC_SONG_NAME = "<color=green>Liªu th­¬ng binh:<color>"

function main()
	if ZQ_JugdeCamp(SONG_ID) == 1 then
		return 0;
	end
	local tTalk = {
		"Ta kh¸t qu¸, ta muèn uèng n­íc, ta muèn uèng n­íc.",
		"MÑ ¬i, con lµ con cña mÑ mµ, mÑ ¬i ®õng bá con, ®õng bá con !",
		"Ta chÝnh lµ phËt tæ chuyÓn thÕ, tªn phµm nh©n nh­ ng­¬i gÆp ta sao kh«ng mau quú xuèng.",
		"ChÕt råi, chÕt hÕt råi, ta còng s¾p chÕt råi, chÕt råi.....",
		"Ta ph¶i giÕt hÕt c¸c ng­¬i, h·y mau chÕt ®i, giªt, giÕt.....giÕt........",
	}
	Talk(1,"task_deal",NPC_SONG_NAME..tTalk[mod(GetTargetNpc() or 0, getn(tTalk)) + 1]);
end

function task_deal()
	if tGtTask:check_cur_task(128) == 1 then
		if GetItemCount(2,0,30062) < 1 then
			Talk(1,"","Kh«ng cã thuèc trÞ liÖu:".."S¸t khÝ ®¬n");
			return 0;
		end
		local nCount = GetTask(ZQ_CURE_LIAO);
		if nCount < ZQ_CURE_LIAO_MAX_COUNT then
			if random(100) > 50 then			
				SetTask(ZQ_CURE_LIAO, nCount + 1);
				if ZQ_CURE_LIAO_MAX_COUNT == nCount + 1 then
					Msg2Player(format("TrÞ liÖu th­¬ng binh %d/%d", nCount + 1, ZQ_CURE_LIAO_MAX_COUNT).."(Hoµn thµnh)");
				else
					Msg2Player(format("TrÞ liÖu th­¬ng binh %d/%d", nCount + 1, ZQ_CURE_LIAO_MAX_COUNT));
				end
				Talk(1,"",NPC_SONG_NAME.."Tèt qu¸, søc m¹nh cña ta ®· ®­îc håi phôc.")
			else
--				local nNpcIndex = GetTargetNpc();
--				ChangeNpcToFight(nNpcIndex, 10, 1);
--				SetNpcDeathScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_liaoshangbing.lua");
--				SetNpcRemoveScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_liaoshangbing.lua");
--				SetNpcLifeTime(nNpcIndex, 10 * 60);
				Talk(1,"fail_punish",NPC_SONG_NAME.."Wa hahaha, A hahaha, giÕt, giÕt s¹ch, giÕt hÕt……");
			end
		end
	end
end

function fail_punish()
		CastState("state_fetter", 100, 18*10);
		local npcIndex = CreateNpc("ZM_mohualiaobing", "Ma Hãa Liªu Binh", GetWorldPos());
		SetNpcLifeTime(npcIndex, 6 * 60);
end

--function OnDeath(NpcIdx)
--	local nMapID, nX, nY;
--	if NpcIdx then
--		nMapID, nX, nY = GetNpcWorldPos(NpcIdx);
--		local nNpcIndex = CreateNpc("ZM_liaoshangbing", "ÁÉ¾üÉË±ø", ZQ_MAP_ID, nX, nY);
--		SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_liaoshangbing.lua");
--	end
--	SetNpcLifeTime(NpcIdx, 0);
--end

--function OnRemove(NpcIdx)
----	local nMapID, nX, nY;
----	if NpcIdx then
----		nMapID, nX, nY = GetNpcWorldPos(NpcIdx);
----		local nNpcIndex = CreateNpc("ZM_liaoshangbing", "ÁÉ¾üÉË±ø", ZQ_MAP_ID, nX, nY);
----		SetNpcScript(nNpcIndex, "\\script\\function\\zq_battles\\npc\\zm_liaoshangbing.lua");
----	end
--end