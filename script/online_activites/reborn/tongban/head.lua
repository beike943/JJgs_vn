--=============================================
--create by zhoulimei 2009-12-28
--describe:Ô½ÄÏ°æ×ªÉúÍ¬°éÏµÍ³Í·ÎÄ¼þ
--related files: 
--1¡¢strings.lua  --×Ö·û´®
--2¡¢yin.lua      --¸÷ÃÅ»áÓ¡£¨Áú×ÓÓ¡·ï×ÓÓ¡»¢×ÓÓ¡Ó¥×ÓÓ¡£©½Å±¾
--3¡¢shipindai    --Ê³Æ·´ü½Å±¾
--4¡¢\script\online_activites\task_values.lua --ÈÎÎñ±äÁ¿
--=============================================

Include("\\script\\online_activites\\reborn\\tongban\\strings.lua");--×Ö·û´®ÎÄ¼þ
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online_activites\\task_values.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua")
Include("\\script\\online_activites\\treasure_box\\head.lua")

File_name = "\\script\\online_activites\\reborn\\tongban\\head.lua"

VET_201003_TONGBAN_HEALTH_POINT_MAX = 300        --Ô½ÄÏ200912Í¬°éÏµÍ³ Í¬°é½¡¿µµãÉÏÏÞ
VET_201003_TONGBAN_UPGRADE_TO_2 = 600            --Ô½ÄÏ200912Í¬°éÏµÍ³ Ò»¼¶-¡·¶þ¼¶ ÐèÒªµÄÉý¼¶µã
VET_201003_TONGBAN_UPGRADE_TO_3 = 3600           --Ô½ÄÏ200912Í¬°éÏµÍ³ ¶þ¼¶-¡·Èý¼¶ ÐèÒªµÄÉý¼¶µã
VET_201003_TONGBAN_GET_HEALTH_POINT_FROM_SHIPINDAI = 10  --Ô½ÄÏ200912Í¬°éÏµÍ³  Ê¹ÓÃÊ³Æ·´ü»ñµÃ½¡¿µµã
VET_201003_TONGBAN_DIALY_TASK_COUNT_MAX = 4            --Ô½ÄÏ200912Í¬°éÏµÍ³  ÈÕ³£ÈÎÎñÃ¿Ìì»ñµÃ´ÎÊý
VET_201003_TONGBAN_DAILY_TASK_INTERVAL = 30       --Ô½ÄÏ200912Í¬°éÏµÍ³   ÈÕ³£ÈÎÎñÈÎÎñ¼ä¸ôÊ±¼ä£¨·ÖÖÓ£©
VET_201003_TONGBAN_TRIGGER_ID_IN_TABLE = 1502     --Ô½ÄÏ200912Í¬°éÏµÍ³   ´¥·¢Æ÷±íÄÚID
VET_201003_TONGBAN_MENHUI_TYPE_LONGZI = 1         --Ô½ÄÏ200912Í¬°éÏµÍ³   ÃÅ»áÀàÐÍ Áú×Ó
VET_201003_TONGBAN_MENHUI_TYPE_FENGZI = 4         --Ô½ÄÏ200912Í¬°éÏµÍ³   ÃÅ»áÀàÐÍ ·ï×Ó
VET_201003_TONGBAN_MENHUI_TYPE_HUZI = 2           --Ô½ÄÏ200912Í¬°éÏµÍ³   ÃÅ»áÀàÐÍ »¢×Ó
VET_201003_TONGBAN_MENHUI_TYPE_YINGZI = 3         --Ô½ÄÏ200912Í¬°éÏµÍ³   ÃÅ»áÀàÐÍ Ó¥×Ó
VET_201003_TONGBAN_JIHUO = 2575                   --Ô½ÄÏ200912Í¬°éÏµÍ³   ¼¤»îID

PET_EXP_NEED = 50000000

function pet_init()
--	if GetLevel() < 75 then
--		Talk(1, "", "§¼ng cÊp 75 trë lªn míi cã thÓ thao t¸c tÝnh n¨ng nµy!")
--		return
--	end
--	if check_skill_55() == 0 then
--		Talk(1, "", "Ph¶i häc ®Çy ®ñ kü n¨ng cÊp 55 cña m«n ph¸i míi cã thÓ thao t¸c tÝnh n¨ng nµy!")
--		return
--	end
	
	if GetTask(TASK_VNG_PET) == 0 then
		Talk(1,"","B¹n ch­a cã B¹n §ång Hµnh, h·y ®Õn gÆp <color=yellow>B¾c §Èu L·o Nh©n<color>!")
		return
	end
	
	if gf_GetTaskByte(TASK_VNG_PET_INFO,BYTE_PET_INFO_SEX) == 0 then
		gf_SetTaskByte(TASK_VNG_PET_INFO,BYTE_PET_INFO_SEX,random(1,2))
	end
	
	-- Do lµm lo¹i h×nh ®Ëp trøng sau khi ®· ra pet cÊp 1 nªn ph¶i set l¹i kiÓu h×nh vµo task
	if mod(GetTask(TASK_VNG_PET), 100) == 1 then    
		local nUpgradePoint = floor(GetTask(TASK_VNG_PET) / 100)	
		if nUpgradePoint >= 0 and nUpgradePoint <= 100 then
			gf_SetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_TYPE, 1)
    		elseif  nUpgradePoint > 100 and nUpgradePoint <= 200 then
    			gf_SetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_TYPE, 2)
    		elseif nUpgradePoint > 200 then
    			gf_SetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_TYPE, 3)
    		end    
	end
	
	local tSay = {}
	local tHeader = "§Ó kÝch ho¹t vµ n©ng cÊp B¾c §Èu Ngù Linh ThÇn ThuËt, h·y ®Õn gÆp <color=yellow>B¾c §Èu L·o Nh©n<color>. Chän tÝnh n¨ng muèn sö dông:"	
	tinsert(tSay, "Gäi B¹n §ång Hµnh/summon_pet")
	tinsert(tSay, "Thu håi B¹n §ång Hµnh/remove_pet")
	tinsert(tSay, "Trß chuyÖn víi B¹n §ång Hµnh/chat_pet")	
	tinsert(tSay, "NhiÖm vô th­êng nhËt ch¨m sãc B¹n §ång Hµnh/quest_pet")
	tinsert(tSay, "Xem th«ng sè B¹n §ång Hµnh/info_pet")	
	tinsert(tSay, "Rêi khái/dialog_over")
	
	Say(tHeader, getn(tSay), tSay)
end

function info_pet()
	if GetTask(TASK_VNG_PET) == 0 then
		Talk(1,"","B¹n ch­a cã B¹n §ång Hµnh!")
		return
	end
	local nCurPoint = floor(GetTask(TASK_VNG_PET) / 100)
	local nCurLevel = mod(GetTask(TASK_VNG_PET), 100)
	local nCurGodPoint = floor(GetTask(TASK_VNG_PET_GODPOINT)/100)	
	local strSexType = tPetInfo[nCurLevel][2][gf_GetTaskByte(TASK_VNG_PET_INFO,BYTE_PET_INFO_SEX)]
	local nMaxZone = floor(mod(GetTask(TSK_PET_TAIXU_POINT), 1000) / 10)
	local nMaxStage = mod(GetTask(TSK_PET_TAIXU_POINT), 10)
	local nPetInstancePoint = floor(GetTask(TSK_PET_TAIXU_POINT) / 1000)
	local strTalk = format("CÊp ®é: <color=yellow>%d<color>.\n§iÓm n©ng cÊp: <color=yellow>%d<color> ®iÓm.\n§iÓm linh lùc: <color=yellow>%d<color> ®iÓm.\nLo¹i h×nh: <color=yellow>%s<color>.\nKiÓu h×nh: <color=yellow>%s<color>.\nN¨ng lùc bæ sung: <color=yellow>Ch­a cã<color>.\n§iÓm v­ît ¶i: <color=yellow>%d<color>.\nKû lôc v­ît ¶i: <color=yellow>¶i %d tÇng %d<color>.",nCurLevel,nCurPoint,nCurGodPoint,tPetInfo[nCurLevel][1],strSexType,nPetInstancePoint,nMaxZone,nMaxStage)
	Talk(1,"",strTalk)
