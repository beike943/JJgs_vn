--����: ���ǹ�ķ�

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
	{magic="state_attack_speed_add",
	damage_factor_z={{1,10},{10,35}},
	},
	{magic="state_magic_parmor_poi_add",
	damage_factor_z={{1,0},{2,1},{10,5}},
	},
	{magic="state_life_restore_per10s",
	damage_factor_z={{1,20},{9,100},{10,120}},
	},
	{magic="state_physicalwound_per_add",
	damage_factor_z={{1,0},{2,0},{3,5},{9,20},{10,25}},
	},
	{magic="state_weapon_limit",
	damage_factor_z={{1,64},{10,64}},
	},
	{magic="state_physical_parmor_per_dec",
	damage_factor_z={{1,5},{10,5}},
	},
	{magic="state_magic_parmor_per_dec",
	damage_factor_z={{1,10},{10,10}},
	},
	{magic="state_desterity_dodge_per_add",
	damage_factor_z={{1,-50},{10,-50}},
	},
	{magic="state_observe_perfdodge_add",
	damage_factor_z={{1,-50},{10,-50}},
	},
	{magic="state_energy_neili_per_add",
	damage_factor_z={{1,100},{10,100}},
	},
	{magic="state_mounting_speed_add",
	damage_factor_z={{1,100},{3,160},{4,200},{6,260},{7,300},{9,360},{10,400}},
	},
	{magic="state_abrade_attack_interval",
	damage_factor_z={{1,2},{10,2}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
