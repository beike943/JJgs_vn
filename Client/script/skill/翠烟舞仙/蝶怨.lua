--����: ��Թ

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_sub_skill1_probability",{{1,0},{3,0},{4,8},{5,9},{6,10},{7,12},{8,15},{18,15}}},
	{"skill_sub_skill1_factor",{{1,0},{3,0},{4,10},{5,12},{6,15},{7,17},{8,20},{18,20}}},
	{"skill_display_persist_time",{{1,5},{18,5}}},
	{"skill_effect_persist_time",{{1,5},{18,5}}},
	{"skill_move_param",{{1,0},{18,0}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_mana_point",{{1,8},{8,15},{18,20}}},
	{"cost_mana_per_second",{{1,3},{18,3}}},
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--���ܵȼ�����ӵ�����
	{
	{"missle_vanish_after_collide",{{1,1},{18,1}}},
	{"missle_damage_interval",{{1,99},{18,99}}},
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
	damage_factor_x={{1,80},{8,185},{18,222}},
	probability_factor_b={{1,20},{18,20}},
	probability_factor_x={{1,100},{18,100}},
	},
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--���ܵȼ����״̬ħ������
	{
	{magic="state_slow",
	damage_factor_z={{1,15},{8,60},{18,80}},
	damage_factor_m={{1,80},{18,80}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
