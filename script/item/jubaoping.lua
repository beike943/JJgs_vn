--聚灵鼎脚本
--by vivi
--09/14/2007

Include("\\script\\lib\\lingshi_info.lua")
Include("\\script\\lib\\lingshipeifang_info.lua")
Include("\\script\\class\\ktabfile.lua")

lingshi_pf = new(KTabFile,"\\settings\\item\\lingshipeifang.txt")
--临时变量
TT_LINGSHI_LV = 120; --记录玩家选择取出灵石的等级
TT_LINGSHI_PF_LV = 121; --记录玩家选择取出灵石配方的等级
TT_LINGSHI_CHANGE_LV = 123; --记录玩家选择兑换高级灵石时的消耗的灵石等级
TT_LSPF_CHANGE_LV = 124; --记录玩家选择兑换高级灵石配方时的消耗的灵石配方等级

--任务变量
TASK_LINGSHI_QINGLING = 2335; --对灵石负数清0处理，执行一次
TASK_PF_QINGLING = 2336; --对灵石配方负数清0处理，执行一次
--消耗随机次数权值表
tRandNum ={--属性名	id	位置	最低等级	是否随机	消耗随机次数	等级1-7权值
{"减少武功施展速度",9,2,1,0,1,1,1,1,1,2,2,2},
{"力量增加",110,2,1,0,1,1,1,1,1,2,2,2},
{"力量增加",110,0,1,0,1,1,1,1,1,2,2,2},
{"力量增加",110,1,1,0,1,1,1,1,1,2,2,2},
{"力量增加",110,3,1,0,1,1,1,1,1,2,2,2},
{"生命上限增加",11,0,1,0,3,1,1,1,1,2,2,2},
{"生命上限增加",11,1,1,0,3,1,1,1,1,2,2,2},
{"生命上限增加",11,3,1,0,3,1,1,1,1,2,2,2},
{"杀死敌人生命回复" ,333,2,1,0,2,1,1,1,1,2,2,2},
{"600秒武器耐久回复",43,2,1,1,2,1,1,1,1,2,2,2},
{"600秒上衣耐久回复",112,1,1,1,2,1,1,1,1,2,2,2},
{"600秒帽子耐久回复",113,0,1,1,2,1,1,1,1,2,2,2},
{"600秒下衣耐久回复",114,3,1,1,2,1,1,1,1,2,2,2},
{"装备需求等级减少",334,0,6,1,3,1,1,1,1,2,2,2},
{"装备需求等级减少",334,1,6,1,3,1,1,1,1,2,2,2},
{"装备需求等级减少",334,3,6,1,3,1,1,1,1,2,2,2},
{"范围攻击概率",335,2,1,0,3,1,1,1,1,2,2,2},
{"武器外攻上限增加",65,2,1,0,3,1,1,1,1,2,2,2},
{"武器外攻下限增加",66,2,1,0,3,1,1,1,1,2,2,2},
{"武器内攻上限增加",67,2,1,0,3,1,1,1,1,2,2,2},
{"武器内攻下限增加",68,2,1,0,3,1,1,1,1,2,2,2},
{"药效时间延长",39,0,1,0,2,1,1,2,2,3,3,4},
{"体力上限提高",336,1,1,0,4,1,1,2,2,3,3,4},
{"攻速提高",77,2,1,1,3,1,1,2,2,3,3,4},
{"命中值增加",337,2,1,0,4,1,1,2,2,3,3,4},
{"闪避值增加",338,3,1,0,5,1,1,2,2,3,3,4},
{"反弹伤害",339,1,1,0,5,1,1,2,2,3,3,4},
{"每10秒内力回复",340,0,5,1,5,1,1,2,2,3,3,4},
{"每10秒内力回复",340,1,5,1,5,1,1,2,2,3,3,4},
{"每10秒内力回复",340,3,5,1,5,1,1,2,2,3,3,4},
{"每10秒生命回复",341,0,5,1,5,1,1,2,2,3,3,4},
{"每10秒生命回复",341,1,5,1,5,1,1,2,2,3,3,4},
{"每10秒生命回复",341,3,5,1,5,1,1,2,2,3,3,4},
{"会心概率提高",342,2,1,0,4,1,1,2,2,3,3,4},
{"内功防御增加",343,0,1,0,4,1,1,2,2,3,3,4},
{"内功防御增加",343,1,1,0,4,1,1,2,2,3,3,4},
{"内功防御增加",343,3,1,0,4,1,1,2,2,3,3,4},
{"外功防御增加",344,0,1,0,4,1,1,2,2,3,3,4},
{"外功防御增加",344,1,1,0,4,1,1,2,2,3,3,4},
{"外功防御增加",344,3,1,0,4,1,1,2,2,3,3,4},
{"武功耗内降低",345,0,1,0,5,1,1,2,2,3,3,4},
{"发挥最大攻击概率",346,2,1,0,5,1,1,2,2,3,3,4},
{"一定概率使敌人气血受损",53,2,4,0,5,1,1,2,2,3,3,4},
{"一定概率使敌人真元受损",54,2,4,0,5,1,1,2,2,3,3,4},
{"毒伤害减少",347,0,1,0,4,1,1,2,2,3,3,4},
{"毒伤害减少",347,1,1,0,4,1,1,2,2,3,3,4},
{"毒伤害减少",347,3,1,0,4,1,1,2,2,3,3,4},
{"攻击使敌人力量减少",348,2,1,0,5,1,1,2,2,3,3,4},
{"攻击使敌人根骨减少",349,2,1,0,5,1,1,2,2,3,3,4},
{"攻击使敌人内功减少",350,2,1,0,5,1,1,2,2,3,3,4},
{"攻击使敌人洞察减少",351,2,1,0,5,1,1,2,2,3,3,4},
{"攻击使敌人身法减少",352,2,1,0,5,1,1,2,2,3,3,4},
{"攻击使敌人外防减少",353,2,1,0,5,1,1,2,2,3,3,4}, 
{"攻击使敌人内防减少",354,2,1,0,5,1,1,2,2,3,3,4},
{"受伤动作时间缩短",355,1,1,0,5,1,1,2,2,3,3,4},
{"武功打断概率降低",356,1,3,0,6,1,1,2,2,3,3,4},
{"根骨增加",357,2,1,0,5,1,1,2,2,3,3,4},
{"根骨增加",357,0,1,0,5,1,1,2,2,3,3,4},
{"根骨增加",357,1,1,0,5,1,1,2,2,3,3,4},
{"根骨增加",357,3,1,0,5,1,1,2,2,3,3,4},
{"力量增加",358,2,1,0,5,1,1,2,2,3,3,4},
{"力量增加",358,0,1,0,5,1,1,2,2,3,3,4},
{"力量增加",358,1,1,0,5,1,1,2,2,3,3,4},
{"力量增加",358,3,1,0,5,1,1,2,2,3,3,4},
{"身法增加",359,2,1,0,5,1,1,2,2,3,3,4},
{"身法增加",359,0,1,0,5,1,1,2,2,3,3,4},
{"身法增加",359,1,1,0,5,1,1,2,2,3,3,4},
{"身法增加",359,3,1,0,5,1,1,2,2,3,3,4},
{"洞察增加",360,2,1,0,5,1,1,2,2,3,3,4},
{"洞察增加",360,0,1,0,5,1,1,2,2,3,3,4},
{"洞察增加",360,1,1,0,5,1,1,2,2,3,3,4},
{"洞察增加",360,3,1,0,5,1,1,2,2,3,3,4},
{"内功增加",361,2,1,0,5,1,1,2,2,3,3,4},
{"内功增加",361,0,1,0,5,1,1,2,2,3,3,4},
{"内功增加",361,1,1,0,5,1,1,2,2,3,3,4},
{"内功增加",361,3,1,0,5,1,1,2,2,3,3,4},
{"抗中毒概率",100,0,1,0,6,1,1,2,2,3,3,4},
{"抗中毒概率",100,1,1,0,6,1,1,2,2,3,3,4},
{"抗中毒概率",100,3,1,0,6,1,1,2,2,3,3,4},
{"受伤转化内力",46,0,5,1,6,1,1,2,2,3,3,4},
{"受伤转化内力",46,1,5,1,6,1,1,2,2,3,3,4},
{"攻击损耗敌人内力",49,2,5,0,6,1,2,2,3,3,4,5},
{"破防攻击概率",362,2,5,0,7,1,2,2,3,3,4,5},
{"攻击附带毒伤害",363,2,1,0,7,1,2,2,3,3,4,5},
{"生命上限提高-%",79,2,1,0,7,1,2,2,3,3,4,5},
{"生命上限提高-%",79,0,1,0,7,1,2,2,3,3,4,5},
{"生命上限提高-%",79,1,1,0,7,1,2,2,3,3,4,5},
{"生命上限提高-%",79,3,1,0,7,1,2,2,3,3,4,5},
{"内力上限提高-%",80,2,1,0,6,1,2,2,3,3,4,5},
{"内力上限提高-%",80,0,1,0,6,1,2,2,3,3,4,5},
{"内力上限提高-%",80,1,1,0,6,1,2,2,3,3,4,5},
{"内力上限提高-%",80,3,1,0,6,1,2,2,3,3,4,5},
{"必闪",364,1,3,0,6,1,2,2,3,3,4,5},
{"攻击辅助持续时间延长",41,0,1,0,7,1,2,2,3,3,4,5},
{"攻击辅助持续时间延长",41,2,1,0,7,1,2,2,3,3,4,5},
{"攻击辅助持续时间延长",41,1,1,0,7,1,2,2,3,3,4,5},
{"攻击辅助持续时间延长",41,3,1,0,7,1,2,2,3,3,4,5},
{"防御辅助持续时间延长",42,0,1,0,7,1,2,2,3,3,4,5},
{"防御辅助持续时间延长",42,2,1,0,7,1,2,2,3,3,4,5},
{"防御辅助持续时间延长",42,1,1,0,7,1,2,2,3,3,4,5},
{"防御辅助持续时间延长",42,3,1,0,7,1,2,2,3,3,4,5},
{"攻击使敌人外防削减",382,2,1,0,7,1,2,2,3,3,4,5},
{"攻击使敌人内防削减",383,2,1,0,7,1,2,2,3,3,4,5},
{"承受伤害减半概率",365,0,5,0,7,1,2,2,3,3,4,5},
{"承受伤害减半概率",365,1,5,0,7,1,2,2,3,3,4,5},
{"承受伤害减半概率",365,3,5,0,7,1,2,2,3,3,4,5},
{"经验获得提高",366,2,5,1,5,2,2,3,3,3,4,5},
{"经验获得提高",366,0,5,1,5,2,2,3,3,3,4,5},
{"经验获得提高",366,1,5,1,5,2,2,3,3,3,4,5},
{"经验获得提高",366,3,5,1,5,2,2,3,3,3,4,5},
{"减速回避概率",373,3,4,0,8,2,2,3,3,3,4,5},
{"迟缓回避概率",374,3,4,0,8,2,2,3,3,3,4,5},
{"击退回避概率",375,3,4,0,8,2,2,3,3,3,4,5},
{"击倒回避概率",376,3,4,0,8,2,2,3,3,3,4,5},
{"麻痹回避概率",377,0,4,0,8,2,2,3,3,3,4,5},
{"眩晕回避概率",378,0,4,0,8,2,2,3,3,3,4,5},
{"定身回避概率",379,0,4,0,8,2,2,3,3,3,4,5},
{"混乱回避概率",380,1,4,0,8,2,2,3,3,3,4,5},
{"睡眠回避概率",381,1,4,0,8,2,2,3,3,3,4,5},
{"外防降低,外攻提高",18,1,1,0,8,2,2,3,3,3,4,5},
{"内防降低,内攻提高",19,1,1,0,8,2,2,3,3,3,4,5},
{"增加伤害",372,2,3,0,7,2,2,3,3,3,4,5},
{"所有属性增加",367,2,3,0,8,2,2,3,3,3,4,5},
{"所有属性增加",367,0,3,0,8,2,2,3,3,3,4,5},
{"所有属性增加",367,1,3,0,8,2,2,3,3,3,4,5},
{"所有属性增加",367,3,3,0,8,2,2,3,3,3,4,5},
{"外攻提高+ ",368,2,3,0,8,2,2,3,3,3,4,5},
{"内攻提高",369,2,3,0,8,2,2,3,3,3,4,5},
{"武功发招概率提高",370,2,4,0,8,2,2,3,3,3,4,5},
{"武功施展速度提高",371,0,3,0,8,2,2,3,3,4,5,6}
}
function OnUse()
	local strtab = {
		"提取灵石/which_lingshi",
		"提取灵石配方/which_lingshi_pf",
		"选择合成或兑换属性/zhiding_main",
		"如何兑换属性/how_change",
		"没什么/nothing"}
	Say("这鼎吸收了天地灵气,你想拿来做什么呢？",
		getn(strtab),
		strtab)
