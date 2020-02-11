--===================================
--创建boss脚本
--创建时间 2010-03-17
--===================================
Include ("\\script\\online_activites\\reborn\\task\\boss\\boss_head.lua")
Include ("\\script\\online_activites\\reborn\\task\\head.lua")

function main ()
    do return end
    local nWeek = tonumber(date("%w"))
    local nHour = tonumber(date("%H"))
    if nWeek >= 2 and nWeek <= 4 then
        return
    end
    local nTeamTeskNum = GetGlbValue(GLB_200912_TEAM_TASK_NUM)
    for i = 1, 4 do
        local nTemp = mod(nTeamTeskNum,10)
        local nBossNum = 0
        nTeamTeskNum = nTeamTeskNum / 10
        if nTemp > 5 then
            if nHour == 16 then
                nBossNum = 1
            elseif nHour == 22 then
                nBossNum = 1
            end
        elseif nTemp >= 1 and nTemp <= 5 then
            if nHour == 16 then
                nBossNum = 1
            elseif nHour == 22 then
                nBossNum = 0
            end
        end
        if nBossNum == 1 then
            local nRandom = random(1,getn(VET_201003_TB_BOSS_APPEAR_MAPID[5-i]))
            local nNpcIndex = CreateNpc(VET_201003_TB_BOSS_INF[5-i][1],VET_201003_TB_BOSS_INF[5-i][2],
            VET_201003_TB_BOSS_APPEAR_MAPID[5-i][nRandom][1],
            VET_201003_TB_BOSS_APPEAR_MAPID[5-i][nRandom][2],
            VET_201003_TB_BOSS_APPEAR_MAPID[5-i][nRandom][3])
            if nNpcIndex ~= 0 then
                SetNpcScript(nNpcIndex,VET_201003_TB_BOSS_INF[5-i][3])
                local nMinute, nSecond = tonumber(date("%M")), tonumber(date("%S"))
                local nTimeLeft = 86400 - nHour * 3600 - nMinute * 60 - nSecond
            SetNpcLifeTime(nNpcIndex, nTimeLeft)
                AddGlobalNews(format(VET_200912_STR_BOSS_BE_BIRTH_HINT,VET_201003_TB_BOSS_INF[5-i][2],VET_201003_TB_BOSS_APPEAR_MAPID[5-i][1][4]))
            end
        end
    end
end
