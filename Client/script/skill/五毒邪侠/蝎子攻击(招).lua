--����: Ы�ӹ���(��)

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_effect_persist_time",{{1,3},{1,3}}},
	{"skill_display_persist_time",{{1,3},{1,3}}},
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
	{magic="damage_life_monster",
	damage_factor_a={{1,375},{1,375}},
	damage_factor_b={{1,375},{1,375}},
	damage_factor_c={{1,375},{1,375}},
	damage_factor_d={{1,375},{1,375}},
	damage_factor_e={{1,375},{1,375}},
	},
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--���ܵȼ����״̬ħ������
	{
	{magic="state_poison_damage",
	damage_factor_a={{1,750},{1,750}},
	damage_factor_b={{1,750},{1,750}},
	damage_factor_c={{1,750},{1,750}},
	damage_factor_d={{1,750},{1,750}},
	damage_factor_e={{1,750},{1,750}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
