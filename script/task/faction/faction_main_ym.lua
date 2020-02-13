
-- 剑侠情缘 II 师门任务
-- 2005/03/14  PM 16:09
-- Edited by peres

Include("\\script\\task\\faction\\faction_head.lua");

      ------------ 女性玩家


-- 开始与佘太君对话

function task_001()

local strMain = {
	"你吗? 杨门不比江湖门派,是大宋正规军队，你能承受严肃紧张的军营生活 ?",
	"杨门女将名闻天下, 佘太君您怎么看不起我?",
	"哈哈! 既然你执意从戎! 你去找穆桂英, 办理入伍事宜.",
	"谢谢佘太君!",
	}

TE_Talk(getn(strMain), "task_002", strMain);

TaskTip("去找穆桂英，要求加入杨门!");

end

-- 对话结束，改变变量：1
function task_002()

	SetTask(1032,1);

end

-- 与穆桂英对话1
function task_003()

local strMain = {
  "穆将军! 我想加入杨门, 佘太君让我找您.",
	"加入杨门? 很好! 但是杨门女卒入伍还需要去找丞相赵普入册才行.",
	"去汴京找丞相 <color=yellow>赵普<color> 登记入册再回来!",
  "谢谢穆将军!",
	}

TE_Talk(getn(strMain), "task_004", strMain);

TaskTip("穆桂英让你去汴京找丞相赵普");

end

-- 对话结束，改变变量：2
function task_004()

	SetTask(1032,2);

end


-- 与赵普对话1
function task_005()

local strMain = {
  "赵丞相! 在下是杨门的新兵, 穆将军让我来找您登记在册.",
	"我同意让您入伍，不过由于士兵编制变动还需要您去问一下皇宫门口的禁军.",
	"请前往皇宫的正门寻找 <color=yellow>禁军<color> 询问具体情况.",
	}

TE_Talk(getn(strMain), "task_006", strMain);

TaskTip("赵普让你去找皇宫门口的禁军");

end

-- 对话结束，改变变量：3
function task_006()

	SetTask(1032,3);

end

-- 与礼官对话
function task_007()

local strMain = {
  "杨门女兵!?",
	"尽管杨门是在禁军的控制下，但登记入册只是名义上的.",
	"可杨门入伍依然属于朝廷管理，你可以回去告诉赵大人.",
	}

TE_Talk(getn(strMain), "task_008", strMain);

TaskTip("禁军统领让你去找赵普");

end;

-- 对话结束，改变变量：4
function task_008()

	SetTask(1032,4);

end;


-- 与赵普对话2
function task_009()

local strMain = {
  "原来是这样! 不过登记入册要告知曹大人.",
	"我已经告知他帮你入册了, 现在可以回去见 <color=yellow>穆桂英<color> 将军了!",
	"麻烦赵大人了!",
	}

TE_Talk(getn(strMain), "task_010", strMain);

TaskTip("赵普叫你去找穆桂英");

end

-- 对话结束，改变变量：5
function task_010()

	SetTask(1032,5);

end

-- 与穆桂英对话2
function task_011()

local strMain = {
  "登记入伍完成了么?",
	"是的! 但是为什么由禁军进行管理？好麻烦!",
	"我也不清楚! 我只负责调查军情，那不是我考虑的事.",
  "所以我待在军营里很少见到他们.",
  "请问哪里可以买到杨门的战马?",
	"你可以找到 <color=green>杨排风<color>.",
  "战场上受伤是家常便饭所以你要懂得基本的治疗，你带 <color=yellow>5个绷带<color> 来我这里.", 
  "绷带? 我不知道!",
  "很简单! 这是 <color=yellow>江湖技能<color> 每个人都必须知道. 请在界面中查看<color=yellow>生活技能<color>.", 
	}

TE_Talk(getn(strMain), "task_012", strMain);

RestoreStamina()
TaskTip("穆桂英让你制作5个绷带给她 ");

end

-- 对话结束，改变变量：6
function task_012()

	SetTask(1032,6);

end

-- 玩家有绷带来交任务时
function task_013()

