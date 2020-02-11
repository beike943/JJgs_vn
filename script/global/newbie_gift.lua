Include("\\script\\online_activites\\xinshouzhiyin\\head.lua")

--点击领取回调函数
function GetAward(nAwardId)
	do return end
    if GetPlayerRebornParam(0) ~= 0 then --转生玩家不促发
        return
    end
    if nAwardId >= 1 and nAwardId <= 5 then
        local nCreateTime = GetCreateTime()
        local nNowTime = GetTime()
        local nDifTime = nNowTime - nCreateTime
        local nTimes = {5*60, 10*60, 15*60, 20*60, 40*60}
        if nDifTime >= nTimes[nAwardId] then
            get_onling_award(nAwardId)
        else
            Talk(1,"", VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[112])
        end
    end
    if nAwardId >= 6 and nAwardId <= 8 then
        local nHaveGetLoginAward = GetTask(VET_201009_00_TASK_GET_LOGIN_AWARD)
        local nCreateTime = GetCreateTime()
        local nNowTime = GetTime()
        local nDifTime = nNowTime - nCreateTime
        local nDaysAward = 0
        local nTimes = {3600*24, 3600*48, 3600*72}
        local nMods = {1,10,100}
        if nDifTime >= nTimes[nAwardId-5] then
            nDaysAward = mod(nHaveGetLoginAward/nMods[nAwardId-5],10)
            if nDaysAward == 0 then
                nDaysAward = 2
            end
        end
        get_login_award(nDaysAward, nAwardId-5)
    end
    --等级成长奖励
    if nAwardId >= 9 and nAwardId <= 22 then
        local nHaveGetLevelAward = GetTask(VET_201009_00_TASK_GET_LEVEL_AWARD)
        local nLevelFlag = 0
        local nLevels = {10,15,20,25,30,35,40,45,50,55,60,65,70,75}
        local nLevel = GetLevel()
        for i = 1, nAwardId-8 do
            nLevelFlag = mod(nHaveGetLevelAward,2)
            nHaveGetLevelAward = floor(nHaveGetLevelAward / 2)
        end
        if nLevelFlag == 0 then
            nLevelFlag = 2
        end
        get_level_award(nLevelFlag+(nAwardId-8)*10)
    end
    --完成任务奖励
    if nAwardId >= 23 and nAwardId <= 31 then
        local tbTaskValue = {{1,24},{150,33},{119,29},{140,61},{1401,125},{1402,85},{1318,10},{2031,75}}
        local nFlag = {0,0,0,0,0,0,0,0,0}
        local nNum = 0
        local nHaveGetTaskAward = GetTask(VET_201009_00_TASK_GET_TASK_AWARD)
        if nHaveGetTaskAward == nil then
            nHaveGetTaskAward = 0
        end
        for i = 1, 8 do
            if GetTask(tbTaskValue[i][1]) < tbTaskValue[i][2] then
                nFlag[i] = 0
            else
                nFlag[i] = 2
                nNum = nNum + 1
            end
        end 
        if nNum == 8 then
            nFlag[9] = 2
        end
    		local nByte = 1
    		for i = 1, 9 do
        	if mod(floor(nHaveGetTaskAward/nByte),10) ~= 0 and nFlag[i] == 2 then
          	  nFlag[i] = 1
        	end
        	nByte = nByte * 10
    		end        
        get_task_award((nAwardId-22)*10+nFlag[nAwardId-22])
    end
    if nAwardId >= 32 and nAwardId <= 48 then
        local nHaveAccomplish = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
        nHaveAccomplish = getResultOfAllFirst()
        local nChengzhang = GetTask(VET_201009_00_TASK_CHENGZHANG)
        local nCount = 1
		    while nChengzhang > 0 do
		        if 1 == mod(nChengzhang, 2) then
		        	nHaveAccomplish[nCount] = 1;
		        end
		        nChengzhang = floor(nChengzhang / 2)
		        nCount = nCount + 1
		    end        
        get_chengzhang_award((nAwardId-31)*10+nHaveAccomplish[nAwardId-31])
    end
end
