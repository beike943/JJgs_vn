Include("\\script\\lib\\globalfunctions.lua") --¹«¹²º¯ÊýÎÄ¼þ
Include("\\script\\misc\\taskmanager.lua") 
Include("\\script\\online\\zgc_public_fun.lua")

VET_LOG_TITLE = "Hoat Dong Hoa Hong Thang 9/2013";

VET_TB_LOG_ACTION_LIST = {
    [1] = "Mua MÇm Hoa",
    [2] = "KÝch ho¹t trång hoa",
};

VET_STRING_LIST = {
    [1] = "KÝch ho¹t trång hoa",
    [2] = "Mua MÇm Hoa (1 MÇm Hoa = 19 vµng)",
    [3] = "KÕt thóc ®èi tho¹i",
    [4] = "TiÒn vµng ®¹i hiÖp mang theo kh«ng ®ñ.",
    [5] = "ChØ cã ®éi tr­ëng míi cã thÓ kÝch ho¹t trång hoa.",
    [6] = "CÇn tæ ®éi trªn 2 ng­êi, míi cã thÓ kÝch ho¹t trång hoa.",
    [7] = "§iÒu kiÖn trång hoa lçi.",
    [8] = "Tæ ®éi thµnh viªn mçi ng­êi cÇn mang theo 1 mÇm hoa míi cã thÓ kÝch ho¹t trång hoa.",
    [9] = "Mçi ngµy mçi ng­êi ch¬i giíi h¹n mua 1 mÇm hoa.",
    [10] = "Nh©n vËt cÊp 77 trë lªn, ®· gia nhËp m«n ph¸i vµ luyÖn ®­îc kü n¨ng cÊp 55 míi cã thÓ tham gia ho¹t ®éng",
    [11] = "Mçi ngµy mçi nh©n vËt chØ ®­îc tham gia ho¹t ®éng %d lÇn.",
    [12] = "ChØ ®­îc kÝch ho¹t trång hoa t¹i c¸c thµnh thÞ lín (BiÖn Kinh, Thµnh §«, TuyÒn Ch©u, T­¬ng D­¬ng, D­¬ng Ch©u, §¹i Lý, Ph­îng T­êng).",
		[13] = "ChØ cã thÓ cïng lóc kÝch ho¹t 1 mÇm hoa.",
		[14] = "§éi viªn kh«ng cã bªn c¹nh, kh«ng thÓ kÝch ho¹t trång hoa."
};

VET_TB_ITEM_LIST = {
    [1] = {"MÇm Hoa hång",2,1,30289},
};

VET_TB_MAPID = {
    100,150,200,300,350,400,500,
}

VET_TB_NPCS = {
	[1] = {"Hoa hång ®á","Hoa hång ®á"},    
	[2] = {"Hoa hång vµng","Hoa hång vµng"},
};

VET_EXP_TABLE = {
	[2] = {100000,200000},
	[3] = {105000,210000},
	[4] = {110000,220000},	
	[5] = {115000,230000},
	[6] = {120000,240000},
	[7] = {130000,260000},
	[8] = {160000,320000},
}

VET_ROSE_ACTIVITY_ID = 100	--»î¶¯ID
VET_TIME_TB_DEFINE = 1532 	--Ê±¼ä´¥·¢Æ÷±íÄÚID
VET_TIME_USER_DEFINE = VET_TIME_TB_DEFINE*2 	--Ê±¼ä´¥·¢Æ÷×Ô¶¨ÒåID
VET_ROSE_SEED_COST = 190000  	--»¨Ãç¼Û¸ñ
VET_MAX_TIMES = 8  				--Ã¿ÈË×î¶à²ÎÓë»î¶¯4´Î
VET_ROSE_LIFE = 10*60      --»¨¶änpc´æ»îÊ±¼ä
VET_ADDIONAL_EXP = 19000000 --×îºóÒ»´Î¶îÍâ½±Àø

