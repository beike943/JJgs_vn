--½Å±¾Ãû³Æ£ºmission¹«¹²º¯Êı¼¯ºÏ
--½Å±¾¹¦ÄÜ£º½«mission³£ÓÃµÄº¯ÊıÕûÀíÎª¹«¹²º¯Êı£¬±ãÓÚÊ¹ÓÃ
--²ß»®ÈË£º´å³¤
--´úÂë¿ª·¢ÈË£º´å³¤
--´úÂë¿ª·¢¼ÇÂ¼£º2008-08-06
--´úÂëĞŞ¸Ä¼ÇÂ¼£º
--±¸×¢£ºÎÒ´æÔÚ£¬¹ÊÎÒË§£¡
--º¯ÊıÃû³Æ£º¹Ø¿¨¶ÓÎé¼ì²âº¯Êı
--º¯Êı¹¦ÄÜ£ºÍ¨¹ı´«ÈëµÄÌõ¼ş£¬¼ì²â¹Ø¿¨µÄ±¨Ãû¶ÓÎéÊÇ·ñ·ûºÏÌõ¼ş
function Zgc_pub_mission_team_chk(captain_flag,member_min,memeber_max,npc_name)
	--¶ÓÎé³ÉÔ±ÊıÁ¿¼ì²â
	local team_member = GetTeamSize()
	if team_member < member_min or team_member > memeber_max then
		Talk(1,"",npc_name.."Sè l­îng ng­êi ch¬i quy ®Şnh: <color=yellow>"..member_min.."<color> ®Õn <color=yellow>"..memeber_max.."<color> ng­êi!")
		return 0
	end
	--¶Ó³¤¼ì²â
	if captain_flag == 1 and GetTeamMember(0) ~= PlayerIndex then
		Talk(1,"",npc_name.."¶i nµy ph¶i do <color=yellow>®éi tr­ëng<color> hoµn thµnh!")
		return 0
	end
	return 1
end

--º¯ÊıÃû³Æ£º¶ÓÎé³ÉÔ±Ö°Òµ¼ì²â
--º¯Êı¹¦ÄÜ£ºÅĞ¶Ï¸Ã¶ÓÎéÖĞÊÇ·ñÓĞÖØ¸´µÄÖ°Òµ
function Zgc_pub_mission_route_chk(npc_name)
	local tb_player_route = {}
	local player_route = 0
	local player_index_save = PlayerIndex
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		player_route = GetPlayerRoute()
		if getn(tb_player_route) ~= 0 then
			for i = 1,getn(tb_player_route) do
				if player_route == tb_player_route[i] then
					PlayerIndex = player_index_save
					Talk(1,"",npc_name.."¶i nµy <color=yellow>kh«ng cho phĞp<color> ng­êi trong tæ ®éi thùc hiÖn l¹i!")
					return 0
				end
			end
		end
		tinsert(tb_player_route,player_route)
	end
	PlayerIndex = player_index_save
	return 1
end

--º¯ÊıÃû³Æ£º¶ÓÎéÏûÏ¢
--º¯Êı¹¦ÄÜ£ºÏòÒ»¸ö¶ÓÎéµÄËùÓĞ³ÉÔ±·¢ËÍÏûÏ¢
function Zgc_pub_mission_team_msg(msg_content)
	local player_index_save = PlayerIndex
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		Msg2Player(msg_content)
	end
	PlayerIndex = player_index_save
	return
end

--º¯ÊıÃû³Æ£ºĞŞ¸ÄnpcÑªÁ¿
--º¯Êı¹¦ÄÜ£º°´°Ù·Ö±È»òÊıÖµĞŞ¸ÄbossÑªÁ¿
function Zgc_pub_mission_boss_life_chg(boss_index,chg_flag,chg_num)
	--chg_flagÎª0±íÊ¾°´ÊıÖµ£¬chg_flagÎª1±íÊ¾°´°Ù·Ö±È
	--Èç¹û·µ»ØÖµÎª1±íÊ¾Õı³£Ö´ĞĞ£¬Èç¹û·µ»ØÖµÎª-1Ôò±íÊ¾boss¿ÛÑªÖÂËÀ
	--»ñµÃbossµÄÑªÁ¿
	local max_life_num,life_num = GetUnitCurStates(boss_index,1)
	if chg_flag == 0 then
		life_num = (life_num + chg_num)
	else
		life_num = floor(life_num + (max_life_num * (chg_num/100)))
	end
	--Èç¹û³¬¹ıÉúÃü×î´óÖµ¾ÍÉèÖÃÎªÉúÃü×î´óÖµ
	if life_num > max_life_num then
		life_num = max_life_num
	end
	if life_num <= 0 then
		--SetNpcLifeTime(boss_index,0)
		return -1
	else
		ModifyNpcData(boss_index,0,life_num,0)
		return 1
	end
