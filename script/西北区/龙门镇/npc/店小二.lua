-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ÁúÃÅÕòNPCµêĞ¡¶şScript
-- By StarryNight
-- 2007/06/07 PM 4:00

-- ÂÃÓÎÁË£¬Ò»µã¸Ğ¾õ¶¼ÎŞ¡­¡­

--´å³¤2007-12-19Ôö¼ÓÎ÷±±Çø¹Ø¿¨µÚÆß¹Ø
-- ======================================================
-- ÒıÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");
	Npc_name = "<color=green>TiÓu NhŞ<color>: "
function main()

local nStep_XBTask = GetTask(TASK_XB_ID);
local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);

	---------------------------------- Î÷±±ÈÎÎñ02ÇéÀ§¿ÍÕ»----------------------------------
	
	--ÓëµêĞ¡¶ş¶Ô»°Ë÷È¡ĞÑ¾ÆÒ©
	if nStep_XBTask == 6 then
		task_002_02_0();
		return
	end
	
	--ÓëµêĞ¡¶ş¶Ô»°È¡µÃ»òÎ´È¡µÃĞÑ¾ÆÒ©
	if nStep_XBTask == 7 then
		task_002_03_0();
		return
	end
	
	--È¡µÃĞÑ¾ÆÒ©ºóÎ´ÓëËï¶şçö¶Ô»°
	if nStep_XBTask == 8 then
		task_002_03_1();
		return
	end
	
	--Ñ¯ÎÊµêĞ¡¶şĞÑ¾ÆÒ©ÎŞĞ§Ö®ÊÂ
	if nStep_XBTask == 9 then
		task_002_05_0();
		return
	end
	
	--ÉĞÎ´ÓëÅ·Ñô»­¶Ô»°
	if nStep_XBTask == 10 then
		task_002_05_1();
		return
	end
	
	---------------------------------- Î÷±±ÈÎÎñ03´ºÊ®ÈıÄï----------------------------------
	
	--Ñ¯ÎÊ´ºÊ®ÈıÄïÈ¥Ïò
	if nStep_XBTask == 11 then
		task_003_02_0();
		return
	end
	
	--Î´È¡µÃ¶Ç¶µÇ°¶Ô»°
	if nStep_XBTask == 12 then
		task_003_02_1();
		return
	end
	
	---------------------------------- Î÷±±Çø29èÉĞÛÖ®Ñç------------------------------------------
	--È¡µÃÁúÃÅÑçÇë¼í
	if nStep_XBTask_01 == 70 then
		task_29_03_0();
		return
	end
	--»¹Î´»÷°ÜÀîÔªÇì
	if nStep_XBTask_01 >= 71 and Is_stage_sign_time(Tb_stage7_map_list[1]) ~= 0 and GetTask(Tb_stage7_sign_task_info[1]) >=Tb_stage7_sign_task_info[2] then
		local tb_stage7_dia_main ={
			"Ta muèn dù tiÖc/ground_log_in",
			"§iÒu kiÖn dù tiÖc/stage_condition",
			"Nh¾c nhë/stage_clew",
			"Giíi thiÖu yÕn tiÖc Long M«n/stage_backgroud",
			"Rêi khái/end_dilog",
		--	"¹Ø¿¨¿ªÆô/lishi",
			}
		Say(Npc_name..Npc_name.."Ng­êi muèn tæ chøc yÕn tiÖc ®Ó chiªu ®·i cao thñ Trung Nguyªn, g· ®µn «ng mµ bµ chñ ta chê ®îi cuèi cïng còng ®· xuÊt hiÖn!",
		getn(tb_stage7_dia_main),
		tb_stage7_dia_main
		)
	else
		Talk(1,"",Npc_name.."Kh¸ch quan muèn t×m chç trä? Qu¸n trä cña chóng t«i cã thÓ xem lµ tèt nhÊt ë Long M«n trÊn nµy, bëi v× trong tr¨m dÆm quanh ®©y chØ cã duy nhÊt qu¸n trä cña chóng t«i th«i.")
	end
