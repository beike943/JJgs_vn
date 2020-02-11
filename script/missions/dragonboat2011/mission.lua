--½Å±¾¹¦ÄÜ£ºº£ÉÏÁúÖÛÕ¾¹Ø¿¨µ÷ÓÃ
--¹¦ÄÜÉè¼Æ£º´óÐÜ¡¢Ð¡ÓîÖæ
--¹¦ÄÜ¿ª·¢£º²¨²¨¡¢´å³¤
--¹¦ÄÜ²âÊÔ£ºÐ¡ÐÜ¡¢·¹½ã
--¿ª·¢Ê±¼ä£º2011-8-23
--ÐÞ¸Ä¼ÇÂ¼£º
Include("\\script\\missions\\dragonboat2011\\lzz_function.lua")

function InitMission()
	--print("InitMission called")
	-- ³õÊ¼»¯Ò»Ð©ÉèÖÃ
	LZZ_InitBattle()
end
function RunMission()
	--print("RunMission() called!")
	local nMapId = gf_GetCurMapID()
	local nNpcIdx = 0
	LZZ_RunBattle()
end
function EndMission()
	--print("EndMisssion() called!")
	local nPlayerOne = GetMSPlayerCount(MISSIONID,CampSong_ID) 
	local nPlayerTwo = GetMSPlayerCount(MISSIONID,CampLiao_ID) 	
	WriteLog("[H¶i ChiÕn Long Ch©u kÕt thóc]: thêi gian t¹i"..GetMissionV(MV_LZZ_LOG_TIME).."H¶i ChiÕn Long Ch©u ®· kÕt thóc, sè ng­êi cuèi cïng:["..nPlayerOne.."]:["..nPlayerTwo.."], tæng sè ng­êi lµ: "..(nPlayerOne+nPlayerTwo))  
	LZZ_ProcessBattleOver() 
	local nMapID = GetMissionV(MV_LZZ_MAP_ID) 	
	ClearMapNpc(nMapID) 
	local nMapIdx = GetMissionV(MV_LZZ_MAP_INDEX) 
	LZZ_ClearMissionData() 
	local nRetCode = FreeDynamicMap(nMapID,nMapIdx) 	--FreeDynamicMapÒ²»áµ÷ÓÃCloseMisssion
	if nRetCode ~= 1 then
		WriteLog(tSTRING_MISSION_LOG[2]..nRetCode) 
	end 		
end
function JoinMission(RoleIndex,nCamp)
	--print("JoinMission called!")
	PlayerIndex = RoleIndex
	LZZ_JoinBattle(nCamp)
	PlayerIndex = RoleIndex
end
function OnLeave(RoleIndex)
	--print("OnLeave() called!")
	PlayerIndex = RoleIndex
	LZZ_LeaveBattle()
	PlayerIndex = RoleIndex
end
