--²ß»®ÈË£º³Â¹«×Ó
--´úÂë¿ª·¢ÈË£º´å³¤
--´úÂë¿ª·¢Ê±¼ä£º2007-08-06
	MS_boss_index = 10
	MS_bougie_index_noutheast = 11
	MS_bougie_index_southeast = 12
	MS_bougie_index_southwest = 13
	MS_bougie_index_northwest = 14
	--¸÷¸öÎ»ÖÃÖòÌ¨×´Ì¬£º0¡¢ÓĞÀ¯Öò´æ»î 1¡¢ÎªÎŞÀ¯Öò´æ»îÎ´´´½¨Ğ¡boss 2¡¢ÎªÎŞÀ¯Öò´æ»îÇÒĞ¡boss´æ»î
	Ms_candler_state_noutheast = 15
	Ms_candler_state_southeast = 16
	Ms_candler_state_southwest = 17
	Ms_candler_state_northwest = 18
	--ÎŞÀ¯ÖòÖòÌ¨Ë÷Òı´æ·ÅÎ»ÖÃ¡£
	Ms_candler_index_noutheast = 19
	Ms_candler_index_southeast = 20
	Ms_candler_index_southwest = 21
	Ms_candler_index_northwest = 22
	--É±ËÀµÄ¸÷¸öÎ»ÖÃĞ¡bossµÄÊıÁ¿
	Ms_Devilgen_Killed_num ={ 23,24,25,26}
	Tb_Bougie_info = {}
	Tb_Bougie_info[1038] = {"§Ìn cÇy lín","Mang nÕn vµ ngän ®uèc (®¹i)"}		--´óÀ¯Öò
	Tb_Bougie_info[1039] = {"§Ìn cÇy võa","Mang nÕn vµ ngän ®uèc (trung)"}		--ÖĞÀ¯Öò
	Tb_Bougie_info[1040] = {"§Ìn cÇy nhá","Mang nÕn vµ ngän ®uèc (tiÓu)"}		--Ğ¡À¯Öò
		--³ÖĞøµôÑª¼¼ÄÜ£º
	Tb_Bougie_buff = {"state_lost_life_per18_monster",200,31860,0,19801250}
		--À¯ÖòÈ¼ÉÕÌØĞ§ID
	Bougie_burning_SFX_id = 954
		--¸÷¸öÎ»ÖÃµÄÀ¯ÖòÏ¨Ãğ¶ÔBOSSµÄÓ°Ïì
	Tb_Boss_buff_info_3 = {
		{--¹¥»÷Ìá¸ß
			{
				{"state_p_attack_point_add",2000,31860,0,19801252},
				{"state_m_attack_point_add",2000,31860,0,19801253},
			},
			"T¨ng tÊn c«ng","Gi¶m tÊn c«ng",
		},	
		{--³ÖĞø»ØÑª 
			{
				{"state_life_percent_per10s_anytime",2,31860,0,19801251},
			},
			"Duy tr× håi m¸u","Ng­ng håi m¸u",
		},
		{--·ÀÓùÌá¸ß	
			{	--Ä§·¨buff£¬¿É×ÔĞĞÌí¼Ó
				{"state_i_defence_point_add",2000,31860,0,19801254},
				{"state_o_defence_point_add",2000,31860,0,19801255},
			},
			"T¨ng phßng thñ","Gi¶m phßng thñ",
		},	
		{--ÒÆ¶¯ËÙ¶ÈÌá¸ß       
			{
				{"state_move_speed_percent_add",200,31860,0,19801256},
			},
			"T¨ng di chuyÓn","Gi¶m di chuyÓn",
		},	  
	}

	--¹Ø¿¨¿ªÊ¼Ö®Ç°ÇåÀíËùÓĞÈËµÄÀ¯Öò
function stage_3_bougie_del()
	for i = 1038,1040 do
			Zgc_pub_mission_fun(MS_ID,"BigDelItem(2,0,"..i..",BigGetItemCount(2,0,"..i.."))")
	end
end
	--¹Ø¿¨¿ªÊ¼º¯Êı
