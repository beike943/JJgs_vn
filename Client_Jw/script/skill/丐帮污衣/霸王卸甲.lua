--����: ����ж��

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_sub_skill1_probability",{{1,0},{2,0},{3,8},{4,9},{5,10},{6,12},{7,15}}},
	{"skill_sub_skill1_factor",{{1,0},{2,0},{3,10},{4,12},{5,15},{6,17},{7,20}}},
	{"skill_sub_skill2_probability",{{1,0},{5,0},{6,3},{7,5}}},
	{"skill_sub_skill2_factor",{{1,0},{5,0},{6,9},{7,12}}},
	{"skill_effect_persist_time",{{1,45},{7,45}}},
	{"skill_display_persist_time",{{1,45},{7,45}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_mana_point",{{1,15},{7,21}}}
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
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--���ܵȼ����״̬ħ������
	{
	{magic="common_probability",
	probability_factor_b={{1,15},{7,15}},
	probability_factor_x={{1,100},{7,100}},
	},
	{magic="state_magic_parmor_per_dec",
	damage_factor_e={{1,2},{7,4}},
	damage_factor_z={{1,5},{7,25}},
	},
	{magic="state_physical_parmor_per_dec",
	damage_factor_e={{1,2},{7,4}},
	damage_factor_z={{1,5},{7,25}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
