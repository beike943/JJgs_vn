--½Å±¾Ãû³Æ£ºÎ÷±±Çø¹Ø¿¨µÚÒ»¹Ø
--½Å±¾¹¦ÄÜ£º¹Ø¿¨µÄÖ÷ÒªÂß¼­
--²ß»®ÈË£º³Â¹«×Ó
--´úÂë¿ª·¢ÈË£º´å³¤
--´úÂë¿ª·¢Ê±¼ä£º2007-08-06
--==¹«¹²±äÁ¿¶¨ÒåÇø
	MS_boss_index = 10
	MS_blood_monster_num = 11
	MS_dragon_fox_num = 12
	Monter_num = {5,3}
	Camp_player = "nw_player"			--Íæ¼ÒÕóÓªµÄ×Ö·û´®
	Camp_monster = "nw_monster"		--¹ÖÎïÕóÓªµÄ×Ö·û´®
	Tb_camp_player_attr_add = {		--Íæ¼ÒÕóÓªÐèÒªÔö¼ÓµÄÄ§·¨ÊôÐÔ
		--Ä§·¨ÊôÐÔ×Ö·û´®-ÊôÐÔÖµ-Ê±¼ä£¨Ö¡£©-ÊÇ·ñÌæ»»-ÊôÐÔID
		{"state_move_speed_percent_add",250,2160,0,19801224},
		{"state_dispear", 1, 2160, 0,19801225},
		--{"state_shadow_run", 2565, 2160,0,19801226},
	}
	Tb_camp_monster_attr_add = {	--¹ÖÎïÕóÓªÐèÒªÔö¼ÓµÄÄ§·¨ÊôÐÔ
		--Ä§·¨ÊôÐÔ×Ö·û´®-ÊôÐÔÖµ-Ê±¼ä£¨Ö¡£©-ÊÇ·ñÌæ»»-ÊôÐÔID
		--{"state_shadow_run", 2565, 2160,0,19801227},
	}
	Npc_del_name = {"¢m NhËt Sø ","Minh NhËt Sø","LiÖt Nhan Li Long","XÝch LuyÖn Háa Hå"}
--µÚÒ»²½£ºboss´´½¨
function stage1_boss_create()
	local nMapID = SubWorldIdx2ID(SubWorld)
	--¹Ø¿¨×´Ì¬ÉèÖÃÎª¿ªÊ¼×´Ì¬
	SetMissionV(MS_STATE_ID,MS_state_running)
	--ËùÓÐÍæ¼Ò¼ÓÈë"player"ÕóÓª
	Zgc_pub_mission_fun(MS_ID,"SetCampToPlayer(\"nw_player\")")
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"KÕt thóc v­ît ¶i cßn\",1830,0,1)")
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Tr¹ng th¸i háa luyÖn cßn\",30,0,2)")
	--boss´´½¨²¢¼ÓÈë¹ÖÎïÕóÓª
	local boss_index = CreateNpc(Tb_Monster_info[1][1][1],Tb_Monster_info[1][1][2],nMapID,Tb_Monster_info[1][1][3],Tb_Monster_info[1][1][4],-1,1,1,Tb_Monster_info[1][1][5])
	SetMissionV(MS_boss_index,boss_index)
	SetNpcScript(boss_index,Main_Npc_Script_way)
	SetCampToNpc(boss_index,Camp_monster)
end
function stage1_boss_add_shadow_buff()
	local boss_index = GetMissionV(MS_boss_index)
	CastState2Npc(boss_index,"state_shadow_run", 2565, 2160,0,19801226)
