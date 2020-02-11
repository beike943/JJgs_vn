--=============================================
--create by baiyun 2009.12.14
--describe:Ô½ÄÏ°æÎäÁÖÊ¹ÕßÈÕ³£ÈÎÎñ Í·ÎÄ¼ş
--=============================================

Include("\\script\\task\\richangrenwu\\init_task.lua");
--½ñºóÔÚÃ¿´Î»î¶¯ÀïÃæ³öÏÖ¡°Íê³ÉÈÕ³£ÈÎÎñ¸ø½±ÀøµÄ¡±ÓÉ´ËÎÄ¼şÖĞµÄGive_Daily_Personal_Task_AwardºÍGive_Daily_Team_Task_AwardÊµÏÖ
Include("\\script\\online_activites\\award.lua");
--Include ("\\script\\meridian\\meridian_award_zhenqi.lua")--½±ÀøÕæÆøµÄ½Ó¿Ú

DAILY_TASK_0912_PERSONAL_TASK_DATE = 2123; --ÈÎÎñ±äÁ¿£¬½ÓÊÜ¸öÈËÈÕ³£ÈÎÎñµÄÈÕÆÚ
DAILY_TASK_0912_TEAM_TASK_DATE = 2124; --ÈÎÎñ±äÁ¿£¬½ÓÊÜÍÅ¶ÓÈÕ³£ÈÎÎñµÄÈÕÆÚ
DAILY_TASK_0912_PERSONAL_TASK_ID = 2125;--ÈÎÎñ±äÁ¿£¬¸öÈËÈÕ³£ÈÎÎñµÄÖµ
DAILY_TASK_0912_TEAM_TASK_ID = 2126;--ÈÎÎñ±äÁ¿£¬ÍÅ¶ÓÈÕ³£ÈÎÎñµÄÖµ
DAILY_TASK_0912_PERSONAL_TASK_COUNT = 2127;--½ñÌìÒÑ¾­Íê³ÉµÄ¸öÈËÈÕ³£ÈÎÎñ´ÎÊı
DAILY_TASK_0912_TEAM_TASK_COUNT = 2128;--½ñÌìÒÑ¾­Íê³ÉµÄÍÅ¶ÓÈÕ³£ÈÎÎñ´ÎÊı

DAILY_CONST_0912_PERSONAL_TASK_MAX_COUNT = 5;--Ã¿Ìì¸öÈËÈÕ³£ÈÎÎñµÄ×î´ó´ÎÊı
DAILY_CONST_0912_TEAM_TASK_MAX_COUNT = 3;--Ã¿Ìì¸öÈËÈÕ³£ÈÎÎñµÄ×î´ó´ÎÊı

DAILY_TASK_0912_PERSONAL_LOG_TITLE = "Vo Lam Su Gia";
DAILY_TASK_0912_TEAM_LOG_TITLE = "Vo Lam Su Gia";
DAILY_TASK_0912_PERSONAL_LOG_ACTION = "Hoµn thµnh nhiÖm vô c¸ nh©n";
DAILY_TASK_0912_TEAM_LOG_ACTION = "Hoµn thµnh nhiÖm vô tæ ®éi";
DAILY_TASK_0912_NPC = "<color=green>Vâ l©m sø gi¶: <color>";


--¸öÈËÈÕ³£ÈÎÎñ½±Àø
DALIY_TASK_0912_PERSONAL_TASK_AWARD_LIST = {
        {1, 250, "§Êu hån", {2, 1, 1157, 1}, 15 * 24 * 3600},
        {1, 500, "Tiªu KiÕp t¸n", {2, 0, 141, 1}, 15 * 24 * 3600},
        {1, 90, "ThÇn N«ng §¬n", {2, 1, 343, 1}, 15 * 24 * 3600},
        {1, 115, "B¸t Nh· Chøng Th­", {2, 1, 30114, 1}, 15 * 24 * 3600},
        {1, 5, "Ngù dông b¹ch ngäc th¹ch", {2, 1, 1024, 1}, 15 * 24 * 3600},
        {4, 40, 5, 1},--5µãÉùÍû
}
DALIY_TASK_0912_PERSONAL_TASK_AWARD_EXP = 1000000;

