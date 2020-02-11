--ÇÉ¿ËÁ¦Ê¹ÓÃ½Å±¾
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\misc\\taskmanager.lua")

VET_201112_USED_MAX = 10 --Ê¹ÓÃ´ÎÊý10´Î
VET_201112_EXP = 680000 --Ã¿15Ãë»ñµÃµÄ¾­Ñé
VET_201112_EXP_ALL = 272000000

VET_201112_CHOCOLATE_TASK = TaskManager:Create(8,1);
VET_201112_CHOCOLATE_TASK.Num = 1;
VET_201112_CHOCOLATE_TASK.IsUsed = 2;
VET_201112_CHOCOLATE_TASK.TriggerTime = 3;
VET_201112_CHOCOLATE_TASK.DaySeq = 4;
VET_201112_CHOCOLATE_TASK.TotalIndex = 5;
VET_201112_CHOCOLATE_TASK.TotalMaxExp = 6;

VET_201112_AWARD_TABLE = {
   	{3, 200, 14020000, 1},
	{1, 1420, "Thiªn Th¹ch Tinh Th¹ch", {2, 1, 1009, 1}, 0},
   	{1, 1420, "NhÉn kim c­¬ng", {0, 102, 104, 1, 1}, 0},
   	{1, 1420, "NhÉn kim c­¬ng", {0, 102, 105, 1, 1}, 0},
   	{1, 2100, "Nh©n S©m V¹n N¨m", {2, 1, 30071, 2}, 0},
   	{31, 3440,"give_201112_award()",""},
}

function give_201112_award()
	ModifyReputation(14, 1);
	SetTask(336, GetTask(336) + 14);
	Msg2Player("C¸c h¹ nhËn ®­îc 14 ®iÓm S­ M«n vµ 14 ®iÓm Danh Väng.");
end

