--=============================================
--create by liubo
--describe:Ô½ÄÏ°æ2011Äê8ÔÂ»î¶¯2 Í·ÎÄ¼þ
--related files:
--=============================================

--»î¶¯×Ö·û´®
Include("\\script\\online_activites\\2011_08\\string.lua")
--ÈÎÎñ±äÁ¿¹ÜÀí½Å±¾
Include("\\script\\misc\\taskmanager.lua")

--¿¾Â¯Ê±¼ä´¥·¢Æ÷×Ô¶¨ÒåID
VET_201108_TIME_USER_DEFINE = 2519
--¿¾Â¯Ê±¼ä´¥·¢Æ÷±íÄÚID
VET_201108_TIME_TB_DEFINE = 1512
--»ð²ñ¼Û¸ñ30½ð
VET_201108_MATCH_COST = 300000
--Ã¿ÈË×î¶à²ÎÓë»î¶¯4´Î
VET_201108_MAX_TIMES = 4
--»ñÈ¡¾­ÑéÊ±¼ä
VET_201108_OVEN_LIFE = 4*60
--»î¶¯ID
VET_201108_BAKEDCAKE_ACTIVITY_ID = 38
--ÈÎÎñ±äÁ¿´¦Àí
VET_201108_MIDAUTUMN_TaskGroup = TaskManager:Create(2,4)
--´ÎÊý
VET_201108_MIDAUTUMN_TaskGroup.Times = 1
--ÌìÊý
VET_201108_MIDAUTUMN_TaskGroup.Date = 2
--½áÊøÊ±¼ä0
VET_201108_MIDAUTUMN_TaskGroup.Time_End = 3
--NPCË÷Òý
VET_201108_MIDAUTUMN_TaskGroup.Npc_Index = 4
--tagÉÏµÈÖÐÇïÔÂ±ý
VET_201108_MIDAUTUMN_TaskGroup.Tag_CCake = 5

function VET_201108_BakedCakes_Dialog(tbSayDialog, szSayHead)
	if gf_CheckEventDateEx(VET_201108_BAKEDCAKE_ACTIVITY_ID) == 1 then
		tinsert(tbSayDialog, VET_201108_STRING_LIST[14].."/active_show")
		tinsert(tbSayDialog, VET_201108_STRING_LIST[1].."/active_oven")
		tinsert(tbSayDialog, VET_201108_STRING_LIST[2].."/buy_match_201108")
	end
    return tbSayDialog, szSayHead
end

function active_show()
	--Say(VET_201108_STRING_LIST[15],1,"·µ»Ø²Ëµ¥/back_menu")
	Talk(1,"",VET_201108_STRING_LIST[15])
end

--function back_menu()
--	back menu
--end

function active_oven()
    local nTeamSize = GetTeamSize()
	--Ã»ÓÐ×é¶Ó
    if nTeamSize < 2 then
        Talk(1, "", VET_201108_STRING_LIST[3])
        return
    end
	--¼¤»îÈË²»ÊÇ¶Ó³¤
    if GetCaptainName() ~= GetName() then
        Talk(1, "", VET_201108_STRING_LIST[4])
        return
    end
	--¼ì²éÈ«¶Ó
    if Check_team_member_201108(nTeamSize) == 0 then
        return
    end
    Deal_Triger(nTeamSize)
end

function buy_match_201108()
	local nBuy = floor(GetCash()/VET_201108_MATCH_COST)
	if nBuy == 0 then
        Talk(1, "", VET_201108_STRING_LIST[12])
        return
	else
		AskClientForNumber("match_num_201108",1,nBuy,VET_201108_STRING_LIST[13])
	end
end


