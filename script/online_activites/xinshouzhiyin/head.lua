Include("\\script\\online_activites\\xinshouzhiyin\\strings.lua")
Include("\\script\\online_activites\\task_values.lua");--任务变量头文件
Include("\\script\\online_activites\\globaldefines.lua");
Include("\\script\\lib\\globalfunctions.lua")

NG_taskAwardNonLevelConditions = {{1,24},{150,33},{119,29},{140,61},{1318,10},{1401,135},{1402,85},{2031,75}};

function IsValidRoute()
	local invalidRoutes = {1, 5, 7, 10, 13, 16, 19};
	if 0 == GetPlayerFaction() then
		return 0;
	else
		local route = GetPlayerRoute();
		for i=1, getn(invalidRoutes) do
			if route == invalidRoutes[i] then
				return 0;
			end
		end
		return 1;
	end
end

function VET_201009_00_GivePlayerLoginItem()
    if GetItemCount(VET_201009_00_TB_ITEM_LOGINGIVE_LIST[1][2][1],VET_201009_00_TB_ITEM_LOGINGIVE_LIST[1][2][2],VET_201009_00_TB_ITEM_LOGINGIVE_LIST[1][2][3]) < 1 then
        gf_AddItemEx2(VET_201009_00_TB_ITEM_LOGINGIVE_LIST[1][2],VET_201009_00_TB_ITEM_LOGINGIVE_LIST[1][1],VET_201009_00_STR_LOG_TITLE,VET_201009_00_TB_LOG_ACTION_LIST[13],0,1)
    end
end

function VET_201009_00_CHECK_LOGIN_AWARD()
    local nHaveGetLoginAward = GetTask(VET_201009_00_TASK_GET_LOGIN_AWARD)
    local nCreateTime = GetCreateTime()
    local nNowTime = GetTime()
    local nDifTime = nNowTime - nCreateTime
    local nOneDayAward, nTwoDayAward, nThreeDayAward = 0, 0, 0
    if nDifTime >= 3600*24 then
        nOneDayAward = mod(nHaveGetLoginAward,10)
        if nOneDayAward == 0 then
            nOneDayAward = 2
        end
    end
    if nDifTime >= 3600*48 then
        nTwoDayAward = mod(nHaveGetLoginAward/10,10)
        if nTwoDayAward == 0 then
            nTwoDayAward = 2
        end
    end
    if nDifTime >= 3600*72 then
        nThreeDayAward = mod(nHaveGetLoginAward/100,10)
        if nThreeDayAward == 0 then
            nThreeDayAward = 2
        end
    end
    if nOneDayAward == 2 or nTwoDayAward == 2 or nThreeDayAward == 2 then
        return 1
    end
    return 0
end

function NG_CheckNonLevelCondition(awardID)
	-- online time and login times
	if 1 <= awardID and 8 >= awardID then
		return 1;
	-- level
	elseif 9 <= awardID and 22 >= awardID then
		return IsValidRoute();
	-- task
	elseif 23 <= awardID and 31 >= awardID then
		local index = awardID - 22;
		if GetTask(NG_taskAwardNonLevelConditions[index][1]) >= NG_taskAwardNonLevelConditions[index][2] then
			return 1;
		else
			return 0;
		end
	-- experience
	elseif 32 <= awardID and 48 >= awardID then
		local experienced = getResultOfAllFirst(); 
		if 2 == experienced[awardID-31] then
			return 1;
		else 
			return 0;
		end
	end
	-- others
	return 0;
end

function NG_OnLevelUp(previousLevel)
		local level = GetLevel();
    if GetPlayerRebornParam(0) ~= 0 then --转生玩家不促发
        return
    end
    gonglue(level) --提示信息
    --礼品奖励信息
    local nLevelList = {10,15,20,25,30,35,40,45,50,55,60,65,70,73,75,80}
    local nAwardList = {
        [10] = {9,23,32,33,34,35,},
        [15] = {10,},
        [20] = {11,38,},
        [25] = {12,},
        [30] = {13,36,},
        [35] = {14,},
        [40] = {15,24,26,39,},
        [45] = {16,},
        [50] = {17,25,41,},
        [55] = {18,},
        [60] = {19,27,28,37,40,},
        [65] = {20,},
        [70] = {21,42,43,44,45,},
        [73] = {46,},
        [75] = {22,29,47,48},
        [80] = {30,31,},
    }
    for i = 1, getn(nLevelList) do
        if level == nLevelList[i] then
            for j = 1, getn(nAwardList[level]) do
            		local awardID = nAwardList[level][j];
            		if 1 == NG_CheckNonLevelCondition(awardID) then
            			WriteLog("added level-up award1{"..nAwardList[level][j]..", "..VET_201009_00_TB_AWARDLIST[nAwardList[level][j]][1].."}");            		
                	AddAward(nAwardList[level][j],VET_201009_00_TB_AWARDLIST[nAwardList[level][j]],1)
                else
                  WriteLog("skip non-achieved level award: "..awardID);
                end
            end
        end
    end
    ShowAwardWindow(0)
