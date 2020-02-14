-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 凤翔府NPC捕头Script
-- By StarryNight
-- 2007/06/20 AM 10:54

-- 死了都要爱

-- ======================================================

-- 引用剧情任务头文件
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask = GetTask(TASK_XB_ID);
local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);

	---------------------------------- 西北区07男儿铮骨----------------------------------
	
	--询问袁飞云伤势
	if nStep_XBTask == 34 then
		task_007_03_0();
		return
	end
	
	--未给袁飞云送去伤药
	if nStep_XBTask == 35 then
		task_007_03_1();
		return
	end
	
	---------------------------------- 西北区20分支1_11兵不厌诈----------------------------------
	--与凤翔捕快对话询问袁飞云行踪
	if nStep_XBTask_01 == 52 then
		task_020_03_0();
		return
	end
	
	--还未杀死独行老陀和捕快对话
	if nStep_XBTask_01 == 53 then
		task_020_03_1();
		return
	end
	
	--一般情况下的对话
	local strTalk = {
		"第一步:什么最重要？",
		"那是什么?",
		"当然是两个字！我一直很尊敬袁飞云。"
		}
	
	TalkEx("",strTalk);
	return
	
end;
