--����: ��ɱ��

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_sub_skill1_probability",{{1,0},{2,10},{7,15},{17,15}}},
	{"skill_sub_skill1_factor",{{1,0},{2,10},{7,20},{17,20}}},
	{"skill_effect_persist_time",{{1,4},{17,4}}},
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
	damage_factor_x={{1,260},{7,500},{17,600}},
	damage_factor_e={{1,100},{7,400},{17,480}},
	probability_factor_b={{1,20},{17,20}},
	probability_factor_x={{1,100},{17,100}},
	},
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--���ܵȼ����״̬ħ������
	{
	{magic="state_add_damage_percent",
	damage_factor_z={{1,15},{7,40},{17,50}},
	damage_factor_m={{1,50},{17,55}},
	},
	{magic="state_add_damage_num",
	damage_factor_z={{1,999},{17,999}},
	},
	{magic="state_none",
	damage_factor_z={{1,15},{7,40},{17,50}},
	damage_factor_m={{1,50},{17,50}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
