--消费积分反馈系统--------

--御街消费XU兑换为经验倍率
VFS_XU_TO_EXP = 10;

--御街消费XU兑换为金券倍率
VFS_XU_TO_JJ = 1;

--任务变量--------------------------
--总觉得这些值会爆表
VFS_TASK_VIP_LEVEL = 3135; --Vip等级
VFS_TASK_VIP_EXP = 3136; --Vip经验
VFS_TASK_VIP_COST = 3137; --Vip消耗
VFS_TASK_VIP_JINJUAN = 3138; --金劵值
------------------------------------

--VIP升级需求表
--关联\ui\第三版\IB_信息分页.ini[VipLevelToExp]
VFS_VIP_LEVEL_TABLE = {
	--VIP LEVEL = NEED EXP,
	[1] = 30000,
	[2] = 300000,
	[3] = 3000000,
	[4] = 30000000,
	[5] = 300000000,	
}

VFS_VIP_EXP_MAX = 1000000;
VFS_VIP_JJ_MAX = 100000;