end

function get_onling_award(nType)
    local nAddNums = {1000,10000,100000,1000000,10000000}
    local nHaveGetAward = GetTask(VET_201009_00_TASK_GET_LOGIN_AWARD)
    if mod(floor(nHaveGetAward/nAddNums[nType]),10) == 1 then
        Talk(1,"",VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[111])
        return
    end
    SetTask(VET_201009_00_TASK_GET_LOGIN_AWARD,nHaveGetAward+nAddNums[nType])
    RemoveAward(nType)
  	ModifyExp(VET_201009_00_ONLINE_AWARD[nType][1][2]);
  	if 1 <= nType and 4 >= nType then
  		for i=1, 2 do
  			gf_AddItemEx2(VET_201009_00_ONLINE_AWARD[nType][2][i][2],VET_201009_00_ONLINE_AWARD[nType][2][i][1],VET_201009_00_STR_LOG_TITLE,VET_201009_00_TB_LOG_ACTION_LIST[1],0,1)
  		end
  	elseif 5 == nType then
    	local nBody = GetBody()
    	for i = 1, 3 do
      	  gf_AddItemEx2(VET_201009_00_ONLINE_AWARD[nType][2][nBody][i][2], VET_201009_00_ONLINE_AWARD[nType][2][nBody][i][1],VET_201009_00_STR_LOG_TITLE,VET_201009_00_TB_LOG_ACTION_LIST[1],VET_201009_00_ONLINE_AWARD[nType][2][nBody][i][3],1)
    	end
  	end
end

function activity_now()
    local tbLevelList = {75,73,70,68,60,50,40,30,20,15,10,1}
    local nLevel = GetLevel()
    for i = 1, getn(tbLevelList) do
        if nLevel >= tbLevelList[i] then
            gonglue(tbLevelList[i])
            break
        end
    end
end

function gonglue(nLevel)
    if nLevel == 1 then
        Talk(1,"",
            VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[661]..":"..VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[662]
        )
    elseif nLevel == 10 then
        Talk(4,"",
            VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[67]..":"..VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[68],
            VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[69]..":"..VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[70],
            VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[701]..":"..VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[702],
            VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[71]..":"..VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[72]
        )
    elseif nLevel == 15 then
        Talk(2,"",
            VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[73]..":"..VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[74],
            VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[75]..":"..VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[76]
        )
    elseif nLevel == 20 then
        Talk(1,"",
            VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[77]..":"..VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[78]
        )
    elseif nLevel == 30 then
        Talk(2,"",
            VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[79]..":"..VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[80],
            VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[81]..":"..VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[82]
        )
    elseif nLevel == 40 then
        Talk(2,"",
            VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[83]..":"..VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[84],
            VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[85]..":"..VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[86]
        )
    elseif nLevel == 50 then
        Talk(3,"",
            VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[87]..":"..VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[88],
            VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[89]..":"..VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[90],
            VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[91]..":"..VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[92]
        )
    elseif nLevel == 60 then
        Talk(2,"",
            VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[95]..":"..VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[96],
            VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[97]..":"..VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[98]
        )
    elseif nLevel == 68 then
        Talk(1,"",
            VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[99]..":"..VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[100]
        )
    elseif nLevel == 70 then
        Talk(3,"",
            VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[101]..":"..VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[102],
            VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[103]..":"..VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[104],
            VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[105]..":"..VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[106]
        )
    elseif nLevel == 73 then
        Talk(1,"",
            VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[107]..":"..VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[108]
        )
    elseif nLevel == 75 then
        Talk(1,"",
            VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[109]..":"..VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[110]
        )
    end