--ÍÅ¶ÓÈÕ³£ÈÎÎñ½±Àø
DALIY_TASK_0912_TEAM_TASK_AWARD_LIST = {
        {1, 250, "§Êu hån", {2, 1, 1157, 1}, 15 * 24 * 3600},
        {1, 500, "Tiªu KiÕp t¸n", {2, 0, 141, 1}, 15 * 24 * 3600},
        {1, 90, "ThÇn N«ng §¬n", {2, 1, 343, 1}, 15 * 24 * 3600},
        {1, 115, "B¸t Nh· Chøng Th­", {2, 1, 30114, 1}, 15 * 24 * 3600},
        {1, 5, "Ngù dông b¹ch ngäc th¹ch", {2, 1, 1024, 1}, 15 * 24 * 3600},
        {4, 40, 5, 1},--5µãÉùÍû
}
DALIY_TASK_0912_TEAM_TASK_AWARD_EXP = 1000000;


function DaliyTask0912About()
    local nDate = tonumber(date("%y%m%d"));
    if GetTask(DAILY_TASK_0912_PERSONAL_TASK_DATE) < nDate then
        SetTask(DAILY_TASK_0912_PERSONAL_TASK_ID, 0);
        SetTask(DAILY_TASK_0912_PERSONAL_TASK_COUNT, 0);
    end
    if GetTask(DAILY_TASK_0912_TEAM_TASK_DATE) < nDate then
        SetTask(DAILY_TASK_0912_TEAM_TASK_ID, 0);
        SetTask(DAILY_TASK_0912_TEAM_TASK_COUNT, 0);
    end
    
    --Èç¹ûÏµÍ³´¥·¢Ã»ÓĞ´¥·¢µ½»òÕß·şÎñÆ÷å´»úµ¼ÖÂÃ»ÓĞÈÎÎñ²úÉú£¬ÔòÉèÖÃÒ»¸ö
    if GetGlbValue(DAILY_TASK_0912_PERSONAL_TASK) == 0 then
        SetGlbValue(DAILY_TASK_0912_PERSONAL_TASK, random(1, getn(DALIY_TASK_0912_PERSONAL_TASK_LIST)));
    end
    if GetGlbValue(DAILY_TASK_0912_TEAM_TASK) == 0 then
        SetGlbValue(DAILY_TASK_0912_TEAM_TASK, random(1, getn(DALIY_TASK_0912_TEAM_TASK_AWARD_LIST)));
    end

    local nPersonalTask = GetGlbValue(DAILY_TASK_0912_PERSONAL_TASK);
    local nTeamTask = GetGlbValue(DAILY_TASK_0912_TEAM_TASK);

    local tb_main_dialog = {
        "NhËn nhiÖm vô th­êng nhËt c¸ nh©n/get_daliy_personal_task",
        "NhËn nhiÖm vô th­êng nhËt tæ ®éi/get_daliy_team_task",
        "KiÓm tra t×nh h×nh nhiÖm vô th­êng nhËt/view_today_task_info",
        "Hñy nhiÖm vô th­êng nhËt c¸ nh©n/cancel_personal_task",
        "Hñy nhiÖm vô th­êng nhËt tæ ®éi/cancel_team_task",
        "Nép vµ nhËn th­ëng nhiÖm vô th­êng nhËt c¸ nh©n/finish_daliy_personal_task_dlg",
        "Nép vµ nhËn th­ëng nhiÖm vô th­êng nhËt tæ ®éi/finish_daliy_team_task_dlg",
        "KÕt thóc ®èi tho¹i/dialog_over",
    };

    Say(DAILY_TASK_0912_NPC .. format("H«m nay nhiÖm vô th­êng nhËt c¸ nh©n lµ <color=yellow>%s<color>, nhiÖm vô th­êng nhËt tæ ®éi lµ <color=yellow>%s<color>",DALIY_TASK_0912_PERSONAL_TASK_LIST[nPersonalTask][1], DALIY_TASK_0912_TEAM_TASK_LIST[nTeamTask][1]), getn(tb_main_dialog), tb_main_dialog);
