--����: ����(����)

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_effect_persist_time",{{1,3},{9,12}}},
	{"skill_display_persist_time",{{1,3},{9,12}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--���ܵȼ�����ӵ�����
	{
	{"missle_vanish_after_collide",{{1,1},{1,1}}},
	{"missle_damage_interval",{{1,18},{1,18}}},
	{"missle_damage_range_w",{{1,11},{1,11}}},
	{"missle_damage_range_h",{{1,11},{1,11}}},
	{"missle_collide_range_w",{{1,11},{1,11}}},
	{"missle_collide_range_h",{{1,11},{1,11}}},
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
	damage_factor_a={{1,100},{1,100}},
	damage_factor_b={{1,100},{1,100}},
	damage_factor_c={{1,100},{1,100}},
	damage_factor_d={{1,100},{1,100}},
	damage_factor_e={{1,100},{1,100}},
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