end

function which_lingshi()
	if IsBoxLocking() ~= 0 then
		Talk(1,"","先打开背包");
		return 0;
	end;
	local strtab = {};
	local tLingshiTask = {SYS_TSK_LINGSHI_ONE,SYS_TSK_LINGSHI_TWO,SYS_TSK_LINGSHI_THREE,SYS_TSK_LINGSHI_FOUR,
												SYS_TSK_LINGSHI_FIVE,SYS_TSK_LINGSHI_SIX,SYS_TSK_LINGSHI_SEVEN}
	if GetTask(TASK_LINGSHI_QINGLING) == 0 then
		for j=1,getn(tLingshiTask) do
			if GetTask(tLingshiTask[j]) < 0 then
				SetTask(tLingshiTask[j],0);
			end
		end
		SetTask(TASK_LINGSHI_QINGLING,1);
	end
	for i=1,getn(tLingshiTask) do
		if GetTask(tLingshiTask[i]) > 0 then
			tinsert(strtab,i.."(级)灵石"..GetTask(tLingshiTask[i])..". /#quchu_lingshi("..i..")");
		end
	end
	if getn(strtab) == 0 then
		Talk(1,"","目前您没有灵石");
	else
		tinsert(strtab,"返回/OnUse")
		Say("请选择你要提取的灵石",
			getn(strtab),
			strtab)
	end