local strMain = {
		"5个绷带已经制作完成.",
		"非常好!可以找<color=yellow>佘太君<color>报到了."
	}

	if (GetItemCount(1,0,1)>=5) then
		TE_Talk(getn(strMain), "task_014", strMain);		
	else
		Say("按<color=yellow>F5<color> 选<color=yellow>活<color> 看 <color=yellow>生活技能<color>.",0);
		return
	end;

end;

-- 对话结束，改变变量：7
-- 删除绷带
function task_014()
	TaskTip("B﹜ gi? c? th? g苝 Xa Th竔 Qu﹏");
	DelItem(1,0,1,5);
	SetTask(1032,7);
end;


-- 回去与佘太君的对话

function task_015()

local strMain = {
		"从今以后，你就成为天波杨府的人，以后要勤于训练，报效国家.",
		"天波杨府擅长精通马上战斗, 杨家军名闻天下. 如果你想学习<color=yellow>杨门枪术<color> 就去找<color=yellow>杨宗保<color>; 如果你想学习 <color=yellow>杨门弓术<color> 就去找<color=yellow>穆桂英<color>."
	}
	
TE_Talk(getn(strMain), "task_016", strMain);

end


-- 与掌门对话结束，改变任务变量：8
function task_016()

	SetTask(1032,8);
	
	SetPlayerFaction(6)
	SetPlayerRoute(16)
	i=GetBody()
	if i==1 then 
		AddItem(0,109,105,1)
		AddItem(0,108,105,1)
	elseif i==2 then
		AddItem(0,109,106,1)
		AddItem(0,108,106,1)
	elseif i==3 then
		AddItem(0,109,107,1)
		AddItem(0,108,107,1)
	else
		AddItem(0,109,108,1)
		AddItem(0,108,108,1)
	end
	ModifyReputation(10,0);
	--AddGlobalNews("江湖传言玩家"..GetName().."已于近日加入杨门！")
	TaskTip("你已加入杨门，寻找武术师傅")
	
	-- 清空其它门派任务的状态
	FN_SetTaskState(FN_SL, 0);
	FN_SetTaskState(FN_EM, 0);
	FN_SetTaskState(FN_GB, 0);
	FN_SetTaskState(FN_TM, 0);
	FN_SetTaskState(FN_WD, 0);
	
end



      ------------ 男性玩家


-- 开始与佘太君对话


function task_101()

local strMain = {
	"你想加入杨门? 这是一支军纪严明的军队，不比江湖门派，你可要想好.",
	"在下想过，国家有难，匹夫有责",
	"很好! 去找<color=yellow>杨宗保<color> 办理入伍事宜.",
	}

TE_Talk(getn(strMain), "task_102", strMain);

TaskTip("找杨宗保加入杨门!");

end

-- 对话结束，改变变量：1
function task_102()

	SetTask(1031,1);

end

-- 与杨宗保对话1
function task_103()

local strMain = {
  "杨将军!我想加入杨门，佘太君叫我来找您",
	"很好!保家卫国就是大丈夫所为!",
  "看来我已加入杨门?",
	"想入伍必须要朝廷批准, 还需要去汴京找枢密使<color=yellow>曹彬<color>, 办理士兵入册才行.",
  "杨将军，遵命!",
	}

TE_Talk(getn(strMain), "task_104", strMain);

TaskTip("杨宗保让你去汴京找枢密使曹彬");

end

-- 对话结束，改变变量：2
function task_104()

	SetTask(1031,2);

end


-- 与曹彬对话1
function task_105()

local strMain = {
  "您是曹彬大人? 在下想参军, 杨宗保将军让我来找您.",
	"如果杨将军推荐，那不会有问题. 不过小兄弟能否帮我一个忙?",
  "曹大人请说!",
	"近期朝廷买了一批战马还没送到. 你帮我问一下<color=yellow>马贩<color>还要多久会送到.",
  "没问题!",
	}

TE_Talk(getn(strMain), "task_106", strMain);

TaskTip("曹彬派你去好汴京马贩");

end

-- 对话结束，改变变量：3
function task_106()

	SetTask(1031,3);

end

-- 与汴京马贩对话
function task_107()

local strMain = {
  "老板!曹大人让我问您上次朝廷所购的战马何时能送到.",
	"曹大人购的战马?马上送到.",
  "谢谢!",
	}

