--����: ��а������

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_burst_time",{{1,127},{5,199}}},
	{"skill_display_persist_time",{{1,6},{5,10}}},
	{"skill_effect_persist_time",{{1,6},{5,10}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_mana_point",{{1,80},{5,100}}},
	{"cost_mana_per_second",{{1,11},{5,15}}}
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
	{magic="state_obsorb_life_point",
	damage_factor_c={{1,200},{5,600}},
	damage_factor_d={{1,60},{5,100}},
	damage_factor_z={{1,120},{5,200}},
	},
	{magic="state_obsorb_life_per",
	damage_factor_z={{1,50},{5,50}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
