--����: ������

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_sub_skill1_probability",{{1,0},{5,0},{6,1},{10,5},{20,5}}},
	{"skill_sub_skill1_factor",{{1,0},{4,0},{5,1},{6,2},{10,10},{20,10}}},
	{"skill_effect_persist_time",{{1,300},{20,300}}},
	{"skill_display_persist_time",{{1,300},{20,300}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_mana_point",{{1,5},{10,50},{20,100}}}
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
	{magic="state_armor_add",
	damage_factor_z={{1,3},{10,30},{20,60}},
	},
	{magic="state_life_percent_per10s_anytime",
	damage_factor_z={{1,1},{10,5},{20,10}},
	},
	{magic="state_fast_recovery",
	damage_factor_b={{1,1},{10,10},{20,20}},
	},
	{magic="state_none",
	damage_factor_b={{1,60},{10,150},{20,200}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
