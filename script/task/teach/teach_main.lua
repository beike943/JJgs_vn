
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 教育任务实体处理文件
-- Edited by peres
-- 2005/05/07 PM 19:55

-- 烟花.那一夜的烟花.
-- 她记得他在大雨的人群中,站在她的背后拥抱住她.
-- 他温暖的皮肤,他熟悉的味道.烟花照亮她的眼睛.
-- 一切无可挽回……

-- ======================================================

-- 教育任务头文件
Include("\\script\\task\\teach\\teach_head.lua");

-- 教育任务奖励文件
Include("\\script\\task\\teach\\teach_award.lua");

-- 第一次与野叟对话
function task_000_00()
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local nDate = tonumber(date("%y%m%d"))
--	if nNation ~= 89 then
--		Talk(1, "", "Giang h?產ng d藋 s鉵g, ta ph秈 ngh?ng琲 1 t? !!!!!")
--		return 0
--	end
	
--	if nDate > 140406 then
--		Talk(1, "", "Giang h?產ng d藋 s鉵g, ta ph秈 ngh?ng琲 1 t? !!!!!")
--		return 0
--	end
	
	local strMain = {
		"欢迎来到 <color=yellow> 剑侠情缘2<color>的世界",
		"这里有什么/task_000_okay", 
		"开始闯荡江湖/task_000_01",
	}
	SetTask(1, 1);
	AddItem(2,0,505,1)
	SelectSay(strMain);

end;

-- 选择听野叟讲解
function task_000_okay()

	local strMain = {

		"您想了解什么?",
		"基本操作/Teach_Basic",
		"角色升级/Teach_Level",
		"如何加点/Teach_Point",
		"如何赚钱/Teach_Earn",
		"加入门派/Teach_Faction",
		"现在可以做什么/Teach_Something",
		"好的/task_000_00",
	}

	SelectSay(strMain);

end;


-- 开始做教学任务
function task_000_01()

	local strMain = {
		"<color=yellow>城里的武器店主,男装店主,女装店主,饰品店主,<color>都是知识渊博的人！ 找到他们学习！",
		"去找他们聊聊吧",
	}

	TE_Talk("task_000_02",strMain);

end;

-- 接了任务,改变任务变量：1
function task_000_02()
	SetTask(1, 1);
	TaskTip("去找武器店老板");
end;

-- 与武器店老板的对话
function task_001_00()

	local strMain = {
		"欢迎加入  <color=yellow>剑侠情缘2<color> 尽管我们只有4级或更低级别,买吧！ 我会告诉你如何使用它",
		"怎么使用/task_001_01",
		"知道了/task_001_02",
	}
	SelectSay(strMain);

end;

-- 听武器店老板讲解
function task_001_01()

	local strMain = {
		--"H祅h t萿 giang h? c莕 ph秈 c?v?kh? ph遪g th﹏. Nh鱪g th?n gi秐 nh?<color=yellow>H?th?color>, <color=yellow>Ki誱<color>, <color=yellow>竚 kh?color>, <color=yellow>C玭<color> kh玭g c莕 s?ph?hng d蒼, nh鱪g th?c遪 l筰 nh?產o, c莔, b髏, trng ph秈 頲 hng d蒼.",
		"每个级别的人员对应的武器,玩家可以在铁匠那里购买普通武器,而高级武器则必须从其他玩家那里购买或购买.",
		--"L骳 trc ta c?giao u v韎 cao th?ph竔 t?ki誱 ph竔 Thanh Th祅h, may 頲 m閠 v?V?ng ra tay c鴘 gi髉, tr猲 tay 玭g ta l?thanh b秓 ki誱 頲 kh秏 ng鋍, uy l鵦 kinh ngi. Nghe n鉯 y l?lo筰 k?th筩h h綾 b筩h c?th?kh秏 n筸 l猲 v?kh?",
		--"N誹 ngi g苝 c?duy猲 c?頲 b秓 ki誱  th?vi謈 h祅h t萿 giang h?xem ra r蕋 nh?nh祅g.",
		"现在您可以找 <color=yellow>服装店老板<color>.",
	}
	TE_Talk("task_001_02",strMain);

end;

-- 听完讲解,改变任务变量：2
function task_001_02()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("Ch?Ti謒 v?kh");
	if GetSex()==1 then
		TaskTip("去找男装店老板");
	else
		TaskTip("去找女装店老板");
	end;
end;

-- 与服装店男老板的对话
function task_002_00_male()

	local strMain = {
		"欢迎朋友加入剑侠情缘2. 我们的商店专门销售男装,买吧！ 我们将向您展示如何使用<color=yellow>服装<color>",
		"怎么使用/task_002_01",
		"知道了/task_002_02",
	}
	SelectSay(strMain);
end;

-- 与服装店女老板的对话
function task_002_00_female()

	local strMain = {
		"欢迎朋友加入剑侠情缘2. 我们的商店专门销售女装, 买吧！ 我们将向您展示如何使用<color=yellow>服装<color>",
		"怎么使用/task_002_01",
		"了解了/task_002_02",
	}
	SelectSay(strMain);
end;

-- 听服装店老板的讲解
function task_002_01()

	local strMaleMain = {
		"穿衣服是必不可少的.有头巾,上衣和下衣,",
		"我只卖普通的装备",
		"而且我只卖内衣,想卖外装你要到别的地方看看.",
		"现在您可以找<color=yellow>饰品店老板<color>.",
	}

	local strFemaleMain = {
		"穿衣服是必不可少的.有头巾,上衣和下衣,",
		"我只卖普通的装备",
		"而且我只卖内衣,想卖外装你要到别的地方看看.",
		"现在您可以找 <color=yellow>饰品店老板<color>!",
	}

	if GetSex()==1 then
		TE_Talk("task_002_02",strMaleMain);
	else
		TE_Talk("task_002_02",strFemaleMain);
	end;
	
end;

-- 与服装店老板对话结束后,改变任务变量：3
function task_002_02()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("Ch?ti謒 trang ph鬰");
	TaskTip("去找饰品店老板");
end;

-- 与饰品店老板的对话
function task_003_00()