end

function pet_gp_training()
	local nPetIdx = GetFollower()
	if nPetIdx <= 0 then
		Talk(1,"","B¹n ch­a gäi B¹n §ång Hµnh!")
		return
	end
	local nDate = tonumber(date("%y%m%d"))	
	Pet_ResetTask()	
	local nQuestGPCount = mod(GetTask(TASK_VNG_PET_GODPOINT),100)
	Say("<color=green>§iÓm Linh Lùc<color> ¶nh h­ëng ®Õn tiÒm n¨ng cña B¹n §ång Hµnh. Mçi lÇn tu luyÖn <color=yellow>tiªu hao 50.000.000 ®iÓm kinh nghiÖm cña b¶n th©n<color>. H«m nay b¹n ®· hoµn thµnh tu luyÖn Linh Lùc cho B¹n §ång Hµnh <color=yellow>"..nQuestGPCount.."<color> lÇn. B¹n cã muèn tiÕp tôc tu luyÖn?",2,"§ång ý!/pet_gp_training_confirm","Ta ch­a cÇn/gf_DoNothing")
end

function pet_gp_training_confirm()
tRequireElement =
{
				[1] = {0, 7000, 1000000, 10, 0, 0,0},
				[2] = {300, 7000, 1000000, 20, 0, 200, 5},
				[3] = {600, 7000, 1000000, 30, 200, 600, 5},
				[4] = {1200, 7000, 1000000, 40, 600, 1500, 5},
}
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "ChÕt mµ ®æi ®iÓm linh løc lµm chi !!!")
		return
	end
	Pet_ResetTask()
	local nDate = tonumber(date("%y%m%d"))	
	local nTaskID = GetTask(TASK_VNG_PET_GODPOINT)
	local nCurGodPoint = floor(nTaskID/100)
	local nQuestGPCount = mod(nTaskID,100)
	local nCurLevel = mod(GetTask(TASK_VNG_PET), 100)
		
	if nCurGodPoint >= tRequireElement[nCurLevel][6] then
		Msg2Player("vao 1")
		Talk(1,"","B¹n §ång Hµnh cña b¹n ®· ®¹t ®iÓm Linh Lùc tèi ®a cña cÊp!")
		return
	end
	if nQuestGPCount >= tRequireElement[nCurLevel][7] then
		Talk(1,"","H«m nay b¹n ®· tu luyÖn nhiÒu råi! Mai h·y tiÕp tôc nhÐ!")
		return
	end
	if GetExp() < PET_EXP_NEED then
		Talk(1,"","B¹n kh«ng ®ñ 50000000 ®iÓm kinh nghiÖm ®Ó truyÒn cho B¹n §ång Hµnh!")
		return
	end
	ModifyExp(-PET_EXP_NEED)
	SetTask(TASK_VNG_PET_GODPOINT, nTaskID + 1)
	Pet_AddGP(tGP_Daily[nQuestGPCount + 1])
	Msg2Player("B¹n §ång Hµnh nhËn ®­îc "..tGP_Daily[nQuestGPCount + 1].." ®iÓm Linh Lùc.")	
	Msg2Player("B¹n bÞ trõ 50000000 ®iÓm kinh nghiÖm.")
	WriteLogEx("Ban Dong Hanh","rÌn luyÖn lÇn thø "..(nQuestGPCount + 1))
	pet_gp_training()	
end
--==============================================
--function describe:Í¬°éÏµÍ³ÈÕ³£ÈÎÎñ¸ø½±Àøº¯Êý
--===============================================

function vet_201003_tongban_judge_if_jihuo()
    local njihuo = GetTask(VET_201003_TONGBAN_JIHUO);
    if mod(njihuo,10000)/1000 < 1 then
        return 0;
    else
        return 1;
    end
end
--==============================================
--function describe:Í¬°éÏµÍ³ÈÕ³£ÈÎÎñ¸ø½±Àøº¯Êý
--===============================================
function vet_201003_tongban_daily_task_award(nMul)
    gf_EventGiveCustomAward(1, 1000000 * nMul, 1, VET_201003_TONGBAN_STR_LOGTITLE);     --¾­Ñé
    gf_EventGiveCustomAward(3, 24 * nMul, 0, VET_201003_TONGBAN_STR_LOGTITLE);          --ÉùÍû
    if GetPlayerFaction() ~= 0 then
        gf_EventGiveCustomAward(4, 24 * nMul, 1, VET_201003_TONGBAN_STR_LOGTITLE);      --Ê¦ÃÅ¹±Ï×
    end
    local nCurrank = GetTask(704);
    local nRankPoint = GetTask(701);
    if nCurrank ~= 0 then
        SetTask(701, nRankPoint + 300 * nMul);
        Msg2Player(format(VET_201003_TONGBAN_STR_SHOW_MASSAGE[22], 300 * nMul));
        --Msg2Player("Äú»ñµÃÁË" .. 300 * nMul .. "¾ü¹¦£¡");
        gf_WriteLogEx(VET_201003_TONGBAN_STR_LOGTITLE, VET_201003_TONGBAN_STR_LOG_ACTION[1] .. 300 * nMul);
    end
end

--==============================================
--function describe:Í¬°éÏµÍ³ÈÕ³£ÈÎÎñËæ»úÑ¡ÔñÈÎÎñ
--===============================================
function vet_201003_tongban_daily_task_item()
    local nRand = random(1, 100);
    local nLevel = GetTask(VET_201003_TONGBAN_TASK_TONGBAN_LEVEL);
    local nType;
    if nRand <= 30 then
        nType = 1; --°×¾ÔÍè
    elseif nRand <= 60 then
        nType = 2; --ÁùÉñÍè
    elseif nRand <= 90 then
        nType = 3; --ÈýÇåÍè
    else
        nType = 4; --¾ü¹¦ÕÂ
    end
    SetTask(VET_201003_TONGBAN_TASK_DAILY_ITEM, nType);
    Say(format(VET_201003_TONGBAN_STR_SHOW_MASSAGE[13], nLevel, VET_201003_TONGBAN_TB_PARTNER_DAILY_TASK[nType][1]), 0);
    --Say(VET_201003_TONGBAN_STR_SHOW_MASSAGE[13][1] .. nLevel .. VET_201003_TONGBAN_STR_SHOW_MASSAGE[13][2] .. VET_201003_TONGBAN_TB_PARTNER_DAILY_TASK[nType][1] .. VET_201003_TONGBAN_STR_SHOW_MASSAGE[13][3], 0);
end