end

function quchu_lingshi(nLv)	
	Say("你要提取"..nLv.."级灵石吗？",
		2,
		"是的，我想提取/#lingshi_num("..nLv..")",
		"不，我点错了/which_lingshi")
end

function lingshi_num(nLv)
	local tLingshiTask = {SYS_TSK_LINGSHI_ONE,SYS_TSK_LINGSHI_TWO,SYS_TSK_LINGSHI_THREE,SYS_TSK_LINGSHI_FOUR,
												SYS_TSK_LINGSHI_FIVE,SYS_TSK_LINGSHI_SIX,SYS_TSK_LINGSHI_SEVEN}	
	local nNum = GetTask(tLingshiTask[nLv]);
	SetTaskTemp(TT_LINGSHI_LV,nLv);
	AskClientForNumber("confirm_give_lingshi", 1, tonumber(nNum), "提取几个"..nLv.."级灵石？");
end

function confirm_give_lingshi(nCount)
	if Zgc_pub_goods_add_chk(nCount,nCount) ~= 1 then
		return
	end
	local nLv = GetTaskTemp(TT_LINGSHI_LV);
	local tLingshiTask = {SYS_TSK_LINGSHI_ONE,SYS_TSK_LINGSHI_TWO,SYS_TSK_LINGSHI_THREE,SYS_TSK_LINGSHI_FOUR,
												SYS_TSK_LINGSHI_FIVE,SYS_TSK_LINGSHI_SIX,SYS_TSK_LINGSHI_SEVEN}	
	if nCount > GetTask(tLingshiTask[nLv]) then
		return
	else
		for i=1,nCount do
			ls_AddRandomLingShi(SYS_TB_LINGSHI_MINLEVEL,nLv,nLv);
		end
		Msg2Player("你提取了"..nLv.."(级)灵石"..nCount.."个");
		if nLv >= 6 then
			WriteLog("玩家"..GetName().."得到"..nLv.."(级)灵石"..nCount.."个");
		end
		SetTask(tLingshiTask[nLv],GetTask(tLingshiTask[nLv])-nCount);
		SetTaskTemp(TT_LINGSHI_LV,0);
	end		
