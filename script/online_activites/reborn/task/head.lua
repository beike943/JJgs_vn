--==================================================
--create by zhangming 2009.12.25
--describe: 越南版 转生任务 头文件
--related files:
--==================================================
Include ("\\script\\online_activites\\task_values.lua")
Include ("\\script\\online_activites\\reborn\\task\\string.lua")
Include ("\\Script\\lib\\globalfunctions.lua")

LONGZISHI = 1 --龙子使
HUZISHI   = 2 --虎子使
YINGZISHI = 3 --鹰子使
FENGZISHI = 4 --凤子使
HAVE_NO_QUALIFICATION = 0 --没有资格转生
HAVE_QUALIFICATION   = 1  --可以转生
HAVE_ZS_ONCE = 2   --已经转生一次

tb_poetical_justice_item = {
    {{2,0,399,1},VET_200912_STR_POETICAL_JUSTICE_ITEM_NAME[1]},
    {{2,0,400,1},VET_200912_STR_POETICAL_JUSTICE_ITEM_NAME[2]},
    {{2,0,401,1},VET_200912_STR_POETICAL_JUSTICE_ITEM_NAME[3]},
    {{2,0,402,1},VET_200912_STR_POETICAL_JUSTICE_ITEM_NAME[4]},
    {{2,0,403,1},VET_200912_STR_POETICAL_JUSTICE_ITEM_NAME[5]},
    {{2,0,404,1},VET_200912_STR_POETICAL_JUSTICE_ITEM_NAME[6]},
    {{2,0,405,1},VET_200912_STR_POETICAL_JUSTICE_ITEM_NAME[7]},
    {{2,0,406,1},VET_200912_STR_POETICAL_JUSTICE_ITEM_NAME[8]},
    {{2,0,1037,1},VET_200912_STR_POETICAL_JUSTICE_ITEM_NAME[9]},
}

tb_salvage_item = {
    {{{1,1,2,100},VET_200912_STR_SALVAGE_ITEM_NAME[1]}},
    {{{1,1,3,100},VET_200912_STR_SALVAGE_ITEM_NAME[2]}},
    {{{1,1,4,100},VET_200912_STR_SALVAGE_ITEM_NAME[3]}},
    {{{1,1,5,100},VET_200912_STR_SALVAGE_ITEM_NAME[4]}},
    {{{1,1,6,100},VET_200912_STR_SALVAGE_ITEM_NAME[5]}},
    {{{1,1,7,100},VET_200912_STR_SALVAGE_ITEM_NAME[6]}},
    {{{1,1,8,100},VET_200912_STR_SALVAGE_ITEM_NAME[7]}},
    {{{1,1,9,100},VET_200912_STR_SALVAGE_ITEM_NAME[8]}},
}


--==============================================
--function describe:用于扩展Say函数功能
--function params : tbMsg npc说的话及选项表
--function return value: 无返回值
--remark: 表结构只有一层表，例：tb = {"",""}
--===============================================
function gf_Say(tbMsg)
    local num = getn(tbMsg)
    local szmsg = ""
    local option = ""
    szmsg = szmsg..""..format("%q",tbMsg[1])..","..(num-1)..","
    for i = 2, num do
        option = option..format("%q",tbMsg[i])
        if i ~= num then
            option = option..","
        end
    end
    szmsg = "Say("..szmsg.."{"..option.."})"
    --Msg2Player(szmsg)
    dostring(szmsg)
    return
end