function stage3_boss_create()
	local map_id =  SubWorldIdx2ID(SubWorld)
	local npc_index = CreateNpc(Tb_Monster_info[3][5][1],Tb_Monster_info[3][5][2],map_id,Tb_Monster_info[3][5][3],Tb_Monster_info[3][5][4])
	SetNpcScript(npc_index,Main_Npc_Script_way)
	SetMissionV(MS_boss_index,npc_index)
	for i = 1,4 do
		public_bougie_crt(i)
	end
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"KÕt thóc v­ît ¶i cßn\",1830,0,1)")
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Quû Phong xuÊt hiÖn cßn\",60,0,2)")
end
--boss´µ·ç¼¼ÄÜÊ¹ÓÃ
function stage3_boss_wind_skill()
	local boss_index = GetMissionV(MS_boss_index)
	local bougie_alive_num = 0
	for i = MS_bougie_index_noutheast,MS_bougie_index_northwest do
		bougie_alive_num = bougie_alive_num + GetMissionV(i)
	end
	if bougie_alive_num == 0 then		--Èç¹ûËùÓĞÀ¯ÖòÏ¨ÃğÖ±½Ó´´½¨Ğ¡¹Ö
		NpcChat(boss_index,"ChØ cã bãng tèi míi cã thÓ gióp nhµ vua yªn giÊc!")
		stage3_devilkin_crt()
		return
	end
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"Quû Phong xuÊt hiÖn cßn\",60,0,2)")
	NpcChat(boss_index,"ThËt to gan, d¸m th¾p ¸nh s¸ng loe loĞt!")
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"Quû Phong biÕn mÊt, bèn h­íng chuyÓn ®éng, Quû T­íng Qu©n gäi ra Quû Phong, nÕn bçng phôt ch¸y!\")")
	for i = Ms_candler_state_noutheast,Ms_candler_state_northwest do
		if GetMissionV(i) == 0 then
			local ran_num = random(-20,-10)
			local buogie_index = GetMissionV(i-4)
			if buogie_index ~= 0 then
				if Zgc_pub_mission_boss_life_chg(buogie_index,1,ran_num) == -1 then			--À¯Öò±»·ç´µËÀÁË¡£
					--ÖòÌ¨ÏûÊ§
					SetNpcLifeTime(buogie_index,0)
					SetMissionV((i-4),0)
					SetMissionV(i,1)
					--Ëµ»°
				else		--Ã»ÓĞ±»·ç´µËÀ
					--Ëµ»°
				end
			end
		end
	end
	bougie_alive_chk()
end
--À¯Öò´æ»î¼ì²â/+buff
function bougie_alive_chk()
	local map_id =  SubWorldIdx2ID(SubWorld)
	for i = 	Ms_candler_state_noutheast,Ms_candler_state_northwest do
		local buogie_index = GetMissionV(i-4)
		if buogie_index ~= 0 then
			local max_life_num,life_num = GetUnitCurStates(buogie_index,1)
			if life_num < 10 then
				SetNpcLifeTime(buogie_index,0)
				SetMissionV((i-4),0)
				SetMissionV(i,1)
			end
		end
		if GetMissionV(i) == 1 then
		 	--´´½¨ÎŞÀ¯ÖòµÄÖòÌ¨
			local candler_index = CreateNpc(Tb_Monster_info[3][i-14][6],Tb_Monster_info[3][i-14][2],map_id,Tb_Monster_info[3][i-14][3],Tb_Monster_info[3][i-14][4])
			SetNpcScript(candler_index,Main_Npc_Script_way)
			SetMissionV((i + 4),candler_index)
			--´´½¨Ğ¡boss
			local devil_num,devil_index = CreateNpc(Tb_Monster_info[3][i-14][7],Tb_Monster_info[3][i-14][8],map_id,Tb_Monster_info[3][i-14][3],Tb_Monster_info[3][i-14][4],-1,(GetMissionV(MS_PLAYER_NUM)*2),1,50)
			for j = 0 ,getn(devil_index) do
				SetNpcScript(devil_index[j],Main_Npc_Script_way)
			end
			SetMissionV(i,2)
			--boss+buff
			local boss_index = GetMissionV(MS_boss_index)
			for j = 1,getn(Tb_Boss_buff_info_3[i-14][1]) do
				CastState2Npc(boss_index,Tb_Boss_buff_info_3[i-14][1][j][1],Tb_Boss_buff_info_3[i-14][1][j][2],Tb_Boss_buff_info_3[i-14][1][j][3],Tb_Boss_buff_info_3[i-14][1][j][4],Tb_Boss_buff_info_3[i-14][1][j][5])
			end
			Zgc_pub_mission_fun(MS_ID,"Msg2Player(\""..Tb_Monster_info[3] [i-14][2].."Ch¸y tµn, Quû T­íng Qu©n næi giËn uy lùc gia t¨ng ("..Tb_Boss_buff_info_3[i-14][2].."), mau th¾p ®uèc lªn!! TrÊn Mé T­íng Qu©n h×nh nh­ cã nÕn!\")")
		end
	end
	stage3_devilkin_crt()
