--����: һ��÷

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_sub_skill1_probability",{{1,30},{1,30}}},
	{"skill_sub_skill1_factor",{{1,20},{1,20}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_mana_point",{{1,1},{1,1}}},
	{"cost_mana_per_second",{{1,1},{5,2},{7,2},{17,5}}},
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--���ܵȼ�����ӵ�����
	{
	{"skill_missle_num",{{1,24},{1,24}}},
	{"skill_param1",{{1,-6},{1,-6}}},
	{"skill_param2",{{1,6},{1,6}}},
	{"missle_vanish_after_collide",{{1,1},{1,1}}},
	{"missle_damage_interval",{{1,-1},{1,-1}}},
	{"missle_collide_npc_missle",{{1,0},{1,0}}},
	},

	--ħ������

	--����ֵ:	��ͨ������ * X + (1 + ���ܵȼ� * Y) * (���� * A + ���� * B + �� * C + �ڹ� * D + ���� * E)
	--			+ �����⹦������ * F + Z
	--			(����,A,B,C,D,E,F,X,Y,ZΪ�˺�����.��Z��,������˺�����Ϊ�ٷֱ���.)

	--�ɹ�����:	(����ֵ * A + (����ȼ� - �Է��ȼ�) * B + ���ܵȼ� * C) * D + X
	--			(����,A,B,C,D,XΪ��������.��X��,�������������Ϊ�ٷֱ���.)

	SKILL_MAGIC_DAMAGE_ATTRIB =	--���ܵȼ�����˺�ħ������
	{
	{magic="damage_life_monster",
	damage_factor_a={{1,66},{1,66}},
	damage_factor_b={{1,66},{1,66}},
	damage_factor_c={{1,66},{1,66}},
	damage_factor_d={{1,66},{1,66}},
	damage_factor_e={{1,66},{1,66}},
	probability_factor_b={{1,20},{1,20}},
	probability_factor_x={{1,100},{1,100}},
	},
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--���ܵȼ����״̬ħ������
	{
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
