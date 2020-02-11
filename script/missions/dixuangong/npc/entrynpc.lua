Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\define.lua")
Include("\\script\\lib\\talktmp.lua")
Include("\\script\\missions\\dixuangong\\daily_task.lua")
Include("\\script\\missions\\dixuangong\\mission_head.lua")

GK_SWITCH = 1

DXG_NPC_NAME = "<color=green> C«n L«n Ph¸i V©n Hi Hßa: <color>"

function main()
	local tSay = {
		"Giíi thiÖu §Þa HuyÒn Cung/dxg_info",
		format("%s/%s","NhiÖm vô ngµy","dxg_daily_task_menu"),
		"V­ît ¶i th­êng/entry_jingli",
		"V­ît ¶i Thiªn Kiªu/#entry_tianjiaoling(0)",
		"\nKÕt thóc ®èi tho¹i/nothing",
	}	
	Say(DXG_NPC_NAME.."Kh«ng ngê c¸c b»ng h÷u vâ l©m v× ®Õn chóc mõng ph¸i K«n L«n ta mµ gÆp n¹n, ta thËt ¸y n¸y. NhÊt ®Þnh ph¶i cøu hä ra, tiªu diÖt Thiªn ©m gi¸o. \n sè l­u ph¸i trong tæ ®éi cµng nhiÒu gi¶i th­ëng cµng tèt.", getn(tSay), tSay);
end

function entry_jingli()
	join_dxg(0)
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
	join_dxg(1)
end

function nothing()
end

function dxg_info()
	local tbBody = "§Þa HuyÒn Cung lµ cø ®iÓm tiÒn duyªn cña Thiªn ¢m Gi¸o Thôc S¬n QuÇn Phong, cø ®iÓm nµy lµ c¬ quan vò khÝ do Thiªn ¢m Gi¸o thiÕt lËp, dïng ®Ó giam cÇm c¸c vâ l©m nh©n sÜ vµ cÊt giÊu c¸c b¶o vËt vâ l©m. \n cÊp = cÊp 80, thµnh viªn m«n ph¸i trong tæ ®éi = 3 , ®· gia nhËp m«n ph¸i 4-8 ng­êi hîp thµnh tæ ®éi, ®«i tr­ëng b¸o danh t¹i chç cña ta cã thÓ dÉn d¾t tæ ®éi ®i vµo cöa ¶i.";
	local tbSay = {};
	tbSay.msg = DXG_NPC_NAME..tbBody;
	tbSay.sel = {
		{"Ta muèn t×m hiÓu v­ît ¶i nh­ thÕ nµo", "dxg_info1"},
		{"\n Ph¶n håi","main"},
		{"Ra khái","nothing"},
	};
	temp_Talk(tbSay);
end

function dxg_info1()
	local tbBody = "§Þa HuyÒn Cung chia thµnh TiÒn §iÖn, Trung §iÖn vµ HËu §iÖn. \n TiÒn §iÖn do Thiªn ¢m Ph¸p S­ phßng vÖ, trong tay «ng ta ®iÒu khiÓn Thiªn Qu©n V¹n M·. §¸nh b¹i Thiªn ¢m Ph¸p S­ cã c¬ héi nhËn ®­îc R­¬ng Thiªn ¢m Th¸nh VËt hoÆc Thiªn ¢m MËt R­¬ng. NÕu nh­ ®¸nh b¹i Thiªn Qu©n V¹n M· tr­íc, chiÕn lîi phÈm sÏ cµng phong phó h¬n. \n Trung §iÖn lµ n¬i giam gi÷ c¸c vâ l©m nh©n sÜ cña Thiªn ¢m Gi¸o, c¸c ng­¬i ®i vµo Trung §iÖn gi¶i cøu c¸c vâ l©m nh©n sÜ bÞ giam cÇm t¹i ®©y, cøu cµng nhiÒu vâ l©m nh©n sÜ sÏ nhËn ®­îc cµng hiÒu phÇn th­ëng, sau khi cøu hÕt vâ l©m nh©n sÜ, ®¸nh b¹i Cai Ngôc Thiªn ¢m sÏ cã c¬ héi nhËn ®­îc R­¬ng Thiªn ¢m Th¸nh VËt hoÆc Thiªn ¢m MËt R­¬ng. \n HËu §iÖn lµ §Þa HuyÒn Cung Cung Chñ së t¹i, t­¬ng truyÒn r»ng Cung Chñ dòng m·nh dÞ th­êng, c¸c ng­¬i cÇn ph¶i cÈn thËn ®èi phã. §¸nh b¹i Cung Chñ sÏ cã c¬ héi nhËn ®­îc R­¬ng Thiªn ¢m Th¸nh VËt hoÆc Thiªn ¢m MËt R­¬ng. \n NÕu nh­ c¶m thÊy qu¸ phøc t¹p, còng cã thÓ mua Th«ng Thiªn Minh Gi¸o L©u La, trùc tiÕp thay c¸c ng­¬i ®i vµo ®¹i ®iÖn.";
	tbBody = format("%s\nV­ît ¶i th­êng: Mçi thµnh viªn cÇn tiªu hao <color=yellow>%d ®iÓm tinh lùc<color>\nV­ît ¶i Thiªn Kiªu: §éi tr­ëng cÇn tiªu hao <color=yellow>%d c¸i %s<color>"
		, tbBody, N_JOIN_ENERGY_NEED, N_JOIN_TIANJIAOLING_NEED, T_TIANJIAOLING[4])
	local tbSay = {};
	tbSay.msg = DXG_NPC_NAME..tbBody;
	tbSay.sel = {
		{"\n Ph¶n håi","main"},
		{"Ra khái","nothing"},
	};
	temp_Talk(tbSay);
