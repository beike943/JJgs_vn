--ÎäÒÄÉ½toÁ½Ë®¶´.lua
--GGH

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\global_task\\gtask_head.lua")

function main(sel)
	if GetTask(TASK_YZ_THREE) >= 7 or tGtTask:check_cur_task(234) ~= 0 then
		NewWorld(112,1559,2707);
		SetFightState(1);
	else
		Msg2Player("Phİa tr­íc nhiÒu nguy hiÓm! Chi b»ng quay l¹i th× tèt h¬n!");
	end;
end;
