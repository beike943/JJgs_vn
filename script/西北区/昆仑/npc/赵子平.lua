-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 凤翔府NPC赵子平Script
-- By StarryNight
-- 2007/06/13 PM 3:01

-- 太多太多的话，都来不及说，还是上个厕所好了。

-- ======================================================

-- 引用剧情任务头文件
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

	local nStep_XBTask = GetTask(TASK_XB_ID);
	
	---------------------------------- 西北任务06不死金丹----------------------------------
	
	--领取收集硫磺任务
	if nStep_XBTask == 27 then
		task_006_03_0();
		return
	end
	
	--已经收集（或未收集）了10个硫磺，领取收集硝石任务
	if nStep_XBTask == 28 then
		task_006_04_0();
		return
	end
	
	--已经收集（或未收集）了10个硝石
	if nStep_XBTask == 29 then
		task_006_05_0();
		return
	end
	
	--尚未回车轮霸王处复命
	if nStep_XBTask == 30 then
		task_006_05_1();
		return
	end
	
	--一般情况下的对话
	Say("大侠要去zys?", 2, "马上去那里/goto_zys", "在下随便看看/nothing");
	return
	
end;

function goto_zys()
	NewWorld(6073, 1586, 3222);
	SetFightState(1);
	SetCampToPlayer("camp_enemy");
end
