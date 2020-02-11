--½Å±¾Ãû³Æ£ºÎ÷±±Çø¹Ø¿¨½øÈëNPC¶Ô»°
--½Å±¾¹¦ÄÜ£º½øÈëNPCµÄÕûºÏ½Å±¾£¬¸ºÔğÏà¹ØµÄ¶Ô»°ÒÔ¼°¹Ø¿¨µÄ¿ªÆôµÈÏà¹Ø¹¦ÄÜ
--²ß»®ÈË£º³Â¹«×Ó
--´úÂë¿ª·¢ÈË£º´å³¤
--´úÂë¿ª·¢Ê±¼ä£º2002-08-30
--´úÂëĞŞ¸Ä¼ÇÂ¼£º
--2008-06-12£ºÔö¼Ó³ÇÊĞ´«ËÍNPCÏà¹ØĞŞ¸Ä£¡
--¹Ø¿¨ĞÅÏ¢
Include("\\script\\lib\\missionfunctions.lua")
Include("\\script\\missions\\northwest_mission\\zgc_mission_pub_fun.lua")
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı
Include("\\script\\missions\\northwest_mission\\mission\\mission_head.lua")
-- ÒıÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\online_activites\\2014_02\\shazhongjin.lua")
--Ö÷¶Ô»°
function main()
	if VET_201402_TASK:GetTask(VET_201402_TASK.TASK) == 2 then
		VET_201402_TASK:SetTask(VET_201402_TASK.TASK, 3);
		Say("B¶o kiÕm l©u l¾m kh«ng sö dông, h·y gióp ta mµi kiÕm, cho ®Õn khi nµo Vµng trong KiÕm táa ¸nh hµo quang ngò.\n<color=gold> tiªu diÖt 333 Sa M¹c Hµnh Nh©n \n tiªu diÖt 555 TÇm B¶o Nh©n <color>", 0);
		TaskTip("Tiªu diÖt 333 Sa M¹c Hµnh Nh©n ");
		TaskTip("Tiªu diÖt 555 TÇm B¶o Nh©n");
		return 
	end
	if VET_201402_TASK:GetTask(VET_201402_TASK.TASK) == 4 then
		VET_201402_TASK:SetTask(VET_201402_TASK.TASK, 5);
		Say("Bän ng­êi c©y lµm ta ngøa m¾t, h·y tiªu diÖt chóng, ta c¶m thÊy vui ta sÏ truyÒn bİ thuËt. \n<color=gold>tiªu diÖt 99 ng­êi c©y<color>", 0);
		TaskTip("Tiªu diÖt 99 ng­êi c©y");
		return 
	end
	local npc_name = GetTargetNpcName()
	local stage_seq = 0
	for i = 1,Stage_count do
		if npc_name == Tb_stage_npc_name[i] then
			stage_seq = i
			break
		end
	end
	if stage_seq == 0 then
		local tb_dialog_city_main = {
			"Ta muèn ®Õn T©y Vùc thÇn bİ/stge_main_city",
			"Mua vËt phÈm thÇn bİ/#Sale(99)",
			"Liªn quan T©y Vùc thÇn bİ/about_mis",
			"Rêi khái/end_dialog",
		}
		Say(Npc_name_city.."Theo ®iÒu tra cña nhiÒu hiÖp sü, ph¸t hiÖn T©y Vùc cã nhiÒu ®éng chøa nhiÒu Kim th¹ch cã thÓ thªm <color=yellow>Linh tİnh<color> cho binh khİ. TriÒu ®×nh còng ®ang b¾t ®Çu coi träng s¸ch l­îc lÊy vâ cøu quèc nªn ph¸i chóng t«i ®Õn ®Ó hç trî c¸c hiÖp sü. Ngoµi ra trªn tay ta ®· thu thËp ®Çy ®ñ vËt phÈm ®Ó c¸c vŞ hiÖp sü sö dông trªn ®­êng kh¸m ph¸ T©y Vùc.",
			getn(tb_dialog_city_main),tb_dialog_city_main
		)
	else
		local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);
		--½«·¨Æ÷ËÍ¸ø°×Ìì³É
		if nStep_XBTask_01 == 65 and npc_name == "B¹ch Thiªn Thµnh" then
			task_023_03_0()
			return
		end
		--Íæ¼Ò¹Ø¿¨Çø·Ö
		local stage_diff = stage_diff_chk(stage_seq)
		SetTask(Task_ID_stage_diff,stage_diff)
		if stage_diff == 0 then
			Talk(1,"",Stage_info[stage_seq].no_task_dialog)
			return
		end
		SetTask(TaskID_miss_login_diff,1)
		SetTask(Task_ID_stage_seq,stage_seq)		--½«¶ÔÓ¦µÄ¹Ø¿¨ĞÅÏ¢±£´æ£¬ÔÚ´ËNPC´¦µÄËùÓĞ
			--¶Ô»°
		Say(Stage_info[stage_seq].main_dialog[stage_diff],
			4,
			Stage_info[stage_seq].log_in_dialog[stage_diff].."/search_ground",
			"§iÒu kiÖn v­ît ¶i/stage_condition",
			Stage_info[stage_seq].stage_name.."Bèi c¶nh/stage_backgroud",
			"Rêi khái/end_dialog"
		)
	end
