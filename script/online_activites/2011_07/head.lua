--=============================================
--create by xiongyizhi
--describe:Ô½ÄÏ°æ2010Äê12ÔÂ»î¶¯3 Í·ÎÄ¼þ
--related files: 
--=============================================

Include("\\script\\online_activites\\2011_07\\strings.lua");--»î¶¯×Ö·û´®
Include("\\script\\lib\\globalfunctions.lua");--¹«¹²º¯ÊýÎÄ¼þ
Include("\\script\\misc\\taskmanager.lua");
VET_201107_TIME_USER_DEFINE = 2520;	--»ð¶ÑÊ±¼ä´¥·¢Æ÷×Ô¶¨ÒåID
VET_201107_TIME_TB_DEFINE = 1510;	--»ð¶ÑÊ±¼ä´¥·¢Æ÷±íÄÚID
VET_201107_ROSE_SEED_COST = 300000; 	--»ð²ñ¼Û¸ñ20½ð
VET_201107_MAX_TIMES = 4; 				--Ã¿ÈË×î¶à²ÎÓë»î¶¯4´Î
VET_201107_ROSE_LIFE = 5*60;         	--»ð¶Ñnpc´æ»îÊ±¼ä£¬Êµ¼ÊÊ±ÏÞºÍ´¥·¢Æ÷Ê±ÏÞ¶¼ÂÔÎ¢ÓÐ¼Ó³¤ÐÞ¸´
VET_201107_SUMMER_ROSE_ACTIVITY_ID = 36	--»î¶¯ID
--ÈÎÎñ±äÁ¿´¦Àí
VET_201107_SUMMER_ROSE_TaskGroup = TaskManager:Create(2,3)
VET_201107_SUMMER_ROSE_TaskGroup.Rose_Times = 1
VET_201107_SUMMER_ROSE_TaskGroup.Time_End = 2
VET_201107_SUMMER_ROSE_TaskGroup.Npc_Index = 3
VET_201107_SUMMER_ROSE_TaskGroup.Rose_Date = 4

function VET_201107_JingNangDaShiJiangDialog(tbSayDialog, szSayHead)
	if gf_CheckEventDateEx(VET_201107_SUMMER_ROSE_ACTIVITY_ID) == 1 then
		tinsert(tbSayDialog, VET_201107_STRING_LIST[1].."/active_fire_for_warm")
		tinsert(tbSayDialog, VET_201107_STRING_LIST[2].."/buy_match");
	end
    return tbSayDialog, szSayHead;
end

function active_fire_for_warm()
    local nTeamSize = GetTeamSize()
    if nTeamSize < 2 then
        Talk(1, "", VET_201107_STRING_LIST[6])
        return
    end
    if GetCaptainName() ~= GetName() then
        Talk(1, "", VET_201107_STRING_LIST[5])
        return
    end
    if Check_team_member(nTeamSize) == 0 then
    	   Talk(1, "", "Cã thµnh viªn trong tæ ®éi ch­a ®ñ ®iÒu kiÖn kÝch ho¹t!")
        return 0;
    end
    
    if team_check_rose_activated() == 1 then
    		Talk(1, "", "Cã thµnh viªn trong tæ ®éi ®ang kÝch ho¹t mÇm hoa råi!")
    		return 0;
    end
    
    to_set_fire_now(nTeamSize)
end

function buy_match()
    if GetCash() < VET_201107_ROSE_SEED_COST then
        Talk(1, "", VET_201107_STRING_LIST[4])
        return
    end
    if gf_Judge_Room_Weight(1,1," ") ~= 1 then
        return
    end
    if Pay(VET_201107_ROSE_SEED_COST) == 1 then
        local tbItemIds = {VET_201107_TB_ITEM_LIST[1][2],VET_201107_TB_ITEM_LIST[1][3],VET_201107_TB_ITEM_LIST[1][4],1}
        gf_AddItemEx2(tbItemIds, VET_201107_TB_ITEM_LIST[1][1],VET_201107_LOG_TITLE,VET_201107_TB_LOG_ACTION_LIST[1],24*3600,1)
    end
end

function Is_In_City_Map()
    local nMapId = GetWorldPos()
    local bMapIsOk = 0
    for i = 1, getn(VET_201107_TB_MAPID) do
        if nMapId == VET_201107_TB_MAPID[i] then
            bMapIsOk = 1;
            break
        end
    end
    if bMapIsOk == 0 then
        return 0;
    end
end

