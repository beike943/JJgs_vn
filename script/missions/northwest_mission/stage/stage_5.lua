--½Å±¾Ãû³Æ£ºÎåĞĞÕó¹Ø¿¨½Å±¾
--½Å±¾¹¦ÄÜ£ºÎ÷±±Çø¹Ø¿¨µÚÎå¹ØÎåĞĞÕóÏà¹Ø½Å±¾
--²ß»®ÈË£º³Â¹«×Ó
--´úÂë¿ª·¢ÈË£º´å³¤
--´úÂë¿ª·¢Ê±¼ä£º2007-11-26
--ÎåĞĞÕó×ø±ê¶¨Òå¼°ÏàÉú¡¢Ïà¿Ë¹ØÏµ
MS_boss_index = 10
MS_boss_index_gold = 11
MS_boss_index_water = 12
MS_boss_index_wood = 13
MS_boss_index_fire = 14
MS_boss_index_soil = 15
Ms_element_start_seq = 16
Ms_element_gold_seq = 17
Ms_stage5_loop_num = 18
Ms_boss_crt_state = 20
Ms_boss_crt_seq_1st = 21
Ms_boss_crt_seq_2nd = 22
Ms_boss_crt_seq_3rd = 23
Ms_boss_crt_seq_4th = 24
Ms_boss_crt_seq_5th = 25
Ms_element_killed_num = 26
Tb_Ms_effect_index = {31,32,33,34,35}
Tb_effect_id = {955,956,957,958,959}
--npcĞÅÏ¢
	Tb_5_element_coordinate = {
	--ÖĞĞÄx×ø±ê-ÖĞĞÄY×ø±ê-ÏàÉúĞĞ-Ïà¿ËĞĞ-NPCÄ£°å-NPCÃû³Æ-Ë÷Òı´æ·ÅÎ»ÖÃ-Ğ¡¹ÖÄ£°åÃû-Ğ¡¹ÖnpcÃû
	{1613,3204,2,3,"¶i Ngò Hµnh Kim Sø","Kim sø",MS_boss_index_gold,		"Kim Kú Sø",	"Kim Kú Sø"},		--½ğ
	{1626,3230,3,4,"¶i Ngò Hµnh Thñy Sø","Thñy sø",MS_boss_index_water,	"Thñy Kú Sø",	"Thñy Kú Sø"},		--Ë®
	{1602,3258,4,5,"¶i Ngò Hµnh Méc Sø","Méc sø",MS_boss_index_wood,	"Méc Kú Sø",	"Méc Kú Sø"},		--Ä¾
	{1577,3230,5,1,"¶i Ngò Hµnh Háa Sø","Háa sø",MS_boss_index_fire,		"Háa Kú Sø",	"Háa Kú Sø"},		--»ğ
	{1592,3202,1,2,"¶i Ngò Hµnh Thæ Sø","Thæ sø",MS_boss_index_soil,		"Thæ Kú Sø",	"Thæ Kú Sø"},		--ÍÁ
}
	--npcº°»°ÄÚÈİ