--==============================================
--function describe:Í¬°éÏµÍ³ÈÕ³£ÈÎÎñ½»ÄÉÈÎÎñ
--===============================================
function vet_201003_tongban_hand_daily_task()
    if GetTask(VET_201003_TONGBAN_TASK_DAILY_ITEM) == 0 then
        Talk(1, "", VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[1]);
        return 0;
    end
    local nLevel = GetTask(VET_201003_TONGBAN_TASK_TONGBAN_LEVEL);
    local nItemType = GetTask(VET_201003_TONGBAN_TASK_DAILY_ITEM);
    if GetItemCount(VET_201003_TONGBAN_TB_PARTNER_DAILY_TASK[nItemType][3][1], VET_201003_TONGBAN_TB_PARTNER_DAILY_TASK[nItemType][3][2], VET_201003_TONGBAN_TB_PARTNER_DAILY_TASK[nItemType][3][3]) >= nLevel then
        DelItem(VET_201003_TONGBAN_TB_PARTNER_DAILY_TASK[nItemType][3][1], VET_201003_TONGBAN_TB_PARTNER_DAILY_TASK[nItemType][3][2], VET_201003_TONGBAN_TB_PARTNER_DAILY_TASK[nItemType][3][3], nLevel);
        Msg2Player(VET_201003_TONGBAN_STR_SHOW_MASSAGE[18]);
        gf_WriteLogEx(VET_201003_TONGBAN_STR_LOGTITLE, VET_201003_TONGBAN_STR_LOG_ACTION[7] .. nLevel .. VET_201003_TONGBAN_TB_PARTNER_DAILY_TASK[nItemType][1]);
        return 1;
    else
        return 0;
    end
end

--==============================================
--function describe:ÃÅ»áÓ¡Èë¿Úº¯Êý
--===============================================
function vet_201003_tongban_menghuiyin_in()
    local nLevel = GetTask(VET_201003_TONGBAN_TASK_TONGBAN_LEVEL);
    local nGradePoint = GetTask(VET_201003_TONGBAN_TASK_UPGRADE_POINT);
    local nHealthPoint = GetTask(VET_201003_TONGBAN_TASK_HEALTHY_POINT);
    if nLevel == nil or nLevel < 1 or nLevel > 3 then
        SetTask(VET_201003_TONGBAN_TASK_TONGBAN_LEVEL, 1);
    end
    if nGradePoint == nil then
        SetTask(VET_201003_TONGBAN_TASK_UPGRADE_POINT, 0);
    end
    if nHealthPoint == nil then
        SetTask(VET_201003_TONGBAN_TASK_HEALTHY_POINT, 0);
    end
    Say(format(VET_201003_TONGBAN_STR_SHOW_MASSAGE[21], nLevel, nHealthPoint, nGradePoint),
    getn(VET_201003_TONGBAN_STR_YIN_DIALOG),
    VET_201003_TONGBAN_STR_YIN_DIALOG);
end

function pet_rename()
	local nPetIdx = GetFollower()
	if nPetIdx > 0 then
		Talk(1,"","B¹n ph¶i thu håi B¹n §ång Hµnh tr­íc khi ®æi tªn!")
		return
	end
	local nPartnerLevel = mod(GetTask(TASK_VNG_PET), 100)
	local nUpgradePoint = floor(GetTask(TASK_VNG_PET) / 100)	
    if nPartnerLevel < 1 then
        Talk(1, "", "Ch­a häc B¾c §Èu Ngù Linh ThÇn ThuËt nªn kh«ng thÓ ®æi tªn B¹n §ång Hµnh!")
        return
    end    
    	local szName = CustomDataRead("pet_name") or ""
	if szName == "" then	
		Talk(1,"","B¹n ch­a cã B¹n §ång Hµnh nªn kh«ng thÓ ®æi tªn!")
		return
	end	
	if GetItemCount(2,1,504) < 1 then
		Talk(1,"","B¹n cÇn ph¶i cã 1 N÷ Oa Tinh Th¹ch ®Ó ®æi tªn B¹n §ång Hµnh!")
		return
	end
	pet_rename_input()	
end

function pet_rename_input()
	AskClientForString("pet_rename_confirm","",1,16, "NhËp tªn:")
end

function pet_rename_confirm(szName)
	if szName == "" or szName == nil  then
		Talk(1,"","B¹n ®Æt tªn sai quy ®Þnh!")
		return
	end
	if DelItem(2,1,504,1) == 1 then		
		CustomDataSave("pet_name","s",szName)		
	end
end

function summon_pet()
	local nMapID = GetWorldPos()
	if nMapID >= 700 or nMapID == 101 then
		Talk(1,"","Khu vùc nµy kh«ng thÓ gäi b¹n ®ång hµnh.")
	      return
	end
    KillFollower()
    --AskClientForString("confirm_summon_pet","",1,31, "NhËp tªn:")
    Say("B¹n muèn gäi B¹n §ång Hµnh?",3,"Ta muèn gäi!/call_pet","§æi tªn B¹n §ång Hµnh/pet_rename","§Ó ta suy nghÜ/vet_201003_tongban_end_dialog")    
end

function call_pet()
	local nMapID = GetWorldPos()
	if nMapID >= 700 or nMapID == 101 then
		Talk(1,"","Khu vùc nµy kh«ng thÓ gäi b¹n ®ång hµnh.")
	      return
	end
	local szName = CustomDataRead("pet_name") or ""
	if szName == "" then	
		Say("§©y lµ lÇn ®Çu tiªn b¹n gäi <color=yellow>B¹n §ång Hµnh<color>, h·y ®Æt tªn cho b¹n ®ång hµnh. <color=red>Chó ý: ChØ ®­îc ®Æt 1 lÇn duy nhÊt. NÕu muèn ®æi tªn B¹n §ång Hµnh ph¶i gÆp B¾c §Èu L·o Nh©n sö dông 1 N÷ Oa Tinh Th¹ch.<color>",2,"Ta ®ång ý!/assign_name","§Ó ta suy nghÜ/vet_201003_tongban_end_dialog")
		return
	end	
	confirm_summon_pet(szName)
end

function assign_name()
	AskClientForString("confirm_summon_pet","",1,16, "NhËp tªn:")
end

function confirm_summon_pet(szName)	
	local nMapID = GetWorldPos()
	if nMapID >= 700 or nMapID == 101 then
		Talk(1,"","Khu vùc nµy kh«ng thÓ gäi b¹n ®ång hµnh.")
	      return
	end
	if szName == "" or szName == nil  then
		Talk(1,"","B¹n ®Æt tªn sai quy ®Þnh!")
		return
	end
    local nPartnerLevel = mod(GetTask(TASK_VNG_PET), 100)	
    if nPartnerLevel < 1 or nPartnerLevel > 4 then
        Talk(1, "", "Ch­a häc B¾c §Èu Ngù Linh ThÇn ThuËt nªn kh«ng thÓ gäi b¹n ®ång hµnh!")
        return
    end
    
    local nPetType = gf_GetTaskByte(TASK_VNG_PET_INFO,BYTE_PET_INFO_TYPE)
    SummonNpc(VET_201003_TONGBAN_STR_MODE_NAME[nPartnerLevel][nPetType], szName)
    PetBuffBonus()
    local nPetIdx = GetFollower()
    local nRand1 = random(1, 10)
    if GetBody() ==1 or GetBody() == 2 then
    		NpcChat( nPetIdx, PET_CHANGE_MALE_DLG[nRand1])    		
    else
    		NpcChat( nPetIdx, PET_CHANGE_FEMALE_DLG[nRand1])    		
    end
    local szPetName = CustomDataRead("pet_name") or ""
    if szPetName == "" then	
      	CustomDataSave("pet_name","s",szName)
    end    
