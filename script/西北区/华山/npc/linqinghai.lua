Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")

function main()
	Say("L©m Thanh H¶i: xin chµo, Cã muèn ®Õn ThiÕt Ch­ëng S¬n Trang kh«ng?", 2, "§­îc, ®­a ta ®Õn ThiÕt Ch­ëng S¬n Trang/goto_tzsz", "T¹i h¹ chØ xem qua th«i/do_nothing");
end

function goto_tzsz()
	if tGtTask:check_task_isfinish(103) == 1 and tGtTask:check_task_isfinish(110) ~= 1 then
		NewWorld(6024,1652,3093);
		SetFightState(1);
	else
		Talk(1,"","c¸c h¹ kh«ng thÓ vµo khu vùc nµy.");
	end
end

function do_nothing()
end