stage5_npc_chat_alive = {
	"Cho ng­¬i biÕt thÕ nµo lµ trËn ph¸p m¹nh nhÊt! Ngò Hµnh Lu©n Håi-Sinh!",
	"HËu qu¶ xem th­êng Ngò Hµnh TrËn! Ngò Hµnh Lu©n Håi-Sinh!",
	"Nçi sî h·i ®ang bao trïm lªn c¸c ng­¬i! Ngò Hµnh Lu©n Håi-Sinh!",
	"H÷u dòng v« m­u, thËt ®¸ng tiÕc! Ngò Hµnh Lu©n Håi-Sinh!",
}
stage5_npc_chat_death = {
	"Cho ng­¬i biÕt thÕ nµo lµ trËn ph¸p m¹nh nhÊt! Ngò Hµnh Lu©n Håi-Kh¾c!",
	"HËu qu¶ xem th­êng Ngò Hµnh TrËn! Ngò Hµnh Lu©n Håi-Kh¾c!",
	"Nçi sî h·i ®ang bao trïm lªn c¸c ng­¬i! Ngò Hµnh Lu©n Håi-Kh¾c!",
	"H÷u dòng v« m­u, thËt ®¸ng tiÕc! Ngò Hµnh Lu©n Håi-Kh¾c!?",
}
--ÎåĞĞÉúÊ±bossÔö¼ÓµÄÑªÁ¿£¨°Ù·Ö±È£©
Boss_life_reduce_percent = 30
--ÎåĞĞ¿ËÊ±Íæ¼Ò¼õÉÙµÄÑªÁ¿£¨°Ù·Ö±È£©
Player_life_reduce_percent = 50
--Ã¿Ê®Ãë´´½¨µÄĞ¡¹ÖÊıÁ¿
Devilkin_crt_num_per10s = 1
--µÚÎå¹ØµÄÊ±¼ä´¥·¢º¯Êı
--ÒòÎªĞèÒª¶Ôtime_loop_num½øĞĞ¸ú×Ù£¬ËùÒÔµ¥¶À´¦Àí
function stage5_timmer_fun()
	local time_loop_num = GetMissionV(MS_TIMMER_LOOP_ID)
	if mod((186 - time_loop_num),30) == 0  and time_loop_num >= 66 then
		if GetMissionV(Ms_boss_crt_state) <= (floor((186 - time_loop_num)/30))  then
			element_crt()
		end
	end
	local loop_num_now = (GetMissionV(Ms_stage5_loop_num)+1)
	if loop_num_now == 3 then
		--ÎåĞĞ×ª»»
		element_seq_chg()
	else
		if mod(loop_num_now,12) == 6 then	--ÎåĞĞÂÖ»Ø£ºÉú
			element_alive()
		elseif mod(loop_num_now,12) == 0 then --ÎåĞĞÂÖ»Ø£º¿Ë
			element_death()
		end
	end
	SetMissionV(Ms_stage5_loop_num,loop_num_now)
	if mod(loop_num_now,2) == 0 then
		element_devilkin_crt()
	end
end
--boss´´½¨º¯Êı
--±¾½×¶Î´´½¨µÄÎª¶Ô»°boss
function stage5_boss_create()
	--boss´´½¨
	local map_id =  SubWorldIdx2ID(SubWorld)
	local boss_index = 0
	for i = 1,getn(Tb_5_element_coordinate) do
		boss_index = CreateNpc(Tb_5_element_coordinate[i][5],Tb_5_element_coordinate[i][6],map_id,Tb_5_element_coordinate[i][1],Tb_5_element_coordinate[i][2],6)
		AddUnitStates(boss_index,7,0)
		SetNpcScript(boss_index,Main_Npc_Script_way)
		SetMissionV((10+i),boss_index)
		boss_index = CreateNpc("Ngò Hµnh TrËn Ên"," ",map_id,Tb_5_element_coordinate[i][1],Tb_5_element_coordinate[i][2])
		SetMissionV(Tb_Ms_effect_index[i],boss_index)
		SetCurrentNpcSFX(boss_index,Tb_effect_id[i],2,1)
	end
	--µÚÎå¹Øloop_num³õÊ¼»¯
	--SetMissionV(Ms_stage5_loop_num,0)
	--Ê±¼ä½ø¶ÈÌõÏÔÊ¾
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"¶i b¾t ®Çu cßn\",30,0,2)")
end
--¹Ø¿¨ÕıÊ½¿ªÊ¼
function stage5_start()
	--¼¤»îË³Ğò¿ªÆô
	local tb_element_seq = {1,2,3,4,5}
	local ran_seq = 0
	for i = getn(tb_element_seq),1,-1 do
		ran_seq = random(1,i)
		SetMissionV((20+i),tb_element_seq[ran_seq])
		tb_element_seq[ran_seq] = tb_element_seq[i]
	end
	--½«npc½øĞĞ¶ÔÓ¦µÄ´¦Àí
	for i = 1,getn(Tb_5_element_coordinate) do
		if i == GetMissionV(21) then
			ChangeNpcToFight(GetMissionV(10+i))
		else
			SetNpcLifeTime(GetMissionV(10+i),0)
			SetMissionV((10+i),0)
		end
	end
	SetMissionV(Ms_boss_crt_state,1)
	--ÎåĞĞ³õÊ¼Î»ÖÃÉèÖÃ
	SetMissionV(Ms_element_gold_seq,random(0,4))
	--Ê±¼ä½ø¶ÈÌõÏÔÊ¾
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"KÕt thóc v­ît ¶i cßn\",1800,0,1)")
end
--ÎåĞĞ·½Î»±ä»¯º¯Êı
function element_seq_chg()
	SetMissionV(Ms_element_gold_seq,(mod( (GetMissionV( Ms_element_gold_seq ) +1 ),5)))
	--ÌØĞ§Ğı×ª
	local effect_index = 0
	local golden_element_seq = GetMissionV(Ms_element_gold_seq)
	local effect_id = 0
	for i = 1,getn(Tb_Ms_effect_index) do
		effect_id = mod((i +golden_element_seq),5)
		if effect_id == 0 then
			effect_id = 5
		end
		SetCurrentNpcSFX(GetMissionV(30 + effect_id),Tb_effect_id[i],2,1)
	end
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Ngò Hµnh Lu©n Håi: Sinh\",30,0,2)")
end
--ÎåĞĞÂÖ»ØÏàÉú´¦Àí
function element_alive()
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Ngò Hµnh Lu©n Håi: Kh¾c\",60,0,2)")
	local element_index = 0
	--×èÖ¹ÎåĞĞÂÖ»Ø·¢ÉúµÄÍæ¼ÒË÷Òı
	local stop_player_index = 0
	for i = MS_boss_index_gold,MS_boss_index_soil do
		element_index = GetMissionV(i)
		if element_index  ~= 0 and element_index ~= nil then
			NpcChat(element_index,stage5_npc_chat_alive[random(1,getn(stage5_npc_chat_alive))])
			stop_player_index = player_5_element_doa_chk((i-10),3) 
			if stop_player_index == 0 then
				Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"Ngò Hµnh Lu©n Håi t­¬ng 'Sinh' kİch ho¹t, t¨ng sinh lùc tÊt c¶ Sø gi¶ ngò hµnh"..Player_life_reduce_percent.."%£¡\")")
				element_alive_deal()
			else
				Zgc_pub_mission_fun(MS_ID,"Msg2Player(\""..GetName(stop_player_index).."Thµnh c«ng c¶n trë Ngò Hµnh Lu©n Håi t­¬ng sinh kİch ho¹t!\")")
			end
		end
	end
