--ÕÅ²®º¹
--created by lizhi
--2005-9-1 16:19

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\lizhi_ÑïÖİ\\task_three_main.lua");

function main()
    local nStep = GetTask(TASK_YZ_THREE);
    if nStep == 1 then
        task_01_00();
    elseif nStep == 2 then
        task_02_00();
    elseif nStep == 3 then
        Talk(1,"","H·y ®Õn <color=yellow>D­¬ng Ch©u<color> hái ThiÕt Chñy <color=yellow>Lı TiÕn Dòng<color> vÒ chuyÖn ®éng vËt kú qu¸i! May ra sÏ cã chót manh mèi!");
    else
        Talk(1,"","Sao Vò Di s¬n l¹i cã qu¸ nhiÒu KhØ tr¾ng vµ hå ly tr¾ng! Muèn hï chÕt ta sao?");
    end;
end;