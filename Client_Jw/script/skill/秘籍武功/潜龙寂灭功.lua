--����: Ǳ������

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_sub_skill1_probability",{{1,0},{4,0},{5,8},{8,11},{10,15}}},
	{"skill_sub_skill1_factor",{{1,0},{4,0},{5,10},{7,18},{10,33}}},
	{"skill_effect_persist_time",{{1,30},{10,30}}},
	{"skill_display_persist_time",{{1,5},{3,5},{4,10},{6,10},{7,15},{9,15},{10,20}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_mana_point",{{1,110},{10,200}}}
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
	{magic="state_retrusive_rate_add",
	damage_factor_z={{1,1},{9,5},{10,5}},
	},
	{magic="state_knockback_immune",
	damage_factor_z={{1,5},{10,20}},
	},
	{magic="state_i_defence_point_add",
	damage_factor_z={{1,65},{9,185},{10,250}},
	},
	{magic="state_slow_attack",
	damage_factor_z={{1,327730},{3,327730},{4,655410},{6,655410},{7,983090},{9,983090},{10,1310770}},
	},
	{magic="state_confusion_immune",
	damage_factor_z={{1,15},{10,45}},
	},
	{magic="state_sleep_immune",
	damage_factor_z={{1,15},{10,45}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