end
--ÎåĞĞÂÖ»ØÏà¿Ë´¦Àí
function element_death()
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Ngò Hµnh Lu©n Håi: Sinh\",60,0,2)")
	local element_index = 0
	--×èÖ¹ÎåĞĞÂÖ»Ø·¢ÉúµÄÍæ¼ÒË÷Òı
	local stop_player_index = 0
	for i = MS_boss_index_gold,MS_boss_index_soil do
		element_index = GetMissionV(i)
		if element_index  ~= 0 and element_index ~= nil then
			NpcChat(element_index,stage5_npc_chat_death[random(1,getn(stage5_npc_chat_death))])
			stop_player_index = player_5_element_doa_chk((i-10),4) 
			if stop_player_index == 0 then
				Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"Ngò Hµnh Lu©n Håi t­¬ng 'Kh¾c' kİch ho¹t, gi¶m sinh lùc tÊt c¶ ng­êi ch¬i"..Boss_life_reduce_percent.."%£¡\")")
				element_death_deal()
			else
				Zgc_pub_mission_fun(MS_ID,"Msg2Player(\""..GetName(stop_player_index).."Thµnh c«ng c¶n trë Ngò Hµnh Lu©n Håi t­¬ng kh¾c kİch ho¹t!\")")
			end
		end
	end	
end
--Ğ¡¹Ö´´½¨º¯Êı
function element_devilkin_crt()
	local map_id = SubWorldIdx2ID(SubWorld)
	local npc_index,npc_num,npc_index_total = 0,0,{}  
	local golden_element_seq = GetMissionV(Ms_element_gold_seq)
	local crt_npc_seq = 0
	for i = 1,getn(Tb_5_element_coordinate) do
		crt_npc_seq = mod((i+golden_element_seq),5)
		if crt_npc_seq == 0 then
			crt_npc_seq = 5 
		end
		if stage_devil_restrict() ~= 0 then
			npc_index = CreateNpc(Tb_5_element_coordinate[i][8],Tb_5_element_coordinate[i][9],map_id,(Tb_5_element_coordinate[crt_npc_seq][1] + random(-2,2)),Tb_5_element_coordinate[crt_npc_seq][2]+ random(-2,2))
			SetNpcScript(npc_index,Main_Npc_Script_way)
		end
	end
