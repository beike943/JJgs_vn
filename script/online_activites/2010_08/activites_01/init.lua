--=============================================
--create by zhangming 2010.7.15
--describe:越南版2010年8月活动1 初始化文件
--=============================================

Include("\\script\\online_activites\\2010_08\\activites_01\\head.lua");--活动头文件

function ServerStartUp(nStartTime, nEndTime)
    if gf_CheckEventDateEx2(0, nEndTime) == 1 then
    end
end

function PlayerLogin(ExchangeComing, nStartTime, nEndTime)
    if gf_CheckEventDateEx2(0, nEndTime) == 1 then
        VET_20100801_GivePlayerLoginItem()
    end
end

