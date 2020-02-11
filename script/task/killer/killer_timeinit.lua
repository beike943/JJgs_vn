-- ====================== ÎÄ¼şĞÅÏ¢ ====================== 
                                                          
-- ½£ÏÀÇéÔµonlineII Í¨¼©ÈÎÎñĞÅÏ¢³õÊ¼»¯´¦ÀíÎÄ¼ş                  
-- Edited by starry night                                 
-- 2005/11/29 PM 17:44                                    
                                                          
-- ======================================================

--ÒıÓÃÍ¨¼©ÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\killer\\killer_head.lua");

function main()

	local nWeekDay = GetWeekDay();
	local nHour,nMin = GetLocalTime();
	
	--ÈÎÎñ¿ªÆôÇ°³õÊ¼»¯NO1
	
		if nHour == 20 then
			
			print("TiÕn hµnh lÇn 1 nhiÖm vô truy n·! ! !")
			
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

	--ÈÎÎñ¿ªÆôÇ°³õÊ¼»¯NO2
	
		if nHour == 22 then
			
			print("TiÕn hµnh lÇn 2 nhiÖm vô truy n·! ! !")
			
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