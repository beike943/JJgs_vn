--����: ��е�ޱ�ը

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_effect_persist_time",{{1,4},{20,4}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--���ܵȼ�����ӵ�����
	{
	{"missle_collide_range_h",{{1,9},{2,9}}},
	{"missle_collide_range_w",{{1,9},{2,9}}},
	{"missle_vanish_after_collide",{{1,1},{2,1}}},
	{"missle_damage_interval",{{1,-1},{2,-1}}},
	{"missle_damage_range_w",{{1,9},{2,9}}},
	{"missle_damage_range_h",{{1,9},{2,9}}},
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
	damage_factor_z={{1,24000},{2,3000}},
	},
	{magic="damage_life_monster",
	damage_factor_z={{1,2000000},{2,2000000}},
	},
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--���ܵȼ����״̬ħ������
	{
	{
	magic="state_fetter",
	}
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	{magic="imme_mana_percent_damage",
	damage_factor_z={{1,25},{2,10}},
	},
	},
}
