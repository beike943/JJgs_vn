--����: ���������

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_sub_skill1_probability",{{1,0},{3,0},{4,8},{8,12},{9,15}}},
	{"skill_sub_skill1_factor",{{1,0},{3,0},{4,10},{8,18},{9,20}}},
	{"skill_effect_persist_time",{{1,10},{9,10}}},
	{"skill_display_persist_time",{{1,1},{3,3},{4,1},{6,3},{7,1},{9,3}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_mana_point",{{1,4},{3,4},{4,7},{6,7},{7,10},{9,10}}}
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--���ܵȼ�����ӵ�����
	{
	{"missle_damage_interval",{{1,-1},{9,-1}}},
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
	{magic="common_probability",
	probability_factor_b={{1,20},{10,20}},
	probability_factor_x={{1,100},{10,100}},
	},
	{magic="state_lost_life_per18",
	damage_factor_x={{1,10},{9,30}},
	},
	{magic="state_lost_life_per18_monster",
	damage_factor_x={{1,40},{9,100}},
	},
	{magic="state_lost_life_per18_summon",
	damage_factor_x={{1,100},{9,300}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
