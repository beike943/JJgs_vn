--����: ������

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_valid_object",{{1,456},{6,456}}},
	{"skill_effect_persist_time",{{1,3},{3,5},{4,3},{6,5}}},
	{"skill_display_persist_time",{{1,3},{3,5},{4,3},{6,5}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_mana_point",{{1,7},{3,7},{4,10},{6,10}}}
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--���ܵȼ�����ӵ�����
	{
	{"skill_missle_num",{{1,3},{3,5},{4,3},{6,5}}},
	{"missle_param2",{{1,50},{6,50}}},
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
	{magic="state_confusion",
	damage_factor_z={{1,1},{6,1}},
	},
	{magic="state_slow",
	damage_factor_z={{1,0},{2,0},{3,10},{4,0},{5,0},{6,10}},
	},
	{magic="state_magic_parmor_poi_add",
	damage_factor_z={{1,30},{3,30},{4,0},{6,0}},
	},
	{magic="state_physical_parmor_poi_add",
	damage_factor_z={{1,30},{3,30},{4,0},{6,0}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
