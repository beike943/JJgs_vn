--����: ��������(��)

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_sub_skill1_probability",{{1,1},{17,1}}},
	{"skill_sub_skill1_factor",{{1,0},{17,0}}},
	{"skill_effect_persist_time",{{1,1},{17,1}}},
	{"skill_display_persist_time",{{1,1},{17,1}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--���ܵȼ�����ӵ�����
	{
	{"missle_vanish_after_collide",{{1,1},{17,1}}},
	{"missle_damage_interval",{{1,-1},{17,-1}}},
	{"missle_damage_num",{{1,5},{17,5}}},
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
	damage_factor_x={{1,120},{7,190},{17,218}},
	probability_factor_b={{1,20},{17,20}},
	probability_factor_x={{1,100},{17,100}},
	}
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--���ܵȼ����״̬ħ������
	{
	{magic="state_slow",
	damage_factor_z={{1,35},{17,35}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