local strMain = {
	"欢迎朋友加入剑侠情缘2. 我们的商店专门销售女装,买下来. 买吧！ 我们将向您展示如何使用<color=yellow>饰品<color>",
	"怎么使用/task_003_01",
	"了解了/task_003_02",
}
SelectSay(strMain);

end;

-- 听饰品店的老板讲解
function task_003_01()

	local strMain = {
		"<color=yellow>Nam cao th?<color> thng mang Ng鋍 b閕, H?ph? <color=yellow>N?k?hi謕<color> mang hng nang, H筺g li猲. C遪 nh蒼 c?nam n?u 甧o 頲.",
		"我只卖普通的饰品!",
	}
	TE_Talk("task_003_02",strMain);
end;

-- 听完饰品店老板讲解发奖励,改变任务变量：4
function task_003_02()

	local strMain = {
		"给你个 <color=yellow>小礼物<color>！ 以后,记得光顾光顾！ 现在可以到<color=yellow>药店老板<color>！",
	}

	TE_SetTeachAdd();
	GivePlayerAward_Teach("Ch?Kim ho祅");
	TaskTip("去找药店老板");
	TE_Talk("",strMain);

end;

-- 与药店老板的对话
function task_004_00()

	local strMain = {
		"欢迎朋友加入剑侠情缘2. 我们的商店专门卖药 买吧！ 我们将向您展示如何使用<color=yellow>药品<color>",
		"怎么使用/task_004_01",
		"了解了/task_004_02"
	}
	SelectSay(strMain);

end;

-- 听药店老板的讲解
function task_004_01()

	local strMain = {
		"药品是闯荡江湖必不可少的.",
		"没有配方,我们只能使用<color=yellow>草药<color>. 虽然效果不佳,但对刚踏入江湖的人有帮助",
	}
	TE_Talk("task_004_02",strMain);

end;

-- 听完药店老板讲解或者直接跳到这里,改变任务变量：5
function task_004_02()

	local strMain = {
		"给你几瓶 <color=yellow>药<color>！ 以后,记得光顾！ 现在可以到<color=yellow>杂货店老板<color>！",
	}

	TE_SetTeachAdd();
	GivePlayerAward_Teach("Ch?Dc 甶誱");
	TaskTip("去找杂货店老板");
	TE_Talk("",strMain);

end;

-- 与杂货店老板的对话
function task_005_00()

	local strMain = {
		"欢迎朋友加入剑侠情缘2. 我们的商店什么都卖, 买吧",
		"都卖什么/task_005_01",
		"知道了/task_005_02",
	}
	SelectSay(strMain);

end;

-- 听杂货店老板的讲解
function task_005_01()

	local strMain = {
		--"V藅 ph萴 tr猲 giang h?mu玭 h譶h v筺 tr筺g, c莕 hi觰 r? v?sau s?d鬾g! C竎 lo筰 {Ch鴆 C萴} v?{Da th髛 c?th?ch?t筼 H?gi竝. {C竎 m秐h kim lo筰, B秓 Th筩h} c?th?ch?t筼V?kh?",
		"除了一些神秘物品外,谷物还用于制作食物.",
		"我听说有<color=yellow>神秘的商人<color>卖神秘物品,您应该去那里看看.",
	}
	TE_Talk("task_005_02",strMain);

end;

-- 听完杂货店老板的讲解后或者直接跳到这里,改变任务变量：6
function task_005_02()

	local strMain = {
		--"B鎛 ti謒 bu玭 b竛 nh? ch?c?2 t蕀 <color=red>Gi竚 nh ph?color> n祔 t苙g b筺 tr? Sau n祔 nh qu竔 r琲 <color=yellow>trang b?color>, ch?c莕 d飊g chu閠 ph秈 nh蕁 v祇 Gi竚 nh ph?a h譶h chu閠 t韎 trang b?l?c?th?bi誸 頲 thu閏 t輓h.",
		"回去找 <color=yellow>野叟<color> 吧!",
	}
	TE_SetTeachAdd();
	GivePlayerAward_Teach("Ch?T筽 h鉧");
	TaskTip("回去找野叟");
	TE_Talk("",strMain);

end;

-- 回来与野叟的对话
function task_006_00()

	local strMain = {
		"收获很多吧",
		"听所他们给了你很多东西?",
		"哈哈！ 还有更多令人惊奇的事情！ 等你到达<color=yellow>4级<color> 再来找我.",
	}
	TE_Talk("task_006_01",strMain);

end;

-- 与野叟对话结束后改变任务变量：7
function task_006_01()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("дn g苝 D?T萿");
	TaskTip("4级以后再来找我.");
end;

-- 到了 4 级之后与野叟的对话
function task_007_00()

	local strMain = {
		"你进步这么快吗?",
		"不行 外面的怪物很强!",
		"<color=yellow>城门卫兵<color> 和<color=yellow>武师<color> 对怪物比较了解.",
	}
	TE_Talk("task_007_01",strMain);
end;

-- 与野叟对话结束后改变任务变量：8
function task_007_01()
	TE_SetTeachAdd();
	TaskTip("寻找城门卫兵询问练级区域");
end;

-- 与城门卫兵的对话
function task_008_00()

	local strMain = {
		"您能告诉我<color=yellow>练级<color>地点吗?",
		"您找到合适的人!",
		--"Qu竔 頲 ph﹏ b?b猲 ngo礽 th祅h ho芻 g莕 m玭 ph竔, c祅g xa th祅h th?ng c蕄 qu竔 c祅g m筺h, qu竔 m筺h nh蕋 kho秐g <color=yellow>c蕄 50<color>.",
		"不要去洞穴,因为这个地方很危险.",
		"你怎么知道洞穴很危险?",
	}
	TE_Talk("task_008_00_01",strMain);

end;