end

function finish_daliy_personal_task_dlg()
	local tb_sub_dialog =
	 {
	        format("%s/%s", "NhËn phÇn th­ëng nhiÖm vô", "finish_daliy_personal_task"),
	        format("%s/#%s", format("Sö dông %d %s ®æi phÇn th­ëng",2,"Xu"), "finish_daliy_personal_task(1)"),
	        "KÕt thóc ®èi tho¹i/dialog_over",
    	};
	Say(DAILY_TASK_0912_NPC .. format("LÖnh tõ Minh Chñ, nay hoµn thµnh nhiÖm vô vâ l©m h»ng ngµy ®Òu ®­îc nhËn thªm <color=yellow>%s<color>, víi lÖnh bµi nµy cã thÓ ®Õn t×m ThÇn Binh C¸c Tr­ëng L·o (T­¬ng D­¬ng:183, 175) ®æi lÊy trang bŞ S­ M«n Hoµng Kim bé 4. <enter>NÕu nh­ sö dông <color=yellow>%s<color> ®Ó nhËn th­ëng th× sÏ nhËn ®­îc <color=yellow>%s<color> sè l­îng gÊp <color=green>%d<color> lÇn, phÇn th­ëng kinh nghiÖm t¨ng cao <color=green>%s<color>.","Vâ L©m Hoµng Kim LÖnh","Xu","Vâ L©m Hoµng Kim LÖnh",2,"30%"), getn(tb_sub_dialog), tb_sub_dialog);
end

function finish_daliy_team_task_dlg()
	local tb_sub_dialog =
	 {
	        format("%s/%s", "NhËn phÇn th­ëng nhiÖm vô", "finish_daliy_team_task"),
	        format("%s/#%s", format("Sö dông %d %s ®æi phÇn th­ëng",2,"Xu"), "finish_daliy_team_task(1)"),
	        "KÕt thóc ®èi tho¹i/dialog_over",
    	};
	Say(DAILY_TASK_0912_NPC .. format("LÖnh tõ Minh Chñ, nay hoµn thµnh nhiÖm vô vâ l©m h»ng ngµy ®Òu ®­îc nhËn thªm <color=yellow>%s<color>, víi lÖnh bµi nµy cã thÓ ®Õn t×m ThÇn Binh C¸c Tr­ëng L·o (T­¬ng D­¬ng:183, 175) ®æi lÊy trang bŞ S­ M«n Hoµng Kim bé 4. <enter>NÕu nh­ sö dông <color=yellow>%s<color> ®Ó nhËn th­ëng th× sÏ nhËn ®­îc <color=yellow>%s<color> sè l­îng gÊp <color=green>%d<color> lÇn, phÇn th­ëng kinh nghiÖm t¨ng cao <color=green>%s<color>.","Vâ L©m Hoµng Kim LÖnh","Xu","Vâ L©m Hoµng Kim LÖnh",2,"30%"), getn(tb_sub_dialog), tb_sub_dialog);
end