end
--³ÇÊĞ¹Ø¿¨Ñ¡ÔñÖ÷¶Ô»°
function stge_main_city()
	local stage_name = {}
	for i = 1, Stage_count do
		tinsert(stage_name,Stage_info[i].stage_name.."/#city_stage_sel("..i..")")
	end
	tinsert(stage_name,"trë l¹i/main")
	tinsert(stage_name,"Rêi khái/end_dialog")
	Say(Npc_name_city.."Vµi n¬i ë T©y Vùc ®· ph¸t hiÖn <color=yellow>Kim th¹ch<color>, b¹n muèn ®Õn ®©u ®Ó t×m hiÓu?",
		getn(stage_name),stage_name
	)
end
--³ÇÊĞ¹Ø¿¨Ñ¡¶¨
function city_stage_sel(stage_seq)
	SetTask(TaskID_miss_login_diff,2)
	SetTask(Task_ID_stage_diff,2)
	SetTask(Task_ID_stage_seq,stage_seq)
	search_ground()
end
--³ÇÊĞ¹Ø¿¨ĞÅÏ¢
function about_mis()
	Say(Npc_name_city.."NhiÒu hiÖp sü §¹i Tèng ph¸t hiÖn <color=yellow>Kim th¹ch<color> ë vïng ®Êt thÇn bİ T©y Vùc, ®­îc biÕt <color=green>Long Quang Ch©n Nh©n<color> cã thÓ sö dông Kim th¹ch ®Ó lµm to¸t lªn <color=yellow>Hµo quang<color> cña binh khİ, thËm chİ cã gäi ra <color=yellow>Linh tİnh<color> cña binh khİ. Vâ l©m nh©n sü ïn ïn kĞo ®Õn T©y Vùc ®Ó kh¸m ph¸ l¹i thªm viÖc T©y H¹ kh«ng chŞu nghŞ hßa bao phen x©m ph¹m biªn giíi n­íc ta, triÒu ®×nh ph¸i ta mang tin tøc ®Õn gióp ®ì c¸c vŞ hiÖp sü.",
		2,
		"trë l¹i/main",
		"Rêi khái/end_dialog"
	)