function task_008_00_01()

	local strMain = {
		"怪物名字的 <color=yellow>颜色<color> 可以识别他们, <color=yellow>白色<color> 代表和你等级相近怪物; <color=yellow>红色<color> 代表比你等级高的怪物; <color=yellow>蓝色<color> 代表怪物小头目 <color=yellow> 黄色 <color> 说明他是怪物首领!",
		"哈哈！像您这样的新手只能与白色怪物搏斗！",
		--"还有其他,老师?",
		--"Ta bi誸 r?qu竔 ph﹏ b??u, n誹 c莕 th?n y <color=yellow>t譵 hi觰<color> n琲 luy謓 c玭g th輈h h頿. C遪 v?chi課 u th?t譵 v?s?th豱h gi竜.",
		"去找 <color=yellow>武师<color>了解战斗技巧!",
	}
	TE_Talk("task_008_01",strMain);

end;

-- 与卫兵对话结束后改变任务变量：9
function task_008_01()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("V?binh th祅h m玭");
	TaskTip("找武师了解战斗技巧");
end;

-- 与武师对话
function task_009_00()

	local strMain = {
		--"D?T萿 b秓 ta n t譵 ti襫 b鑙 h鋍 <color=yellow>c竎h chi課 u<color>.",
		"我喜欢指导他人武功,但首先要了解<color=yellow>战斗技能<color>.您能区分左右攻击吗?",
		"我不明白！",
		--"B猲 tr竔 ch?nh V藅 l? b猲 ph秈 l?nh v?c玭g. C?th?s?d鬾g <color=yellow>v?c玭g b猲 ph秈<color> nh qu竔. V?c玭g m玭 ph竔, m藅 t辌h ho芻 theo ta h鋍 u s?d鬾g 頲.",
		--"Kh玭g ng?b猲 ph秈 h鱱 hi謚 n nh?v藋?",
		"不明就不明白吧",
		"您想快速击败怪物,需要了解 <color=yellow>它们的性质<color>.",
		"我听说守卫们谈论怪物的等级,颜色和分布区域.",
	}	
	TE_Talk("task_009_00_01",strMain);
end;

function task_009_00_01()

	local strMain = {
		"在实践中还不够,谈论<color=yellow>怎么打<color> ,大多数怪物具有被动攻击,主动攻击,明晰攻击,攻城,袭击等形式. 您只需要知道可以对付它们即可.",
		--"Ti襫 b鑙 hng d蒼 r?h琻 頲 kh玭g?",
		"<color=yellow>被动攻击<color> 的怪物只有被攻击才反击 <color=yellow>主动攻击<color>的怪物看到你就会自动攻击你;",
		"<color=yellow>进攻类型 <color> 都了解清楚了吧?",	
	}
	TE_Talk("task_009_01",strMain);
end;

-- 与武师对话的扩展
function task_009_01()

	local strMain = {
		"<color=yellow>五行属性<color> 主要是金,木,水,火,土,阴,隐形. 低级怪兽没有属性,等级20的新怪兽具<color=yellow>五行属性<color>,它们会根据五个元素的相似性而变化.",
		"所以我们必须选择五个元素,而<color=yellow>负属性<color>呢?",
		"由于<color=yellow>山河社稷图<color>解体,出现了一种具有阴属性的新型怪物,他们不惧怕正常的攻击,五种武器或武术根本无法伤害他们.",
		"打失败怎么办? 有死亡惩罚吗?",
	}
	TE_Talk("task_009_02",strMain);
end;

-- 与武师对话的扩展
function task_009_02()

	local strMain = {
		"在游戏中没有死亡,如果被打败,只会损失当前经验的1％,金额的5％和一点名气,如果战斗失败,您可以选择返回城市,或者等待高级的峨眉佛家进行救援;如果挽救生命,您只会损失金钱和名望,而不会遭受经验和内部伤害.",
		"老夫可以为你展示一些技巧",
		"我有武术<color=yellow>轻功<color>要教你.",
		"回去找 <color=yellow>野叟<color>.",
	}
	TE_Talk("task_009_03",strMain);
end;

-- 与武师对话结束后改变任务变量：10
function task_009_03()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("V?s");
	LearnSkill(20)--直接学会轻功
	TaskTip("恭喜你,学会轻功");
end;

-- 回去与野叟对话
function task_010_00()

	local strMain = {
		"你知道怎么打吗?",
		"听武术和卫兵讲得很好.谢谢您!",
		"6级以后再来找我!",
	}
	TE_Talk("task_010_01",strMain);
end;

-- 与野叟对话后改变任务变量：11
function task_010_01()
	TE_SetTeachAdd();
	TaskTip("6级以后再回来找野叟.");
end;

-- 等级到了 6 级时回来与野叟的对话
function task_011_00()

	local strMain = {
		"进步挺快啊?",
		"没什么有趣的,但是从商店老板那里学到了很多东西,但是他们很忙. 如果有人 <color=yellow>说话<color> 该怎么回复?",
		--"Kh玭g vui l?ph秈 r錳! Ngi ph秈 thng xuy猲 n鉯 chuy謓 v韎 h?",
		--"Th?n祔 v藋! H穣 t譵 <color=yellow>Ch?t鰑 l莡<color> v?<color=yellow>Ti猽 s?color>, kh玭g ch鮪g h?s?ch?d箉 頲 g?th猰!",
		"去找<color=yellow>酒楼老板<color> 教你!",
	}
	TE_Talk("task_011_01",strMain);
end;

-- 与野叟对话后改变任务变量：12
function task_011_01()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("Ch?t鰑 l莡");
	TaskTip("去找酒楼老板.");
end;

-- 与酒楼老板的对话
function task_012_00()
	local strMain = {
		--"Ti襫 b鑙 c?th?ch?cho c竎h <color=yellow>giao l璾<color> 頲 kh玭g?",
		--"Кn gi秐 th玦! Trong tr?ch琲 mu鑞 i tho筰 v韎 ai ch?c莕 nh蕁 ph輒 <color=yellow><Ctrl><color> k誸 h頿 v韎 chu閠 ph秈 l猲 i phng ch鋘 d遪g th輈h h頿 l?頲.",
		--"<color=yellow>T譵 hi觰<color>: Xem th玭g tin i phng; <color=yellow>T竛 g蓇<color>: Chat m藅 v韎 i phng; <color=yellow>Theo sau<color>:  theo m閠 ngi n祇 ; <color=yellow>Giao d辌h<color>: M阨 ngi ch琲 kh竎 giao d辌h; <color=yellow>T?i<color>: M阨 ngi ch琲 c飊g t?i.",
		--"Ngi ch琲 kh玭g n籱 trong ph筸 vi th?giao l璾 b籲g c竎h n祇?",
		"<color=yellow>废话一堆....<color>",
	}
	TE_Talk("task_012_00_01",strMain);