--Íê³É¸öÈËÈÕ³£ÈÎÎñ
function finish_daliy_personal_task(bBonus)
    local nPersonalTask = GetTask(DAILY_TASK_0912_PERSONAL_TASK_ID);
    if nPersonalTask == 0 then
        Talk(1, "", DAILY_TASK_0912_NPC.."C¸c h¹ vÉn ch­a nhËn nhiÖm vô th­êng nhËt c¸ nh©n cña h«m nay, kh«ng thÓ nhËn phÇn th­ëng nµy.");
    elseif nPersonalTask == 1 then
        Talk(1, "", DAILY_TASK_0912_NPC.."C¸c h¹ vÉn ch­a hoµn thµnh nhiÖm vô th­êng nhËt c¸ nh©n cña h«m nay, kh«ng thÓ nhËn phÇn th­ëng nµy");
    elseif nPersonalTask == 2 then
        if gf_JudgeRoomWeight(2, 100, DAILY_TASK_0912_NPC) == 0 then
            return 0;
        end
        local nExp = DALIY_TASK_0912_PERSONAL_TASK_AWARD_EXP;
        if (bBonus == 1) then
        	if (DelItem(2, 1, 30230, 2) == 1) then
        		nExp = floor(nExp * 1.3);
        	else
        		Talk(1,"",format("C¸c h¹ mang <color=yellow>%s<color> kh«ng ®ñ <color=green>%d<color>!","Xu",2));
        		return 0;
        	end
        end
        gf_EventGiveRandAward(DALIY_TASK_0912_PERSONAL_TASK_AWARD_LIST, 1000, 2, DAILY_TASK_0912_PERSONAL_LOG_TITLE, DAILY_TASK_0912_PERSONAL_LOG_ACTION);
        gf_EventGiveCustomAward(1, nExp, 1, DAILY_TASK_0912_PERSONAL_LOG_TITLE, DAILY_TASK_0912_PERSONAL_LOG_ACTION);
        SetTask(DAILY_TASK_0912_PERSONAL_TASK_ID, 0);
        Give_Daily_Personal_Task_Award(bBonus);--from "\\script\\online_activites\\award.lua"
       -- AwardZhenQi_WuLingShiZhe(1)
    end
end

--Íê³ÉÍÅ¶ÓÈÕ³£ÈÎÎñ
function finish_daliy_team_task(bBonus)
    local nTeamTask = GetTask(DAILY_TASK_0912_TEAM_TASK_ID);
    if nTeamTask == 0 then
        Talk(1, "", DAILY_TASK_0912_NPC.."C¸c h¹ vÉn ch­a nhËn nhiÖm vô th­êng nhËt tæ ®éi cña h«m nay, kh«ng thÓ nhËn phÇn th­ëng nµy.");
    elseif nTeamTask == 1 then
        Talk(1, "", DAILY_TASK_0912_NPC.."C¸c h¹ vÉn ch­a hoµn thµnh nhiÖm vô th­êng nhËt tæ ®éi cña h«m nay, kh«ng thÓ nhËn phÇn th­ëng nµy");
    elseif nTeamTask == 2 then
        if gf_JudgeRoomWeight(2, 100, DAILY_TASK_0912_NPC) == 0 then
            return 0;
        end
        local nExp = DALIY_TASK_0912_TEAM_TASK_AWARD_EXP;
        if (bBonus == 1) then
        	if (DelItem(2, 1, 30230, 2) == 1) then
        		nExp = floor(nExp * 1.3);
        	else
        		Talk(1,"",format("C¸c h¹ mang <color=yellow>%s<color> kh«ng ®ñ <color=green>%d<color>!","Xu",2));
        		return 0;
        	end
        end
        gf_EventGiveRandAward(DALIY_TASK_0912_TEAM_TASK_AWARD_LIST, 1000, 2, DAILY_TASK_0912_TEAM_LOG_TITLE, DAILY_TASK_0912_TEAM_LOG_ACTION);
        gf_EventGiveCustomAward(1, nExp, 1, DAILY_TASK_0912_TEAM_LOG_TITLE, DAILY_TASK_0912_TEAM_LOG_ACTION);
        SetTask(DAILY_TASK_0912_TEAM_TASK_ID, 0);
        Give_Daily_Team_Task_Award(bBonus);--from "\\script\\online_activites\\award.lua"
       -- AwardZhenQi_WuLingShiZhe(2)
    end
end

