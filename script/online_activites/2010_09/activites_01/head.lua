--=============================================
--create by zhangming 2010.8.20
--describe:Ô½ÄÏ°æ2010Äê9ÔÂ»î¶¯1 Í·ÎÄ¼þ
--related files: 
--=============================================

Include("\\script\\online_activites\\task_values.lua");--ÈÎÎñ±äÁ¿Í·ÎÄ¼þ
Include("\\script\\online_activites\\2010_09\\activites_01\\strings.lua");--»î¶¯×Ö·û´®
Include("\\script\\lib\\globalfunctions.lua");--¹«¹²º¯ÊýÎÄ¼þ
Include("\\script\\online\\viet_event\\vng_task_control.lua");

VET_201009_01_EVENT_NUMBER = 13;--ÔÚ»î¶¯±íÉÏµÄ±àºÅÊÇ13
VET_201009_01_EXP_LIMITE_SP = 250000000 --³ÔÌØÊâÔÂ±ýµÄ¾­ÑéÉÏÏÞ
VET_201009_01_EXP_LIMITE = 490000000 --³ÔÆÕÍ¨ÔÂ±ýµÄ¾­ÑéÉÏÏÞ

function VET_201009_01_JingNangDaShiJiangDialog(tbSayDialog, szSayHead)
    if gf_CheckEventDateEx(VET_201009_01_EVENT_NUMBER) == 1 then
        szSayHead = VET_201009_01_TB_STRING_LIST[2];                            --½õÄÒ´óÊÂ¼þsayµÄ±êÌâ
        tinsert(tbSayDialog, VET_201009_01_TB_STRING_LIST[3].."/vet_201009_01_make_mooncake");
        --tinsert(tbSayDialog, VET_201009_01_TB_STRING_LIST[5].."/vet_201009_02_jihuohuadeng");
        --tinsert(tbSayDialog, VET_201009_01_TB_STRING_LIST[24].."/vet_201009_02_goumaihuanglazhu");
        --tinsert(tbSayDialog, VET_201009_01_TB_STRING_LIST[7].."/gf_DoNothing");
    end
    return tbSayDialog, szSayHead;
end

function vet_201009_01_make_mooncake()
    if GetItemCount(VET_201009_01_TB_ITEM_LIST[5][2],VET_201009_01_TB_ITEM_LIST[5][3],VET_201009_01_TB_ITEM_LIST[5][4]) < 1 or GetItemCount(VET_201009_01_TB_ITEM_LIST[3][2],VET_201009_01_TB_ITEM_LIST[3][3],VET_201009_01_TB_ITEM_LIST[3][4]) < 5 then
        Talk(1,"",VET_201009_01_TB_STRING_LIST[8])
        return
    end
    if gf_Judge_Room_Weight(1,1," ") ~= 1 then
        return
    end
    if DelItem(VET_201009_01_TB_ITEM_LIST[5][2],VET_201009_01_TB_ITEM_LIST[5][3],VET_201009_01_TB_ITEM_LIST[5][4],1) == 1 and DelItem(VET_201009_01_TB_ITEM_LIST[3][2],VET_201009_01_TB_ITEM_LIST[3][3],VET_201009_01_TB_ITEM_LIST[3][4],5) == 1 then
        local nItemIds = {VET_201009_01_TB_ITEM_LIST[4][2],VET_201009_01_TB_ITEM_LIST[4][3],VET_201009_01_TB_ITEM_LIST[4][4],1}
        gf_AddItemEx2(nItemIds,VET_201009_01_TB_ITEM_LIST[4][1],VET_201009_01_STR_LOG_TITLE,VET_201009_01_TB_LOG_ACTION_LIST[4],0,1)
    end
    SelectSay()
end

