--����: ϴ�辭

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_effect_persist_time",{{1,30},{20,30}}},
	{"skill_burst_time",{{1,126},{4,126},{5,144},{8,144},{9,162},{11,162},{12,180},{13,180},{14,198},{15,198},{16,216},{17,216},{18,234},{19,252},{20,270}}},
	{"skill_need_practice",{{1,0},{4,0},{5,1},{9,1},{10,0},{20,0}}},
	{"skill_level_practice",{{1,0},{5,0},{6,100},{10,100},{11,0},{20,0}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_momentum",{{1,5},{2,6},{10,6},{11,8},{15,8},{16,10},{20,10}}},
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--���ܵȼ�����ӵ�����
	{
	{"missle_vanish_after_collide",{{1,1},{20,1}}},
	{"missle_damage_interval",{{1,36},{20,36}}},
	},

	--ħ������

	--����ֵ:	��ͨ������ * X + (1 + ���ܵȼ� * Y) * (���� * A + ���� * B + �� * C + �ڹ� * D + ���� * E)
	--			+ �����⹦������ * F + Z
	--			(����,A,B,C,D,E,F,X,Y,ZΪ�˺�����.��Z��,������˺�����Ϊ�ٷֱ���.)

	--�ɹ�����:	(����ֵ * A + (����ȼ� - �Է��ȼ�) * B + ���ܵȼ� * C) * D + X
	--			(����,A,B,C,D,XΪ��������.��X��,�������������Ϊ�ٷֱ���.)

	SKILL_MAGIC_DAMAGE_ATTRIB =	--���ܵȼ�����˺�ħ������
	{
	{magic="damage_life_monster",
	damage_factor_z={{1,2000},{9,2800},{10,3000},{20,5000}},
	},
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--���ܵȼ����״̬ħ������
	{
	{magic="state_physical_parmor_per_dec",
	damage_factor_z={{1,20},{5,40},{20,40}},
	},
	{magic="state_magic_parmor_per_dec",
	damage_factor_z={{1,20},{5,40},{20,40}},
	},
	{magic="state_physical_def_point_dec",
	damage_factor_z={{1,0},{11,60},{15,100},{20,100}},
	},
	{magic="state_neili_defence_point_dec",
	damage_factor_z={{1,0},{11,60},{15,100},{20,100}},
	},
	{magic="state_slow",
	damage_factor_z={{1,0},{15,0},{16,5},{17,5},{18,10},{19,15},{20,15}},
	},
	{magic="state_damage0_add",
	damage_factor_z={{1,0},{5,0},{6,100},{20,1500}},
	},
	{magic="state_imme0_add",
	damage_factor_z={{1,0},{5,0},{6,1},{10,2},{13,3},{16,4},{19,5},{20,5}},
	},
	{magic="state_state0_add",
	damage_factor_z={{1,0},{5,0},{6,2},{10,10},{20,10}},
	},
	{magic="state_state4_add",
	damage_factor_z={{1,0},{16,0},{17,5},{19,15},{20,10}},
	},
	{magic="state_state2_add",
	damage_factor_z={{1,0},{10,0},{11,10},{15,50},{20,50}},
	},
	{magic="state_state3_add",
	damage_factor_z={{1,0},{10,0},{11,10},{15,50},{20,50}},
	},
	{magic="state_state1_add",
	damage_factor_z={{1,0},{5,0},{6,2},{10,10},{20,10}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	{magic="imme_life_percent_damage",
	damage_factor_z={{1,8},{3,8},{4,9},{7,9},{8,10},{20,10}},
	},
	},
}
