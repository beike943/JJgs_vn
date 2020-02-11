--½Å±¾Ãû³Æ£ºÎ÷±±¹Ø¿¨µÚÁù¹Ø
--½Å±¾¹¦ÄÜ£ºµÚÁù¹ØÖ÷Âß¼­
--¹¦ÄÜ²ß»®ÈË£º³Â¹«×Ó
--¹¦ÄÜ¿ª·¢ÈË£º´å³¤
--¹¦ÄÜ²âÊÔÈË£ºÑî´Ï
--´úÂë¿ª·¢Ê±¼ä£º2007-12-13
--´úÂëĞŞ¸ÄÊ±¼ä£º
MS_boss_index = 10				--bossË÷Òı
MS_stage6_boss_life = 11					--bossÑªÁ¿
Ms_stage6_step_boss = 12				--(ÈâµÄµ±Ç°×´Ì¬)
Ms_stage6_step_shandow = 13 		--(»ÃÓ°µÄ×´Ì¬Çé¿ö:0Îªµ±Ç°bossÒÑ¾­ËÀÍö£¬ÆäÓàÎª¸÷¸ö²½ÖèµÄ»ÃÓ°)
Ms_stage6_shandow_index = 14		--»ÃÏóË÷Òı
Ms_stage6_real_box_seq = 15			--Ïä×ÓËæ»úĞòºÅ¼ÇÂ¼ID
Ms_stage6_shandow_crt_loop = 16	--´´½¨»ÃÏóµÄ
Ms_stage6_box_crt_loop = 17			--´´½¨Ïä×Ó
Tb_boss_life_fun_info = {0.9,0.7,0.5,0.3,0.1}
--»ÃÏóµÄĞÅÏ¢
Tb_shadow_info = {
	{"Thèng lÜnh t­îng binhHoanT­îng ","Thèng lÜnh t­îng binhHoanT­îng ",1614,3217},
	{"HuyÕt Ma Nh©nHoan T­îng ","HuyÕt Ma Nh©nHoan T­îng ",1614,3217},
	{"TrÊn mé T­íng qu©nHoan T­îng ","TrÊn mé T­íng qu©nHoan T­îng ",1614,3217},    
	{"TrÊn Mé ThóHoan T­îng ","TrÊn Mé ThóHoan T­îng ",1614,3217},
	{"Quû T­¬ng §ÇuHoan T­îng ","Quû T­¬ng §ÇuHoan T­îng ",1614,3217},
}
--Ïä×ÓºÍÑ°±¦ÈËµÄ×ø±ê
 Tb_box_info = {
	{1620,3206,1629,3225},
	{1624,3245,1601,3252},
	{1581,3243,1574,3223},
	{1583,3199,1600,3194},
 }
 --»ÃÓ°Ã¿10Ãë¿Û³ıµÄÑªÁ¿°Ù·Ö±È
 shadow_reduce_life_per_10s = 0.05

 Tb_stage6_boss_info = {
		{"Sa M¹c Hoan T­îng ¶i 1","Nguyªn h×nh ¶o ¶nh (tÜnh mŞch)",1614,3217},
		{"Sa M¹c Hoan T­îng ¶i 2","Nguyªn h×nh ¶o ¶nh (thÇn)",1614,3217},
	}
  -------------------------------------------ÏµÍ³Âß¼­Çø------------------------------------------
 --µÚÒ»²½£º¹Ø¿¨×¼±¸
 function stage6_ready()
	--É¾³ıÆÆ»Ã¾µ
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"¶i b¾t ®Çu cßn\",30,0,1)")
 end
 --µÚÒ»²½£ºboss´´½¨
 function stage6_boss_crt()
	local boss_diff = 1
	local step_now = GetMissionV(Ms_stage6_step_shandow) 
	if step_now == 5 then
		boss_diff = 2
	end
	--´´½¨boss
	local map_id = SubWorldIdx2ID(SubWorld)
	local boss_index = CreateNpc(Tb_stage6_boss_info[boss_diff][1],Tb_stage6_boss_info[boss_diff][2],map_id,Tb_stage6_boss_info[boss_diff][3],Tb_stage6_boss_info[boss_diff][4])
	SetNpcScript(boss_index,Main_Npc_Script_way)
	SetMissionV(MS_boss_index,boss_index)
	--ÅĞ¶ÏÊÇ·ñÊÇµÚÒ»´ÎË¢³öboss£¬Èç¹û²»ÊÇÔòĞèĞŞ¸ÄÑªÁ¿
	if step_now == 0 or step_now == nil then
		--Ê±¼ä½ø¶ÈÌõÏÔÊ¾ 
		Zgc_pub_mission_fun(MS_ID,"BigDelItem(2,0,1041,BigGetItemCount(2,0,1041))")
		Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"KÕt thóc v­ît ¶i cßn\",1830,0,1)")
		Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"¶o gi¸c xuÊt hiÖn cßn\",30,0,2)")
		local time_loop_num = GetMissionV(MS_TIMMER_LOOP_ID)
		--SetMissionV(Ms_stage6_box_crt_loop,0)
		--µÚÒ»´Î²»Ë¢³ö»ÃÏó£¬ÓÉÏµÍ³µ÷ÓÃË¢³ö
		SetMissionV(Ms_stage6_shandow_crt_loop,-1)
	else
			local life_num = GetMissionV(MS_stage6_boss_life)
			local max_life_num = GetUnitCurStates(boss_index,1)
			local remain_life_num_max = max(life_num,floor(Tb_boss_life_fun_info[step_now]*max_life_num))
			ModifyNpcData(boss_index,0,remain_life_num_max,0)
		if step_now == 5 then
			SetMissionV(Ms_stage6_step_shandow,(step_now + 1))
			NpcChat(boss_index,"C¸c ng­¬i thËt to gan, xem b·o c¸t ®©y!")
			Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"¶o ¶nh sa m¹c hiÖn nguyªn h×nh, cÈn thËn ®èi phã!\")")
		else
			Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"Dïng g­¬ng ¶o ¶nh thµnh c«ng ph¸ hñy ¶o ¶nh, ¶o ¶nh d­êng nh­ ®· hiÖn nguyªn h×nh!\")")
		end
	end
 end
 --Ö÷Âß¼­£¬Ã¿10sµ÷ÓÃÒ»´Î£¬»ù±¾Âß¼­¶¼ÔÚÀïÃæ
 function shadow_reduce_life()
 	local step_now = GetMissionV(Ms_stage6_step_shandow) 
	if step_now > 5 then
		return
	end
	--´´½¨»ÃÏó
	local shandow_crt_loop_num = GetMissionV(Ms_stage6_shandow_crt_loop)
	if shandow_crt_loop_num == 0 then
		stage6_shadow_crt()
	end
	SetMissionV(Ms_stage6_shandow_crt_loop,(shandow_crt_loop_num - 1))
	--´´½¨±¦ÏäºÍ¿ÛÑª
	local box_crt_loop_num = GetMissionV(Ms_stage6_box_crt_loop)
	local shadow_index = GetMissionV(Ms_stage6_shandow_index)
	--ÊÇ·ñÊÇ»ÃÏóÊ±¼ä
	if shadow_index == 0 and shadow_index == nil then
		return
	else
		if mod(box_crt_loop_num,3) == 0  then
			stage6_box_crt()
		end
		SetMissionV(Ms_stage6_box_crt_loop,(box_crt_loop_num - 1))
		--»ÃÏó¿ÛÑª
		local shadow_index = GetMissionV(Ms_stage6_shandow_index)
		if shadow_index == 0 then
			return
		end
		--ÑªÁ¿»ñÈ¡ºÍ¼ÆËã
		local max_life_num,life_num = GetUnitCurStates(shadow_index,1)
		local need_reduce_life = floor(max_life_num * shadow_reduce_life_per_10s)
		if need_reduce_life >= life_num  then
			SetNpcLifeTime(shadow_index,0)
			shadow_recrt()
		else		--¼ÌĞø¿ÛÑª
			ModifyNpcData(shadow_index,0,(life_num - need_reduce_life),0)
		end
	end
 end
 --µÚ¶ş²½£º´´½¨¸÷¸ö»ÃÏó
 function stage6_shadow_crt()
	--ĞÅÏ¢ÌáÊ¾
	local boss_index = GetMissionV(MS_boss_index)
	NpcChat(boss_index,"¶o ¶nh mª hoÆc, c¸c ng­¬i cã thÓ ph¸ ¶nh trong t©m kh«ng? B·o c¸t ®ang kĞo ®Õn!")	
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"¶o ¶nh sa m¹c biÕn hãa qua nh÷ng tr¹ng th¸i kh¸c nhau, xem ra kh«ng dÔ tiªu diÖt.\")")
	Zgc_pub_mission_fun(MS_ID,"StopTimeGuage(2)")
	Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"B¶o r­¬ng xuÊt hiÖn cßn\",30,0,2)")
	--»ÃÏó²½Öè
	local step_now = GetMissionV(Ms_stage6_step_shandow) + 1
	--»ñÈ¡bossĞÅÏ¢
		--Èç¹ûbossÒÑ¾­±»É±ËÀ£¬ÔòÑªÁ¿±£´æÎª0
		SetNpcLifeTime(boss_index,0)
	if GetNpcName(boss_index) ~= Tb_stage6_boss_info[1][2] then
		SetMissionV(MS_stage6_boss_life,0)
	else
		--»ñµÃbossµÄÑªÁ¿
		local max_life_num,life_num = GetUnitCurStates(boss_index,1)
		--ÔÚ´´½¨µÄÊ±ºòÔÙ¶ÔbossÑªÁ¿½øĞĞ´¦Àí
		SetMissionV(MS_stage6_boss_life,life_num)
	end
	--´´½¨»ÃÏó
	local map_id = SubWorldIdx2ID(SubWorld)
	local shadow_index = CreateNpc(Tb_shadow_info[step_now][1],Tb_shadow_info[step_now][2],map_id,Tb_shadow_info[step_now][3],Tb_shadow_info[step_now][4])
 	SetNpcScript(shadow_index,Main_Npc_Script_way)
	SetMissionV(Ms_stage6_step_shandow,step_now)
	SetMissionV(Ms_stage6_shandow_index,shadow_index)
	SetMissionV(Ms_stage6_box_crt_loop,2)
