--�ű����ƣ���װ����Ľ���
--�ű����ܣ�
--���ܲ߻���
--���ܿ���������
--����ʱ�䣺2010-03-09
--�����޸ļ�¼

function ShowHelp()
	local szTitle	= "��֪��ô��"
	local tMenu	= {
		"��֪���� /nothing",
	};

	Say(szTitle, getn(tMenu), tMenu);
end

function ShowHelp_Ex()
	local szTitle	= "��֪���ˣ�"
	local tMenu	= {
		"��֪���� /nothing",
	};

	Say(szTitle, getn(tMenu), tMenu);
end

function ShowHelp_Coat()
	local szTitle	= "";
	szTitle = szTitle.."    ����װ���ղغ���Ʒ��<color=yellow>��ʧ<color>����¼����СС�³����У������޴�ȡ����\n";
	szTitle = szTitle.."    �����鱻�ղغ���Ʒ��<color=yellow>��ʧ<color>����¼�������顱�����С�������ǧ��й����ȡ����װʱ���������Ч���������޴�ʹ�á�\n";
	szTitle = szTitle.."    ����װ�ղ�������ֻҪ����<color=yellow>����ǧ���<color>���۵�������װ�����Ա��ղء�\n";
	szTitle = szTitle.."    ����������ѧϰ������ȥ������������˴�ѧϰ���ѯ��\n";
	szTitle = szTitle.."\n<color>";

	local tMenu	= {
		"��֪���� /nothing",
	};

	Say(szTitle, getn(tMenu), tMenu);
end

function ShowHelp_Coat_Ex()
	local szTitle	= "";
	szTitle = szTitle.."    ����װ���ղغ���Ʒ��<color=yellow>��ʧ<color>����¼����СС�³����У������޴�ȡ����\n";
	szTitle = szTitle.."    �����鱻�ղغ���Ʒ��<color=yellow>��ʧ<color>����¼�������顱�����С�������ǧ��й����ȡ����װʱ���������Ч���������޴�ʹ�á�\n";
	szTitle = szTitle.."    ����װ�ղ���������<color=yellow>�����¹��̳ǻ�������ǧ���<color>����ȡ����������װ������Ϊһ�׵���װɢ�����������Ա��ղء�\n";
	szTitle = szTitle.."    ����������ѧϰ���ѯ������ͨ���ռ�ɢ���ڽ����е�����֮���䷽ѧϰ��ͨ��F1�����鿴��������Ч����\n";
	szTitle = szTitle.."\n";

	local tMenu	= {
		"��֪���� /nothing",
	};

	Say(szTitle, getn(tMenu), tMenu);
end


function nothing()
end