end
--µÚ¶þ²½£ºÐÞ¸ÄbossÕóÓª£¬´´½¨Ð¡¹Ö
function sun_moon_monster_create()
	--ÐÞ¸ÄbossÎªNPCÕóÓª
	boss_camp_chg(Camp_player)
	--¹ÖÎï´´½¨²¢¼ÓÈëmonsterÕóÓª
	local monster_num = ((GetMissionV(MS_PLAYER_NUM)) * 5)
	--³õÊ¼»¯Ð´ÈëÏÂÒ»½×¶Î´´½¨ÑªÄ§ÈËµÄÊýÁ¿
	SetMissionV(MS_blood_monster_num,monster_num)
	local nMapID = SubWorldIdx2ID(SubWorld)
	for i = 1, monster_num do
		local ran_num = random(3,4)
		local monster_index = CreateNpc(Tb_Monster_info[1][ran_num][1],Tb_Monster_info[1][ran_num][2],nMapID,Tb_Monster_info[1][ran_num][3],Tb_Monster_info[1][ran_num][4],-1,1,1,Tb_Monster_info[1][ran_num][5])
		SetNpcScript(monster_index,Main_Npc_Script_way)
		SetCampToNpc(monster_index,Camp_monster)
	end
	local boss_index = GetMissionV(MS_boss_index)
	NpcChat(boss_index,"TÊt c¶ sinh linh trong Cæ D­¬ng §éng, dïng m¸u c¸c ng­¬i ®Ó röa téi ¸c cña ta!")
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"ý chÝ Cæ D­¬ng Thó yÕu dÇn, trë nªn ®iªn cuång, r¬i vµo tr¹ng th¸i khèng chÕ!\")")
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Tr¹ng th¸i nhËp cßn\",120,0,2)")
end
--µÚÈý²½£ºÇåÐ¡¹Ö£¬´´½¨ÑªÄ§ÈË
function blood_monster_create()
	local nMapID = SubWorldIdx2ID(SubWorld)
	--boss×ª»»
	boss_camp_chg(Camp_monster)
	--Ð¡¹ÖÇå³ý
	map_npc_clear()
	--ÑªÄ§ÈËµÄ´´½¨
	local blood_monster_num = GetMissionV(MS_blood_monster_num)
	if blood_monster_num > 1 then
		local monster_num,monster_index = CreateNpc(Tb_Monster_info[1][5][1],Tb_Monster_info[1][5][2],nMapID,Tb_Monster_info[1][5][3],Tb_Monster_info[1][5][4],-1,blood_monster_num,1,Tb_Monster_info[1][5][5])
		for i = 0,getn(monster_index) do
			SetNpcScript(monster_index[i],Main_Npc_Script_way)
			--SetCampToNpc(monster_index[i],Camp_monster)
		end
	elseif blood_monster_num == 1 then
		local monster_index = CreateNpc(Tb_Monster_info[1][5][1],Tb_Monster_info[1][5][2],nMapID,Tb_Monster_info[1][5][3],Tb_Monster_info[1][5][4],-1,blood_monster_num,1,Tb_Monster_info[1][5][5])
		SetNpcScript(monster_index,Main_Npc_Script_way)
	end
	local boss_index = GetMissionV(MS_boss_index)
	NpcChat(boss_index,"Sinh Linh! M¸u cña c¸c ng­¬i ®· hßa quyÖn víi m¸u ta, mau ®i ®i!")
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"Cæ D­¬ng Thó nhËp vµo ng­êi, biÕn thµnh HuyÕt Ma Nh©n, ph¶i mau tiªu diÖt!\")")
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Tr¹ng th¸i háa luyÖn cßn\",180,0,2)")
end
--µÚËÄ²½£º´´½¨ËùÓÐÐ¡¹Ö
function all_monster_create()
	local nMapID = SubWorldIdx2ID(SubWorld)
	--bossÕóÓª×ª»»
	boss_camp_chg(Camp_player)
	--¿ªÊ¼´´½¨¹ÖÎï
	local player_num = GetMissionV(MS_PLAYER_NUM)
	local monster_num = (player_num * 5)
	local dragon_fox_num = (player_num * 3)
	for i = 1, monster_num do
		local ran_num = random(3,4)
		local monster_index = CreateNpc(Tb_Monster_info[1][ran_num][1],Tb_Monster_info[1][ran_num][2],nMapID,Tb_Monster_info[1][ran_num][3],Tb_Monster_info[1][ran_num][4],-1,1,1,Tb_Monster_info[1][ran_num][5])
		SetNpcScript(monster_index,Main_Npc_Script_way)
		SetCampToNpc(monster_index,Camp_monster)
	end
		--±£´æ¹ÖÎïµÄÊýÁ¿£¬ÔÚËÀÍö½Å±¾ÀïÃæ¼õÉÙ
		SetMissionV(MS_blood_monster_num,monster_num)
	for i = 1,dragon_fox_num do
		local ran_num = random(6,7)
		local monster_index = CreateNpc(Tb_Monster_info[1][ran_num][1],Tb_Monster_info[1][ran_num][2],nMapID,Tb_Monster_info[1][ran_num][3],Tb_Monster_info[1][ran_num][4],-1,1,1,Tb_Monster_info[1][ran_num][5])
		SetNpcScript(monster_index,Main_Npc_Script_way)
		SetCampToNpc(monster_index,Camp_monster)
	end
	--±£´æÁúºÍºüÀêµÄÊýÁ¿£¬ÔÚËÀÍö½Å±¾ÀïÃæ¼õÉÙ
	SetMissionV(MS_dragon_fox_num,dragon_fox_num)
	local boss_index = GetMissionV(MS_boss_index)
	NpcChat(boss_index,"TÊt c¶ sinh linh trong Cæ D­¬ng §éng, dïng m¸u c¸c ng­¬i ®Ó röa téi ¸c cña ta!")
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"ý chÝ Cæ D­¬ng Thó yÕu dÇn, trë nªn ®iªn cuång, r¬i vµo tr¹ng th¸i khèng chÕ!\")")
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Tr¹ng th¸i nhËp cßn\",120,0,2)")
end
--µÚÎå²½£¬´´½¨ÑªÄ§ÈË£¬boss»ØÑª£¨ÒÔºóÒ»Ö±ÖØ¸´µÚËÄ²½ºÍµÚÎå²½£¬Ö±µ½¹Ø¿¨½áÊø£©
function blood_monster_recreate()
	local nMapID = SubWorldIdx2ID(SubWorld)
	--bossÕóÓª×ª»»
	boss_camp_chg(Camp_monster)
	--´´½¨ÑªÄ§ÈË
	local blood_num = GetMissionV(MS_blood_monster_num)
	if blood_num > 1 then
		local monster_num,monster_index = CreateNpc(Tb_Monster_info[1][5][1],Tb_Monster_info[1][5][2],nMapID,Tb_Monster_info[1][5][3],Tb_Monster_info[1][5][4],-1,blood_num,1,Tb_Monster_info[1][5][5])
		for i = 0,getn(monster_index) do
			SetNpcScript(monster_index[i],Main_Npc_Script_way)
		end
	elseif blood_num == 1 then
		local devil_index = CreateNpc(Tb_Monster_info[1][5][1],Tb_Monster_info[1][5][2],nMapID,Tb_Monster_info[1][5][3],Tb_Monster_info[1][5][4],-1,blood_num,1,Tb_Monster_info[1][5][5])
		SetNpcScript(devil_index,Main_Npc_Script_way)
	end
	--É¾³ýµôÁúºÍºüÀêºó
	map_npc_clear()
	--¼ÆËãÃ»ÓÐ±»Íæ¼ÒÉ±µôµÄÁúºÍºüÀê£¬¸øboss+Ñª
	local df_num_remain = GetMissionV(MS_dragon_fox_num)
	if df_num_remain ~= 0 then
		Zgc_pub_mission_boss_life_chg(GetMissionV(MS_boss_index),1,df_num_remain)
	end
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"M¸u cña sinh vËt trong Cæ D­¬ng §éng gióp Cæ D­¬ng Thó håi phôc!\")")
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Tr¹ng th¸i háa luyÖn cßn\",180,0,2)")
end
--µÚÆß²½£º¹â¿¨Ê±¼ä½áÊø£¬ËùÓÐÍæ¼ÒÇåÀí
function stage1_mission_end()
	local nMapID = SubWorldIdx2ID(SubWorld)
	local player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	for i = 1,getn(player) do
		Ms_log_out_set_state()
		NewWorld(Stage_info[1].log_out_coordinate[1],Stage_info[1].log_out_coordinate[2],Stage_info[1].log_out_coordinate[3])
	end
