
-- ====================== ÎÄ¼şĞÅÏ¢ ======================
-- ¶ÔÓ¦NPCÃû³Æ£ºÍõÒµÎ°
-- Edited by lizhi
-- 2005/02/22 PM 18:03
-- ======================================================

Include("\\script\\task\\world\\lizhi_ÈªÖİ\\10¼¶\\task_main.lua");

function main()
    
    local nLevel = 0;
    local nStep = 0;
    
    if GetTask(1) == 25 and GetTask(130) == 1 then
        local szMsg = {
            "TriÖu Diªn Niªn vµ D· TÈu l·o nh©n nhê t¹i h¹ mang th­ tíi cho V­¬ng huynh! Xin huynh xem qua!",
            "Qu¶ lµ b»ng h÷u tèt! Xem ra c¸c huynh vÉn cßn nhí ®Õn ta!",
            "[V­¬ng NghiÖp VÜ nhËn lÊy bøc th­]",
            "Xin ®a t¹ <sex>!",
            "Kh«ng cã chi."
        };
        SetTask(130, 2);
        if GetTask(131) == 2 and GetTask(132) == 2 then
            SetTask(1, 26); --Èç¹ûÍê³ÉĞÂÊÖÈÎÎñµÄËÍĞÅÈÎÎñ(×îºóÒ»²½)£¬Ôò¹Ø±ÕÈÎÎñÃæ°å
        end;
        TalkEx("", szMsg);
        DelItem(2,0,49,1);
        return
    end;
    
    if GetLevel() < 10 then
        can_not_accept_task();
        return
    end;

    nStep = GetTask(TASK_LEV_12_ID);
    if (nStep == 5) then
        local szTalk = {
            "PhiÒn huynh theo dâi sæ nî xem chuyÖn mua b¸n gÇn ®©y ®· b¸n cho nh÷ng ai? HiÖn ta ch¼ng râ g× hÕt! Huynh mau xem thö!",
            "GÇn ®©y, phÇn lín chuyÖn mua b¸n lµ b¸n cho ®¹i phó «ng {§¹i Chİ C­êng} ë {TuyÒn Ch©u}, v× h¾n cho lµ hµng hãa cña ta tèt nªn ta míi lÆn léi ngµn dÆm chuyÓn tõ D­¬ng Ch©u ®Õn ®©y.",
            "{§¹i Chİ C­êng} cã thÓ ®· gÆp chuyÖn! §Ó ta ®i xem thö, sau nµy nãi tiÕp nhĞ!",
        };
        SetTask(TASK_LEV_12_ID, 6);
        SetTask(TASK_LEV_14_ID, 100);   --ÈªÖİ´úÖ¾Ç¿ÈÎÎñ¿ªÆô
        TalkEx("", szTalk);
        return
    end;

    nStep = GetTask(TASK_LEV_10_ID);
    if (nStep == 0) then
        task_000_00();
        return
    elseif (nStep == 1) then
        task_001_00();
        return
    elseif (nStep == 2) then
        task_002_00();
        return
    elseif (nStep == 3) then
        task_003_00();
        return
    elseif (nStep >= 4) then
        task_004_00();
        return
    end;

    can_not_accept_task();
end;