--ÁìÈ¡¸öÈËÈÕ³£ÈÎÎñ
function get_daliy_personal_task()
    local nPersonalCount = GetTask(DAILY_TASK_0912_PERSONAL_TASK_COUNT);
    local nPersonalTask = GetTask(DAILY_TASK_0912_PERSONAL_TASK_ID);
    local nDate = tonumber(date("%y%m%d"));

    if GetLevel() < 70 then
        Talk(1, "", DAILY_TASK_0912_NPC.."CÊp 70 trë lªn míi cã thÓ nhËn nhiÖm vô th­êng nhËt c¸ nh©n");
        return 0;
    end
    
    if GetPlayerRoute() == 0 then
         Talk(1, "", DAILY_TASK_0912_NPC.."Gia nhËp m«n ph¸i míi cã thÓ nhËn nhiÖm vô th­êng nhËt c¸ nh©n");
        return 0;
    end

    if nPersonalTask ~= 0 then
        Talk(1, "", DAILY_TASK_0912_NPC.."C¸c h¹ ®· nhËn 1 nhiÖm vô th­êng nhËt c¸ nh©n råi, tr­íc tiªn h·y hoµn thµnh vµ nép nhiÖm vô råi quay trë l¹i ®©y");
        return 0;
    end

    if nPersonalCount >= DAILY_CONST_0912_PERSONAL_TASK_MAX_COUNT then
        Talk(1, "", DAILY_TASK_0912_NPC.."H«m nay ®· nhËn sè lÇn nhiÖm vô th­êng nhËt c¸ nh©n ®¹t ®Õn giíi h¹n, ngµy mai h·y quay l¹i nhĞ.");
        return 0;
    end
    
    SetTask(DAILY_TASK_0912_PERSONAL_TASK_ID, 1);
    SetTask(DAILY_TASK_0912_PERSONAL_TASK_COUNT, nPersonalCount + 1);
    SetTask(DAILY_TASK_0912_PERSONAL_TASK_DATE, nDate);
    Talk(1, "", DAILY_TASK_0912_NPC.."H«m nay c¸c h¹ ®· nhËn nhiÖm vô th­êng nhËt c¸ nh©n, ph¶i hoµn thµnh nhiÖm vô trong ngµy míi cã thÓ nhËn th­ëng!");

    local szPersonalTask = DALIY_TASK_0912_PERSONAL_TASK_LIST[GetGlbValue(DAILY_TASK_0912_PERSONAL_TASK)][1];
    TaskTip(szPersonalTask);
end
--ÁìÈ¡ÍÅ¶ÓÈÕ³£ÈÎÎñ
function get_daliy_team_task()
    local nTeamSize = GetTeamSize();
    if nTeamSize == 0 or nTeamSize == 1 then
        if check_can_get_team_task() == 1 then
            get_daliy_personal_task_perman();  
        end
    else
        --¼ì²éÊÇ²»ÊÇ¶Ó³¤
        if GetName() ~= GetCaptainName() then
            Talk(1, "", DAILY_TASK_0912_NPC.."Lóc nhËn nhiÖm vô tæ ®éi, chØ cã ®éi tr­ëng míi cã thÓ nhËn.");
            return 0;
        end

        --¼ì²éÊÇ·ñËùÓĞÈË¶¼¿ÉÒÔ½Ó
        local nRetCode = 1;
        local nOldIndex = PlayerIndex;
        for i = 1, nTeamSize do
            PlayerIndex = GetTeamMember(i);
            if check_can_get_team_task() == 0 then
                nRetCode = 0;
            end
        end
        PlayerIndex = nOldIndex;

        if nRetCode == 0 then
            Talk(1, "", DAILY_TASK_0912_NPC.."Trong tæ ®éi cã ng­êi kh«ng ®ñ ®iÒu kiÖn, nhËn nhiÖm vô thÊt b¹i.");
        else
            local nOldIndex = PlayerIndex;
            for i = 1, nTeamSize do
                PlayerIndex = GetTeamMember(i);
                get_daliy_personal_task_perman();
            end
            PlayerIndex = nOldIndex;
            Talk(1, "", DAILY_TASK_0912_NPC.."Tæ ®éi ®· nhËn nhiÖm vô th­êng nhËt tæ ®éi cña h«m nay, ph¶i hoµn thµnh nhiÖm vô trong ngµy míi cã thÓ nhËn th­ëng!");
        end
    end
