--Ê¥»ð´«µÝ»î¶¯ÖúÍþÀ®°È
--by vivi
--2008/06/04

Include("\\script\\online\\aoyun08\\aoyun_head.lua")
Include("\\script\\lib\\lingshi_head.lua")

function OnUse()
	if GetTask(547) ~= 0 and GetTask(TASK_AOYUN_ZHUWEI_NUM) ~= 0 then
		if GetGlbValue(GLB_AOYUN_TIME_STATE) == 0 then
			Talk(1,"","<color=green>Loa cæ vò<color>: Ho¹t ®éng ®· kÕt thóc.");
			return
		end
		local nZwNum = GetTask(TASK_AOYUN_ZHUWEI_NUM);
		if GetGlbValue(GLB_AOYUN_HUOJUTAI_NUM) >= nZwNum then
			Say("<color=green>Loa cæ vò<color>: Muèn ph¸t lêi chóc nµo?",
				4,
				"Chóc ®¹i héi thµnh c«ng tèt ®Ñp!/#aoyun_zhuwei(1)",
				"Chóc Vâ L©m ngµy cµng ph¸t triÓn!/#aoyun_zhuwei(2)",
				"Th¸nh Háa m·i bÊt diÖt!/#aoyun_zhuwei(3)",
				"§Ó ph¸t sau/nothing")
		else
			Talk(1,"","<color=green>Loa cæ vò<color>: §uèc vÉn ch­a chuyÓn ®Õn ®©y.")
		end
	else
		Talk(1,"","<color=green>Loa cæ vò<color>: B¹n kh«ng ph¶i ng­êi cæ vò.")
	end
end

function aoyun_zhuwei(nType)
	if GetTask(TASK_AOYUN_USE_LABA) ~= 0 then
		Talk(1,"","<color=green>Loa cæ vò<color>: Mçi ng­êi chØ dïng 1 lÇn Loa cæ vò.");
		return
	end
	if DelItem(2,1,3378,1) == 1 then
		local nIdx = PIdx2NpcIdx(PlayerIndex);
		local nLv = GetLevel();
		local nExp = floor((nLv^3)*8);
		if nType == 1 then
			NpcChat(nIdx,"Chóc ®¹i héi thµnh c«ng tèt ®Ñp!");
		elseif nType == 2 then
			NpcChat(nIdx,"Chóc Vâ L©m ngµy cµng ph¸t triÓn!");
		else
			NpcChat(nIdx,"Th¸nh Háa m·i bÊt diÖt!");
		end
		if nLv ~= 99 then
			SetTask(TASK_AOYUN_USE_LABA,1);
			ModifyExp(nExp);
			Msg2Player("Chóc mõng b¹n nhËn ®­îc "..nExp.."Kinh nghiÖm");
			local nRand = random(1,100); 
			if nRand <= 40 then	    --×¢Òâ£¬ÊÕ·ÑÇøÖ»ÓÐÕâÖÖ¶«¶«
				AddItem(2,1,1012,1);
			elseif nRand <= 80 then
				AddItem(2,0,109,1);
			else
				AddItem(2,1,1013,1);
			end
		else
			SetTask(TASK_AOYUN_USE_LABA,1);
			local nRand = random(1,100);
			if nRand <= 80 then
				lspf_AddLingShiInBottle(6,1);
				Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Linh th¹ch cÊp 6, ®· bá vµo trong Tô Linh ®Ønh.");
			else
				lspf_AddLingShiInBottle(7,1);
				Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Linh th¹ch cÊp 7, ®· bá vµo trong Tô Linh ®Ønh.");									
			end 
		end
	end
end