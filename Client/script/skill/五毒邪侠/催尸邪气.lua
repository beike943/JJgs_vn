--����: ��ʬа��

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_sub_skill1_probability",{{1,0},{2,0},{3,8},{4,9},{5,10},{6,12},{7,15}}},
	{"skill_sub_skill1_factor",{{1,0},{2,0},{3,10},{4,12},{5,15},{6,17},{7,20}}},
	{"skill_display_persist_time",{{1,300},{7,300}}},
	{"skill_effect_persist_time",{{1,300},{7,300}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_mana_point",{{1,19},{7,25}}},
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
	{magic="state_summon_special_attack_rate2",
	damage_factor_c={{1,3},{7,3}},
	damage_factor_d={{1,2},{7,2}},
	damage_factor_z={{1,4},{4,10},{7,10}},
	},
	{magic="state_summon_special_attack_rate3",
	damage_factor_c={{1,0},{4,0},{5,1},{7,1}},
	damage_factor_d={{1,0},{4,0},{5,1},{7,1}},
	damage_factor_z={{1,0},{4,0},{5,3},{7,5}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
