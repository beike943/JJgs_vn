--=============================================
--create by zhangming 2010.8.20
--describe:越南版2010年9月活动1 初始化文件
--=============================================

Include("\\script\\online_activites\\xinshouzhiyin\\head.lua");--活动头文件

function ServerStartUp(nStartTime, nEndTime)
end

function PlayerLogin(ExchangeComing, nStartTime, nEndTime)
	do return end
    if GetPlayerRebornParam(0) ~= 0 then --转生玩家不促发
        return
    end
    VET_201009_00_AddAwardList()
    ShowAwardWindow(0)
    if GetTask(VET_201009_00_TASK_FLAG_ADDLOGIN_AWARD) == 1 then
        return
    end
    for i = 1, 8 do
        AddAward(i,VET_201009_00_TB_AWARDLIST[i],1)
    end
    SetTask(VET_201009_00_TASK_FLAG_ADDLOGIN_AWARD,1)
    VET_201009_00_GivePlayerLoginItem()
end

function VET_201009_00_AddAwardList()
    local nHaveGetTaskAward = GetTask(VET_201009_00_TASK_GET_TASK_AWARD)
    local nFlag = {
        [23] = 0,[24] = 0,[25] = 0,[26] = 0,[27] = 0,[28] = 0,[29] = 0,[30] = 0,[31] = 0,
        [32] = 0,[33] = 0,[34] = 0,[35] = 0,[36] = 0,[37] = 0,[38] = 0,[39] = 0,[40] = 0,[41] = 0,[42] = 0,[43] = 0,[44] = 0,[45] = 0,[46] = 0,[47] = 0,[48] = 0,
    }
    local nNum = 0
    local tbTaskValue = {{1,24},{150,33},{119,29},{140,61},{1318,10},{1401,135},{1402,85},{2031,75}};
    local taskLevels = {10, 40, 50, 40, 60, 60, 75, 80};
    for i = 1, 8 do
    		WriteLog("current: "..GetTask(tbTaskValue[i][1])..", threshold: "..tbTaskValue[i][2]);
        if GetTask(tbTaskValue[i][1]) >= tbTaskValue[i][2] and GetLevel() >= taskLevels[i] then
            nFlag[22+i] = 2
            nNum = nNum + 1
        end
    end
    if nNum == 8 then
        nFlag[31] = 2
    end
    nNum = 23
    while nHaveGetTaskAward > 0 do
        if mod(nHaveGetTaskAward,10) ~= 0 and nFlag[nNum] == 2 then
            nFlag[nNum] = 1
        end
        nHaveGetTaskAward = floor(nHaveGetTaskAward/10)
        nNum = nNum + 1
    end
    
    local nHaveAccomplish = getResultOfAllFirst()
    local nChengzhang = GetTask(VET_201009_00_TASK_CHENGZHANG)
    local nCount = 1
    
    while nChengzhang > 0 do
        if 1 == mod(nChengzhang, 2) then
        	nHaveAccomplish[nCount] = 1;
        end
        nChengzhang = floor(nChengzhang / 2)
        nCount = nCount + 1
    end 
    for i = 1, 17 do
        nFlag[31+i] = nHaveAccomplish[i]
    end
    for i = 23, 48 do
        if nFlag[i] == 2 then
            AddAward(i,VET_201009_00_TB_AWARDLIST[i],1)
        end
    end
end
