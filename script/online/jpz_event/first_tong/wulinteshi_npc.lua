--File name:	wulinteshi_npc.lua
--Describe:		µÚÒ»°ï»î¶¯npcÎÄ¼þ
--Create Date:	2008-07-17
--Author:		chenbenqian

Include("\\script\\online\\jpz_event\\first_tong\\first_tong_func.lua")
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êý
Include("\\script\\online\\jpz_event\\first_tong\\mission_head.lua");
--==========================¹«¹²±äÁ¿¶¨ÒåÇøÓò=============================

g_InfoHeader = "<color=green>Vâ L©m §Æc Sø<color>: "

tEnterPosTable =
{
	[1] = {969,1633,3263},
	[2] = {969,1610,3238},
	[3] = {969,1641,3236},
	[4] = {969,1581,3220},
	[5] = {969,1628,3176},
	[6] = {969,1578,3146},
	[7] = {969,1679,3115},
	[8] = {969,1641,3048},
	[9] = {969,1536,3039},
	[10] = {969,1565,2953},
	[11] = {969,1600,3004},
	[12] = {969,1604,3054},
}

--==============================Ö÷Âß¼­ÇøÓò===============================
function main()
	if is_first_tong_jpz_open() == 0 then
		Say(g_InfoHeader.."H«m nay kh«ng cã ho¹t ®«ng bang héi tinh anh, ®îi h«m kh¸c h½ng ®Õn nhÐ.",0)
		return
	end

	local selTab = {
				"Ta muèn tham gia ho¹t ®«ng bang héi tinh anh/join_huashan",
				"Ta chØ ®Õn xem thö/nothing"
				}
	Say(g_InfoHeader.."Ho¹t ®éng bang héi ®· b¾t ®Çu, thiÕu hiÖp muèn xem t×nh h×nh.",getn(selTab),selTab)

end

--²Î¼ÓµÚÒ»°ï»î¶¯
function join_huashan()
	if GetPlayerRoute() == 0 then
		Talk(1,"",g_InfoHeader.."V« m«n ph¸i kh«ng thÓ tham gia ho¹t ®éng bang héi tinh anh!")
		return
	end
	
	local time_distance = START_TIME - Zgc_pub_today_sec_num_rtn()
	if time_distance > 0 then
		Talk(1,"",g_InfoHeader.."Ho¹t ®éng bang héi tinh anh vÉn ch­a b¾t ®Çu, xin mêi ®îi! "..Zgc_pub_time_sec_change(time_distance,0).." _cã thÓ vµo!")
		return
	end
	
	local OldWorld = SubWorld
	SubWorld = SubWorldID2Idx(HUASHAN_MAP_ID)
	if SubWorld >= 0 then
		if GetMissionV(MV_MISSION_STATE) == 0 then
			Talk(1,"",g_InfoHeader.."Ho¹t ®éng bang héi tinh anh ch­a b¾t ®©u, xin mêi ®îi thªm chót n÷a!")
		elseif GetMissionV(MV_MISSION_STATE) == 1 or GetMissionV(MV_MISSION_STATE) == 2 then
--			if GetMissionV(MV_TEAM_NUM) < MAX_TEAM_NUM then
				if check_enter() == 1 then
					goto_huashan()
				end
--			else
--				Talk(1,"",g_InfoHeader.."±¾´ÎÌìÏÂµÚÒ»°ï»î¶¯±¨Ãû¶ÓÎéÊýÒÑ´ï "..MAX_TEAM_NUM.."£¬Î´ÄÜ²Î¼Ó±¾´ÎÌìÏÂµÚÒ»°ï»î¶¯µÄÍæ¼ÒÇëµÈ´ýÏÂ´Î»î¶¯µÄ¿ªÊ¼¡£")
--			end
--		elseif GetMissionV(MV_MISSION_STATE) == 2 then
--			Talk(1,"",g_InfoHeader.."ÌìÏÂµÚÒ»°ï»î¶¯ÒÑÍ£Ö¹±¨Ãû£¬Î´ÄÜ²Î¼Ó±¾´Î»î¶¯µÄÍæ¼ÒÇëµÈ´ýÏÂ´Î»î¶¯µÄ¿ªÊ¼¡£")
		elseif GetMissionV(MV_MISSION_STATE) == 3 then
			Talk(1,"",g_InfoHeader.."Ho¹t ®éng bang héi tinh anh ®· kÕt thóc, nh÷ng ng­êi ch­a tham gia ®­îc lÇn nµy xin mêi ®îi lÇn ho¹t ®éng tíi.")
		else
			WriteLog(g_LogTitle.."[Error]: the state of MISSION is error, the error value is : "..GetMissionV(MV_MISSION_STATE) )
		end
	else
		WriteLog(g_LogTitle.."[Error]: In wulinteshi_npc.lua, the value of SubWorld is error, the error value is : "..SubWorld)
	end
	SubWorld = OldWorld
