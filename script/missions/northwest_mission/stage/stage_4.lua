--²ß»®ÈË£º³Â¹«×Ó
--´úÂë¿ª·¢ÈË£º´å³¤
--´úÂë¿ª·¢Ê±¼ä£º2007-08-06
	MS_boss_index = 10
	grass_index_TasktempID = 188		--´æ·Å²ÝµÄË÷Òý
	grass_id_state = 0					--´æ·Å¸Ã²ÝÄ¿Ç°µÄ×´Ì¬£¬0Îª³õÊ¼×´Ì¬£¬1ÎªÊ¹ÓÃ°Î³ö×´Ì¬
	grass_id_sys_time = 1			--´æ·Å¸Ã²ÙÉÏ´Î²Ù×÷µÄÊ±¼ä£¬ÓëÉÏÒ»ÌõÅäºÏÍê³ÉÕ¼ÓÐ»úÖÆ
	grass_kill_num = 1424			--°Î³ýÁË¶àÉÙÒ©ÈË²Ý
	Tb_grass_crt_info = {
		{1584,3170,80},
		{1610,3157,80},
		{1588,3233,80},
		{1623,3229,80},
		{1599,3199,80},
	}
function stage4_boss_create()
	local map_id =  SubWorldIdx2ID(SubWorld)
	local npc_index = CreateNpc(Tb_Monster_info[4][1][1],Tb_Monster_info[4][1][2],map_id,Tb_Monster_info[4][1][3],Tb_Monster_info[4][1][4])
	SetNpcScript(npc_index,Main_Npc_Script_way)
	SetMissionV(MS_boss_index,npc_index)
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"KÕt thóc v­ît ¶i cßn\",1830,0,1)")
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Thêi gian D­îc Nh©n Th¶o xuÊt hiÖn\",30,0,2)")
end
--Ò©ÈË²Ý´´½¨
function stage4_grass_crt()
	local boss_index = GetMissionV(MS_boss_index)
	NpcChat(boss_index,"C¸c ng­¬i muèn diÖt D­îc Nh©n Th¶o cña ta, ®óng lµ m¬ gi÷a ban ngµy!")
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"D­îc Nh©n Th¶o ®ang t¨ng tr­ëng m¹nh, D­îc V­¬ng h×nh nh­ ®· hµnh ®éng, cÇn nhanh chãng tiªu hñy. D­îc Nh©n Th¶o cùc ®éc, nÕu bÞ dÝnh vµo th× ph¶i cÈn thËn.\")")
	local map_id =  SubWorldIdx2ID(SubWorld)
	local palyer_num = GetMissionV(MS_PLAYER_NUM)
	--Ëæ»ú³öÖ÷´´½¨×ø±ê
	local main_crt_coordinate_seq = random(1,getn(Tb_grass_crt_info))
	for i = 1,getn(Tb_grass_crt_info) do
		local grass_num,grass_index = 0,{}
		if i == main_crt_coordinate_seq then
			grass_num,grass_index = CreateNpc(Tb_Monster_info[4][2][1],Tb_Monster_info[4][2][2],map_id,Tb_grass_crt_info[i][1],Tb_grass_crt_info[i][2],-1,(palyer_num*6),1,Tb_grass_crt_info[i][3])
		else
			grass_num,grass_index = CreateNpc(Tb_Monster_info[4][2][1],Tb_Monster_info[4][2][2],map_id,Tb_grass_crt_info[i][1],Tb_grass_crt_info[i][2],-1,floor(palyer_num*6/4),1,Tb_grass_crt_info[i][3])
		end
		for i = 0,getn(grass_index) do
			SetNpcScript(grass_index[i],Main_Npc_Script_way)
		end
	end
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Thêi gian chÕ t¹o D­îc Nh©n V­¬ng\",120,0,2)")
end
--Ò©ÈË²Ý×ª»»Ò©ÈË
function stage4_grass_chg()
	--ÊÇ·ñÐèÒª´´½¨Ò©ÈËÅÐ¶Ï
	local map_id =  SubWorldIdx2ID(SubWorld)
	local npc_total_index = GetMapNpcIdx(map_id)
	local grass_num = 0
	--Í³¼ÆÒ©²ÝÊýÁ¿
	for i = 1,getn(npc_total_index) do
		if GetNpcName(npc_total_index[i]) == "D­îc Nh©n Th¶o"  then
			grass_num = grass_num + 1
			SetNpcLifeTime(npc_total_index[i],0)
		end
	end
	--Ë¢Ò©ÈËÍõ
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Thêi gian trïng sinh D­îc Nh©n Th¶o\",180,0,2)")
	if grass_num > 0 then
		local player_index_total = mf_GetMSPlayerIndex(MS_ID,0,map_id)
		local devil_gress_num = min(stage_devil_restrict(),floor(grass_num * 1.5))
		for i = 1, devil_gress_num do
			PlayerIndex = player_index_total[mod(i,getn(player_index_total))+1]
			local mapID,att_x,att_y = GetWorldPos()
			if map_id == mapID then
				local npc_inex = CreateNpc(Tb_Monster_info[4][3][1],Tb_Monster_info[4][3][2],mapID,att_x,att_y,-1,1,1,30)
				SetNpcScript(npc_inex,Main_Npc_Script_way)
			end
		end
		local boss_index = GetMissionV(MS_boss_index)
		NpcChat(boss_index,"ChØ cã D­îc Nh©n míi cã m×nh ®ång da s¾t!")
		Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"D­îc V­¬ng chÕ D­îc Nh©n Th¶o thµnh D­îc Nh©n V­¬ng, uy lùc kh«ng yÕu! Nhanh tiªu diÖt ®i!\")")
	end