end

function remove_pet()
	PetRemoveBufff()
	KillFollower()
end

function chat_pet()
	AskClientForString("confirm_chat_pet","",1,31, "B¹n hái:")
end

function confirm_chat_pet(szContent)
	local nRand = random(1, 10)
	local nPetIdx = GetFollower()
	if nPetIdx <= 0 then
		Talk(1,"","B¹n ch­a gäi B¹n §ång Hµnh!")
		return
	end
	NpcChat(nPetIdx, PET_RANDOM_CHAT_DLG[nRand])
--	local nDate = tonumber(date("%y%m%d"))
--	local nQuestDay = floor(GetTask(TASK_VNG_PET_QUEST) / 100)
	
	--if nQuestDay ~= nDate then
		--SetTask(TASK_VNG_PET_QUEST, nDate*100)
	--end
	--nRand = (1,100)
	--if nRand <= 10 then
		--ModifyExp(500000)
		--Msg2Player("B¹n nhËn ®­îc 500000 ®iÓm kinh nghiÖm.")
	--end
end

function quest_pet()
	local nPetIdx = GetFollower()
	if nPetIdx <= 0 then
		Talk(1,"","B¹n ch­a gäi B¹n §ång Hµnh!")
		return
	end
	local tSay = {}
	local tHeader = "Mçi ngµy chØ cã thÓ lµm <color=yellow>4<color> nhiÖm vô, gi·n c¸ch gi÷a 2 lÇn thùc hiÖn nhiÖm vô lµ <color=yellow>900<color> gi©y. §Ó nhËn th­ëng cÇn ph¶i hoµn thµnh ®ñ <color=yellow>4<color> nhiÖm vô trong ngµy."
	
	tinsert(tSay, "NhËn nhiÖm vô th­êng nhËt/receive_quest_pet")
	tinsert(tSay, "Hoµn thµnh nhiÖm vô th­êng nhËt/done_quest_pet")
	tinsert(tSay,"RÌn luyÖn B¹n §ång Hµnh/pet_train")
	tinsert(tSay, "Tu luyÖn Linh Lùc/pet_gp_training")	
	tinsert(tSay, "Rêi khái/dialog_over")
	
	Say(tHeader, getn(tSay), tSay)
end

function pet_train()
	local nCurLevel = mod(GetTask(TASK_VNG_PET), 100)
	if nCurLevel < 2 then
		Talk(1,"","B¹n §ång Hµnh ®¼ng cÊp 2 trë lªn míi cã thÓ sö dông chøc n¨ng nµy!")
		return
	end
	local tSay = {
		"Ta muèn rÌn luyÖn ë sa m¹c/pet_train_confirm",
		"Ta muèn rÌn luyÖn trªn biÓn/pet_train_confirm",
		"Ta muèn rÌn luyÖn trong rõng/pet_train_confirm",
		"Ta muèn rÌn luyÖn trªn nói/pet_train_confirm",
		"Ta muèn nhËn kÕt qu¶ rÌn luyÖn/pet_train_award",
		"KÕt thóc ®èi tho¹i/gf_DoNothing",	
	}
	Say("RÌn luyÖn B¹n §ång Hµnh t¹i C« §¶o. ", getn(tSay), tSay)
end

function pet_train_confirm()
	Pet_ResetTask()
	local nTrainCount = gf_GetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_TRAIN)
	if nTrainCount >= 6 then
		Talk(1,"","H«m nay b¹n ®· rÌn luyÖn B¹n §ång Hµnh 6 lÇn! B¹n §ång Hµnh ®· mÖt råi.")		
		return	
	end	
	if GetTask(TASK_PET_TRAIN_TIME) ~= 0 then
		Talk(1,"","B¹n §ång Hµnh ®ang rÌn luyÖn råi. Xin ®õng lµm phiÒn!")		
		return	
	end
	if nTrainCount >= 1 then
		if GetItemCount(2,0,504) < 1 then
			Talk(1,"","§©y lµ lÇn rÌn luyÖn B¹n §ång Hµnh thø 2 trong ngµy. B¹n cÇn ph¶i sö dông 1 C©y B¸t Nh· nhá!")		
			return	
		end	
		DelItem(2,0,504,1)
	end
	SetTask(TASK_PET_TRAIN_TIME, GetTime())
	gf_SetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_TRAIN, nTrainCount +1)
	Talk(1,"","B¹n §ång Hµnh ®· di chuyÓn ®Õn n¬i rÌn luyÖn. X×n mêi 10 phót n÷a h·y quay l¹i!")
end

function pet_train_award()
	Pet_ResetTask()
	if GetTask(TASK_PET_TRAIN_TIME) == 0 then
		Talk(1,"","B¹n §ång Hµnh ch­a nhËn nhiÖm vô  rÌn luyÖn!")		
		return	
	end
	if GetTime() - GetTask(TASK_PET_TRAIN_TIME) < 10*60 then
		Talk(1,"","B¹n §ång Hµnh vÉn ®ang rÌn luyÖn. Xin ®õng lµm phiÒn! Cßn "..(600 - (GetTime() - GetTask(TASK_PET_TRAIN_TIME))) .." gi©y n÷a míi hoµn thµnh rÌn luyÖn.")		
		return	
	end
	SetTask(TASK_PET_TRAIN_TIME, 0)
	local nRand = random(1,1000)
	if nRand <= 490 then
		ModifyExp(200000)
		Msg2Player("B¹n nhËn ®­îc 200000 ®iÓm kinh nghiÖm.")
		WriteLogEx("Ban Dong Hanh","rÌn luyÖn nhËn th­ëng lo¹i 1")	
	elseif nRand > 490 and nRand <= 990 then
		ModifyExp(200000)
		SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (1 * 100))
		Msg2Player("B¹n nhËn ®­îc 200000 ®iÓm kinh nghiÖm.")
		Msg2Player("B¹n nhËn ®­îc 1 ®iÓm n©ng cÊp.")
		WriteLogEx("Ban Dong Hanh","rÌn luyÖn nhËn th­ëng lo¹i 2")	
	elseif nRand > 990 and nRand <= 995 then
		ModifyExp(200000)
		Pet_AddGP(1)
		Msg2Player("B¹n nhËn ®­îc 200000 ®iÓm kinh nghiÖm.")
		Msg2Player("B¹n nhËn ®­îc 1 ®iÓm linh lùc.")
		WriteLogEx("Ban Dong Hanh","rÌn luyÖn nhËn th­ëng lo¹i 3")	
	elseif nRand > 995 and nRand <= 1000 then
		ModifyExp(200000)
		Pet_AddGP(1)
		SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (1 * 100))
		Msg2Player("B¹n nhËn ®­îc 200000 ®iÓm kinh nghiÖm.")		
		Msg2Player("B¹n nhËn ®­îc 1 ®iÓm n©ng cÊp.")
		Msg2Player("B¹n nhËn ®­îc 1 ®iÓm linh lùc.")
		WriteLogEx("Ban Dong Hanh","rÌn luyÖn nhËn th­ëng lo¹i 4")	
	end
	
	local nTrainCounted = gf_GetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_TRAIN)
	if nTrainCounted == 6 then
		Pet_AddGP(1)
		Msg2Player("B¹n nhËn ®­îc 1 ®iÓm linh lùc.")
		gf_AddItemEx2({2, 1, 30114, 1}, "B¸t Nh· Chøng Th­", "Ban Dong Hanh", "nhËn th­ëng rÌn luyÖn lÇn thø 6", 24 * 3600)
	end
	pet_train()
