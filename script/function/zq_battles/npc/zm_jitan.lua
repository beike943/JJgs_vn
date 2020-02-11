--¼ÀÌ³½Å±¾
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\function\\zq_battles\\zq_head.lua")

function main()
	local tSay = {
		"Vµo cöa ¶i ngÉu nhiªn/rand_join_copy",
		"\n T¹i h¹ chØ xem qua th«i/do_nothing",
	}
	Say("Cöa ¶i c¸ nh©n cã thÓ khiªu chiÕn, ng­êi ch¬i sö dông 1 Ma Th¹ch trªn TÕ §µn cã thÓ ®­îc ngÉu nhiªn chuyÓn ®Õn c¸c ®iÓm trËn nh·n kh¸c, tham gia ngÉu nhiªn c¸c trß ch¬i nhá. Mçi nh©n vËt mçi ngµy cã thÓ tham gia cöa ¶i nhá 8 lÇn.", getn(tSay), tSay);
end

function rand_join_copy()
	local nIndex = random(4);
	if nIndex == 1 then
		repair_real();
	elseif nIndex == 2 then
		demon_bet();
	elseif nIndex == 3 then
		restart_real();
	elseif nIndex == 4 then
		protect_real();
	end
end

function check_condition()
	local nMapId, nX, nY = GetWorldPos();
	if nMapId ~= ZQ_MAP_ID then
		return 0;
	end
	if gf_GetMyTaskBit(ZQ_BATTLE_TASK6, 10, 15) >= ZQ_JOIN_GAME_TIMES_MAX then
		Talk(1,"",format("Mçi ngµy mçi nh©n vËt cã thÓ tham gia %d lÇn cöa ¶i nhá.", ZQ_JOIN_GAME_TIMES_MAX))
		return 0;
	end
	if GetItemCount(2, 1, 30481) < 1 then
		Talk(1,"","Sè l­îng Ma Th¹ch trong hµnh trang kh«ng ®ñ");
		return 0;
	end
	if GetFreeItemRoom() < 2 then
		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
		return 0;
	end
	return 1;
end

function repair_real()
	if check_condition() == 1 then
		if DelItem(2, 1, 30481, 1) == 1 then
			ZQ_RecordPos();
			if ZQ_CreateCopyTrigger(1525) == 0 then
				print("UDERROR:ZQ_CreateCopyTrigger(1525)");
				return 0;
			end
			SetPos(1606,3308);
			--¸øÕ½¶·×´Ì¬
			SetFightState(1);
			gf_SetTaskBit(ZQ_BATTLE_TASK2, 31, 1, TASK_ACCESS_CODE_ZQBATTLE);
			gf_SetTaskBit(ZQ_BATTLE_TASK11, 17, 1, TASK_ACCESS_CODE_ZQBATTLE);
			gf_SetMyTaskBit(ZQ_BATTLE_TASK6, 10, 15, gf_GetMyTaskBit(ZQ_BATTLE_TASK6, 10, 15) + 1, TASK_ACCESS_CODE_ZQBATTLE);
			Talk(1,"","Tu söa phong Ên trËn linh, gióp c« ta t×m ®ñ nguyªn liÖu thÝch hîp trong thêi gian chØ ®Þnh (nguyªn liÖu r¬i r¶i r¸c xung quanh c¸c ®iÓm)");
		end
	end
end

function demon_bet()
	if check_condition() == 1 then
		if DelItem(2, 1, 30481, 1) == 1 then
			ZQ_RecordPos();
			if ZQ_CreateCopyTrigger(1526) == 0 then
				print("UDERROR:ZQ_CreateCopyTrigger(1526)");
				return 0;
			end
			SetPos(1922,3681);
			--¸øÕ½¶·×´Ì¬
			SetFightState(1);
			gf_SetTaskBit(ZQ_BATTLE_TASK2, 23, 1, TASK_ACCESS_CODE_ZQBATTLE);
			gf_SetTaskBit(ZQ_BATTLE_TASK11, 17, 1, TASK_ACCESS_CODE_ZQBATTLE);
			gf_SetMyTaskBit(ZQ_BATTLE_TASK6, 10, 15, gf_GetMyTaskBit(ZQ_BATTLE_TASK6, 10, 15) + 1, TASK_ACCESS_CODE_ZQBATTLE);
			Talk(1,"","Ch¬i o¼n tï t× víi Ma Hãa TrËn Linh, ch¬i th¾ng sÏ nhËn phÇn th­ëng tÝch lòy, kh«ng giíi h¹n sè lÇn o¼n tï t×, ch¬i thua sÏ bÞ träng th­¬ng trë vÒ trËn doanh.")
		end
	end
end

function restart_real()
	if check_condition() == 1 then
		if DelItem(2, 1, 30481, 1) == 1 then
			ZQ_RecordPos();
			if ZQ_CreateCopyTrigger(1527) == 0 then
				print("UDERROR:ZQ_CreateCopyTrigger(1527)");
				return 0;
			end
			SetPos(1576,3524);
			--¸øÕ½¶·×´Ì¬
			SetFightState(1);
			gf_SetTaskBit(ZQ_BATTLE_TASK2, 24, 1, TASK_ACCESS_CODE_ZQBATTLE);
			gf_SetTaskBit(ZQ_BATTLE_TASK11, 17, 1, TASK_ACCESS_CODE_ZQBATTLE);
			gf_SetMyTaskBit(ZQ_BATTLE_TASK6, 10, 15, gf_GetMyTaskBit(ZQ_BATTLE_TASK6, 10, 15) + 1, TASK_ACCESS_CODE_ZQBATTLE);
			Talk(1,"","Tæng céng cã 8 ®iÓm phong Ên trªn b¶n ®å, khëi ®éng 3 ®iÓm theo yªu cÇu, trªn ®iÓm phong Ên cã c¬ quan thñ vÖ, tö väng th× khëi ®éng thÊt b¹i")
		end
	end
end

function protect_real()
	if check_condition() == 1 then
		if DelItem(2, 1, 30481, 1) == 1 then
			ZQ_RecordPos();
			if ZQ_CreateCopyTrigger(1528) == 0 then
				print("UDERROR:ZQ_CreateCopyTrigger(1528)");
				return 0;
			end
			SetPos(1877,3498);
			--¸ø·ÇÕ½¶·×´Ì¬
			SetFightState(0);
			gf_SetTaskBit(ZQ_BATTLE_TASK2, 30, 1, TASK_ACCESS_CODE_ZQBATTLE);
			gf_SetTaskBit(ZQ_BATTLE_TASK11, 17, 1, TASK_ACCESS_CODE_ZQBATTLE);
			gf_SetMyTaskBit(ZQ_BATTLE_TASK6, 10, 15, gf_GetMyTaskBit(ZQ_BATTLE_TASK6, 10, 15) + 1, TASK_ACCESS_CODE_ZQBATTLE);
			Talk(1,"","Tiªu diÖt qu¸i trong thêi gian chØ ®Þnh, tiªu diÖt cµng nhiÒu, phÇn th­ëng cµng cao");
		end
	end
end

function do_nothing()
end
