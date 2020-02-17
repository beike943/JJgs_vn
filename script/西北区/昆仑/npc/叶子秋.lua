-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 凤翔府NPC叶子秋Script
-- By StarryNight
-- 2007/06/13 AM 11:02

-- 心态，心态好重要，至少比女人重要。

-- ======================================================

-- 引用剧情任务头文件
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask = GetTask(TASK_XB_ID);
local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);
local nStep_XBTask_02 = GetTask(TASK_XB_ID_02);

	---------------------------------- 西北任务05陈仓暗度----------------------------------
	
	--带包裹给叶子秋对话
	if nStep_XBTask == 21 then
		task_005_06_0();
		return
	end
	
	--未回话给叶老
	if nStep_XBTask == 22 then
		task_005_06_1();
		return
	end
	
	---------------------------------- 西北任务06不死金丹----------------------------------
	
	--向叶子秋询问长生不老丹事情
	if nStep_XBTask == 26 then
		task_006_02_0();
		return
	end
	
	--未向赵子平询问长生不老丹事情
	if nStep_XBTask == 27 then
		task_006_02_1();
		return
	end
	
	---------------------------------- 西北区24分支2_1鬼门冤魂----------------------------------
	--与叶子秋对话交给他锁魂樽
	if nStep_XBTask_02 == 2 then
		task_024_03_0();
		return
	end
	
	--未将仙丹带给鬼门回廊处的昆仑弟子
	if nStep_XBTask_02 == 3 then
		task_024_03_1();
		return
	end
	
	---------------------------------- 西北区25分支2_2秘境骷髅----------------------------------
	
	--告诉叶子秋怨魂之王一事
	if nStep_XBTask_02 == 6 then
		task_025_01_0();
		return
	end

	--还未与天师秘境中受伤的昆仑弟子对话
	if nStep_XBTask_02 == 7 then
		task_025_01_1();
		return
	end
	
	--告知叶子秋骷髅王一事
	if nStep_XBTask_02 == 10 then
		task_025_04_0();
		return
	end
	
	--尚未告知欧阳画昆仑入世一事因由
	if nStep_XBTask_02 == 11 then
		task_025_04_1();
		return
	end

	---------------------------------- 西北区26分支2_3非常道人----------------------------------
	--受叶老所托与叶子秋对话
	if nStep_XBTask_02 == 13 then
		task_026_03_0();
		return
	end

	--未打倒非常道人对话
	if nStep_XBTask_02 == 14 then
		task_026_03_1();
		return
	end
	
	---------------------------------- 西北区27分支2_4古阳异兽----------------------------------
	--打倒非常道人后与叶子秋对话
	if nStep_XBTask_02 == 15 then
		task_027_01_0();
		return
	end

	--收集或未收集到10根火狐尾与螭龙须
	if nStep_XBTask_02 == 16 then
		task_027_02_0();
		return
	end
	
	--未与昆仑弟子对话获悉古阳兽行踪
	if nStep_XBTask_02 == 17 then
		task_027_02_1();
		return
	end
	
	---------------------------------- 西北区28分支2_5孪生玉壁----------------------------------
	--杀死古阳兽后与叶子秋对话
	if nStep_XBTask_02 == 18 then
		task_028_01_0();
		return
	end
	
	--还未杀死血魔人（补发聚灵匕首）
	if nStep_XBTask_02 == 19 then
		task_028_01_1();
		return
	end
	
	--已经杀死血魔人
	if nStep_XBTask_02 == 20 then
		task_028_02_0();
		return
	end
	
	---------------------------------- 西北区23分支1_14黄沙落幕----------------------------------
	--询问叶子秋关于沙漠幻象的事情
	if nStep_XBTask_01 == 62 then
		task_023_01_0();
		return
	end
	
	--还没打倒幻象前提示咒语
	if nStep_XBTask_01 == 63 then
		task_023_01_1();
		return
	end
	
	--还没打倒幻象前与叶子秋对话补领封妖塔
	if  nStep_XBTask_01 == 64 or nStep_XBTask_01 == 65 then
		task_023_01_2();
		return
	end
	
	--打倒幻象后交还封妖塔
	if nStep_XBTask_01 == 66 then
		task_023_04_0();
		return
	end
	
	--还未汇报欧阳画
	if nStep_XBTask_01 == 67 then
		task_023_04_1();
		return
	end
	
	--完成分支2后
	if nStep_XBTask_02 == 21 then
		task_028_02_1();
		return
	end
	
	--一般情况下的对话
	strTalk = {
		{"我发誓, 专心修道，荡尽天下妖魔，还天下太平."},
		{"昆仓一派，专志降妖伏魔，门派技艺皆以此为精。邪魔多藏于深山老林，不料中原江津村一地频频出现伤人魔物，昆仑第子怎可让奸邪为祸人间？"},
		{"Trung nguy猲 lu玭 nghi k? v韎 m玭 ph竔 ? xa nh璶g giang h? hi觤 竎 ta kh玭g n猲 tr竎h h?, m鋓 vi謈 c萵 th薾 v蒼 t鑤 h琻."},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
	
end;