function OnUse(ItemIndex)
	--ÊÇ·ñÔÚ»î¶¯ÆÚ¼ä
	if gf_CheckEventDateEx(53) == 0 then
		Talk(1,"","VËt phÈm ®· qu¸ h¹n sö dông!");
		return 0;
	end
	--ÊÇ·ñÊÇ¶Ó³¤
  if GetCaptainName() ~= GetName() then
    Talk(1, "", "ChØ cã ®éi tr­ëng cã quyÒn kÝch ho¹t sö dông.");
    return 0;
  end
  --¶ÓÄÚÈËÊý
  local nTeamSize = GetTeamSize();
	if nTeamSize ~= 2 then
  	Talk(1, "","CÇn tæ ®éi 2 ng­êi ®Ó kÝch ho¹t sö dông Socola.");
  	return 0;
  end	
  --ÅÐ¶ÏÊÇ·ñÒÑ¼¤»îÁËÒ»¸öÇÉ¿ËÁ¦
	if VET_201112_CHOCOLATE_TASK:GetTask(VET_201112_CHOCOLATE_TASK.IsUsed) == 1 then
		Talk(1,"","Mçi lÇn chØ ®­îc kÝch ho¹t 1 Socola");
		return 0;
	end
	--Íæ¼Ò79¼¶ÒÔÉÏ¡¢ÒÑ¼ÓÈëÁ÷ÅÉÑ§»á1Ì×55¼¶¼¼ÄÜ²Å¿ÉÒÔ²Î¼Ó»î¶¯
	local nOldPlayer,i;
	nOldPlayer = PlayerIndex;
  for i = 1,nTeamSize do
		PlayerIndex = GetTeamMember(i);
		local nLevel = GetLevel()
		if nLevel < 79 or gf_Check55HaveSkill() == 0 or GetPlayerFaction() == 0 then
			Talk(1,"","Nh©n vËt cÊp 79 trë lªn, ®· gia nhËp m«n ph¸i vµ häc ®­îc 1 kü n¨ng cÊp 55 míi cã thÓ tham gia")
			local sName = GetName();
			PlayerIndex = nOldPlayer;
			Talk(1,"",format("%s ch­a tháa ®iÒu kiÖn yªu cÇu, nh©n vËt cÊp 79 trë lªn, ®· gia nhËp m«n ph¸i vµ häc ®­îc 1 kü n¨ng cÊp 55 míi cã thÓ tham gia",sName));
			return 0;
		end
	end
	PlayerIndex = nOldPlayer;
	--ÊÇ·ñÔÚÖ÷³Ç
	nOldPlayer = PlayerIndex;
  for i = 1,nTeamSize do
		PlayerIndex = GetTeamMember(i);
		if Is_In_City_Map() == 0 then
			Talk(1,"","ChØ cã thÓ sö dông Socola t¹i 7 thµnh thÞ lín.");
			local sName = GetName();
			PlayerIndex = nOldPlayer;
			Talk(1,"",format("%s ch­a tháa ®iÒu kiÖn yªu cÇu, chØ cã thÓ sö dông Socola t¹i 7 thµnh thÞ lín.",sName));
			return 0;
		end
  end
  PlayerIndex = nOldPlayer;
  --ÅÐ¶ÏÊÇ·ñÊÇÒ»ÄÐÒ»Å®Äã¶®µÃµÄ
  local nSex1,nSex2;
  nOldPlayer = PlayerIndex;
  PlayerIndex = GetTeamMember(1);
  nSex1 = GetSex();
  PlayerIndex = GetTeamMember(2);
  nSex2 = GetSex();
  PlayerIndex = nOldPlayer;
  if nSex1 == nSex2 then
  	Talk(1,"","CÇn tæ ®éi 1 nam 1 n÷ ®Ó sö dông Socola t×nh nh©n.")
  	return 0;
  end
  --¸ôÌìÇå³ýÊ¹ÓÃ´ÎÊý
  nOldPlayer = PlayerIndex;
  for i = 1,nTeamSize do
  	PlayerIndex = GetTeamMember(i);
		if VET_201112_CHOCOLATE_TASK:GetTask(VET_201112_CHOCOLATE_TASK.DaySeq) ~= zgc_pub_day_turn() then
			VET_201112_CHOCOLATE_TASK:SetTask(VET_201112_CHOCOLATE_TASK.DaySeq,zgc_pub_day_turn());
			VET_201112_CHOCOLATE_TASK:SetTask(VET_201112_CHOCOLATE_TASK.Num,0);
		end
	end
	PlayerIndex = nOldPlayer;
  --ÅÐ¶ÏÊÇ·ñ¶¼ÓÐÇÉ¿ËÁ¦
  nOldPlayer = PlayerIndex;
  for i = 1,nTeamSize do
  	PlayerIndex = GetTeamMember(i);
  	if GetItemCount(2,1,30356) < 1 then
  		local sName = GetName();
  		PlayerIndex = nOldPlayer;
  		Talk(1,"",format("Thµnh viªn trong ®éi <color=green>%s<color> kh«ng mang theo Socola, kh«ng thÓ kÝch ho¹t.",sName));
  		return 0;
  	end
  end
  PlayerIndex = nOldPlayer;
  
    --max ®iÓm exp toµn ch­¬ng tr×nh
  nOldPlayer = PlayerIndex;
  for i = 1,nTeamSize do
  	PlayerIndex = GetTeamMember(i);
  	if VET_201112_CHOCOLATE_TASK:GetTask(VET_201112_CHOCOLATE_TASK.TotalMaxExp) * VET_201112_EXP * 4 >= VET_201112_EXP_ALL then
  		local sName = GetName();
  		PlayerIndex = nOldPlayer;
  		Talk(1,"",format("Thµnh viªn trong ®éi <color=green>%s<color> ®· ®¹t giíi h¹n ®iÓm kinh nghiÖm trong toµn ch­¬ng tr×nh nªn kh«ng thÓ kÝch ho¹t Socola.",sName));
  		return 0;
  	end
  end
  PlayerIndex = nOldPlayer;
  
  --ÊÇ·ñµ½ÁËÊ¹ÓÃÉÏÏÞ10´Î
  nOldPlayer = PlayerIndex;
  for i = 1,nTeamSize do
  	PlayerIndex = GetTeamMember(i);
  	if VET_201112_CHOCOLATE_TASK:GetTask(VET_201112_CHOCOLATE_TASK.Num) >= VET_201112_USED_MAX then
  		local sName = GetName();
  		PlayerIndex = nOldPlayer;
  		Talk(1,"",format("Thµnh viªn trong ®éi <color=green>%s<color> ®· ®¹t giíi h¹n sè lÇn sö dông Socola, kh«ng thÓ kÝch ho¹t.",sName));
  		return 0;
  	end
  end
  PlayerIndex = nOldPlayer;
  --ÅÐ¶Ï¶ÓÓÑÊÇ·ñÔÚÉí±ß18³ß
  nOldPlayer = PlayerIndex;
  PlayerIndex = GetTeamMember(1);
	local nMapId1,nX1,nY1 = GetWorldPos();
	PlayerIndex = GetTeamMember(2);
	local nMapId2,nX2,nY2 = GetWorldPos();
	local nDis = DistanceBetweenPoints(nMapId1,nX1,nY1,nMapId2,nX2,nY2)
  if  nDis < 0 or nDis > 18 then
  	local sName = GetName();
   	PlayerIndex = nOldPlayer
		Talk(1, "",format("Thµnh viªn trong ®éi <color=green>%s<color> ngoµi ph¹m vi 18 th­íc, kÝch ho¹t thÊt b¹i.",sName))
		return 0;
  end
  PlayerIndex = nOldPlayer
  --±³°ü¿Õ¼ä²»×ã£¬±¯¾çÁË
  nOldPlayer = PlayerIndex;
  for i = 1,nTeamSize do
  	PlayerIndex = GetTeamMember(i);
		if gf_Judge_Room_Weight(1,1," ") ~= 1 then
			Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
			local sName = GetName();
   		PlayerIndex = nOldPlayer
			Talk(1, "",format("Thµnh viªn trong ®éi <color=green>%s<color> kh«ng gian hµnh trang kh«ng ®ñ « chøa, kÝch ho¹t thÊt b¹i.",sName));
      return 0
		end
  end
  PlayerIndex = nOldPlayer;
  --É¾³ýÃ¿¸öÈËÉíÉÏµÄÇÉ¿ËÁ¦
  nOldPlayer = PlayerIndex;
  for i = 1,nTeamSize do
  	PlayerIndex = GetTeamMember(i);
  	if DelItem(2,1,30356,1) == 0 then
  		local sName = GetName();
  		PlayerIndex = nOldPlayer;
  		Talk(1,"",format("Thµnh viªn trong ®éi <color=green>%s<color> sö dông Socola cã hiÖn t­îng bÊt th­êng, kÝch ho¹t thÊt b¹i.",sName));
  		return 0;
  	end
  end
  PlayerIndex = nOldPlayer;
  --ÀÛ¼Ó±ê¼Ç
  for i = 1,nTeamSize do
  	VET_201112_CHOCOLATE_TASK:SetTask(VET_201112_CHOCOLATE_TASK.TotalIndex,VET_201112_CHOCOLATE_TASK:GetTask(VET_201112_CHOCOLATE_TASK.TotalIndex)+tonumber(GetTeamMember(i)));
  end
  --¶Ó³¤´´½¨´¥·¢Æ÷
  VET_201112_CHOCOLATE_TASK:SetTask(VET_201112_CHOCOLATE_TASK.IsUsed,1);
  --Ê±¼ä´¥·¢Æ÷
  CreateTrigger(1,1519,1519*2);
  ContinueTimer(GetTrigger(1519*2));
  --µÇ³ö´¥·¢Æ÷
  CreateTrigger(3,3006,3006*2);
  --ÓÑÇéÌáÊ¾
  nOldPlayer = PlayerIndex;
  for i = 1,nTeamSize do
  	PlayerIndex = GetTeamMember(i);	
  	Talk(1,"","§· kÝch ho¹t Socola, h·y ®¶m b¶o ph¹m vi hiÖu øng, kh«ng nªn rêi khái ®éi ngò (<color=red>kh«ng ®­îc mêi thªm thµnh viªn<color>)")
  end	
  PlayerIndex = nOldPlayer
  --Ê¹ÓÃ´ÎÊý¼ÓÒ»ºÍ¸ø×îÖÕ½±Àø
  nOldPlayer = PlayerIndex;
  for i = 1,nTeamSize do
  	PlayerIndex = GetTeamMember(i);	
  	VET_201112_CHOCOLATE_TASK:SetTask(VET_201112_CHOCOLATE_TASK.Num,VET_201112_CHOCOLATE_TASK:GetTask(VET_201112_CHOCOLATE_TASK.Num)+1);
  	VET_201112_CHOCOLATE_TASK:SetTask(VET_201112_CHOCOLATE_TASK.TotalMaxExp,VET_201112_CHOCOLATE_TASK:GetTask(VET_201112_CHOCOLATE_TASK.TotalMaxExp)+1);
  	if VET_201112_CHOCOLATE_TASK:GetTask(VET_201112_CHOCOLATE_TASK.Num) == VET_201112_USED_MAX then
	  	gf_EventGiveRandAward(VET_201112_AWARD_TABLE,10000,1,"LÔ valentine 2012","PhÇn th­ëng lÔ t×nh nh©n");
	  end
	end
	PlayerIndex = nOldPlayer;