end

function receive_quest_pet()
	local nPetIdx = GetFollower()
	if nPetIdx <= 0 then
		Talk(1,"","B¹n ch­a gäi B¹n §ång Hµnh!")
		return
	end
	local nDate = tonumber(date("%y%m%d"))
	local nQuestDay = floor(GetTask(TASK_VNG_PET_QUEST) / 100)
	
	Pet_ResetTask()
	
	local nQuestCount = mod(GetTask(TASK_VNG_PET_QUEST), 10)
	local nQuestType = floor(mod(GetTask(TASK_VNG_PET_QUEST), 100) / 10)
	
	if nQuestCount >= 4 then
		Talk(1, "", "§· thùc hiÖn 4 lÇn nhiÖm vô trong ngµy, kh«ng thÓ nhËn thªm!")
		return
	end
	if nQuestType ~= 0 then
		Talk(1, "", "§ang thùc hiÖn nhiÖm vô, kh«ng thÓ nhËn thªm!")
		return
	end
	
	local nDiff = 900 - (GetTime() - GetTask(TASK_VNG_PET_TIME))
	if nDiff > 0 then
		Talk(1,"","Cßn "..nDiff.." gi©y n÷a míi cã thÓ nhËn nhiÖm vô tiÕp theo!")
		return
	end
	
	local nRand = random(1, 4)
	if nRand == 1 then
		SetTask(TASK_VNG_PET_QUEST, (nDate * 100) + 10 + nQuestCount)
		SetTask(TASK_VNG_PET_TIME, GetTime())
		Talk(1,"quest_pet","NhiÖm vô lÇn nµy cÇn <color=yellow>8 giê ñy th¸c B¹ch C©u Hoµn<color> ®Ó thùc hiÖn nhiÖm vô!")
	elseif nRand == 2 then
		SetTask(TASK_VNG_PET_QUEST, (nDate * 100) + 20 + nQuestCount)
		SetTask(TASK_VNG_PET_TIME, GetTime())
		Talk(1,"quest_pet","NhiÖm vô lÇn nµy cÇn <color=yellow>8 giê ñy th¸c Lôc ThÇn Hoµn<color> ®Ó thùc hiÖn nhiÖm vô!")
	elseif nRand == 3 then
		SetTask(TASK_VNG_PET_QUEST, (nDate * 100) + 30 + nQuestCount)
		SetTask(TASK_VNG_PET_TIME, GetTime())
		Talk(1,"quest_pet","NhiÖm vô lÇn nµy cÇn <color=yellow>8 giê ñy th¸c Tam Thanh Hoµn<color> ®Ó thùc hiÖn nhiÖm vô!")
	elseif nRand == 4 then
		SetTask(TASK_VNG_PET_QUEST, (nDate * 100) + 40 + nQuestCount)
		SetTask(TASK_VNG_PET_TIME, GetTime())
		Talk(1,"quest_pet","NhiÖm vô lÇn nµy cÇn t×m <color=yellow>1 C©y B¸t Nh·<color> ®Ó thùc hiÖn nhiÖm vô!")
	end
end

function done_quest_pet()
	local nPetIdx = GetFollower()
	if nPetIdx <= 0 then
		Talk(1,"","B¹n ch­a gäi B¹n §ång Hµnh!")
		return
	end
	local nDate = tonumber(date("%y%m%d"))
	local nQuestDay = floor(GetTask(TASK_VNG_PET_QUEST) / 100)
	
	Pet_ResetTask()
	
	local nQuestCount = mod(GetTask(TASK_VNG_PET_QUEST), 10)
	local nQuestType = floor(mod(GetTask(TASK_VNG_PET_QUEST), 100) / 10)
	
	if nQuestType == 0 then
		Talk(1, "", "Ch­a nhËn nhiÖm vô, kh«ng thÓ hoµn thµnh!")
		return
	end
	
	local nSmallBCH = GetTask(2501)
	local nSmallLTH = EatLiushen(1,0)
	local nSmallTTH = EatSanqin(1,0)
	
	if nQuestType == 1 then
		if nSmallBCH < 480 then
			Talk(1, "", "Kh«ng ®ñ thêi gian ñy th¸c B¹ch C©u Hoµn, kh«ng thÓ hoµn thµnh nhiÖm vô!")
			return
		else
			SetTask(2501, GetTask(2501) - 480)
		end
	elseif nQuestType == 2 then
		if nSmallLTH < 480 then
			Talk(1, "", "Kh«ng ®ñ thêi gian ñy th¸c Lôc ThÇn Hoµn, kh«ng thÓ hoµn thµnh nhiÖm vô!")
			return
		else
			EatLiushen(1, -480)
		end
	elseif nQuestType == 3 then
		if nSmallTTH < 480 then
			Talk(1, "", "Kh«ng ®ñ thêi gian ñy th¸c Tam Thanh Hoµn, kh«ng thÓ hoµn thµnh nhiÖm vô!")
			return
		else
			EatSanqin(1,-480)
		end
	elseif nQuestType == 4 then
		if GetItemCount(2, 0, 398) < 1 then
			Talk(1, "", "Trong hµnh trang kh«ng cã C©y B¸t Nh·, kh«ng thÓ hoµn thµnh nhiÖm vô!")
			return
		else
			DelItem(2, 0, 398, 1)
		end
	end
	
	SetTask(TASK_VNG_PET_QUEST, (nDate * 100) + nQuestCount + 1)
	local nQuestCounted = mod(GetTask(TASK_VNG_PET_QUEST), 10)
	SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + 100)
	Msg2Player("NhËn ®­îc 1 ®iÓm n©ng cÊp.")
	WriteLogEx(VET_201003_TONGBAN_STR_LOGTITLE, "nhËn th­ëng nhiÖm vô lÇn thø "..nQuestCounted)
	if tonumber(date("%y%m%d")) >= 101029 and tonumber(date("%y%m%d")) <= 101205 then
		gf_AddItemEx2({ 2, 1, 30250, 50}, "Hoa H­íng D­¬ng", "Hoat dong thang 11 nam 2010", "Hoµn thµnh nhiÖm vô B¹n §ång Hµnh")
	end
	if tonumber(date("%y%m%d")) >= 101210 and tonumber(date("%y%m%d")) <= 110109 then
		gf_AddItemEx2({ 2, 1, 30265, 30},  "Chu«ng Gi¸ng Sinh", "Hoat dong thang 12 nam 2010", "Hoµn thµnh nhiÖm vô B¹n §ång Hµnh")
	end
	get_award_woodenbox()
	if nQuestCounted == 4 then
		ModifyExp(4000000)
		SetTask(336, GetTask(336) + 24)
		ModifyReputation(24, 0)
		if GetTask(701) >= 0 then
			SetTask(701, GetTask(701) + 300)
		else
			SetTask(701, GetTask(701) - 300)
		end
		local nUpgradePoint = 0
		local nCurPoint = floor(GetTask(TASK_VNG_PET) / 100)
		
		local nRand = random(1, 100)
		if nRand <= 80 then
			nUpgradePoint = 1
		elseif nRand <= 85 then
			nUpgradePoint = 2
		elseif nRand <= 90 then
			nUpgradePoint = 3
		elseif nRand <= 95 then
			nUpgradePoint = 4
		else
			nUpgradePoint = 5
		end
		gf_AddItemEx2({2, 1, 30114, 1}, "B¸t Nh· Chøng Th­", "Ban Dong Hanh", "nhËn th­ëng nhiÖm vô hµng ngµy", 24 * 3600)
		SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (nUpgradePoint * 100))
		
		Msg2Player("NhËn ®­îc 4000000 ®iÓm kinh nghiÖm. 24 ®iÓm S­ M«n, 24 ®iÓm Danh Väng, 300 Qu©n C«ng vµ "..nUpgradePoint.." ®iÓm n©ng cÊp.")
		WriteLogEx(VET_201003_TONGBAN_STR_LOGTITLE, "nhËn th­ëng nhiÖm vô lÇn thø 4")
		if tonumber(date("%y%m%d")) >= 100929 and tonumber(date("%y%m%d")) <= 101024 then
			gf_AddItemEx2({ 2, 1, 30233, 50}, "Bét M×", "Hoat dong thang 9 nam 2010", "Hoµn thµnh nhiÖm vô B¹n §ång Hµnh")
		end
	end
	
	Talk(1,"","B¹n ®· hoµn thµnh nhiÖm vô ch¨m sãc B¹n §ång Hµnh lÇn thø "..nQuestCounted.." trong ngµy!")
