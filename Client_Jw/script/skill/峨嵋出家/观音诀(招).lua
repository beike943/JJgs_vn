--����: ������(��)

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_effect_persist_time",{{1,5},{6,5}}},
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
	{magic="state_p_attack_percent_add",
	damage_factor_z={{1,10},{3,10},{4,15},{6,15}},
	},
	{magic="state_m_attack_percent_add",
	damage_factor_z={{1,10},{3,10},{4,15},{6,15}},
	},
	{magic="state_life_per_per8f",
	damage_factor_z={{1,100},{6,100}},
	}
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	{magic="imme_life_point_add",
	damage_factor_d={{1,120},{6,120}},
	damage_factor_b={{1,100},{6,100}},
	damage_factor_f={{1,100},{6,100}},
	damage_factor_y={{1,17},{6,17}},
	damage_factor_z={{1,20},{5,100},{6,125}},
	}
	},
}