end;


function task_012_00_01()
	local strMain = {
		--"Khi mu鑞 t竛 g蓇, nh蕁 <color=yellow><Enter><color> ho芻 ch鋘 <color=yellow>T莕 s?t竛 g蓇 <color>, nh藀 t猲 ngi ch琲 v?n閕 dung mu鑞 g鰅 甶, nh蕁 <Enter> l?頲.",
		--"T莕 s?t竛 g蓇 l?sao?",
		--"C?nhi襲 t莕 s? t竛 g蓇. <color=yellow>T莕 s?ph?c薾<color> ngi ch琲 xung quanh nh譶 th蕐. <color=yellow>T莕 s?c玭g c閚g<color> ngi ch琲 to祅 server nh譶 th蕐. <color=yellow>T莕 s?h?th鑞g<color> hi觧 th?th玭g b竜 c馻 h?th鑞g.",
		--"<color=yellow>T莕 s?i ng?color> ch?trong i m韎 th蕐; <color=yellow>T莕 s?M玭 ph竔<color> ch?thu閏 m玭 ph竔 m韎 th蕐; <color=yellow>B莕 s?bang ph竔<color> ch?ngi trong bang m韎 th蕐.",
		--"Sao c?l骳 ch鋘 t莕 s?r錳 v蒼 kh玭g t竛 g蓇 頲?",
		"<color=yellow>废话一堆....<color>",
	}
	TE_Talk("task_012_01",strMain);
end;

-- 与酒楼老板的对话扩展
function task_012_01()

	local strMain = {
		--"в m b秓 cho ch蕋 lng t竛 g蓇, m鏸 t莕 s?u c?h筺 ch?ri猲g. T莕 s?m玭 ph竔 c莕 ngi ch琲 ph秈 gia nh藀 m玭 ph竔, c竎h nhau 1 ph髏. T莕 s?c玭g c閚g i h醝 ngi ch琲 tr猲 c蕄 30, c竎h nhau 3 ph髏. T莕 s?b?h筺 ch?s?hi謓 m祏  r蕋 d?nh譶 th蕐.",
		--"Ta hi觰 r錳!",
		--"Mu鑞 k誸 giao h秓 h鱱 n猲 t譵 <color=yellow>Ti猽 s?color>, ngi n祔 c?nhi襲 b籲g h鱱, nh蕋 nh s?gi髉 頲 ngi!",
		"<color=yellow>废话一堆....<color>",
		"去找 <color=yellow>镖师<color>",
	}
	TE_Talk("task_012_02",strMain);
end;

-- 与酒楼老板对话后改变任务变量：13
function task_012_02()
	TE_SetTeachAdd();
	TaskTip("去找镖师.");
end;

-- 与镖师的对话
function task_013_00()

	local strMain = {
		--"Xin ti襫 b鑙 ch?d蒼 cho nh鱪g kinh nghi謒 <color=yellow>K誸 giao b筺 h鱱<color>!",
		--"Qu?khen! Кn gi秐 th玦 mu鑞 k誸 b籲g h鱱 v韎 ai nh蕁 <color=yellow><ctrl><color> k誸 h頿 chu閠 ph秈 nh蕄 l猲 ngi i phng ch鋘 <color=yellow>h秓 h鱱<color>, h?th鑞g t?ng xin ph衟 ngi ch琲 . N誹 ng ?t猲 ngi  l藀 t鴆 hi謓 trong danh s竎h h秓 h鱱. V?sau ch?c莕 nh蕁 <color=yellow><F6><color> l?bi誸 頲 h?c?online hay kh玭g.",
		--"Ta nghe c?ngi n鉯 v? th﹏ thi謓, ti襫 b鑙 c?th?n鉯 r?頲 kh玭g?",
		"<color=yellow>废话一堆....<color>",
	}
	TE_Talk("task_013_00_01",strMain);
end;

function task_013_00_01()
	local strMain = {
		--"Ngi ch琲 sau khi tr?th祅h h秓 h鱱 s?c?th猰 <color=yellow>甶觤 th﹏ thi謓<color>. Ngi ch琲 b譶h thng t?i nh qu竔, t竛 g蓇 c騨g 頲 t輓h 甶觤 th﹏ thi謓, m閠 s?v藅 ph萴 c bi謙 nh?hoa h錸g c騨g gi髉 t╪g 甶觤 th﹏ thi謓. N誹 tr猲 1000 甶觤 th﹏ thi謓 c?th?<color=yellow>K誸 Ngh躠 Kim Lan<color>, tr猲 1500 甶觤, hai ngi kh竎 gi韎 c?th?n C?o t譵 Nguy謙 L穙 k誸 th祅h <color=yellow>phu th?color>.",
		--"H秓 h鱱, kim lan ho芻 phu th?b譶h thng c飊g t?i luy謓 c玭g s?頲 t輓h th猰 kinh nghi謒.",
		--"Th秓 n祇 g莕 y c?nhi襲 ngi xin 頲 t?i.",
		--"R秐h r鏸 n猲 甶 g苝 <color=yellow>V?Nng<color>! B﹜ gi?c?th?quay v?g苝 D?T萿.",
		"回去找 <color=yellow>野叟<color>吧",
	}
	TE_Talk("task_013_01",strMain);
end;

-- 与镖师对话结束后改变任务变量：14
function task_013_01()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("Ti猽 s");
	TaskTip("回去找野叟");
end;

-- 回来与野叟的对话
function task_014_00()

	local strMain = {
		"知道怎么交朋友了吗?",
		--"Hi觰 r錳! Hay qu?",
		--"Gi?h穣 甶 m阨 m閠 ngi b筺 theo ngi v?y, s?c?<color=yellow>L?v藅<color> cho ngi! N誹 kh玭g t譵 頲 c?th?t?l藀 t?i r錳 m阨 b筺 h鱱 v? nh璶g  <color=yellow>l?v藅<color> s?kh玭g t鑤 l緈!"
	}
	TE_Talk("task_014_01",strMain);