end
--´´½¨Ñ°±¦ÈËºÍ±¦Ïä
function stage6_box_crt()
	--´´½¨Ñ°±¦ÈË
	local map_id =  SubWorldIdx2ID(SubWorld)
	--´´½¨±¦Ïä
	if break_shadow_goods_chk() == 0  then 
		if GetMissionV(Ms_stage6_shandow_index) ~= 0 then
			--Ã»ÓĞÆÆ»Ã¾µ£¬¼ÌĞø´´½¨
			Zgc_pub_mission_fun(MS_ID,"StopTimeGuage(2)")
			Zgc_pub_mission_fun(MS_ID,"StartTimeGuage(\"B¶o r­¬ng xuÊt hiÖn cßn\",30,0,2)")
			--¿ªÊ¼´´½¨
			local box_index = 0
			for i = 1,getn(Tb_box_info) do
				box_index = CreateNpc("Sa m¹c b¶o r­¬ng","Sa m¹c b¶o r­¬ng",map_id,Tb_box_info[i][1],Tb_box_info[i][2])
				SetNpcScript(box_index,Main_Npc_Script_way)
				SetNpcLifeTime(box_index,5)
			end
			--È·ÈÏ¿ªµÚ¼¸¸öÏä×ÓµÄÊ±ºò»ñµÃÆÆ»Ã¾µ
			SetMissionV(Ms_stage6_real_box_seq,random(1,4))
		end
	else
		local npc_index = 0
		for i = 1,getn(Tb_box_info) do
			if stage_devil_restrict() ~= 0 then
				npc_index = CreateNpc("¶i TÇm B¶o Nh©n","TÇm B¶o Nh©n",map_id,(Tb_box_info[i][3]+random(-2,2)),(Tb_box_info[i][4]+random(-2,2)))
				SetNpcScript(npc_index,Main_Npc_Script_way)
			end
		end
	end
