--����: �߱������ķ�(��)

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_gaslimit",{{1,1},{10,10}}},
	{"skill_effect_persist_time",{{1,9999},{10,9999}}},
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
	{magic="state_convert_common_attack",
	damage_factor_z={{1,11468801},{10,11468810}},
	},
	{magic="state_physical_parmor_poi_add",
	damage_factor_z={{1,25},{10,25}},
	},
	{magic="state_attack_speed_add",
	damage_factor_z={{1,40},{10,40}},
	},
	{magic="state_o_defence_point_add",
	damage_factor_z={{1,25},{10,25}},
	},
	{magic="state_parmor_dec_no_effect",
	damage_factor_z={{1,20},{10,65}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	{magic="imme_agggas_point",
	damage_factor_z={{1,1},{10,1}},
	},
	{magic="imme_agggas3_neili_add",
	damage_factor_z={{1,30},{10,30}},
	},
	{magic="imme_agggas6_neili_add",
	damage_factor_z={{1,50},{10,50}},
	},
	{magic="imme_agggas10_neili_add",
	damage_factor_z={{1,50},{10,50}},
	},
	{magic="imme_gas_add_probability",
	},
	},
}