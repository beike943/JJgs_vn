--����: ����״̬

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_effect_persist_time",{{1,3},{10,3}}},
	{"skill_display_persist_time",{{1,3},{10,3}}},
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
	{magic="state_dec_allability",
	damage_factor_z={{1,4},{10,40}},
	damage_factor_e={{1,8},{10,8}},
	damage_factor_m={{1,100},{10,100}},
	},
	{magic="state_slow",
	damage_factor_z={{1,3},{10,30}},
	damage_factor_e={{1,6},{10,6}},
	damage_factor_m={{1,80},{10,80}},
	},
	{magic="state_burst_dec_rate",
	damage_factor_z={{1,2},{10,20}},
	damage_factor_e={{1,4},{10,4}},
	damage_factor_m={{1,60},{10,60}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