end

function yilanbiao()
    local tbSel = {
        VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[5].."/login_award_view",
        VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[6].."/uplevel_award_view",
        VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[7].."/task_award_view",
        VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[8].."/chengzhang_award_view",
        VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[4].."/gf_DoNothing",
    }
    Say(VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[2],getn(tbSel),tbSel)
end

function login_award_view()
    local nHaveGetLoginAward = GetTask(VET_201009_00_TASK_GET_LOGIN_AWARD)
    local nCreateTime = GetCreateTime()
    local nNowTime = GetTime()
    local nDifTime = nNowTime - nCreateTime
    local nOneDayAward, nTwoDayAward, nThreeDayAward = 0, 0, 0
    if nDifTime >= 3600*24 then
        nOneDayAward = floor(mod(nHaveGetLoginAward,10))
        if nOneDayAward == 0 then
            nOneDayAward = 2
        end
    end
    if nDifTime >= 3600*48 then
        nTwoDayAward = floor(mod(nHaveGetLoginAward/10,10))
        if nTwoDayAward == 0 then
            nTwoDayAward = 2
        end
    end
    if nDifTime >= 3600*72 then
        nThreeDayAward = floor(mod(nHaveGetLoginAward/100,10))
        if nThreeDayAward == 0 then
            nThreeDayAward = 2
        end
    end
    local tbSel = {
        format(VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[13].."("..VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[150+nOneDayAward]..")/#get_login_award(%d,%d)",nOneDayAward,1),
        format(VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[14].."("..VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[150+nTwoDayAward]..")/#get_login_award(%d,%d)",nTwoDayAward,2),
        format(VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[15].."("..VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[150+nThreeDayAward]..")/#get_login_award(%d,%d)",nThreeDayAward,3),
        VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[4].."/gf_DoNothing",
    }
    Say(VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[9],getn(tbSel),tbSel)
end

function get_login_award(nState, nDays)
    local tbSel = {
        format(VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[113].."/#re_get_login_award(%d,%d)",nDays,nState),
        VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[4].."/gf_DoNothing",
    }
    Say(VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[178]..VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[1600+nDays],getn(tbSel),tbSel)
end

function re_get_login_award(nDays, nState)
    if nState == 0 then
        Talk(1,"",VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[112])
        return
    elseif nState == 1 then
        Talk(1,"",VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[111])
        RemoveAward(nDays+5);
        return
    elseif nState == 2 then
        if gf_Judge_Room_Weight(2,3," ") ~= 1 then
            return
        end
        local nAddTaskVal = 0
        if nDays == 1 then
            nAddTaskVal = 1
        elseif nDays == 2 then
            nAddTaskVal = 10
        elseif nDays == 3 then
            nAddTaskVal = 100
        end
        RemoveAward(nDays+5)
        SetTask(VET_201009_00_TASK_GET_LOGIN_AWARD, GetTask(VET_201009_00_TASK_GET_LOGIN_AWARD)+nAddTaskVal)
        ModifyReputation(VET_201009_00_TB_LOGIN_AWARD[nDays][1][2], 1);
        gf_AddItemEx2(VET_201009_00_TB_LOGIN_AWARD[nDays][2][2],VET_201009_00_TB_LOGIN_AWARD[nDays][2][1],VET_201009_00_STR_LOG_TITLE,VET_201009_00_TB_LOG_ACTION_LIST[1],0,1)
        if nDays == 1 then
            Talk(1,"",VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[1141])
        elseif nDays == 2 then
            Talk(1,"",VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[1142])
        elseif nDays == 3 then
            Talk(1,"",VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[1143])            
        end
    end
end

function uplevel_award_view()
    local nHaveGetLevelAward = GetTask(VET_201009_00_TASK_GET_LEVEL_AWARD)
    local nLevelFlag = {0,0,0,0,0,0,0,0,0,0,0,0,0,0}
    local nLevels = {10,15,20,25,30,35,40,45,50,55,60,65,70,75}
    local nLevel = GetLevel()
    for i = 1, 14 do
        nLevelFlag[i] = mod(nHaveGetLevelAward,2)
        nHaveGetLevelAward = floor(nHaveGetLevelAward/2)
        if nLevel >= nLevels[i] and nLevelFlag[i] == 0 then
            nLevelFlag[i] = 2
        end
    end
    local tbSel = {}
    for i = 1, 14 do
        if IsValidRoute() == 0 then
            nLevelFlag[i] = 0
        end
        tinsert(tbSel,format(VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[16+i].."("..VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[150+nLevelFlag[i]]..")".."/#get_level_award(%d)",tonumber(nLevelFlag[i]+i*10)))
    end
    tbSel[0] = VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[6]
    gf_PageSay(tbSel,1,6)
