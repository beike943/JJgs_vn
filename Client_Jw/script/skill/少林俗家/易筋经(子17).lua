--����: �׽(��17)

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_effect_persist_time",{{1,30},{20,30}}},
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
	{magic="state_o_defence_point_add",
	damage_factor_z={{1,55},{10,100},{20,100}},
	},
	{magic="state_i_defence_point_add",
	damage_factor_z={{1,55},{10,100},{20,100}},
	},
	{magic="state_immune",
	damage_factor_z={{1,5},{20,5}},
	},
	{magic="state_reduce_damage_num",
	damage_factor_z={{1,0},{17,0},{18,9999},{20,9999}},
	},
	{magic="state_reduce_damage_percent",
	damage_factor_z={{1,0},{17,0},{18,1},{20,3}},
	},
	{magic="state_slow_when_lose_hp",
	damage_factor_z={{1,5},{20,5}},
	},
	{magic="state_attack_burst_dec_when_lose_hp",
	damage_factor_z={{1,5},{20,5}},
	},
	{magic="state_p_attack_percent_add",
	damage_factor_z={{1,0},{10,0},{11,3},{19,4},{20,5}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
