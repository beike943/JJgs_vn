--����: ����

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_sub_skill1_probability",{{1,15},{17,15}}},
	{"skill_sub_skill1_factor",{{1,20},{17,20}}},
	{"skill_effect_persist_time",{{1,3},{17,3}}},
	{"skill_display_persist_time",{{1,3},{17,3}}},
	{"skill_gaslimit",{{1,-10},{17,-10}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_mana_point",{{1,5},{17,5}}}
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
	{magic="damage_life",
	damage_factor_x={{1,90},{7,180},{17,216}},
	probability_factor_b={{1,20},{17,20}},
	probability_factor_x={{1,100},{17,100}},
	}
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--���ܵȼ����״̬ħ������
	{
	{magic="state_lost_life_per18",
	damage_factor_e={{1,120},{17,120}},
	probability_factor_b={{1,20},{17,20}},
	probability_factor_x={{1,100},{17,100}},
	}
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
