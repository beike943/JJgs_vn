--����: ��˪����

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_mana_point",{{1,1},{1,1}}}
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--���ܵȼ�����ӵ�����
	{
	{"missle_collide_npc_missle",{{1,0},{1,0}}},
	},

	--ħ������

	--����ֵ:	��ͨ������ * X + (1 + ���ܵȼ� * Y) * (���� * A + ���� * B + �� * C + �ڹ� * D + ���� * E)
	--			+ �����⹦������ * F + Z
	--			(����,A,B,C,D,E,F,X,Y,ZΪ�˺�����.��Z��,������˺�����Ϊ�ٷֱ���.)

	--�ɹ�����:	(����ֵ * A + (����ȼ� - �Է��ȼ�) * B + ���ܵȼ� * C) * D + X
	--			(����,A,B,C,D,XΪ��������.��X��,�������������Ϊ�ٷֱ���.)

	SKILL_MAGIC_DAMAGE_ATTRIB =	--���ܵȼ�����˺�ħ������
	{
	{magic="damage_life_monster",
	damage_factor_a={{1,400},{1,400}},
	damage_factor_b={{1,400},{1,400}},
	damage_factor_c={{1,400},{1,400}},
	damage_factor_d={{1,400},{1,400}},
	damage_factor_e={{1,400},{1,400}},
	probability_factor_b={{1,20},{1,20}},
	probability_factor_x={{1,100},{1,100}},
	},
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--���ܵȼ����״̬ħ������
	{
	{magic="state_add_damage_percent",
	damage_factor_z={{1,50},{1,50}},
	damage_factor_m={{1,50},{1,50}},
	probability_factor_b={{1,20},{1,20}},
	probability_factor_x={{1,100},{1,100}},
	},
	{magic="state_add_damage_num",
	damage_factor_z={{1,10},{1,10}},
	},
	{magic="state_none",
	damage_factor_z={{1,50},{1,50}},
	damage_factor_m={{1,50},{1,50}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
