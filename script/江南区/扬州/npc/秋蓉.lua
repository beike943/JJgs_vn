--ÇïÈØ
--created by lizhi
--2005-9-1 16:19

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\lizhi_ÑïÖÝ\\task_three_main.lua");

function main()
    local nStep = GetTask(TASK_YZ_THREE);
    if nStep == 10 then
        task_10_00();
    elseif nStep == 11 or nStep == 12 or nStep == 13 then
        task_13_qr_00();
    elseif nStep == 14 then
        task_14_00();
    elseif nStep == 15 then
        Talk(1,"","Ch¼ng ph¶i ng­¬i nãi ®· ®¸nh b¹i Kú L©n g× ®ã sao? Sao l¹i ®æi ý thÕ?");
    elseif nStep == 16 then
        task_16_00();
    else
        if GetSex() == 1 then
            Talk(1,"","Ng­¬i cã muèn vµo ®©y cïng ta nhÊm chót mü töu? Ha ha ha!");
        elseif GetSex() == 2 then
            Talk(1,"","Muéi muéi! Dï ng­¬i hay ý trung nh©n cña ng­¬i ®Òu rêi xa n¬i nµy!");
        end;
    end;
end;