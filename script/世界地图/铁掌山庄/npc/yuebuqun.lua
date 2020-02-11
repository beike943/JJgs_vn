Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")

function main()
	Say("Nh¹c BÊt QuÇn: ta ph¶i gi¶i cøu con g¸i ta!", 3, "Ta ph¶i trë vÒ Hoa S¬n/goto_huashan", "Ta cÇn ®Õn thÇn ®iÖn/goto_shendian","T¹i h¹ chØ xem qua th«i/do_nothing");
end

function goto_huashan()
	NewWorld(502, 1580, 3219);
	SetFightState(0);
end

function goto_shendian()
	if tGtTask:check_task_isfinish(106) == 1 and tGtTask:check_task_isfinish(110) ~= 1 then
		NewWorld(6025, 1595, 3175);	
	else
		Talk(1,"","c¸c h¹ kh«ng thÓ vµo khu vùc nµy.");
	end
end

function do_nothing()
end