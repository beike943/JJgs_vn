-- 跨区并服

g_nHeFuBeginDate = 20080814;	--合服开始日期，此常量暂时没意义

TSK_HEFU_JUNXIAN = 595;	--记录合服前玩家登记的军衔
TSK_HEFU_BEGINDATE = 699;	--记录本次合服的开始时间，即上面的g_nHeFuBeginDate

function HF_IsBeforeHeFu()
	return 1;
end;
