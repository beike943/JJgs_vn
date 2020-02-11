Include("\\script\\task\\world\\´óÀí\\task_head.lua");
Include("\\script\\task\\global_task\\gtask_head.lua")
Include("\\script\\task\\global_task\\gtask_data.lua")

function main(sel)
	if GetTask(TASK_DL_LV62_ID) >= 1 or 
			tGtTask:check_cur_task(237) ~= 0 or
			IsHaveTaskOrCanGet2(241, 246) == 1
		then
		if GetTask(TASK_DL_LV62_ID) == 1 then
			SetTask(TASK_DL_LV62_ID,2);
		end;
		NewWorld(412, 1859 ,3179);
		SetFightState(1);
		return
	end
	Msg2Player("Phİa tr­íc rÊt nguy hiÓm, ch­a biÕt t×nh h×nh cô thÓ kh«ng nªn tù tiÖn ®Õn ®ã!");
	TaskTip("Phİa tr­íc rÊt nguy hiÓm, ch­a biÕt t×nh h×nh cô thÓ kh«ng nªn tù tiÖn ®Õn ®ã!");
end