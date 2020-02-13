--����: ����������

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_effect_persist_time",{{1,0},{3,0},{4,10},{5,0},{6,10},{7,0},{9,3}}},
	{"skill_display_persist_time",{{1,1},{9,9}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_mana_point",{{1,10},{5,20},{9,40}}},
	{"cost_goods_id",{{1,131073},{2,131073},{3,131074},{4,131074},{5,524293},{6,524293},{7,131076},{8,131077},{9,131078}}},
	{"cost_goods_num",{{1,1},{9,1}}},
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--���ܵȼ�����ӵ�����
	{
	{"missle_vanish_after_collide",{{1,0},{2,30},{3,0},{9,0}}},
	},

	--ħ������

	--����ֵ:	��ͨ������ * X + (1 + ���ܵȼ� * Y) * (���� * A + ���� * B + �� * C + �ڹ� * D + ���� * E)
	--			+ �����⹦������ * F + Z
	--			(����,A,B,C,D,E,F,X,Y,ZΪ�˺�����.��Z��,������˺�����Ϊ�ٷֱ���.)

	--�ɹ�����:	(����ֵ * A + (����ȼ� - �Է��ȼ�) * B + ���ܵȼ� * C) * D + X
	--			(����,A,B,C,D,XΪ��������.��X��,�������������Ϊ�ٷֱ���.)

	SKILL_MAGIC_DAMAGE_ATTRIB =	--���ܵȼ�����˺�ħ������
	{
	{magic="damage_reserved",
	damage_factor_c={{1,50},{9,50}},
	damage_factor_d={{1,100},{9,100}},
	damage_factor_z={{1,50},{9,50}},
	},
	{magic="damage_knockback",
	damage_factor_z={{1,0},{6,0},{7,2},{8,0},{9,0}},
	probability_factor_x={{1,0},{6,0},{7,15},{8,0},{9,0}},
	},
	{magic="damage_life",
	damage_factor_x={{1,10},{2,0},{9,0}},
	},
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--���ܵȼ����״̬ħ������
	{
	{magic="state_missle_damage_range_add",
	damage_factor_z={{1,0},{2,0},{3,2},{4,0},{9,0}},
	probability_factor_x={{1,0},{2,0},{3,20},{4,0},{9,0}},
	},
	{magic="state_p_attack_percent_dec",
	damage_factor_z={{1,0},{3,0},{4,15},{5,0},{9,0}},
	probability_factor_x={{1,0},{3,0},{4,30},{5,0},{9,0}},
	},
	{magic="state_ghost_killer",
	damage_factor_z={{1,0},{4,0},{5,1},{6,0},{9,0}},
	},
	{magic="state_physical_parmor_poi_dec",
	damage_factor_z={{1,0},{5,0},{6,15},{7,0},{9,0}},
	probability_factor_x={{1,0},{5,0},{6,30},{7,0},{9,0}},
	},
	{magic="state_quench_posion_p_add",
	damage_factor_z={{1,0},{7,0},{8,20},{9,0}},
	},
	{magic="state_paralysis",
	probability_factor_x={{1,0},{8,0},{9,15}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
