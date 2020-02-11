--date:2007-3-7
--author:yanjun
--describe:this npc help player enter the killer hall
Include("\\script\\task\\killer_hall\\mission\\mission_head.lua");
Include("\\script\\lib\\writelog.lua")

g_InfoHeader = "<color=green>Sø gi¶ S¸t Thñ §­êng<color>: ";
function main()
	local nCurMapID = GetWorldPos();
	if nCurMapID == MAP_ID then
		dialog_exit();
	else	
		--Talk(1,"","TÝnh n¨ng S¸t Thñ §­êng ®ang t¹m ®ãng, ®¹i hiÖp h·y quay l¹i sau !!!")
		dialog_enter();
	end;
end;

function dialog_enter()
	local selTab = {
				"Ta lo mäi viÖc bªn ngoµi/single_man_enter",
				"Ngay c¶ bän ta cßn ch­a nhËn ra/team_enter",
				"Ta tiÖn ghÐ qua th«i/nothing",
				}
	local nTeamSize = GetTeamSize()
	local nInMapMemberCount = KH_Get_InMap_Member_Count();
	if nInMapMemberCount >= 1 or nTeamSize <= 1 then	--Èç¹ûÓÐ¶ÓÓÑÔÚÉ±ÊÖÌÃÀïÃæ»òÕßÃ»ÓÐ×é¶Ó»ò¶ÓÎéÀïÃæÖ»ÓÐ×Ô¼ºÒ»¸öÈË
		tremove(selTab,2);
	else
		tremove(selTab,1);
	end;
	Say(g_InfoHeader.."Ng­¬i lµ ai?",getn(selTab),selTab);
end;

function dialog_exit()
	local selTab = {
				"më ®­êng m¸u, rêi khái S¸t Thñ §­êng/go_out",
				"Kh«ng ®i ®©u/nothing",
				}
	Say(g_InfoHeader.."Th× ra lµ gi¶ m¹o µ? Ng­êi ®©u? B¾t l¹i cho ta!",getn(selTab),selTab);
end;

function go_out()
	local nRand = random(1,getn(tExitPos));
	NewWorld(tExitPos[nRand][1],tExitPos[nRand][2],tExitPos[nRand][3]);
end;

function get_pos_idx()
	local nPosIdx = 0;
	if random(1,100) <= 30 then	--%30¸ÅÂÊ´«µ½ÃÅ¿Ú
		nPosIdx = random(1,3);
	else
		nPosIdx = random(4,getn(tEntrancePos));	--70%¸ÅÂÊ´«µ½·¿¼äÀïÃæ
	end;
	return nPosIdx;
end;

function single_man_enter()
	CleanInteractive();
	if check_mission_state() == 1 then
		local nPlayerState = check_player_state();
		local nPosIdx = get_pos_idx();
		if nPlayerState == 1 then
			local nDate = tonumber(date("%y%m%d"));
			SetTask(KH_QUEST_TSK, floor(GetTask(KH_QUEST_TSK) / 10) * 10)
			if tonumber(date("%y%m%d")) >= 091106 and tonumber(date("%y%m%d")) <= 091206 then		
				gf_AddItemEx({2, 1, 30118, 150}, "Hoa Cóc");
				WriteLogEx("Hoat dong thang 11","S¸t Thñ §­êng",150,"Hoa Cóc");		
			end
			if tonumber(date("%y%m%d")) >= 100716 and tonumber(date("%y%m%d")) <= 100815 then
				Give1stTimeExp()
			end		
			if NewWorld(tEntrancePos[nPosIdx][1],tEntrancePos[nPosIdx][2],tEntrancePos[nPosIdx][3]) == 1 then
				Pay(80000)
				mf_JoinMission(MISSION_ID,0,MAP_ID);
				WriteLogEx("Hoat Dong Thang 10","tham gia S¸t Thñ §­êng")
			end;
		elseif nPlayerState == 2 then
			Talk(1,"","§¹i hiÖp vâ c«ng qu¸ yÕu nªn kh«ng thÓ tham gia v­ît ¶i!!!")
		elseif nPlayerState == 3 then
			if NewWorld(tEntrancePos[nPosIdx][1],tEntrancePos[nPosIdx][2],tEntrancePos[nPosIdx][3]) == 1 then
				Pay(80000)
				mf_JoinMission(MISSION_ID,0,MAP_ID);
			end;