end
--bossÕóÓª×ª»»º¯Êý
function boss_camp_chg(boss_camp)
	--bossÖØÐÂ´´½¨
	local boss_index = GetMissionV(MS_boss_index)
	--»ñµÃbossµÄÑªÁ¿
	local max_life_num,life_num = GetUnitCurStates(boss_index,1)
	--µØÍ¼npcÇå¿Õ
	local nMapID = SubWorldIdx2ID(SubWorld)
	--ClearMapNpc(nMapID)
	--ÐÞ¸ÄbossÑªÁ¿
	--È·¶¨bossÀàÐÍ
	local boss_diff = 2
	if boss_camp == "nw_monster" then
		boss_diff = 1
	end
	local new_boss_index = CreateNpc(Tb_Monster_info[1][boss_diff][1],Tb_Monster_info[1][boss_diff][2],nMapID,Tb_Monster_info[1][boss_diff][3],Tb_Monster_info[1][boss_diff][4],-1,1,1,Tb_Monster_info[1][boss_diff][5])
	ModifyNpcData(new_boss_index,0,life_num,0)
	SetNpcScript(new_boss_index,Main_Npc_Script_way)
	--ÐÞ¸ÄbossÕóÓª
	SetCampToNpc(new_boss_index,boss_camp)
	--Ôö¼Óboss buff
	if boss_camp == "nw_player" then
		for i = 1,getn(Tb_camp_player_attr_add) do
			CastState2Npc(new_boss_index,Tb_camp_player_attr_add[i][1],Tb_camp_player_attr_add[i][2],Tb_camp_player_attr_add[i][3],Tb_camp_player_attr_add[i][4],Tb_camp_player_attr_add[i][5])
		end
	elseif boss_camp == "nw_monster" then
		for i = 1,getn(Tb_camp_monster_attr_add) do
			CastState2Npc(new_boss_index,Tb_camp_monster_attr_add[i][1],Tb_camp_monster_attr_add[i][2],Tb_camp_monster_attr_add[i][3],Tb_camp_monster_attr_add[i][4],Tb_camp_monster_attr_add[i][5])
		end
	end
	SetMissionV(MS_boss_index,new_boss_index)
	SetNpcLifeTime(boss_index,0)
	return