end
--¼ì²éÊÇ·ñÓĞ×Ê¸ñÁìÈ¡ÍÅ¶ÓÈÕ³£ÈÎÎñ
function check_can_get_team_task()
    local nDate = tonumber(date("%y%m%d"));
    if GetTask(DAILY_TASK_0912_PERSONAL_TASK_DATE) < nDate then
        SetTask(DAILY_TASK_0912_PERSONAL_TASK_ID, 0);
        SetTask(DAILY_TASK_0912_PERSONAL_TASK_COUNT, 0);
    end
    if GetTask(DAILY_TASK_0912_TEAM_TASK_DATE) < nDate then
        SetTask(DAILY_TASK_0912_TEAM_TASK_ID, 0);
        SetTask(DAILY_TASK_0912_TEAM_TASK_COUNT, 0);
    end

    local nTeamCount = GetTask(DAILY_TASK_0912_TEAM_TASK_COUNT);
    local nTeamTask = GetTask(DAILY_TASK_0912_TEAM_TASK_ID);

    if GetLevel() < 70 then
        Talk(1, "", DAILY_TASK_0912_NPC.."Ng­êi ch¬i ph¶i cÊp 70 trë lªn míi cã thÓ nhËn nhiÖm vô th­êng nhËt tæ ®éi.");
        return 0;
    end
    
    if GetPlayerRoute() == 0 then
         Talk(1, "", DAILY_TASK_0912_NPC.."Gia nhËp m«n ph¸i míi cã thÓ nhËn nhiÖm vô th­êng nhËt tæ ®éi");
        return 0;
    end

    if nTeamTask ~= 0 then
        Talk(1, "", DAILY_TASK_0912_NPC.."C¸c h¹ ®· nhËn 1 nhiÖm vô th­êng nhËt tæ ®éi, tr­íc tiªn h·y hoµn thµnh vµ nép nhiÖm vô råi míi ®­îc nhËn tiÕp.");
        return 0;
    end

    if nTeamCount >= DAILY_CONST_0912_TEAM_TASK_MAX_COUNT then
        Talk(1, "", DAILY_TASK_0912_NPC.."H«m nay c¸c h¹ ®· nhËn nhiÖm vô th­êng nhËt tæ ®éi ®¹t ®Õn møc cao nhÊt, ngay mai quay l¹i nhĞ");
        return 0;
    end

    return 1;
end
--Ã¿¸öÈË½ÓÍÅ¶ÓÈÕ³£ÈÎÎñ
function get_daliy_personal_task_perman()
    local nDate = tonumber(date("%y%m%d"));
    local nTeamCount = GetTask(DAILY_TASK_0912_TEAM_TASK_COUNT);
    SetTask(DAILY_TASK_0912_TEAM_TASK_ID, 1);
    SetTask(DAILY_TASK_0912_TEAM_TASK_COUNT, nTeamCount + 1);
    SetTask(DAILY_TASK_0912_TEAM_TASK_DATE, nDate);
    Talk(1, "", DAILY_TASK_0912_NPC.."C¸c h¹ ®· nhËn nhiÖm vô th­êng nhËt tæ ®éi! Trong ngµy ph¶i hoµn thµnh xong míi cã thÓ nhËn th­ëng!");

    local szTeamTask = DALIY_TASK_0912_TEAM_TASK_LIST[GetGlbValue(DAILY_TASK_0912_TEAM_TASK)][1];
    TaskTip(szTeamTask);
end