end

function which_lingshi_pf()
	if IsBoxLocking() ~= 0 then
		Talk(1,"","先打开背包");
		return 0;
	end;
	local strtab = {};
	local tPeifangTask = {SYS_TSK_PEIFANG_ONE,SYS_TSK_PEIFANG_TWO,SYS_TSK_PEIFANG_THREE,SYS_TSK_PEIFANG_FOUR,
												SYS_TSK_PEIFANG_FIVE,SYS_TSK_PEIFANG_SIX,SYS_TSK_PEIFANG_SEVEN}
	if GetTask(TASK_PF_QINGLING) == 0 then
		for i=1,getn(tPeifangTask) do
			if GetTask(tPeifangTask[i]) == -1 then
				SetTask(tPeifangTask[i],1);
				WriteLog("聚灵鼎错误提示:玩家"..GetName().."-减少1张"..i.."(级)灵石配方，返换数量1。")
			end
		end		
		for j=1,getn(tPeifangTask) do
			if GetTask(tPeifangTask[j]) < 0 then
				SetTask(tPeifangTask[j],0);
			end
		end
		SetTask(TASK_PF_QINGLING,1);
	end 
	for i=1,getn(tPeifangTask) do
		if GetTask(tPeifangTask[i]) > 0 then
			tinsert(strtab,i.."(级)灵石配方"..GetTask(tPeifangTask[i]).." ./#quchu_peifang("..i..")");
		end
	end
	if getn(strtab) == 0 then
		Talk(1,"","<color=green>聚灵鼎<color>:目前您没有灵石");
	else
		tinsert(strtab,"返回/OnUse")
		Say("<color=green>聚灵鼎<color>:选择你要提取的灵石配方",
			getn(strtab),
			strtab)
	end
end

function quchu_peifang(nLv)
	Say("你确定要提取"..nLv.."(级)灵石配方吗？",
		2,
		"是的，我要提取/#peifang_num("..nLv..")",
		"不，我点错了/which_lingshi_pf")	
end

function peifang_num(nLv)
	local tPeifangTask = {SYS_TSK_PEIFANG_ONE,SYS_TSK_PEIFANG_TWO,SYS_TSK_PEIFANG_THREE,SYS_TSK_PEIFANG_FOUR,
												SYS_TSK_PEIFANG_FIVE,SYS_TSK_PEIFANG_SIX,SYS_TSK_PEIFANG_SEVEN}
	local nNum = GetTask(tPeifangTask[nLv]);
	SetTaskTemp(TT_LINGSHI_PF_LV,nLv);
	AskClientForNumber("confirm_give_peifang", 1, tonumber(nNum), "提取几张"..nLv.."级灵石配方？");												
end

function confirm_give_peifang(nCount)
	if Zgc_pub_goods_add_chk(nCount,nCount) ~= 1 then
		return
	end
	local nLv = GetTaskTemp(TT_LINGSHI_PF_LV);
	local tPeifangTask = {SYS_TSK_PEIFANG_ONE,SYS_TSK_PEIFANG_TWO,SYS_TSK_PEIFANG_THREE,SYS_TSK_PEIFANG_FOUR,
												SYS_TSK_PEIFANG_FIVE,SYS_TSK_PEIFANG_SIX,SYS_TSK_PEIFANG_SEVEN}
	if nCount > GetTask(tPeifangTask[nLv]) then
		return
	else
		for i=1,nCount do
			lspf_AddRandomPeiFang(SYS_TB_LINGSHI_PF_LEVEL,nLv,nLv);
		end
		Msg2Player("你提取了"..nLv.."(级)-灵石配方"..nCount.."张");
		if nLv >= 6 then
			WriteLog("玩家"..GetName().."得到"..nLv.."(级)-灵石配方"..nCount.."张");
		end		
		SetTask(tPeifangTask[nLv],GetTask(tPeifangTask[nLv])-nCount);
		SetTaskTemp(TT_LINGSHI_PF_LV,0);															
	end