end

function get_level_award(nFlag)
    local nAwardLevel = floor(nFlag / 10)
    nFlag = mod(nFlag,10)
    local nAwardId = nAwardLevel + 8
    local tbSel = {
        format(VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[113].."/#re_get_level_award(%d,%d)",nAwardLevel,nFlag),
        VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[4].."/gf_DoNothing",
    }
    local szTitle = VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[178].."<color=red>"
    for i = 1, getn(VET_201009_00_TB_AWARDLIST[nAwardId])-1 do
        if i ~= 1 then
            szTitle = szTitle..", "
        end
        szTitle = szTitle..VET_201009_00_TB_AWARDLIST[nAwardId][1+i]
    end
    szTitle = szTitle.."<color>"
    Say(szTitle,getn(tbSel),tbSel)
end

function re_get_level_award(nAwardLevel, nFlag)
    local nAwardId = nAwardLevel + 8
    if nFlag == 0 then
        Talk(1,"",VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[112])
        return
    elseif nFlag == 1 then
        Talk(1,"",VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[111])
        RemoveAward(nAwardId);
        return
    end
    if IsValidRoute() == 0 then
        Talk(1,"",VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[132])
        return
    end
    if gf_Judge_Room_Weight(2,60," ") ~= 1 then
        return
    end
    local nAddNum = 1;
    for i = 1, nAwardLevel-1 do
        nAddNum = nAddNum * 2
    end
    SetTask(VET_201009_00_TASK_GET_LEVEL_AWARD,GetTask(VET_201009_00_TASK_GET_LEVEL_AWARD)+nAddNum)
    RemoveAward(nAwardId)
    ModifyExp(VET_201009_00_TB_LEVEL_AWARD[1][nAwardLevel])
    SetTask(336, GetTask(336)+VET_201009_00_TB_LEVEL_AWARD[3][nAwardLevel]);
    if nAwardLevel == 8 or nAwardLevel == 10 then
    else
        gf_AddItemEx2(VET_201009_00_TB_LEVEL_AWARD[2][nAwardLevel][2],
                      VET_201009_00_TB_LEVEL_AWARD[2][nAwardLevel][1],
                      VET_201009_00_STR_LOG_TITLE,
                      VET_201009_00_TB_LOG_ACTION_LIST[2],
                      VET_201009_00_TB_LEVEL_AWARD[2][nAwardLevel][3],1
                    )
    end
    if nAwardLevel == 7 then
        get_shimen_weapon1_award()
    elseif nAwardLevel == 8 then
        get_shimen_book_award()
    elseif nAwardLevel == 10 then
        get_shimen_weapon2_award()
    elseif nAwardLevel == 12 then
        get_shimen_shiping2_award()
    elseif nAwardLevel == 13 then
        get_shimen_gaoji_book_award()
    elseif nAwardLevel == 14 then
        get_shimen_weapon4_award()
    end
    if getn(VET_201009_00_TB_LEVEL_AWARD[2][nAwardLevel][4]) == 2 then
        Talk(2,"",VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[VET_201009_00_TB_LEVEL_AWARD[2][nAwardLevel][4][1]],
                  VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[VET_201009_00_TB_LEVEL_AWARD[2][nAwardLevel][4][2]])
    else
        Talk(1,"",VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[VET_201009_00_TB_LEVEL_AWARD[2][nAwardLevel][4][1]])
    end
end

function task_award_view()
    local nFlag = {0,0,0,0,0,0,0,0,0}
    local nNum = 0
    local nHaveGetTaskAward = GetTask(VET_201009_00_TASK_GET_TASK_AWARD)
    if nHaveGetTaskAward == nil then
        nHaveGetTaskAward = 0
    end
    for i = 1, 8 do
        if GetTask(NG_taskAwardNonLevelConditions[i][1]) < NG_taskAwardNonLevelConditions[i][2] then
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
    local tbSel = {}
    for i = 1, 9 do
        if GetPlayerFaction() == 0 then
            nFlag[i] = 0
        end
        tinsert(tbSel,format(VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[30+i].."("..VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[150+nFlag[i]]..")".."/#get_task_award(%d)",tonumber(i*10+nFlag[i])))
    end
    tbSel[0] = VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[7]
    gf_PageSay(tbSel,1,6)
