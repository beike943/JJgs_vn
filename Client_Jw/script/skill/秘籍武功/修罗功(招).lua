--����: ���޹�(��)

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_effect_persist_time",{{1,10},{10,10}}}
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
	damage_factor_z={{1,20},{10,50}},
	},
	{magic="state_m_attack_percent_add",
	damage_factor_z={{1,20},{10,50}},
	},
	{magic="state_magic_parmor_poi_dec",
	damage_factor_z={{1,100},{9,60},{10,50}},
	},
	{magic="state_physical_parmor_poi_dec",
	damage_factor_z={{1,100},{9,60},{10,50}},
	},
	{magic="state_move_speed_percent_add",
	damage_factor_z={{1,10},{4,10},{5,15},{8,15},{9,20},{10,20}},
	},
	{magic="state_cost_mana_percent_add",
	damage_factor_z={{1,33},{10,33}},
	},
	{magic="state_critical_hit_rate",
	damage_factor_z={{1,25},{10,25}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