end
--¿ÉÓÃ³¡µØ¶Ô»°
function search_ground()
	--¶Ô»°Éú³É
	local stage_diff = GetTask(Task_ID_stage_diff)
	local stage_seq = GetTask(Task_ID_stage_seq)
	local login_diff = GetTask(TaskID_miss_login_diff)
	local tb_dialog = {}
	local team_total = 0
	local map_total = getn(Stage_info[stage_seq].map[login_diff])
	for i = 1, map_total do
		if mf_GetMissionV(MS_ID,MS_STATE_ID,Stage_info[stage_seq].map[login_diff][i]) == 0 then
			tinsert(tb_dialog,Stage_info[stage_seq].stage_name.."["..i.."(Tr¹ng th¸i: Trèng)/#log_stageg("..Stage_info[stage_seq].map[login_diff][i]..")")
		else
			tinsert(tb_dialog,Stage_info[stage_seq].stage_name.."["..i.."(Tr¹ng th¸i: ChiÕm dông)/cannot_log")
			team_total = team_total + 1
		end
	end
	if team_total < map_total then
		local dialog_main = Stage_info[stage_seq].ground_sel_dialog[stage_diff][1]
		if login_diff == 2 then
			dialog_main = Stage_info.city_mis_dia_main[stage_seq]
			tinsert(tb_dialog,"Kh¸m ph¸"..Stage_info[stage_seq].stage_name.."§iÒu kiÖn/stage_condition")
			tinsert(tb_dialog,"Kh¸m ph¸"..Stage_info[stage_seq].stage_name.."nh¾c nhë/stage_login_clew")
		end	
		tinsert(tb_dialog,"trë l¹i/main")
		tinsert(tb_dialog,"Rêi khái/end_dialog")
		Say(dialog_main.."(<color=yellow>Nh¾c nhë: khi vµo trËn sÏ vøt bá thó c­ng trªn ng­êi cña nh©n vËt<color>)",
			getn(tb_dialog),
			tb_dialog
			)
	else
		local dialog_main = Stage_info[stage_seq].ground_sel_dialog[stage_diff][2]
		if login_diff == 2 then
			dialog_main = Npc_name_city.."§· cã hµo kiÖt kh¸c ®ang v­ît ¶i, h·y quay l¹i sau!"
		end	
		Talk(1,"",Stage_info[stage_seq].ground_sel_dialog[stage_diff][2])
	end