end

function get_task_award(nType, nState)
    local nState = mod(nType,10)
    nType = floor(nType / 10)
    local szTitle = VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[178].."<color=red>"
    for i = 1, getn(VET_201009_00_TB_AWARDLIST[22+nType]) - 1 do
        if i ~= 1 then
            szTitle = szTitle..", "
        end
        szTitle = szTitle..VET_201009_00_TB_AWARDLIST[22+nType][1+i]
    end
    szTitle = szTitle.."<color>"

    local tbSel = {
        format(VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[113].."/#re_get_task_award(%d,%d)",nType,nState),
        VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[4].."/gf_DoNothing",
    }
    Say(szTitle,getn(tbSel),tbSel)
end

function re_get_task_award(nType, nState)
    if nState == 0 then
        Talk(1,"",VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[112])
        return
    elseif nState == 1 then
        Talk(1,"",VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[111])
        RemoveAward(nType + 22);
        return
    end
    if gf_Judge_Room_Weight(1,1," ") ~= 1 then
        return
    end
    
    local nAddNum = 1
    for i = 1, nType-1 do
        nAddNum = nAddNum * 10
    end
    SetTask(VET_201009_00_TASK_GET_TASK_AWARD,GetTask(VET_201009_00_TASK_GET_TASK_AWARD)+nAddNum)

    if nType == 1 then
        ModifyExp(1500);
        ModifyReputation(200, 1);
   	elseif nType > 1 and nType <= 4 then
        gf_AddItemEx2(VET_201009_00_TB_TASK_AWARD[1][2],VET_201009_00_TB_TASK_AWARD[1][1],VET_201009_00_STR_LOG_TITLE,VET_201009_00_TB_LOG_ACTION_LIST[10],VET_201009_00_TB_TASK_AWARD[1][3],1)
        Earn(VET_201009_00_TB_TASK_AWARD[5][nType])
        Talk(1,"",VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[133])
    elseif nType > 4 and nType <= 6 then
        gf_AddItemEx2(VET_201009_00_TB_TASK_AWARD[2][2],VET_201009_00_TB_TASK_AWARD[2][1],VET_201009_00_STR_LOG_TITLE,VET_201009_00_TB_LOG_ACTION_LIST[10],VET_201009_00_TB_TASK_AWARD[2][3],1)
        Earn(VET_201009_00_TB_TASK_AWARD[5][nType])
        Talk(1,"",VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[134])
		elseif nType > 6 and nType <= 8 then
        gf_AddItemEx2(VET_201009_00_TB_TASK_AWARD[3][2],VET_201009_00_TB_TASK_AWARD[3][1],VET_201009_00_STR_LOG_TITLE,VET_201009_00_TB_LOG_ACTION_LIST[10],VET_201009_00_TB_TASK_AWARD[3][3],1)
        Earn(VET_201009_00_TB_TASK_AWARD[5][nType])
        if nType == 7 then
            Talk(1,"",VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[135])
        elseif nType == 8 then
            Talk(1,"",VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[136])
        end
		elseif nType == 9 then
        gf_AddItemEx2(VET_201009_00_TB_TASK_AWARD[4][2],VET_201009_00_TB_TASK_AWARD[4][1],VET_201009_00_STR_LOG_TITLE,VET_201009_00_TB_LOG_ACTION_LIST[10],VET_201009_00_TB_TASK_AWARD[4][3],1)
        AddTitle(63,1)
        Talk(1,"",VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[137])
    end
    WriteLog("RemoveAward("..(nType+22)..")");
    RemoveAward(nType + 22)   
end

function chengzhang_award_view()
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
    local tbSel = {}
    for i = 1, 17 do
        local nNum = 38 + i
        if i == 2 then
            nNum = 401
        end
        if nNum == 39 then
            nNum = 40
        end
        tinsert(tbSel,format(VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[nNum].."("..VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[nHaveAccomplish[i]+150]..")".."/#get_chengzhang_award(%d)",tonumber(i*10+nHaveAccomplish[i])))
    end
    tbSel[0] = VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[8]
    gf_PageSay(tbSel, 1, 6)