end

--ÔÚ7´óÖ÷³Ç1ÊÇ0·ñ
function Is_In_City_Map()
	local tbMapId = {100,150,200,300,350,400,500,}
    local nMapId = GetWorldPos()
    local bMapIsOk = 0
    for i = 1, getn(tbMapId) do
        if nMapId == tbMapId[i] then
            bMapIsOk = 1 
            break
        end
    end
    if bMapIsOk == 0 then
        return 0 
    end
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
	local i;
	local nCount = 0;
	local nMapId1,nX1,nY1 = GetWorldPos();
	local nTeamSize = GetTeamSize();
	local nOldPlayer = PlayerIndex;
	for i = 1,nTeamSize do
	  PlayerIndex = GetTeamMember(i);
	  nCount = nCount + tonumber(PlayerIndex);
	end
	PlayerIndex = nOldPlayer;
	--É¾³ý´¥·¢Æ÷
	if nTeamSize ~= 2 or nCount ~= VET_201112_CHOCOLATE_TASK:GetTask(VET_201112_CHOCOLATE_TASK.TotalIndex) or VET_201112_CHOCOLATE_TASK:GetTask(VET_201112_CHOCOLATE_TASK.TriggerTime) >= 4 then
		RemoveTrigger(GetRunningTrigger());
		RemoveTrigger(GetTrigger(3006*2));
	  VET_201112_CHOCOLATE_TASK:SetTask(VET_201112_CHOCOLATE_TASK.TriggerTime,0);
	  VET_201112_CHOCOLATE_TASK:SetTask(VET_201112_CHOCOLATE_TASK.IsUsed,0);
	  VET_201112_CHOCOLATE_TASK:SetTask(VET_201112_CHOCOLATE_TASK.TotalIndex,0);
	  return 1;
	end
	--¸ø¾­Ñé
	nOldPlayer = PlayerIndex;
	for i = 1,nTeamSize do
	  PlayerIndex = GetTeamMember(i);
	  local nMapId2,nX2,nY2 = GetWorldPos();
	  local nDis = DistanceBetweenPoints(nMapId1,nX1,nY1,nMapId2,nX2,nY2);
		if  nDis >= 0 and nDis <= 18 then
			gf_Modify("Exp",VET_201112_EXP);
		end
	end
	PlayerIndex = nOldPlayer;
	--´¥·¢´ÎÊý¼ÓÒ»
	VET_201112_CHOCOLATE_TASK:SetTask(VET_201112_CHOCOLATE_TASK.TriggerTime,VET_201112_CHOCOLATE_TASK:GetTask(VET_201112_CHOCOLATE_TASK.TriggerTime)+1);
	return 0;
end

function Leave_Game()
	RemoveTrigger(GetRunningTrigger());
	RemoveTrigger(GetTrigger(1519*2));
	VET_201112_CHOCOLATE_TASK:SetTask(VET_201112_CHOCOLATE_TASK.TriggerTime,0);
	VET_201112_CHOCOLATE_TASK:SetTask(VET_201112_CHOCOLATE_TASK.IsUsed,0);
end