end;

-- 与野叟对话后改变任务变量：15
function task_014_01()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("trao i nhi謒 v?v韎 ngi kh竎");
	TaskTip("找个朋友组队来见野叟");
end;



-- 玩家再次带朋友来与野叟对话
-- 传入参数：1 为已经组队  2 为还没有组队  3 为选不知道怎么组对  4 为选还没有组队
function task_015_check(nState)
	local strMain = {
		"有一个小礼物给你,希望你们两个能成为彼此的好朋友.",
		"想欺骗我吗?你的朋友在哪里?",
		"按<color=yellow>组队 <color>,邀请其他人加入队伍,然后过来找我.",
		"很多人来找我!",
		"希望您找到合适的朋友.",
		"如果找不到好朋友,请与某人合作并来看我!",
	}
	
	if (nState==1) then
		Talk(1,"task_015_01",strMain[1]);
	elseif (nState==2) then
		Talk(1,"",strMain[2]);
	elseif (nState==3) then
		Talk(1,"",strMain[3]);
	elseif (nState==4) then
		Talk(1,"",strMain[4]);
	elseif (nState==5) then
		Talk(1,"task_015_01",strMain[5]);
	elseif (nState==6) then
		Talk(1,"",strMain[6]);
	end
	
	return
	
end;

-- 带领了朋友来之后改变任务变量：16
function task_015_01()

local strMain = {
	"8级以后再来找我",
}

	TE_SetTeachAdd();
	GivePlayerAward_Teach("Nhi謒 v?k誸 giao h秓 h鱱");
	TaskTip("8级以后再回来找野叟!");
	TE_Talk("",strMain);
end;

-- 到了 8 级之后和野叟的对话
function task_016_00()

	local strMain = {
		"还有2个级才能加入门派派！",
		"感谢前辈给我指导.",
		"别客气,我的职责是指导菜鸟！",
		"但我仍然不知道从哪里开始!",
		"去找<color=yellow> 门派接引人 <color>, 了解 <color=yellow>各大门派<color> 的情况,然后回答我 <color=yellow>6个<color>问题."
	}

	TE_Talk("task_016_01",strMain);
end;

-- 与野叟对话结束后改变任务变量：17
function task_016_01()
	TE_SetTeachAdd();
	TaskTip("去找门派接引人");
end;

-- 再次回来与野叟的对话
function task_017_00()
	Say("您了解教派的特色吗?",2,"了解了/Teach_Qustion_001","还没有/task_exit");
	return
end;

-- 完全正确的回答问题后
function task_017_01()

	local strMain = {
		"很好去找 <color=yellow> 百晓生<color> ",
	}
	TE_Talk("task_017_02",strMain);
end;

-- 改变任务变量：18
function task_017_02()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("Hi觰 v?c竎 m玭 ph竔");
	TaskTip("去找 百晓生");
end;

-- 与百晓生的对话
function task_018_00()

	local strMain = {
		--"Theo B竎h ti猲 sinh p 竛 nh?v藋 ng kh玭g?",
		--"ng r錳! Ngi bi誸 g?v?s? hi謕, 萵 tam i <color=yellow>保存<color>?",
		--"Nh?ti猲 sinh ch?gi竜!",
		--"<color=green>B竎h Hi觰 Sinh<color>: Giang h?c?th藀 i ph竔 ph﹏ bi謙 l?Thi誹 L﹎, V?ng, Nga My, C竔 Bang, Л阯g M玭, Minh Gi竜, C玭 L玭, Ng?чc, Th髖 Y猲 v?Thi猲 Ba Dng ph? nh璶g hi謓 c?9 m玭 ph竔 thu nh薾  t?l?Thi誹 L﹎, V?ng, Nga My, C竔 Bang, Л阯g M玭, Ng?чc, Thi猲 Ba Dng Ph? C玭 L玭, Th髖 Y猲.",
		--"<color=green>B竎h Hi觰 Sinh<color>: Thi誹 L﹎ c?3 hng g錷 Thi襫 T玭g, V?T玭g v?T鬰 gia; V?ng c?T鬰 gia v?Чo gia; Nga My c?T鬰 gia v?Ph藅 gia; C竔 Bang c?T辬h Y v??Y; Л阯g M玭 c?m閠 hng; Thi猲 Ba Dng Ph?c?Thng k?v?Cung k? Ng?чc c?C?S?v?Hi謕 чc; C玭 L玭 c?Thi猲 S? Th髖 Y猲 c?V?N?v?Linh N? Nh璶g b蕋 c?c竎 m玭 ph竔 cung c蕄 m蕐 hng tu luy謓, m鏸 ngi ch?頲 ch鋘 m閠 hng tu h祅h.",
		--"<color=green>B竎h Hi觰 Sinh<color>: 17 hng ch?ch鋘 頲 1 th?ti誧 nh?",
		--"<color=green>B竎h Hi觰 Sinh<color>: V?v藋 m韎 c?保存. 17 hng hay 20 hng chung quy c騨g l?s?, hi謕, 萵 tam i 保存. N誹 c竎 h?hi觰 甶襲 n祔 th?s?kh玭g nghi ho芻 r錳.",
		--"Ti猲 sinh n鉯 r?h琻 頲 kh玭g?",
		"废话..",
	}
	TE_Talk("task_018_00_01",strMain);
end;