function match_num_201108(nBuy)
    if GetCash() < (VET_201108_MATCH_COST*nBuy) then
        Talk(1, "", VET_201108_STRING_LIST[12])
        return
    end
    if gf_Judge_Room_Weight(nBuy,1," ") ~= 1 then
        return
    end
    if Pay(VET_201108_MATCH_COST*nBuy) == 1 then
        local tbItemIds = {VET_201108_ITEM_LIST[2][2],VET_201108_ITEM_LIST[2][3],VET_201108_ITEM_LIST[2][4],nBuy}
		gf_AddItemEx2(tbItemIds, VET_201108_ITEM_LIST[2][1],VET_201108_LOG_TITLE,VET_201108_TB_LOG_ACTION_LIST[1],24*3600,1)
    end
end

function Is_In_City_Map()
    local nMapId = GetWorldPos()
    local bMapIsOk = 0
    for i = 1, getn(VET_201108_TB_MAPID) do
        if nMapId == VET_201108_TB_MAPID[i] then
            bMapIsOk = 1
            break
        end
    end
    if bMapIsOk == 0 then
        return 0
    end
end

--·µ»ØÌìÊý
function zgc_pub_day_turn(day_num)
	day_num = day_num or 1
	local time_return = floor((GetTime()-57600)/(86400*day_num))
	return time_return
end

function Check_team_member_201108(nTeamSize)
    local nOldPlayer = PlayerIndex
    for i = 1, nTeamSize do
        PlayerIndex = GetTeamMember(i)
        if PlayerIndex <= 0 then
            Talk(1, "", VET_201108_STRING_LIST[5])
            return 0
        end
		--ÊÇ·ñÔÚÏà¹Ø³ÇÊÐ
        if Is_In_City_Map() == 0 then
            PlayerIndex = nOldPlayer --Õâ¸öÏûÏ¢¸æËß¶Ó³¤¾ÍÐÐÁË
            Talk(1, "", VET_201108_STRING_LIST[6])
            return 0
        end
		--µÈ¼¶£¬¼¼ÄÜ
		local nLevel = GetLevel()
        if nLevel < 77 or GetPlayerFaction() == 0 or gf_Check55HaveSkill() == 0 then
            Talk(1, "", VET_201108_STRING_LIST[7]);
            PlayerIndex = nOldPlayer; --Õâ¸öÏûÏ¢¸æËß¶Ó³¤¾ÍÐÐÁË
            Talk(1, "", VET_201108_STRING_LIST[7]);
            return 0;
        end
		--¼ì²éÔÂ±ýÊýÁ¿
        if GetItemCount(VET_201108_ITEM_LIST[1][2],VET_201108_ITEM_LIST[1][3],VET_201108_ITEM_LIST[1][4]) < 5 then
            PlayerIndex = nOldPlayer --Õâ¸öÏûÏ¢¸æËß¶Ó³¤¾ÍÐÐÁË
            Talk(1, "", VET_201108_STRING_LIST[8])
            return 0
        end
		--¼ì²é»ð²ñ
		if GetItemCount(VET_201108_ITEM_LIST[2][2],VET_201108_ITEM_LIST[2][3],VET_201108_ITEM_LIST[2][4]) < 1 then
            PlayerIndex = nOldPlayer --Õâ¸öÏûÏ¢¸æËß¶Ó³¤¾ÍÐÐÁË
            Talk(1, "", VET_201108_STRING_LIST[9])
            return 0
        end
		--¼ì²é¼¤»î¿¾Â¯´ÎÊý
		--ÊÇ·ñÔÚÍ¬Ò»Ìì
		local nDate = tonumber(date("%y%m%d")) --zgc_pub_day_turn()
		if nDate ~= VET_201108_MIDAUTUMN_TaskGroup:GetTask(VET_201108_MIDAUTUMN_TaskGroup.Date) then
			VET_201108_MIDAUTUMN_TaskGroup:SetTask(VET_201108_MIDAUTUMN_TaskGroup.Date,nDate)
			VET_201108_MIDAUTUMN_TaskGroup:SetTask(VET_201108_MIDAUTUMN_TaskGroup.Times,0)
		end
        local nTimes = VET_201108_MIDAUTUMN_TaskGroup:GetTask(VET_201108_MIDAUTUMN_TaskGroup.Times)
        if nTimes >= VET_201108_MAX_TIMES then
			Talk(1, "", format(VET_201108_STRING_LIST[10], VET_201108_MAX_TIMES))
			if PlayerIndex ~=nOldPlayer then
				PlayerIndex = nOldPlayer
				Talk(1, "", format(VET_201108_STRING_LIST[10], VET_201108_MAX_TIMES))
                        end
			return 0
        end
		--Ö»ÄÜÍ¬Ê±¼¤»îÒ»¸ö»ðÂ¯
		local nTime = tonumber(GetTime())
		--Msg2Player("nTime="..nTime)
		--Msg2Player("Task="..VET_201108_MIDAUTUMN_TaskGroup:GetTask(VET_201108_MIDAUTUMN_TaskGroup.Time_End))
		if nTime < VET_201108_MIDAUTUMN_TaskGroup:GetTask(VET_201108_MIDAUTUMN_TaskGroup.Time_End) + 62	then
			Talk(1, "",VET_201108_STRING_LIST[11])
			if PlayerIndex ~= nOldPlayer then
				PlayerIndex = nOldPlayer --Ò»²¢¸æËß¶Ó³¤
				Talk(1, "",VET_201108_STRING_LIST[11])
			end
			return 0
		end
    end
    PlayerIndex = nOldPlayer
	return 1