end

function get_chengzhang_award(nNum)
    local nState = mod(nNum,10)
    nNum = floor(nNum / 10)
    local szTitle = VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[178].."<color=red>"
    for i = 1, getn(VET_201009_00_TB_AWARDLIST[31+nNum]) - 1 do
        if i ~= 1 then
            szTitle = szTitle..", "
        end
        szTitle = szTitle..VET_201009_00_TB_AWARDLIST[31+nNum][1+i]
    end
    szTitle = szTitle.."<color>"

    local tbSel = {
        format(VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[113].."/#re_get_chengzhang_award(%d,%d)",nNum,nState),
        VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[4].."/gf_DoNothing",
    }
    Say(szTitle,getn(tbSel),tbSel)
end

function re_get_chengzhang_award(nType, nState)
    if nState == 0 then
        Talk(1,"",VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[112])
        return
    end
    if nState == 1 then
        Talk(1,"",VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[111])
        RemoveAward(nType+31);
        return
    end
    if gf_Judge_Room_Weight(2,2," ") ~= 1 then
        return
    end
    local nAddNum = 1
    for i = 1, nType - 1 do
        nAddNum = nAddNum * 2
    end
    SetTask(VET_201009_00_TASK_CHENGZHANG,GetTask(VET_201009_00_TASK_CHENGZHANG)+nAddNum)
    RemoveAward(nType+31)
    ModifyExp(VET_201009_00_TB_CHENGZHANG_AWARD[20][nType])
    Earn(VET_201009_00_TB_CHENGZHANG_AWARD[21][nType])
    if nType >= 4 and nType <= 6 then
        SetTask(336, GetTask(336) + VET_201009_00_TB_CHENGZHANG_AWARD[22][nType-3]);
    end
    if 10 == nType then
    	ModifyReputation(VET_201009_00_TB_CHENGZHANG_AWARD[23][1], 1);
    elseif 11 == nType then
    	ModifyReputation(VET_201009_00_TB_CHENGZHANG_AWARD[23][2], 1);
    elseif 16 == nType then
    	ModifyReputation(VET_201009_00_TB_CHENGZHANG_AWARD[23][3], 1);
    elseif 17 == nType then
    	ModifyReputation(VET_201009_00_TB_CHENGZHANG_AWARD[23][4], 1);
    end
    if nType == 10 or nType == 11 then
        ModifyPopur(VET_201009_00_TB_CHENGZHANG_AWARD[24][nType-9])
    end
    if VET_201009_00_TB_CHENGZHANG_AWARD[nType] ~= nil then
        gf_AddItemEx2(VET_201009_00_TB_CHENGZHANG_AWARD[nType][2],VET_201009_00_TB_CHENGZHANG_AWARD[nType][1],VET_201009_00_STR_LOG_TITLE,VET_201009_00_TB_LOG_ACTION_LIST[12],VET_201009_00_TB_CHENGZHANG_AWARD[nType][3],1)
        if nType == 17 then
            gf_AddItemEx2(VET_201009_00_TB_CHENGZHANG_AWARD[nType+1][2],VET_201009_00_TB_CHENGZHANG_AWARD[nType+1][1],VET_201009_00_STR_LOG_TITLE,VET_201009_00_TB_LOG_ACTION_LIST[12],VET_201009_00_TB_CHENGZHANG_AWARD[nType+1][3],1)
        end
    end
    if nType == 12 then
        get_shimen_weapon3_award()
    end
    if nType == 12 then
        Talk(2,"",VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[171][1],VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[171][2])
    else
        Talk(1,"",VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[159+nType])
    end
end

