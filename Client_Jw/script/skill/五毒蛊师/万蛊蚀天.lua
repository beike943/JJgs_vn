--����: ���ʴ��

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_effect_persist_time",{{1,1},{8,1}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_mana_point",{{1,250},{8,320}}},
	{"cost_goods_id",{{1,1114113},{8,1114113}}},
	{"cost_goods_num",{{1,5},{8,5}}},
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--���ܵȼ�����ӵ�����
	{
	{"missle_vanish_after_collide",{{1,1},{8,1}}},
	{"missle_damage_interval",{{1,18},{8,18}}},
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
	{magic="state_lost_life_per18",
	damage_factor_x={{1,35},{8,60}},
	damage_factor_e={{1,50},{8,70}},
	damage_factor_z={{1,150},{8,220}},
	probability_factor_b={{1,20},{8,20}},
	probability_factor_x={{1,100},{8,100}},
	},
	{magic="state_bleeding",
	probability_factor_b={{1,20},{8,20}},
	probability_factor_x={{1,65},{8,100}},
	},
	{magic="state_lost_life_per18_monster",
	damage_factor_x={{1,70},{8,120}},
	damage_factor_e={{1,100},{8,140}},
	damage_factor_z={{1,300},{8,440}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