function task_018_00_01()
	local strMain = {
		--"S? hi謕, 萵 th鵦 t?ch?hng tu luy謓 c馻 nh﹏ v藅, ngi ch琲 theo <color=yellow>s?color> c?th﹏ th?cng tr竛g v?s鴆 m筺h h琻 ngi.",
		--"Theo <color=yellow>Hi謕<color> s鴆 m筺h v?nhanh nhen c﹏ b籲g; theo <color=yellow>萵<color> kh玭g quan tr鋘g b猲 ngo礽, ch?y誹 r蘮 luy謓 tinh th莕.",
		--"Ti猲 sinh n鉯 xem ta n猲 甶 theo hng n祇?",
		--"Ngi ch璦 gia nh藀 m玭 ph竔, sao ch鋘 頲 hng 甶, n猲 th﹏ tr鋘g khi a ra quy誸 nh.",
		--"Ti猲 sinh hng d蒼 th猰 頲 kh玭g?",	
		"废话..",
	}
	TE_Talk("task_018_01",strMain);
end;

-- 与百晓生的对话扩展
function task_018_01()

	local strMain = {
		--"Th藅 ra theo hng n祇 c騨g c?璾 甶觤 ri猲g c馻 n? c莕 ph秈 ch鋘 l鵤 s?ph?sau khi gia nh藀 m玭 ph竔.",
		--"Nhi襲 m玭 ph竔 v?nhi襲 hng tu luy謓, ta ph秈 l祄 sao?",
		--"Tu h祅h t飝 m鏸 ngi th玦!",
		--" t?ti猲 sinh!",
		--"H穣 quay v?g苝 <color=yellow>D?T萿<color> 甶!"
		"废话..",
	}
	TE_Talk("task_018_02",strMain);
end;

-- 与百晓生对话结束后改变任务变量：19
function task_018_02()
	TE_SetTeachAdd();
    Earn(100);
	ModifyReputation(4,0);
	GivePlayerExp(SKeyXinShou,"baixiaosheng")
	TaskTip("回去找野叟");
end;

-- 再次回来与野叟的对话
function task_019_00()

	local strMain = {
		"都知道了吧?",
		--"B竎h ti猲 sinh n鉯 v韎 v穘 b鑙 v?s?, hi謕, 萵 tam i 保存.",
		--"B竎h Hi觰 Sinh qu?th藅 m璾 tr?h琻 ngi, v?sau c莕 g?ngi c?n  th豱h gi竜. Чt <color=yellow>c蕄 9<color> n t譵 ta! Gi?h穣 甶 th豱h gi竜 <color=yellow>Ch?thng h閕<color>!"
	}
	TE_Talk("task_019_01",strMain);
end;

-- 与野叟对话结束后改变任务变量：20
function task_019_01()
	TE_SetTeachAdd();
	TaskTip("9级以后再来找野叟");
end;

-- 玩家到了 9 级之后和野叟对话
function task_020_00()

	local strMain = {
		"30年……真快！",
		"三十年前老年人怎么说?",
		"把信带给<color=yellow> 汴京 赵延年<color>",
	}

	TE_Talk("task_020_01",strMain);

end;

-- 与野叟对话结束后改变任务变量：21
function task_020_01()
	TE_SetTeachAdd();
	TaskTip("去找汴京 赵延年");
	AddItem(2,0,48,1);
	GivePlayerExp(SKeyXinShou,"yeshou3")
	RestoreStamina()
	--CreateTrigger(4,199,80);
end;


function task_021_00()

	local strMain = {
		"来"..GetPlayerSex().."陪我下棋",
		"野叟要我把这封信带给您！",
		"我明白了！",
		"（赵Yan打开信）",
		"我好饿,能找到一个<color=yellow>窝头<color>吗?",
		"窝头是……",
		"打开技能界面,制作窝头",
		--"Nh?k? Ngi m?<color=yellow>giao di謓 k?n╪g<color> ch鋘 <color=yellow>tuy謙 k?gia truy襫<color> sau  nh蕁 <color=yellow>B竛h ng?color> r錳 <color=yellow>уng ?color> l?頲.",
		--"в v穘 b鑙 th?xem!",
	}

	TE_Talk("task_021_01",strMain);

end;

-- 与赵延年对话结束后改变任务变量：22
function task_021_01()
	TE_SetTeachAdd();
	DelItem(2,0,48,1);
	GivePlayerExp(SKeyXinShou,"zhaoyannian")
	TaskTip("给赵延年做一个窝头");
end;



function task_022_00()

	local strMain = {
		"你是一个善良的人,让老人给你讲三十年前的故事.",
		"谢谢!",
		--"30 n╩ trc th竔 t?Tri謚 Khu玭g D蒼 畂箃 頲 <color=yellow>b秐  S琻 H?X?T綾<color> t?tay S礽 Vinh, b?m藅 li猲 l筩 c竎 m玭 ph竔 c飊g t譵 b秐  kho b竨 b猲 trong ng th阨 ph竧 ng binh bi課 Tr莕 ki襲, m璾  so竔 v? Kh玭g ai bi誸  ch輓h l?t蕀 b秐  c馻 Thi猲, мa, Nh﹏ <color=yellow>Tam Gi韎 ch蕁 ph?color>, long m筩h c馻 Trung Nguy猲, b竨 v藅 m?S礽 Vinh 甧m t輓h m筺g ra gi祅h l蕐. Vi謈 l祄 c馻 th竔 t?d蒼 n tr阨 t c╩ ph蒼, trong ng祔 i l?t?tr阨, S琻 H?X?T綾 t nhi猲 h鉧 th祅h tro b鬷, bay 甶 kh緋 n琲.",
		"三十年前...de.de...!",
		--"Th竔 t?bi誸 m譶h  l祄 ngh辌h ?tr阨, o l閚 c祅 kh玭 tam gi韎, y猽 ma hi謓 th? Trung Nguy猲 s緋 l﹎ v祇 i ki誴. в s鯽 sai l莔, m閠 b猲 ch蕁 ch豱h l筰 c竎 c鬰 di謓, m苩 kh竎 b?c竜 thi猲 h? hy v鋘g t譵 頲 ngi ki誱 l筰 nh鱪g m秐h b秐  S琻 H?X?T綾."
	};

	if GetItemCount(1,1,1)>=1 then
	    DelItem(1,1,1,1);
		TE_Talk("task_022_01",strMain);
		return
	else
		Say("快点做窝头啊!",0);
	end;
	
end;

