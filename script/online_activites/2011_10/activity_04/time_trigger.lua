--by liubo
Include("\\script\\online_activites\\2011_10\\activity_04\\plant_flower.lua")

function OnTimer()
     local nTime = tonumber(GetTime())
     if nTime >= (VET_201111_ROSE_TaskGroup:GetTask(VET_201111_ROSE_TaskGroup.Time_End)) then
        RemoveTrigger(GetTrigger(VET_201111_TIME_USER_DEFINE))
    	  return 0
     end
     local nRoseIndex = VET_201111_ROSE_TaskGroup:GetTask(VET_201111_ROSE_TaskGroup.Npc_Index)
	local nNum = GetTeamSize()
	local nOldNumber = mod(GetTask(TSK_TRONGHOA), 10)
	local ncapIndexOld = floor(GetTask(TSK_TRONGHOA) / 10)
	local nOldPlayerIdx = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
    		if GetCaptainName() == GetName() then
    			nCapIndex = PlayerIndex
    			break
    		end
	end
	PlayerIndex = nOldPlayerIdx
	
	if nNum > 5 then
		nNum = 5
	end
	if nNum < 2 then
		nNum = 2
	end
	if nNum > nOldNumber then
		nNum = nOldNumber 
	end
	
    	local nNpcMapId, nNpcMapX, nNpcMapY = GetNpcWorldPos(nRoseIndex)
	local nExpNum = VET_201111_TB_VALUE[nNum-1][1]
	if GetNpcName(nRoseIndex) == VET_201111_TB_NPCS[2][2] then
		nExpNum = VET_201111_TB_VALUE[nNum-1][2]
	end	
     local nPlayerMapId, nPlayerMapX, nPlayerMapY = GetWorldPos()
     local nDist = DistanceBetweenPoints(nNpcMapId, nNpcMapX, nNpcMapY, nPlayerMapId, nPlayerMapX, nPlayerMapY)
	if  (ncapIndexOld ~= nCapIndex) or (GetTeamSize() == 0) then
		SetTask(TSK_TRONGHOA, 0)
		RemoveTrigger(GetTrigger(VET_201111_TIME_USER_DEFINE))
	end	
	if nDist >= 0 and nDist <= 24 then
		ModifyExp(nExpNum)
		Msg2Player("B¹n nhËn ®­îc "..nExpNum.." ®iÓm kinh nghiÖm")
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	end
end