--		elseif nPlayerState == 0 then
--			Talk(2,"",g_InfoHeader.."Ng­¬i lµ ai? Sao l¹i d¸m x«ng vµo ®©y?","§· bÞ ph¸t hiÖn, kh«ng cã mÆt n¹ cña S¸t Thñ §­êng xem nh­ kh«ng thµnh råi.");		
		elseif nPlayerState == 4 then
			Talk(1,"","§¹i hiÖp kh«ng mang ®ñ tiÒn ®Ó tham gia v­ît ¶i!!!")
		elseif nPlayerState == 5 then
			Talk(1,"","§¹i hiÖp kh«ng ®ñ cÊp ®Ó tham gia v­ît ¶i!!!")
		end;
	end;
end;
--Èç¹ûÖ®Ç°Ã»½øÈ¥¹ýÇÒÃ»ÓÐÉ±ÊÖÌÃÃæ¾ßÔò·µ»Ø0
--Èç¹ûÖ®Ç°Ã»½øÈ¥¹ýÇÒÓÐÉ±ÊÖÌÃÃæ¾ß´Í·µ»Ø1
--Èç¹ûÎä¹¦µÈ¼¶²»¹»Ôò·µ»Ø2
--Èç¹ûÖ®Ç°½øÈ¥¹ýÔò·µ»Ø3
function check_player_state()
	if GetLevel() < 79 then 
		return 5
	end
	if KH_Check_Skill_Level() ~= 1 then
		return 2;	--Îä¹¦µÈ¼¶²»¹»
	end;
	if GetCash() < 80000 then
		return 4
		--Talk(1,"","§¹i hiÖp kh«ng mang ®ñ tiÒn ®Ó tham gia v­ît ¶i!!!")
	end
	if abs(GetTask(KH_TASK_MSUID) - mf_GetMissionV(MISSION_ID,MV_MISSION_UID,MAP_ID)) > 1 then	--Èç¹ûÖ®Ç°Ã»½øÈ¥¹ý
		local nDate = tonumber(date("%y%m%d"));
		if  nDate < 101022 then
			if GetItemCount(tItemInfo[1][2],tItemInfo[1][3],tItemInfo[1][4]) <= 0 then
				return 0;	--±íÊ¾Ã»ÓÐÉ±ÊÖÌÃÃæ¾ß
			end;
		end
		SetTask(KH_TASK_OPEN_BOX_TIME,0);	--¿ªÏä×Ó´ÎÊýÇå0
	else
		return 3;	--Âú×ã½øÈëÌõ¼þ£¨Ö®Ç°½øÈ¥¹ý£©
	end;
	return 1;	--Âú×ã½øÈëÌõ¼þ£¨ÓÐÃæ¾ß£©
end;

function team_enter()
	CleanInteractive();
	if GetTeamSize() <= 1 then
		Talk(1,"",g_InfoHeader.."Cã mét m×nh ng­¬i mµ còng d¸m gäi lµ Nhãm Thiªn S¸t µ?");
		return 0;
	end;
	if GetCaptainName() ~= GetName() then	--Èç¹û²»ÊÇ¶Ó³¤
		Talk(1,"",g_InfoHeader.."Gäi ®éi tr­ëng cña ng­¬i ®Õn gÆp ta.");
		return 0;
	end;
	if check_mission_state() == 1 then
		if check_team_state() == 1 then
			transmit_team();
		else
			Talk(2,"",g_InfoHeader.."Ng­¬i lµ ai? Sao l¹i d¸m x«ng vµo ®©y?","§· bÞ ph¸t hiÖn, kh«ng cã mÆt n¹ cña S¸t Thñ §­êng xem nh­ kh«ng thµnh råi.");
		end;
	end;
end;

function check_mission_state()
	if SETTING_DYNAMIC_MISSION == 0 then
		if mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,MAP_ID) == MS_STATE_IDEL then
			Talk(1,"",g_InfoHeader.."T¹m thêi kh«ng cho ai vµo S¸t Thñ §­êng, kÓ c¶ ®Ö tö cña bæn ®­êng!");
			return 0;
		end;
	else
		if mf_OpenDynamicMission(MISSION_ID,MAP_ID) == 0 then
			Talk(1,"",g_InfoHeader.."T¹m thêi kh«ng cho ai vµo S¸t Thñ §­êng, kÓ c¶ ®Ö tö cña bæn ®­êng!");
			return 0
		end;
	end;
	if mf_GetPlayerCount(MISSION_ID,0,MAP_ID) >= MAX_PLAYER then
		Talk(1,"",g_InfoHeader.."Bªn trong S¸t Thñ §­êng ®· qu¸ ®«ng ng­êi, ng­¬i ®øng ngoµi ®îi mét l¸t nhÐ!");
		return 0;
	end;
	return 1;
