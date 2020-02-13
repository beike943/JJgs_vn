
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
	{"missle_collide_range_w",{{1,13},{20,13}}},
	{"missle_collide_range_h",{{1,13},{20,13}}},
	{"missle_damage_range_w",{{1,13},{20,13}}},
	{"missle_damage_range_h",{{1,13},{20,13}}},
	{"missle_life_time",{{1,3},{20,3}}},
	},

	--ħ������

	--����ֵ:	��ͨ������ * X + (1 + ���ܵȼ� * Y) * (���� * A + ���� * B + �� * C + �ڹ� * D + ���� * E)
	--			+ �����⹦������ * F + Z
	--			(����,A,B,C,D,E,F,X,Y,ZΪ�˺�����.��Z��,������˺�����Ϊ�ٷֱ���.)

	--�ɹ�����:	(����ֵ * A + (����ȼ� - �Է��ȼ�) * B + ���ܵȼ� * C) * D + X
	--			(����,A,B,C,D,XΪ��������.��X��,�������������Ϊ�ٷֱ���.)

	SKILL_MAGIC_DAMAGE_ATTRIB =	--���ܵȼ�����˺�ħ������
	{
	{magic="damage_life",
	damage_factor_z={{1,5000},{20,5000}},
	}
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--���ܵȼ����״̬ħ������
	{
	{magic="state_lost_p_life_per18",
	damage_factor_z={{1,0},{2,0},{3,0},{4,25},{5,0},{20,0}},
	},
	{magic="state_sleep",
	damage_factor_z={{1,1},{1,1}},
	probability_factor_x={{1,0},{2,100},{3,0},{4,0},{5,0},{20,0}},
	},
	{magic="state_confusion",
	damage_factor_z={{1,1},{1,1}},
	probability_factor_x={{1,0},{2,0},{3,100},{4,0},{5,0},{20,0}},
	},
	{magic="state_vertigo",
	damage_factor_z={{1,1},{1,1}},
	probability_factor_x={{1,0},{2,0},{3,0},{4,0},{5,100},{20,0}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	{magic="imme_knockback",
	damage_factor_z={{1,90},{1,90}},
	probability_factor_x={{1,100},{2,0},{3,0},{4,0},{5,0},{20,0}},
	},
	},
}
