--½Å±¾Ãû³Æ£ºÎ÷±±Çø¹Ø¿¨µÚ¶ş¹Ø
--½Å±¾¹¦ÄÜ£º¹Ø¿¨µÄÖ÷ÒªÂß¼­
--²ß»®ÈË£º³Â¹«×Ó
--´úÂë¿ª·¢ÈË£º´å³¤
--´úÂë¿ª·¢Ê±¼ä£º2007-08-06
	--msID¶¨Òå
	MS_boss_index = 10				--bossË÷Òı´æ·ÅID
	MS_pillar_index_east = 11		--¶«½ÇbossË÷Òı
	MS_pillar_index_south = 12		--ÄÏ½ÇbossË÷Òı
	MS_pillar_index_west = 13		--Î÷½ÇbossË÷Òı
	MS_pillar_index_north = 14		--±±½ÇbossË÷Òı
	MS_boss_buff_state = 15			--µ±Ç°bossÕıÃæÄ§·¨×´Ì¬ĞòºÅ
	MS_player_buff_state = 16		--µ±Ç°Íæ¼Ò¸ºÃæÄ§·¨×´Ì¬ĞòºÅ
	--³£Á¿¶¨Òå
	Devil_num_per_palyer = 1			--Ã¿¸öÍæ¼Ò¶ÔÓ¦µÄË¢ĞÂĞ¡¹ÖµÄÊıÁ¿
	Tb_pillar_buff_info = {				--buffÏà¹Ø
	---------------------------------------------ÉÏÓĞbossÓĞÒæÖù--------------------------------------------
	--ËùÓĞbuff£¨¿ÉÒÔ¶à¸ö£©-¶ÔÓ¦Öù×ÓÃû³Æ-
		{--·ÀÓùÌá¸ß	
			{	--Ä§·¨buff£¬¿É×ÔĞĞÌí¼Ó
				{"state_i_defence_point_add",6000,5400,0,19801228},
				{"state_o_defence_point_add",6000,5400,0,19801229},
				{"state_receive_half_damage",100,5400,0,19801250},
			},
			"Ph¸ phßng TrÊn mé trô","T¨ng phßng thñ",
		},	
		{--¹¥»÷Ìá¸ß
			{
				{"state_p_attack_point_add",6000,5400,0,19801230},
				{"state_m_attack_point_add",6000,5400,0,19801231},
			},
			"Gi¸ng c«ng TrÊn mé trô","T¨ng tÊn c«ng",
		},	
		{--¹¥·ÀÌá¸ß      
			{
				{"state_i_defence_point_add",4200,5400,0,19801232},
				{"state_o_defence_point_add",4200,5400,0,19801233},
				{"state_p_attack_point_add",4200,5400,0,19801234},
				{"state_m_attack_point_add",4200,5400,0,19801235},
			},
			"H­ nh­îc TrÊn mé trô","T¨ng c«ng thñ",
		},	       
		{--ÒÆ¶¯ËÙ¶ÈÌá¸ß       
			{
				{"state_move_speed_percent_add",250,5400,0,19801236},
			},
			"Gi¶m tèc TrÊn mé trô","T¨ng di chuyÓn",
		},	  
		{--ÉÁ±ÜÌá¸ß   
			{
				{"state_perfect_dodge_rate",10000,5400,0,19801237},
			},
			"§én th©n TrÊn mé trô","T¨ng nĞ tr¸nh",
		},	          
		{--³ÖĞø»ØÑª 
			{
				{"state_life_percent_per10s_anytime",2,5400,0,19801238},
			},
			"§o¹n huyÕt TrÊn mé trô","Duy tr× håi m¸u",
		},
	--------------------------------------------------ÏÂÎªÍæ¼ÒÓĞº¦Öù-------------------------------------------
		{--³ÖĞøµôÑª
			{
				{"state_lost_p_life_per18",2,5400,0,19801239},
			},
			"Håi mÖnh TrÊn mé trô",
			"Duy tr× mÊt m¸u",
			{60,11},
		},		
		{--³ÖĞøµôÀ¶
			{
				{"state_lost_p_mana_per18",2,5400,0,19801240},
			},
			"Håi néi TrÊn mé trô","Duy tr× mÊt néi lùc",
			{60,12},
		},
		{--¹¥»÷ÏÂ½µ
			{
				{"state_p_attack_percent_dec",70,5400,0,19801241},
				{"state_m_attack_percent_dec",70,5400,0,19801242},
			},
			"C­êng c«ng TrÊn mé trô","Gi¶m tÊn c«ng",
			{60,13},
		},
		{--·ÀÓùÏÂ½µ
			{
				{"state_neili_defence_point_dec",400,5400,0,19801243},
				{"state_physical_def_point_dec",400,5400,0,19801244},
				{"state_physical_parmor_per_dec",40,5400,0,19801243},
				{"state_magic_parmor_per_dec",40,5400,0,19801244},
			},
			"Ngù thÓ TrÊn mé trô","Gi¶m phßng thñ",
			{60,14},
		},
		{--¹¥·ÀÏÂ½µ
			{
				{"state_p_attack_percent_dec",56,5400,0,19801245},
				{"state_m_attack_percent_dec",56,5400,0,19801246},
				{"state_neili_defence_point_dec",320,5400,0,19801247},
				{"state_physical_def_point_dec",320,5400,0,19801248},
				{"state_physical_parmor_per_dec",32,5400,0,19801251},
				{"state_magic_parmor_per_dec",32,5400,0,19801252},
			},
			"C­êng lùc TrÊn mé trô","Gi¶m c«ng thñ",
			{60,15},
		},
		{--ÒÆ¶¯ËÙ¶ÈÏÂ½µ
			{
				{"state_slow",70,5400,0,19801249},
			},
			"§Ò tèc TrÊn mé trô","Gi¶m tèc",
			{60,16},
		}	
	}
	--buffÑ¡È¡¼¸ÂÊ boss/player
	Tb_buff_sel_odds = {{25,50,70,75,80,100},{10,20,45,70,95,100}}
	--Ğ¡¹Ö´´½¨Ëæ»ú×ø±ê²î
	monster_crt_ran_att_num = 50
