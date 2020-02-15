-- ====================== 文件信息 ====================== 
                                                          
-- 剑侠情缘onlineII 通缉任务信息初始化处理文件                  
-- Edited by starry night                                 
-- 2005/11/29 PM 17:44                                    
                                                          
-- ======================================================

--引用通缉任务头文件
Include("\\script\\task\\killer\\killer_head.lua");

function main()

	local nWeekDay = GetWeekDay();
	local nHour,nMin = GetLocalTime();
	
	--任务开启前初始化NO1
	
		if nHour == 20 then
			
			print("第1个通缉任务 ! !")
			
			if SubWorldID2Idx(100) > 0 then
				SetMapTaskTemp(100,1,0);
			end;
			if SubWorldID2Idx(150) > 0 then
				SetMapTaskTemp(150,1,0);
			end;
			if SubWorldID2Idx(200) > 0 then
				SetMapTaskTemp(200,1,0);
			end;
			if SubWorldID2Idx(300) > 0 then
				SetMapTaskTemp(300,1,0);
			end;
			if SubWorldID2Idx(350) > 0 then
				SetMapTaskTemp(350,1,0);
			end;
		end;

	--任务开启前初始化NO2
	
		if nHour == 22 then
			
			print("第2个通缉任务 ! !")
			
			if SubWorldID2Idx(100) > 0 then
				SetMapTaskTemp(100,1,0);
			end;
			if SubWorldID2Idx(150) > 0 then
				SetMapTaskTemp(150,1,0);
			end;
			if SubWorldID2Idx(200) > 0 then
				SetMapTaskTemp(200,1,0);
			end;
			if SubWorldID2Idx(300) > 0 then
				SetMapTaskTemp(300,1,0);
			end;
			if SubWorldID2Idx(350) > 0 then
				SetMapTaskTemp(350,1,0);
			end;
		end;
end