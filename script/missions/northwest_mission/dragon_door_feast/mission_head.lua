--½Å±¾Ãû³Æ£ºÁúÃÅÑçÍ·ÎÄ¼ş
--½Å±¾¹¦ÄÜ£ºÁúÃÅÑç¹«¹²±äÁ¿¼°ÏµÍ³º¯Êı¼¯ºÏ
--²ß»®ÈË£º³Â¹«×Ó
--´úÂë¿ª·¢ÈË£º´å³¤
--´úÂë²âÊÔÈË£ºÑó´Ğ
--´úÂë¿ª·¢Ê±¼ä£º2007-12-23
--´úÂëĞŞ¸Ä¼ÇÂ¼£º
--missionID¶¨Òå
FEAST_MS_ID = 43
--msÖµ¶¨Òå
MS_STATE_ID = 1						--mission×´Ì¬µÄ´æ´¢id
MS_PLAYER_NUM = 2					--´æ·Å½øÈëÍæ¼ÒµÄÊıÁ¿
MS_TIMMER_LOOP_ID = 3			--¼ÆÊ±Æ÷µÄÊıÁ¿´æ·ÅÎ»ÖÃ

feast_time_loop_num = 3660		--¹Ø¿¨×ÜÊ±¼ä£ºÒ»¸öĞ¡Ê±Áã30Ãë
feast_devil_kill_loop_num = 60
feast_prize_get_num = 30
--Ê±¼ä½ø¶ÈÌõ×ÜÊı
feast_timeguage_num = 2

MS_feast_timmer_deputy_loop_ID = 11	--Ñç»á¸±¼ÆÊıID
MS_feast_boss_index = 12			--bossË÷Òı
--MS_feast_boss_life_num = 13	--ÑªÁ¿
Ms_feast_step = 13						--¹Ø¿¨´ó½ø¶È
Ms_feast_deputy_step = 14			--¹Ø¿¨Ğ¡½ø¶È
Ms_feast_forstep_time = 15			--Ç°Ò»½×¶ÎµÄk npc¿ªÊ¼Ê±¼ä
Ms_feast_waste_sec_num = 16 	--Ç°Ò»½×¶ÎK npc ÏûºÄµÄÃëÊı
Ms_feast_devil_kill_num = 17		--É±ËÀĞ¡¹ÖµÄÊıÁ¿

--¹Ø¿¨Ïà¹ØÊ±¼äĞÅÏ¢£ºÖÜÁù-±¨ÃûÊ±¼ä£¨22µã-22µã10·Ö£©
Tb_stage7_sign_time = {6,79200,82860}
	--¹Ø¿¨±¨ÃûĞèÒªµÄÈÎÎñ½ø¶È(taskID,Öµ)
Tb_stage7_sign_task_info = {2031,71} 
--¸ö³¡µØÍæ¼ÒÊıÁ¿ÉÏÏŞ
Stage7_player_num_max = 50
--¹Ø¿¨µØÍ¼ÁĞ±í
Tb_stage7_map_list = {1106,1107}--,1108,1109,1110}
Stage7_date_seq = 1412
Stage7_map_id = 1413
TaskID_feast_prize_step = 1414
--Ê±¼ä½ø¶ÈÌõÊıÁ¿
Timeguge_num = 2
--µÇÂ¼´¥·¢Æ÷ID
Login_trigger_ID = 1111
Trigger_save_ID = 905
--Í¨¹Ø½±Àø(ÊÕ·Ñ£º1£¬Ãâ·Ñ£º2)
Sever_diff = 2			--·şÎñÆ÷Çø·Ö£º1ÎªÊÕ·Ñ£¬2ÎªÃâ·Ñ
Timmer_ID = 72												--¼ÆÊ±Æ÷ID
Frame_per_second = 18								--·şÎñÆ÷Ã¿ÃëÖ¡Êı=18
Timer_interval = 1 * Frame_per_second		--µ÷ÓÃµÄÃëÊı
feast_time_loop_num = 3660						--¹Ø¿¨×ÜÊ±¼ä£ºÒ»¸öĞ¡Ê±Áã30Ãë
feast_boss_life_chk_start_sec = 3060			--¹Ø¿¨½øĞĞÊ±¼ä
feast_boss_life_chk_end_sec = 60				--¹Ø¿¨½áÊøÊ±¼ä
Tb_time_bar_info_main = {
	{feast_time_loop_num,feast_boss_life_chk_start_sec,"Thêi gian b¾t ®Çu d¹ yÕn cßn "},
	{feast_boss_life_chk_start_sec,feast_boss_life_chk_end_sec,"Thêi gian kÕt thóc d¹ yÕn cßn "},
	{feast_boss_life_chk_end_sec,"Thêi gian kÕt thóc d¹ yÕn cßn "},
}
Tb_time_bar_info_denputy = {
	{"Thêi gian ®¸nh b¹i hé vÖ cßn ",feast_devil_kill_loop_num},
	{"Thêi gian tiÕp tôc tû vâ cßn ",feast_prize_get_num},
	{"Thêi gian nhËn th­ëng cßn ",feast_prize_get_num},
}

function OnLogin()
	--×´Ì¬»Ö¸´
	RemoveTrigger(GetTrigger(Trigger_save_ID))
	for i =1,Timeguge_num do
		StopTimeGuage(i)
	end
	--Íæ¼Ò´«³ö
	NewWorld(507,1654,3297)
	--×´Ì¬ÉèÖÃ
	local mission_diff = GetTask(Task_ID_stage_diff)
	LeaveTeam()
	InteractiveEnable(1)
	SetFightState(1)
	ForbidChangePK(0)		--½ûÖ¹×ª»»PK×´Ì¬
	SetPKFlag(0,0)			--PK×´Ì¬	
	SetCreateTeam(0)
	UseScrollEnable(1)		--½ûÖ¹Ê¹ÓÃ»Ø³Ç·û
	ForbitTrade(0)			--½ûÖ¹½»Ò×
	StallEnable(1)				--½ûÖ¹°ÚÌ¯
	SetDeathPunish(1)		--ÎŞËÀÍö³Í·£
	OpenFriendliness(1)	--Ôö¼ÓºÃ¸Ğ¶È	
	if IsPlayerDeath() == 1 then
		RevivePlayer(0)
	end
	RestoreAll()		--È«²¿»Ø¸´
end