end
--bossËÀÍöµ÷ÓÃº¯Êý£¬¹ý¹Ø
function stage4_boss_death()
	--½±Àø¸øÓÚº¯Êý
	--·¢ÏûÏ¢
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"Tiªu diÖt 'D­îc V­¬ng', ®éi ngò v­ît ¶i thµnh c«ng!\")")
	
	local stage_seq = GetMissionV(MS_STATE_DIFF_ID)
	PlayerIndex = GetTeamMember(0)
	if PlayerIndex ~= 0 then
		AddGlobalNews("T¹i"..GetName().."ChiÕn ®Êu gian khæ, cuèi cïng ®¸nh b¹i 'D­îc V­¬ng', v­ît ¶i thµnh c«ng"..Stage_info[stage_seq].stage_name..".")
	end
	
	--°ÎÒ©²ÝÊýÁ¿Çå0
	Zgc_pub_mission_fun(MS_ID,"SetTask("..grass_kill_num..",0)")
	--É¾³ýbuff
	Zgc_pub_mission_fun(MS_ID,"RemoveState(19801223)")
	--É¾³ý³ÆºÅ
	for i = 21,25 do
		Zgc_pub_mission_fun(MS_ID,"RemoveTitle(60,"..i..")")
	end
	--×¼±¸¹Ø¿¨½áÊø
	local nMapID = SubWorldIdx2ID(SubWorld)
	ClearMapNpc(nMapID)
	--test
	local mission_count = GetMapTaskTemp(nMapID,1)
	WriteLog("[¶i T©y B¾c] thèng kª qua ¶i: ID ¶i	"..stage_seq..":"..nMapID..":"..mission_count.."	Thêi gian qua ¶i	"..Zgc_pub_time_sec_change(((189-GetMissionV(MS_TIMMER_LOOP_ID))* 10),1))
	Zgc_pub_mission_fun(MS_ID,"Ms_stage_prize()")
	SetMissionV(MS_TIMMER_LOOP_ID,6)
	--stage_mission_fail(4)
end
	--Ò©ÈËËÀÍö½Å±¾
function stage4_devil_death()
	local map_id =  SubWorldIdx2ID(SubWorld)
	local npc_total_index = GetMapNpcIdx(map_id)
	local devil_num = 0 
	for i = 1,getn(npc_total_index) do
		if GetNpcName(npc_total_index[i]) == "D­îc Nh©n" and IsNpcDeath(npc_total_index[i]) ~= 1  then
			devil_num = devil_num + 1
		end
	end 
	if devil_num > 1 then
		return
	end
	--É¾³ýbuff
	Zgc_pub_mission_fun(MS_ID,"RemoveState(19801223)")
	--°ÎÒ©²ÝÊýÁ¿Çå0
	Zgc_pub_mission_fun(MS_ID,"SetTask("..grass_kill_num..",0)")
	--É¾³ý³ÆºÅ
	for i = 21,25 do
		Zgc_pub_mission_fun(MS_ID,"RemoveTitle(60,"..i..")")
	end
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"§· hñy toµn bé 'D­îc Nh©n V­¬ng' do D­îc V­¬ng t¹o ra, ®éc cña D­îc Nh©n Th¶o ®· gi¶i!\")")
end
	--Ò©ÈË²Ý¶Ô»°º¯Êý
function stage4_grass_dia()
	--²ÝË÷ÒýµÄ»ñÈ¡ºÍ¼ì²â
	local npc_index = GetTargetNpc()
	if npc_index == 0 then
		return
	end
	if GetNpcName(npc_index) ~= "D­îc Nh©n Th¶o" then
		return
	end
	--Õ¼ÓÐÅÐ¶ÏºÍÉèÖÃ
	if GetUnitCurStates(npc_index,grass_id_state) == 1 and (GetTime() - GetUnitCurStates(npc_index,grass_id_sys_time)) <= 10 then
		Talk(1,"","<color=green>Nh¾c nhë<color>: §ång ®éi ®· dän <color=yellow>D­îc Nh©n Th¶o<color> nµy, "..Zgc_pub_sex_name().."Sao kh«ng ®æi c©y kh¸c!")
		return
	end
	SetTaskTemp(grass_index_TasktempID,npc_index)
	SetUnitCurStates(npc_index,grass_id_state,1)
	SetUnitCurStates(npc_index,grass_id_sys_time,GetTime())
	DoWait(11,12,10)
end