function vet_201009_01_jihuokaolu()
    if GetItemCount(VET_201009_01_TB_ITEM_LIST[5][2],VET_201009_01_TB_ITEM_LIST[5][3],VET_201009_01_TB_ITEM_LIST[5][4]) < 8 or GetItemCount(VET_201009_01_TB_ITEM_LIST[3][2],VET_201009_01_TB_ITEM_LIST[3][3],VET_201009_01_TB_ITEM_LIST[3][4]) < 40 then
        Talk(1,"",VET_201009_01_TB_STRING_LIST[8])
        return
    end
    local nMapId = GetWorldPos()
    local bMapIsOk = 0
    for i = 1, getn(VET_201009_01_TB_MAPID) do
        if nMapId == VET_201009_01_TB_MAPID[i] then
            bMapIsOk = 1
            break
        end
    end
    if bMapIsOk ~= 1 then
        Talk(1,"",VET_201009_01_TB_STRING_LIST[10])
        return
    end
    local nTimeLastKaolu = GetTask(VET_201009_01_TAKS_TIME_LAST_KAOLU)
    local nTimeNow = GetTime()
    if nTimeLastKaolu == nil then
        nTimeLastKaolu = 0
    end
    if nTimeNow - nTimeLastKaolu < 240 then
        Talk(1,"",format(VET_201009_01_TB_STRING_LIST[9],240-nTimeNow+nTimeLastKaolu))
        return
    end
    if DelItem(VET_201009_01_TB_ITEM_LIST[5][2],VET_201009_01_TB_ITEM_LIST[5][3],VET_201009_01_TB_ITEM_LIST[5][4],8) ~= 1 or DelItem(VET_201009_01_TB_ITEM_LIST[3][2],VET_201009_01_TB_ITEM_LIST[3][3],VET_201009_01_TB_ITEM_LIST[3][4],40) ~= 1 then
        return
    end
    SetTask(VET_201009_01_TAKS_TIME_LAST_KAOLU,nTimeNow)
    local nNpcIndex = CreateNpc(VET_201009_01_TB_NPC_LIST[1][1],VET_201009_01_TB_NPC_LIST[1][2],GetWorldPos())
    SetNpcScript(nNpcIndex,VET_201009_01_TB_NPC_LIST[1][3])
    --SetNpcDeathScript(nNpcIndex,VET_201009_01_TB_NPC_LIST[1][3])
    SetNpcLifeTime(nNpcIndex,235) --×î³¤´æÔÚÊ±¼äÎª235Ãë
    SetTask(VET_201009_01_TASK_FLAG_KAOLU,nNpcIndex) --¼ÇÂ¼npcË÷Òý
    SetTask(VET_201009_01_TASK_KAOLU_PHASE,1) --³õÊ¼»¯npcËù´¦½×¶Î
    SetTask(VET_201009_01_TASK_KAOLU_TIME,nTimeNow) --³õÊ¼»¯ÐÂµÄ½×¶Î¿ªÊ¼Ê±¼ä
    SetTask(VET_201009_01_TASK_MUCAI_NUM, 0) --³õÊ¼»¯³É¹¦·ÅÈë¿¾Â¯µÄÄ¾²ñÊý
    StartTimeGuage("Lß n­íng", 30,0,1)
end


function vet_201009_01_goumaihuocai()
    if GetCash() < 40000 then
        Talk(1,"",VET_201009_01_TB_STRING_LIST[13])
        return
    end
    if gf_Judge_Room_Weight(1,1," ") ~= 1 then
        return
    end
    if Pay(40000) == 1 then
        local tbItemIds = {VET_201009_01_TB_ITEM_LIST[6][2],VET_201009_01_TB_ITEM_LIST[6][3],VET_201009_01_TB_ITEM_LIST[6][4],4}
        gf_AddItemEx2(tbItemIds, VET_201009_01_TB_ITEM_LIST[6][1],VET_201009_01_STR_LOG_TITLE,VET_201009_01_TB_LOG_ACTION_LIST[5],0,1)
    end
end



function VET_201009_01_GivePlayerLoginItem()
--    print(VET_201009_01_EVENT_NUMBER)
    if gf_CheckEventDateEx(VET_201009_01_EVENT_NUMBER) == 0 then
        return 0;
    end
    if GetItemCount(VET_201009_01_TB_ITEM_LOGINGIVE_LIST[1][2], VET_201009_01_TB_ITEM_LOGINGIVE_LIST[1][3], VET_201009_01_TB_ITEM_LOGINGIVE_LIST[1][4]) < 1 then
        gf_AddItemEx2({VET_201009_01_TB_ITEM_LOGINGIVE_LIST[1][2], VET_201009_01_TB_ITEM_LOGINGIVE_LIST[1][3], VET_201009_01_TB_ITEM_LOGINGIVE_LIST[1][4], 1}, VET_201009_01_TB_ITEM_LOGINGIVE_LIST[1][1], VET_201009_01_STR_LOG_TITLE, VET_201009_01_TB_LOG_ACTION_LIST[1], 0, 1);
    end
end

function VET_201009_01_GivePlantSmallTreeAward()
    if gf_CheckEventDateEx(VET_201009_01_EVENT_NUMBER) == 1 then
        gf_GivePlantSmallTreeAward({VET_201009_01_TB_ITEM_LIST[3][2], VET_201009_01_TB_ITEM_LIST[3][3], VET_201009_01_TB_ITEM_LIST[3][4], 75},
                VET_201009_01_TB_ITEM_LIST[3][1], VET_201009_01_STR_LOG_TITLE);
    end