end

--¾àÀëÅÐ¶Ï
function DistanceBetweenPoints(MapID1, MapX1, MapY1, MapID2, MapX2, MapY2)
    if MapID1 ~= MapID2 then
        return -1
    else
	local dx = MapX2 - MapX1
        local dy = MapY2 - MapY1
        local nDist = (dx * dx + dy * dy)^(1/2);
        return nDist;
    end;
end

function Deal_Triger(nTeamSize)
	--ÅÐ¶Ï¶ÓÔ±ÊÇ·ñÔÚÒ»Æð
	MapID1, MapX1, MapY1 = GetWorldPos()
	local nOldPlayer = PlayerIndex
    for i = 1, nTeamSize do
        PlayerIndex = GetTeamMember(i)
        if PlayerIndex <= 0 then
            Talk(1, "", VET_201108_STRING_LIST[5])
			PlayerIndex = nOldPlayer
            return
        end
		if PlayerIndex ~= nOldPlayer then
			MapID2, MapX2, MapY2 = GetWorldPos()
			local nDist = DistanceBetweenPoints(MapID1, MapX1, MapY1, MapID2, MapX2, MapY2)
			--Msg2Player("nDist="..nDist)
			if nDist < 0 or nDist > 18 then
				Talk(1,"",VET_201108_STRING_LIST[17])
				PlayerIndex = nOldPlayer
				Talk(1,"",VET_201108_STRING_LIST[17])
				return
			end
		end
    end
    PlayerIndex = nOldPlayer
	--É¾³ýÎïÆ·
    local nOldPlayer = PlayerIndex
    for i = 1, nTeamSize do
        PlayerIndex = GetTeamMember(i)
        if PlayerIndex <= 0 then
            Talk(1, "", VET_201108_STRING_LIST[5])
            return
        end
        if DelItem(VET_201108_ITEM_LIST[1][2],VET_201108_ITEM_LIST[1][3],VET_201108_ITEM_LIST[1][4],5) ~= 1 then
            return
        end
		if DelItem(VET_201108_ITEM_LIST[2][2],VET_201108_ITEM_LIST[2][3],VET_201108_ITEM_LIST[2][4],1) ~= 1 then
            return
        end
    end
    PlayerIndex = nOldPlayer
	--´´½¨¿¾Â¯NPC
	local nNpcIndex = 0
	if random(100) > 5 then
		nNpcIndex = CreateNpc(VET_201108_TB_NPCS[1][1],VET_201108_TB_NPCS[1][2],GetWorldPos())
		SetNpcScript(nNpcIndex,"\\script\\online_activites\\2011_08\\activity_02\\npc_script.lua")
		SetNpcLifeTime(nNpcIndex, VET_201108_OVEN_LIFE + 2 + 60)  --ÐÞÕý·ÀÖ¹NPCÏûÊ§ÄÃ²»µ½×îºóÒ»´Î¾­Ñé,1minÄÚÁìÈ¡½±Àø)	
	else
		nNpcIndex = CreateNpc(VET_201108_TB_NPCS[2][1],VET_201108_TB_NPCS[2][2],GetWorldPos())
		SetNpcScript(nNpcIndex,"\\script\\online_activites\\2011_08\\activity_02\\npc_script.lua")
		SetNpcLifeTime(nNpcIndex, VET_201108_OVEN_LIFE + 2 + 60)  --ÐÞÕý·ÀÖ¹NPCÏûÊ§ÄÃ²»µ½×îºóÒ»´Î¾­Ñé,1minÄÚÁìÈ¡½±Àø
	end
	
    local nOldPlayer = PlayerIndex
    for i = 1, nTeamSize do
        PlayerIndex = GetTeamMember(i)
        if PlayerIndex <= 0 then
            Talk(1, "", VET_201108_STRING_LIST[5])
            return
        end
        StartTimeGuage("N­íng b¸nh", VET_201108_OVEN_LIFE,0,1)
    end
    PlayerIndex = nOldPlayer
		
	Msg2Player("C¸c h¹ ®· kÝch ho¹t lß n­íng thµnh c«ng!")
	--´¦ÀíÃ¿Ò»¸ö¶ÓÔ±
    local nOldPlayer = PlayerIndex
    for i = 1, nTeamSize do
        PlayerIndex = GetTeamMember(i)
		if PlayerIndex <= 0 then
            Talk(1, "", VET_201108_STRING_LIST[5])
            return
        end
		--ÉèÖÃtagÈÎÎñ±äÁ¿£¨1£©
		VET_201108_MIDAUTUMN_TaskGroup:SetTask(VET_201108_MIDAUTUMN_TaskGroup.Tag_CCake,0)
		--´¥·¢Æ÷ÖÕÖ¹Ê±¼ä£¬·ÀÖ¹NPCÒâÍâ¶ªÊ§¡£´¥·¢Æ÷½«ÔÚNPCÊ±ÏÞ10ÃëºóÏûÊ§..£¨2£©
        VET_201108_MIDAUTUMN_TaskGroup:SetTask(VET_201108_MIDAUTUMN_TaskGroup.Time_End,GetTime() + VET_201108_OVEN_LIFE)
		--Msg2Player("Time_end="..VET_201108_MIDAUTUMN_TaskGroup:GetTask(VET_201108_MIDAUTUMN_TaskGroup.Time_End))
        --´´½¨´¥·¢Æ÷
		CreateTrigger(1,VET_201108_TIME_TB_DEFINE,VET_201108_TIME_USER_DEFINE)
        ContinueTimer(GetTrigger(VET_201108_TIME_USER_DEFINE))
		gf_WriteLogEx(VET_201108_LOG_TITLE,VET_201108_TB_LOG_ACTION_LIST[2]) 					--by xiongyizhi ÐÂ¼Ó²Î¼Ó»î¶¯log
        --ÈÎÎñ±äÁ¿±£´æNPCË÷Òý£¨3£©
		VET_201108_MIDAUTUMN_TaskGroup:SetTask(VET_201108_MIDAUTUMN_TaskGroup.Npc_Index,nNpcIndex)
		--²Î¼Ó´ÎÊý+1
        VET_201108_MIDAUTUMN_TaskGroup:SetTask(VET_201108_MIDAUTUMN_TaskGroup.Times,VET_201108_MIDAUTUMN_TaskGroup:GetTask(VET_201108_MIDAUTUMN_TaskGroup.Times) + 1)
	end
    PlayerIndex = nOldPlayer
end
--¿Õº¯ÊýÔ¤Áô
function ServerStartUp()
end
function PlayerLogin()
end