-- 与赵延年对话结束后改变任务变量：23
function task_022_01()

	local strMsg = {
		--"C﹗ chuy謓 tng ch鮪g ch譵 v祇 qu猲 l穘g, t nhi猲 c?tin th竔 t?b筼 b謓h qua i, ngi k?v?kh玭g ph秈 th竔 t?Tri謚 c Phng m?l?em vua Tri謚 Quang Ngh躠, tin n lan truy襫 n d﹏ gi﹏....100 ng祅 binh l輓h c馻 nc Li猽  k?c薾 Nh筺 M玭 Quan, m閠 s?h祇 ki謙 lai l辌h kh玭g r?chi誱 c?Lng S琻 B筩, Th祅h Й ph?v?Tuy襫 Ch﹗ ph?xung quanh xu蕋 hi謓 nhi襲 qu?qu竔.",
		--"K?t? tin t鴆 v?t蕀 b秐  S琻 H?X?T綾 lan truy襫 kh緋 Trung Nguy猲.",
		--"Tng lai kh玭g xa, Trung Nguy猲 s?ph秈 i m苩 v韎 m閠 c鬰 di謓 tranh gi祅h, t祅 s竧 l蒼 nhau  c?頲 t蕀 b秐  qu?gi?蕐."
		"这个故事似乎被遗忘了",
	};
	local strMain = {
		"我不会袖手旁观!",
		"10级后来找我.",
		"我会的!"
	};

	TE_SetTeachAdd();
	TaskTip("10 级之后来找赵延年");
	GivePlayerExp(SKeyXinShou,"zhaoyannian_wotou")
	TE_Talk("",strMsg);
	TE_Talk("", strMain);
end;

function task_023_00()

	local strMain = {
		"很好！ 不要让我们失望.",
		--"Ta c?3 b鴆 th?nh?mang cho <color=yellow>D?T萿<color>. L祄 phi襫 b籲g h鱱 qu?",
		"好的!",
	}
	TE_Talk("task_023_01",strMain);
end;

-- 与赵延年对话结束后改变任务变量：24
-- 给予玩家三封信
function task_023_01()
	TE_SetTeachAdd();
	AddItem(2,0,49,3);
	TaskTip("带着3封信给野叟");
end;


function task_024_00()

	local strMain = {
		--"V?r錳 ? Ngi bi誸 Tri謚 Di猲 Ni猲 l?ai kh玭g?",
		--"V穘 b鑙 kh玭g bi誸!",
		--"Tri謚 Di猲 Ni猲 v鑞 ngi ho祅g t閏, do ch竛 c秐h tranh quy襫 ch鑞 ho祅g cung m?quy誸 nh b?h誸 danh l頸, phi猽 b箃 giang h?",
		--"Th?ra l?v藋!",
		--"Ngi  c?ch髏 th祅h t鵸, c?th?n c竎 m玭 ph竔 h鋍 h醝 th猰. C?g緉g nh?",
		"看信...",
	}
	TE_Talk("task_024_01",strMain);
end;


function task_024_01()

	local strMain = {
		"你能帮我把这3封信送出去吗",
		"给谁?",
		--"Tri謚 Di猲 Ni猲 lo c竎 a phng x秠 ra <color=yellow>bi課 c?color>, cho n猲 mu鑞 li猲 l筩 c竎 v?sau. <color=yellow>Kh蕌 Chu萵<color> ngi ch輓h tr鵦 hi謓 產ng l祄 quan ?<color=yellow>Bi謓 Kinh<color>; <color=yellow>Ph筸 Tr鋘g Y猰<color> v╪ quan hi謓 ?<color=yellow>Nam Th祅h Й<color>; <color=yellow>Vng Nghi謕 V?color> thng gia s祅h s?hi謓 ?<color=yellow>Tuy襫 Ch﹗<color>.",
		"<color=yellow>汴京的寇准,成都的范仲淹,泉州的王业伟<color>",
		"把它们带给他们！我有一些礼物给你,照顾好你的旅程！",
		"非常感谢",
	}
	TE_Talk("task_024_02",strMain);
end


-- 与野叟对话结束后改变任务变量：25
function task_024_02()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("Chuy謓 giang h");
	TaskTip("送信给 寇准、范仲淹、王业伟");
	SetTask(130,1); --王业伟
	SetTask(131,1); --寇准
	SetTask(132,1); --范仲淹
end;


-- 放弃做教育任务
function task_giveout()
--	TE_SetTeachState(23);
	Say("Th蕐 ngi b秐 l躰h h琻 ngi, l穙 y kh玭g c莕 d箉 nhi襲, v?sau 甶襲 g?kh玭g hi觰 c?th?n t譵 ta.", 0);
end;

-- 什么也不做的空函数
function task_exit()

end;






-- 基本操作
function Teach_Basic()

	local strMain = {
		"D飊g chu閠 ch?v祇 b蕋 k?n琲 n祇 trong b秐   di chuy觧 nh﹏ v藅. N誹 kh玭g x竎 nh 頲 v?tr? m?<color=yellow>B秐  nh?color>, d蕌 ch蕀 <color=yellow>v祅g<color> b猲 trong ch?cho v?tr?c馻 ngi ch琲.",
		"Ra ngo礽 th祅h n誹 kh玭g may ch?chu閠 l猲 qu竔, nh﹏ v藅 s?t?ng nh qu竔 li猲 t鬰, c莕 ch??",
	}
	TE_Talk("task_000_okay",strMain);
end;

-- 人物等级提升
function Teach_Level()

	local strMain = {
		"Nh﹏ v藅 d飊g <color=yellow>觤 kinh nghi謒<color>  t╪g c蕄. Nh蕁 <color=yellow><F3><color> m?Giao di謓 trang b?nh﹏ v藅 s?th蕐 <color=yellow>n髏 t╪g c蕄<color>. Khi 甶觤 kinh nghi謒 l韓 h琻 kinh nghi謒  t╪g c蕄, c?th?<color=yellow>t╪g c蕄 nh﹏ v藅<color>. Sau khi t╪g c蕄 nh﹏ v藅 s?c?<color=yellow>觤 ti襪 n╪g<color>. Ъng c蕄 c祅g cao 甶觤 ti襪 n╪g c祅g nhi襲.",
		"C?nhi襲 c竎h  nh薾 <color=yellow>觤 kinh nghi謒<color>, nh?nh qu竔, l祄 nhi謒 v? b?quan tu luy謓 th薽 ch?truy襫 c玭g...Kinh nghi謒 hi謓 t筰 秐h hng ng c蕄 v?k?n╪g nh﹏ v藅, n猲 c莕 ch??t?l?ph﹏ b?c﹏ b籲g!"
	}
	TE_Talk("task_000_okay",strMain);