end

function Pet_AddGP(nPoint)
	if IsPlayerDeath() == 1 then
		return
	end

	local nCurGodPoint = floor(GetTask(TASK_VNG_PET_GODPOINT)/100)
	local nQuestGPCount = mod(GetTask(TASK_VNG_PET_GODPOINT),100)
	local nCurLevel = mod(GetTask(TASK_VNG_PET), 100)
	if nCurGodPoint + nPoint <= tRequireElement[nCurLevel][6] then
		nCurGodPoint = nCurGodPoint +nPoint
		SetTask(TASK_VNG_PET_GODPOINT,nCurGodPoint*100 + nQuestGPCount)
	else
		nCurGodPoint = tRequireElement[nCurLevel][6]
		SetTask(TASK_VNG_PET_GODPOINT,nCurGodPoint*100 + nQuestGPCount)
		Msg2Player("B¹n §ång Hµnh ®· ®¹t ®­îc ®iÓm Linh Lùc tèi ®a cña cÊp, kh«ng thÓ t¨ng thªm.")
	end
end

function Pet_ResetTask()
	local nDate = tonumber(date("%y%m%d"))
	local nQuestDay = floor(GetTask(TASK_VNG_PET_QUEST) / 100)	
	if nQuestDay ~= nDate then
		local nCurGodPoint = floor(GetTask(TASK_VNG_PET_GODPOINT)/100)		
		SetTask(TASK_VNG_PET_QUEST, nDate*100)
		SetTask(TASK_VNG_PET_GODPOINT,nCurGodPoint*100)
		gf_SetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_TRAIN, 0)
	end
end

function vet_201003_tongban_daily_task()
    local nPartnerLevel = GetTask(VET_201003_TONGBAN_TASK_TONGBAN_LEVEL);
    
    --µÈ¼¶ÊäÈëÓÐÎó
    if nPartnerLevel < 1 or nPartnerLevel > getn(VET_201003_TONGBAN_STR_DAILY_TASK) then
        gf_WriteLogEx(VET_201003_TONGBAN_STR_LOGTITLE, VET_201003_TONGBAN_STR_LOG_ACTION[3]);
        return 0;
    end
    
    local nCount = GetTask(VET_201003_TONGBAN_TASK_DAILY_TASK_COUNT);
    
    Say(format(VET_201003_TONGBAN_STR_SHOW_MASSAGE[23], nCount, VET_201003_TONGBAN_DIALY_TASK_COUNT_MAX-nCount),
    getn(VET_201003_TONGBAN_STR_DAILY_TASK[nPartnerLevel]),
    VET_201003_TONGBAN_STR_DAILY_TASK[nPartnerLevel]);
end


function vet_201003_tongban_get_task()
    local nDateD = tonumber(date("%Y%m%d"));
    local nDateM = tonumber(date("%y%m%d%H%M"));
    --ÐÂµÄÒ»Ìì
    if GetTask(VET_201003_TONGBAN_DATE_TONGBAN_DAILY_TASK) == nil or GetTask(VET_201003_TONGBAN_DATE_TONGBAN_DAILY_TASK) < nDateD then
        SetTask(VET_201003_TONGBAN_DATE_TONGBAN_DAILY_TASK, nDateD);
        SetTask(VET_201003_TONGBAN_TASK_DAILY_TASK_COUNT, 0);
        SetTask(VET_201003_TONGBAN_TASK_DAILY_ITEM, 0);
    end
    
    --ÊÇ·ñÒÑ½ÓÊÜÈÎÎñ
    if GetTask(VET_201003_TONGBAN_TASK_DAILY_ITEM) ~= 0 then 
        Talk(1, "", VET_201003_TONGBAN_STR_SHOW_MASSAGE[3]);
        return 0;
    end
    
    --Ò»ÌìÀÛ¼ÆÍê³É´ÎÊý
    if GetTask(VET_201003_TONGBAN_TASK_DAILY_TASK_COUNT) >= VET_201003_TONGBAN_DIALY_TASK_COUNT_MAX then
        Talk(1, "", VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[7]);
        return 0;
    end
    
    --Ê±¼ä¼ä¸ô30·ÖÖÓ
    if GetTask(VET_201003_TONGBAN_DATE_HAND_DAILY_TASK) == nil or nDateM - GetTask(VET_201003_TONGBAN_DATE_HAND_DAILY_TASK) > VET_201003_TONGBAN_DAILY_TASK_INTERVAL then
        SetTask(VET_201003_TONGBAN_TASK_DAILY_TASK_COUNT, GetTask(VET_201003_TONGBAN_TASK_DAILY_TASK_COUNT) + 1);
    else
        local nTime = VET_201003_TONGBAN_DAILY_TASK_INTERVAL - (nDateM - GetTask(VET_201003_TONGBAN_DATE_HAND_DAILY_TASK));
        Talk(1, "", format(VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[8], nTime));
        --Talk(1, "", VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[8][1] .. nTime .. VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[8][2]);
        return 0;
    end
    
    vet_201003_tongban_daily_task_item();
end

function vet_201003_tongban_hand_task()
    local nDateD = tonumber(date("%Y%m%d"));
    local nDateM = tonumber(date("%y%m%d%H%M"));
    local nLevel = GetTask(VET_201003_TONGBAN_TASK_TONGBAN_LEVEL);
    --ÐÂµÄÒ»Ìì
    if GetTask(VET_201003_TONGBAN_DATE_TONGBAN_DAILY_TASK) == nil or GetTask(VET_201003_TONGBAN_DATE_TONGBAN_DAILY_TASK) < nDateD then
        Talk(1, "", VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[1]);
        return 0;
    end
    --ÊÇ·ñÒÑ½ÓÊÜÈÎÎñ
    if GetTask(VET_201003_TONGBAN_TASK_DAILY_ITEM) == 0 then
        Talk(1, "", VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[1]);
        return 0;
    end
    
    --½»ÄÉÈÎÎñ
    local nRetCode = vet_201003_tongban_hand_daily_task();
    if nRetCode == 0 then
        Talk(1, "", VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[9]);
        return 0;
    end
    
    SetTask(VET_201003_TONGBAN_TASK_DAILY_ITEM, 0);
    SetTask(VET_201003_TONGBAN_DATE_HAND_DAILY_TASK, nDateM);
    
    --ÀÛ¼Æ4´ÎÈÕ³£ÈÎÎñ½±Àø
    if GetTask(VET_201003_TONGBAN_TASK_DAILY_TASK_COUNT) == VET_201003_TONGBAN_DIALY_TASK_COUNT_MAX then
        vet_201003_tongban_daily_task_award(nLevel);
    end
    
