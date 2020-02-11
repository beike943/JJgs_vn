--²Ø½£½£Ù×
Include("\\script\\lib\\globalfunctions.lua");
Include("\\settings\\static_script\\missions\\cangjianshanzhuang\\entrynpc.lua")
Include("\\script\\equip_shop\\equip_shop_talk.lua")
Include("\\script\\system_switch_config.lua")
Include("\\settings\\static_script\\missions\\mission_task\\ttd_wjz_task.lua")

Include("\\settings\\static_script\\missions\\cangjianshanzhuang\\runtime_data_stat.lua")
Include("\\script\\misc\\observer\\observer_head.lua")

g_NpcName = "<color=green>H¾c Tæng Qu¶n NhËt NguyÖt ThÇn Gi¸o<color>:"

N_JOIN_ENERGY_NEED = 15
N_JOIN_TIANJIAOLING_NEED = 3
T_TIANJIAOLING = {2, 97, 236, "Thiªn Kiªu LÖnh"}
-- MU_Msg2Team from cangjian
function MU_Msg2Team(msg, msgtype)
    local num = GetTeamSize()
    msg = tostring(msg)
    if (num < 1) then
    	if msgtype == 2 then
    		Talk(1, "", msg)
        elseif msgtype == 1 then
        	Say(msg, 0)
        else
        	Msg2Player(msg)
        end
        return
    end
    OldPlayer = PlayerIndex
    for i=1, num do
        PlayerIndex = GetTeamMember(i)
    	if msgtype == 2 then
    		Talk(1, "", msg)
        elseif msgtype == 1 then
        	Say(msg, 0)
        else
        	Msg2Player(msg)
        end
    end
    PlayerIndex = OldPlayer
end
function join_consume(bTianJiaolingMode, bDelete)
--	if 1 == bDelete then
--		AddRuntimeStat(4,1,bTianJiaolingMode,1)
--	end
	if 1 == bTianJiaolingMode then
		if GetTeamMember(0) == PlayerIndex then
    		if GetItemCount(T_TIANJIAOLING[1], T_TIANJIAOLING[2], T_TIANJIAOLING[3]) < N_JOIN_TIANJIAOLING_NEED then
    			Msg2Player(format("Trªn ng­êi kh«ng ®ñ %s",T_TIANJIAOLING[4]))
    			return 0
    		end
    		if bDelete and bDelete == 1 then
        		--É¾³ýÎïÆ·
        		if 1 ~= DelItem(T_TIANJIAOLING[1], T_TIANJIAOLING[2], T_TIANJIAOLING[3], N_JOIN_TIANJIAOLING_NEED) then
        			return 0
        		end
        		Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {T_TIANJIAOLING[1], T_TIANJIAOLING[2], T_TIANJIAOLING[3], N_JOIN_TIANJIAOLING_NEED})
        		_stat_when_ib_consume(N_JOIN_TIANJIAOLING_NEED)
    		end
    	else
    		return 0
		end
	else
		local OldPlayerIndex = PlayerIndex;
		for i = 1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i);
			if PlayerIndex > 0 then
    			local nCur,_ = ModifyEnergy(0, 1)
    			if nCur < N_JOIN_ENERGY_NEED then
    				MU_Msg2Team(format("[%s] tinh lùc kh«ng ®ñ [%d] ®iÓm", GetName(), N_JOIN_ENERGY_NEED))
    				return 0
    			end
			end
		end
		if bDelete and bDelete == 1 then
    		for i = 1, GetTeamSize() do
    			PlayerIndex = GetTeamMember(i);
    			if PlayerIndex > 0 then
    				ModifyEnergy(-1*N_JOIN_ENERGY_NEED, 1)
    			end
    		end
		end
		PlayerIndex = OldPlayerIndex
	end
	return 1
end

