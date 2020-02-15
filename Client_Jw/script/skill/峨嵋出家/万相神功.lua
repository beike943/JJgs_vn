--����: ������

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_effect_persist_time",{{1,30},{20,30}}},
	{"skill_need_practice",{{1,0},{4,0},{5,1},{9,1},{10,0},{20,0}}},
	{"skill_level_practice",{{1,0},{5,0},{6,100},{10,100},{11,0},{20,0}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_momentum",{{1,5},{2,6},{10,6},{11,8},{15,8},{16,10},{20,10}}},
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
	{magic="state_skill_caused_stand_change",
	damage_factor_z={{1,522},{20,522}},
	},
	{magic="state_skill_caused_move_change",
	damage_factor_z={{1,522},{20,522}},
	},
	{magic="state_diffuse_skill_effect",
	damage_factor_z={{1,34209793},{20,34209812}},
	},
	{magic="state_diffuse_skill_effect",
	damage_factor_z={{1,34275329},{20,34275348}},
	},
	{magic="state_physical_parmor_poi_add",
	damage_factor_z={{1,0},{10,0},{11,5},{13,5},{14,10},{16,10},{17,15},{18,15},{19,20},{20,20}},
	},
	{magic="state_magic_parmor_poi_add",
	damage_factor_z={{1,0},{10,0},{11,5},{13,5},{14,10},{16,10},{17,15},{18,15},{19,20},{20,20}},
	},
	{magic="state_physical_damage_absorb",
	damage_factor_z={{1,500},{10,5000},{20,5000}},
	},
	{magic="state_magic_damage_absorb",
	damage_factor_z={{1,500},{10,5000},{20,5000}},
	},
	{magic="state_immune",
	damage_factor_z={{1,20},{10,50},{20,100}},
	},
	{magic="state_move_speed_percent_add",
	damage_factor_z={{1,0},{15,0},{16,10},{17,10},{18,20},{19,20},{20,30}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}