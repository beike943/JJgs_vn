--����: ��Ӱ�ķ�

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
	damage_factor_z={{1,6},{10,60},{20,60}},
	},
	{magic="state_weapon_limit",
	damage_factor_z={{1,16384},{20,16384}},
	},
	{magic="state_physicalwound_per_add",
	damage_factor_z={{1,25},{20,25}},
	},
	{magic="state_physical_parmor_per_dec",
	damage_factor_z={{1,20},{20,20}},
	},
	{magic="state_magic_parmor_per_dec",
	damage_factor_z={{1,10},{20,10}},
	},
	{magic="state_medica_neili_effect_add",
	damage_factor_z={{1,200},{20,200}},
	},
	{magic="state_max_gas_limit",
	damage_factor_z={{1,10},{20,10}},
	},
	{magic="state_observe_perfdodge_add",
	damage_factor_z={{1,-100},{20,-100}},
	},
	{magic="state_perfect_dodge_rate",
	damage_factor_z={{1,39},{20,39}},
	},
	{magic="state_life_max_point_add",
	damage_factor_z={{1,0},{10,0},{11,750},{20,7500}}
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
