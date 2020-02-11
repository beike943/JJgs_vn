
Include("\\script\\task\\faction\\faction_main_tm.lua"); -- ÌÆÃÅÊ¦ÃÅÈÎÎñµÄ½Å±¾Í·ÎÄ¼ş


function main()

local nTaskValue = FN_GetTaskState(FN_TM)

	if (nTaskValue==4) then
		task_008();
		return
	elseif (nTaskValue==5) then
		Say("Ng­¬i kh«ng mau ®i ®µo cßn ë ®©y ®îi g× n÷a?",0);
		return
	elseif (nTaskValue==6) then
		task_010();
		return
	elseif (nTaskValue==7) then
		Say("§­îc råi! Xem nh­ ng­¬i ®· qua ¶i cña ta, mau ®Õn gÆp L·o l·o!",0);	
		return
	else
	
		local i=random(1,3)
		if i == 1 then
			Say("Cã §­êng V©n ta ë ®©y, kÎ kh¸c muèn x©m ph¹m §­êng M«n cßn khã h¬n lªn trêi.",0)
		elseif	i == 2 then
			Say("¸m khİ phßng vµ Háa khİ phßng cø ®é kş nhau lµm ta c¶m thÊy khã xö.",0)
		else
			Say("Thiªn H¶i gÇn ®©y h¬i kh¸c l¹, e r»ng ®· cã chuyÖn x¶y ra.",0)
		end
		
	end
end;

