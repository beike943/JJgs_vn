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
	{magic="state_neili_restore_per10s",
	damage_factor_z={{1,15},{9,55},{10,65}},
	},
	{magic="state_desterity_dodge_per_add",
	damage_factor_z={{1,13},{10,40}},
	},
	{magic="state_magicwound_per_add",
	damage_factor_z={{1,0},{2,0},{3,5},{9,20},{10,25}},
	},
	{magic="state_weapon_limit",
	damage_factor_z={{1,1024},{10,1024}},
	},
	{magic="state_physical_parmor_per_dec",
	damage_factor_z={{1,20},{10,20}},
	},
	{magic="state_magic_parmor_per_dec",
	damage_factor_z={{1,10},{10,10}},
	},
	{magic="state_convert_common_attack",
	damage_factor_z={{1,655361},{10,655361}},
	},
	{magic="state_medica_neili_effect_add",
	damage_factor_z={{1,900},{10,900}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
