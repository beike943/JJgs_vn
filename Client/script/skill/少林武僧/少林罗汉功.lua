--����: �����޺���

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
	{magic="state_life_restore_per10s",
	damage_factor_z={{1,10},{10,55}},
	},
	{magic="state_neili_restore_per10s",
	damage_factor_z={{1,15},{10,60}},
	},
	{magic="state_physicalwound_per_add",
	damage_factor_z={{1,0},{2,0},{3,5},{9,20},{10,25}},
	},
	{magic="state_weapon_limit",
	damage_factor_z={{1,1},{10,1}},
	},
	{magic="state_medica_neili_effect_add",
	damage_factor_z={{1,1700},{10,1700}},
	},
	{magic="state_life_max_point_add",
	damage_factor_z={{1,350},{10,800}},
	},
	{magic="state_abrade_attack_interval",
	damage_factor_z={{1,3},{10,3}},
	},
	{magic="state_max_gas_limit",
	damage_factor_z={{1,20},{20,20}},
	},

	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