--==============================================
--function describe:判断是否有转生的资格
--function params : 无
--function return value: true可以转生否则不能
--===============================================
function CheckZSQualification()
    --现在仅限一转
    if GetPlayerRebornParam(0) ~= 0 then
        --Talk(1,"",VET_201003_STR_ERROR[1])
        return HAVE_ZS_ONCE
    end
    --print("CheckZSQualification")
    --等级99
    local nPlayLevel = GetLevel()
    if nPlayLevel < 99 then
        Say(VET_200912_STR_ZS_ERROR[2],0)
        return HAVE_NO_QUALIFICATION
    end
    --经验20亿
    local nPlayExp = GetExp()
    if nPlayExp < 2000000000 then
        Say(VET_200912_STR_ZS_ERROR[3],0)
        return HAVE_NO_QUALIFICATION
    end
    --师门贡献10000
    local nPlayFactionRepu = GetTask(336)
    if nPlayFactionRepu < 10000 then
        Say(VET_200912_STR_ZS_ERROR[4],0)
        return HAVE_NO_QUALIFICATION
    end
    --声望10000
    local nPlayReputation = GetReputation()
    if nPlayReputation < 10000 then
        Say(VET_200912_STR_ZS_ERROR[5],0)
        return HAVE_NO_QUALIFICATION
    end
    --宋/辽军功80000
    local nPlayJunGong = abs(GetTask(VET_200912_TASK_JUNGONG))
    if nPlayJunGong < 80000 then
        Say(VET_200912_STR_ZS_ERROR[6],0)
        return HAVE_NO_QUALIFICATION
    end
    --if GetPlayerFaction() == 0 then
    --    Say(VET_200912_STR_ZS_ERROR[9],0)
    --    return HAVE_NO_QUALIFICATION
    --end
    --if gf_Check55FullSkill() == 0 then
    --    Say(VET_200912_STR_ZS_ERROR[10],0)
    --    return HAVE_NO_QUALIFICATION
    --end
    --两次转生时间需要间隔6个月
    local nDate = tonumber(date("%Y%m%d"))
    local nDateLastZS = GetLastZsDate()
    local ifCanZs, timeNextCanZs = check_ZS_time(nDate, nDateLastZS)
    if ifCanZs == 0 then
        local nYearNext, nMonthNext, nDayNext = floor(timeNextCanZs/10000),
                                                mod(floor(timeNextCanZs/100),100),
                                                mod(timeNextCanZs,100)
        local addAnZero =""
        if nYearNext < 10 then
            addAnZero = "0"
        end
        Say(format(VET_200912_STR_ZS_ERROR[7],nYearNext,nMonthNext,nDayNext),0)
        return HAVE_NO_QUALIFICATION
    end
    --全部满足可以转生
    return HAVE_QUALIFICATION
end

--获取上次转生年月日
function GetLastZsDate()
    return GetTask(VET_200912_TASK_ZS_DATE)
end

--==============================================
--function describe:判断离上次转生时间是否到6个
--function params : timeNow当前的日期
--                  timeLastZS 上次转生的日期
--function return value: 如果到6个月返回1
--         否则返回0,并返回下次可以转生的时间
--===============================================
function check_ZS_time(timeNow, timeLastZS)
    if timeLastZs == 0 then
        return 1
    end
    local timeNextCanZs = timeLastZS
    local monthNextCanZs = mod(floor(timeLastZS/100),100)
    monthNextCanZs = monthNextCanZs + 6
    if monthNextCanZs > 12 then
        timeNextCanZs = timeNextCanZs + 10000 - 600
    else
        timeNextCanZs = timeNextCanZs + 600
    end
    if timeNow >= timeNextCanZs then
        return 1
    end
    return 0, timeNextCanZs
end


--==============================================
--function describe:接受转生任务
--function params : 无 
--function return value: 无
--===============================================
function AcceptZSTask()
    local nAcceptTaskNpc = GetTask(VET_200912_TASK_ZISHI_TYPE)
    TaskTip(format(VET_200912_STR_ACCEPT_ZS_TASK[1],VET_200912_STR_NPC_NAME[nAcceptTaskNpc]))
    SetTask(VET_200912_TASK_ZS_STATE,1)
end

