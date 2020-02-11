--=============================================
--create by zhangming 2010.8.20
--describe:越南版2010年9月活动1 初始化文件
--=============================================

Include("\\script\\online_activites\\2010_09\\activites_01\\head.lua");--活动头文件

function ServerStartUp(nStartTime, nEndTime)
    if gf_CheckEventDateEx2(0, nEndTime) == 1 then
    end
end

function PlayerLogin(ExchangeComing, nStartTime, nEndTime)
--    if gf_CheckEventDateEx(VET_201009_01_EVENT_NUMBER) == 1 then
--        VET_201009_01_GivePlayerLoginItem();
--    end
end