end;

function check_team_state()
	local nTeamSize = GetTeamSize()
	local nOldPlayerIdx = PlayerIndex;
	local nPlayerState = 0;
	local bCheckFail = 0;
	for i=1,nTeamSize do
		PlayerIndex = GetTeamMember(i);
		nPlayerState = check_player_state();
--		if nPlayerState == 0 then
--			gf_Msg2Team(GetName().."Kh«ng cã mÆt n¹ S¸t Thñ §­êng",1)
--			bCheckFail = 1;
		if nPlayerState == 2 then
			Talk(1, "", GetName().." Vâ c«ng qu¸ yÕu");			
			gf_Msg2Team(GetName().." Vâ c«ng qu¸ yÕu",1);
			bCheckFail = 1;
		elseif nPlayerState == 4 then
			Talk(1, "", GetName().." kh«ng cã ®ñ tiÒn ®Ó tham gia")	
			gf_Msg2Team(GetName().." kh«ng cã ®ñ tiÒn ®Ó tham gia",1);
			bCheckFail = 1;
		elseif nPlayerState == 5 then
			Talk(1, "", GetName().." kh«ng ®ñ cÊp ®Ó tham gi")	
			gf_Msg2Team(GetName().." kh«ng ®ñ cÊp ®Ó tham gia",1);
			bCheckFail = 1;
		end;
	end;
	PlayerIndex = nOldPlayerIdx;
	if bCheckFail == 1 then
		return 0;
	end;
	return 1;
end;

function transmit_team()
	local nTeamSize = GetTeamSize()
	local nOldPlayerIdx = PlayerIndex;	
	local nPosIdx = get_pos_idx();
	for i=1,nTeamSize do
		PlayerIndex = GetTeamMember(i);
		CleanInteractive();
		if abs(GetTask(KH_TASK_MSUID) - mf_GetMissionV(MISSION_ID,MV_MISSION_UID,MAP_ID)) > 1 then	--Ö®Ç°Ã»½øÈ¥¹ý\
			SetTask(KH_QUEST_TSK, floor(GetTask(KH_QUEST_TSK) / 10) * 10)
			if tonumber(date("%y%m%d")) >= 091106 and tonumber(date("%y%m%d")) <= 091206 then		
				gf_AddItemEx({2, 1, 30118, 150}, "Hoa Cóc");
				WriteLogEx("Hoat dong thang 11","S¸t Thñ §­êng",150,"Hoa Cóc");		
			end
			if tonumber(date("%y%m%d")) >= 100716 and tonumber(date("%y%m%d")) <= 100815 then
				Give1stTimeExp()
			end
			if NewWorld(tEntrancePos[nPosIdx][1],tEntrancePos[nPosIdx][2],tEntrancePos[nPosIdx][3]) == 1 then
				Pay(80000)
				mf_JoinMission(MISSION_ID,0,MAP_ID);
				WriteLogEx("Hoat Dong Thang 10","tham gia S¸t Thñ §­êng")
			else
				LeaveTeam();
			end;
		else
			if NewWorld(tEntrancePos[nPosIdx][1],tEntrancePos[nPosIdx][2],tEntrancePos[nPosIdx][3]) == 1 then
				Pay(80000)
				mf_JoinMission(MISSION_ID,0,MAP_ID);
			else
				LeaveTeam();
			end;
		end;
	end;
	PlayerIndex = nOldPlayerIdx;
end;

function Give1stTimeExp()
	local nRand = random(1,100)
	if nRand <= 50 then
		gf_EventGiveCustomAward(1, 500000, 1)
	elseif nRand <= 70 then
		gf_EventGiveCustomAward(1, 1000000, 1)
	elseif nRand <= 90 then
		gf_EventGiveCustomAward(1, 1500000, 1)
	elseif nRand <= 95 then
		gf_EventGiveCustomAward(1, 2000000, 1)
	elseif nRand <= 99 then
		gf_EventGiveCustomAward(1, 3000000, 1)
	else
		gf_EventGiveCustomAward(1, 4000000, 1)
	end
end

function nothing()
end;