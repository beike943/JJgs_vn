--����: ���������

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_burst_time",{{1,8},{3,8},{4,12},{6,12},{7,22},{9,22}}},
	{"skill_effect_persist_time",{{1,2},{9,2}}},
	{"skill_nextskill_wait_time",{{1,6},{3,6},{4,11},{6,11},{7,16},{9,16}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--���ܵȼ�����ӵ�����
	{
	{"skill_missle_num",{{1,2},{4,3},{7,4},{9,4}}},
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
	damage_factor_x={{1,70},{9,110}},
	probability_factor_b={{1,20},{9,20}},
	probability_factor_x={{1,100},{9,100}},
	}
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--���ܵȼ����״̬ħ������
	{
	{magic="state_fetter",
	damage_factor_z={{1,1},{9,1}},
	probability_factor_x={{1,20},{9,20}},
	}
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