end
function zhiding_main()
	if IsBoxLocking() ~= 0 then
		Talk(1,"","先打开背包");
		return 0;
	end;
	local strtab = {
		"消耗随机次数获取指定的灵石/zhiding_lingshi",
		"消耗随机次数获取指定的灵石配方/zhiding_peifang",
		"消耗随机次数获取稀有物品（例如月华）/zhiding_yuehua",
		"我想要合成灵石和灵石配方/zhiding_gaoji",
		"返回/OnUse",
		"暂时不要/nothing"
		}
	Say("您确定使用灵石或灵石配方来获得指定珍贵物品的机会吗？",
		getn(strtab),
		strtab)
end

function zhiding_lingshi()
	local strtab = {
		"1级灵石属性/#lingshi_zhiding_lv(1)",
		"2级灵石属性/#lingshi_zhiding_lv(2)",
		"3级灵石属性/#lingshi_zhiding_lv(3)",
		"4级灵石属性/#lingshi_zhiding_lv(4)",
		"5级灵石属性/#lingshi_zhiding_lv(5)",
		"返回/zhiding_main"
		}
	Say("请选择灵石等级",
		getn(strtab),
		strtab)	
end

function lingshi_zhiding_lv(nLv)
	local strtab = {
		"帽子/#lingshi_zhiding_wz("..nLv..",0,0)",
		"衣服/#lingshi_zhiding_wz("..nLv..",1,0)",
		"武器/#lingshi_zhiding_wz("..nLv..",2,0)",
		"裤子/#lingshi_zhiding_wz("..nLv..",3,0)",
		"返回/zhiding_lingshi",
		"暂时不要/nothing"
		}
	Say("请选择灵石镶嵌的指定位置",
		getn(strtab),
		strtab)
end

function lingshi_zhiding_wz(nLv,nWz,nPage)
	local tAttri = {};
	local tIdx = {}; --对应tRandNum表的索引
	for i = 1,getn(tRandNum) do
		if tRandNum[i][3] == nWz and tRandNum[i][4] <= nLv then
			tinsert(tAttri,tRandNum[i]);
			tinsert(tIdx,i)
		end
	end
	local strtab = {};
	local nPageNum = 6;
	local nRemaid = getn(tAttri)-nPageNum*nPage;
	local nDiaNum = 6;
	if nRemaid < nDiaNum then
		nDiaNum = nRemaid;
	end
	for i = 1,nDiaNum do
		tinsert(strtab,tAttri[nPage*nPageNum+i][1].."/#confirm_lingshi_zhiding("..tAttri[nPage*nPageNum+i][2]..","..nLv..","..nWz..","..tIdx[nPage*nPageNum+i]..")");
	end
	if nPage > 0 then
		tinsert(strtab,"上一页/#lingshi_zhiding_wz("..nLv..","..nWz..","..(nPage-1)..")");
	end
	if nRemaid > 6 then
		tinsert(strtab,"下一页/#lingshi_zhiding_wz("..nLv..","..nWz..","..(nPage+1)..")");
	end
	tinsert(strtab,"返回/#lingshi_zhiding_lv("..nLv..")");
	tinsert(strtab,"暂时不要/nothing");
	Say("请选择要兑换的属性",
		getn(strtab),
		strtab);	
end

function confirm_lingshi_zhiding(nId,nLv,nWz,nIdx)
	local tWz = {"帽子","衣服","武器","裤子"};
	Say("消耗<color=yellow>"..nLv*tRandNum[nIdx][nLv+6].."<color>次"..nLv.."(级)灵石来随机获得属性<color=yellow>"..tRandNum[nIdx][1].."<color>,镶嵌在<color=yellow> "..tWz[nWz+1].."<color> "..nLv.."的灵石,你确定吗？",
		2,
		"是的，开始吧/#give_lingshi_zhiding("..nId..","..nLv..","..nWz..","..nIdx..")",
		"暂时不要/nothing")
end

function give_lingshi_zhiding(nId,nLv,nWz,nIdx)
	local nNum = nLv*tRandNum[nIdx][nLv+6];
	local tLingshiTask = {SYS_TSK_LINGSHI_ONE,SYS_TSK_LINGSHI_TWO,SYS_TSK_LINGSHI_THREE,SYS_TSK_LINGSHI_FOUR,
												SYS_TSK_LINGSHI_FIVE,SYS_TSK_LINGSHI_SIX,SYS_TSK_LINGSHI_SEVEN}		
	if GetTask(tLingshiTask[nLv]) < nNum then
		Talk(1,"","你没有足够的随机次数来合成你需要的灵石");
		return
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	SetTask(tLingshiTask[nLv],GetTask(tLingshiTask[nLv])-nNum);
	AddLingShi(nId,nWz,nLv);
	Msg2Player("你获得"..nLv.."(级)灵石");
	if nLv >= 6 then
		WriteLog("玩家"..GetName().."消耗"..nNum.."次随机次数，获得1个"..nLv.."(级)灵石");
	end
end