end;

-- 介绍潜能点分配
function Teach_Point()

	local strMain = {
		"Nh﹏ v藅 c?5 ti襪 n╪g: <color=yellow>S鴆 m筺h<color>, <color=yellow>N閕 c玭g<color>, <color=yellow>G﹏ c鑤<color>, <color=yellow>Th﹏ ph竝<color>, <color=yellow>Linh ho箃<color>.",
		"<color=yellow>S鴆 m筺h<color> quy誸 nh nh ngo筰 c玭g v?s鴆 l鵦; <color=yellow>N閕 c玭g<color> quy誸 nh n閕 l鵦, nh n閕 c玭g v?ph遪g th?n閕.",
		"<color=yellow>G﹏ c鑤<color> quy誸 nh sinh l鵦 v?ph遪g th?ngo筰; <color=yellow>Th﹏ ph竝<color> quy誸 nh n?tr竛h, ch輓h x竎 v?t鑓  nh; <color=yellow>nh譶 r?color> quy誸 nh t蕁 c玭g ch?m筺g v?t?ng n?tr竛h, 秐h hng ch輓h x竎 v?t鑓  nh.",
		" LiT﹏ th?n猲 t╪g nhi襲 v祇 <color=yellow>S鴆 m筺h<color> v?<color=yellow>G﹏ c鑤<color>."
	}
	TE_Talk("task_000_okay",strMain);
end;

-- 介绍赚钱
function Teach_Earn()

	local strMain = {
		"Ngi c?th?ra ngo礽 th祅h nh qu竔 mang v藅 ph萴 v?b竛 cho c竎 ch?ti謒 ho芻 l祄 m閠 v礽 nhi謒 v?n gi秐. <color=yellow>B竎h Hi觰 Sinh<color> trong th祅h c?c﹗ h醝 cho T﹏ th? p ng s?頲 ph莕 thng. B猲 c筺h  tri襲 nh c遪 ph竔 Kh﹎ Sai i th莕 ti誴 t?T﹏ th? nh?n緈 b総 c?h閕 nh?",
		"дn <color=yellow>c蕄 10<color> c?th?mua b竛, v薾 ti猽, t譵 ki誱 kho b竨, nh l玦 i..."
	}
	TE_Talk("task_000_okay",strMain);
end;

-- 介绍拜入门派
function Teach_Faction()

	local strMain = {
		"Hi謓 c竎 m玭 ph竔 產ng thu nh薾  t? ta th蕐 ngi t?ch蕋 c騨g kh玭g t? ch?c莕 c?g緉g luy謓 n c蕄 10 i tho筰 v韎 <color=yellow>S?gi?m玭 ph竔<color> l?c?th?gia nh藀.",
		"M鏸 m玭 ph竔 c?hng tu luy謓 kh竎 nhau, c莕 t譵 hi觰 k?c s綾 c馻 h?"
	}
	TE_Talk("task_000_okay",strMain);
end;

-- 介绍当前能做的事情
function Teach_Something()

	local strMain = {
		"新人要与城市居民进行很多交流",
		"您可以出去与怪物战斗,但是您不可以走得太远,因为这个地方非常坚固,如果受伤,请找我免费治疗.最好陪伴队友.",
		"如果尝试完成指导菜鸟的任务对您有所帮助,则应注意以下注意事项,或按  <color=yellow><F11><color> 查看说明."
	}
	TE_Talk("task_000_okay",strMain);
end;





-- 六个问答题的内容
function Teach_Qustion_001()
	Say("我现在问你一些问题, 问题1: 几个门派收徒弟?",4,"10大门派/Teach_Qustion_Error","8大门派/Teach_Qustion_Error","9大门派（对）/Teach_Qustion_002","3大门派/Teach_Qustion_Error");
	return
end

function Teach_Qustion_002()
	Say("好答案！ 下一个问题: 武当剑法是谁练的",3,"道家弟子（对）/Teach_Qustion_003","俗家弟子/Teach_Qustion_Error","都是/Teach_Qustion_Error");
	return
end

function Teach_Qustion_003()
	Say("好答案！ 下一个问题: 唐门老大称为什么",4,"M玭 ch/Teach_Qustion_Error","姥姥（对）/Teach_Qustion_004","Chng m玭/Teach_Qustion_Error","T鎛g qu秐/Teach_Qustion_Error");
	return
end

function Teach_Qustion_004()
	Say("好答案！ 下一个问题: е t?t鬰 gia Nga My s?d鬾g binh kh?n祇?",4,"Th輈h/Teach_Qustion_Error","Ki誱/Teach_Qustion_Error","C莔（对）/Teach_Qustion_005","B髏/Teach_Qustion_Error");
	return
end

function Teach_Qustion_005()
	Say("好答案！ 下一个问题: 少林武术精耕细作,天地大技72项. 那么少林有几条修行路线?",4,"1条/Teach_Qustion_Error","2条/Teach_Qustion_Error","3条（对）/Teach_Qustion_006","4条/Teach_Qustion_Error");
	return
end

function Teach_Qustion_006()
	Say("好答案！ 下一个问题: Nghe n鉯  t?C竔 Bang c??Y, T辬h Y, v藋  t?T辬h Y tu luy謓 v?c玭g n祇?",4,"C玭 ph竝/Teach_Qustion_Error","Chng ph竝（对）/task_017_01","Thu莕 dng/Teach_Qustion_Error","B蓎/Teach_Qustion_Error");
	return
end

function Teach_Qustion_Error()
	Say("但是我们听到有人说不是, ngi th?v?xem l筰!",1,"好吧！ 再让我看看！/task_exit");
end
