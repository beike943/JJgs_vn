--����: �һ���(��)

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_effect_persist_time",{{1,3},{16,3}}},
	{"skill_display_persist_time",{{1,3},{16,3}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--���ܵȼ�����ӵ�����
	{
	{"missle_vanish_after_collide",{{1,1},{16,1}}},
	{"missle_damage_interval",{{1,18},{16,18}}},
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
	{magic="state_poison_damage",
	damage_factor_z={{1,25},{6,150},{16,180}},
	damage_factor_e={{1,5},{6,20},{16,24}},
	damage_factor_b={{1,4},{6,14},{16,17}},
	probability_factor_b={{1,20},{16,20}},
	probability_factor_x={{1,100},{16,100}},
	},
	{magic="state_add_damage_percent",
	damage_factor_z={{1,10},{6,50},{16,60}},
	damage_factor_m={{1,60},{16,60}},
	probability_factor_b={{1,20},{16,20}},
	probability_factor_x={{1,100},{16,100}},
	},
	{magic="state_add_damage_num",
	damage_factor_z={{1,999},{16,999}},
	},
	{magic="state_none",
	damage_factor_z={{1,10},{6,50},{16,60}},
	damage_factor_m={{1,60},{16,60}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}