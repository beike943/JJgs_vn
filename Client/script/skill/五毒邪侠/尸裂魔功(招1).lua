--����: ʬ��ħ��(��1)

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_display_persist_time",{{1,60},{7,60}}},
	{"skill_effect_persist_time",{{1,60},{7,60}}},
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
	{magic="state_confusion_immune",
	damage_factor_z={{1,30},{7,30}},
	},
	{magic="state_sleep_immune",
	damage_factor_z={{1,30},{7,30}},
	},
	{magic="state_vertigo_immune",
	damage_factor_z={{1,30},{7,30}},
	},
	{magic="state_fast_recovery",
	damage_factor_z={{1,50},{7,50}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
