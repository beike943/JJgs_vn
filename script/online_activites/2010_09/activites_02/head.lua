--=============================================
--create by zhangming 2010.8.20
--describe:Ô½ÄÏ°æ2010Äê9ÔÂ»î¶¯2 Í·ÎÄ¼þ
--related files: 
--=============================================

Include("\\script\\online_activites\\task_values.lua");--ÈÎÎñ±äÁ¿Í·ÎÄ¼þ
Include("\\script\\online_activites\\2010_09\\activites_02\\strings.lua");--»î¶¯×Ö·û´®
Include("\\script\\lib\\globalfunctions.lua");--¹«¹²º¯ÊýÎÄ¼þ
Include("\\script\\online\\viet_event\\vng_task_control.lua");

VET_201009_02_EVENT_NUMBER = 14;--ÔÚ»î¶¯±íÉÏµÄ±àºÅÊÇ13
VET_201009_02_TIME_USER_DEFINE = 2517;--ËÄÁé»¨µÆÊ±¼ä´¥·¢Æ÷×Ô¶¨ÒåID
VET_201009_02_TIME_TB_DEFINE = 1503;--ËÄÁé»¨µÆÊ±¼ä´¥·¢Æ÷±íÄÚID
VET_201009_02_GLBVALUE_ENDTIME = 2434;--»¨µÆÊ§Ð§Ê±¼ä

tRouteSkillInfo =
{
				[0] = 0,
				[1] = 0,
				[2] = 31,
				[3] = 56,
				[4] = 43,
				[5] = 0,
				[6] = 73,
				[7] = 0,
				[8] = 88,
				[9] = 101,
				[10] = 0,
				[11] = 112,
				[12] = 123,
				[13] = 0,
				[14] = 145,
				[15] = 158,
				[16] = 0,
				[17] = 731,
				[18] = 744,
				[19] = 0,
				[20] = 377,
				[21] = 363,
				[23] = 1030,
				[29] = 1176,
				[30] = 1229,
}

function VET_201009_02_JingNangDaShiJiangDialog(tbSayDialog, szSayHead)
    if gf_CheckEventDateEx(VET_201009_02_EVENT_NUMBER) == 1 then
        --szSayHead = VET_201009_01_TB_STRING_LIST[2];                            --½õÄÒ´óÊÂ¼þsayµÄ±êÌâ
        tinsert(tbSayDialog, VET_201009_02_TB_STRING_LIST[1].."/vet_201009_02_jihuohuadeng");
        tinsert(tbSayDialog, VET_201009_02_TB_STRING_LIST[2].."/vet_201009_02_goumaihuanglazhu");
        --tinsert(tbSayDialog, VET_201009_02_TB_STRING_LIST[3].."/gf_DoNothing");
    end
    return tbSayDialog, szSayHead;
end

