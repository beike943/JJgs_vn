--����: ���Ӣ����

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_effect_persist_time",{{1,2},{6,2}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_mana_point",{{1,1},{6,1}}},
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
	{magic="state_slow_time_dec",
	damage_factor_d={{1,15},{6,15}},
	damage_factor_z={{1,20},{3,30},{6,30}},
	},
	{magic="state_attack_burst_dec_time_dec",
	damage_factor_d={{1,15},{6,15}},
	damage_factor_z={{1,20},{3,30},{6,30}},
	},
	{magic="state_confusion_time_dec",
	damage_factor_d={{1,0},{3,0},{4,15},{5,0},{6,0}},
	damage_factor_z={{1,0},{3,0},{4,30},{5,0},{6,0}},
	},
	{magic="state_sleep_time_dec",
	damage_factor_d={{1,0},{4,0},{5,15},{6,0}},
	damage_factor_z={{1,0},{4,0},{5,30},{6,0}},
	},
	{magic="state_fetter_time_dec",
	damage_factor_d={{1,0},{5,0},{6,15}},
	damage_factor_z={{1,0},{5,0},{6,30}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
