--Àî½øÓÂ
--created by lizhi
--2005-9-1 16:19

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\lizhi_ÑïÖÝ\\task_three_main.lua");
Include("\\script\\task\\world\\lizhi_ÑïÖÝ\\task_four_main.lua");

function main()
    if (GetTask(TASK_YZ_FOUR) >= 3 and GetTask(TASK_YZ_FOUR) <= 4) and (GetTask(TASK_YZ_THREE) >= 3 and GetTask(TASK_YZ_THREE) <= 6) then
        local szSay = {
            "Ch¼ng hay <sex> t×m ta cã chuyÖn g×?",
            "ChuyÖn Vò Di s¬n/task_three",
            "ChuyÖn §«ng H¶i/task_four"
        };
        SelectSay(szSay);
        return
    end;
    
    if GetTask(TASK_YZ_THREE) >= 3 and GetTask(TASK_YZ_THREE) <= 6 then
        task_three();
        return
    end;
    
    if GetTask(TASK_YZ_FOUR) >= 3 and GetTask(TASK_YZ_FOUR) <= 4 then
        task_four();
        return
    end;

    local szTalk = {
        "<sex> nµy Ên ®­êng ph¸t s¸ng, d­êng nh­ cã hû sù l©m m«n! Ng­¬i cã muèn ta bãi thö mét quÎ kh«ng?"
    };
    TalkEx("", szTalk);
end;

function task_four()
    local nStep = GetTask(TASK_YZ_FOUR);
    if nStep == 3 then
        four_03_00();
    elseif nStep == 4 then
        four_04_00();
    end;
end;

function task_three()
    local nStep = GetTask(TASK_YZ_THREE);
    if nStep == 3 then
        task_03_00();
    elseif nStep == 4 then
        task_04_00();
    elseif nStep == 5 then
        task_05_00();
    elseif nStep == 6 then
        local szTalk = {
            "§Õn T©y Nam D­¬ng Ch©u thµnh cã thÓ t×m ®­îc L­u HuyÒn Thanh hái trong L­ìng Thñy ®éng ®· x¶y ra chuyÖn g×?"
        };
        TalkEx("", szTalk);
    end;
end;