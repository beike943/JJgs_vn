--����: ���־�

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_effect_persist_time",{{1,8},{7,8}}},
	{"skill_display_persist_time",{{1,8},{7,8}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_mana_point",{{1,5},{5,6},{7,6}}}
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
	{magic="damage_thieve_item",
	damage_factor_z={{1,30},{6,65},{7,75}},
	damage_factor_e={{1,5},{7,5}},
	probability_factor_b={{1,1},{7,1}},
	probability_factor_x={{1,10},{7,10}},
	},
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--���ܵȼ����״̬ħ������
	{
	{magic="common_probability",
	probability_factor_b={{1,20},{7,20}},
	probability_factor_x={{1,100},{7,100}},
	},
	{magic="state_p_attack_percent_dec",
	damage_factor_z={{1,10},{5,15},{7,15}},
	},
	{magic="state_m_attack_percent_dec",
	damage_factor_z={{1,10},{5,15},{7,15}},
	},
	{magic="state_slow",
	damage_factor_z={{1,10},{2,10},{3,15},{6,15},{7,20}},
	},
	{magic="state_dodge_rate_percent_add",
	damage_factor_z={{1,0},{2,-5},{3,-5},{4,-10},{5,-10},{6,-15},{7,-20}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
