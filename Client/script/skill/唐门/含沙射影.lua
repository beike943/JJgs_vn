--����: ��ɳ��Ӱ

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_sub_skill1_probability",{{1,0},{2,0},{3,8},{4,10},{5,12},{6,15}}},
	{"skill_sub_skill1_factor",{{1,0},{2,0},{3,10},{4,13},{5,16},{6,20}}},
	{"skill_sub_skill2_probability",{{1,0},{6,5}}},
	{"skill_sub_skill2_factor",{{1,0},{6,12}}},
	{"skill_effect_persist_time",{{1,20},{6,20}}},
	{"skill_display_persist_time",{{1,20},{6,20}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_mana_point",{{1,40},{6,50}}}
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
	{magic="state_poison_damage_rebound",
	damage_factor_c={{1,4},{6,4}},
	damage_factor_d={{1,5},{6,5}},
	damage_factor_y={{1,40},{3,40},{4,20},{6,20}},
	damage_factor_z={{1,20},{6,30}},
	},
	{magic="state_poison_dec",
	damage_factor_z={{1,0},{3,0},{4,15},{6,35}},
	},
	{magic="state_dodge_rate_point_add",
	damage_factor_z={{1,300},{6,800}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
