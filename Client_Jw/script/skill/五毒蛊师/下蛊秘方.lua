--����: �¹��ط�

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_display_persist_time",{{1,1},{4,4}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--���ܵȼ�����ӵ�����
	{
	},

	--ħ������

	--����ֵ:	��ͨ������ * X + (1 + ���ܵȼ� * Y) * (���� * A + ���� * B + �� * C + �ڹ� * D + ���� * E)
	--			+ �����⹦������ * F + Z
	--			(����,A,B,C,D,E,F,X,Y,ZΪ�˺�����.��Z��,������˺�����Ϊ�ٷֱ���.)

	--�ɹ�����:	(����ֵ * A + (����ȼ� - �Է��ȼ�) * B + ���ܵȼ� * C) * D + X
	--			(����,A,B,C,D,XΪ��������.��X��,�������������Ϊ�ٷֱ���.)

	SKILL_MAGIC_DAMAGE_ATTRIB =	--���ܵȼ�����˺�ħ������
	{
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--���ܵȼ����״̬ħ������
	{
	{magic="state_skill_convert_from_1",
	damage_factor_z={{1,354},{4,354}},
	},
	{magic="state_skill_convert_to_1",
	damage_factor_z={{1,23199749},{2,25427973},{3,25493509},{4,25559045}},
	},
	{magic="state_skill_convert_from_2",
	damage_factor_z={{1,356},{4,356}},
	},
	{magic="state_skill_convert_to_2",
	damage_factor_z={{1,23330821},{2,25624581},{3,25690117},{4,25755653}},
	},
	{magic="state_skill_convert_from_3",
	damage_factor_z={{1,358},{4,358}},
	},
	{magic="state_skill_convert_to_3",
	damage_factor_z={{1,23461893},{2,25821189},{3,25886725},{4,25952261}},
	},
	{magic="state_skill_convert_from_4",
	damage_factor_z={{1,360},{4,360}},
	},
	{magic="state_skill_convert_to_4",
	damage_factor_z={{1,23592965},{2,26017797},{3,26083333},{4,26148869}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	{magic="imme_mana_percent_damage",
	damage_factor_z={{1,4},{4,4}},
	},
	},
}