end
 --------------------------------------¹«¹²º¯ÊıÇø-------------------------------------
 --»ÃÏó¸´»î
 function shadow_recrt()
	local map_id =  SubWorldIdx2ID(SubWorld)
	local shadow_step = GetMissionV(Ms_stage6_step_shandow)
	local shadow_index = CreateNpc(Tb_shadow_info[shadow_step][1],Tb_shadow_info[shadow_step][2],map_id,Tb_shadow_info[shadow_step][3],Tb_shadow_info[shadow_step][4])
	SetNpcScript(shadow_index,Main_Npc_Script_way)
	SetMissionV(Ms_stage6_shandow_index,shadow_index)
	NpcChat(shadow_index,"Ng­êi bŞ mª hoÆc, rÊt khã ph¸ gi¶i t©m ma.")
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"¶o ¶nh l¹i t¸i sinh, ch­a tiªu diÖt hoµn toµn!\")")
 end
--bossº°»°
 function stage6_boss_chat()
	NpcChat(GetMissionV(MS_boss_index),Stage_info[6].boss_chat[random(1,getn(Stage_info[6].boss_chat))])
 end
 -------------------------------------------ÆäËü´¦ÀíÇø------------------------------------------
 --Ïä×Ó¶Ô»°
 function stage6_box_dialog()
	local box_index = GetTargetNpc()
	--¶Ô»°ÔòÏûÊ§
	SetNpcLifeTime(box_index,0)
	if break_shadow_goods_chk() ~= 0 then
		return
	else
		--ÊÇ·ñÊÇÔö¼Ó¾µ×ÓµÄÏä×Ó
		local box_step = (GetMissionV(Ms_stage6_real_box_seq) - 1)
		if box_step <= 0 then
			if AddItem(2,0,1041,1) == 1 then
				Zgc_pub_mission_fun(MS_ID,"Msg2Player(\""..GetName().."Trong b¶o r­¬ng nhËn ®­îc b¶o vËt g­¬ng ¶o ¶nh dïng ®Ó ph¸ hñy ¶o ¶nh.\")")
				Zgc_pub_mission_fun(MS_ID,"StopTimeGuage(2)")
				SetMissionV(Ms_stage6_real_box_seq,-1)
			end
		else
			SetMissionV(Ms_stage6_real_box_seq,box_step)
		end
	end
 end
 --»ÃÏóËÀÍö
 function stage6_shadow_death(shadow_seq)
	if PlayerIndex ~= break_shadow_goods_chk() then
		shadow_recrt()
	else
		--´´½¨ÏÂÒ»½×¶ÎµÄboss
		BigDelItem(2,0,1041,BigGetItemCount(2,0,1041))
		SetMissionV(Ms_stage6_shandow_index,0)
		SetMissionV(Ms_stage6_shandow_crt_loop,3)
		stage6_boss_crt()
	end
 end
 --bossÔÚ³Á¼Å×´Ì¬ËÀÍö
 function stage6_boss_slience_death()
	SetMissionV(MS_boss_index,0)
 end
 --bossËÀÍö
 function stage6_boss_death()
	--½±Àø¸øÓÚº¯Êı
	--·¢ÏûÏ¢
	Zgc_pub_mission_fun(MS_ID,"Msg2Player(\"Tiªu diÖt '¶o ¶nh Nguyªn H×nh (thÇn)', ®éi ngò v­ît ¶i thµnh c«ng!\")")
	
	local stage_seq = GetMissionV(MS_STATE_DIFF_ID)
	PlayerIndex = GetTeamMember(0)
	if PlayerIndex ~= 0 then
		AddGlobalNews("T¹i"..GetName().."ChiÕn ®Êu gian khæ, cuèi cïng ®¸nh b¹i '¶o ¶nh Nguyªn H×nh (thÇn)', v­ît ¶i thµnh c«ng"..Stage_info[stage_seq].stage_name..".")
	end

	local nMapID = SubWorldIdx2ID(SubWorld)
	ClearMapNpc(nMapID)
	--×¼±¸¹Ø¿¨½áÊø
	local mission_count = GetMapTaskTemp(nMapID,1)
	WriteLog("[¶i T©y B¾c] thèng kª qua ¶i: ID ¶i	"..stage_seq..":"..nMapID..":"..mission_count.."	Thêi gian qua ¶i	"..Zgc_pub_time_sec_change(((189-GetMissionV(MS_TIMMER_LOOP_ID))* 10),1))
	Zgc_pub_mission_fun(MS_ID,"Ms_stage_prize()")
	SetMissionV(MS_TIMMER_LOOP_ID,6)
	--stage_mission_fail(6) 
end
 ------------------------------------------------¹«¹²º¯ÊıÇø--------------------------------------
  --ÊÇ·ñÓĞÍæ¼Ò³ÖÓĞÆÆ»Ã¾µ¼ì²âº¯Êı
 function break_shadow_goods_chk()
	local map_id =  SubWorldIdx2ID(SubWorld)
	local player = mf_GetMSPlayerIndex(MS_ID,0,map_id)
	local player_index_save = PlayerIndex
	for i = 1,getn(player) do
		PlayerIndex = player[i]
		if BigGetItemCount(2,0,1041) ~= 0 then
			PlayerIndex = player_index_save
			return player[i]
		end
	end
	PlayerIndex = player_index_save
	return 0
 end
