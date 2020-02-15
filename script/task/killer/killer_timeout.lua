-- ====================== 文件信息 ====================== 
                                                          
-- 剑侠情缘onlineII 通缉任务通告信息发布文件                  
-- Edited by starry night                                 
-- 2005/11/28 PM 15:17                                    
                                                          
-- ======================================================

--引用通缉任务头文件
Include("\\script\\task\\killer\\killer_head.lua");

function main()

	local nWeekDay = GetWeekDay();
	local nHour,nMin = GetLocalTime();
	
		if nWeekDay == 1 or nWeekDay == 2 or nWeekDay == 3 or nWeekDay == 4 then
			if nHour == 20  then
				AddLocalNews("最近，歹徒的数量大大增加，官府已发布了通缉令，请找捕头帮助他们解决!");
				Msg2SubWorld("最近，歹徒的数量大大增加，官府已发布了通缉令，请找捕头帮助他们解决!");
				
			elseif nHour == 22 then
				AddLocalNews("官府已发布了通缉令，请找捕头帮助他们解决!");
				Msg2SubWorld("官府已发布了通缉令，请找捕头帮助他们解决!");
				
			elseif nHour == 0 then
				AddLocalNews("今天的通缉名单已经发布完成，感谢所有大侠的帮助!");
				Msg2SubWorld("今天的通缉名单已经发布完成，感谢所有大侠的帮助!");
				
			else
				AddLocalNews("每天在20时到22时，官府会发布通缉令。 期待大侠的帮助!");
				Msg2SubWorld("每天在20时到22时，官府会发布通缉令。 期待大侠的帮助!"); 
			end;
		end;
end;