--ÈÎÎñ±äÁ¿´¦Àí
VET_ROSE_TaskGroup = TaskManager:Create(10,6)
VET_ROSE_TaskGroup.Rose_Times = 1
VET_ROSE_TaskGroup.Time_End = 2
VET_ROSE_TaskGroup.Npc_Index = 3
VET_ROSE_TaskGroup.Date = 4
VET_ROSE_TaskGroup.TeamSize = 5

function VET_201309_AdditionDialog() --tbSayDialog, szSayHead
local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "Th«ng tin chi tiÕt c¸c ho¹t ®éng ®ång ®¹o cã thÓ xem trªn trang chñ <color=green>http://volam2.zing.vn<color>."
	if gf_CheckEventDateEx(VET_ROSE_ACTIVITY_ID) == 1 then
		tinsert(tbSayDialog, VET_STRING_LIST[1].."/active_fire_for_warm")
		tinsert(tbSayDialog, VET_STRING_LIST[2].."/buy_match") 
		tinsert(tbSayDialog, "Tho¸t/do_nothing");
	end
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end

--¼¤»îÃµ¹å»¨
function active_fire_for_warm()
    local nTeamSize = GetTeamSize()
    if nTeamSize < 2 then
        Talk(1, "", VET_STRING_LIST[6])
        return
    end
    if GetCaptainName() ~= GetName() then
        Talk(1, "", VET_STRING_LIST[5])
        return
    end
    if Check_team_member(nTeamSize) == 0 then
        return 0 
    end
    to_set_fire_now(nTeamSize)
end

function buy_match()
    if GetCash() < VET_ROSE_SEED_COST then
        Talk(1, "", VET_STRING_LIST[4])
        return
    end
    if gf_Judge_Room_Weight(1,1," ") ~= 1 then
        return
    end
    if Pay(VET_ROSE_SEED_COST) == 1 then
        local tbItemIds = {VET_TB_ITEM_LIST[1][2],VET_TB_ITEM_LIST[1][3],VET_TB_ITEM_LIST[1][4],1}
        gf_AddItemEx2(tbItemIds, VET_TB_ITEM_LIST[1][1],VET_LOG_TITLE,VET_TB_LOG_ACTION_LIST[1],24*3600,1)
    end
end

function Is_In_City_Map()
    local nMapId = GetWorldPos()
    local bMapIsOk = 0
    for i = 1, getn(VET_TB_MAPID) do
        if nMapId == VET_TB_MAPID[i] then
            bMapIsOk = 1 
            break
        end
    end
    if bMapIsOk == 0 then
        return 0 
    end
end

