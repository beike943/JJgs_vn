--ÚùÔ¶Çç
--created by lizhi
--2005-9-5 16:45

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\lizhi_ÑïÖİ\\task_four_main.lua");

function main()
    if GetLevel() < 50 then
        Talk(1,"","Ng­¬i ®o¸n khi nµo Long V­¬ng thu håi bän §«ng H¶i Thñy Téc vÒ?");
        return
    end;
    
    local nStep = GetTask(TASK_YZ_FOUR);
    if nStep == 0 then
        four_00_00();
    elseif nStep == 2 then
        four_02_00();
    elseif nStep == 5 then
        four_05_00();
    elseif nStep == 6 then
        four_06_00();
    elseif nStep == 7 then
        four_07_00();
    else
        Talk(1,"","Ng­¬i ®o¸n khi nµo Long V­¬ng thu håi bän §«ng H¶i Thñy Téc vÒ?");
    end;
end;