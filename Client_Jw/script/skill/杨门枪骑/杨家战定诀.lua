--����: ���ս����

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_sub_skill1_probability",{{1,0},{2,0},{3,8},{4,10},{5,12},{6,15}}},
	{"skill_sub_skill1_factor",{{1,0},{2,0},{3,10},{4,13},{5,16},{6,20}}},
	{"skill_effect_persist_time",{{1,180},{6,180}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_mana_point",{{1,4},{4,5},{6,5}}}
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
	{magic="state_knockback_immune",
	damage_factor_b={{1,5},{6,10}},
	damage_factor_z={{1,10},{6,30}},
	},
	{magic="state_knockdown_immune",
	damage_factor_b={{1,7},{6,12}},
	damage_factor_z={{1,20},{6,40}},
	},
	{magic="state_attack_rate_point_add",
	damage_factor_z={{1,15},{6,90}},
	},
	{magic="state_o_defence_point_add",
	damage_factor_z={{1,10},{6,60}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}