--==============================================
--function describe:接受转生任务后续任务
--function params : 无 
--function return value: 无
--===============================================
function FollowUpTask()
    local nZSTaskStep = GetTask(VET_200912_TASK_ZS_STATE)
    if nZSTaskStep <= 0 or nZSTaskStep >= 6 then
        gf_WriteLogEx(VET_200912_STR_EVENTNAME,VET_200912_STR_ACTIONS[3])
        return
    end
    if nZSTaskStep == 1 then --已经激活转生任务 没有接受惩恶任务
        gf_Say(VET_200912_STR_FOLLOW_UP_TASK_TALK[nZSTaskStep])
        return
    end
    if nZSTaskStep == 2 then --已经激活转生任务 接受惩恶任务
        gf_Say(VET_200912_STR_FOLLOW_UP_TASK_TALK[nZSTaskStep])
        return
    end
    if nZSTaskStep == 3 then --已经完成惩恶任务 没有接受救难任务
        local nrandom = random(1,getn(tb_salvage_item))
        SetTask(VET_200912_TASK_JIUNAN_TYPE,nrandom)
        gf_Say({format(VET_200912_STR_FOLLOW_UP_TASK_TALK[nZSTaskStep][1],tb_salvage_item[nrandom][1][1][4],tb_salvage_item[nrandom][1][2]),VET_200912_STR_FOLLOW_UP_TASK_TALK[nZSTaskStep][2],VET_200912_STR_FOLLOW_UP_TASK_TALK[nZSTaskStep][3],VET_200912_STR_FOLLOW_UP_TASK_TALK[nZSTaskStep][4]})
        return
    end
    if nZSTaskStep == 4 then --已经完成惩恶任务 接受救难任务
        local nrandom = GetTask(VET_200912_TASK_JIUNAN_TYPE)
        gf_Say({format(VET_200912_STR_FOLLOW_UP_TASK_TALK[nZSTaskStep][1],tb_salvage_item[nrandom][1][1][4],tb_salvage_item[nrandom][1][2]),VET_200912_STR_FOLLOW_UP_TASK_TALK[nZSTaskStep][2],VET_200912_STR_FOLLOW_UP_TASK_TALK[nZSTaskStep][3],VET_200912_STR_FOLLOW_UP_TASK_TALK[nZSTaskStep][4]})
    end
    if nZSTaskStep == 5 then --完成救难任务 可以转生
        gf_Say(VET_200912_STR_FOLLOW_UP_TASK_TALK[nZSTaskStep])
        return
    end
end

function get_poetical_justice_task()
    SetTask(VET_200912_TASK_ZS_STATE,2)
    TaskTip(VET_200912_STR_TALK[25])
end

function get_salvage_task()
    SetTask(VET_200912_TASK_ZS_STATE,4)
    TaskTip(VET_200912_STR_TALK[26])
end

--==============================================
--function describe:惩恶任务
--function params : 无 
--function return value: 无
--===============================================
function poetical_justice_task()
    local nAcceptTaskNpc = GetTask(VET_200912_TASK_ZISHI_TYPE)
    if check_task_item(tb_poetical_justice_item) == 0 then
        return
    end
    if delect_task_item(tb_poetical_justice_item) == 0 then
        return
    end
    TaskTip(format(VET_200912_STR_ACCEPT_ZS_TASK[2],VET_200912_STR_NPC_NAME[nAcceptTaskNpc]))
    SetTask(VET_200912_TASK_ZS_STATE,3)
end


--==============================================
--function describe:救难任务
--function params : 无 
--function return value: 无
--===============================================
function salvage_task()
    local nAcceptTaskNpc = GetTask(VET_200912_TASK_ZISHI_TYPE)
    local nRandom = GetTask(VET_200912_TASK_JIUNAN_TYPE)
    if check_task_item(tb_salvage_item[nRandom]) == 0 then
        return
    end
    if delect_task_item(tb_salvage_item[nRandom]) == 0 then
        return
    end
    TaskTip(format(VET_200912_STR_ACCEPT_ZS_TASK[3],VET_200912_STR_NPC_NAME[nAcceptTaskNpc]))
    SetTask(VET_200912_TASK_ZS_STATE,5)
end


--==============================================
--function describe:检查任务物品是否收集完成
--function params : 对应的物品表
--function return value: 0没有完成 1收集完成
--===============================================
function check_task_item(tb_task_item)
    local have_all_poetical_item = 1
    local num = getn(tb_task_item)
    for i = 1, num do
        if GetItemCount(tb_task_item[i][1][1],tb_task_item[i][1][2],tb_task_item[i][1][3]) < tb_task_item[i][1][4] then
            have_all_poetical_item = 0
            break
        end
    end
    if have_all_poetical_item == 0 then
        Say(VET_200912_STR_SCARCITY_ITEM_ERROR[1],0)
        return 0
    end
    return 1
end

--=====================================================
--function describe:删除任务物品
--function params : 对应的物品表
--function return value: 0有物品删除失败 1全部删除成功
--=====================================================
function delect_task_item(tb_task_item)
    local have_all_poetical_item = 1
    local num = getn(tb_task_item)
    for i = 1, num do
        if GetItemCount(tb_task_item[i][1][1],tb_task_item[i][1][2],tb_task_item[i][1][3]) 
                                                                < tb_task_item[i][1][4] then
            have_all_poetical_item = 0
            break
        end
        local is_delect_item_success = DelItem(tb_task_item[i][1][1],tb_task_item[i][1][2],
                                               tb_task_item[i][1][3],tb_task_item[i][1][4])
        if is_delect_item_success == 1 then
            --Msg2Player("删除"..tb_task_item[i][1][4].."成功")
            --物品删除成功记录log
            gf_WriteLogEx(VET_200912_STR_EVENTNAME,VET_200912_STR_ACTIONS[1],tb_task_item[i][1][4],tb_task_item[i][2])
        end
        if is_delect_item_success == 0 then
            have_all_poetical_item = 0
            gf_WriteLogEx(VET_200912_STR_EVENTNAME,VET_200912_STR_ACTIONS[2],tb_task_item[i][1][4],tb_task_item[i][2])
            break
        end
    end
    if have_all_poetical_item == 0 then
        Say(VET_200912_STR_SCARCITY_ITEM_ERROR,0)
        return 0
    end
    return 1
