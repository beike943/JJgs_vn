-- ====================== �ļ���Ϣ ====================== 
                                                          
-- ������ԵonlineII ͨ������ͨ����Ϣ�����ļ�                  
-- Edited by starry night                                 
-- 2005/11/28 PM 15:17                                    
                                                          
-- ======================================================

--����ͨ������ͷ�ļ�
Include("\\script\\task\\killer\\killer_head.lua");

function main()

	local nWeekDay = GetWeekDay();
	local nHour,nMin = GetLocalTime();
	
		if nWeekDay == 1 or nWeekDay == 2 or nWeekDay == 3 or nWeekDay == 4 then
			if nHour == 20  then
				AddLocalNews("�������ͽ������������ӣ��ٸ��ѷ�����ͨ������Ҳ�ͷ�������ǽ��!");
				Msg2SubWorld("�������ͽ������������ӣ��ٸ��ѷ�����ͨ������Ҳ�ͷ�������ǽ��!");
				
			elseif nHour == 22 then
				AddLocalNews("�ٸ��ѷ�����ͨ������Ҳ�ͷ�������ǽ��!");
				Msg2SubWorld("�ٸ��ѷ�����ͨ������Ҳ�ͷ�������ǽ��!");
				
			elseif nHour == 0 then
				AddLocalNews("�����ͨ�������Ѿ�������ɣ���л���д����İ���!");
				Msg2SubWorld("�����ͨ�������Ѿ�������ɣ���л���д����İ���!");
				
			else
				AddLocalNews("ÿ����20ʱ��22ʱ���ٸ��ᷢ��ͨ��� �ڴ������İ���!");
				Msg2SubWorld("ÿ����20ʱ��22ʱ���ٸ��ᷢ��ͨ��� �ڴ������İ���!"); 
			end;
		end;
end;