--²é¿´±¾ÈÕµÄÈÎÎñÍê³ÉÇé¿ö
function view_today_task_info()
    local nPersonalCount = GetTask(DAILY_TASK_0912_PERSONAL_TASK_COUNT);
    local nTeamCount = GetTask(DAILY_TASK_0912_TEAM_TASK_COUNT);
    local nTaskPersonalStep = GetTask(DAILY_TASK_0912_PERSONAL_TASK_ID);
    local nTaskTeamStep = GetTask(DAILY_TASK_0912_TEAM_TASK_ID);

    local szPersonalState = "";
    local szTeamState = "";

    if nTaskPersonalStep == 0 then
        szPersonalState = "VÉn ch­a nhËn nhiÖm vô  th­êng nhËt c¸ nh©n";
    elseif nTaskPersonalStep == 1 then
        szPersonalState = "§· nhËn nhiÖm vô th­êng nhËt c¸ nh©n vµ vÉn ch­a hoµn thµnh";
    elseif nTaskPersonalStep == 2 then
        szPersonalState = "§· nhËn nhiÖm vô th­êng nhËt cá nhân, vÉn ch­a nép nhiÖm vô vµ nhËn phÇn th­ëng";
    end

    if nTaskTeamStep == 0 then
        szTeamState = "VÉn ch­a nhËn nhiÖm vô th­êng nhËt tæ ®éi";
    elseif nTaskTeamStep == 1 then
        szTeamState = "§· nhËn nhiÖm vô th­êng nhËt tæ ®éi vµ vÉn ch­a hoµn thµnh";
    elseif nTaskTeamStep == 2 then
        szTeamState = "§· nhËn nhiÖm vô th­êng nhËt tæ ®éi, vÉn ch­a nép nhiÖm vô vµ nhËn phÇn th­ëng";
    end

    Say(DAILY_TASK_0912_NPC..format("H«m nay ®¹i hiÖp ®· nhËn <color=red>%d<color> lÇn nhiÖm vô th­êng nhËt c¸ nh©n <color=red>%d<color> lÇn nhiÖm vô th­êng nhËt tæ ®éi<enter>HiÖn t¹i, <color=yellow> nhiÖm vô th­êng nhËt c¸ nh©n <color> ®· nhËn: <color=red>%s<color><enter>HiÖn t¹i,  <color=yellow> nhiÖm vô th­êng nhËt tæ ®éi <color> ®· nhËn: <color=red>%s<color><enter>", nPersonalCount, nTeamCount, szPersonalState, szTeamState), 0);
end

--È¡Ïû¸öÈËÈÕ³£
function cancel_personal_task()
    local nPersonalTask = GetTask(DAILY_TASK_0912_PERSONAL_TASK_ID);
    if nPersonalTask == 0 then
        Say(DAILY_TASK_0912_NPC.."C¸c h¹ vÉn ch­a nhËn nhiÖm vô th­êng nhËt c¸ nh©n, v× vËy kh«ng thÓ hñy bá ®­îc.", 0);
    else
        Say(DAILY_TASK_0912_NPC.."X¸c nhËn muèn bá nhiÖm vô th­êng nhËt c¸ nh©n?", 2, "§ång ı/confirm_cancel_persional_task", "trë l¹i/DaliyTask0912About");
    end
end
function confirm_cancel_persional_task()
    SetTask(DAILY_TASK_0912_PERSONAL_TASK_ID, 0);
    Talk(1, "", DAILY_TASK_0912_NPC.."§· hñy bá thµnh c«ng nhiÖm vô th­êng nhËt c¸ nh©n cña h«m nay");
end

--È¡ÏûÍÅ¶ÓÈÕ³£
function cancel_team_task()
    local nTeamTask = GetTask(DAILY_TASK_0912_TEAM_TASK_ID);
    if nTeamTask == 0 then
        Say(DAILY_TASK_0912_NPC.."C¸c h¹ vÉn ch­a nhËn nhiÖm vô th­êng nhËt tæ ®éi, v× vËy kh«ng thÓ hñy bá ®­îc.", 0);
    else
        Say(DAILY_TASK_0912_NPC.."X¸c nhËn muèn bá nhiÖm vô th­êng nhËt tæ ®éi!", 2, "§ång ı/confirm_cancel_team_task", "trë l¹i/DaliyTask0912About");
    end
end
function confirm_cancel_team_task()
    SetTask(DAILY_TASK_0912_TEAM_TASK_ID, 0);
    Talk(1, "", DAILY_TASK_0912_NPC.."§· hñy bá thµnh c«ng nhiÖm vô th­êng nhËt tæ ®éi cña h«m nay");
end

