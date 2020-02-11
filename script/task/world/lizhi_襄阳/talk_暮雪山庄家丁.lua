--和暮雪山庄家丁对话脚本
--created by lizhi
--2005-8-22 10:12
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_襄阳\\task_main.lua");

function talk()
    if GetTask(TASK_XYTY) == 16 then
        task_16_00();
    end;
end;