function zhiding_peifang()
	local strtab = {
		"1级灵石配方属性/#lspf_zhiding_lv(1)",
		"2级灵石配方属性/#lspf_zhiding_lv(2)",
		"3级灵石配方属性/#lspf_zhiding_lv(3)",
		"4级灵石配方属性/#lspf_zhiding_lv(4)",
		"5级灵石配方属性/#lspf_zhiding_lv(5)",
		"6级灵石配方属性/#lspf_zhiding_lv(6)",
		"返回/zhiding_main"
		}
	Say("请选择灵石配方的等级",
		getn(strtab),
		strtab)		
end

function lspf_zhiding_lv(nLv)
	local strtab = {
		"帽子/#lspf_zhiding_wz("..nLv..",0,0)",
		"衣服/#lspf_zhiding_wz("..nLv..",1,0)",
		"武器/#lspf_zhiding_wz("..nLv..",2,0)",
		"裤子/#lspf_zhiding_wz("..nLv..",3,0)",
		"返回/zhiding_peifang",
		"暂时不要/nothing"
		}
	Say("请选择你要镶嵌的位置",
		getn(strtab),
		strtab)	
end

function lspf_zhiding_wz(nLv,nWz,nPage)
	local tAttri = {};
	local tIdx = {}; --对应tRandNum表的索引
	for i = 22,getn(tRandNum) do --注意这里！tRandNum表的前21项属性是没有配方的！
		if tRandNum[i][3] == nWz and tRandNum[i][4] <= nLv then
			tinsert(tAttri,tRandNum[i]);
			tinsert(tIdx,i)
		end
	end
	local strtab = {};
	local nPageNum = 6;
	local nRemaid = getn(tAttri)-nPageNum*nPage;
	local nDiaNum = 6;
	if nRemaid < nDiaNum then
		nDiaNum = nRemaid;
	end
	for i = 1,nDiaNum do
		tinsert(strtab,tAttri[nPage*nPageNum+i][1].."/#confirm_lspf_zhiding("..tAttri[nPage*nPageNum+i][2]..","..nLv..","..nWz..","..tIdx[nPage*nPageNum+i]..")");
	end
	if nPage > 0 then
		tinsert(strtab,"上一页/#lspf_zhiding_wz("..nLv..","..nWz..","..(nPage-1)..")");
	end
	if nRemaid > 6 then
		tinsert(strtab,"下一页/#lspf_zhiding_wz("..nLv..","..nWz..","..(nPage+1)..")");
	end
	tinsert(strtab,"返回/#lspf_zhiding_lv("..nLv..")");
	tinsert(strtab,"暂时不要/nothing");
	Say("请选择要兑换的属性",
		getn(strtab),
		strtab);	
end

function confirm_lspf_zhiding(nId,nLv,nWz,nIdx)
	local tWz = {"帽子","衣服","武器","裤子"};
	Say("消耗<color=yellow>"..nLv*tRandNum[nIdx][nLv+6].."<color>次"..nLv.."(级)灵石配方来随机获得属性<color=yellow>1"..tRandNum[nIdx][1].."<color>,镶嵌在<color=yellow> "..tWz[nWz+1].."<color> "..nLv.."的灵石配方,你确定吗？",
		2,
		"是的，开始吧/#give_lspf_zhiding("..nId..","..nLv..","..nWz..","..nIdx..")",
		"暂时不要/nothing")	
end

function give_lspf_zhiding(nId,nLv,nWz,nIdx)
	local nNum = nLv*tRandNum[nIdx][nLv+6];
	local tPeifangTask = {SYS_TSK_PEIFANG_ONE,SYS_TSK_PEIFANG_TWO,SYS_TSK_PEIFANG_THREE,SYS_TSK_PEIFANG_FOUR,
												SYS_TSK_PEIFANG_FIVE,SYS_TSK_PEIFANG_SIX,SYS_TSK_PEIFANG_SEVEN}
	if GetTask(tPeifangTask[nLv]) < nNum then
		Talk(1,"","你没有足够的随机次数来合成你需要的灵石配方");
		return
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	local nPfid1,nPfid2,nPfid3 = 0,0,0;		
	for i=2,lingshi_pf:getRow() do
		if tonumber(lingshi_pf:getCell(i,44)) == nId and tonumber(lingshi_pf:getCell(i,45)) == nWz and tonumber(lingshi_pf:getCell(i,46)) == nLv then
			if lingshi_pf:getCell(i,43) ~= "" then
				nPfid1 = tonumber(lingshi_pf:getCell(i,41));
				nPfid2 = tonumber(lingshi_pf:getCell(i,42));
				nPfid3 = tonumber(lingshi_pf:getCell(i,43));
				break
			end
		end
	end
	SetTask(tPeifangTask[nLv],GetTask(tPeifangTask[nLv])-nNum);
	if AddItem(nPfid1,nPfid2,nPfid3,1) == 1 then
		Msg2Player("你获得"..nLv.."(级)属性灵石配方");
		if nLv >= 6 then
			WriteLog("玩家"..GetName().."消耗"..nNum.."次随机次数,获得1张"..nLv.."(级)属性灵石配方");
		end
	else
		WriteLog("玩家"..GetName().."消耗"..nNum.."次随机次数,获得1张"..nLv.."(级)属性灵石配方失败！")
	end
