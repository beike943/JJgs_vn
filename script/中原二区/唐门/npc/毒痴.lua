--∫Õ∂æ≥’∂‘ª∞
--created by lizhi
--2005-8-25 18:50
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_œÂ—Ù\\task_main.lua");

function main()
    local nStep = GetTask(TASK_XYTY);
    if nStep == 38 then
        task_38_00();
    elseif nStep == 39 then
        task_39_00();
    elseif nStep == 40 then
        task_40_00();
    elseif nStep == 41 then
        task_41_00();
    else
        Talk(1,"","ßÈc c„ th” gi∂i cÚng c„ th” ®n.");
    end;
end;