end
--Ğ¡¹Ö´´½¨¼ì²â
function stage3_devilkin_crt()
	local crt_flag = 0
	--»ñÈ¡boss×ø±êĞÅÏ¢
	local map_id,att_x,att_y= GetNpcWorldPos(GetMissionV(MS_boss_index))
	local nMapID = SubWorldIdx2ID()
	if map_id ~= nMapID then
		return
	end
	for i = Ms_candler_state_noutheast,Ms_candler_state_northwest do
		if GetMissionV(i) ~= 0 then
			crt_flag = 1
			local devilkin_num = min(GetMissionV(MS_PLAYER_NUM) ,stage_devil_restrict())
			if devilkin_num < 2 then
				return
			end
			local suc_crt_num,devilkin_index = CreateNpc(Tb_Monster_info[3][i-14][10],Tb_Monster_info[3][i-14][11],map_id,att_x,att_y,-1,devilkin_num,1,50)
			for j = 0,getn(devilkin_index) do
				SetNpcScript(devilkin_index[j],Main_Npc_Script_way)
			end
		end
	end
	--Èç¹ûÓĞĞ¡¹Ö´´½¨£¬bossº°»°
	if crt_flag == 1 then
		NpcChat(GetMissionV(MS_boss_index),"To gan! Ta sÏ trõng trŞ thİch ®¸ng nh÷ng kÎ ngang nhiªn x©m ph¹m!")
	end
end
--¹í½«¾üËÀÍö½Å±¾
function stage3_boss_death()
	--½±Àø¸øÓÚº¯Êı
	--·¢ÏûÏ¢
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"Tiªu diÖt 'Quû T­íng Qu©n' thµnh c«ng, ®éi ngò v­ît ¶i thµnh c«ng!\")")

	local stage_seq = GetMissionV(MS_STATE_DIFF_ID)
	PlayerIndex = GetTeamMember(0)
	if PlayerIndex ~= 0 then
		AddGlobalNews("T¹i"..GetName().."ChiÕn ®Êu gian khæ, cuèi cïng ®¸nh b¹i 'Quû T­íng Qu©n', v­ît ¶i thµnh c«ng"..Stage_info[stage_seq].stage_name..".")
	end
	
	local nMapID = SubWorldIdx2ID(SubWorld)
	ClearMapNpc(nMapID)
	--ÇåµôÀ¯Öò
	stage_3_bougie_del()
	--×¼±¸¹Ø¿¨½áÊø
	--test
	local mission_count = GetMapTaskTemp(nMapID,1)
	WriteLog("[¶i T©y B¾c] thèng kª qua ¶i: ID ¶i	"..stage_seq..":"..nMapID..":"..mission_count.."	Thêi gian qua ¶i	"..Zgc_pub_time_sec_change(((189-GetMissionV(MS_TIMMER_LOOP_ID))* 10),1))
	Zgc_pub_mission_fun(MS_ID,"Ms_stage_prize()")
	SetMissionV(MS_TIMMER_LOOP_ID,6)
	--stage_mission_fail(3)
end
--Ğ¡bossËÀÍö½Å±¾
function devil_Gen_death(gen_seq)
	--µôÀ¯Öò
	local killed_num = (GetMissionV(Ms_Devilgen_Killed_num[gen_seq]) + 1)
	SetMissionV(Ms_Devilgen_Killed_num[gen_seq],killed_num)
	--Èç¹ûÉ±µÄÊıÁ¿¿ÉÒÔ±»Íæ¼ÒÊıÁ¿Õû³ı£¬Ôò¸ø½±Àø
	if mod(killed_num,(GetMissionV(MS_PLAYER_NUM)*2)) == 0 then
		local ran_num = random(1,100)
		for i = 1,getn(Tb_Monster_info[3][gen_seq][9]) do
			if ran_num <= Tb_Monster_info[3][gen_seq][9][i] then
				AddItem(2,0,(1037+i),1)
				Msg2Player("NhËn ®­îc 1 "..Tb_Bougie_info[1037+i][1]..", b¹n cã thÓ ®èi tho¹i víi ngän ®uèc ®Ó ®èt nÕn.")
				break
			end
		end
	end
end
--ÖòÌ¨ËÀÍö½Å±¾
function player_kill_candler(bougie_seq)
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\""..GetName().." tÊn c«ng dÉn ®Õn "..Tb_Monster_info[3][bougie_seq][2].." bŞ t¾t nÕn!\")")
	local buogie_index = GetMissionV(bougie_seq+10)
	SetNpcLifeTime(buogie_index,0)
	SetMissionV((bougie_seq+10),0)
	SetMissionV((bougie_seq+14),1)
	bougie_alive_chk()
