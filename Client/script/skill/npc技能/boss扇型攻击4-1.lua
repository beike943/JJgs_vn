--����: BOSS���͹���4

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--���ܵȼ�����ӵ�����
	{
	{"skill_missle_num",{{1,3},{5,3},{6,8},{10,8},{11,5},{15,5},{16,8},{20,8}}},
	{"skill_param1",{{1,3},{20,3}}},
	{"skill_param2",{{1,0},{20,0}}},
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
	damage_factor_z={{1,3000},{5,6200},{6,3000},{10,6200},{11,3000},{15,6200},{16,3000},{20,6200}},
	}
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--���ܵȼ����״̬ħ������
	{
	{magic="state_slow",
	probability_factor_x={{1,20},{5,20},{6,0},{20,0}},
	},
	{magic="state_vertigo",
	probability_factor_x={{1,0},{5,0},{6,20},{10,20},{11,0},{20,0}},
	},
	{magic="state_state_sleep",
	probability_factor_x={{1,0},{10,0},{11,20},{15,20},{16,0},{20,0}},
	},
	{magic="state_attack_speed_dec",
	probability_factor_x={{1,0},{15,0},{16,20},{20,20}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
