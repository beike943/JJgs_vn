--����: �ù�

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_effect_persist_time",{{1,300},{5,300},{6,10},{7,60}}},
	{"skill_display_persist_time",{{1,0},{5,0},{6,0},{7,1}}},
	{"skill_cast_interval",{{1,1620},{5,1620},{6,1080},{7,540}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_mana_point",{{1,120},{5,140},{6,150},{7,150}}},
	{"cost_goods_id",{{1,1114132},{5,1114132},{6,1114133},{7,1114134}}},
	{"cost_goods_num",{{1,1},{7,1}}},
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
	{magic="state_illusion_master",
	damage_factor_z={{1,2359386},{4,2359440},{5,2359476},{6,2359476},{7,2359476}},
	},
	{magic="state_illusion_attack",
	damage_factor_z={{1,10},{5,20},{6,35},{7,25}},
	},
	{magic="state_illusion_move",
	damage_factor_z={{1,10},{5,20},{6,35},{7,25}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