--Íê³É¸öÈËÈÕ³£ÈÎÎñ
function is_he_finish_the_personal_task(szMonsterName)
	if random(1, 1000) > 17 then
	    return 0;
	end
	    
	local nPersonalTask = GetGlbValue(DAILY_TASK_0912_PERSONAL_TASK);
	if nPersonalTask == 0 then
	    return 0;
	end
	
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(DAILY_TASK_0912_PERSONAL_TASK_DATE) < nDate then
	    SetTask(DAILY_TASK_0912_PERSONAL_TASK_ID, 0);
	    SetTask(DAILY_TASK_0912_PERSONAL_TASK_COUNT, 0);
	end
	
	local nMatch = 0;
	local tbMonsterList = DALIY_TASK_0912_PERSONAL_TASK_LIST[nPersonalTask][3]
	for i = 1, getn(tbMonsterList) do
		if tbMonsterList[i] == szMonsterName then
		    nMatch = 1;
		    break;
		end
	end
	
	local nTeamSize = GetTeamSize();
	if nTeamSize == 0 or nTeamSize == 1 then	
	  	if GetTask(DAILY_TASK_0912_PERSONAL_TASK_ID) == 1 then
	      	if nMatch == 1 then
	          		SetTask(DAILY_TASK_0912_PERSONAL_TASK_ID, 2);
	          		TaskTip("§¹i hiÖp ®· hoµn thµnh nhiÖm vô th­êng nhËt c¸ nh©n cña h«m nay!");
	      	end
	  	end
	else
	    local nOldIndex = PlayerIndex;
	    for i = 1, nTeamSize do
			PlayerIndex = GetTeamMember(i);	
			if GetTask(DAILY_TASK_0912_PERSONAL_TASK_DATE) < nDate then
			    		SetTask(DAILY_TASK_0912_PERSONAL_TASK_ID, 0);
			    		SetTask(DAILY_TASK_0912_PERSONAL_TASK_COUNT, 0);
			end			
			if GetTask(DAILY_TASK_0912_PERSONAL_TASK_ID) == 1 then
				if nMatch == 1 then
			        	SetTask(DAILY_TASK_0912_PERSONAL_TASK_ID, 2);
			        	TaskTip("§¹i hiÖp ®· hoµn thµnh nhiÖm vô th­êng nhËt c¸ nh©n cña h«m nay!");
			  	end
			end
		end         
	     PlayerIndex = nOldIndex;
	end
end

--Íê³ÉÍÅ¶ÓÈÕ³£ÈÎÎñ
function is_he_finish_the_team_task(szItemName)
    --if random(1, 1000) > 17 then
    --    return 0;
    --end

    local nTeamTask = GetGlbValue(DAILY_TASK_0912_TEAM_TASK);
    if nTeamTask == 0 then
        return 0;
    end

    local nDate = tonumber(date("%y%m%d"));
    if GetTask(DAILY_TASK_0912_TEAM_TASK_DATE) < nDate then
        SetTask(DAILY_TASK_0912_TEAM_TASK_ID, 0);
        SetTask(DAILY_TASK_0912_TEAM_TASK_COUNT, 0);
    end

    if DALIY_TASK_0912_TEAM_TASK_LIST[nTeamTask][3] ~= szItemName then
        return 0;
    end

    local nTeamSize = GetTeamSize();
    if nTeamSize == 0 or nTeamSize == 1 then
        if GetTask(DAILY_TASK_0912_TEAM_TASK_ID) == 1 then
            SetTask(DAILY_TASK_0912_TEAM_TASK_ID, 2);
            TaskTip("§¹i hiÖp ®· hoµn thµnh nhiÖm vô th­êng nhËt tæ ®éi cña h«m nay!");
        end
    else
        local nOldIndex = PlayerIndex;
        for i = 1, nTeamSize do
            PlayerIndex = GetTeamMember(i);
            if GetTask(DAILY_TASK_0912_TEAM_TASK_DATE) < nDate then
                SetTask(DAILY_TASK_0912_TEAM_TASK_ID, 0);
                SetTask(DAILY_TASK_0912_TEAM_TASK_COUNT, 0);
            end
            if GetTask(DAILY_TASK_0912_TEAM_TASK_ID) == 1 then
                SetTask(DAILY_TASK_0912_TEAM_TASK_ID, 2);
                TaskTip("§¹i hiÖp ®· hoµn thµnh nhiÖm vô th­êng nhËt tæ ®éi cña h«m nay!");
            end
        end
        PlayerIndex = nOldIndex;
    end
    
end

function dialog_over()
end
