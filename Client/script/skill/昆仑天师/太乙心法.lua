--����: ̫���ķ�

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
	{magic="state_neili_restore_per10s",
	damage_factor_z={{1,40},{9,120},{10,140},{20,140}},
	},
	{magic="state_neili_max_percent_add",
	damage_factor_z={{1,1},{10,10},{20,10}},
	},
	{magic="state_life_max_point_add",
	damage_factor_z={{1,0},{10,0},{11,500},{20,5000}}
	},
	{magic="state_magicwound_per_add",
	damage_factor_z={{1,0},{2,0},{3,5},{9,20},{10,25},{20,25}},
	},
	{magic="state_weapon_limit",
	damage_factor_z={{1,4},{20,4}},
	},
	{magic="state_physical_parmor_per_dec",
	damage_factor_z={{1,20},{20,20}},
	},
	{magic="state_magic_parmor_per_add",
	damage_factor_z={{1,10},{20,10}},
	},
	{magic="state_medica_neili_effect_add",
	damage_factor_z={{1,2400},{20,2400}},
	},
	{magic="state_yin_damage_per",
	damage_factor_z={{1,100},{20,100}},
	},
	{magic="state_observe_perfdodge_add",
	damage_factor_z={{1,-100},{20,-100}},
	},
	{magic="state_perfect_dodge_rate",
	damage_factor_z={{1,14},{20,14}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