end

function join_dxg(bTianJiaolingMode)
	if GK_SWITCH ~= 1 then
		Talk(1, "", DXG_NPC_NAME.."§Þa HuyÒn Cung b©y giê ®ang rÊt hçn lo¹n, ®ang thanh läc, sÏ ®­îc më trong thêi gian s¾p tíi!")
		return
	end
	if GetTeamMember(0) ~= PlayerIndex then
		Talk(1, "", DXG_NPC_NAME.."Gäi ®éi tr­ëng cña c¸c ng­¬i l¹i ®©y. §i vµo ¶i, cÇn ph¶i <color=yellow> cÊp = 80 cÊp, m«n ph¸i trong tæ ®éi = 3, ®éi ngò ph¶i ®ñ = 4, thµnh viªn ®Òu ®· nhËp ph¸i. <color>")
		return
	end
	if check() == 1 and join_consume(bTianJiaolingMode, 0)==1 then
		entry(bTianJiaolingMode);
	end
end

tState = {}
function check()
---¼ÓÈëÉÙÑôÅÉ/ÎÄÊ·ÅÉ
---µÈ¼¶¡Ýlv80
---ÒÑÈëÃÅÅÉ
---×é¶Ó½øÈë£¬×é¶Ó³ÉÔ±4ÈË
---Á÷ÅÉÊý¡Ý3

	local bResult			= 1;
	local szMsg				= "§i vµo §Þa HuyÒn Cung thÊt b¹i.";
	local nMapID			= GetWorldPos();
	local nTeamID			= GetTeamID();

	for i = 1, 1 do
		nRetCode, szRetName	= gf_team_check_gs(nTeamID);
		if 1 ~= nRetCode then
			bResult	= 0;
			if szRetName then
				gf_team_message(nTeamID, szRetName.."Kh«ng thÓ ®i vµo §Þa HuyÒn Cung ( kh«ng cïng mét thµnh thÞ )");
				szMsg = szMsg..szRetName.."Kh«ng thÓ ®i vµo §Þa HuyÒn Cung ( kh«ng cïng mét thµnh thÞ )";
			end
			break;
		end

		nRetCode, szRetName	= gf_team_check_level(nTeamID, 80, 99);
		if 1 ~= nRetCode then
			bResult	= 0;
			if szRetName then
				gf_team_message(nTeamID, szRetName.."Kh«ng thÓ ®i vµo §Þa HuyÒn Cung ( ®¼ng cÊp kh«ng ®ñ 80 )");
				szMsg = szMsg..szRetName.."Kh«ng thÓ ®i vµo §Þa HuyÒn Cung ( ®¼ng cÊp kh«ng ®ñ 80 ).";
			end
			break;
		end

		nRetCode, szRetName	= gf_team_check_map(nTeamID, nMapID);
		if 1 ~= nRetCode then
			bResult	= 0;
			if szRetName then
				gf_team_message(nTeamID, szRetName.."Kh«ng thÓ ®i vµo §Þa HuyÒn Cung ( kh«ng cïng mét thµnh thÞ )");
				szMsg = szMsg..szRetName.."Kh«ng thÓ ®i vµo §Þa HuyÒn Cung ( kh«ng cïng mét thµnh thÞ )";
			end
			break;
		end

		nRetCode, szRetName	= gf_team_check_sleep(nTeamID);
		if 1 ~= nRetCode then
			bResult	= 0;
			if szRetName then
				gf_team_message(nTeamID, szRetName.."Kh«ng thÓ ®i vµo §Þa HuyÒn Cung ( ®ang ngñ ).");
				szMsg = szMsg..szRetName.."Kh«ng thÓ ®i vµo §Þa HuyÒn Cung ( ®ang ngñ say )";
			end
			break;
		end

		nRetCode, szRetName	= gf_team_check_route(nTeamID);
		if 1 ~= nRetCode then
			bResult	= 0;
			if szRetName then
				gf_team_message(nTeamID, szRetName.."Kh«ng thÓ ®i vµo §Þa HuyÒn Cung ( ch­a gia nhËp m«n ph¸i ).");
				szMsg = szMsg..szRetName.."Kh«ng thÓ ®i vµo §Þa HuyÒn Cung ( ch­a gia nhËp m«n ph¸i )";
			end
			break;
		end

		nRetCode = gf_team_get_route_count(nTeamID);
		if 3 > nRetCode then
			bResult = 0;
			szMsg = szMsg.."M«n ph¸i trong tæ ®éi kh«ng ®ñ 3 ph¸i.";
			break;
		end

		nRetCode = GetTeamSize();
		if 4 > nRetCode then
			bResult = 0;
			szMsg = szMsg.."Nh©n sè tæ ®éi kh«ng ®ñ 4 ng­êi.";
			break;
		end
	end

	if 1 ~= bResult then
		Talk(1, "", DXG_NPC_NAME..szMsg);
	end

	return bResult;
end

function entry(bTianJiaolingMode)
	SendScript2VM("\\script\\missions\\dixuangong\\mission.lua", format("createMission(%d)",bTianJiaolingMode));
end

