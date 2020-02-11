--=============================================
--create by baiyun 2009.11.13
--describe:Ô½ÄÏ°æ12ÔÂ·İ»î¶¯±ùÀäÎ×Ê¦Ê¥µ®Ê÷½Å±¾
--============================================
Include("\\script\\online\\viet_event\\200912\\event_head.lua");
function main()
    local nNpcIndex = GetTargetNpc();
    if GetTrigger(2509) ~= 0 then
        Talk(1, "", "§¹i hiÖp lóc tr­íc ®· kİch ho¹t c©y gi¸ng sinh råi, h·y bÊm vµo hép quµ gi¸ng sinh ®Ó nhËn th­ëng.");
        return 0;
    end
    if GetLevel() < 20 or GetPlayerRoute() == 0 then
        Talk(1, "", "CÊp 20 trë lªn vµ ®· tham gia vµo m«n ph¸i míi cã thÓ kİch ho¹t ®èi tho¹i víi c©y");
        return 0;
    end
    --local nLeftTime = 30 * 60  - (GetTime() - GetUnitCurStates(nNpcIndex, 6));--NPC´æÔÚÊ£ÓàµÄÃë
    --local nLeftMinute = floor(nLeftTime / 60);--Ê£Óà¶àÉÙ·ÖÖÓ
    --SetTask(VIET_0912_TASK_ACTIVE_SHENGDANSHU_TRIGGER_EXIST_TIME, nLeftMinute);
    SetTask(VIET_0912_TASK_ACTIVE_SHENGDANSHU_TRIGGER_EXIST_TIME, GetUnitCurStates(nNpcIndex, 6) + 30 * 60);
    CreateTrigger(1, 1501, 2509);
    ContinueTimer(GetTrigger(2509));
    Talk(1, "", "§¹i hiÖp ®· kİch ho¹t c©y gi¸ng sinh råi, h·y bÊm vµo hép quµ gi¸ng sinh ®Ó nhËn th­ëng.");
end
