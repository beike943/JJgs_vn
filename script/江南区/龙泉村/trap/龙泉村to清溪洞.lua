--ÁúÈª´åtoÇåÏª¶´.lua
--GGH

Include("\\script\\task\\world\\task_var_id.lua");

function main(sel)
    if GetTask(TASK_FIVE) >= 21 then
	NewWorld(111,1603,3205);
    	SetFightState(1);    	
    else
        Msg2Player("Phİa tr­íc nhiÒu nguy hiÓm! Chi b»ng quay l¹i th× tèt h¬n!.");
    end;
end;
