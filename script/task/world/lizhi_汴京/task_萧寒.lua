--¶ÔÓ¦NPCÏôº®µÄ½Å±¾

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua")

function main()
    local szTalk= {
        "Ng­¬i lµ ai? §Õn ®©y lµm g×?",
        "CÈu tÆc to gan! Ta ®Õn cøu B¸ch tiÒn bèi ®©y!",
        "Ha! Ha!Ha! VËy ta còng kh«ng kh¸ch s¸o! Cho ng­¬i nÕm mïi lîi h¹i cña Thiªn ¢m gi¸o ta!"
    };
    if GetTask(TASK_BJ_ID) == 11 then
        if GetTask(135) == GetTargetNpc() then
            Msg2Player("H¹ s¸t Tiªu Hµn");
            TaskTip("H¹ s¸t Tiªu Hµn");
            TalkEx("change", szTalk);
            return
        end;
    end;

    Talk(1,"","Ta víi ng­¬i kh«ng thï kh«ng o¸n! §õng nªn can thiÖp vµo nh÷ng chuyÖn cña Thiªn ¢m gi¸o!");
end;

function change()
    local nIndex = GetTask(135);
    ChangeNpcToFight(nIndex);
end;

function OnDeath()
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();
    
    if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó
        if GetTask(TASK_BJ_ID) == 10 then
            AddItem(2, 0, 50, 1);
            SetTask(TASK_BJ_ID, 12);
            Msg2Player("B¹n lÊy ®­îc mËt th­ cña Tiªu Hµn");
            bcw_talk();
    	elseif GetTask(TASK_BJ_ID) == 11 then
    	    local nMask = GetMapTaskTemp(202, 0);   --È¡mapµÄ0ºÅ±äÁ¿
	        nMask = SetBit(nMask, GetTask(137), 0);
            SetMapTaskTemp(202, 0, nMask);
            
	        RemoveTrigger(GetTrigger(TIME_BJ_XH));   --É¾³ý¼ÆÊ±Æ÷
	        RemoveTrigger(GetTrigger(LOG_BJ_XH));    --É¾³ýµÇÂ½´¥·¢Æ÷
	        RemoveTrigger(GetTrigger(RECT_BJ_XH));   --É¾³ýÇøÓò´¥·¢Æ÷
    	    -- Ïôº®µÄÃØÐÅ
            AddItem(2, 0, 50, 1);
            SetTask(TASK_BJ_ID, 12);
        	Msg2Player("B¹n lÊy ®­îc mËt th­ cña Tiªu Hµn");
        	
        	SetNpcLifeTime(GetTask(135), 0);
        	SetTask(135,0);
        	SetTask(137,0);
        	bcw_talk();
        end;
    else
        for i=1, nMemCount do
	        PlayerIndex = GetTeamMember(i);
            if GetTask(TASK_BJ_ID) == 10 then
                AddItem(2, 0, 50, 1);
                SetTask(TASK_BJ_ID, 12);
            	Msg2Player("B¹n lÊy ®­îc mËt th­ cña Tiªu Hµn");
            	bcw_talk();
	        elseif GetTask(TASK_BJ_ID) == 11 then
    	        nMask = SetBit(nMask, GetTask(137), 0);
                SetMapTaskTemp(202, 0, nMask);
                
    	        RemoveTrigger(GetTrigger(TIME_BJ_XH));   --É¾³ý¼ÆÊ±Æ÷;
    	        RemoveTrigger(GetTrigger(LOG_BJ_XH));   --É¾³ýµÇÂ½´¥·¢Æ÷;
    	        RemoveTrigger(GetTrigger(RECT_BJ_XH));   --É¾³ýÇøÓò´¥·¢Æ÷
        	    -- Ïôº®µÄÃØÐÅ
                AddItem(2, 0, 50, 1);
                SetTask(TASK_BJ_ID, 12);
            	Msg2Player("B¹n lÊy ®­îc mËt th­ cña Tiªu Hµn");
            	
            	SetNpcLifeTime(GetTask(135), 0);
            	SetTask(135,0);
            	SetTask(137,0);
            	bcw_talk();
            end;
        end;
    end;
end;

function bcw_talk()
    local szTalk = {
        "§a t¹ <sex>! Tªn Tiªu Hµn muèn b¾t l·o phu vÒ ch÷a bÖnh cho Gi¸o chñ cña h¾n! NÕu <sex> kh«ng ra tay, cã lÏ l·o ®· vÒ chÝn suèi!",
        "NÕu kh«ng nhê cã ph­¬ng thuèc cña con g¸i l·o th× t¹i h¹ ch¾c còng kh«ng lµm ®­îc g×!",
        "Ha! Ha! Ha! VËy lµ l·o ®· cã ng­êi nèi nghiÖp råi! Ph¶i råi <sex> cã thÓ cho l·o xem qua bøc th­ lÊy lóc n·y kh«ng?",
        "Xin tiÒn bèi xem qua!",
        "[B¸ch Th¶o ¤ng ®äc nhanh mËt th­]"
    };
    if GetTask(TASK_BJ_ID) == 12 then
        
        SetTask(TASK_BJ_ID, 13);
        -- É¾³ýÃÙ×Ù½ð¼×¹Æ
        DelItem(2,0,47,1);
        --ÕÒ¹«ËïÊéÈÎÎñ´¥·¢
        SetTask(TASK_XYTY, 1);
        TalkEx("bcw_talk_1", szTalk);
    end;
end;

function bcw_talk_1()
    local szTalk = {
        "Th× ra Tiªu Hµn lµ Kú chñ cña Thiªn ¢m gi¸o. Ta xem trong th­ cã nh¾c ®Õn C«ng T«n Th­ lµ 1 trong 4 ng­êi cña Tr­êng ca m«n. Xem ra ®ang cã chuyÖn g× mê ¸m! <sex> h·y mau ®Õn T­¬ng D­¬ng b¸o cho C«ng T«n Th­ ®Ò phßng!",
        "{Thiªn ¢m gi¸o}? {Tr­êng ca m«n}? T¹i h¹ kh«ng hiÓu g× c¶! Xin l·o bèi chØ gi¸o thªm cho!",
        "Tr­êng ca m«n lµ mét m«n ph¸i thÇn bÝ cña Trung Nguyªn, cã quan hÖ mËt thiÕt víi Hoµng téc. Cßn Thiªn ¢m gi¸o th× ta ch­a hÒ nghe nh¾c ®Õn. <sex> h·y vÒ BiÖn Kinh t×m KhÊu ChuÈn ®¹i nh©n b¸o sù viÖc, biÕt ®©u sÏ t×m ra manh mèi!",
        "VËy xin tiÒn bèi h·y tù b¶o träng! T¹i h¹ ®i ®©y!"
    };
    TalkEx("", szTalk);
end;
