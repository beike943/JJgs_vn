--����: ɱ��
Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_effect_persist_time",{{1,300},{17,300}}},
	{"skill_display_persist_time",{{1,300},{17,300}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_mana_point",{{1,8},{17,8}}}
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
	{magic="state_i_defence_point_add",
	damage_factor_e={{1,75},{7,75},{17,105}},
	},
	{magic="state_attack_rate_point_add",
	damage_factor_e={{1,100},{17,100}},
	damage_factor_z={{1,100},{7,200},{17,700}},
	},
	{magic="state_vertigo_immune",
	damage_factor_z={{1,25},{17,25}},
	},
	{magic="state_confusion_immune",
	damage_factor_z={{1,25},{17,25}},
	},
	{magic="state_sleep_immune",
	damage_factor_z={{1,25},{17,25}},
	},
	{magic="state_fast_recovery",
	damage_factor_z={{1,10},{7,70},{17,70}},
	},
	{magic="state_npc_event_2_magic",
	damage_factor_z={{1,6553653},{17,6553653}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
