--	1.ǿ�ƽ�������;
--    û�в���������0��ʾ����Ҫ������1��ʾ��Ҫ��
function NeedBoxForceUnlock()
	local elapseTime = GetBoxLastLockElapseTime()
	return 0
end;

--	 2.ǿ�ƽ������еĲ���;
--     û�в�����û�з���ֵ��
function ProcessBoxForceUnlock()
end;
	 
--	 3.��ѯ������ʱ��,�˺�������Ҫʵ�֣��Ƿ������ṩ�Ĺ���;
--     û�в���������������ʱ��ΪGameLogicFrameTime
-- function GetBoxLastLockTime()

--	 4.����������
--     û�в���������0��ʾ���ܣ�����1��ʾ�ܹ���
function CanBoxLock()
	return 1;
end;

--	 5.�������еĲ�����
--     û�в�����û�з���ֵ��
function ProcessBoxLock()		
end;

--	 6.������������
--     û�в���������0��ʾ�ܹ�������1��ʾ���ܣ�
function CanBoxChangePassword()
	local money=GetCash()
	if money >= 200 then
		return 1
	else
		TaskTip("�޸Ĵ�����������Ҫ����2�����ӣ������ϵ�Ǯ����Ŷ��")
		return 0
	end
end;

--	 7.��������еĲ�����
--     û�в�����û�з���ֵ��
function ProcessBoxChangePassword()
--	ProcessBoxLock()
	Pay(200)
end;

--	 8.��������������
--     û�в���������0��ʾ�ܹ�������1��ʾ�ܣ�
function CanBoxSetPassword()
	local money=GetCash()
	if money >= 2000 then
		return 1
	else
		TaskTip("���ô�����������Ҫ����20�����ӣ������ϵ�Ǯ����Ŷ��")
		return 0
	end
end;

--	 9.����������еĲ�����
--     û�в�����û�з���ֵ��
function ProcessBoxSetPassword()
	Pay(2000)
end;

--	 10.��鴢�����Ƿ�Ҫǿ�ƽ���
--	���ò���
function ProcessUnlockLapse()
	if GetBoxUnlocking() == 1 then
		if GetBoxLastLockElapseTime() > 7 * 24 * 3600 then
			UnlockBox()
			CancelBoxPassword()
			Talk(1, "", "���Ľ�������ʱ�䵽�ˣ��������Ѿ�����,�뾡�������������룬���ⶪʧ��")
		else
			local nTimeLeft = GetBoxLastLockElapseTime() / 3600 / 24
			nTimeLeft = floor(nTimeLeft)
			nTimeLeft = 7 - nTimeLeft
			if nTimeLeft>7 then 
				nTimeLeft=7
			end
			Talk(1, "","���Ĵ�����������ǿ�ƽ���״̬,���Ĵ��������뽫��"..nTimeLeft.."����Զ�����!��������,�뿪��������ȡ��ǿ�ƽ���!")
		end
	end
	return 1
end