end

function vet_201003_tongban_show_task()
    --ÊÇ·ñÒÑ½ÓÊÜÈÎÎñ
    if GetTask(VET_201003_TONGBAN_TASK_DAILY_ITEM) == 0 then
        Talk(1, "", VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[1]);
        return 0;
    end
    local nLevel = GetTask(VET_201003_TONGBAN_TASK_TONGBAN_LEVEL);
    local nItemType = GetTask(VET_201003_TONGBAN_TASK_DAILY_ITEM);
    local nLeftTask = GetTask(VET_201003_TONGBAN_TASK_DAILY_TASK_COUNT) - 1;
    Say(format(VET_201003_TONGBAN_STR_SHOW_MASSAGE[9], nLevel, VET_201003_TONGBAN_TB_PARTNER_DAILY_TASK[nItemType][1], nLeftTask), 0);
    --Say(VET_201003_TONGBAN_STR_SHOW_MASSAGE[9][1] .. nLevel .. VET_201003_TONGBAN_STR_SHOW_MASSAGE[9][2] .. VET_201003_TONGBAN_TB_PARTNER_DAILY_TASK[nItemType][1] .. VET_201003_TONGBAN_STR_SHOW_MASSAGE[9][3] .. nLeftTask .. VET_201003_TONGBAN_STR_SHOW_MASSAGE[9][4],0);
end

function vet_201003_tongban_task_explain()
    local nCount = GetTask(VET_201003_TONGBAN_TASK_DAILY_TASK_COUNT);
    Say(format(VET_201003_TONGBAN_STR_SHOW_MASSAGE[8], VET_201003_TONGBAN_DIALY_TASK_COUNT_MAX-nCount), 0);
    --Say(VET_201003_TONGBAN_STR_SHOW_MASSAGE[8][1] .. nCount .. VET_201003_TONGBAN_STR_SHOW_MASSAGE[8][2],0);
end

