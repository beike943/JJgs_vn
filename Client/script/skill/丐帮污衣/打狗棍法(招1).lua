--����: �򹷹���(��1)

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_burst_time",{{1,14},{3,14},{4,22},{5,22},{6,33},{17,33}}},
	{"skill_nextskill_wait_time",{{1,11},{3,11},{4,18},{5,18},{6,25},{17,25}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--���ܵȼ�����ӵ�����
	{
	{"skill_missle_num",{{1,2},{3,2},{4,3},{5,3},{6,4},{17,4}}},
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
	damage_factor_c={{1,88},{7,125},{17,150}},
	damage_factor_e={{1,75},{7,113},{17,135}},
	damage_factor_x={{1,100},{3,138},{4,125},{5,144},{6,138},{7,150},{17,180}},
	damage_factor_f={{1,50},{7,125},{17,250}},
	},
	{magic="damage_knockback",
	damage_factor_z={{1,4},{17,4}},
	},
	{magic="damage_ignore_rebound_per",
	damage_factor_z={{1,67},{17,67}},
	},
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--���ܵȼ����״̬ħ������
	{
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