--boss´´½¨º¯Êı
function stage2_boss_create()
	local nMapID = SubWorldIdx2ID(SubWorld)
	local boss_index = CreateNpc(Tb_Monster_info[2][5][1],Tb_Monster_info[2][5][2],nMapID,Tb_Monster_info[2][5][3],Tb_Monster_info[2][5][4])
	SetNpcScript(boss_index,Main_Npc_Script_way)
	SetMissionV(MS_boss_index,boss_index)
	--Ê±¼ä½ø¶ÈÌõÉèÖÃ
	local player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"KÕt thóc v­ît ¶i cßn\",1830,0,1)")
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Thêi gian khëi ®éng c¬ quan\",30,0,2)")
	--Zgc_pub_mission_starttimeguage(MS_ID,"´³¹Ø½áÊøÊ£ÓàÊ±¼ä",1830,0,1)
	--Zgc_pub_mission_starttimeguage(MS_ID,"ÕòÄ¹Öù´´½¨Ê±¼ä",180,30,2)
end
--ÕòÄ¹Öù´´½¨º¯Êı
function pillar_create()
	--´´½¨Ğ¡¹Ö¼ÌĞøÑ½
	pillar_life_chk()
	--Çå³ıÔ­ÓĞÖù×Ó
	for i = MS_pillar_index_east,MS_pillar_index_north do
		local npc_index = GetMissionV(i)
		if npc_index ~= 0 then
			SetNpcLifeTime(npc_index,0)
		end
	end
	--»ñµÃĞÂÒ»ÂÖµÄÖù×Ó
	local buff_sel = stage2_buff_ran_sel()
	SetMissionV(MS_boss_buff_state,buff_sel[1])		--bossÕıÃæbuff
	SetMissionV(MS_player_buff_state,buff_sel[3])		--Íæ¼Òbuff
	local pillar_crt_seq = {}		--Öù×Ó´´½¨Ë³Ğò
	--boss buffÔö¼Ó
	local boss_index = GetMissionV(MS_boss_index)
	for i = 1,getn(Tb_pillar_buff_info[buff_sel[1]][1]) do
		CastState2Npc(boss_index,Tb_pillar_buff_info[buff_sel[1]][1][i][1],Tb_pillar_buff_info[buff_sel[1]][1][i][2],Tb_pillar_buff_info[buff_sel[1]][1][i][3],Tb_pillar_buff_info[buff_sel[1]][1][i][4],Tb_pillar_buff_info[buff_sel[1]][1][i][5])
	end
	--Íæ¼ÒbuffÔö¼Ó
	local player = mf_GetMSPlayerIndex(MS_ID,0)
	local player_num = getn(player)
	if player_num <= 0 then
		return
	end
	for i = 1, player_num do
		PlayerIndex = player[i]
		for j = 1,getn(Tb_pillar_buff_info[buff_sel[3]][1]) do
			CastState(Tb_pillar_buff_info[buff_sel[3]][1][j][1],Tb_pillar_buff_info[buff_sel[3]][1][j][2],Tb_pillar_buff_info[buff_sel[3]][1][j][3],Tb_pillar_buff_info[buff_sel[3]][1][j][4],Tb_pillar_buff_info[buff_sel[3]][1][j][5])
		end
		for i = 11,16 do
			RemoveTitle(60,i)
		end
		AddTitle(Tb_pillar_buff_info[buff_sel[3]][4][1],Tb_pillar_buff_info[buff_sel[3]][4][2])
		SetCurTitle(Tb_pillar_buff_info[buff_sel[3]][4][1],Tb_pillar_buff_info[buff_sel[3]][4][2])
	end
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"TrÊn Mé Thó"..Tb_pillar_buff_info[buff_sel[1]][3].."\",300,0,2)")
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Tæ"..Tb_pillar_buff_info[buff_sel[3]][3].."\",300,0,3)")
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Thêi gian khëi ®éng l¹i c¬ quan\",300,0,4)")
	--Zgc_pub_mission_starttimeguage(MS_ID,"ÕòÄ¹ÊŞ"..Tb_pillar_buff_info[buff_sel[1]][3],300,0,2)
	--Zgc_pub_mission_starttimeguage(MS_ID,"¶ÓÎé"..Tb_pillar_buff_info[buff_sel[3]][3],300,0,3)
	--Zgc_pub_mission_starttimeguage(MS_ID,"ÖØĞÂ´´½¨Ê£ÓàÊ±¼ä",300,0,4)
	--Íæ¼Ò³ÆºÅ´¦Àí
	--Öù×ÓÎ»ÖÃËæ»ú
	local chg_seq_tem = 0
	for i = 4,1,-1 do
		chg_seq_tem = random(1,i)
		pillar_crt_seq[i] = buff_sel[chg_seq_tem]
		buff_sel[chg_seq_tem] =  buff_sel[i]
	end
	--Öù×Ó´´½¨
	local pillar_index = 0
	local nMapID = SubWorldIdx2ID(SubWorld)
	for i = 1,4 do
		pillar_index = CreateNpc(Tb_Monster_info[2][i][1],Tb_pillar_buff_info[pillar_crt_seq[i]][2],nMapID,Tb_Monster_info[2][i][3],Tb_Monster_info[2][i][4])
		SetNpcScript(pillar_index,Main_Npc_Script_way)
		SetMissionV((MS_pillar_index_east-1+i),pillar_index)
	end
