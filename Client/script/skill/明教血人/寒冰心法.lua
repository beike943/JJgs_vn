--����: �����ķ�

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
	damage_factor_z={{1,15},{10,60},{20,60}},
	},
	{magic="state_neili_restore_per10s",
	damage_factor_z={{1,25},{10,70},{20,70}},
	},
	{magic="state_life_max_percent_add",
	damage_factor_z={{1,1},{10,10},{20,10}},
	},
	{magic="state_magicwound_per_add",
	damage_factor_z={{1,0},{2,0},{3,5},{9,20},{10,25},{20,25}},
	},
	{magic="state_weapon_limit",
	damage_factor_z={{1,2048},{20,2048}},
	},
	{magic="state_physical_parmor_per_dec",
	damage_factor_z={{1,20},{20,20}},
	},
	{magic="state_magic_parmor_per_dec",
	damage_factor_z={{1,10},{20,10}},
	},
	{magic="state_medica_neili_effect_add",
	damage_factor_z={{1,1000},{20,1000}},
	},
	{magic="state_burst_enhance_rate",
	damage_factor_c={{1,2},{20,2}},
	damage_factor_m={{1,20},{20,20}},
	},
	{magic="state_life_max_point_add",
	damage_factor_z={{1,0},{10,0},{11,750},{20,7500}}
	},
	{magic="state_observe_perfdodge_add",
	damage_factor_z={{1,-100},{20,-100}},
	},
	{magic="state_perfect_dodge_rate",
	damage_factor_z={{1,4},{20,4}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