end
--NPC¶Ô»°½Å±¾
--NPC¶Ô»°º¯ÊıÍ³Ò»´¦Àí
function stage3_bougie_use(bougie_seq)
	--ÊÇ·ñÓĞÀ¯ÖòµÄ¼ì²â
	local bougie_chk_flag = 0
	for i = 1038,1040 do
		if GetItemCount(2,0,i) ~= 0 then
			bougie_chk_flag = 1
			break
		end
	end	
	if bougie_chk_flag == 0 then
		return
	end
	--¶Ô»°Õ¹¿ª
	Say("<color=green>Nh¾c nhë<color> B¹n muèn dïng nÕn th¾p ngän ®uèc nµy kh«ng?",
	2,
	"§ång ı/#bougie_use_dtm("..bougie_seq..")",
	"Tho¸t/end_dialog"
	)
end
--È·ÈÏÊ¹ÓÃÀ¯Öò
function bougie_use_dtm(bougie_seq)
	--À¯ÖòÑ¡ÔñÈ·ÈÏ
	local tb_dilog = {}
	for i = 1038,1040 do
		if GetItemCount(2,0,i) ~= 0 then
			tinsert(tb_dilog,"§ång ı"..Tb_Bougie_info[i][1].."Th¾p ®uèc/#bougie_crt("..bougie_seq..","..i..")")
		end
	end
	if getn(tb_dilog) == 0 then
		Talk(1,"","<color=green>Nh¾c nhë<color>: Xin x¸c nhËn cã mang nÕn!")
		return
	else
		tinsert(tb_dilog,"§Ó ta suy nghÜ l¹i/end_dialog")
	end
	Say("<color=green>Nh¾c nhë<color>: Xin chän nÕn muèn dïng!",
		getn(tb_dilog),
		tb_dilog
	)
end
--À¯ÖòµÄ´´½¨
function bougie_crt(att_seq,bougie_id)
	--×´Ì¬¼ì²â
	if GetMissionV(att_seq + 14) == 0 then
		Talk(1,"","<color=green>Nh¾c nhë<color>: HiÖn"..Tb_Monster_info[3] [att_seq][2].." nÕn ®· th¾p!")
		return
	end
	--ÎïÆ·¼ì²â
	if GetItemCount(2,0,bougie_id) == 0 then
		Talk(1,"","<color=green>Gîi ı <color>: Xin h·y x¸c nhËn b¹n ®· mang theo <color=yellow>"..Tb_Bougie_info[bougie_id][1].."<color>!")
		return
	else
		--ÎïÆ·É¾³ı¼ì²â
		if DelItem(2,0,bougie_id,1) ~= 1 then
			Talk(1,"","<color=green>Gîi ı <color>: Xin h·y x¸c nhËn b¹n ®· mang theo <color=yellow>"..Tb_Bougie_info[bougie_id][1].."<color>!")
			return
		end
	end
	--ÎŞÀ¯ÖòÖòÌ¨É¾³ı
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\""..GetName().."Sö dông "..Tb_Bougie_info[bougie_id][1].."§· th¾p"..Tb_Monster_info[3] [att_seq][2].." nÕn, uy lùc 'Quû T­íng Qu©n' gi¶m bít ("..Tb_Boss_buff_info_3[att_seq][3].."£©£¡\")")
	local candler_index = GetMissionV(18+att_seq)
	SetNpcLifeTime(candler_index,0)
	SetMissionV((18+att_seq),0)
	--npc´´½¨
	public_bougie_crt(att_seq)
	--boss buffÉ¾³ı
	local boss_index = GetMissionV(MS_boss_index)
	for i = 1,getn(Tb_Boss_buff_info_3[att_seq][1]) do
		RemoveStateFromNpc(boss_index,Tb_Boss_buff_info_3[att_seq][1][i][5])
	end
end
--À¯Öò´´½¨º¯Êı
function public_bougie_crt(att_seq)
	local map_id =  SubWorldIdx2ID(SubWorld)
	local npc_index = CreateNpc(Tb_Monster_info[3][att_seq][1],Tb_Monster_info[3][att_seq][2],map_id,Tb_Monster_info[3][att_seq][3],Tb_Monster_info[3][att_seq][4])
	SetNpcScript(npc_index,Main_Npc_Script_way)
	SetNpcActivator(npc_index)
	SetMissionV((10+att_seq),npc_index)
	SetMissionV((14+att_seq),0)			--ËùÓĞÖòÌ¨µÄ³õÊ¼×´Ì¬Îª0
	--×Ô¶¯¿ÛÑªbuffÌí¼Ó
	CastState2Npc(npc_index,Tb_Bougie_buff[1],Tb_Bougie_buff[2],Tb_Bougie_buff[3],Tb_Bougie_buff[4],Tb_Bougie_buff[5])
	--ÌØĞ§¼ÓÈë
	SetCurrentNpcSFX(npc_index,Bougie_burning_SFX_id,2,1)
end