end

--º¯ÊıÃû³Æ£ºmissionÏûÏ¢
--º¯Êı¹¦ÄÜ£ºÏòÕû¸ömissionµÄÍæ¼Ò·¢ÏûÏ¢
function Zgc_pub_mission_message(MS_ID,msg_content)
	local map_id =  SubWorldIdx2ID(SubWorld)
	local player = mf_GetMSPlayerIndex(MS_ID,0,map_id)
	for i = 1, getn(player) do
		PlayerIndex = player[i]
		Msg2Player(msg_content)
	end
end
--º¯ÊıÃû³Æ£ºmissionÍ³Ò»Ö´ĞĞº¯Êı
--º¯Êı¹¦ÄÜ£ºÕû¸ömissionµÄËùÓĞÍæ¼ÒÖ´ĞĞ´«ÈëµÄº¯Êı
function Zgc_pub_mission_fun(MS_ID,deal_order)
	local nMapID = SubWorldIdx2ID(SubWorld)
	local player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	local player_index_save = PlayerIndex
		for i = 1, getn(player) do
		PlayerIndex = player[i]
		dostring(deal_order)
	end
	PlayerIndex = player_index_save
end
--º¯ÊıÃû³Æ£º¶ÓÎéËùÓĞ³ÉÔ±ÊÇ·ñÔÚÍ³Ò»µØÍ¼ÅĞ¶Ï
--º¯Êı¹¦ÄÜ£ºÅĞ¶Ï¸Ä¶ÓÎéµÄËùÓĞ³ÉÔ±ÊÇ·ñÔÚÍ¬Ò»µØÍ¼£¬Èç¹ûÊÇ·µ»Ø1·ñÔò·µ»Ø0
function Zgc_pub_missio_same_map_chk()
	local map_ID = GetWorldPos()
	local player_index_save = PlayerIndex
	local chk_flag = 1
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		local map_ID_temp = GetWorldPos()
		if map_ID ~= map_ID_temp then
			chk_flag = 0
			break
		end
	end
	PlayerIndex = player_index_save
	return chk_flag
end
--º¯ÊıÃû³Æ£ºmissionËùÓĞ³ÉÔ±¿ªÆôÊ±¼ä½ø¶ÈÌõ
--º¯Êı¹¦ÄÜ£º¸ù¾İÊ±¼ä½ø¶ÈÌõĞèÒªµÄĞÅÏ¢´«Èëºó½«¸ÃmisssionËùÓĞ³ÉÔ±¿ªÆô¸ÄÊ±¼ä½ø¶ÈÌõ
function Zgc_pub_mission_starttimeguage(MS_ID,timeguage_content,second_num,repeat_flag,timeguage_id)
	local map_id =  SubWorldIdx2ID(SubWorld)
	local player = mf_GetMSPlayerIndex(MS_ID,0,map_id)
	for i = 1, getn(player) do
		PlayerIndex = player[i]
		StopTimeGuage(timeguage_id)
		StartTimeGuage(timeguage_content,second_num,repeat_flag,timeguage_id)
	end
end
--º¯ÊıÃû³Æ£ºmissionËùÓĞ³ÉÔ±¹Ø±ÕÊ±¼ä½ø¶ÈÌõ
--º¯Êı¹¦ÄÜ£º¹Ø±Õ¶ÔÓ¦IDµÄÊ±¼ä½ø¶ÈÌõ£¬´«Èë¹Ø±ÕID
function Zgc_pub_mission_stoptimeguage(timeguage_id)
	local map_id =  SubWorldIdx2ID(SubWorld)
	local player = mf_GetMSPlayerIndex(MS_ID,0,map_id)
	for i = 1, getn(player) do
		PlayerIndex = player[i]
		StopTimeGuage(timeguage_id)		
	end
end