end

--==============================================
--function describe:完成所有任务确认转生
--function params : 无 
--function return value: 无
--===============================================
function Finish_ZS()
	if gf_Judge_Room_Weight(1,0," ") ~= 1 then
		return
	end 
    --等级变1
    --经验变0
    --门会标记
    --转生次数加1
    local nMenHuiType = GetTask(VET_200912_TASK_ZISHI_TYPE)
    PlayerReborn(1,nMenHuiType)
    ModifyExp(-GetExp())
    --SetTask(VET_200912_TASK_ZS_TIMES,1)
    SetTask(VET_200912_TASK_MENHUI_TYPE,nMenHuiType)
    SetTask(VET_200912_TASK_ZS_STATE,6)
    SetTask(VET_200912_TASK_ZISHI_TYPE,0)
    SetTask(VET_200912_TASK_JIUNAN_TYPE,0)
    SetTask(VET_200912_TASK_ZS_DATE,tonumber(date("%Y%m%d")))
    gf_AddItemEx2(VET_200912_TB_MENHUIYIN[nMenHuiType][2],VET_200912_TB_MENHUIYIN[nMenHuiType][1],VET_200912_STR_EVENTNAME,VET_200912_STR_ACTIONS[4],0,1)
    AddTitle(61,nMenHuiType)
    SetCurTitle(61,nMenHuiType)
    Say(format(VET_200912_STR_XIAXIANTISHI[1][1],VET_200912_STR_MENHUI_NAME[GetTask(VET_200912_TASK_MENHUI_TYPE)]),2,{VET_200912_STR_XIAXIANTISHI[1][2],VET_200912_STR_XIAXIANTISHI[1][3]})
end

function VET_201003_REBOOT_CLIENT()
    SetTask(VET_200912_TASK_ZS_STATE,0)
    ExitGame()
end

function VET_201003_MaskSureAgain(nMenHuiType)
    local tbSay = {format(VET_200912_STR_TALK[8],nMenHuiType),VET_200912_STR_TALK[9]}
    Say(format(VET_200912_STR_TALK[7],VET_200912_STR_MENHUI_NAME[nMenHuiType]),getn(tbSay),tbSay)
end

function VET_201003_JoinMenHui(nMenHuiType)
    SetTask(VET_200912_TASK_ZS_STATE,1)
    SetTask(VET_200912_TASK_ZISHI_TYPE,nMenHuiType)
    Talk(1,"",format(VET_200912_STR_TALK[10],VET_200912_STR_MENHUI_NAME[nMenHuiType]))
end

--了解团队任务详情
function team_task_detailse()
    gf_Say(VET_200912_STR_TEAM_TASK_DETAILSE)
    return
end

--了解各门会的详情
function menhui_detailse(nMenHuiType)
    gf_Say(VET_200912_STR_MENHUI_DETAILSE[nMenHuiType])
    return
end