function vet_201003_tongban_upgrade_partner()
    local nLevel = GetTask(VET_201003_TONGBAN_TASK_TONGBAN_LEVEL);
    --Say(VET_201003_TONGBAN_STR_SHOW_MASSAGE[4][1] .. nLevel .. VET_201003_TONGBAN_STR_SHOW_MASSAGE[4][2], 
    local tbSay = {};
    if nLevel == 1 then
        tinsert(tbSay, VET_201003_TONGBAN_STR_UPGRADE_PARTNER[1]);
    elseif nLevel == 2 then
        tinsert(tbSay, VET_201003_TONGBAN_STR_UPGRADE_PARTNER[2]);
    end
    tinsert(tbSay, VET_201003_TONGBAN_STR_UPGRADE_PARTNER[3]);
    tinsert(tbSay, VET_201003_TONGBAN_STR_UPGRADE_PARTNER[4]);
    tinsert(tbSay, VET_201003_TONGBAN_STR_UPGRADE_PARTNER[5]);
    tinsert(tbSay, VET_201003_TONGBAN_STR_UPGRADE_PARTNER[6]);
    Say(format(VET_201003_TONGBAN_STR_SHOW_MASSAGE[4], nLevel),
    getn(tbSay), 
    tbSay);
end

function vet_201003_tongban_upgrade_partner_to(nNum)
    local nLevel = GetTask(VET_201003_TONGBAN_TASK_TONGBAN_LEVEL);
    local nGradePoint = GetTask(VET_201003_TONGBAN_TASK_UPGRADE_POINT);
    if nNum == 2 then
        if nLevel ~= 1 then
            if nLevel == 2 then
                Talk(1, "", VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[4]);
            elseif nLevel == 3 then
                Talk(1, "", VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[5]);
            end
            return 0;
        end
        --ÅÐ¶ÏÉý¼¶µã
        if nGradePoint < VET_201003_TONGBAN_UPGRADE_TO_2 then
            Talk(1, "", format(VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[3], VET_201003_TONGBAN_UPGRADE_TO_2 - nGradePoint, nNum));
            --Talk(1, "", VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[3][1] .. VET_201003_TONGBAN_UPGRADE_TO_2 - nGradePoint .. VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[3][2] .. nNum .. VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[3][3]);
            return 0;
        end
        
        --ÅÐ¶ÏÓÐÁúÑªÍè
        if  vet_201003_tongban_upgrade_judge(nNum) == 0  then
            Talk(1, "", VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[16]);
            return 0;
        end
        --É¾³ýÉý¼¶ÎïÆ·
        DelItem(VET_201003_TONGBAN_TB_PARTNER_UPGRADE[1][2][1], VET_201003_TONGBAN_TB_PARTNER_UPGRADE[1][2][2], VET_201003_TONGBAN_TB_PARTNER_UPGRADE[1][2][3],VET_201003_TONGBAN_TB_PARTNER_UPGRADE[1][2][4]);
        
        SetTask(VET_201003_TONGBAN_TASK_TONGBAN_LEVEL, 2);
        SetTask(VET_201003_TONGBAN_TASK_UPGRADE_POINT, 0);
        Say(VET_201003_TONGBAN_STR_SHOW_MASSAGE[19], 0);
    elseif nNum == 3 then
        if nLevel ~= 2 then
            if nLevel == 1 then
                Talk(1, "", VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[6]);
            elseif nLevel == 3 then
                Talk(1, "", VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[5]);
            end
            return 0;
        end
        
        --3600Éý¼¶µã
        if nGradePoint < VET_201003_TONGBAN_UPGRADE_TO_3 then
            Talk(1, "", format(VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[3], VET_201003_TONGBAN_UPGRADE_TO_3 - nGradePoint, nNum));
            --Talk(1, "", VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[3][1] .. VET_201003_TONGBAN_UPGRADE_TO_3 - nGradePoint .. VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[3][2] .. nNum .. VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[3][3]);
            return 0;
        end
        --ÅÐ¶ÏÓÐÁúÑªÍè£¬·ïÑªÍè£¬ ÷è÷ëÍè£¬Õ½ÉñÍè
        if  vet_201003_tongban_upgrade_judge(nNum) == 0 then
            Talk(1, "", VET_201003_TONGBAN_STR_DAILY_TASK_ERROR[17]);
            return 0;
        end
        
        --É¾³ýÉý¼¶ÎïÆ·
        DelItem(VET_201003_TONGBAN_TB_PARTNER_UPGRADE[1][2][1], VET_201003_TONGBAN_TB_PARTNER_UPGRADE[1][2][2], VET_201003_TONGBAN_TB_PARTNER_UPGRADE[1][2][3],VET_201003_TONGBAN_TB_PARTNER_UPGRADE[1][2][4]);
        DelItem(VET_201003_TONGBAN_TB_PARTNER_UPGRADE[2][2][1], VET_201003_TONGBAN_TB_PARTNER_UPGRADE[2][2][2], VET_201003_TONGBAN_TB_PARTNER_UPGRADE[2][2][3],VET_201003_TONGBAN_TB_PARTNER_UPGRADE[2][2][4]);
        DelItem(VET_201003_TONGBAN_TB_PARTNER_UPGRADE[3][2][1], VET_201003_TONGBAN_TB_PARTNER_UPGRADE[3][2][2], VET_201003_TONGBAN_TB_PARTNER_UPGRADE[3][2][3],VET_201003_TONGBAN_TB_PARTNER_UPGRADE[3][2][4]);
        DelItem(VET_201003_TONGBAN_TB_PARTNER_UPGRADE[4][2][1], VET_201003_TONGBAN_TB_PARTNER_UPGRADE[4][2][2], VET_201003_TONGBAN_TB_PARTNER_UPGRADE[4][2][3],VET_201003_TONGBAN_TB_PARTNER_UPGRADE[4][2][4]);
        
        SetTask(VET_201003_TONGBAN_TASK_TONGBAN_LEVEL, 3);
        SetTask(VET_201003_TONGBAN_TASK_UPGRADE_POINT, 0);
        Say(VET_201003_TONGBAN_STR_SHOW_MASSAGE[20], 0);
    else
        return 0;
    end
end

function vet_201003_tongban_upgrade_judge(nType)
    if nType == 2 then
        if  GetItemCount(VET_201003_TONGBAN_TB_PARTNER_UPGRADE[1][2][1], VET_201003_TONGBAN_TB_PARTNER_UPGRADE[1][2][2], VET_201003_TONGBAN_TB_PARTNER_UPGRADE[1][2][3]) < 1 then
            return 0;
        end
    elseif nType == 3 then
        if  GetItemCount(VET_201003_TONGBAN_TB_PARTNER_UPGRADE[1][2][1], VET_201003_TONGBAN_TB_PARTNER_UPGRADE[1][2][2], VET_201003_TONGBAN_TB_PARTNER_UPGRADE[1][2][3]) < 1 then
            return 0;
        end
        if  GetItemCount(VET_201003_TONGBAN_TB_PARTNER_UPGRADE[2][2][1], VET_201003_TONGBAN_TB_PARTNER_UPGRADE[2][2][2], VET_201003_TONGBAN_TB_PARTNER_UPGRADE[2][2][3]) < 1 then
            return 0;
        end
        if  GetItemCount(VET_201003_TONGBAN_TB_PARTNER_UPGRADE[3][2][1], VET_201003_TONGBAN_TB_PARTNER_UPGRADE[3][2][2], VET_201003_TONGBAN_TB_PARTNER_UPGRADE[3][2][3]) < 1 then
            return 0;
        end
        if  GetItemCount(VET_201003_TONGBAN_TB_PARTNER_UPGRADE[4][2][1], VET_201003_TONGBAN_TB_PARTNER_UPGRADE[4][2][2], VET_201003_TONGBAN_TB_PARTNER_UPGRADE[4][2][3]) < 1 then
            return 0;
        end
    end
    return 1;
end

function vet_201003_tongban_get_assist()
    local nDate = tonumber(date("%Y%m%d"));
    if GetTask(VET_201003_TONGBAN_DATE_TASK_ADD_PROPERTY) == nil or GetTask(VET_201003_TONGBAN_DATE_TASK_ADD_PROPERTY) < nDate then
        SetTask(VET_201003_TONGBAN_DATE_TASK_ADD_PROPERTY, nDate);
    else
        Talk(1, "", VET_201003_TONGBAN_STR_SHOW_MASSAGE[10]);
        return 0;
    end
    
    local nLevel = GetTask(VET_201003_TONGBAN_TASK_TONGBAN_LEVEL);
    local nAbility;
    if nLevel == 1 then
        nAbility = 5;
    elseif nLevel == 2 then
        nAbility = 10;
    elseif nLevel == 3 then
        nAbility = 20;
    end 
    local nH = tonumber(date("%H"));
    local nM = tonumber(date("%M"));
    local nS = tonumber(date("%S"));
    
    local nLeftTime = 24*60*60 - (nH*60*60 + nM*60 + nS);
    CastState("state_add_allability", nAbility, nLeftTime);
    --Msg2Player(VET_201003_TONGBAN_STR_SHOW_MASSAGE[7][1] .. nAbility .. VET_201003_TONGBAN_STR_SHOW_MASSAGE[7][2])
    Msg2Player(format(VET_201003_TONGBAN_STR_SHOW_MASSAGE[7], nAbility));
    if nLevel == 1 then
        gf_WriteLogEx(VET_201003_TONGBAN_STR_LOGTITLE, VET_201003_TONGBAN_STR_LOG_ACTION[4]);
    elseif nLevel == 2 then
        gf_WriteLogEx(VET_201003_TONGBAN_STR_LOGTITLE, VET_201003_TONGBAN_STR_LOG_ACTION[5]);
    elseif nLevel == 3 then
        gf_WriteLogEx(VET_201003_TONGBAN_STR_LOGTITLE, VET_201003_TONGBAN_STR_LOG_ACTION[6]);
    end
end

function vet_201003_tongban_upgrade_condition()
    local tbSay = {};
    tinsert(tbSay, 1, format("%s/vet_201003_tongban_upgrade_partner", VET_201003_TONGBAN_STR_SHOW_MASSAGE[17]));
    tinsert(tbSay, 1, format("%s/vet_201003_tongban_upgrade_condition_next_page", VET_201003_TONGBAN_STR_SHOW_MASSAGE[15]));
    Say(VET_201003_TONGBAN_STR_SHOW_MASSAGE[12], getn(tbSay), tbSay);
end

function vet_201003_tongban_upgrade_condition_next_page()
    local tbSay = {};
    tinsert(tbSay, 1, format("%s/vet_201003_tongban_upgrade_partner", VET_201003_TONGBAN_STR_SHOW_MASSAGE[17]));
    tinsert(tbSay, 1, format("%s/vet_201003_tongban_upgrade_condition", VET_201003_TONGBAN_STR_SHOW_MASSAGE[16]));
    Say(VET_201003_TONGBAN_STR_SHOW_MASSAGE[14], getn(tbSay), tbSay);
end

function vet_201003_tongban_view_point()
    local nHealthPoint = GetTask(VET_201003_TONGBAN_TASK_HEALTHY_POINT);
    local nUpgradePoint = GetTask(VET_201003_TONGBAN_TASK_UPGRADE_POINT);
    Say(format(VET_201003_TONGBAN_STR_SHOW_MASSAGE[11], nHealthPoint, nUpgradePoint), 0);
    --Say(VET_201003_TONGBAN_STR_SHOW_MASSAGE[11][1] .. nHealthPoint .. VET_201003_TONGBAN_STR_SHOW_MASSAGE[11][2] .. nUpgradePoint .. VET_201003_TONGBAN_STR_SHOW_MASSAGE[11][3], 0);
end

function PetBuffBonus()
	local nPetLevel = mod(GetTask(TASK_VNG_PET), 100)
	if nPetLevel < 4 then
		return
	end
	
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
	local nSec = tonumber(date("%S"));
	local nLeftTime = ((23 - nHour) * 60 * 60 + (59 - nMin) * 60 + (60 - nSec)) * 18;
	local nAttrId = 2600027
	
	CastState(PET_BUFF_TYPE[nPetLevel][3][1], PET_BUFF_TYPE[nPetLevel][3][2], nLeftTime, 1, nAttrId, 1)
	
	local szBuffType = PET_BUFF_TYPE[nPetLevel][1]
	Msg2Player("B¹n nhËn ®­îc tr¹ng th¸i "..szBuffType.." tõ B¹n §ång Hµnh.")
end

function PetRemoveBufff()
	local nAttrId = 2600027
	RemoveState(nAttrId)
end

function vet_201003_tongban_end_dialog()
end