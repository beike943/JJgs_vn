--����: ̫����

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_burst_time",{{1,55},{4,55},{5,73},{9,73},{10,91},{18,91},{19,109},{20,109}}},
	{"skill_display_persist_time",{{1,1},{4,1},{5,2},{9,2},{10,3},{18,3},{19,4},{20,4}}},
	{"skill_need_practice",{{1,0},{4,0},{5,1},{9,1},{10,0},{20,0}}},
	{"skill_level_practice",{{1,0},{5,0},{6,100},{10,100},{11,0},{20,0}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_momentum",{{1,5},{2,6},{10,6},{11,8},{15,8},{16,10},{20,10}}},
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--���ܵȼ�����ӵ�����
	{
	{"missle_vanish_skill_id",{{1,553},{20,553}}},
	{"skill_param1",{{1,9},{20,9}}},
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
	{magic="damage_life_monster",
	damage_factor_z={{1,2000},{9,3600},{10,4000},{20,4000}},
	},
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--���ܵȼ����״̬ħ������
	{
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	{magic="imme_life_percent_damage",
	damage_factor_z={{1,14},{9,22},{10,25},{20,25}},
	},
	},
}