end;
--**************************ÒÔÏÂÎªÎ÷±±Çø¹Ø¿¨´¦Àí****************************
--¹Ø¿¨ĞÅÏ¢
Include("\\script\\lib\\missionfunctions.lua")
--Include("\\script\\missions\\northwest_mission\\zgc_mission_pub_fun.lua")
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı
Include("\\script\\missions\\northwest_mission\\dragon_door_feast\\mission_head.lua")
--³¡µØÑ¡Ôñ
function ground_log_in()
	--PKÖµÏŞ¶¨
	if GetPKValue() > 3 then
		Talk(1,"",Npc_name.."C¸c h¹ s¸t khİ qu¸ nÆng, h·y gi¶m <color=yellow>®iÓm PK<3<color> h·y ®Õn dù tiÖc!")
		return
	end
	--ÒÑ¾­½øÈë¹ıµÄÍæ¼ÒÖ±½Ó½øÈë
	if GetTask(Stage7_date_seq) == zgc_pub_day_turn(1)  then
		local map_saved = GetTask(Stage7_map_id)
		if Is_stage_sign_time(map_saved) ~= 0 then
			log_stage7_deal(map_saved)
		else
			Talk(1,"",Npc_name.."<color=yellow>yÕn tiÖc Long M«n<color> ®· kÕt thóc, <color=green>Lı Nguyªn Kh¸nh<color> ch­a biÕt ngµy nµo sÏ tæ chøc l¹i, lÇn sau h·y ®Õn nhĞ!")
		end
		return
	end
	--ÇëÌûĞ¯´øÅĞ¶Ï
	if GetItemCount(2,0,1037) == 0 then
		Talk(1,"",Npc_name.."Kh¸ch quan ®Õn dù yÕn tiÖc? Xin cho xem thiÖp mêi, ng­êi ®­îc <color=green>Lı Nguyªn Kh¸nh<color> mêi ®Òu cã <color=yellow>thiÖp mêi Long M«n<color>! ")
		return
	end
	--»ñµÃ¿ÕÏĞµØÍ¼
	local free_map_id  = free_map_chk()
	if free_map_id == 0 then
		Talk(1,"",Npc_name.."TiÓu ®iÕm ®óng lµ ®· chiªu ®·i kh«ng chu ®¸o! Kh¸ch dù yÕn tiÖc ®· ®Õn ®ñ, mêi kh¸ch quan lÇn sau h·y ®Õn, xin l­îng thø!")
		return
	else
		local log_in_num = mf_GetMissionV(FEAST_MS_ID,MS_PLAYER_NUM,free_map_id)
		Say(Npc_name.."B¹n ®­îc chuyÓn ®Õn <color=yellow>yÕn tiÖc Long M«n"..(free_map_id - 1105).."<color>, sè ng­êi dù tiÖc hiÖn lµ <color=yellow>"..log_in_num.."<color>, kh¸ch quan muèn vµo kh«ng?",
		2,
		"Ta muèn vµo/#stage7_login("..free_map_id..")",
		"§Ó ta suy nghÜ l¹i/end_dialog"
		)
	end
end
--³¡µØ½øÈë
function stage7_login(map_id)
	--Ğ¡°×²»µÃ²Î¼Ó
	if GetPlayerFaction() == 0 then
		Talk(1,"",Npc_name.."ChØ cã nh©n vËt ®· vµo <color=yellow>l­u ph¸i<color> míi cã thÓ dù tiÖc, ®¼ng cÊp c¸c h¹ ch­a ®ñ! (Nh¾c nhë: ChØ cã nh©n vËt ®· vµo l­u ph¸i míi cã thÓ b¸o danh).")
		return
	end
	--Èç¹ûÊÇ½øÈë¹Ø¿¨³öÀ´µÄÔòÖ±½Ó½øÈë
	local player_num = mf_GetMissionV(FEAST_MS_ID,MS_PLAYER_NUM,map_id) 
	--ÅĞ¶Ï¹Ø¿¨ÊÇ·ñÒÑ¾­½áÊø
	local mis_state = mf_GetMissionV(FEAST_MS_ID,MS_STATE_ID,map_id) 
	if Is_stage_sign_time(map_id) ~= 1 then
			Talk(1,"",Npc_name.."<color=green>Lı Nguyªn Kh¸nh<color> ®¹i nh©n nãi: 'Ng­êi lÒ mÒ l«i th«i kh«ng thÓ lµ hµo kiÖt', buæi tiÖc ®· b¾t ®Çu, kh¸ch quan lÇn sau h·y ®Õn!")
			return
	end
	--ÈËÊıÅĞ¶Ï
	if tonumber(date("%w")) == 5 then
		Stage7_player_num_max = 100
	else
		Stage7_player_num_max = 50
	end
	if  player_num >= Stage7_player_num_max then
		Talk(1,"main",Npc_name.."Xui qu¸! LÇn nµy ta h¬i do dù, ng­¬i xem gióp buæi tiÖc kh¸c cßn chç trèng nµo kh«ng!")
		return
	end
	--ÇëÌûĞ¯´øÅĞ¶Ï
	if GetItemCount(2,0,1037) == 0 then
		Talk(1,"",Npc_name.."Kh¸ch quan ®Õn dù yÕn tiÖc? Xin cho xem thiÖp mêi, ng­êi ®­îc <color=green>Lı Nguyªn Kh¸nh<color> mêi ®Òu cã <color=yellow>thiÖp mêi Long M«n<color>! ")
		return
	end
	if DelItem(2,0,1037,1) ~= 1 then
		Talk(1,"",Npc_name.."Kh¸ch quan ®Õn dù yÕn tiÖc? Xin cho xem thiÖp mêi, ng­êi ®­îc <color=green>Lı Nguyªn Kh¸nh<color> mêi ®Òu cã <color=yellow>thiÖp mêi Long M«n<color>! ")
		return
	end
	mf_SetMissionV(FEAST_MS_ID,MS_PLAYER_NUM,(player_num +1),map_id)				--ÉèÖÃ¹Ø¿¨³õÊ¼µÄ½øÈëÈËÊı
	SetTask(TaskID_feast_prize_step,0)
	SetTask(Stage7_date_seq,zgc_pub_day_turn(1))
	SetTask(Stage7_map_id,map_id)
	WriteLogEx("Yen tiec Long Mon", "tham gia")
	log_stage7_deal(map_id)