end
--Ğ¡¹Ö´´½¨º¯Êı
function pillar_life_chk()
	local nMapID = SubWorldIdx2ID(SubWorld)
	for i = MS_pillar_index_east,MS_pillar_index_north do
		local pillar_index = GetMissionV(i)
		if pillar_index ~= 0 then
			local pillar_life_max,pillar_life_now = GetUnitCurStates(pillar_index,1)
			local pillar_life_cent = (pillar_life_now/pillar_life_max)
			if pillar_life_cent > 0 and pillar_life_cent < 0.8 then
				local devil_crt_num = min((GetMissionV(MS_PLAYER_NUM)*Devil_num_per_palyer),stage_devil_restrict())
				if devil_crt_num > 1 then
					local devil_num,devil_index = CreateNpc("Thèng lÜnh Thñ Trô","Thèng lÜnh Thñ Trô",nMapID,(Tb_Monster_info[2][i-10][3]+random(-2,2)),(Tb_Monster_info[2][i-10][4]+random(-2,2)),-1,devil_crt_num,1,monster_crt_ran_att_num)
					for i = 0 ,getn(devil_index) do
						SetNpcScript(devil_index[i],Main_Npc_Script_way)
					end
				end
			end
		end
	end
end
--buffÑ¡Ôñ¼ÆËãº¯Êı
function stage2_buff_ran_sel()
	local table_rtn = {}
	--Ñ¡È¡Á½´Î
	for i = 0,1 do
		local table_temp = {(1+(6*i)),(2+(6*i)),(3+(6*i)),(4+(6*i)),(5+(6*i)),(6+(6*i))}
		--Ñ¡È¡Á½´Î
		local buff_sel_ran_num = random(1,100)			--È¡Ëæ»úÊı
		local num_sel = 0		--¶¨ĞòºÅ
		for j = 1,getn(Tb_buff_sel_odds[i+1]) do
			if buff_sel_ran_num <= Tb_buff_sel_odds[i+1][j] then
				num_sel = j
				break
			end
		end
			--µÚÒ»´ÎĞ´Èë
		tinsert(table_rtn,table_temp[num_sel])
			--½»»»ºóĞ´ÈëµÚ¶ş´Î
		table_temp[num_sel] = table_temp[6] 
		num_sel = random(1,5)
		tinsert(table_rtn,table_temp[num_sel])
	end
	return table_rtn