function wjz_entry_npc_main()
	if 1 == IsWanJianZhongMissionSystemOpen() then
		local strtab = {
    		"V­ît ¶i th­êng/entry_jingli",
			"V­ît ¶i Thiªn Kiªu/#entry_tianjiaoling(0)",
    		"§iÒu kiÖn v­ît ¶i/jt_talk_2",
    		"NhiÖm vô ngµy V¹n KiÕm Tròng/jt_talk_3",
    		"NhiÖm vô tuÇn V¹n KiÕm Tròng/jt_talk_4",
    		"§æi phÇn th­ëng/OnOpenShopGroup1",
    		"KÕt thóc ®èi tho¹i/do_nothing",
    		}
    	local szMsg = g_NpcName.."NhËm gi¸o chñ cïng Giang ®¹i hiÖp ®· x«ng lªn V¹n KiÕm Tròng, t¹i h¹ chê ë ®©y nghªnh ®ãn c¸c vÞ lªn trî gióp"
    	szMsg = format("%s\n sè l­u ph¸i trong tæ ®éi cµng nhiÒu gi¶i th­ëng cµng tèt", szMsg)
		szMsg = format("%s\nV­ît ¶i th­êng: Mçi thµnh viªn cÇn tiªu hao <color=yellow>%d ®iÓm tinh lùc<color>\nV­ît ¶i Thiªn Kiªu: §éi tr­ëng cÇn tiªu hao <color=yellow>%d c¸i %s<color>"
			, szMsg, N_JOIN_ENERGY_NEED, N_JOIN_TIANJIAOLING_NEED, T_TIANJIAOLING[4])
    	Say(szMsg,
    		getn(strtab),
    		strtab)
	else
		local strtab = {
    		"KÕt thóc ®èi tho¹i/do_nothing",
    		}
    	Say(g_NpcName..format("Lèi vµo ¶i %s®· ®ãng lÇn sau h·y ®Õn më!", "V¹n KiÕm Tròng"),
    		getn(strtab),
    		strtab)
	end
	
end

function entry_jingli()
	jt_talk_1(0)
end
function entry_tianjiaoling(bSure)
	if not bSure or 0 == bSure then
		local tSay = {
				"§ång ý/#entry_tianjiaoling(1)",
				"Ta chØ ghÐ qua th«i/nothing",
				}
			Say(format("D¹ng Thiªn Kiªu cÇn <color=red>%d c¸i %s (Cã thÓ mua trong Ngù C¸c)<color> ®ång ý kh«ng?",N_JOIN_TIANJIAOLING_NEED, T_TIANJIAOLING[4]),getn(tSay),tSay)
		return
	end
	jt_talk_1(1)
end

function nothing()
end

function jt_talk_1(bTianJiaolingMode)
	if GetTeamMember(0) ~= PlayerIndex then
		Talk(1, "",g_NpcName.."H·y mêi ®éi tr­ëng ®Õn. Muèn vµo ¶i cÇn <color=yellow>sè thµnh viªn cã hÖ ph¸i ph¶i tõ 5 trë lªn.<color>")
		return
	end
	if 1 ~= gf_team_check_gs(GetTeamID()) then
		Talk(1,"",g_NpcName.."H·y triÖu tËp h¶o h÷u cïng v­ît ¶i ®i!");
		return 0;
	end	
	if jt_check() == 1 and join_consume(bTianJiaolingMode, 0) == 1 then
		local nCurMapID = GetWorldPos();
		local nRet = join_consume(bTianJiaolingMode, 1)
		if 1 == nRet then
			local nMapID = tbJZMY:Create();
			mf_SetMissionV(tbJZMY.missionID,tbJZMY.mv19,nCurMapID,nMapID);
			tbJZMY:TeamEnter(nMapID,1);
			gf_WriteLogEx("wanjianzhong mission", format("team enter mission member count is %d", GetTeamSize()));
		
			_stat_when_open_mission(bTianJiaolingMode)
			_op_on_team(_stat_on_player_when_open_misson)
			--cdkey»î¶¯
			gf_TeamOperateEX(function () 
				SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Raid_Set(3)");	
			end);
		end
	end		
end

