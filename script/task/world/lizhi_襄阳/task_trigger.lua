--ÏåÑôÈÎÎñ´¥·¢Æ÷´¦Àíº¯Êı
--created by lizhi
--2005-8-19 11:35
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua")
Include("\\script\\task\\world\\g_random_head.lua");

function LaoHu_Killed()
    if g_probability(35, 100) then
        AddItem(2,0,55,1);
    end;
    
    if GetItemCount(2,0,55) >= 10 then
        SetTask(TASK_XYTY, 6);
    end;
end;

function LieHu_Killed()
    if GetTask(TASK_XYTY) == 10 or GetTask(TASK_XYTY) == 11 then
        if g_probability(10, 70) then
            if GetItemCount(2,0,56) < 1 then 
                AddItem(2,0,56,1);
                SetTask(TASK_XYTY, 11);
                Talk(1,"","Trªn ng­êi LiÖp hé Linh B¶o s¬n cã cê cña tiªu côc, cã lÏ tiªu s­ ®· bŞ giÕt ph¶i vÒ bÈm b¸o l¹i víi C«ng T«n Th­ tiÒn bèi!");
            end;
        end;
    elseif GetTask(TASK_XYTY) == 12 or GetTask(TASK_XYTY) == 13 then
        if g_probability(35, 100) then
            AddItem(2,0,57,1);
        end;
        
        if GetItemCount(2,0,57) >= 20 then
            SetTask(TASK_XYTY, 13);
        end;
    end;
end;

function Mxsz_Killed()
    if GetTask(TASK_XYTY) == 15 or GetTask(TASK_XYTY) == 16 then
        if g_probability(70, 1000) then
            RemoveTrigger(GetRunningTrigger());
            SetTask(TASK_XYTY, 16);
            local szMsg = {
                "Mau nãi! MËt khÈu vµo Mé TuyÖt s¬n trang lµ g×?",
                "…§¹i hiÖp tha m¹ng, lµ…{Mé} ai trÇm trÇm, {TuyÕt} d¹ h«n h«n, {S¬n} léc trïng trïng, {Trang} x¸ th©m th©m."
            };
            TalkEx("", szMsg);
        end;
    elseif GetTask(TASK_XYTY) == 17 or GetTask(TASK_XYTY) == 18 then
        if GetItemCount(2,0,58) < 1 then
            if g_probability(80, 1000) then
                AddItem(2,0,58,1);
                SetTask(TASK_XYTY, 18);
            end;
        end;
    end;
end;

function Db_Killed()
    RemoveTrigger(GetRunningTrigger());
    SetTask(TASK_XY_TEMP, 1);
    if GetTask(TASK_XY_TEMP1) == 1 then
        Talk(1,"","§éi qu©n tiªn phong ®· bŞ tiªu diÖt gÇn hÕt, Liªu qu©n t¹m thêi kh«ng d¸m tiÕn qu©n tiÕn ®¸nh T­¬ng D­¬ng, vÒ bÈm b¸o víi C«ng T«n Th­ tiÒn bèi tr­íc!");
        SetTask(TASK_XYTY, 28);
        SetTask(TASK_XY_TEMP, 0);
        Msg2Player("VÒ bÈm b¸o C«ng T«n Th­");
        TaskTip("VÒ bÈm b¸o C«ng T«n Th­");
    end;
end;

function Qb_Killed()
    RemoveTrigger(GetRunningTrigger());
    SetTask(TASK_XY_TEMP1, 1);
    if GetTask(TASK_XY_TEMP) == 1 then
        Talk(1,"","§éi qu©n tiªn phong ®· bŞ tiªu diÖt gÇn hÕt, Liªu qu©n t¹m thêi kh«ng d¸m tiÕn qu©n tiÕn ®¸nh T­¬ng D­¬ng, vÒ bÈm b¸o víi C«ng T«n Th­ tiÒn bèi tr­íc!");
        SetTask(TASK_XYTY, 28);
        SetTask(TASK_XY_TEMP, 0);
        Msg2Player("VÒ bÈm b¸o C«ng T«n Th­");
        TaskTip("VÒ bÈm b¸o C«ng T«n Th­");
    end;
end;

function Jmg_Killed()
    if g_probability(50, 1000) then
        AddItem(2,0,61,1);
        SetTask(TASK_XYTY, 30);
        Msg2Player("VÒ bÈm b¸o C«ng T«n Th­");
        TaskTip("VÒ bÈm b¸o C«ng T«n Th­");
    end;
end;

--function Jl_Killed()
--    AddItem(2,0,62,3);
--    RemoveTrigger(GetRunningTrigger());
--    SetTask(TASK_XYTY, 32);
--    Msg2Player("»Ø±¨¹«ËïÊé");
--end;

function Sd_Killed()
    if GetTask(TASK_XYTY) == 33 or GetTask(TASK_XYTY) == 34 then
        if g_probability(25, 100) then
            AddItem(2,0,63,1);
        end;
        if GetItemCount(2,0,63) >= 10 then
            SetTask(TASK_XYTY, 34);
            Msg2Player("VÒ bÈm b¸o C«ng T«n Th­");
            TaskTip("VÒ bÈm b¸o C«ng T«n Th­");
        end;
    elseif GetTask(TASK_XYTY) == 41 or GetTask(TASK_XYTY) == 42 then
        if g_probability(20, 100) then
            AddItem(2,0,66,1);
        end;
        if GetItemCount(2,0,66) >= 5 then
            SetTask(TASK_XYTY,42);
            Msg2Player("VÒ bÈm b¸o C«ng T«n Th­");
            TaskTip("VÒ bÈm b¸o C«ng T«n Th­");
        end;
    end;
end;