end
--µÇÂ¼¹Ø¿¨µÄ²Ù×÷
function log_stageg(map_id)
	local stage_seq = GetTask(Task_ID_stage_seq)
	local stage_diff = GetTask(Task_ID_stage_diff)
	local login_diff = GetTask(TaskID_miss_login_diff)
	
	local npc_name = Stage_info[stage_seq].npc_name
	if login_diff == 2 then
		npc_name = Npc_name_city
	end
	--µÇÂ¼Ìõ¼ş¼ì²â
	--×é¶Ó¼ì²â
	if Mission_team_chk(1,3,5) ~= 1 then
		local dialog_main = Stage_info[stage_seq].cannot_log_reason[stage_diff][1]
		if login_diff == 2 then
			dialog_main = Stage_info[stage_seq].cannot_log_reason[3][1]
		end		
		Talk(1,"",dialog_main)
		return
	end
	--¶ÓÎé³ÉÔ±ÈÎÎñ²½Öè¼ì²â
	if stage_diff ~= 2 then
		local unlogin_player = team_mission_step_chk() 
		if unlogin_player ~= "none" then
			local dialog_main = Stage_info[stage_seq].cannot_log_reason[stage_diff][3]
			if login_diff == 2 then
				dialog_main = Stage_info[stage_seq].cannot_log_reason[3][3]
			end	
			Talk(1,"",dialog_main.."\n    Tæ ®éi kh«ng phï hîp ®iÒu kiÖn nhiÖm vô: <color=yellow>"..unlogin_player.."<color>")
			Zgc_pub_mission_team_msg(unlogin_player.."Ch­a ®Õn b­íc nhiÖm vô kÕ tiÕp, kh«ng thÓ vµo ¶i!")
			return
		end
	end
	--Ö°ÒµÖØ¸´¼ì²â
	if mission_route_chk() ~= 1 then
		local dialog_main = Stage_info[stage_seq].cannot_log_reason[stage_diff][4]
		if login_diff == 2 then
			dialog_main =Stage_info[stage_seq].cannot_log_reason[3][4]
		end	
		Talk(1,"",dialog_main)
		return
	end
	--PKÖµµÄ¼ì²â
	local pk_chk_player = mission_pk_chk()
	if pk_chk_player ~= "none" then
		Talk(1,"",npc_name.."Trong ®éi cã thµnh viªn cã trŞ PK lín h¬n <color=yellow>"..Mission_PK_max.."<color>, h·y xãa trŞ PK råi quay l¹i v­ît ¶i.\n    Tæ ®éi kh«ng ®ñ ®iÒu kiÖn: <color=yellow>"..pk_chk_player.."<color>")
		Zgc_pub_mission_team_msg(pk_chk_player.."PK v­ît qu¸ "..Mission_PK_max..", kh«ng thÓ v­ît ¶i!")
		return
	end
	--Íê³É´ÎÊı¼ì²â
	local week_login_chk = misssion_week_times_chk()
	if week_login_chk ~= "none" then
		Talk(1,"",npc_name.."Trong ®éi cã thµnh viªn v­ît qu¸ giíi h¹n <color=yellow>"..Mission_login_times_per_week.."<color> lÇn v­ît ¶i cña tuÇn.\n    Tæ ®éi kh«ng ®ñ ®iÒu kiÖn: <color=yellow>"..week_login_chk.."<color>")
		Zgc_pub_mission_team_msg(week_login_chk.."Sè lÇn v­ît ¶i tuÇn nµy v­ît qu¸"..Mission_login_times_per_week..", kh«ng thÓ v­ît ¶i!")
		return
	end
	--ÊÇ·ñÔÚÍ¬Ò»µØÍ¼¼ì²â
	if Zgc_pub_missio_same_map_chk() ~= 1 then
		Talk(1,"",npc_name.."Muèn ®­a ®éi vµ m×nh cïng vµo ph¶i ®­a ®éi cña ng­¬i ®Õn chç ta!")
		return
	end
	--Íæ¼ÒµÈ¼¶¼ì²â
	local level_chk_player = player_level_chk()
	if  level_chk_player ~= "none" then
		local dialog_main = Stage_info[stage_seq].cannot_log_reason[stage_diff][1]
		if login_diff == 2 then
			dialog_main = Stage_info[stage_seq].cannot_log_reason[3][1]
		end		
		Talk(1,"",dialog_main.."\n    Tæ ®éi kh«ng phï hîp ®iÒu kiÖn: <color=yellow>"..level_chk_player.."<color>")
		Zgc_pub_mission_team_msg(level_chk_player.."Ch­a ®¹t cÊp "..Stage_player_level_min..", kh«ng thÓ vµo ¶i!")
		return
	end
	--¹Ø¿¨ÊÇ·ñ±»Õ¼ÓÃ¼ì²â
	if mf_GetMissionV(MS_ID,MS_STATE_ID,map_id) == 1 then
		cannot_log()
		return
	end
	--¶ÓÎéÖĞÍê³É¹Ø¿¨µÄÍæ¼Ò½øĞĞÃÅÆ±¼ì²â
	if mission_goods_chk() ~= 1 then
		local dialog_main = Stage_info[stage_seq].cannot_log_reason[stage_diff][2]
		if login_diff == 2 then
			dialog_main =Stage_info[stage_seq].cannot_log_reason[3][2]
		end	
		Talk(1,"",dialog_main)
		return
	end
	--stage¹Ø¿¨
	if mf_OpenMission(MS_ID,map_id) ~= 1 then
		cannot_log()
		return
	end
	--missionÏà¹Ø²Ù×÷
	mf_SetMissionV(MS_ID,MS_PLAYER_NUM,GetTeamSize(),map_id)				--ÉèÖÃ¹Ø¿¨³õÊ¼µÄ½øÈëÈËÊı
	mf_SetMissionV(MS_ID,MS_STATE_DIFF_ID,stage_seq,map_id)					--µ±Ç°¹Ø¿¨ÊÇµÚ¼¸¹Ø
	if stage_seq == 5 then
		mf_SetMissionV(MS_ID,MS_BOSS_KILL_NUM,0,map_id)
	end
	mf_SetMissionV(MS_ID,MS_STATE_ID,MS_state_wait_start,map_id)			--¹Ø¿¨×´Ì¬ÉèÖÃÎªµÈ´ı¿ªÊ¼
	mf_SetMissionV(MS_ID,MS_DIFF,stage_diff,map_id)										--¹Ø¿¨ÀàĞÍ£º1Îª¼òµ¥£¬2Îª¸´ÔÓ
	--ÉèÖÃµÇÂ¼µØµã
	local player_route_str = ""
	for i = 1,GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		player_route_str = player_route_str..GetPlayerRoute().."	"
	end
	SetMapTaskTemp(map_id,1,(GetMapTaskTemp(map_id,1) +1))
	local mission_count = GetMapTaskTemp(map_id,1)
	WriteLog("[¶i T©y B¾c]Thèng kª ®¨ng nhËp: ID ¶i	"..stage_seq..":"..map_id..":"..mission_count.."	Sè ng­êi ch¬i	"..GetTeamSize().."	Tªn ®éi tr­ëng: 	"..GetName().."	M· hÖ ph¸i ng­êi ch¬i	"..player_route_str.."")
	--¹Ø¿¨¿ªÊ¼º¯Êı
	for i = 1,GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		SetFightState(1)
		SetTask(Task_ID_stage_diff,stage_diff)
		SetTask(Task_ID_stage_seq,stage_seq)
		SetTask(TaskID_miss_login_diff,login_diff)
		mf_JoinMission(MS_ID,0,map_id)
		NewWorld(map_id,Stage_info[stage_seq].in_coordinate[1],Stage_info[stage_seq].in_coordinate[2])
		WriteLogEx("Vuot ai Tay Vuc", "tham gia")
	end
	PlayerIndex = player_index_save
