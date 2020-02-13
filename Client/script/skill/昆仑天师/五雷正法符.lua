--����: ����������

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_sub_skill1_probability",{{1,0},{3,0},{4,8},{5,9},{6,10},{7,12},{8,15},{18,15}}},
	{"skill_sub_skill1_factor",{{1,0},{3,0},{4,10},{5,12},{6,15},{7,17},{8,20},{18,20}}},
	{"skill_sub_skill2_probability",{{1,0},{6,0},{7,3},{8,5},{18,5}}},
	{"skill_sub_skill2_factor",{{1,0},{6,0},{7,9},{8,12},{18,12}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_mana_point",{{1,70},{8,350},{18,350}}}
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--���ܵȼ�����ӵ�����
	{
	{"missle_vanish_after_collide",{{1,1},{18,1}}},
	{"missle_damage_interval",{{1,18},{18,18}}},
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
	damage_factor_x={{1,30},{8,100},{18,120}},
	probability_factor_b={{1,20},{18,20}},
	probability_factor_x={{1,100},{18,100}},
	},
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--���ܵȼ����״̬ħ������
	{
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	{magic="imme_mana_percent_damage",
	damage_factor_z={{1,1},{4,1},{5,2},{8,2},{18,2}},
	probability_factor_b={{1,20},{18,20}},
	probability_factor_x={{1,100},{18,100}},
	},
	},
}