end

--´«ËÍµ½»ªÉ½
function goto_huashan()
	local nRandom = random(1, getn(tEnterPosTable))
	local nOldPlayer = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex > 0 then
			CleanInteractive()

			if NewWorld(tEnterPosTable[nRandom][1],tEnterPosTable[nRandom][2],tEnterPosTable[nRandom][3]) ~= 1 then
				Msg2Player("ChuyÓn ®Þa ®iªm thÊt b¹i, ®¹i hiÖp kh«ng thÓ tiÕn vµo b¶n ®å Hoa S¬n")
				LeaveTeam()
				WriteLog(g_LogTitle.."[Account: "..GetAccount().."][Role Name:"..GetName().."] Sending failed, time : "..date("%Y%m%d%H%M"))
			end
		end
	end
	
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		AddMSPlayer(MISSION_ID,0)
		JoinMission(MISSION_ID,0)
--		Msg2Player("You have switched to the pk and die-without-fine condition!")
	end
	PlayerIndex = nOldPlayer

	SetMissionV(MV_TEAM_NUM, (GetMissionV(MV_TEAM_NUM)+1) )
	Msg2MSAll(MISSION_ID, GetName().." dÉn d¾t (gåm cã "..GetTeamSize().."  ng­êi) ®· vµo Hoa S¬n, hiÖn t¹i ë Hoa S¬n cã sè tæ ®éi  "..GetMissionV(MV_TEAM_NUM))
end

-- ¶ÓÎé½øÈëÌõ¼þÅÐ¶Ï
function check_enter()
	local szItemName = "Vâ L©m LÖnh Bµi"
	local nSize = GetTeamSize()
	local nMapID = GetWorldPos()
	local szTongName = GetTongName()

	if is_team_captain() ~= 1 or is_tong_captain() ~= 1 then
		Talk(1,"",g_InfoHeader.."B¾t buéc ph¶i bang chñ tæ ®éi míi cã thÓ tiÕn vµo ®­îc")
		return 0
	end
	if nSize < 2 then
		Talk(1,"",g_InfoHeader.."Sè ng­êi trong tæ ®éi ph¶i lín hoÆc b»ng 2 ng­êi")
		return 0
	end

	local OldPlayer = PlayerIndex
	for i=1, nSize do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex > 0 then
			if GetTongName() ~= szTongName then
				PlayerIndex = OldPlayer
				Talk(1,"",g_InfoHeader.."Trong tæ ®éi cã ng­êi kh¸c bang héi, kh«ng thÓ tham gia ho¹t ®éng bang héi tinh anh!")
				return 0
			end		
			if GetPlayerRoute() == 0 then
				PlayerIndex = OldPlayer
				Talk(1,"",g_InfoHeader.."V« m«n ph¸i kh«ng thÓ tham gia ho¹t ®éng bang héi tinh anh!")
				return 0
			end
			if IsStalling() == 1 then
				PlayerIndex = OldPlayer
				Talk(1,"",g_InfoHeader.."Trong tæ ®éi vÉn cã ng­êi ®ang b¸n hµng, kh«ng thÓ tham gia ho¹t ®éng bang héi tinh anh!")
				return 0
			end
			if GetWorldPos() ~= nMapID then
				PlayerIndex = OldPlayer
		    	Talk(1,"",g_InfoHeader.."TÊt c¶ thµnh viªn b¾t buéc ph¶i trong cïng 1 b¶n ®å")
				msg_2_team("TÊt c¶ thµnh viªn b¾t buéc ph¶i trong cïng 1 b¶n ®å")
				return 0
			end
		end
	end
	PlayerIndex = OldPlayer

	--ÎäÁÖÁîÅÆ´æÔÚ¼ì²â
	if GetItemCount(2,1,29000) == 0 then
		Talk(1,"","Xin x¸c nhËn trªn ng­êi cã mang <color=green>"..szItemName.."<color>!")
		return 0
	end
	--ÎäÁÖÁîÅÆ¿Û³ý³É¹¦¼ì²â
	if DelItem(2,1,29000,1) == 0  then
		Talk(1,"","Xin x¸c nhËn trªn ng­êi cã mang <color=green>"..szItemName.."<color>!")
		return 0
	end
	
	return 1
end
