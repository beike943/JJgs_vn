--����: ���Ŷ�(��)

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_effect_persist_time",{{1,15},{2,15}}},
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
	{magic="state_paralysis_immune",
	damage_factor_z={{1,100},{2,100}},
	},
	{magic="state_vertigo_immune",
	damage_factor_z={{1,100},{2,100}},
	},
	{magic="state_fetter_immune",
	damage_factor_z={{1,100},{2,100}},
	},
	{magic="state_confusion_immune",
	damage_factor_z={{1,100},{2,100}},
	},
	{magic="state_sleep_immune",
	damage_factor_z={{1,100},{2,100}},
	},
	{magic="state_attack_burst_dec_immune",
	damage_factor_z={{1,100},{2,100}},
	},
	{magic="state_slow_immune",
	damage_factor_z={{1,100},{2,100}},
	},
	{magic="state_knockdown_immune",
	damage_factor_z={{1,100},{2,100}},
	},
	{magic="state_knockback_immune",
	damage_factor_z={{1,100},{2,100}},
	},
	{magic="state_fast_recovery",
	damage_factor_z={{1,100},{2,100}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
