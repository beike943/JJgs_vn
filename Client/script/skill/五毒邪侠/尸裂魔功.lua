--����: ʬ��ħ��

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_sub_skill1_probability",{{1,0},{2,0},{3,8},{4,9},{5,10},{6,12},{7,15}}},
	{"skill_sub_skill1_factor",{{1,0},{2,0},{3,10},{4,12},{5,15},{6,17},{7,20}}},
	{"skill_sub_skill2_probability",{{1,0},{5,0},{6,3},{7,5}}},
	{"skill_sub_skill2_factor",{{1,0},{5,0},{6,9},{7,12}}},
	{"skill_display_persist_time",{{1,1},{2,1},{3,2},{4,2},{5,3},{6,4},{7,5}}},
	{"skill_effect_persist_time",{{1,60},{7,60}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_mana_point",{{1,38},{7,50}}},
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
	{magic="state_p_attack_percent_add",
	damage_factor_z={{1,5},{7,20}},
	},
	{magic="state_m_attack_percent_add",
	damage_factor_z={{1,5},{7,20}},
	},
	{magic="state_physical_parmor_per_add",
	damage_factor_z={{1,5},{7,20}},
	},
	{magic="state_magic_parmor_per_add",
	damage_factor_z={{1,5},{7,20}},
	},
	{magic="state_move_speed_percent_add",
	damage_factor_z={{1,5},{7,20}},
	},
	{magic="state_death_skill",
	damage_factor_z={{1,11075585},{2,11075585},{3,11075586},{4,11075586},{5,11075587},{6,11075588},{7,11075589}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
