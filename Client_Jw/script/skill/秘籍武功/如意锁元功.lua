--����: ������Ԫ��

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_effect_persist_time",{{1,600},{10,600}}},
	{"skill_display_persist_time",{{1,60},{2,60},{3,75},{4,75},{5,90},{6,90},{7,105},{8,105},{9,120},{10,120}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_mana_point",{{1,410},{10,500}}}
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
	damage_factor_z={{1,76},{10,76}},
	},
	{magic="state_skill_convert_to_1",
	damage_factor_z={{1,27328513},{10,27328522}},
	},
	{magic="state_physical_parmor_poi_add",
	damage_factor_z={{1,5},{9,13},{10,15}},
	},
	{magic="state_magic_parmor_poi_add",
	damage_factor_z={{1,5},{9,13},{10,15}},
	},
	--84�ż��ܼ��ʱ���ӳ�6�룬��Ϊ���ӳ�������6��Ϊ����������ȡ����
	{magic="state_skill_cast_interval_dec_spec_1",
	damage_factor_z={{1,5570452},{10,5570452}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