end
--¹Ø¿¨·±Ã¦×´Ì¬µÄ¶Ô»°
function cannot_log()
	local stage_seq = GetTask(Task_ID_stage_seq)
	
	local login_diff = GetTask(TaskID_miss_login_diff)
	local npc_name = Stage_info[stage_seq].npc_name
	if login_diff == 2 then
		npc_name = Npc_name_city
	end
	Talk(1,"search_ground",npc_name.."§­êng nµy ®· cã hµo kiÖt ®i, sao kh«ng chän con ®­êng kh¸c?")
end
--´³¹ØÌõ¼ş
function stage_condition()
	local stage_seq = GetTask(Task_ID_stage_seq)
	local stage_diff = GetTask(Task_ID_stage_diff)
	
	local login_diff = GetTask(TaskID_miss_login_diff)
	local dialog_main = Stage_info[stage_seq].stage_condition[stage_diff]

	--´³¹ØÌõ¼şÉú³É
	if stage_diff ~= 1 then
		dialog_main = "\n    . Do <color=yellow> ®éi tr­ëng dÉn ®Çu tæ ®éi 3-5 ng­êi<color> ®Õn, tÊt c¶ thµnh viªn ph¶i ®¹t ®Õn cÊp <color=yellow>"..Stage_player_level_min.."<color> cÊp."
		local npc_name = Stage_info[stage_seq].npc_name
		if login_diff == 2 then
			npc_name = Npc_name_city
		end
		dialog_main = npc_name..Stage_info.stage_condition_main_dialog[stage_seq]..dialog_main
		if getn(Stage_info[stage_seq].task_goods[2] ) ~= 0 then
			local task_goods_need = "\n    . §éi tr­ëng ph¶i mang theo <color=yellow>"
			for i = 1,getn(Stage_info[stage_seq].task_goods[2]) do
				if i > 1 then
					task_goods_need = task_goods_need..","
				end
				task_goods_need = task_goods_need..Stage_info[stage_seq].task_goods[2][i][5]
			end
			dialog_main = dialog_main..task_goods_need.."<color>"
		end
		dialog_main = dialog_main.."\n    . Trong ®éi <color=yellow>kh«ng ®­îc cã ng­êi vâ c«ng l­u ph¸i gièng nhau<color>."
		dialog_main = dialog_main.."\n    . Trong tæ ®éi mçi tuÇn mçi ng­êi v­ît ¶i kh«ng thÓ v­ît qu¸ <color=yellow>"..Mission_login_times_per_week.."<color> lÇn."
		dialog_main = dialog_main.."\n    . Thµnh viªn trong ®éi <color=yellow>trŞ PK<color> kh«ng thÓ v­ît qu¸ <color=yellow>"..Mission_PK_max.."<color>."
	end
	Talk(1,"search_ground",dialog_main)
