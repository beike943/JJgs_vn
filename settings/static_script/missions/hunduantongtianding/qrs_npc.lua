Include("\\script\\lib\\globalfunctions.lua");
Include("\\settings\\static_script\\missions\\hunduantongtianding\\entrynpc.lua")
Include("\\script\\lib\\talktmp.lua")
Include("\\script\\equip_shop\\equip_shop_talk.lua")
Include("\\script\\system_switch_config.lua")
Include("\\settings\\static_script\\missions\\mission_task\\ttd_wjz_task.lua")

Include("\\settings\\static_script\\missions\\hunduantongtianding\\runtime_data_stat.lua")

g_NpcName = "<color=green> Th¸nh n÷ NhËm Doanh Doanh<color>:"

function ttd_entry_npc_main()
	T1 = {};
	T2 = {};
	T3 = {};
	T4 = {};
	
	T1.msg = g_NpcName.."Th¸nh N÷ NhËt NguyÖt ThÇn Gi¸o, NhËm Doanh Doanh ¸i n÷ NhËm Ng· Hµnh. H«m nay tô tËp c¸c vŞ ®ång ®¹o vâ l©m t¹i ®©y cïng x«ng lªn Th«ng Thiªn HuyÔn C¶nh, v« sè b¶o vËt Cæ LuyÖn ThÓ SÜ ®Ó l¹i trªn Th«ng Thiªn HuyÔn C¶nh t¹i h¹ kh«ng lÊy mét xu, nÕu t×m ®­îc cha, t¹i h¹ xin biÕu tÆng cho c¸c vŞ ®ång ®¹o.";
	T1.sel = {
		{"T¹i h¹ muèn tham gia Hån §o¹n Th«ng Thiªn HuyÔn C¶nh","qrs_talk_1"},
		{"§iÒu kiÖn tham gia Hån §o¹n Th«ng Thiªn §Ønh",T2},
		{"NhiÖm vô ngµy Th«ng Thiªn HuyÔn C¶nh",T3},
		{"NhiÖm vô tuÇn Th«ng Thiªn HuyÔn C¶nh",T4},
		{"§æi phÇn th­ëng", "OnOpenShopGroup1"},
		{"KÕt thóc ®èi tho¹i","nothing"},
	};
	
	T2.msg = g_NpcName.."ChuyÕn ®i Th«ng Thiªn §Ønh thËp tö nhÊt sinh, c¸c vŞ nhí cÈn thËn. §iÒu kiÖn vµo nh­ sau: \n ph¶i tæ ®éi 5-8 thµnh viªn; \n    hÖ ph¸i#5;\n   cÊp ®é tÊt c¶ thµnh viªn tæ ®éi #lv80;  ";
	T2.sel = {
		{"trë l¹i",T1},
		{"KÕt thóc ®èi tho¹i","nothing"},
	};
	
	T3.msg = g_NpcName.."Mçi ngµy chØ cã thÓ hoµn thµnh 1 lÇn, phÇn th­ëng ch­a nhËn sau khi hoµn thµnh sÏ kh«ng thiÕt lËp l¹i. \n    NhiÖm vô th«ng quan Th«ng Thiªn HuyÔn C¶nh: <color=green>4.000.000 kinh nghiÖm, Cæ Linh Th¹ch x 4<color>, \n    NhiÖm vô 1 lÇn lËt bµi thu phİ: <color=green>5.000.000 kinh nghiÖm, 3 Vµng, Cæ Linh Ngäc x 1<color>;";
	T3.sel = {
		{"\n Th«ng quan 1 lÇn Th«ng Thiªn HuyÔn C¶nh(%s)","tthj_daily_task"},
		{"\n ¶i lËt bµi 1 lÇn (%s)","fanpai_daily_task"},
		{"\n Ph¶n håi",T1},
		{"KÕt thóc ®èi tho¹i","nothing"},
	}
	
	T4.msg = g_NpcName.."Mçi tuÇn chØ cã thÓ hoµn thµnh 1 lÇn, phÇn th­ëng ch­a nhËn sau khi hoµn thµnh sÏ kh«ng thiÕt lËp l¹i. \n   Hoµn thµnh 4 lÇn nhiÖm vô Th«ng Thiªn HuyÔn C¶nh: <color=green>12.000.000 kinh nghiÖm, Cæ Linh Ngäc x 2<color>; \n  NhiÖm vô lËt bµi céng dån ®Õn 15 lÇn : <color=green>30.000.000 kinh nghiÖm, Cæ Linh Ngäc x 7<color>;";
	T4.sel = {
		{"\n Th«ng quan 4 lÇn Th«ng Thiªn HuyÔn C¶nh (%s)","tthj_week_task"},
		{"\n ¶i lËt bµi 15 lÇn","fanpai_week_task"},
		{"\n Ph¶n håi",T1},
		{"KÕt thóc ®èi tho¹i","nothing"},
	}
	
	local str1 = return_status(1);
	local str2 = return_status(5);
	local str3 = return_status(2);
	local str4 = return_status(6);
	T3.sel[1][1] = format(T3.sel[1][1],str1);
	T3.sel[2][1] = format(T3.sel[2][1],str2);
	T4.sel[1][1] = format(T4.sel[1][1],str3);
	T4.sel[2][1] = format(T4.sel[2][1],str4);
	
	if 1 == IsTongTianHuanJingMissionSystemOpen() then
		temp_Talk(T1);
	else
		local strtab = {
    		"KÕt thóc ®èi tho¹i/nothing",
    		}
    	Say(g_NpcName..format("Lèi vµo ¶i %s®· ®ãng lÇn sau h·y ®Õn më!", "Hån §o¹n Th«ng Thiªn HuyÔn C¶nh"),
    		getn(strtab),
    		strtab)
	end
