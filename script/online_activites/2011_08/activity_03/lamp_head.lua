--脚本功能：2011年中秋挂灯活动头文件
--功能策划：大熊
--功能开发：牛波、村长
--功能测试：饭姐
--开发时间：2011-8-10
--修改记录：
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\online_activites\\2011_08\\string.lua")
nActivityId_201108_lamp = 39
VET_201108_LAMPAWARD_TaskGroup=TaskManager:Create(4,1)
VET_201108_LAMPAWARD_TaskGroup.nDaySeq = 1
VET_201108_LAMPAWARD_TaskGroup.nGetLightNum = 2	
VET_201108_LAMPAWARD_TaskGroup.nBossDownNum = 3
--boss挂掉获得花灯
HOADANG_LOGTITLE = "Hoat Dong Hoi Hoa Dang 2011"
function vaf_liangshan_boss_down_20110803()
	if gf_CheckEventDateEx(nActivityId_201108_lamp) == 1 then
		local nBossNum = VET_201108_LAMPAWARD_TaskGroup:GetTask(VET_201108_LAMPAWARD_TaskGroup.nBossDownNum) + 1
		local tb_award = {2,1,30327,1}
		if zgc_pub_day_turn() ~= VET_201108_LAMPAWARD_TaskGroup:GetTask(VET_201108_LAMPAWARD_TaskGroup.nDaySeq) then 
			VET_201108_LAMPAWARD_TaskGroup:SetTask(VET_201108_LAMPAWARD_TaskGroup.nDaySeq,zgc_pub_day_turn())
			VET_201108_LAMPAWARD_TaskGroup:SetTask(VET_201108_LAMPAWARD_TaskGroup.nGetLightNum,0)
			nBossNum = 1
		end
		if VET_201108_LAMPAWARD_TaskGroup:GetTask(VET_201108_LAMPAWARD_TaskGroup.nGetLightNum) < 4 and mod(nBossNum,2) == 0 then
			gf_AddItemEx2(tb_award, "n hoa Trung Thu", HOADANG_LOGTITLE, "nh薾", 24*3600)
			VET_201108_LAMPAWARD_TaskGroup:SetTask(VET_201108_LAMPAWARD_TaskGroup.nGetLightNum,VET_201108_LAMPAWARD_TaskGroup:GetTask(VET_201108_LAMPAWARD_TaskGroup.nGetLightNum)+1)
		end
		VET_201108_LAMPAWARD_TaskGroup:SetTask(VET_201108_LAMPAWARD_TaskGroup.nBossDownNum,nBossNum)
	end
end
--每日任务获得物品
function vaf_liangshan_daily_task_20110803()
	if gf_CheckEventDateEx(nActivityId_201108_lamp) == 1 then
		local tb_award = {2,1,30327,1}
		gf_AddItemEx2(tb_award, "n hoa Trung Thu", HOADANG_LOGTITLE, "nh薾", 24*3600)
	end
end
--返回天数
function zgc_pub_day_turn(day_num)
	day_num = day_num or 1
	local time_return = floor((GetTime()-57600)/(86400*day_num))
	return time_return
end

--====================奖励相关==============
--文件\script\online\plant\tree_head.lua中已定义任务变量
TASK_PLAN_201108_SMALLTREE_COUNT = 429	--记录玩家当天种小树的次数
TASK_PLAN_201108_BIGTREE_COUNT = 431	--记录玩家当天种大树的次数
--小树奖励
function vaf_20110803_small_tree()
	if gf_CheckEventDateEx(nActivityId_201108_lamp) == 1 then
		local nTimes = GetTask(TASK_PLAN_201108_SMALLTREE_COUNT)
		if nTimes == 8 or nTimes == 16 then			
			local tb_award = {2,1,30327,1}
			gf_AddItemEx2(tb_award, "n hoa Trung Thu", HOADANG_LOGTITLE, "nh薾", 24*3600)
		end
	end
end
--大树奖励
function vaf_20110803_big_tree()
	if gf_CheckEventDateEx(nActivityId_201108_lamp) == 1 then
		local nTimes = GetTask(TASK_PLAN_201108_BIGTREE_COUNT)
		if nTimes == 4 or nTimes == 8 then			
			local tb_award = {2,1,30327,1}
			gf_AddItemEx2(tb_award, "n hoa Trung Thu", HOADANG_LOGTITLE, "nh薾", 24*3600)
		end
	end
end

function vaf_WulinshizhePersonalAwardHD()
	if gf_CheckEventDateEx(nActivityId_201108_lamp) == 1 then
		local tb_award = {2,1,30327,1}
		gf_AddItemEx2(tb_award, "n hoa Trung Thu", HOADANG_LOGTITLE, "nh薾", 24*3600)
	end
end

function vaf_WulinshizheTeamAwardHD()
	if gf_CheckEventDateEx(nActivityId_201108_lamp) == 1 then
		local tb_award = {2,1,30327,1}
		gf_AddItemEx2(tb_award, "n hoa Trung Thu", HOADANG_LOGTITLE, "nh薾", 24*3600)
	end
end