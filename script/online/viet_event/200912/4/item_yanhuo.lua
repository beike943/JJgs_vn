--=============================================
--create by baiyun 2009.11.18
--describe:Ô½ÄÏ°æ12ÔÂ·Ý»î¶¯ ÑÌ»ð½Å±¾ÎÄ¼þ
--=============================================
Include("\\script\\online\\viet_event\\200912\\event_head.lua");

function OnUse(nItemIdx)
	do return end
    local nDate = tonumber(date("%y%m%d"));
    local nDay = tonumber(date("%w"))
    local nLastUseDate = GetTask(VIET_0912_TASK_USE_YANHUO_DATE);

    if GetCaptainName() ~= GetName() or GetTeamSize() ~= 8 or GetLevel() < 10 or GetPlayerRoute() == 0 then
        Talk(1, "", VIET_0912_NPC_NAME_3.."Ph¶i cÊp 10 trë lªn vµ ®· gia nhËp m«n ph¸i, tæ ®éi ®ñ 8 ng­êi th× ®éi tr­ëng míi cã thÓ sö dông ph¸o hoa");
        return 0;
    end

    if nDate > 100117 then
        Talk(1, "", VIET_0912_NPC_NAME_3.."VËt phÈm nµy ®· qu¸ h¹n sö dông.");
        return 0;
    end

    if nDay == 2 or nDay == 3 or nDay == 4 then
        Talk(1, "", VIET_0912_NPC_NAME_3.."VËt phÈm nµy chØ vµo thø hai, thø s¸u, thø b¶y, chñ nhËt míi cã thÓ sö dông");
        return 0;
    end

    if nDate > nLastUseDate then
        SetTask(VIET_0912_TASK_USE_YANHUO_COUNT, 0);
    end

    --ÅÐ¶ÏÊÇ·ñ¿ÉÒÔÊ¹ÓÃÑÌ»ð
    local nOldIndex = PlayerIndex;
    local nCanUse = 1;
    for i = 1, GetTeamSize() do
        PlayerIndex = GetTeamMember(i)
        if PlayerIndex > 0 then                                                  
            if check_can_use() == 0 then
                nCanUse = 0;
            end
        end
    end
    PlayerIndex = nOldIndex;
    if nCanUse == 0 then
        Talk(1, "", VIET_0912_NPC_NAME_3.."Trong tæ ®éi cã ng­êi kh«ng ®ñ ®iÒu kiÖn ®èt ph¸o hoa, v× vËy kh«ng thÓ tiÕn hµnh ®èt ph¸o hoa ®­îc.");
        gf_Msg2Team("Trong tæ ®éi cã ng­êi kh«ng ®ñ ®iÒu kiÖn ®èt ph¸o hoa, v× vËy kh«ng thÓ tiÕn hµnh ®èt ph¸o hoa ®­îc.", 1);
        return 0;
    end
    
    --¸øÑÌ»ð½±Àø
    if DelItemByIndex(nItemIdx, 1) == 1 then
        local nOldIndex = PlayerIndex;
        for i = 1, GetTeamSize() do
            PlayerIndex = GetTeamMember(i)
            if PlayerIndex > 0 then                                                  
                use_yanhuo();
            end
        end
        PlayerIndex = nOldIndex;
        DoFireworks(801, 10);
    end
end

function check_can_use()
    local nDate = tonumber(date("%y%m%d"));
    local nTime = GetTime();
    local nLastUseDate = GetTask(VIET_0912_TASK_USE_YANHUO_DATE);
    local nLastUseTime = GetTask(VIET_0912_TASK_USE_YANHUO_TIME);
    
    if nDate > nLastUseDate then
        SetTask(VIET_0912_TASK_USE_YANHUO_COUNT, 0);
    end

    local nHasUseCount = GetTask(VIET_0912_TASK_USE_YANHUO_COUNT);

    if GetLevel() < 10 then
        Talk(1, "", VIET_0912_NPC_NAME_3.."C¸c h¹ kh«ng ®ñ cÊp 10, kh«ng ®ñ ®iÒu kiÖn nhËn phÇn th­ëng.");
        return 0;
    end

    if GetPlayerRoute() == 0 then
        Talk(1, "", VIET_0912_NPC_NAME_3.."Ch­a gia nhËp m«n ph¸i kh«ng thÓ nhËn phÇn th­ëng");
        return 0;
    end

    if nHasUseCount >= VIET_0912_YANHUO_MAX_COUNT then
        Talk(1, "",  VIET_0912_NPC_NAME_3.."Sè lÇn nhËn phÇn th­ëng cña h«m nay ®· ®Õn møc cao nhÊt, kh«ng thÓ nhËn thªm.");
        return 0;
    end

    if nTime - nLastUseTime < 300 then
        Talk(1, "",  VIET_0912_NPC_NAME_3.."Gi·n c¸ch cña hai lÇn nhËn phÇn th­ëng ch­a ®Õn 5 phót, xin h·y ®îi thªm l¸t n÷a.");
        return 0;
    end

    return 1;
    
end

function use_yanhuo()
    gf_EventGiveCustomAward(1, 100000, 1);
    SetTask(VIET_0912_TASK_USE_YANHUO_DATE, tonumber(date("%y%m%d")));
    SetTask(VIET_0912_TASK_USE_YANHUO_TIME, GetTime());
    SetTask(VIET_0912_TASK_USE_YANHUO_COUNT, GetTask(VIET_0912_TASK_USE_YANHUO_COUNT) + 1);
end