end
--Íæ¼ÒÎåĞĞÕóÖĞÕ¾Î»¼ì²â
--´«Èë²ÎÊı£ºdoa_flagÏàÉúÎª3£¬Ïà¿ËÎª4
function player_5_element_doa_chk(element_seq,doa_flag)
	local map_id = SubWorldIdx2ID(SubWorld)
	local player = mf_GetMSPlayerIndex(MS_ID,0,map_id)
	local player_att_x,player_att_y = 0,0
	local att_x_distance_num,att_y_distance_num = 0,0
	--¼ÓÉÏ·½Î»µÄĞı×ª
	local element_gold_seq = GetMissionV(Ms_element_gold_seq)
	local doa_element_seq = mod((Tb_5_element_coordinate[element_seq][doa_flag] + element_gold_seq),5)
	if doa_element_seq == 0 then
		doa_element_seq = 5
	end
	for i = 1, getn(player) do
		PlayerIndex = player[i]
		map_id,player_att_x,player_att_y = GetWorldPos()
		--¸ÄĞĞÏàÉúÏà¿Ë¶ÔÓ¦µÄX\Y×ø±ê»ñÈ¡
		att_x_distance_num = abs(player_att_x - Tb_5_element_coordinate[doa_element_seq][1])
		att_y_distance_num = abs(player_att_y - Tb_5_element_coordinate[doa_element_seq][2])
		--Íæ¼ÒÊÇ·ñÔÚÏàÉúÏà¿ËÎ»ÖÃÅĞ¶Ï
		if att_x_distance_num <= 5 and att_y_distance_num <= 5 and  (abs(att_x_distance_num) + abs(att_y_distance_num)) <= 5 then
			return PlayerIndex
		end
	end 
	return 0
end
--ÎåĞĞÉú·¢Éú
function element_alive_deal()
	local boss_index = 0
	for i = MS_boss_index_gold,MS_boss_index_soil do
		boss_index = GetMissionV(i)
		if boss_index ~= 0 and boss_index ~= nil then
			Zgc_pub_mission_boss_life_chg(boss_index,1,Boss_life_reduce_percent)
		end
	end
end
--ÎåĞĞ¿Ë·¢Éú
function element_death_deal()
	local life_now = 0,0
	local modify_life_num = 0
	local map_id =  SubWorldIdx2ID(SubWorld)
	local player = mf_GetMSPlayerIndex(MS_ID,0,map_id)
	for i = 1,getn(player) do
		PlayerIndex = player[i]
		life_now = GetLife()
		modify_life_num = life_now - floor(GetMaxLife() * Boss_life_reduce_percent/100)
		if modify_life_num < 0 then
			ModifyLife(0)
		else
			ModifyLife(modify_life_num)
		end
	end
end
--ĞÂµÄÎåĞĞÕóÊ¹´´½¨
--ÔÚÏµÍ³´¥·¢Æ÷µ÷ÓÃµÄÊ±ºòÒ²Òª¼ì²âÊÇ·ñ¿ÉÒÔ´´½¨ĞÂµÄÎåĞĞÊ¹Õß
function element_crt()
	--´´½¨µÄÎåĞĞÊ¹ÕßµÄĞòºÅ
	local map_id =  SubWorldIdx2ID(SubWorld)
	--Çå³ıĞ¡¹Ö
	local npc_total_index = GetMapNpcIdx(map_id)
	local npc_num = getn(npc_total_index)
	if npc_num > 1 then
		for i = 1,npc_num do
			local npc_name = GetNpcName(npc_total_index[i])
			if strsub(npc_name,3,6) == "Kú sø" then
				SetNpcLifeTime(npc_total_index[i],0)
			end		
		end
	end
	local element_crt_seq = GetMissionV(20+(GetMissionV(Ms_boss_crt_state)+1))
	local boss_index = CreateNpc(Tb_5_element_coordinate[element_crt_seq][5],Tb_5_element_coordinate[element_crt_seq][6],map_id,Tb_5_element_coordinate[element_crt_seq][1],Tb_5_element_coordinate[element_crt_seq][2])
	SetNpcScript(boss_index,Main_Npc_Script_way)
	--´æË÷Òı
	SetMissionV((10 + element_crt_seq),boss_index)
	--´´½¨Ë³Ğò+1
	SetMissionV(Ms_boss_crt_state,(GetMissionV(Ms_boss_crt_state) + 1))
	--µÚÎå¹Øloop_num³õÊ¼»¯
	SetMissionV(Ms_stage5_loop_num,0)
	Zgc_pub_mission_fun(MS_ID,"StopTimeGuage(2)")
