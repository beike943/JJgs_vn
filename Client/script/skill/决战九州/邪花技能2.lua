
Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_effect_persist_time",{{1,5},{20,5}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--���ܵȼ�����ӵ�����
	{
	{"missle_vanish_after_collide",{{1,1},{20,1}}},
	{"missle_damage_interval",{{1,-1},{20,-1}}},
	{"missle_collide_range_w",{{1,35},{20,35}}},
	{"missle_collide_range_h",{{1,35},{20,35}}},
	{"missle_damage_range_w",{{1,35},{20,35}}},
	{"missle_damage_range_h",{{1,35},{20,35}}},
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
	{magic="state_block_type",
	damage_factor_z={{1,1},{20,1}},
	probability_factor_x={{1,20},{20,20}},
	},
	{magic="state_sleep",
	damage_factor_z={{1,40},{20,40}},
	probability_factor_x={{1,20},{20,20}},
	},
	{magic="state_paralysis",
	damage_factor_z={{1,40},{20,40}},
	probability_factor_x={{1,20},{20,20}},
	},
	{magic="state_confusion",
	damage_factor_z={{1,40},{20,40}},
	probability_factor_x={{1,20},{20,20}},
	},
	{magic="state_fetter",
	damage_factor_z={{1,40},{20,40}},
	probability_factor_x={{1,30},{20,30}},
	},
	{magic="state_vertigo",
	damage_factor_z={{1,40},{20,40}},
	probability_factor_x={{1,20},{20,20}},
	},
	{magic="state_slow",
	damage_factor_z={{1,50},{20,50}},
	probability_factor_x={{1,50},{20,50}},
	},
	{magic="state_burst_dec_rate",
	damage_factor_z={{1,50},{20,50}},
	probability_factor_x={{1,30},{20,30}},
	},
	{magic="state_dec_allability",
	damage_factor_z={{1,250},{20,250}},
	probability_factor_x={{1,30},{20,30}},
	},
	{magic="state_block_medicine",
	damage_factor_z={{1,1},{20,1}},
	probability_factor_x={{1,20},{20,20}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	{magic="imme_knockback",
	damage_factor_z={{1,18},{20,18}},
	probability_factor_x={{1,20},{20,20}},
	},
	{magic="imme_knockdown",
	damage_factor_z={{1,18},{20,18}},
	probability_factor_x={{1,20},{20,20}},
	},
	},
}