tState = {}
function jt_check()
---µÈ¼¶¡Ýlv80
---ÒÑÈëÃÅÅÉ
---×é¶Ó½øÈë£¬×é¶Ó³ÉÔ±4ÈË
---Á÷ÅÉÊý¡Ý3
--¶ÓÎéËùÓÐÍæ¼Ò¶¼ÖÁÉÙÓµÓÐ1¸öÍ¨Ìì¶¥Ô¿Ê¯(Í¨Ìì¶¥Ô¿Ê¯¿ÉÔÚÎÒÕâÀï»»È¡)
--do return 1 end

	tState.lv = {};
	tState.route = {};
	tState.noRoute = {};
	tState.noTickets = {};
	tState.count = 0;
	tState.diffMap = {};
	
	local nMapID = GetWorldPos();
	gf_TeamOperateEX(jt_checkTeam,nMapID);

	local msg = "";
	local nResult = 1;
	if getn(tState.lv) ~= 0 then
		nResult = 0;
		msg = msg .. "<color=red>thµnh viªn ch­a ®¹t cÊp ®é:   <color>";
		for i = 1, getn(tState.lv) do
			msg = msg .. tState.lv[i] .. "  ";
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
	if getn(tState.noRoute) ~= 0 then
		nResult = 0;
		msg = msg .. "\n<color=red>thµnh viªn ch­a gia nhËp hÖ ph¸i:    <color>";
		for i = 1, getn(tState.noRoute) do
			msg = msg .. tState.noRoute[i] .. " ";
		end
	end
	if tState.count < 5 then
		nResult = 0;
		msg = msg .. "<color=red>sè l­îng thµnh viªn trªn 5 míi cã thÓ vµo<color>\n";
	end
	if getn(tState.diffMap) ~= 0 then
		nResult = 0;
		msg = msg .. "\n<color=red>thµnh viªn kh«ng n»m trong b¶n ®å nµy:     <color>";
		for i = 1, getn(tState.diffMap) do
			msg = msg .. tState.diffMap[i] .. " ";
		end
	end
	
	if nResult == 0 then
		Talk(1, "", msg);
	end
	return nResult;
end

function jt_checkTeam(nMapID)
	if GetLevel() < 70 then
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
end

function jt_talk_2()
	Talk(1,"main",g_NpcName.."Nh©n sÜ giang hå cÊp 70 trë lªn ®· gia nhËp hÖ ph¸i míi cã t­ c¸ch vµo V¹n KiÕm Tròng. Thµnh viªn tæ ®éi vµ hÖ ph¸i d­íi 5 kh«ng thÓ vµo ¶i ®­îc. ")
end
 
function jt_talk_3()
	local str1 = return_status(3);
	local str2 = return_status(5);
	Say(g_NpcName.."Mçi ngµy chØ ®­îc hoµn thµnh 1 lÇn, sau khi hoµn thµnh nÕu ch­a nhËn th­ëng sÏ kh«ng bÞ thiÕt lËp l¹i.\n    NhiÖm vô v­ît ¶i V¹n KiÕm Tròng: <color=green>500W Exp, Hu©n Ch­¬ng Anh Hïng #2<color>;\n    NhiÖm vô lËt bµi thu phÝ 1 lÇn: <color=green>800W Exp, 30 vµng, Hu©n Ch­¬ng Anh Hïng #3<color>;",
		4,
		format("\n Th«ng quan 1 lÇn V¹n KiÕm Tròng (%s)/wjz_daily_task",str1),
		format("\n ¶i lËt bµi 1 lÇn (%s)/fanpai_daily_task",str2),
		"\n Ph¶n håi/main",
		"KÕt thóc ®èi tho¹i/do_nothing")
end

function jt_talk_4()
	local str1 = return_status(4);
	local str2 = return_status(6);
	Say(g_NpcName.."Mçi ngµy chØ ®­îc hoµn thµnh 1 lÇn, sau khi hoµn thµnh nÕu ch­a nhËn th­ëng sÏ kh«ng bÞ thiÕt lËp l¹i.\n    NhiÖm vô v­ît ¶i V¹n KiÕm Tròng 7 lÇn: <color=green>900W Exp, Hu©n Ch­¬ng Anh Hïng #4<color>;\n    NhiÖm vô lËt bµi thu phÝ 15 lÇn: <color=green>5000W Exp, Hu©n Ch­¬ng Anh Hïng #8<color>;",
		4,
		format("\n Th«ng quan 7 lÇn V¹n KiÕm Tròng (%s)/wjz_week_task",str1),
		format("\n ¶i lËt bµi 15 lÇn/fanpai_week_task",str2),
		"\n Ph¶n håi/main",
		"KÕt thóc ®èi tho¹i/do_nothing")
end

function do_nothing()
end

