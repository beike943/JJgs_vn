--����: ����ħ��

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_effect_persist_time",{{1,10},{10,10},{11,11},{19,15},{20,15}}},
	{"skill_display_persist_time",{{1,40},{9,56},{10,60},{20,80}}},
	{"skill_need_practice",{{1,0},{4,0},{5,1},{9,1},{10,0},{20,0}}},
	{"skill_level_practice",{{1,0},{5,0},{6,100},{10,100},{11,0},{20,0}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_momentum",{{1,5},{2,6},{10,6},{11,8},{15,8},{16,10},{20,10}}},
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
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	{magic="imme_npc_corpse_revival",
	damage_factor_z={{1,151},{20,151}},
	},
	{magic="imme_summon_attack_add",
	damage_factor_z={{1,3900},{9,5500},{10,5900},{20,7900}},
	},
	{magic="imme_summon_speed_add",
	damage_factor_z={{1,100},{9,180},{10,200},{20,400}},
	},
	{magic="imme_summon_ai_param_1",
	damage_factor_z={{1,2000},{20,2000}},
	},
	{magic="imme_summon_ai_param_2",
	damage_factor_z={{1,1},{20,1}},
	},
	{magic="imme_summon_ai_param_3",
	damage_factor_z={{1,90},{20,90}},
	},
	{magic="imme_summon_ai_param_4",
	damage_factor_z={{1,54},{4,54},{5,72},{7,72},{8,90},{14,90},{15,108},{17,108},{18,126},{19,126},{20,144}},
	},
	},
}
