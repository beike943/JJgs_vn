
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��Ʒ�����˽ű�
-- Edited by peres
-- 2005/02/22 PM 18:03
-- 2005/05/17 PM 16:45

-- ======================================================

ID_ITEMBOX = 805;
function main()
  nLevel = GetLevel()
		if random(1,30) == 1 then
			NpcChat(GetTargetNpc(),"��˵������˰����о�������װ���ԣ���֪���ǲ�����ģ�");
		end;
	if (GetTask(ID_ITEMBOX))==0 and  (nLevel>=10)  then
	
		Say("<color=yellow>������<color>�Ǽ��뽭���ز����ٵ�. ȥҰ����<color=yellow>��ɫ������<color> ���� <color=yellow>10����β<color>! ������Ĵ�����!",
				3,
				"���뿪��������/yes_box",
				"������/no_box",
				"�˽ⴢ����ĺô�/intro_box");
		return
	elseif (GetTask(ID_ITEMBOX))==0 and  (nLevel<10)  then
		Say("<color=yellow>������<color>�����Ǽ��뽭���ıز����ٵġ��㻹û��<color=yellow>10��<color>��ʱ�������ã�10�������ң�",0)
		return
	elseif GetTask(ID_ITEMBOX)==1 then
		check_box();
		return
 	else
	
		OpenBox()
		EnableBoxLock(1)
		SetPlayerRevivalPos(302)
		
	end;
end;


function yes_box()
	if GetTask(1) < 25 then	
		Talk(1,"","<color=green>Th? kh?<color>: Ho�n th�nh <color=yellow>nhi�m v? t�n th?<color> r�i h�n ��n t�m ta.");
		return 0;
	end;
	SetTask(ID_ITEMBOX,1);
	Say("����Ѱ <color=yellow>10��������β<color>������!",1,"�����ھ�ȥ!/box_no");
	TaskTip("�����ռ�10����ɫ��β����������!")
end;

function check_box()
	if GetItemCount(2,1,2)<10 then 
	        Say("�㻹û�ҵ�����Ҫ��<color=yellow>10��������β<color> , �Ұﲻ����!",1,"�����ھ�ȥ!/box_no")
	else
		DelItem(2,1,2,10)
		SetTask(ID_ITEMBOX,2) --���Ŵ�������
		Say("�������Ѿ������!�����ʹ�ð�!",1,"�ܺ�!�ǳ���л!/box_no")
		Msg2Player("�����������!�����ʹ��!");
	end;
end;

function no_box()
end;

function intro_box()

	Say("��������������δʹ�õĹ�����Ʒ. ������ĳ�����д򿪴�����ʱ,������ʱȡ��. ����, ����Ҫ����<color=yellow>20��<color>ʹ��<color=yellow>������������<color>ȷ�����Ĵ����䰲ȫ.ÿ��������ʱ�����佫 <color=yellow>�Զ�����<color> .�������Ҫ<color=yellow>��������<color>,��Ҫ֧��<color=yellow>����<color> <color=yellow>2��<color> ����!",1,"лл!/no_box");
end;


