--����: ���

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_effect_persist_time",{{1,300},{8,300},{9,60},{10,15}}},
	{"skill_display_persist_time",{{1,0},{9,0},{10,1}}},
	{"skill_cast_interval",{{1,54},{8,54},{9,270},{10,54}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_mana_point",{{1,86},{8,100},{9,110},{10,120}}},
	{"cost_goods_id",{{1,1114138},{8,1114138},{9,1114139},{10,1114140}}},
	{"cost_goods_num",{{1,1},{10,1}}},
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
	{magic="state_strength_add_percent",
	damage_factor_z={{1,1},{8,8},{9,10},{10,9}},
	},
	{magic="state_vitality_add_percent",
	damage_factor_z={{1,1},{8,8},{9,10},{10,9}},
	},
	{magic="state_energy_add_percent",
	damage_factor_z={{1,1},{8,8},{9,10},{10,9}},
	},
	{magic="state_dexterity_add_percent",
	damage_factor_z={{1,1},{8,8},{9,10},{10,9}},
	},
	{magic="state_observe_add_percent",
	damage_factor_z={{1,1},{8,8},{9,10},{10,9}},
	},
	{magic="state_receive_half_damage",
	damage_factor_z={{1,3},{8,10},{9,15},{10,12}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