end

function zhiding_gaoji()
	local strtab = {
		"我想把低级灵石来合成高级的/zhiding_lingshi_gaoji",
		"我想把低级灵石配方合成高级的/zhiding_lspf_gaoji",
		"返回/zhiding_main",
		"暂时不要/nothing"
		}
	Say("你想合成灵石还是配方？",
		getn(strtab),
		strtab)	
end

function zhiding_lingshi_gaoji()
	local strtab = {
		"我想把1级灵石合成2级的/#ls_change_high(1)",
		"我想把2级灵石合成3级的/#ls_change_high(2)",
		"我想把3级灵石合成4级的/#ls_change_high(3)",
		"我想把4级灵石合成5级的/#ls_change_high(4)",
		"返回/zhiding_gaoji",
		"暂时不要/nothing"
		}
	Say("请选择要合成的灵石等级. (更改数量将在接下来的步骤中确认)",
		getn(strtab),
		strtab)		
end

function ls_change_high(nLv)
	local tLingshiTask = {SYS_TSK_LINGSHI_ONE,SYS_TSK_LINGSHI_TWO,SYS_TSK_LINGSHI_THREE,SYS_TSK_LINGSHI_FOUR,
												SYS_TSK_LINGSHI_FIVE,SYS_TSK_LINGSHI_SIX,SYS_TSK_LINGSHI_SEVEN}
	local tNum = {3,3,5,5};
	if GetTask(tLingshiTask[nLv]) < tNum[nLv] then
		Talk(1,"","你没有足够的随机次数来合成你需要灵石");
		return
	end	
	local nCount = floor(GetTask(tLingshiTask[nLv])/tNum[nLv]);
	SetTaskTemp(TT_LINGSHI_CHANGE_LV,nLv);
	AskClientForNumber("confirm_ls_change_high", 1, tonumber(nCount), "你想兑换多少个"..(nLv+1).."(级)灵石");
end

function confirm_ls_change_high(nCount)
	local nLv = GetTaskTemp(TT_LINGSHI_CHANGE_LV);
	local tNum = {3,3,5,5};
	local nNum = tNum[nLv]*nCount;
	Say("你确定消耗"..nNum.."次"..nLv.."(级)灵石随机次数来获得"..nCount.." "..(nLv+1).."(级)灵石吗？",
		3,
		"同意/#give_ls_change_high("..nLv..","..nNum..","..nCount..")",
		"选错了，返回/zhiding_lingshi_gaoji",
		"暂时不要/nothing")
end

function give_ls_change_high(nLv,nNum,nCount)  --消耗的等级  消耗的等级次数 兑换的等级个数
	local tLingshiTask = {SYS_TSK_LINGSHI_ONE,SYS_TSK_LINGSHI_TWO,SYS_TSK_LINGSHI_THREE,SYS_TSK_LINGSHI_FOUR,
												SYS_TSK_LINGSHI_FIVE,SYS_TSK_LINGSHI_SIX,SYS_TSK_LINGSHI_SEVEN}		
	if GetTask(tLingshiTask[nLv]) < nNum then
		Talk(1,"","你没有足够的随机次数来合成你需要的灵石");
		return
	end
	SetTask(tLingshiTask[nLv],GetTask(tLingshiTask[nLv])-nNum);
	SetTask(tLingshiTask[nLv+1],GetTask(tLingshiTask[nLv+1])+nCount);
	Msg2Player("你获得"..(nLv+1).."(级)灵石"..nCount.." ,你可以从聚灵鼎中把它提取出来。");	
end

function zhiding_lspf_gaoji()
	local strtab = {
		"我想把1级灵石配方合成2级/#lspf_change_high(1)",
		"我想把2级灵石配方合成3级/#lspf_change_high(2)",
		"我想把3级灵石配方合成4级/#lspf_change_high(3)",
		"我想把4级灵石配方合成5级/#lspf_change_high(4)",
		"我想把5级灵石配方合成6级/#lspf_change_high(5)",
		"返回/zhiding_gaoji",
		"暂时不要/nothing"
		}
	Say("请选择灵石配方等级(更改数量将在接下来的步骤中确认)",
		getn(strtab),
		strtab)		
end

function lspf_change_high(nLv)
	local tPeifangTask = {SYS_TSK_PEIFANG_ONE,SYS_TSK_PEIFANG_TWO,SYS_TSK_PEIFANG_THREE,SYS_TSK_PEIFANG_FOUR,
												SYS_TSK_PEIFANG_FIVE,SYS_TSK_PEIFANG_SIX,SYS_TSK_PEIFANG_SEVEN}
	local tNum = {3,3,5,5,5};
	if GetTask(tPeifangTask[nLv]) < tNum[nLv] then
		Talk(1,"","你没有足够的随机次数来合成你需要的灵石配方");
		return
	end
	local nCount = floor(GetTask(tPeifangTask[nLv])/tNum[nLv]);
	SetTaskTemp(TT_LSPF_CHANGE_LV,nLv);
	AskClientForNumber("confirm_lspf_change_high", 1, tonumber(nCount), "你想合成多少个"..(nLv+1).."(级)灵石配方？");
