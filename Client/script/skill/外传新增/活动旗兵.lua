
Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_effect_persist_time",{{1,2},{20,2}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--���ܵȼ�����ӵ�����
	{
	{"missle_vanish_after_collide",{{1,1},{20,1}}},
	{"missle_damage_interval",{{1,17},{20,17}}},
	{"missle_collide_range_w",{{1,13},{20,13}}},
	{"missle_collide_range_h",{{1,13},{20,13}}},
	{"missle_damage_range_w",{{1,13},{20,13}}},
	{"missle_damage_range_h",{{1,13},{20,13}}},
	{"missle_damage_num",{{1,15},{20,15}}},
	{"missle_life_time",{{1,180},{20,180}}},
	{"missle_vanish_skill_id",{{1,1641},{20,1641}}},
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
	{magic="state_slow",
	damage_factor_z={{1,60},{1,60}},
	},
	{magic="state_lost_p_life_per18",
	damage_factor_z={{1,7},{20,7}},
	},
	{magic="state_block_qinggong",
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