function Check_team_member(nTeamSize)
    local nOldPlayer = PlayerIndex
    for i = 1, nTeamSize do
      PlayerIndex = GetTeamMember(i)
      if PlayerIndex <= 0 then
        Talk(1, "", VET_STRING_LIST[7]) 
      	return 0 
    	end
    	local szCurrName = GetName();
			local nDate = zgc_pub_day_turn()
			if VET_ROSE_TaskGroup:GetTask(VET_ROSE_TaskGroup.Date) ~= nDate then
				VET_ROSE_TaskGroup:SetTask(VET_ROSE_TaskGroup.Date,nDate)
				VET_ROSE_TaskGroup:SetTask(VET_ROSE_TaskGroup.Rose_Times,0)
			end
      if Is_In_City_Map() == 0 then
        PlayerIndex = nOldPlayer  --Õâ¸öÏûÏ¢¸æËß¶Ó³¤¾ÍÐÐÁË
        Talk(1, "", VET_STRING_LIST[12]) 
        return 0;
      end
      local nLevel = GetLevel()
      if nLevel < 77 or GetPlayerFaction() == 0 or gf_Check55FullSkill() == 0 then
          Talk(1, "", VET_STRING_LIST[10]) 
          PlayerIndex = nOldPlayer  --Õâ¸öÏûÏ¢¸æËß¶Ó³¤¾ÍÐÐÁË
          Talk(1, "", VET_STRING_LIST[10]..format("\n<color=red>%s<color>", szCurrName)) 
          return 0 
      end
      if GetItemCount(VET_TB_ITEM_LIST[1][2],VET_TB_ITEM_LIST[1][3],VET_TB_ITEM_LIST[1][4]) < 1 then
          PlayerIndex = nOldPlayer  --Õâ¸öÏûÏ¢¸æËß¶Ó³¤¾ÍÐÐÁË
          Talk(1, "", VET_STRING_LIST[8]..format("\n<color=red>%s<color>", szCurrName)) 
          return 0 
      end
      local nTimes = VET_ROSE_TaskGroup:GetTask(VET_ROSE_TaskGroup.Rose_Times)
      if not nTimes or nTimes >= VET_MAX_TIMES then
          Talk(1, "", format(VET_STRING_LIST[11], VET_MAX_TIMES));
          PlayerIndex = nOldPlayer
          Talk(1, "", format(VET_STRING_LIST[11], VET_MAX_TIMES)..format("\n<color=red>%s<color>", szCurrName));
          return 0;
      end
			--Ö»ÄÜÍ¬Ê±¼¤»îÒ»¸ö»¨ÃçÐÅÏ¢
			local nTime = tonumber(GetTime())
			if nTime < VET_ROSE_TaskGroup:GetTask(VET_ROSE_TaskGroup.Time_End) then
				Talk(1, "",VET_STRING_LIST[13])
				if PlayerIndex ~= nOldPlayer then
					PlayerIndex = nOldPlayer --Ò»²¢¸æËß¶Ó³¤
					Talk(1, "",VET_STRING_LIST[13]..format("\n<color=red>%s<color>", szCurrName))
				end
				return 0
			end
    end
    PlayerIndex = nOldPlayer
end

function to_set_fire_now(nTeamSize)
	--ÅÐ¶Ï¶ÓÓÑÊÇ·ñÔÚÉí±ß24³ß
	local nMapId1,nX1,nY1=GetWorldPos()
	nOldPlayer = PlayerIndex
	local nMapId2,nX2,nY2
  for i = 1, nTeamSize do
    PlayerIndex = GetTeamMember(i)
		nMapId2,nX2,nY2 = GetWorldPos()
		local nDis = DistanceBetweenPoints(nMapId1,nX1,nY1,nMapId2,nX2,nY2)
    if  nDis < 0 or nDis > 24 then
      PlayerIndex = nOldPlayer
			Talk(1, "", VET_STRING_LIST[14])
		  return
    end
  end
	--ÊÇ·ñÔÚÏß²¢É¾³ýÎïÆ·
  for i = 1, nTeamSize do
    PlayerIndex = GetTeamMember(i)
    if PlayerIndex <= 0 then
      Talk(1, "", VET_STRING_LIST[7])
			PlayerIndex = nOldPlayer
      return
    end
    if DelItem(VET_TB_ITEM_LIST[1][2],VET_TB_ITEM_LIST[1][3],VET_TB_ITEM_LIST[1][4],1) ~= 1 then
			PlayerIndex = nOldPlayer
    	return
    end
  end
  PlayerIndex = nOldPlayer
	local nNpcIndex
	local nResult = random(100)
	if  nResult < 61 then
		nNpcIndex = CreateNpc(VET_TB_NPCS[1][1],VET_TB_NPCS[1][2],GetWorldPos())
		SetNpcLifeTime(nNpcIndex, VET_ROSE_LIFE)
	else
		nNpcIndex = CreateNpc(VET_TB_NPCS[2][1],VET_TB_NPCS[2][2],GetWorldPos())
		SetNpcLifeTime(nNpcIndex, VET_ROSE_LIFE)
	end
  local nOldPlayer = PlayerIndex
  for i = 1, nTeamSize do
    PlayerIndex = GetTeamMember(i)
    if PlayerIndex <= 0 then
      Talk(1, "", VET_STRING_LIST[7])
			PlayerIndex = nOldPlayer
      return
    end
    VET_ROSE_TaskGroup:SetTask(VET_ROSE_TaskGroup.Time_End, GetTime() + VET_ROSE_LIFE + 20)     --´¥·¢Æ÷ÖÕÖ¹Ê±¼ä£¬·ÀÖ¹NPCÒâÍâ¶ªÊ§¡£´¥·¢Æ÷½«ÔÚNPCÊ±ÏÞ10ÃëºóÏûÊ§
    CreateTrigger(1, VET_TIME_TB_DEFINE, VET_TIME_USER_DEFINE) 
    ContinueTimer(GetTrigger(VET_TIME_USER_DEFINE)) 
    gf_WriteLogEx(VET_LOG_TITLE,VET_TB_LOG_ACTION_LIST[2])
    VET_ROSE_TaskGroup:SetTask(VET_ROSE_TaskGroup.Npc_Index,nNpcIndex) 
    VET_ROSE_TaskGroup:SetTask(VET_ROSE_TaskGroup.Rose_Times,VET_ROSE_TaskGroup:GetTask(VET_ROSE_TaskGroup.Rose_Times) + 1)
    VET_ROSE_TaskGroup:SetTask(VET_ROSE_TaskGroup.TeamSize,nTeamSize) 
  end
  PlayerIndex = nOldPlayer