function getResultOfAllFirst()
    local nDigits = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
    --local nResult = 0
    if GetPlayerFaction() ~= 0 and GetLevel() >= 10 then --拜入师门
        nDigits[1] = 2
    end
    if GetTask(805) == 2 and GetLevel() >= 10 then --开启储物箱
        nDigits[2] = 2
    end
    if (GetLifeSkillsNum(0) >= 1 or GetLifeSkillsNum(1) >= 2) and GetLevel() >= 10 then --学会一项生活技能 除掉窝窝头
        nDigits[3] = 2
    end
    --完成一次低级师门重复任务
    local nFactionNum = GetTask(VET_201009_00_TASK_NUM_FACTION)
    if mod(nFactionNum,10) == 1 and GetLevel() >= 10 then
        nDigits[4] = 2
    end
    --完成一次中级师门重复任务
    if mod(floor(nFactionNum/10),10) == 1 and GetLevel() >= 30 then
        nDigits[5] = 2
    end
    --完成一次高级师门重复任务
    if mod(floor(nFactionNum/100),10) == 1 and GetLevel() >= 60 then
        nDigits[6] = 2
    end
    --完成一次杀手任务
    if GetTask(1108) >= 1 and GetLevel() >= 20 then
        nDigits[7] = 2
    end
    --完成一场低级战场
    local nTaskValue717, nTaskValue718, nTaskValue719, nTaskValue720 = 0, 0, 0, 0
    nTaskValue717 = GetTask(717)
    if nTaskValue717 == nil then
        nTaskValue717 = 0
    end

    nTaskValue718 = GetTask(718)
    if nTaskValue718 == nil then
        nTaskValue718 = 0
    end

    nTaskValue719 = GetTask(719)
    if nTaskValue719 == nil then
        nTaskValue719 = 0
    end

    nTaskValue720 = GetTask(720)
    if nTaskValue720 == nil then
        nTaskValue720 = 0
    end

    if nTaskValue718 + nTaskValue717 >= 1 and GetLevel() >= 40 then
        nDigits[8] = 2
    end
    --完成一场高级战场
    if nTaskValue719 + nTaskValue720 >= 1 and GetLevel() >= 60 then
        nDigits[9] = 2
    end
    --藏剑副本通关一次
    if GetTask(VET_201009_00_TASK_TONGGUAN_CANGJIAN) == 1 and GetLevel() >= 50 then
        nDigits[10] = 2
    end
    --太虚幻境挑战8波怪成功
    if GetTask(VET_201009_00_TASK_TONGGUAN_TAIXU) == 1 and GetLevel() >= 70 then
        nDigits[11] = 2
    end
    --武功技能学到最高级
    if gf_Check55FullSkill() == 1 and GetLevel() >= 70 then
        nDigits[12] = 2
    end
    --完成一次单人武林使者任务
    if mod(GetTask(VET_201009_00_TASK_RICHANG),10) == 1 and GetLevel() >= 70 then
        nDigits[13] = 2
    end
    --完成一次组队武林使者任务
    if GetTask(VET_201009_00_TASK_RICHANG) >= 10 and GetLevel() >= 70 then
        nDigits[14] = 2
    end
    --完成1次商会任务100步/天
    if GetTask(356) == 100 and GetLevel() >= 73 then
        nDigits[15] = 2
    end
    --加入帮派
    if IsTongMember() ~= 0 and GetLevel() >= 75 then
        nDigits[16] = 2
    end
    --紫光副本通关一次
    if GetTask(VET_201009_00_TASK_TONGGUAN_ZIGUANG) == 1 and GetLevel() >= 75 then
        nDigits[17] = 2
    end
    return nDigits
end

function NG_CloneTable(t)
	local result = {};
	i,v = next(t, nil)
	while i do
  	result[i] = v
  	i,v = next(t,i)
  end
  return result;
end

function get_shimen_shiping2_award()
    if IsValidRoute() == 0 then
        Talk(1,"",VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[132])
        return
    end
    local nRoute = GetPlayerRoute()

    local tbShiMenShiping2 = NG_CloneTable(GLB_DEFS_TB_SHIMEN_SHIPING2[nRoute][2]);
    tbShiMenShiping2[3] = tbShiMenShiping2[3] + GetBody() - 1
    gf_AddItemEx2(tbShiMenShiping2,GLB_DEFS_TB_SHIMEN_SHIPING2[nRoute][1],VET_201009_00_STR_LOG_TITLE,VET_201009_00_TB_LOG_ACTION_LIST[3],0,1)
end