end

function qrs_talk_1()
	Say(g_NpcName.."T¹i h¹ muèn tham gia Hån §o¹n Th«ng Thiªn HuyÔn C¶nh!",
		2,
		"\n vµo Th«ng Thiªn HuyÔn C¶nh/qrs_talk_1_1",
		"\nKÕt thóc ®èi tho¹i/nothing")
end

function qrs_talk_1_1()
	if GetTeamMember(0) ~= PlayerIndex then
		Talk(1, "",g_NpcName.."§éi tr­ëng míi cã thÓ thùc hiÖn thao t¸c vµo ¶i")
		return 0;
	end
	if 1 ~= gf_team_check_gs(GetTeamID()) then
		Talk(1,"",g_NpcName.."H·y triÖu tËp h¶o h÷u cïng v­ît ¶i ®i!");
		return 0;
	end
	if qrs_check() == 1 then
		_stat_when_open_mission()
		_op_on_team(_stat_on_player_when_open_misson)
		enter(1);
		gf_WriteLogEx("tongtian mission", format("team enter mission member count is %d", GetTeamSize()));
	end
end

tState = {}
function qrs_check()
---µÈ¼¶¡İlv80
---ÒÑÈëÃÅÅÉ
---×é¶Ó½øÈë£¬×é¶Ó³ÉÔ±5ÈË
---Á÷ÅÉÊı¡İ5
	tState.lv = {};
	tState.route = {};
	tState.noRoute = {};
	tState.count = 0;
	tState.diffMap = {};
	tState.BaiTan = {};

	local nMapID = GetWorldPos();
	gf_TeamOperateEX(qrs_checkTeam,nMapID);

	local msg = "";
	local nResult = 1;
	if getn(tState.lv) ~= 0 then
		nResult = 0;
		msg = msg .. "<color=red> thµnh viªn ch­a ®¹t cÊp ®é 80:  <color>";
		for i = 1, getn(tState.lv) do
			msg = msg .. tState.lv[i] .. "  ";
		end
	end
	if getn(tState.noRoute) ~= 0 then
		nResult = 0;
		msg = msg .. "\n<color=red>thµnh viªn ch­a gia nhËp hÖ ph¸i:    <color>";
		for i = 1, getn(tState.noRoute) do
			msg = msg .. tState.noRoute[i] .. " ";
		end
	end
	local nRouteCount = 0;
	for i = 1, getn(tState.route) do
		if tState.route[i] and tState.route[i] > 0 then
			nRouteCount = nRouteCount + 1;
		end
	end
	if nRouteCount < 5 then
		nResult = 0;
		msg = msg .. "\n<color=red> hÖ ph¸i trong tæ ®éi kh«ng ®ñ 5<color>\n";
	end
	if tState.count < 5 then
		nResult = 0;
		msg = msg .. "\n<color=red> Tæ ®éi ®ñ 5 thµnh viªn míi cã thÓ vµo <color>\n";
	end
	if getn(tState.diffMap) ~= 0 then
		nResult = 0;
		msg = msg .. "\n<color=red>thµnh viªn kh«ng n»m trong b¶n ®å nµy:     <color>";
		for i = 1, getn(tState.diffMap) do
			msg = msg .. tState.diffMap[i] .. " ";
		end
	end
	if getn(tState.BaiTan) ~= 0 then
		nResult = 0;
		msg = msg .. "\n<color=red>thµnh viªn kh«ng ë tr¹ng th¸i bµy b¸n: <color>";
		for i = 1, getn(tState.BaiTan) do
			msg = msg .. tState.BaiTan[i] .. " ";
		end
	end
	if nResult == 0 then
		Talk(1, "", msg);
	end
	return nResult;
end

function qrs_checkTeam(nMapID)
	if GetLevel() < 80 then
		tinsert(tState.lv, GetName());
	end
	local nRoute = GetPlayerRoute();
	tState.route[nRoute] = (tState.route[nRoute] or 0) + 1;
	if gf_CheckPlayerRoute() ~= 1 then
		tinsert(tState.noRoute, GetName());
	end
	tState.count = (tState.count or 0) + 1;
	local m = GetWorldPos();
	if m ~= nMapID then
		tinsert(tState.diffMap, GetName());
	end
	if IsStalling() == 1 then
		tinsert(tState.BaiTan, GetName());
	end
end

function nothing()
end

