--����: ��ȴ���(��1)

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_effect_persist_time",{{1,10},{7,10}}},
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
	{magic="state_physical_parmor_poi_add",
	damage_factor_z={{1,15},{7,15}}
	},
	{magic="state_magic_parmor_poi_add",
	damage_factor_z={{1,15},{7,15}}
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	{magic="imme_revival",
	},
	{magic="imme_life_point_add",
	damage_factor_d={{1,0},{2,100},{4,300},{5,0},{7,0}},
	damage_factor_z={{1,1},{2,0},{7,0}},
	},
	{magic="imme_life_percent_add",
	damage_factor_d={{1,0},{4,0},{5,10},{7,10}},
	damage_factor_z={{1,20},{4,20},{5,35},{7,55}},
	},
	{magic="imme_mana_percent_add",
	damage_factor_d={{1,0},{2,10},{7,10}},
	damage_factor_z={{1,30},{2,40},{7,65}},
	},
	},
}