end
--¹Ø¿¨±³¾°½éÉÜ
function stage_backgroud()
	local stage_diff = GetTask(Task_ID_stage_diff)
	local stage_seq = GetTask(Task_ID_stage_seq)
	Say(Stage_info[stage_seq].stage_background[stage_diff],
	2,
	"trë l¹i/main",
	"Rêi khái/end_dialog"
	)	
end
--´³¹ØÌáÊ¾
function stage_login_clew()
	local login_diff = GetTask(TaskID_miss_login_diff)
	local stage_seq = GetTask(Task_ID_stage_seq)
	local npc_name = Stage_info[stage_seq].npc_name
	if login_diff == 2 then
		npc_name = Npc_name_city
	end
	Talk(1,"search_ground",npc_name..Stage_info.stage_login_clew[stage_seq])
end
--=============¹«¹²º¯Êı¶¨ÒåÇø
--Íæ¼ÒÈÎÎñ²½Öè¼ì²â
function stage_diff_chk(stage_seq)
	if GetTask(Stage_info[stage_seq].task_ID[1]) == Stage_info[stage_seq].task_ID[2] then
		return 1
	else
		return 2
	end
end
--¼ì²âÊÇ·ñ¿ªÆôÆÕÍ¨¹Ø¿¨»¹ÊÇ¸´ÔÓ¹Ø¿¨
function team_mission_step_chk()			--ÔİÊ±¶¨ÎªÖ»¿ªÊ¼ÆÕÍ¨¹Ø¿¨
	local stage_seq = GetTask(Task_ID_stage_seq)
	local stage_diff  = GetTask(Task_ID_stage_diff)
	local player_index_save = PlayerIndex
	local chk_flag = 2
	local player_stage_diff = 0
	local player_unlogin_name = ""
	--¶ÓÄÚ³ÉÔ±ÅĞ¶Ï
	for i = 1,GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if stage_diff == 1 and GetTask(Stage_info[stage_seq].task_ID[1]) <  Stage_info[stage_seq].task_ID[2] then
			player_unlogin_name = player_unlogin_name.." "..GetName()
			Talk(1,"","<color=green>Nh¾c nhë<color>: B¹n ch­a hoµn thµnh nhiÖm vô tr­íc, kh«ng thÓ vµo ¶i!")
		end
	end
	PlayerIndex = player_index_save
	if player_unlogin_name == "" then
		return "none"
	else
		return player_unlogin_name
	end
end
--¼ì²â¹Ø¿¨ËùĞèÒªµÄÈÎÎñÎïÆ·
function mission_goods_chk()
	local stage_seq = GetTask(Task_ID_stage_seq)
	local stage_diff = GetTask(Task_ID_stage_diff)
	local task_goods_num = getn(Stage_info[stage_seq].task_goods[stage_diff])
	if task_goods_num == 0 then
		return 1
	else
		for i = 1,task_goods_num do
			if GetItemCount(Stage_info[stage_seq].task_goods[stage_diff][i][1],Stage_info[stage_seq].task_goods[stage_diff][i][2],Stage_info[stage_seq].task_goods[stage_diff][i][3]) < Stage_info[stage_seq].task_goods[stage_diff][i][4] then
				return 0
			end
		end
		if stage_diff == 2 then
			local del_flag = 1
			for i = 1,task_goods_num do
				del_flag = del_flag * DelItem(Stage_info[stage_seq].task_goods[stage_diff][i][1],Stage_info[stage_seq].task_goods[stage_diff][i][2],Stage_info[stage_seq].task_goods[stage_diff][i][3],Stage_info[stage_seq].task_goods[stage_diff][i][4])
			end
			return del_flag
		else
			return 1
		end
	end
