--����: �㶾����

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_effect_persist_time",{{1,60},{5,60}}},
	{"skill_display_persist_time",{{1,60},{5,60}}},
	{"skill_valid_object",{{1,2},{2,2},{3,6},{5,6}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_mana_point",{{1,22},{5,30}}}
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
	{magic="state_quench_posion",
	damage_factor_c={{1,6},{5,6}},
	damage_factor_d={{1,8},{5,8}},
	damage_factor_y={{1,50},{2,50},{3,20},{5,20}},
	damage_factor_z={{1,30},{2,45},{3,35},{5,45}},
	probability_factor_b={{1,0},{2,0},{3,15},{5,15}},
	probability_factor_x={{1,100},{2,100},{3,75},{5,75}},
	},
	{magic="state_attack_rate_point_add",
	damage_factor_z={{1,30},{5,150}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