function get_shimen_weapon1_award()
    if IsValidRoute() == 0 then
        Talk(1,"",VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[132])
        return
    end
    local nRoute = GetPlayerRoute()
    local tbShiMenWeapon1 = NG_CloneTable(GLB_DEFS_TB_SHIMEN_WEAPON1[nRoute][2]);
    tbShiMenWeapon1[3] = tbShiMenWeapon1[3] + GetBody() - 1
    gf_AddItemEx2(tbShiMenWeapon1,GLB_DEFS_TB_SHIMEN_WEAPON1[nRoute][1],VET_201009_00_STR_LOG_TITLE,VET_201009_00_TB_LOG_ACTION_LIST[4],0,1)
end

function get_shimen_weapon2_award()
    if IsValidRoute() == 0 then
        Talk(1,"",VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[132])
        return
    end
    local nRoute = GetPlayerRoute()
    local tbShiMenWeapon2 = NG_CloneTable(GLB_DEFS_TB_SHIMEN_WEAPON2[nRoute][2]);
    tbShiMenWeapon2[3] = tbShiMenWeapon2[3] + GetBody() - 1
    gf_AddItemEx2(tbShiMenWeapon2,GLB_DEFS_TB_SHIMEN_WEAPON2[nRoute][1],VET_201009_00_STR_LOG_TITLE,VET_201009_00_TB_LOG_ACTION_LIST[5],0,1)
end

function get_shimen_weapon3_award()
    if IsValidRoute() == 0 then
        Talk(1,"",VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[132])
        return
    end
    local nRoute = GetPlayerRoute()
    local tbShiMenWeapon3 = NG_CloneTable(GLB_DEFS_TB_SHIMEN_WEAPON3[nRoute][2]);
    tbShiMenWeapon3[3] = tbShiMenWeapon3[3] + GetBody() - 1
    gf_AddItemEx2(tbShiMenWeapon3,GLB_DEFS_TB_SHIMEN_WEAPON3[nRoute][1],VET_201009_00_STR_LOG_TITLE,VET_201009_00_TB_LOG_ACTION_LIST[11],0,1)
end

function get_shimen_weapon4_award()
    if IsValidRoute() == 0 then
        Talk(1,"",VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[132])
        return
    end
    local nRoute = GetPlayerRoute()
    local tbShiMenWeapon4 = NG_CloneTable(GLB_DEFS_TB_SHIMEN_WEAPON4[nRoute][2]);
    tbShiMenWeapon4[3] = tbShiMenWeapon4[3] + GetBody() - 1
    gf_AddItemEx2(tbShiMenWeapon4,GLB_DEFS_TB_SHIMEN_WEAPON4[nRoute][1],VET_201009_00_STR_LOG_TITLE,VET_201009_00_TB_LOG_ACTION_LIST[6],0,1)
end

function get_shimen_book_award()
    if IsValidRoute() == 0 then
        Talk(1,"",VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[132])
        return
    end
    local nRoute = GetPlayerRoute()
    gf_AddItemEx2(GLB_DEFS_TB_SHIMEN_BOOK[nRoute][1][2],GLB_DEFS_TB_SHIMEN_BOOK[nRoute][1][1],VET_201009_00_STR_LOG_TITLE,VET_201009_00_TB_LOG_ACTION_LIST[7],0,1)
    gf_AddItemEx2(GLB_DEFS_TB_SHIMEN_BOOK[nRoute][2][2],GLB_DEFS_TB_SHIMEN_BOOK[nRoute][2][1],VET_201009_00_STR_LOG_TITLE,VET_201009_00_TB_LOG_ACTION_LIST[8],0,1)
end

function get_shimen_gaoji_book_award()
    if IsValidRoute() == 0 then
        Talk(1,"",VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[132])
        return
    end
    local nRoute = GetPlayerRoute()
    gf_AddItemEx2(GLB_DEFS_TB_SHIMEN_GAOJI_BOOK[nRoute][2],GLB_DEFS_TB_SHIMEN_GAOJI_BOOK[nRoute][1],VET_201009_00_STR_LOG_TITLE,VET_201009_00_TB_LOG_ACTION_LIST[9],0,1)
end


function chengzhangzhinan()
    local tbSel = {}
    tbSel[0] = VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[0]
    local nLevelList = {10,15,20,30,40,50,60,68,70,73,75}
    for i = 56, 66 do
        tinsert(tbSel, format(VET_201009_00_TB_XIAOAOJIANGHULU_TALK_LIST[i].."/#gonglue(%d)",nLevelList[i-55]))
    end
    gf_PageSay(tbSel, 1, 6)
end