end
--¶ÓÎéÈÎÎñ¼ì²â
function Mission_team_chk(captain_flag,member_min,memeber_max)
	--¶ÓÎé³ÉÔ±ÊıÁ¿¼ì²â
	local team_member = GetTeamSize()
	if team_member < member_min or team_member > memeber_max then
		return 0
	end
	--¶Ó³¤¼ì²â
	if captain_flag == 1 and GetTeamMember(0) ~= PlayerIndex then
		return 0
	end
	return 1
end
--Ö°ÒµÖØ¸´¼ì²â
function mission_route_chk()
	local tb_palyer_route = {}
	local player_route = 0
	local player_index_save = PlayerIndex
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		player_route = GetPlayerRoute()
		if getn(tb_palyer_route) ~= 0 then
			for i = 1,getn(tb_palyer_route) do
				if player_route == tb_palyer_route[i] then
					PlayerIndex = player_index_save
					return 0
				end
			end
		end
		tinsert(tb_palyer_route,player_route)
	end
	PlayerIndex = player_index_save
	return 1
end
--PKÖµ¼ì²â
function mission_pk_chk()
	local player_index_save = PlayerIndex
	local pk_chk_name = ""
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetPKValue() > Mission_PK_max then
			pk_chk_name = pk_chk_name.." "..GetName()
			Talk(1,"","<color=green>Nh¾c nhë<color>: TrŞ PK cña b¹n v­ît qu¸ <color=yellow>"..Mission_PK_max.."<color>, kh«ng thÓ vµo ¶i!")
		end
	end
	PlayerIndex = player_index_save
	if pk_chk_name == "" then
		return "none"
	else
		return pk_chk_name
	end
end
--Ã¿ÖÜ½øÈë¹Ø¿¨µÄ´ÎÊıÏŞÖÆ
function misssion_week_times_chk()
	local player_index_save = PlayerIndex
	local mis_times_name = ""
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetTask(Mission_week_seq_TaskID) ==Zgc_pub_week_seq()  and GetTask(Mission_login_times_TaskID) >= Mission_login_times_per_week then
			mis_times_name = mis_times_name.." "..GetName()
			Talk(1,"","<color=green>Nh¾c nhë<color>: B¹n ®· v­ît ¶i <color=yellow>"..Mission_login_times_per_week.."<color> lÇn, v­ît qu¸ sè lÇn tèi ®a!")
		end
	end
	PlayerIndex = player_index_save
	if mis_times_name == "" then
		return "none"
	else
		return mis_times_name
	end
end
--Íæ¼ÒµÈ¼¶ÏŞÖÆ
function player_level_chk()
	local player_index_save = PlayerIndex
	local mis_level_name = ""
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetLevel() < Stage_player_level_min  then
			mis_level_name = mis_level_name.." "..GetName()
			Talk(1,"","<color=green>Nh¾c nhë<color>: §¼ng cÊp nhá h¬n <color=yellow>"..Stage_player_level_min.."<color>, kh«ng thÓ vµo ¶i!")
		end
	end
	PlayerIndex = player_index_save
	if mis_level_name == "" then
		return "none"
	else
		return mis_level_name
	end	
end
--³ÇÊĞ½øÈë¹Ø¿¨Ê±µÄÏà¹ØÌáÊ¾ĞŞ¸Ä
function dialog_main_sub(sub_str,stage_seq)
	return Npc_name_city..(strsub(sub_str,(strlen(Stage_info[stage_seq].npc_name)+1),strlen(sub_str)))
end