end
--Ö÷ËÀÍö½Å±¾
function OnDeath(npc_index)
	local npc_name = GetNpcName(npc_index)
	for i = 1,getn(TB_Npc_death_script[5]) do
		if TB_Npc_death_script[5] [i][1] == npc_name then
			dostring(TB_Npc_death_script[5] [i][2])
			break
		end
	end
	SetNpcLifeTime(npc_index,5)
end
--ËÀÍö´¦Àí½Å±¾
function stage5_element_death(element_seq)
	--Èç¹ûÒÑ¾­¸ÉµôÍêÁË
	if GetMissionV(Ms_element_killed_num) == 4 then
		Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"Toµn bé 'Ngò Hµnh TrËn Sø' bŞ tiªu diÖt, qua ¶i nµy!\")")
		
		local stage_seq = GetMissionV(MS_STATE_DIFF_ID)
		PlayerIndex = GetTeamMember(0)
		if PlayerIndex ~= 0 then
			AddGlobalNews("T¹i"..GetName().."ChiÕn ®Êu gian khæ, cuèi cïng ®¸nh b¹i 'Ngò Hµnh TrËn Sø', v­ît ¶i thµnh c«ng"..Stage_info[stage_seq].stage_name..".")
		end
		
		local nMapID = SubWorldIdx2ID(SubWorld)
		ClearMapNpc(nMapID)
		--×¼±¸¹Ø½áÊø
		--test
		local mission_count = GetMapTaskTemp(nMapID,1)
		WriteLog("[¶i T©y B¾c] thèng kª qua ¶i: ID ¶i	"..stage_seq..":"..nMapID..":"..mission_count.."	Thêi gian qua ¶i	"..Zgc_pub_time_sec_change(((189-GetMissionV(MS_TIMMER_LOOP_ID))* 10),1))
		Zgc_pub_mission_fun(MS_ID,"Ms_stage_prize()")
		SetMissionV(MS_TIMMER_LOOP_ID,6)
		--stage_mission_fail(5)
	else
		--ËÀµôµÄÎåĞĞÕóÊ¹ÊıÁ¿+1
		SetMissionV(Ms_element_killed_num,(GetMissionV(Ms_element_killed_num)+1))
		--È¥µô¶ÔÓ¦µÄË÷Òı
		SetMissionV((10 + element_seq),0)
		--´´½¨ÏÂÒ»½×¶ÎµÄÎåĞĞÕóÊ¹£¨Òª×¢ÒâÇø·ÖÓÉÁ÷³Ì´´½¨ºÍËÀÍö½Å±¾´´½¨µÄ£©
		--ÅĞ¶ÏÏÂÒ»½×¶ÎµÄNPCÊÇ·ñÒÑ¾­ÓÉÁ÷³Ì´´½¨Íê±Ï£¬Èç¹ûÃ»ÓĞÔò´´½¨
		--½øĞĞÊÇ·ñ»¹ÓĞÎåĞĞÊ¹´æÔÚµÄÅĞ¶Ï
		--ÎåĞĞÊ¹±»É±ËÀÊÇ·ñ´´½¨µÄÌõ¼şÎª£ºÊÇ·ñ»¹ÓĞÎåĞĞÊ¹´æÔÚ£¬Èç¹ûÃ»ÓĞÔò´´½¨£¬·´Ö®ÒàÈ»
		local element_alive_chk = 0
		local element_index = 0
		for i = MS_boss_index_gold ,MS_boss_index_soil do
			element_index = GetMissionV(i)
			if element_index ~= 0 and element_index ~= nil then
				element_alive_chk = 1 
				break
			end
		end
		if element_alive_chk == 0 then
			element_crt()
		end
	end
end
--NPC¶Ô»°ĞÅÏ¢
--ÎåĞĞÊ¹ÕßµÄ¶Ô»°
function stage5_5_element_dia()
	Talk(1,"","<color=green>"..GetTargetNpcName().."<color>: C¸c ng­¬i h«m nay chÕt trong tay ta, còng kh«ng oan uæng!")
end