function VET_201003_ActiveTeamTask()
    local nWeekDay = tonumber(date("%w"))
    local nHour = tonumber(date("%H"))
    if nWeekDay >= 2 and nWeekDay <= 4 then
        Say(VET_201003_STR_TEAM_TASK_TALK[6],0)
        return
    end
    if nHour < 8 or nHour >= 14 then
        Say(VET_201003_STR_TEAM_TASK_TALK[6],0)
        return
    end
    local nDate = tonumber(date("%y%m%d"))
    if nDate <= GetTask(VET_200912_TASK_TEAM_TASK_DATE) then
        Say(VET_201003_STR_TEAM_TASK_TALK[5],0)
        return
    end
    SetTask(VET_200912_TASK_TEAM_TASK_DATE,nDate)
    if nDate > GetGlbValue(GLB_200912_TEAM_TASK_DATE) then
        SetGlbValue(GLB_200912_TEAM_TASK_DATE,nDate)
        SetGlbValue(GLB_200912_TEAM_TASK_NUM,0)
    end
    local nMenHuiType = GetTask(VET_200912_TASK_MENHUI_TYPE)
    local nTeamTaskNum = GetGlbValue(GLB_200912_TEAM_TASK_NUM)
    local nMyMenHuiNum = 0
    local nAddNum = 0
    if nMenHuiType == 1 then
        nMyMenHuiNum = mod(nTeamTaskNum/1000,10)
        nAddNum = 1000
    elseif nMenHuiType == 2 then
        nMyMenHuiNum = mod(nTeamTaskNum/100,10)
        nAddNum = 100
    elseif nMenHuiType == 3 then
        nMyMenHuiNum = mod(nTeamTaskNum/10,10)
        nAddNum = 10
    elseif nMenHuiType == 4 then
        nMyMenHuiNum = mod(nTeamTaskNum,10)
        nAddNum = 1
    else
        return
    end
    if nMyMenHuiNum >= 9 then
        nAddNum = 0
    end
    nTeamTaskNum = nTeamTaskNum + nAddNum
    SetGlbValue(GLB_200912_TEAM_TASK_NUM,nTeamTaskNum)
    Say(VET_201003_STR_TEAM_TASK_TALK[4],0)
end

function VET_201003_ShowTeamTask()
    --激活团体任务
    local tbTeamTaskTalk = {VET_201003_STR_TEAM_TASK_TALK[2],VET_201003_STR_TEAM_TASK_TALK[7],VET_201003_STR_TEAM_TASK_TALK[3]}
    Say(VET_201003_STR_TEAM_TASK_TALK[1],getn(tbTeamTaskTalk),tbTeamTaskTalk)
end

function VET_201003_BAOMA()
    gf_Say(VET_201003_STR_BAOMA_TALK)
end
function VET_201003_TONGBAN()
    gf_Say(VET_201003_STR_TONGBAN_TALK)
end
function VET_201003_FAGUANGWUQI()
    gf_Say(VET_201003_STR_FAGUANGWUQI_TALK)
end
function VET_201003_SHUXINGWAIZHUANG()
    gf_Say(VET_201003_STR_SHUXINGWAIZHUANG_TALK)
end
function VET_201003_SHENGJIWUQI()
    gf_Say(VET_201003_STR_SHENGJIWUQI_TALK)
end
function VET_201003_ActiveBaoMa()
    SetTask(VET_200912_TASK_JIHUO_FLAG,GetTask(VET_200912_TASK_JIHUO_FLAG)+10000)
    Say(VET_200912_STR_TALK[20],0)
end

function VET_201003_ActiveTONGBAN()
    SetTask(VET_200912_TASK_JIHUO_FLAG,GetTask(VET_200912_TASK_JIHUO_FLAG)+1000)
    Say(VET_200912_STR_TALK[20],0)
end

function VET_201003_ActiveFAGUANGWUQI()
    SetTask(VET_200912_TASK_JIHUO_FLAG,GetTask(VET_200912_TASK_JIHUO_FLAG)+100)
    Say(VET_200912_STR_TALK[20],0)
end

function VET_201003_ActiveSHUXINGWAIZHUANG()
    SetTask(VET_200912_TASK_JIHUO_FLAG,GetTask(VET_200912_TASK_JIHUO_FLAG)+10)
    Say(VET_200912_STR_TALK[20],0)
end

function VET_201003_ActiveSHENGJIWUQI()
    SetTask(VET_200912_TASK_JIHUO_FLAG,GetTask(VET_200912_TASK_JIHUO_FLAG)+1)
    Say(VET_200912_STR_TALK[20],0)
end

function VET_201003_Show_GiveUpTask()
    local tbSel = {VET_200912_STR_TALK[22],VET_200912_STR_TALK[23],VET_200912_STR_TALK[24]}
    gf_Say(tbSel)
end

function VET_201003_GiveUpTask()
    SetTask(VET_200912_TASK_ZS_STATE,0)
    SetTask(VET_200912_TASK_ZISHI_TYPE,0)
    SetTask(VET_200912_TASK_MENHUI_TYPE,0)
    SetTask(VET_200912_TASK_JIUNAN_TYPE,0)
    TaskTip(VET_200912_STR_TALK[27])    
end

function nothing()
    return
end