function vet_201009_02_jihuohuadeng()
    local nTeamSize = GetTeamSize()
    if nTeamSize < 2 then
        Talk(1,"",VET_201009_02_TB_STRING_LIST[6])
        return
    end
    if GetCaptainName() ~= GetName() then
        Talk(1,"",VET_201009_02_TB_STRING_LIST[5])
        return
    end
    local nMapId = GetWorldPos()
    local bMapIsOk = 0
    for i = 1, getn(VET_201009_02_TB_MAPID) do
        if nMapId == VET_201009_02_TB_MAPID[i] then
            bMapIsOk = 1
            break
        end
    end
    if bMapIsOk == 0 then
        Talk(1,"",VET_201009_02_TB_STRING_LIST[12])
        return
    end
   
    local nOldPlayer = PlayerIndex
    for i = 1, nTeamSize do
        PlayerIndex = GetTeamMember(i)
        if PlayerIndex <= 0 then
            Talk(1,"",VET_201009_02_TB_STRING_LIST[7])
            return
        end
        if GetTrigger(VET_201009_02_TIME_USER_DEFINE)~= 0 then
		Talk(1,"","B¹n ®· kÝch ho¹t thµnh c«ng 1 Hoa §¨ng!")
		return
	  end
        local nDateLast = floor(GetTask(VET_201009_02_TASK_DATE_JIHUOHUADENG) / 10)
 	   local nDate = tonumber(date("%y%m%d"))
   	   if nDateLast == nil then
        	nDateLast = 0
    	   end
        if nDate ~= nDateLast then
        		SetTask(VET_201009_02_TASK_DATE_JIHUOHUADENG, nDate * 10)
    	   end
    	   local nCountUsed = mod(GetTask(VET_201009_02_TASK_DATE_JIHUOHUADENG), 10)
    	   if nCountUsed >= 4 then
    	   		Talk(1,"","Mçi ngµy chØ ®­îc kÝch ho¹t Hoa §¨ng tèi ®a 4 lÇn!")
            	return
    	   end
        local nLevel = GetLevel()
        if nLevel < 77 or GetPlayerFaction() == 0 or CheckSkill55() == 0 then
            Talk(1,"",VET_201009_02_TB_STRING_LIST[10])
            return
        end
        if GetItemCount(VET_201009_02_TB_ITEM_LIST[1][2],VET_201009_02_TB_ITEM_LIST[1][3],VET_201009_02_TB_ITEM_LIST[1][4]) < 1 then
            PlayerIndex = nOldPlayer
            Talk(1,"",VET_201009_02_TB_STRING_LIST[8])
            return
        end
    end
     for i = 1, nTeamSize do
        PlayerIndex = GetTeamMember(i)
        if PlayerIndex <= 0 then
            Talk(1,"",VET_201009_02_TB_STRING_LIST[7])
            return
        end
        if DelItem(VET_201009_02_TB_ITEM_LIST[1][2],VET_201009_02_TB_ITEM_LIST[1][3],VET_201009_02_TB_ITEM_LIST[1][4],1) ~= 1 then
            return
        end
    end
    PlayerIndex = nOldPlayer
    
    local nNpcId = 0
    local nRandom = random(1, 100)
    if nRandom <= 25 then
    		nNpcId = 1
    elseif nRandom <= 50 then
    		nNpcId = 2
    elseif nRandom <= 75 then
    		nNpcId = 3
    else
    		nNpcId = 4
    end
    local nNpcIndex = CreateNpc(VET_201009_02_TB_NPCS[nNpcId][1],VET_201009_02_TB_NPCS[nNpcId][2],GetWorldPos())
    SetNpcLifeTime(nNpcIndex,320)    
    PlayerIndex = nOldPlayer
    DoFireworks(871, 1)
    local nEndTime = GetTime() + 300
    for i = 1, nTeamSize do
        PlayerIndex = GetTeamMember(i)
        if PlayerIndex <= 0 then
            Talk(1,"",VET_201009_02_TB_STRING_LIST[7])
            return
        end
        SetCurrentNpcSFX(PIdx2NpcIdx(),905,1,1)
        CreateTrigger(1, VET_201009_02_TIME_TB_DEFINE, VET_201009_02_TIME_USER_DEFINE);
        ContinueTimer(GetTrigger(VET_201009_02_TIME_USER_DEFINE));
        SetTask(VET_201009_02_GLBVALUE_ENDTIME,nNpcIndex)
        SetTask(VET_201009_02_TASK_TIME_END_HUADENG,nEndTime)
        SetTask(VET_201009_02_TASK_DATE_JIHUOHUADENG, GetTask(VET_201009_02_TASK_DATE_JIHUOHUADENG) + 1)
        gf_SetTaskByte(VET_201009_01_TASK_FLAG, VET_201009_01_BYTE_TYPE, nNpcId)
    end
    PlayerIndex = nOldPlayer
end

function vet_201009_02_goumaihuanglazhu()
    local nDateLast = floor(GetTask(VET_201009_02_TASK_DATE_GOUMAILAZHU) / 10)
    local nDate = tonumber(date("%y%m%d"))
    if nDateLast == nil then
        nDateLast = 0
    end
    if nDate ~= nDateLast then
        SetTask(VET_201009_02_TASK_DATE_GOUMAILAZHU, nDate * 10)
    end
    local nCountUsed = mod(GetTask(VET_201009_02_TASK_DATE_GOUMAILAZHU), 10)
    if nCountUsed >= 4 then
     		Talk(1,"","Mçi ngµy chØ ®­îc mua nÕn tèi ®a 4 lÇn!")
          	return
    end
    if GetCash() < 200000 then
        Talk(1,"",VET_201009_02_TB_STRING_LIST[4])
        return
    end
    if gf_Judge_Room_Weight(1,1," ") ~= 1 then
        return
    end
    if Pay(200000) == 1 then
        SetTask(VET_201009_02_TASK_DATE_GOUMAILAZHU, GetTask(VET_201009_02_TASK_DATE_GOUMAILAZHU) + 1)
        local tbItemIds = {VET_201009_02_TB_ITEM_LIST[1][2],VET_201009_02_TB_ITEM_LIST[1][3],VET_201009_02_TB_ITEM_LIST[1][4],1}
        gf_AddItemEx2(tbItemIds, VET_201009_02_TB_ITEM_LIST[1][1],VET_201009_02_STR_LOG_TITLE,VET_201009_02_TB_LOG_ACTION_LIST[1],24*3600,1)
    end
end

function CheckSkill55()
	local nRoute = GetPlayerRoute();
	local nSkillID = tRouteSkillInfo[nRoute];
	if nSkillID == 0 then
		return 0;
	else
		if GetSkillLevel(nSkillID) >= 1 then
			return 1
		else
			return 0
		end;
	end;
end;