end
--map:npcÇåÀí
function map_npc_clear()
	local nMapID = SubWorldIdx2ID(SubWorld)
	local npc_total_index = GetMapNpcIdx(nMapID)
	local npc_num = getn(npc_total_index)
	if npc_num < 1 then
		return
	else
		for i = 1,npc_num do
			for j = 1,getn(Npc_del_name) do
				if GetNpcName(npc_total_index[i]) == Npc_del_name[j] then
					SetNpcLifeTime(npc_total_index[i],0)
				end
			end
		end
	end
end
--BOSSËÀÍö½Å±¾
function stage1_boss_death()
	--½±Àø¸øÓÚº¯Êý
	--·¢ÏûÏ¢
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"Tiªu diÖt thµnh c«ng 'Cæ D­¬ng Thó', ®éi ngò v­ît ¶i thµnh c«ng!\")")
	
	local stage_seq = GetMissionV(MS_STATE_DIFF_ID)
	PlayerIndex = GetTeamMember(0)
	if PlayerIndex ~= 0 then
		AddGlobalNews("T¹i"..GetName().."ChiÕn ®Êu gian khæ, cuèi cïng ®¸nh b¹i 'Cæ D­¬ng Thó', v­ît ¶i thµnh c«ng"..Stage_info[stage_seq].stage_name..".")
	end
	
	local nMapID = SubWorldIdx2ID(SubWorld)
	ClearMapNpc(nMapID)
	--×¼±¸¹Ø¿¨½áÊø
	local mission_count = GetMapTaskTemp(nMapID,1)
	WriteLog("[¶i T©y B¾c] thèng kª qua ¶i: ID ¶i	"..stage_seq..":"..nMapID..":"..mission_count.."	Thêi gian qua ¶i	"..Zgc_pub_time_sec_change(((189-GetMissionV(MS_TIMMER_LOOP_ID))* 10),1))
	Zgc_pub_mission_fun(MS_ID,"Ms_stage_prize()")
	SetMissionV(MS_TIMMER_LOOP_ID,6)
end
--°µÈÕÊ¹ºÍÃ÷ÔÂÊ¹ËÀÍö½Å±¾
function stage1_sun_moon_death()
	--Èç¹ûÊÇÍæ¼ÒÉ±ËÀÔò´æÔÚÊýÁ¿-1
	if PlayerIndex > 0 then
		SetMissionV(MS_blood_monster_num,(GetMissionV(MS_blood_monster_num)-1))
	end
	PlayerIndex = 0
end
--ºüÀêºÍÁúËÀÍö½Å±¾
function stage1_dragon_fox_death(index)
	--Èç¹ûÊÇÍæ¼ÒÉ±ËÀÔò´æÔÚÊýÁ¿-1
	if PlayerIndex > 0 then
		SetMissionV(MS_dragon_fox_num,(GetMissionV(MS_dragon_fox_num)-1))
	end
	PlayerIndex = 0
end