TE_Talk(getn(strMain), "task_108", strMain);

TaskTip("回复曹彬");

end;

-- 对话结束，改变变量：4
function task_108()

	SetTask(1031,4);

end;


-- 与曹彬对话2
function task_109()

local strMain = {
  "怎么样?",
	"战马马上送过来.",
  "太好了! 朝廷和辽国正在打仗, 战马对战场的骑兵非常重要.",
  "所以一定要买很多马.",
  "你想加入杨门, 是骑术大师，后期必须勤学苦练.",
	"杨门也去汴京马贩去买马了?",
  "很好! 杨门有个师门商店, 杨家的人可以到那里去取战马.",
	"在下明白!",
  "好吧!你可以回去找<color=yellow>杨宗保<color>, 我已登记在册了.",
	"谢谢曹大人!",
	}

TE_Talk(getn(strMain), "task_110", strMain);

TaskTip("曹彬让你回去找杨宗保");

end

-- 对话结束，改变变量：5
function task_110()

	SetTask(1031,5);

end

-- 与杨宗保对话2
function task_111()

local strMain = {
  "怎么样了?",
	"入伍登记已办理完成了!",
	"很好!",
  "士兵很多，粮食也很紧急，有时军队出征，士兵需自给自足.", 
  "去教训城外的<color=yellow> 流氓<color> 拿 <color=yellow> 2 份鸡肉<color>回来!", 
	}

TE_Talk(getn(strMain), "task_112", strMain);

TaskTip("杨宗保让你去找2份鸡肉?");

end

-- 对话结束，改变变量：6
function task_112()

	SetTask(1031,6);

end

-- 玩家有鸡肉来交任务时
function task_113()

local strMain = {
		"已经做完了!",
	  "这么快，有当兵的前潜质!",
		"现在你可以回复<color=yellow>佘太君<color>.",
	}

	if (GetItemCount(1,3,2)>=2) then
		TE_Talk(getn(strMain), "task_114", strMain);		
	else
		Say("你还没完成吗?",0);
		return
	end;

end;

-- 对话结束，改变变量：7
-- 删除兔肉
function task_114()
	TaskTip("B﹜ gi? c? th? g苝 Xa Th竔 Qu﹏");
	DelItem(1,3,2,2);
	SetTask(1031,7);
end;


-- 回去与佘太君的对话

function task_115()

local strMain = {
		"杨宗保已经答应了? 很好，从现在起你就是杨家军的一员了. 请记住军队里军纪严明，服从军令!",
    "天波杨府擅长精通马上战斗, 杨家军名闻天下. 如果你想学习 <color=yellow>杨门枪术<color> 就去找<color=yellow>杨宗保<color>;如果你想学习<color=yellow>杨门弓术<color>你就找<color=yellow>穆桂英<color>.",
	}
	
TE_Talk(getn(strMain), "task_116", strMain);

end


-- 与掌门对话结束，改变任务变量：8
function task_116()

	SetTask(1031,8);
	
	SetPlayerFaction(6)
	SetPlayerRoute(16)
	i=GetBody()
	if i==1 then 
		AddItem(0,109,105,1)
		AddItem(0,108,105,1)
	elseif i==2 then
		AddItem(0,109,106,1)
		AddItem(0,108,106,1)
	elseif i==3 then
		AddItem(0,109,107,1)
		AddItem(0,108,107,1)
	else
		AddItem(0,109,108,1)
		AddItem(0,108,108,1)
	end
	ModifyReputation(10,0);
	--AddGlobalNews("江湖传言玩家"..GetName().."已于近日加入杨门！")
	TaskTip("你已加入杨门，寻找武术师傅")
	
	-- 清空其它门派任务的状态
	FN_SetTaskState(FN_SL, 0);
	FN_SetTaskState(FN_EM, 0);
	FN_SetTaskState(FN_GB, 0);
	FN_SetTaskState(FN_TM, 0);
	FN_SetTaskState(FN_WD, 0);
	
end








function task_exit()

end;


function fix_ym()
FN_SetTaskState(FN_TM, 0);
Say("现在你可以重新加入了.",0);
end;


