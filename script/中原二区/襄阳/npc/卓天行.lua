-- ====================== �ļ���Ϣ ====================== 
                                                          
-- ������ԵonlineII ͨ������ɱ�������ļ�(���Npc:����׿����)                  
-- Edited by starry night                                 
-- 2005/09/15 PM 9:27                                    
                                                          
-- ======================================================

--����ͨ������ͷ�ļ�
Include("\\script\\task\\killer\\killer_head.lua");
Include("\\script\\task\\killer\\cangbaotu_head.lua");

function main()

	Say("��ʲô��Ҫ��æ��?",
			2,
			"�������и�����,��ǰ��������/Task_Check",
			"ûʲô��/Task_Exit");
			
end;
			

function Task_Check()

	if GetItemCount(2,1,195) >= 1 then --�ж�ɱ��������
		Say("��y l?l�nh b�i s�t th?nh�t ph�m ���ng T�y H? b�n trong c?ch�a nhi�u �i�u th�n b?trong ch�c l�t kh�ng th?gi�i th�ch h�t ���c.",
				2,
				"5��,��������һ��/Task_Confirm",
				"�Ȳ���/Task_Exit");
	else
		Say("������Ҳû�����ư�,������!",0);
	end;
		
end;


function Task_Confirm()

local n = 0;
local nLevel = GetLevel();

local str1 = { "<color=green>׿����<color>:",
						   "L�nh b�i n�y xem ra ch�ng c?g?��c bi�t.",
						   "Ta c?m�t �t th�nh d��c �i l�i trong giang h?r�t c�n thi�t, t�ng ng��i xem nh?kh�ng u�ng c�ng c�a ng��i v�y.",
						   "�a t?ti�n b�i"}
					
local str2 = { "<color=green>׿����<color>:",
						 	 "B�n d��i l�nh b�i c?�n ch�a m�t b�n v? b�n tr�n m�i ch?l?nh�ng k?hi�u",
               "K?hi�u?",
               "<color=yellow>T�ng B�o ��<color> do ng��i mang ��n ���ng nhi�nl?ph�i tr?l�i cho ng��i r�i. N�i th�t ta gi?r�i c�ng kh�ng c�n �� s�c �� �i qu�ng ���ng d�i nh?v�y.",
						   "�a t?ti�n b�i ch?gi�o!"}
						 
local str3 = { "<color=green>׿����<color>:",
							 "?��y c�n c?<color=yellow>Ph�o hoa truy�n tin<color>��",
							 "Ph�o hoa truy�n tin?",
							 "��y l?v�t ph�m m?Nh�t Ph�m ���ng S�t Th?hay s?d�ng, ch?c�n ra ngo�i th�nh ��t l�n th?s?c?S�t th?��u m�c ��n ti�p �ng. Ng��i nh�n c?h�i n�y tr?h�i cho ��i T�ng.",
							 "�a t?ti�n b�i ch?gi�o!"}

	if Pay(5000) == 1 then
		local nDelItem = DelItem(2,1,195,1,1);
			if nDelItem == 1 then
			
				n = random(1,100);

				if n <= 35 then --35���õ�����ɢ10��
					TalkEx("",str1);
					--AwardMedicine();
					AddItem(1,0,14,10,1);
				elseif n > 35 and n <= 50 then --15%�õ��廨��¶��5��				
					AddItem(1,0,15,5,1);
				elseif n > 50 and n <= 65 then --15%�õ������컯ɢ5��				
					AddItem(1,0,16,5,1);	
				elseif n > 65 and n <= 95 then --30���õ�һ�Ųر�ͼ
					TalkEx("",str2);
					local nRow = random(3,tonumber(tabPos:getRow()));
					local nParticular = tonumber(tabPos:getCell(nRow,"PosID"));
					AddItem(2,14,nParticular,1,1);		
				else --5����ȡһ������ɱ�ִ����̻�					
					AddItem(2,1,203,1,1);
					TalkEx("",str3);
				end;	 
			end;
	else
		
		Say("Ti�n c�a ng��i ��u?",0);
	
	end;
	
end;