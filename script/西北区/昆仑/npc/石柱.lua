Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	if GetItemCount(2, 0, 30065) > 0 and GetTask(3133) == 0 then
		--������ʦ��������û����ɹ�����
		Talk(1, "", "<color=yellow>��Ԫ����: <color> ��ʹ������ʦ��, ��Ԫ�����Ѽ���.");
		SetTask(3133, 1);
		SetCurrentNpcSFX(GetTargetNpc(), 921, 1, 0, 18 *3);
		TaskTip("��Ԫ���������¼����ӡ������,��ȥ����ǰ");
		Msg2Player("��Ԫ���������¼����ӡ������,��ȥ����ǰ");
		return 0;
	end
	Talk(1,"","����ʦ������ʯ���ϣ����ܼ�����Ԫ����, �����·�ӡ����");
end
