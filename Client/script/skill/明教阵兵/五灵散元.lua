--����: ����ɢԪ

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_sub_skill1_probability",{{1,0},{2,0},{3,9},{9,15},{19,15}}},
	{"skill_sub_skill1_factor",{{1,0},{2,0},{3,8},{9,20},{19,20}}},
	{"skill_sub_skill2_probability",{{1,0},{4,0},{5,1},{9,5},{19,5}}},
	{"skill_sub_skill2_factor",{{1,0},{4,0},{5,8},{9,12},{19,12}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_mana_point",{{1,12},{9,28},{19,38}}}
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--���ܵȼ�����ӵ�����
	{
	{"missle_vanish_skill_id",{{1,1112},{19,1112}}},
	{"skill_param1",{{1,9},{19,9}}},
	{"skill_param2",{{1,0},{19,0}}},
	{"missle_vanish_after_collide",{{1,1},{19,1}}},
	{"missle_damage_interval",{{1,-1},{19,-1}}},
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
	damage_factor_x={{1,100},{9,300},{19,360}},
	damage_factor_e={{1,100},{9,300},{19,360}},
	probability_factor_b={{1,20},{19,20}},
	probability_factor_x={{1,100},{19,100}},
	}
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--���ܵȼ����״̬ħ������
	{
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