end

function VET_201009_01_GivePlantBigTreeAward()
    if gf_CheckEventDateEx(VET_201009_01_EVENT_NUMBER) == 1 then
        gf_GivePlantBigTreeAward({VET_201009_01_TB_ITEM_LIST[3][2], VET_201009_01_TB_ITEM_LIST[3][3], VET_201009_01_TB_ITEM_LIST[3][4], 100},
                VET_201009_01_TB_ITEM_LIST[3][1], VET_201009_01_STR_LOG_TITLE);
    end
end

function VET_201009_01_Give_DailyTaskPersonalAward()
    if gf_CheckEventDateEx(VET_201009_01_EVENT_NUMBER) == 1 then
        gf_GiveDailyTaskPersonalAward({VET_201009_01_TB_ITEM_LIST[3][2], VET_201009_01_TB_ITEM_LIST[3][3], VET_201009_01_TB_ITEM_LIST[3][4], 60},
                VET_201009_01_TB_ITEM_LIST[3][1], VET_201009_01_STR_LOG_TITLE);
    end
end

function VET_201009_01_Give_DailyTaskTeamAward()
    if gf_CheckEventDateEx(VET_201009_01_EVENT_NUMBER) == 1 then
        gf_GiveDailyTaskTeamAward({VET_201009_01_TB_ITEM_LIST[3][2], VET_201009_01_TB_ITEM_LIST[3][3], VET_201009_01_TB_ITEM_LIST[3][4], 60},
                VET_201009_01_TB_ITEM_LIST[3][1], VET_201009_01_STR_LOG_TITLE);
    end
end

function VET_201009_01_Give_ZhongziAward()
    if gf_CheckEventDateEx(VET_201009_01_EVENT_NUMBER) == 1 then
        gf_GiveDailyTaskTeamAward({VET_201009_01_TB_ITEM_LIST[3][2], VET_201009_01_TB_ITEM_LIST[3][3], VET_201009_01_TB_ITEM_LIST[3][4], 50},
                VET_201009_01_TB_ITEM_LIST[3][1], VET_201009_01_STR_LOG_TITLE);
    end
end

function vet_201009_01_get_limitaward()
    if gf_CheckEventDateEx(VET_201009_01_EVENT_NUMBER) == 1 then
        local nNumEatCake = GetTask(VET_201009_01_TASK_NUM_MOONCAKES)
        if nNumEatCake == nil then
            nNumEatCake = 0
        end
        if nNumEatCake < 2450 then
            Talk(1,"",format(VET_201009_01_TB_STRING_LIST[5],nNumEatCake))
            return
        end
        if gf_GetTaskBit(VET_201009_01_TASK_FLAG, VET_201009_01_BIT_LIMIT) == 1 then
            Talk(1,"",VET_201009_01_TB_STRING_LIST[24])
            return
        end
        gf_SetTaskBit(VET_201009_01_TASK_FLAG, VET_201009_01_BIT_LIMIT, 1)
        ModifyExp(20000000)
        Msg2Player("NhËn ®­îc 20000000 ®iÓm kinh nghiÖm!")
        if mod(GetTask(TASK_VNG_PET), 100) > 0 then
        		SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (10 * 100))
        		Msg2Player("NhËn ®­îc 10 ®iÓm n©ng cÊp B¹n §ång Hµnh!")
        end       
        gf_EventGiveRandAward(VET_201009_01_LIMITED_AWARD,1000,1,VET_201009_01_STR_LOG_TITLE,VET_201009_01_TB_LOG_ACTION_LIST[7])
    else
        Talk(1,"",VET_201009_01_TB_STRING_LIST[25])
    end
end

function change_receive_method_201009()
	local tSay = {}
	local szHeader = "§¹i hiÖp muèn sö dông h×nh thøc nhËn th­ëng nµo?"
	
	tinsert(tSay, "KÝch ho¹t sö dông B¸nh Trung Thu (kh«ng nhËn vËt phÈm, thªm 25% ®iÓm kinh nghiÖm)/#confirm_method(1)")
	tinsert(tSay, "KÝch ho¹t sö dông B¸nh Trung Thu (cã nhËn vËt phÈm)/#confirm_method(0)")
	
	Say(szHeader, getn(tSay), tSay)
end

