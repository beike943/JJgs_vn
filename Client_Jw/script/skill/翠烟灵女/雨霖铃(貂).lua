--技能: 雨霖铃(貂)

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	{"skill_effect_persist_time",{{1,3},{1,3}}},
	{"skill_display_persist_time",{{1,3},{1,3}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--技能等级相关消耗属性
	{
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--技能等级相关子弹属性
	{
	{"missle_vanish_after_collide",{{1,1},{1,1}}},
	{"missle_damage_interval",{{1,18},{1,18}}},
	{"missle_collide_npc_missle",{{1,0},{1,0}}},
	},

	--魔法属性

	--属性值:	普通攻击力 * X + (1 + 技能等级 * Y) * (力量 * A + 根骨 * B + 身法 * C + 内功 * D + 洞察 * E)
	--			+ 武器外功攻击点 * F + Z
	--			(其中,A,B,C,D,E,F,X,Y,Z为伤害因素.除Z外,其余各伤害因素为百分比数.)

	--成功几率:	(属性值 * A + (自身等级 - 对方等级) * B + 技能等级 * C) * D + X
	--			(其中,A,B,C,D,X为几率因素.除X外,其余各几率因素为百分比数.)

	SKILL_MAGIC_DAMAGE_ATTRIB =	--技能等级相关伤害魔法属性
	{
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--技能等级相关状态魔法属性
	{
	{magic="state_poison_damage",
	damage_factor_a={{1,360},{1,360}},
	damage_factor_b={{1,360},{1,360}},
	damage_factor_c={{1,360},{1,360}},
	damage_factor_d={{1,360},{1,360}},
	damage_factor_e={{1,360},{1,360}},
	probability_factor_b={{1,20},{1,20}},
	probability_factor_x={{1,100},{1,100}},
	},
	{magic="state_add_damage_percent",
	damage_factor_z={{1,50},{1,50}},
	damage_factor_m={{1,50},{1,50}},
	probability_factor_b={{1,20},{1,20}},
	probability_factor_x={{1,100},{1,100}},
	},
	{magic="state_add_damage_num",
	damage_factor_z={{1,10},{1,10}},
	},
	{magic="state_none",
	damage_factor_z={{1,50},{1,50}},
	damage_factor_m={{1,50},{1,50}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	},
}