--����: �貨΢��

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_display_persist_time",{{1,120},{10,300}}},
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
	{magic="state_accelerate",
	damage_factor_z={{1,5},{4,5},{5,10},{7,10},{8,15},{9,15},{10,20}},
	},
	{magic="state_accelerate_limit",
	damage_factor_z={{1,16},{10,43}},
	},
	{magic="state_accelerate_interval",
	damage_factor_z={{1,54},{6,54},{7,36},{10,36}},
	},
	{magic="state_shadow_run",
	damage_factor_z={{1,0},{8,0},{9,1605},{10,1610}},
	},
	{magic="state_del_skill_magic_when_stamina_exhaust",
	damage_factor_z={{1,477},{10,477}},
	},
	{magic="state_lost_stamina_per18",
	damage_factor_z={{1,2},{10,2}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