function confirm_method(nType)
	if gf_GetTaskBit(VET_201009_01_TASK_FLAG, VET_201009_01_BIT_METHOD_CONFIRM) == 0 then
		gf_SetTaskBit(VET_201009_01_TASK_FLAG, VET_201009_01_BIT_METHOD_CONFIRM, 1)
	end
	gf_SetTaskBit(VET_201009_01_TASK_FLAG, VET_201009_01_BIT_METHOD, nType)
	gf_WriteLogEx("Hoat dong thang 9 nam 2010", "Thay ®æi h×nh thøc nhËn th­ëng "..nType)
end

function make_cake_201009_01()
	AskClientForNumber("confirm_make_cake_201009_01", 1, 999, "Sè b¸nh Trung Thu?")
end

function confirm_make_cake_201009_01(nCount)
	if nCount == nil then
		return
	end
	local nQuantity = tonumber(nCount)
	if nQuantity < 1 or nQuantity > 999 then
		Talk(1, "", "Sè l­îng nhËp vµo kh«ng hîp lÖ, xin vui lßng nhËp l¹i!")
		return
	end
	if gf_Judge_Room_Weight(3, 2," ") ~= 1 then
        	return
     end
	if GetItemCount(2, 1, 30233) < (5 * nQuantity) or GetItemCount(2,1,30230) < (2 * nQuantity) then
		Talk(1, "", "§¹i hiÖp kh«ng mang ®ñ Bét M× hoÆc vËt phÈm Xu ®Ó ®æi!")
		return
	end
	if DelItem(2, 1, 30233, 5 * nQuantity) == 1 and DelItem(2,1,30230, 2 * nQuantity) == 1 then
		gf_AddItemEx2({2, 1, 30236, nQuantity}, "B¸nh trung thu", "Hoat dong thang 9 nam 2010", "lµm b¸nh b»ng vËt phÈm Xu")
	end
	SelectSay()
end

function rabbit_make_cake()
	if GetItemCount(2, 1, 30230) < 16 or GetItemCount(VET_201009_01_TB_ITEM_LIST[3][2],VET_201009_01_TB_ITEM_LIST[3][3],VET_201009_01_TB_ITEM_LIST[3][4]) < 100 or GetItemCount(VET_201009_01_TB_ITEM_LIST[6][2], VET_201009_01_TB_ITEM_LIST[6][3], VET_201009_01_TB_ITEM_LIST[6][4]) < 1 then
        Talk(1,"",VET_201009_01_TB_STRING_LIST[8])
        return
    end
    local nMapId = GetWorldPos()
    local bMapIsOk = 0
    for i = 1, getn(VET_201009_01_TB_MAPID) do
        if nMapId == VET_201009_01_TB_MAPID[i] then
            bMapIsOk = 1
            break
        end
    end
    if bMapIsOk ~= 1 then
        Talk(1,"",VET_201009_01_TB_STRING_LIST[10])
        return
    end
    
    local nTimeLastKaolu = GetTask(VET_201009_01_TAKS_TIME_LAST_KAOLU)
    local nTimeNow = GetTime()
    if nTimeLastKaolu == nil then
        nTimeLastKaolu = 0
    end
    if nTimeNow - nTimeLastKaolu < 90 then
        Talk(1,"","Lß n­íng cßn ®ang ho¹t ®éng, kh«ng thÓ n­íng thªm!")
        return
    end
    if DelItem(2, 1, 30230, 16) == 1 and DelItem(VET_201009_01_TB_ITEM_LIST[3][2],VET_201009_01_TB_ITEM_LIST[3][3],VET_201009_01_TB_ITEM_LIST[3][4], 100) == 1 and DelItem(VET_201009_01_TB_ITEM_LIST[6][2], VET_201009_01_TB_ITEM_LIST[6][3], VET_201009_01_TB_ITEM_LIST[6][4], 1) == 1 then
    		local nNpcIndex = CreateNpc("Th¸nh Háa §µi", GetName().." Lß n­íng", GetWorldPos())
    		SetTask(VET_201009_01_TASK_FLAG_KAOLU,nNpcIndex)
		SetNpcScript(nNpcIndex, "\\script\\online_activites\\2010_09\\activites_01\\npc\\npc_new_kaolu.lua")
		SetNpcLifeTime(nNpcIndex, 90)
		StartTimeGuage("N­íng b¸nh", 30,0,1)
    		SetTask(VET_201009_01_TAKS_TIME_LAST_KAOLU,nTimeNow)
   		SetTask(VET_201009_01_TASK_KAOLU_TIME,nTimeNow) --³õÊ¼»¯ÐÂµÄ½×¶Î¿ªÊ¼Ê±¼ä
   		SetTask(VET_201009_01_TASK_MUCAI_NUM, 0) --³õÊ¼»¯³É¹¦·ÅÈë¿¾Â¯µÄÄ¾²ñÊý
    end
end