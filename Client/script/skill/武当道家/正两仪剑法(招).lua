--����: �����ǽ���(��)

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_effect_persist_time",{{1,10},{6,10}}}
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--���ܵȼ�����ӵ�����
	{
	{"skill_param1",{{1,3},{6,3}}},
	{"skill_param2",{{1,0},{6,0}}},
	{"missle_vanish_after_collide",{{1,1},{6,1}}},
	{"missle_damage_interval",{{1,-1},{6,-1}}},
	},

	--ħ������

	--����ֵ:	��ͨ������ * X + (1 + ���ܵȼ� * Y) * (���� * A + ���� * B + �� * C + �ڹ� * D + ���� * E)
	--			+ �����⹦������ * F + Z
	--			(����,A,B,C,D,E,F,X,Y,ZΪ�˺�����.��Z��,������˺�����Ϊ�ٷֱ���.)

	--�ɹ�����:	(����ֵ * A + (����ȼ� - �Է��ȼ�) * B + ���ܵȼ� * C) * D + X
	--			(����,A,B,C,D,XΪ��������.��X��,�������������Ϊ�ٷֱ���.)

	SKILL_MAGIC_DAMAGE_ATTRIB =	--���ܵȼ�����˺�ħ������
	{
	{magic="damage_pn_attack_add",
	damage_factor_z={{1,45},{5,65},{6,75}},
	},
	{magic="damage_life",
	damage_factor_x={{1,70},{6,120}},
	},
	{magic="damage_knockback",
	damage_factor_z={{1,9},{6,9}},
	},
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--���ܵȼ����״̬ħ������
	{
	{magic="state_p_n_sign",
	damage_factor_z={{1,1},{6,1}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