function Njx_Killed()
    if g_probability(25, 100) then
        AddItem(2,0,65,1);
    end;
    
    if GetItemCount(2,0,65) >= 10 then
        SetTask(TASK_XYTY, 40);
        Msg2Player("Thu thËp ®ñ mª hån h­¬ng");
        TaskTip("Thu thËp ®ñ mª hån h­¬ng");
    end;
end;

function Dyx_Killed()
    AddItem(2,0,67,1);
    SetTask(TASK_XYTY, 44);
    RemoveTrigger(GetRunningTrigger());
    Msg2Player("VÒ bÈm b¸o C«ng T«n Th­");
    TaskTip("VÒ bÈm b¸o C«ng T«n Th­");
end;

function Ldb_Killed()
    RemoveTrigger(GetRunningTrigger());
    
    SetTask(TASK_XY_TEMP, 1);
    if GetTask(TASK_XY_TEMP1) == 1 and GetTask(TASK_XY_TEMP2) == 1 then
        SetTask(TASK_XYTY, 49);
        SetTask(TASK_XY_TEMP, 0);
        SetTask(TASK_XY_TEMP1, 0);
        SetTask(TASK_XY_TEMP2, 0);
    end;
end;

function Lqb_Killed()
    RemoveTrigger(GetRunningTrigger());
    
    SetTask(TASK_XY_TEMP1, 1);
    if GetTask(TASK_XY_TEMP) == 1 and GetTask(TASK_XY_TEMP2) == 1 then
        SetTask(TASK_XYTY, 49);
        SetTask(TASK_XY_TEMP, 0);
        SetTask(TASK_XY_TEMP1, 0);
        SetTask(TASK_XY_TEMP2, 0);
    end;
end;

function Ljb_Killed()
    RemoveTrigger(GetRunningTrigger());
    
    SetTask(TASK_XY_TEMP2, 1);
    if GetTask(TASK_XY_TEMP1) == 1 and GetTask(TASK_XY_TEMP) == 1 then
        SetTask(TASK_XYTY, 49);
        SetTask(TASK_XY_TEMP, 0);
        SetTask(TASK_XY_TEMP1, 0);
        SetTask(TASK_XY_TEMP2, 0);
    end;
end;

function Xs_Killed()
    if g_probability(20, 100) then
        AddItem(2,0,68,1);
    end;
    
    if GetItemCount(2,0,68) >= 10 then
        SetTask(TASK_XYTY, 52);
    end;
end;

--function Zs_Killed()
--    if GetItemCount(2,0,210) >= 1 then
--        DelItem(2,0,210,1);
--        Msg2Player("¶ÔÎ÷ÏÄÖäÊ¦Ê¬ÌåÊ¹ÓÃÆÆÖäË®");
--        local nStep = GetTask(TASK_XY_TWO_ONE);
--        SetTask(TASK_XY_TWO_ONE, nStep + 1);
--    else
--        Talk(1,"","<color=green>Íæ¼Ò<color>£ºÔã¸â£¬Ã»ÓĞ<color=yellow>ÆÆÖäË®<color>ÁË£¬»¹ÊÇÏÈ³·ÍË»ØÎäµ±ÈÃ×Ïº×ÕæÈË×ö¼¸·İÔÙÀ´ÆÆÕó");
--        SetTask(TASK_XY_TWO, 4);
--    end;
--    
--    if GetTask(TASK_XY_TWO_ONE) == 3 then
--        SetTask(TASK_XY_TWO, 5);
--        RemoveTrigger(GetRunningTrigger());
--        AddItem(2,0,72,1);
--        if GetTask(TASK_XY_ONE) == 5 and GetTask(TASK_XY_TWO) == 5 then  --Èç¹ûÏåÑôÖ§ÏßÈÎÎñ¶¼Íê³ÉÁË£¬Ôò¼û¹«ËïÊé
--            SetTask(TASK_XYTY, 56);
--            Msg2Player("»Ø±¨¹«ËïÊé");
--            TaskTip("»Ø±¨¹«ËïÊé");
--        end;
--    end;
--end;

--326,1496,2945
--function Leave_Game()
--    if GetTask(TASK_XYTY) == 24 then
--        SetTask(TASK_XYTY, 23);
--        SetNpcLifeTime(GetTask(TASK_XY_TEMP), 0);
--        local npcIndex = CreateNpc("¾ÅÍ·½ğ·ï", "¾ÅÍ·½ğ·ï", 326, 1496, 2945);
--        SetNpcScript(npcIndex, "\\script\\ÖĞÔ­¶şÇø\\ÄºÑ©É½×¯\\npc\\¾ÅÍ·½ğ·ï.lua");
--        SetDeathScript("");
--        SetTask(TASK_XY_TEMP, 0);
--        RemoveTrigger(GetRunningTrigger());
--        RemoveTrigger(GetTrigger(LEAVE_RECT_XY));
--    end;
--end;

--function Leave_Map()
--    if GetTask(TASK_XYTY) == 24 then
--        SetTask(TASK_XYTY, 23);
--        SetNpcLifeTime(GetTask(TASK_XY_TEMP), 0);
--        local npcIndex = CreateNpc("¾ÅÍ·½ğ·ï", "¾ÅÍ·½ğ·ï", 326, 1496, 2945);
--        SetNpcScript(npcIndex, "\\script\\ÖĞÔ­¶şÇø\\ÄºÑ©É½×¯\\npc\\¾ÅÍ·½ğ·ï.lua");
--        SetDeathScript("");
--        SetTask(TASK_XY_TEMP, 0);
--        RemoveTrigger(GetTrigger(LEAVE_GAME_XY));
--        RemoveTrigger(GetRunningTrigger());
--    end;
--end;