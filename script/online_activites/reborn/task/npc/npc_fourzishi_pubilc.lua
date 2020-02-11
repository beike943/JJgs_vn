--==================================================
--create by zhangming 2010.3.18
--describe: 越南版 转生任务NPC 头文件
--related files:
--==================================================
--Include ("\\script\\online_activitesrenwu_head.lua")
Include ("\\script\\online_activites\\reborn\\task\\head.lua")

--主函数
function TaskZhuansheng(nMenHuiType)
	do	return	end
    --是否已经接受了任务
    local nAcceptZSTaskNpc = GetTask(VET_200912_TASK_ZISHI_TYPE)
    if nAcceptZSTaskNpc ~= 0 then
        if nMenHuiType ~= nAcceptZSTaskNpc then
            Say(format(VET_200912_STR_ZS_ERROR[1],VET_200912_STR_NPC_NAME[nAcceptZSTaskNpc],
                                                  VET_200912_STR_NPC_NAME[nAcceptZSTaskNpc]),0)
            return
        end
        --Say(VET_200912_STR_TALK[12],0)
        --print("FollowUpTask--------------")
        FollowUpTask()
        return
    end
    if nAcceptZSTaskNpc == 0 then
        local have_qualification_of_ZS = CheckZSQualification()
        if have_qualification_of_ZS == HAVE_NO_QUALIFICATION then
            return
        end
        if have_qualification_of_ZS == HAVE_ZS_ONCE then
            nAcceptZSTaskNpc = GetTask(VET_200912_TASK_MENHUI_TYPE)
            if nMenHuiType ~= nAcceptZSTaskNpc then
                Say(format(VET_200912_STR_ZS_ERROR[8],VET_200912_STR_NPC_NAME[nAcceptZSTaskNpc]),0)
                return
            end
            if GetTask(VET_200912_TASK_ZS_STATE) == 6 then
                Say(format(VET_200912_STR_XIAXIANTISHI[1][1],VET_200912_STR_MENHUI_NAME[GetTask(VET_200912_TASK_MENHUI_TYPE)]),2,{VET_200912_STR_XIAXIANTISHI[1][2],VET_200912_STR_XIAXIANTISHI[1][3]}) 
                return
            end
            local tbSel = {}
            local nDate = tonumber(date("%y%m%d"))
            tinsert(tbSel, VET_200912_STR_TALK[13])
            if nDate > GetTask(VET_200912_TASK_TEAM_TASK_DATE) then
                tinsert(tbSel, VET_200912_STR_TALK[14])
            end
            local nJiHuoFlag = GetTask(VET_200912_TASK_JIHUO_FLAG)
            local nLevel = GetLevel()
            if nLevel > 73 and mod(nJiHuoFlag,100000)/10000 < 1 then
                tinsert(tbSel,VET_200912_STR_TALK[15])
            end
            if nLevel > 75 and mod(nJiHuoFlag,10000)/1000 < 1 then
                tinsert(tbSel,VET_200912_STR_TALK[16])
            end
            if nLevel > 77 and mod(nJiHuoFlag,1000)/100 < 1 then
                tinsert(tbSel,VET_200912_STR_TALK[17])
            end
            if nLevel > 79 and mod(nJiHuoFlag,100)/10 < 1 then
                tinsert(tbSel,VET_200912_STR_TALK[18])
            end
            if nLevel > 85 and mod(nJiHuoFlag,10) < 1 then
                tinsert(tbSel,VET_200912_STR_TALK[19])
            end
            tinsert(tbSel,VET_200912_STR_TALK[9])
            gf_Say(tbSel)
            return
        end
        local tbSay = {format(VET_200912_STR_TALK[5],nMenHuiType),format(VET_200912_STR_TALK[11],VET_200912_STR_MENHUI_NAME[nMenHuiType],nMenHuiType),VET_200912_STR_TALK[6]}
        Say(VET_200912_STR_TALK[nMenHuiType],getn(tbSay),tbSay)
        return
    end
end

