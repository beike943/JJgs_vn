--����: ��ɱ��

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_sub_skill1_probability",{{1,0},{2,10},{7,15}}},
	{"skill_sub_skill1_factor",{{1,0},{2,10},{7,20}}},
	{"skill_effect_persist_time",{{1,4},{7,4}}},
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
	{magic="damage_life",
	damage_factor_x={{1,260},{7,500}},
	damage_factor_e={{1,100},{7,400}},
	probability_factor_b={{1,20},{7,20}},
	probability_factor_x={{1,100},{7,100}},
	},
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--���ܵȼ����״̬ħ������
	{
	{magic="state_add_damage_percent",
	damage_factor_z={{1,10},{7,28}},
	damage_factor_e={{1,3},{7,3}},
	damage_factor_m={{1,50},{7,50}},
	},
	{magic="state_add_damage_num",
	damage_factor_z={{1,999},{7,999}},
	},
	{magic="state_none",
	damage_factor_z={{1,10},{7,28}},
	damage_factor_e={{1,3},{7,3}},
	damage_factor_m={{1,50},{7,50}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
