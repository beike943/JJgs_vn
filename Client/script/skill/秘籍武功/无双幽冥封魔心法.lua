--����: ��ڤ��ħ�ķ�

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
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
	{magic="state_life_link",
	damage_factor_z={{1,5},{9,25},{10,30}},
	},
	{magic="state_life_max_percent_add",
	damage_factor_z={{1,1},{3,1},{4,2},{6,2},{7,3},{9,3},{10,5}},
	},
	{magic="state_cast_technique_rate",
	damage_factor_z={{1,1},{3,1},{4,2},{6,2},{7,3},{9,3},{10,5}},
	},
	{magic="state_i_defence_point_add",
	damage_factor_z={{1,5},{10,50}},
	},
	{magic="state_o_defence_point_add",
	damage_factor_z={{1,5},{10,50}},
	},
	{magic="state_add_allability",
	damage_factor_z={{1,3},{7,21},{8,25},{10,35}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