end
-------------------------------------NPCËÀÍö´¦Àí-------------------------------
--bossÉ±ËÀ£¬×¼±¸ÍË³ö
function stage2_boss_death()
	--½±Àø¸øÓÚº¯Êı
	--·¢ÏûÏ¢
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"Tiªu diÖt 'TrÊn Mé Thó' thµnh c«ng, ®éi ngò v­ît ¶i thµnh c«ng!\")")
	--Zgc_pub_mission_team_msg("¡°ÕòÄ¹ÊŞ¡±±»³É¹¦»÷É±£¬±¾¹Ø¿¨Í¨¹Ø£¡")
	local stage_seq = GetMissionV(MS_STATE_DIFF_ID)
	PlayerIndex = GetTeamMember(0)
	if PlayerIndex ~= 0 then
		AddGlobalNews("T¹i"..GetName().."ChiÕn ®Êu gian khæ, cuèi cïng ®¸nh b¹i 'TrÊn Mé Thó', v­ît ¶i thµnh c«ng"..Stage_info[stage_seq].stage_name..".")
	end
	
	--Íæ¼ÒbuffÇå³ı
	local player_buff_seq = GetMissionV(MS_player_buff_state)
	local nMapID = SubWorldIdx2ID(SubWorld)
	local player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	for i = 1,getn(player) do
		PlayerIndex = player[i]
			--Íæ¼Òbuff´¦Àí
			for j = 19801239,19801252 do
				RemoveState(j)
			end
			--Íæ¼Ò³ÆºÅ´¦Àí
			for i = 11,16 do
				RemoveTitle(60,i)
			end
	end
	--×¼±¸¹Ø¿¨½áÊø
	local nMapID = SubWorldIdx2ID(SubWorld)
	ClearMapNpc(nMapID)
	--test
	local mission_count = GetMapTaskTemp(nMapID,1)
	WriteLog("[¶i T©y B¾c] thèng kª qua ¶i: ID ¶i	"..stage_seq..":"..nMapID..":"..mission_count.."	Thêi gian qua ¶i	"..Zgc_pub_time_sec_change(((189-GetMissionV(MS_TIMMER_LOOP_ID))* 10),1))
	Zgc_pub_mission_fun(MS_ID,"Ms_stage_prize()")
	SetMissionV(MS_TIMMER_LOOP_ID,6)	
	--stage_mission_fail(2)
end
--Öù×Ó±»É±ËÀ
function stage2_pillar_death(pillar_seq,pillar_index)
	local nMapID = SubWorldIdx2ID(SubWorld)
	local player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	for i = MS_pillar_index_east,MS_pillar_index_north do
		if GetMissionV(i) == pillar_index then
			SetMissionV(i,0)
			break
		end
	end
	if GetMissionV(MS_boss_buff_state) == pillar_seq then
		local boss_index = GetMissionV(MS_boss_index)
		for i = 1,getn(Tb_pillar_buff_info[pillar_seq][1]) do
			RemoveStateFromNpc(boss_index,Tb_pillar_buff_info[pillar_seq][1][i][5])
		end
		for i = 1,getn(player) do
			PlayerIndex = player[i]
			StopTimeGuage(2)
			Msg2Player(Tb_pillar_buff_info[pillar_seq][2].."BŞ ph¸, søc m¹nh "..Tb_pillar_buff_info[pillar_seq][3].." cña TrÊn Mé Thó ®· bŞ hãa gi¶i!")
		end
	elseif GetMissionV(MS_player_buff_state) == pillar_seq then
		for i = 1,getn(player) do
			PlayerIndex = player[i]
			for j = 1,getn(Tb_pillar_buff_info[pillar_seq][1]) do
				RemoveState(Tb_pillar_buff_info[pillar_seq][1][j][5])
			end
			Msg2Player(Tb_pillar_buff_info[pillar_seq][2].."BŞ ph¸, b¹n ®· hãa gi¶i "..Tb_pillar_buff_info[pillar_seq][3].." søc m¹nh!")
			RemoveTitle(Tb_pillar_buff_info[pillar_seq][4][1],Tb_pillar_buff_info[pillar_seq][4][2])
			StopTimeGuage(3)
		end
	end
	SetNpcLifeTime(pillar_index,0)
end
