--����: ����˲��

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_sub_skill1_probability",{{1,0},{2,8},{3,10},{4,12},{5,15},{10,15}}},
	{"skill_sub_skill1_factor",{{1,0},{2,10},{3,13},{4,16},{5,20},{10,20}}},
	{"skill_cast_interval",{{1,270},{10,108}}},
	{"skill_use_range",{{1,330},{10,600}}},
	{"skill_gaslimit",{{1,-10},{10,-10}}},
	{"skill_effect_persist_time",{{1,1},{10,1}}},
	{"skill_display_persist_time",{{1,1},{10,1}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_mana_point",{{1,3},{10,3}}}
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
	{magic="damage_go_near",
	},
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--���ܵȼ����״̬ħ������
	{
	{magic="state_fetter",
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
