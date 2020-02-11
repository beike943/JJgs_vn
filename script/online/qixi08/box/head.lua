Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\missionfunctions.lua")
Include("\\script\\online\\zgc_public_fun.lua")												--´å³¤µÄ¹«¹²º¯Êý
Include("\\script\\missions\\northwest_mission\\zgc_mission_pub_fun.lua")

--»î¶¯¿ªÆôµÄÈËÊýÏÞÖÆ
Box_player_min = 4
Box_player_max = 10
Map_num_max = 10
Npc_name = "<color=green>§Æc sø §¹i Héi Vâ l©m<color>:"
Box_map_id = 802		--»î¶¯µØÍ¼ID
--TaskID¼ÇÂ¼Çé¿ö
Box_prize_date_seq = 1960
Box_prize_step = 1961
Box_best_prize = 1962
Box_prize_9_times = 1963
Box_prize_get_flag = 1964
Log_in_mapID = 1965
--µ±Ç°¼ÓÔØµÄµØÍ¼ÊýÁ¿
Box_map_loaded = 0

-----------missionÏà¹Ø
MS_ID = 44
Time_trigger_ID = 73
Timer_interval = 18 * 1
--MissionIDÕ¼ÓÃÇé¿ö
MS_LOOP_NUM = 1
MS_BOX_STEP = 2
--npc¼ÇÂ¼Î»ÖÃ
Npc_unit_attitude = 2
--buffÁÐ±í
Tb_jiguan_buff = {
	--ÔÎ   
	"state_vertigo",
	--ÂÒ   
	"state_confusion",
	--Ë¯   
	"state_sleep",
	--¼ÓËÙ100%   
	"state_move_speed_percent_add",
	--¼õËÙ50%   
	"state_slow",
}
Tb_box_num_prize = {
	[1] = 5,
	[2] = 5,
	[3] = 5,
	[4] = 4,
	[5] = 4,
	[6] = 4,
	[7] = 3,
	[8] = 2,
	[9] = 1
}
--´«³ö×ø±ê
Tb_log_out_att = {
	[100] = {1445,2950},
	[200] = {1412,2853},
	[300] = {1776,3541}
}
