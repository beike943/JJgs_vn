--����: ��ҹ��

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_sub_skill1_probability",{{1,0},{2,0},{3,8},{4,10},{5,12},{6,15}}},
	{"skill_sub_skill1_factor",{{1,0},{2,0},{3,10},{4,13},{5,16},{6,20}}},
	{"skill_sub_skill2_probability",{{1,0},{5,0},{6,5}}},
	{"skill_sub_skill2_factor",{{1,0},{5,0},{6,12}}},
	{"skill_display_persist_time",{{1,0},{3,0},{4,1},{6,1}}},
	{"skill_valid_object",{{1,456},{6,456}}},
	{"skill_effect_persist_time",{{1,2},{6,2}}}
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_mana_point",{{1,35},{6,60}}},
	{"cost_mana_per_second",{{1,6},{3,6},{4,12},{6,12}}},
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--���ܵȼ�����ӵ�����
	{
	{"missle_vanish_after_collide",{{1,1},{6,1}}},
	{"missle_damage_interval",{{1,99},{6,99}}},
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
	{magic="state_slow",
	damage_factor_c={{1,6},{3,8},{4,5},{6,7}},
	damage_factor_z={{1,15},{3,35},{4,10},{6,25}},
	},
	{magic="state_damage_mana_max",
	damage_factor_z={{1,0},{3,0},{4,10},{6,20}},
	},
	{magic="state_fetter",
	damage_factor_z={{1,1},{6,1}},
	probability_factor_b={{1,0},{3,0},{4,1},{6,1}},
	probability_factor_x={{1,0},{3,0},{4,6},{6,10}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
