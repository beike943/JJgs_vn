--����: BOSS��

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_effect_persist_time",{{1,10},{2,300},{3,99999999},{4,99999999},{5,99999999},{6,99999999},{7,99999999},{20,1}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
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
	{magic="state_move_speed_percent_add",
	damage_factor_z={{1,30},{2,0},{3,0},{4,0},{5,0},{6,50},{7,50},{20,0}},
	},
	{magic="state_attack_speed_add",
	damage_factor_z={{1,30},{2,0},{3,0},{4,0},{5,0},{6,30},{7,30},{20,0}},
	},
	{magic="state_burst_enhance_rate",
	damage_factor_z={{1,30},{2,0},{3,0},{4,0},{5,0},{6,30},{7,30},{20,0}},
	},
	{magic="state_p_attack_percent_add",
	damage_factor_z={{1,0},{2,0},{3,0},{4,0},{5,0},{6,0},{7,0},{20,0}},
	},
	{magic="state_m_attack_percent_add",
	damage_factor_z={{1,0},{2,0},{3,0},{4,0},{5,0},{6,0},{7,0},{20,0}},
	},
	{magic="state_magic_parmor_poi_add",
	damage_factor_z={{1,0},{2,75},{3,0},{4,0},{5,0},{6,0},{7,0},{20,0}},
	},
	{magic="state_physical_parmor_poi_add",
	damage_factor_z={{1,0},{2,0},{3,0},{4,0},{5,0},{6,0},{7,0},{20,0}},
	},
	{magic="state_o_defence_point_add",
	damage_factor_z={{1,0},{2,0},{3,2000},{4,9999},{5,3000},{6,0},{7,1000},{20,0}},
	},
	{magic="state_i_defence_point_add",
	damage_factor_z={{1,0},{2,0},{3,2000},{4,9999},{5,9999},{6,0},{7,1000},{20,0}},
	},
	{magic="state_magic_parmor_poi_dec",
	damage_factor_z={{1,0},{2,0},{3,100},{4,0},{5,100},{6,0},{7,0},{20,0}},
	},
	{magic="state_physical_parmor_poi_dec",
	damage_factor_z={{1,0},{2,0},{3,100},{4,0},{5,100},{6,0},{7,0},{20,0}},
	},
	{magic="state_physical_def_point_dec",
	damage_factor_z={{1,0},{2,0},{3,0},{4,0},{5,0},{6,0},{7,0},{20,0}},
	},
	{magic="state_neili_defence_point_dec",
	damage_factor_z={{1,0},{2,0},{3,0},{4,0},{5,0},{6,0},{7,0},{20,0}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
