--����: ����������(��)

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_effect_persist_time",{{1,5},{10,5}}}
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--���ܵȼ�����ӵ�����
	{
	{"skill_param1",{{1,5},{10,5}}},
	{"skill_param2",{{1,5},{10,5}}},
	},

	--ħ������

	--����ֵ:	��ͨ������ * X + (1 + ���ܵȼ� * Y) * (���� * A + ���� * B + �� * C + �ڹ� * D + ���� * E)
	--			+ �����⹦������ * F + Z
	--			(����,A,B,C,D,E,F,X,Y,ZΪ�˺�����.��Z��,������˺�����Ϊ�ٷֱ���.)

	--�ɹ�����:	(����ֵ * A + (����ȼ� - �Է��ȼ�) * B + ���ܵȼ� * C) * D + X
	--			(����,A,B,C,D,XΪ��������.��X��,�������������Ϊ�ٷֱ���.)

	SKILL_MAGIC_DAMAGE_ATTRIB =	--���ܵȼ�����˺�ħ������
	{
	{magic="damage_life",
	damage_factor_a={{1,80},{8,115},{10,130}},
	damage_factor_b={{1,80},{8,115},{10,130}},
	damage_factor_c={{1,80},{8,115},{10,130}},
	damage_factor_d={{1,80},{8,115},{10,130}},
	damage_factor_e={{1,80},{8,115},{10,130}},
	damage_factor_z={{1,110},{10,200}},
	},
	{magic="damage_ignore_rebound_per",
	damage_factor_z={{1,100},{10,100}},
	},
	{magic="damage_interrupt_rate_add",
	damage_factor_z={{1,30},{10,75}},
	},
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--���ܵȼ����״̬ħ������
	{
	{magic="state_slow",
	damage_factor_z={{1,20},{5,20},{6,25},{8,25},{9,30},{10,30}},
	},
	{magic="state_p_attack_percent_dec",
	damage_factor_z={{1,10},{10,10}},
	},
	{magic="state_physical_parmor_poi_dec",
	damage_factor_z={{1,5},{10,5}},
	},
	{magic="state_attack_rate_point_dec",
	damage_factor_z={{1,100},{10,100}},
	},
	{magic="state_dodge_rate_point_dec",
	damage_factor_z={{1,100},{10,100}},
	},
	{magic="state_burst_dec_rate",
	damage_factor_z={{1,10},{10,10}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