end

--ÅÐ¶Ï¾ÙÀý
function DistanceBetweenPoints(MapID1, MapX1, MapY1, MapID2, MapX2, MapY2)
    if MapID1 ~= MapID2 then
      return -1
    else
			local dx = MapX2 - MapX1
		  local dy = MapY2 - MapY1
		  local nDist = (dx * dx + dy * dy)^(1/2)
		  return nDist
    end;
end

function OnTimer()
  local nTeamSize = GetTeamSize() or 0;
  nTeamSize = min(VET_ROSE_TaskGroup:GetTask(VET_ROSE_TaskGroup.TeamSize), nTeamSize);
  if not VET_EXP_TABLE[nTeamSize] then
  	RemoveTrigger(GetTrigger(VET_TIME_USER_DEFINE))
  	VET_ROSE_TaskGroup:SetTask(VET_ROSE_TaskGroup.Time_End, GetTime())
    return 0
  end
  VET_ROSE_TaskGroup:SetTask(VET_ROSE_TaskGroup.TeamSize, nTeamSize);
  local nTime = tonumber(GetTime())
  if nTime >= VET_ROSE_TaskGroup:GetTask(VET_ROSE_TaskGroup.Time_End) then
  	--×îºóÒ»´Î¶îÍâ½±Àø
  	if VET_ROSE_TaskGroup:GetTask(VET_ROSE_TaskGroup.Rose_Times) >= VET_MAX_TIMES then
  		gf_ModifyExp(VET_ADDIONAL_EXP);
  	end
    RemoveTrigger(GetTrigger(VET_TIME_USER_DEFINE))
    VET_ROSE_TaskGroup:SetTask(VET_ROSE_TaskGroup.Time_End, GetTime())
    return 0
  end
  local nRoseIndex = VET_ROSE_TaskGroup:GetTask(VET_ROSE_TaskGroup.Npc_Index)
  local nIndex = 1;
  if GetNpcName(nRoseIndex) == VET_TB_NPCS[2][2] then
  	nIndex = 2;
  end
  local nExpNum = VET_EXP_TABLE[nTeamSize][nIndex];
  if not nExpNum then return end
  local nNpcMapId, nNpcMapX, nNpcMapY = GetNpcWorldPos(nRoseIndex)
  local nPlayerMapId, nPlayerMapX, nPlayerMapY = GetWorldPos()
  local nDist = DistanceBetweenPoints(nNpcMapId, nNpcMapX, nNpcMapY, nPlayerMapId, nPlayerMapX, nPlayerMapY)
  if nDist >= 0 and nDist <= 18 then
		ModifyExp(nExpNum)
  	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
  end
end
function do_nothing()

end