function Check_team_member(nTeamSize)
    local nOldPlayer = PlayerIndex
    for i = 1, nTeamSize do
        PlayerIndex = GetTeamMember(i)
        if PlayerIndex <= 0 then
            Talk(1, "", VET_201107_STRING_LIST[7]);
            return 0;
        end
        if Is_In_City_Map() == 0 then
            PlayerIndex = nOldPlayer; --Õâ¸öÏûÏ¢¸æËß¶Ó³¤¾ÍÐÐÁË
            Talk(1, "", VET_201107_STRING_LIST[12]);
            return 0;
        end
        local nLevel = GetLevel()
        if nLevel < 77 or GetPlayerFaction() == 0 or gf_Check55HaveSkill() == 0 then
            Talk(1, "", VET_201107_STRING_LIST[10]);
            PlayerIndex = nOldPlayer; --Õâ¸öÏûÏ¢¸æËß¶Ó³¤¾ÍÐÐÁË
            Talk(1, "", VET_201107_STRING_LIST[10]);
            return 0;
        end
        local nDate = tonumber(date("%y%m%d"))
        local nActivatedDate = VET_201107_SUMMER_ROSE_TaskGroup:GetTask(VET_201107_SUMMER_ROSE_TaskGroup.Rose_Date)
        if nActivatedDate ~= nDate then
        	  VET_201107_SUMMER_ROSE_TaskGroup:SetTask(VET_201107_SUMMER_ROSE_TaskGroup.Rose_Date, nDate)
        	  VET_201107_SUMMER_ROSE_TaskGroup:SetTask(VET_201107_SUMMER_ROSE_TaskGroup.Rose_Times, 0)      	  
        end
        
        if GetItemCount(VET_201107_TB_ITEM_LIST[1][2],VET_201107_TB_ITEM_LIST[1][3],VET_201107_TB_ITEM_LIST[1][4]) < 1 then
            PlayerIndex = nOldPlayer; --Õâ¸öÏûÏ¢¸æËß¶Ó³¤¾ÍÐÐÁË
            Talk(1, "", VET_201107_STRING_LIST[8]);
            return 0;
        end
        local nTimes = VET_201107_SUMMER_ROSE_TaskGroup:GetTask(VET_201107_SUMMER_ROSE_TaskGroup.Rose_Times)
        if times == nil then
            times = 0
        end
        if nTimes >= VET_201107_MAX_TIMES then
            Talk(1, "", format(VET_201107_STRING_LIST[11], VET_201107_MAX_TIMES));
            return 0;
        end
		--Ö»ÄÜÍ¬Ê±¼¤»îÒ»¸ö»¨ÃçÐÅÏ¢
--		local nTime = tonumber(GetTime())
--		if nTime < (VET_201107_SUMMER_ROSE_TaskGroup:GetTask(VET_201107_SUMMER_ROSE_TaskGroup.Time_End)) then
--			Talk(1, "",VET_201107_STRING_LIST[13])
--			if PlayerIndex ~= nOldPlayer then
--				PlayerIndex = nOldPlayer --Ò»²¢¸æËß¶Ó³¤
--				Talk(1, "",VET_201107_STRING_LIST[13])
--			end
--			return 0
--		end
    end
    PlayerIndex = nOldPlayer
end

function to_set_fire_now(nTeamSize)
    local nOldPlayer = PlayerIndex
    for i = 1, nTeamSize do
        PlayerIndex = GetTeamMember(i)
        if PlayerIndex <= 0 then
            Talk(1, "", VET_201107_STRING_LIST[7])
            return
        end
        if DelItem(VET_201107_TB_ITEM_LIST[1][2],VET_201107_TB_ITEM_LIST[1][3],VET_201107_TB_ITEM_LIST[1][4],1) ~= 1 then
            return
        end
    end
    PlayerIndex = nOldPlayer

    local nNpcIndex = CreateNpc(VET_201107_TB_NPCS[1][1],VET_201107_TB_NPCS[1][2],GetWorldPos())
    SetNpcLifeTime(nNpcIndex, VET_201107_ROSE_LIFE + 2)  --ÐÞÕý·ÀÖ¹NPCÏûÊ§ÄÃ²»µ½×îºóÒ»´Î¾­Ñé

    local nOldPlayer = PlayerIndex
    local nEndTime = GetTime() + 300
    for i = 1, nTeamSize do
        PlayerIndex = GetTeamMember(i)
        if PlayerIndex <= 0 then
            Talk(1, "", VET_201107_STRING_LIST[7])
            return
        end
        VET_201107_SUMMER_ROSE_TaskGroup:SetTask(VET_201107_SUMMER_ROSE_TaskGroup.Time_End, GetTime() + VET_201107_ROSE_LIFE + 20)     --´¥·¢Æ÷ÖÕÖ¹Ê±¼ä£¬·ÀÖ¹NPCÒâÍâ¶ªÊ§¡£´¥·¢Æ÷½«ÔÚNPCÊ±ÏÞ10ÃëºóÏûÊ§
        CreateTrigger(1, VET_201107_TIME_TB_DEFINE, VET_201107_TIME_USER_DEFINE);
        ContinueTimer(GetTrigger(VET_201107_TIME_USER_DEFINE));
        gf_WriteLogEx(VET_201107_LOG_TITLE,VET_201107_TB_LOG_ACTION_LIST[2]) 					--by xiongyizhi ÐÂ¼Ó²Î¼Ó»î¶¯log
        VET_201107_SUMMER_ROSE_TaskGroup:SetTask(VET_201107_SUMMER_ROSE_TaskGroup.Npc_Index,nNpcIndex);
        VET_201107_SUMMER_ROSE_TaskGroup:SetTask(VET_201107_SUMMER_ROSE_TaskGroup.Rose_Times,VET_201107_SUMMER_ROSE_TaskGroup:GetTask(VET_201107_SUMMER_ROSE_TaskGroup.Rose_Times) + 1);
    end
    PlayerIndex = nOldPlayer
end

function team_check_rose_activated()
	local nCount = 0
	local nOldPlayerIdx = PlayerIndex
	local nTeamSize = GetTeamSize()
	
	for i = 1, nTeamSize do
     		PlayerIndex = GetTeamMember(i)
	    	if GetTrigger(VET_201107_TIME_USER_DEFINE) ~= 0 then
--			Talk(1,"","B¹n ®ang kÝch ho¹t nhËn th­ëng råi!")
			nCount = 1
			break
		end
	end
	PlayerIndex = nOldPlayerIdx
	return nCount
end

--»î¶¯ÆÚ¼äµÄ·þÎñÆ÷Æô¶¯º¯Êý
function ServerStartUp()
end
--»î¶¯ÆÚ¼äµÄµÇÂ¼º¯Êý
function PlayerLogin()
end
