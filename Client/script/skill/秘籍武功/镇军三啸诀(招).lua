--����: �����Х��(��)

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_effect_persist_time",{{1,10},{10,10}}},
	{"skill_display_persist_time",{{1,10},{10,10}}},
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
	{magic="state_physical_parmor_per_dec",
	damage_factor_z={{1,35},{7,5},{8,0},{10,0}},
	},
	{magic="state_magic_parmor_per_dec",
	damage_factor_z={{1,35},{7,5},{8,0},{10,0}},
	},
	{magic="state_physical_parmor_per_add",
	damage_factor_z={{1,0},{7,0},{8,10},{10,20}},
	},
	{magic="state_magic_parmor_per_add",
	damage_factor_z={{1,0},{7,0},{8,10},{10,20}},
	},
	{magic="state_skill_cast_interval_dec_spec_1",
	damage_factor_z={{1,47448073},{10,47448154}},
	},
	{magic="state_skill_cast_interval_dec_spec_2",
	damage_factor_z={{1,47775834},{10,47775996}},
	},
	{magic="state_skill_cast_interval_dec_spec_3",
	damage_factor_z={{1,47841388},{10,47841640}},
	},
	{magic="state_perfect_dodge_rate",
	damage_factor_z={{1,30},{10,30}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