end
--½øÈë¹Ø¿¨
function log_stage7_deal(map_id)
	--½øÈë¹Ø¿¨µÄ´¦Àí
	CleanInteractive()
	if NewWorld(map_id,1625,3182) == 1 then
		mf_JoinMission(FEAST_MS_ID,0,map_id)
	end	
end
--´³¹ØÌõ¼ş
function stage_condition()
	Talk(1,"main",Npc_name.."<color=green>Lı Nguyªn Kh¸nh<color> ®¹i nh©n chiªu ®·i cao thñ thiªn h¹ t¹i tiÓu ®iÕm, nÕu c¸c h¹ cã hiÓu lÇm víi <color=green>Lı Nguyªn Kh¸nh<color> h·y ®em <color=green>thiÖp mêi Long M«n<color> cña <color=yellow>Lı ®¹i nh©n<color> ph¸t ®Õn dù tiÖc! (Chó ı: <color=green>Lı Nguyªn Kh¸nh<color> mçi tuÇn ®·i tiÖc ë Long M«n 1 lÇn, h·y mang theo <color=yellow>thiÖp mêi Long M«n<color> ®Õn dù vµo mçi <color=yellow>16:30-16:40 mçi thø 6 vµ thø 7<color>)")
end
--´³¹ØÌáÊ¾
function stage_clew()
	Talk(1,"",Npc_name.."Chê bæ sung")
end
--±³¾°½éÉÜ
function stage_backgroud()
	Talk(1,"main",Npc_name.."<color=green>Lı Nguyªn Kh¸nh<color> ng­êi ®µn «ng bµ chñ chóng t«i chê ®îi cuèi cïng còng xuÊt hiÖn, mÆc dï viÖc giang hå chóng t«i còng İt hái tíi nh­ng <color=green>Lı Nguyªn Kh¸nh<color> lÇn nµy chiªu ®·i c¸c cao thñ Trung Nguyªn nh­ muèn hßa gi¶i chuyÖn NhÊt PhÈm §­êng ®· g©y ra ë Phông T­êng, cho nªn <color=green>Lı Nguyªn Kh¸nh<color> ®· ph¸t thiÖp mêi kh¾p thiªn h¹, ng­êi nhËn ®­îc thiÖp nµy nªn tranh thñ thêi gian ®Õn dù tiÖc!")
end
--µÚÆß¹Ø±¨ÃûÊ±¼äÅĞ¶Ï
function Is_stage_sign_time(map_id)
	local ms_state = mf_GetMissionV(FEAST_MS_ID,MS_STATE_ID,map_id)
	if ms_state == 0 or ms_state == nil then
		return 0
	else
		if mf_GetMissionV(FEAST_MS_ID,MS_TIMMER_LOOP_ID,map_id) < 3060 then
			return 2
		else
			return 1
		end
	end	
end
--¿ÕÏĞ³¡µØÅĞ¶Ï
function free_map_chk()
	local free_map_id = 0
	for i = 1,getn(Tb_stage7_map_list) do
		local ms_state = mf_GetMissionV(FEAST_MS_ID,MS_STATE_ID,Tb_stage7_map_list[i])
		if ms_state ~= 0 and ms_state ~= nil then
			if mf_GetMissionV(FEAST_MS_ID,MS_PLAYER_NUM,Tb_stage7_map_list[i]) < Stage7_player_num_max then
				free_map_id = Tb_stage7_map_list[i]
				break
			end
		end
	end
	return free_map_id
end
