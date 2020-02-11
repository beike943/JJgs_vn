-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 大理任务NPC龙象法僧Script
-- By StarryNight
-- 2006/01/13 PM 20:37

--爱情在岁月流转中逐渐腿色，剩下的会是什么……

-- ======================================================

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\大理\\task_head.lua")

function OnDeath(index)
	SetNpcLifeTime(index,15);--使得尸体消失
	return
end
   	