end

function confirm_lspf_change_high(nCount)
	local nLv = GetTaskTemp(TT_LSPF_CHANGE_LV);
	local tNum = {3,3,5,5,5};
	local nNum = tNum[nLv]*nCount;
	Say("你确定消耗"..nNum.."次"..nLv.."(级)灵石配方来合成 "..nCount.."张"..(nLv+1).."(级)灵石配方？",
		3,
		"同意/#give_lspf_change_high("..nLv..","..nNum..","..nCount..")",
		"选错了，返回/zhiding_lspf_gaoji",
		"暂时不要/nothing")
end

function give_lspf_change_high(nLv,nNum,nCount)
	local tPeifangTask = {SYS_TSK_PEIFANG_ONE,SYS_TSK_PEIFANG_TWO,SYS_TSK_PEIFANG_THREE,SYS_TSK_PEIFANG_FOUR,
												SYS_TSK_PEIFANG_FIVE,SYS_TSK_PEIFANG_SIX,SYS_TSK_PEIFANG_SEVEN}	
	if GetTask(tPeifangTask[nLv]) < nNum then
		Talk(1,"","你没有足够的随机次数来合成你需要的灵石配方");
		return
	end
	SetTask(tPeifangTask[nLv],GetTask(tPeifangTask[nLv])-nNum);
	SetTask(tPeifangTask[nLv+1],GetTask(tPeifangTask[nLv+1])+nCount);
	Msg2Player("你获得"..(nLv+1).."(级)-灵石配方."..nCount.." ,你可以从聚灵鼎中把它提取出来");	
end

function zhiding_yuehua()
	local strtab = {
		"我要消耗5次5级灵石配方随机次数兑换1个月华/lingshi_change_yuehua",
--		"我要消耗5次5级灵石配方随机次数兑换1个天地玄黄石/lspf_change_stone",
		"返回/zhiding_main",
		"暂时不要/nothing"
		}
	Say("请选择你想要兑换的项目",
		getn(strtab),
		strtab)	
end

function lingshi_change_yuehua()
	Say("你确定消耗5次5级灵石配方随机次数来兑换1个月华吗？",
		3,
		"同意/confirm_lingshi_yuehua",
		"返回/zhiding_yuehua",
		"暂时不要/nothing")
end

function confirm_lingshi_yuehua()
	local tLingshiTask = {SYS_TSK_LINGSHI_ONE,SYS_TSK_LINGSHI_TWO,SYS_TSK_LINGSHI_THREE,SYS_TSK_LINGSHI_FOUR,
												SYS_TSK_LINGSHI_FIVE,SYS_TSK_LINGSHI_SIX,SYS_TSK_LINGSHI_SEVEN}		
	if GetTask(tLingshiTask[5]) < 5 then
		Talk(1,"","你没有足够的随机次数来兑换你需要的月华");
		return
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	SetTask(tLingshiTask[5],GetTask(tLingshiTask[5])-5);
	if AddItem(2,1,2002,1) == 1 then
		Msg2Player(" 你获得1个月华");
	end		
end

function lspf_change_stone()
	Say("你确定要消耗5次5级灵石配方随机次数来兑换1个天地玄黄石吗？",
		3,
		"同意/confirm_lspf_stone",
		"返回/zhiding_yuehua",
		"暂时不要/nothing")
end

function confirm_lspf_stone()
	local tPeifangTask = {SYS_TSK_PEIFANG_ONE,SYS_TSK_PEIFANG_TWO,SYS_TSK_PEIFANG_THREE,SYS_TSK_PEIFANG_FOUR,
												SYS_TSK_PEIFANG_FIVE,SYS_TSK_PEIFANG_SIX,SYS_TSK_PEIFANG_SEVEN}	
	if GetTask(tPeifangTask[5]) < 5 then
		Talk(1,"","你没有足够的随机次数来提取你需要的天地玄黄石");
		return
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	SetTask(tPeifangTask[5],GetTask(tPeifangTask[5])-5);
	if AddItem(2,1,1151,1) == 1 then
		Msg2Player("你获得1个天地玄黄石");
	end		
end

function how_change()
	Talk(1,"how_change2","灵石已经在聚灵鼎里面，请确认是否有指定的属性还是没有，可以提取1个随机属性。你可以通过消耗同级数量的灵石来提取1个相同灵石的属性，指定的数量也是这样。")
end

function how_change2()
	Talk(1,"how_change3","你可以在聚灵鼎中将低级的灵石合成高级的，例如聚灵鼎里有10个4级灵石可以合成2个5级灵石。不一样的灵石等级需要兑换的数量也不一样。")
end

function how_change3()
	Talk(1,"OnUse","灵石以及灵石配方在聚灵鼎中，除了可以提取和合成外，还可以兑换成月华或者天地玄黄石。")
end

function nothing()

end

--函数名称：物品添加检查函数
--功        能：对当前玩家可否正常添加物品进行检测
--村长 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"","<color=red>你的背包空间<color>不足！")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--判断玩家负重和空间
			Talk (1,"","<color=red>你的负重力<color>不够")
			return 0
		else 
			return 1
		end
end
