--ÎŞÃûÉ®
--created by lizhi
--2005-8-24 19:09
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_½­½ò´å\\task_main.lua");
Include("\\script\\online_activites\\head\\activity_kill_npc_task.lua")

function main(bTag)
	if g_akct_GetTaskStep(bTag) then
		return
	end
	
	local nStep = GetTask(TASK_JJC);
	if nStep == 10 then
		task_10_00();
		return
	elseif nStep == 11 then
		task_11_00();
		return
	elseif nStep == 12 then
		task_12_00();
		return
	end;
	
	i=random(1,3)
	if i == 1 then
		Say("A Di §µ PhËt! N¬i ®©y xin thİ chñ chí lµm lo¹n! §¾c téi! §¾c téi!",0)
	elseif	i == 2 then
		Say("Bå ®Ò vèn v« thô, minh kİnh diÖt phi ®µi, bæn thŞ v« nhÊt vËt, hµ xø nh¹ trÇn ai.",0)
	else
		Say("L·o t¨ng thËt tÖ, cßn kh«ng nhí m×nh tu ë ®©y bao nhiªu n¨m n÷a.",0)
	end
end;