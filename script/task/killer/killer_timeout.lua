-- ====================== ÎÄ¼þÐÅÏ¢ ====================== 
                                                          
-- ½£ÏÀÇéÔµonlineII Í¨¼©ÈÎÎñÍ¨¸æÐÅÏ¢·¢²¼ÎÄ¼þ                  
-- Edited by starry night                                 
-- 2005/11/28 PM 15:17                                    
                                                          
-- ======================================================

--ÒýÓÃÍ¨¼©ÈÎÎñÍ·ÎÄ¼þ
Include("\\script\\task\\killer\\killer_head.lua");

function main()

	local nWeekDay = GetWeekDay();
	local nHour,nMin = GetLocalTime();
	
		if nWeekDay == 1 or nWeekDay == 2 or nWeekDay == 3 or nWeekDay == 4 then
			if nHour == 20  then
				AddLocalNews("GÇn ®©y sè ng­êi ph¹m téi t¨ng nhiÒu, Bé ®Çu c¸c thµnh thÞ ®· ph¸t danh s¸ch truy n·, b¹n h·y ®Õn Nha m«n gióp hä ph¸ ¸n!");
				Msg2SubWorld("GÇn ®©y sè ng­êi ph¹m téi t¨ng nhiÒu, Bé ®Çu c¸c thµnh thÞ ®· ph¸t danh s¸ch truy n·, b¹n h·y ®Õn Nha m«n gióp hä ph¸ ¸n!");
				
			elseif nHour == 22 then
				AddLocalNews("Bé ®Çu c¸c thµnh thÞ ®· ph¸t danh s¸ch truy n·, b¹n h·y ®Õn Nha m«n gióp hä ph¸ ¸n!");
				Msg2SubWorld("Bé ®Çu c¸c thµnh thÞ ®· ph¸t danh s¸ch truy n·, b¹n h·y ®Õn Nha m«n gióp hä ph¸ ¸n!");
				
			elseif nHour == 0 then
				AddLocalNews("Danh s¸ch truy n· h«m nay ®· ph¸t xong, mong c¸c vÞ ®¹i hiÖp gióp b¾t chóng vÒ quy ¸n. Nha m«n sÏ ph¸t c«ng c¸o c¶m t¹ c¸c vÞ!");
				Msg2SubWorld("Danh s¸ch truy n· h«m nay ®· ph¸t xong, mong c¸c vÞ ®¹i hiÖp gióp b¾t chóng vÒ quy ¸n. Nha m«n sÏ ph¸t c«ng c¸o c¶m t¹ c¸c vÞ!");
				
			else
				AddLocalNews("Vµo lóc 20 h vµ 22 h, c¸c Bé ®Çu cña Nha m«n ë c¸c thµnh thÞ ra th«ng b¸o danh s¸ch truy b¾t téi ph¹m. Mong c¸c hiÖp kh¸ch ra tay trî gióp!");
				Msg2SubWorld("Vµo lóc 20 h vµ 22 h, c¸c Bé ®Çu cña Nha m«n ë c¸c thµnh thÞ ra th«ng b¸o danh s¸ch truy b¾t téi ph¹m. Mong c¸c hiÖp kh¸ch ra tay trî gióp!"); 
			end;
		end;
end;
