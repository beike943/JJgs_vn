-- ====================== �ļ���Ϣ ====================== 
                                                          
-- ������ԵonlineII ͨ��������Ϣ��ʼ�������ļ�                  
-- Edited by starry night                                 
-- 2005/11/29 PM 17:44                                    
                                                          
-- ======================================================

--����ͨ������ͷ�ļ�
Include("\\script\\task\\killer\\killer_head.lua");

function main()

	local nWeekDay = GetWeekDay();
	local nHour,nMin = GetLocalTime();
	
	--������ǰ��ʼ��NO1
	
		if nHour == 20 then
			
			print("��1��ͨ������ ! !")
			
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

	--������ǰ��ʼ��NO2
	
		if nHour == 22 then
			
			print("��2��ͨ������ ! !")
			
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