--����: ��ҹ˼

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_display_persist_time",{{1,0},{3,0},{4,1},{6,1}}},
	{"skill_valid_object",{{1,456},{6,456}}},
	{"skill_effect_persist_time",{{1,2},{6,2}}}
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--���ܵȼ�����ӵ�����
	{
	{"missle_vanish_after_collide",{{1,1},{6,1}}},
	{"missle_damage_interval",{{1,99},{6,99}}},
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
	{magic="state_p_attack_percent_dec",
	damage_factor_c={{1,6},{3,8},{4,5},{6,7}},
	damage_factor_z={{1,15},{3,35},{4,10},{6,30}},
	},
	{magic="state_m_attack_percent_dec",
	damage_factor_c={{1,6},{3,8},{4,5},{6,7}},
	damage_factor_z={{1,15},{3,35},{4,10},{6,30}},
	},
	{magic="state_sleep",
	damage_factor_z={{1,1},{6,1}},
	probability_factor_b={{1,0},{3,0},{4,1},{6,1}},
	probability_factor_x={{1,0},{3,0},{4,6},{6,10}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
