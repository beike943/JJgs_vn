--����: ��һ����(��1)

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_sub_skill1_probability",{{1,0},{2,0},{3,8},{4,10},{5,12},{6,15}}},
	{"skill_sub_skill1_factor",{{1,0},{2,0},{3,10},{4,13},{5,16},{6,20}}},
	{"skill_sub_skill2_probability",{{1,0},{6,5}}},
	{"skill_sub_skill2_factor",{{1,0},{6,12}}},
	{"skill_effect_persist_time",{{1,600},{6,600}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_mana_point",{{1,15},{6,15}}}
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
	{magic="state_random_series_attack",
	damage_factor_z={{1,7},{2,0},{6,0}},
	},
	{magic="state_yin_damage_per",
	damage_factor_z={{1,0},{2,75},{3,0},{6,0}},
	},
	{magic="state_attack_trans",
	damage_factor_z={{1,0},{2,0},{3,50},{4,0},{6,0}},
	},
	{magic="state_p_attack_percent_add",
	damage_factor_z={{1,0},{3,0},{4,15},{5,0},{6,0}},
	},
	{magic="state_cost_mana_percent_add",
	damage_factor_z={{1,0},{3,0},{4,20},{5,0},{6,0}},
	},
	{magic="state_slow_attack",
	damage_factor_z={{1,0},{4,0},{5,1966100},{6,0}},
	},
	{magic="state_quench_posion",
	damage_factor_c={{1,0},{5,0},{6,10}},
	damage_factor_d={{1,0},{5,0},{6,15}},
	damage_factor_z={{1,0},{5,0},{6,80}},
	},
	{magic="state_quench_posion_effect_skill",
	damage_factor_z={{1,0},{5,0},{6,100}},
	},
	{magic="state_knockback_attack",
	damage_factor_z={{1,5},{6,5}},
	},
	{magic="state_knockdown_immune",
	damage_factor_z={{1,50},{6,50}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}