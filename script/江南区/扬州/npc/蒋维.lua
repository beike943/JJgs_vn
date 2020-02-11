--½¯Î¬
--created by lizhi
--2005-9-1 16:19

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_ÑïÖÝ\\task_three_main.lua");

function main()
    local nStep = GetTask(TASK_YZ_THREE);
    if nStep == 11 then
        task_11_00();
    elseif nStep == 12 then
        task_12_00();
    elseif nStep == 13 then
    	task_13_jw_00()
    else
        Talk(1,"","<color=green>T­ëng Duy<color>: Phô n÷ chØ cÇn sèng kháe chø son phÊn sao s¸nh ®­îc víi c¸i ®Ñp tù nhiªn.");
    end;
end;