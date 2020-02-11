--ÇåÁéÉ¢½Å±¾
Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
function OnUse(nIndex)
	if tGtTask:check_cur_task(3) == 0 or GetTask(Task_id_003) >= 1 then
		return 0;
	end
	if DelItem(2,0,30020,1) == 1 then
		SetTask(Task_id_003,GetTask(Task_id_003)+1);
		local tSex = gf_GetPlayerSexName();
		Msg2Player(tSex.."§· sö dông Thanh Lı T¸n do Nh¹c BÊt QuÇn luyÖn chÕ, b¸ch ®éc bÊt x©m, h·y nhanh chãng ®Õn Long M«n TrÊn xem t×nh h×nh cña B¸ch HiÓu Sinh thÕ nµo!")
	end
end