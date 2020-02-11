--=============================================
--create by xiongyizhi 2010.11.2
--describe:越南版2010年12月活动1 初始化文件
--=============================================

Include("\\script\\online_activites\\2010_12\\activites_01\\head.lua");--活动头文件

function ServerStartUp(nStartTime, nEndTime)
    if gf_CheckEventDateEx2(0, nEndTime) == 1 then
    end
end

function PlayerLogin(ExchangeComing, nStartTime, nEndTime)
    if gf_CheckEventDateEx(VET_201012_01_EVENT_NUMBER) == 1 then
        VET_201012_01_GivePlayerLoginItem();
    end
end

