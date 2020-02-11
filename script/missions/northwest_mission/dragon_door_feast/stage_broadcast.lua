--½Å±¾Ãû³Æ£ºÁúÃÅÑçÊ±¼äµ÷ÓÃ½Å±¾
--½Å±¾¹¦ÄÜ£º·şÎñÆ÷ÏûÏ¢£¬¹Ø¿¨¿ªÆô
--¹¦ÄÜ²ß»®ÈË£º³Â¹«×Ó
--¹¦ÄÜ¿ª·¢ÈË£º´å³¤
--¹¦ÄÜ²âÊÔÈË£ºÑó´Ğ
--´úÂë¿ª·¢Ê±¼ä£º2007-12-23
--´úÂëĞŞ¸Ä¼ÇÂ¼£º
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\lib\\missionfunctions.lua")
Include("\\script\\missions\\northwest_mission\\zgc_mission_pub_fun.lua")
Include("\\script\\missions\\northwest_mission\\dragon_door_feast\\mission_head.lua")

Tb_boss_info = 	{"Lı Nguyªn Kh¸nh","Lı Nguyªn Kh¸nh",1651,3149,"\\script\\missions\\northwest_mission\\\dragon_door_feast\\stage_main.lua"}

function main()
	if Zgc_pub_week_day() ~= 6 and Zgc_pub_week_day() ~= 5 then
		return
	end
	if SubWorldID2Idx(507) == -1 then
		return
	end
	--¿ªÆô¹Ø¿¨£º
	for i = 1,getn(Tb_stage7_map_list) do
		local mis_state = mf_GetMissionV(FEAST_MS_ID,MS_STATE_ID,Tb_stage7_map_list[i])
		if mis_state == nil or  mis_state == 0 then
			if mf_OpenMission(FEAST_MS_ID,Tb_stage7_map_list[i])	== 1 then									--¿ªÆô¹Ø¿¨
				--boss´¦Àí
				local boss_index = CreateNpc(Tb_boss_info[1],Tb_boss_info[2],Tb_stage7_map_list[i],Tb_boss_info[3],Tb_boss_info[4])
				SetNpcScript(boss_index,Tb_boss_info[5])
				AddUnitStates(boss_index,7,0)
				ChangeNpcToFight(boss_index,0,6)
				--ÏµÍ³´¦Àí
				mf_SetMissionV(FEAST_MS_ID,MS_STATE_ID,1,Tb_stage7_map_list[i])
				mf_SetMissionV(FEAST_MS_ID,MS_feast_boss_index,boss_index,Tb_stage7_map_list[i])
				mf_SetMissionV(FEAST_MS_ID,MS_PLAYER_NUM,0,Tb_stage7_map_list[i])
				mf_SetMissionV(FEAST_MS_ID,Ms_feast_step,1,Tb_stage7_map_list[i])
			end
		end
	end
	AddGlobalNews("(Thiªn lı truyÒn ©m) Lı Nguyªn Kh¸nh: T¹i h¹ cã më mét buæi tiÖc t¹i qu¸n trä Long M«n trÊn chiªu ®·i vâ l©m hµo kiÖt §¹i Tèng, rÊt mong c¸c vŞ ®¹i hiÖp cÇm 'ThiÖp Long M«n YÕn' ®Õn tham dù.")
end
