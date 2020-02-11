
Include("\\script\\task\\faction\\faction_main_tm.lua"); -- ÌÆÃÅÊ¦ÃÅÈÎÎñµÄ½Å±¾Í·ÎÄ¼ş
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_ÑïÖİ\\task_two_main.lua");

function main()
    local nStep = GetTask(TASK_YZ_TWO);
    if nStep == 1 then
        task_01_00();
        return
    elseif nStep == 2 then
        task_02_00();
        return
    elseif nStep == 4 then
        task_04_00();
        return
    end;

local nTaskValue = FN_GetTaskState(FN_TM)

	if (nTaskValue==2) then
		task_005();
		return
	elseif (nTaskValue==3) then
		task_006();
		return
	elseif (nTaskValue<8) then
		Say("Ng­¬i ®Õn C¬ quan phßng hái §­êng V©n xem sè Hãa Cèt T¸n nµy dïng thÕ nµo míi cã hiÖu qu¶.",0);
		return
	else
	
		local i=random(1,3)
		if i == 1 then
			Say("ChØ cÇn lµ ®éc d­îc nhÊt ®Şnh cã thuèc gi¶i. ChØ sî ®éc tİnh qu¸ cao kh«ng kŞp kh¾c chÕ th«i.",0)
		elseif	i == 2 then
			Say("C¸ch h¹ ®éc cña Ngò §éc rÊt ®Æc biÖt, nÕu kh«ng ph¶i m«n quy nghiªm ngÆt ta ®· b¾t vµi tªn ®Ö tö Ngò §éc vÒ ®Ó tra hái.",0)
		else
			Say("Kh«ng ph¶i lµ ®Ö tö §­êng M«n ®õng hßng ta cho thuèc gi¶i ®éc.")
		end
	end
	
end;

