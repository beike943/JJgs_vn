--=============================================
--create by liubo 2011.8.2
--describe:越南版8月份活动 **NPC灯柱脚本文件
--=============================================
Include ("\\script\\lib\\globalfunctions.lua")
Include ("\\script\\online_activites\\2011_08\\string.lua")
Include ("\\script\\misc\\taskmanager.lua")

VET_201108_LAMP_LOG_TITLE = "Hoat dong Hoa Dang 2011"

--活动ID
VET_201108_LAMP_ACTIVITY_ID = 39
--挂花灯时间间隔(s)
VET_201108_LAMP_TIME = 600
--活动任务变量创建
VET_201108_LAMP_TaskGroup = TaskManager:Create(3,2)
--10分钟间隔
VET_201108_LAMP_TaskGroup.Time = 1
--1天内总数
VET_201108_LAMP_TaskGroup.Seven_Day = 2
--重置天
VET_201108_LAMP_TaskGroup.Day = 3
--地图ID
VET_201108_LAMP_TaskGroup.Map_ID = 4
--各地图单独计数
VET_201108_LAMP_TaskGroup.Map_300 = 5
VET_201108_LAMP_TaskGroup.Map_100 = 6
VET_201108_LAMP_TaskGroup.Map_200 = 7
VET_201108_LAMP_TaskGroup.Map_350 = 8
VET_201108_LAMP_TaskGroup.Map_150 = 9
VET_201108_LAMP_TaskGroup.Map_400 = 10
VET_201108_LAMP_TaskGroup.Map_500 = 11

function main()
	if gf_CheckEventDateEx(VET_201108_LAMP_ACTIVITY_ID) == 1 then
		Say(VET_201108_NPCLAMP_LIST.Title,3,VET_201108_NPCLAMP_LIST.Options[1].subTitle.."/activity_show",VET_201108_NPCLAMP_LIST.Options[2].subTitle.."/hang_lamp",VET_201108_NPCLAMP_LIST.Exit.."/Exit")
	else
		Talk(1,"",VET_201108_NPCLAMP_LIST.Other)
	end
end

function activity_show()
	Say(VET_201108_NPCLAMP_LIST.Options[1].subTitle,2,VET_201108_NPCLAMP_LIST.Options[1].subOptions[1].Process.."/activity_process",VET_201108_NPCLAMP_LIST.Options[1].subOptions[2].Process.."/award_show")
end

function hang_lamp()
	--等级，技能条件
	local nLevel = GetLevel()
	if nLevel < 77 or GetPlayerFaction() == 0 or gf_Check55HaveSkill() == 0 then
		Talk(1, "", VET_201108_STRING_LIST[7])
		return
	end
	--不是同一天，初始化
	local nDay = zgc_pub_day_turn()
	if nDay ~= VET_201108_LAMP_TaskGroup:GetTask(VET_201108_LAMP_TaskGroup.Day) then
		--该天的次数置为0
		VET_201108_LAMP_TaskGroup:SetTask(VET_201108_LAMP_TaskGroup.Seven_Day,0)
		--重置天
		VET_201108_LAMP_TaskGroup:SetTask(VET_201108_LAMP_TaskGroup.Day,nDay)
		--地图置为0
		VET_201108_LAMP_TaskGroup:SetTask(VET_201108_LAMP_TaskGroup.Map_ID,0)
		--地图单独计数器清零
		VET_201108_LAMP_TaskGroup:SetTask(VET_201108_LAMP_TaskGroup.Map_300,0)
		VET_201108_LAMP_TaskGroup:SetTask(VET_201108_LAMP_TaskGroup.Map_100,0)
		VET_201108_LAMP_TaskGroup:SetTask(VET_201108_LAMP_TaskGroup.Map_200,0)
		VET_201108_LAMP_TaskGroup:SetTask(VET_201108_LAMP_TaskGroup.Map_350,0)
		VET_201108_LAMP_TaskGroup:SetTask(VET_201108_LAMP_TaskGroup.Map_150,0)
		VET_201108_LAMP_TaskGroup:SetTask(VET_201108_LAMP_TaskGroup.Map_400,0)
		VET_201108_LAMP_TaskGroup:SetTask(VET_201108_LAMP_TaskGroup.Map_500,0)
	end
	--是否拥有物品
	local nCount = GetItemCount(VET_201108_ITEM_LIST[4][2],VET_201108_ITEM_LIST[4][3],VET_201108_ITEM_LIST[4][4])
	if nCount < 1 then
		Talk(1,"",VET_201108_NPCLAMP_LIST.Options[2].subOptions[1])
		return
	end
	--一天已挂花灯的总次数
	local nTimes = VET_201108_LAMP_TaskGroup:GetTask(VET_201108_LAMP_TaskGroup.Seven_Day)
	--是否一天没满7次
	if nTimes >= 7 then 
		Talk(1,"",VET_201108_NPCLAMP_LIST.Options[2].subOptions[3])
		return
	end
	--是否间隔10分钟
	if GetTime() < VET_201108_LAMP_TaskGroup:GetTask(VET_201108_LAMP_TaskGroup.Time) then
		Talk(1,"",VET_201108_NPCLAMP_LIST.Options[2].subOptions[2])
		return 
	end
	local nMap_Id,_,_ = GetWorldPos()
	if nMap_Id == 300 then
		local nNum = random(100)
		local nTimes_Every = VET_201108_LAMP_TaskGroup:GetTask(VET_201108_LAMP_TaskGroup.Map_300) or 0
		if nNum > VET_201108_TB_ODDS[nTimes_Every+1][1] then
			--删除一个彩灯
			if DelItem(VET_201108_ITEM_LIST[4][2],VET_201108_ITEM_LIST[4][3],VET_201108_ITEM_LIST[4][4],1) == 0 then 
				return
			end
			Talk(1,"",VET_201108_NPCLAMP_LIST.Options[2].subOptions[4])		
			--清零
			VET_201108_LAMP_TaskGroup:SetTask(VET_201108_LAMP_TaskGroup.Map_300,0)
		else
			--删除一个彩灯
			if DelItem(VET_201108_ITEM_LIST[4][2],VET_201108_ITEM_LIST[4][3],VET_201108_ITEM_LIST[4][4],1) == 0 then 
				return
			end
			--挂灯笼成功
			gf_Modify("Exp",VET_201108_TB_ODDS[nTimes_Every+1][2])
			WriteLogEx(VET_201108_LAMP_LOG_TITLE, "nh薾 "..VET_201108_TB_ODDS[nTimes_Every+1][2].." exp")	
			Talk(1,"",format(VET_201108_NPCLAMP_LIST.Options[2].subOptions[5],nTimes_Every+1,VET_201108_TB_ODDS[nTimes_Every+1][2]))
			--任务变量设置
			VET_201108_LAMP_TaskGroup:SetTask(VET_201108_LAMP_TaskGroup.Map_300,VET_201108_LAMP_TaskGroup:GetTask(VET_201108_LAMP_TaskGroup.Map_300)+1)
		end
	elseif nMap_Id == 100 then
		local nNum = random(100)
		local nTimes_Every = VET_201108_LAMP_TaskGroup:GetTask(VET_201108_LAMP_TaskGroup.Map_100) or 0
		if nNum > VET_201108_TB_ODDS[nTimes_Every+1][1] then
			--删除一个彩灯
			if DelItem(VET_201108_ITEM_LIST[4][2],VET_201108_ITEM_LIST[4][3],VET_201108_ITEM_LIST[4][4],1) == 0 then 
				return
			end
			Talk(1,"",VET_201108_NPCLAMP_LIST.Options[2].subOptions[4])
			--清零
			VET_201108_LAMP_TaskGroup:SetTask(VET_201108_LAMP_TaskGroup.Map_100,0)
		else
			--删除一个彩灯
			if DelItem(VET_201108_ITEM_LIST[4][2],VET_201108_ITEM_LIST[4][3],VET_201108_ITEM_LIST[4][4],1) == 0 then 
				return
			end
			--挂灯笼成功
			gf_Modify("Exp",VET_201108_TB_ODDS[nTimes_Every+1][2])	
			WriteLogEx(VET_201108_LAMP_LOG_TITLE, "nh薾 "..VET_201108_TB_ODDS[nTimes_Every+1][2].." exp")	
			Talk(1,"",format(VET_201108_NPCLAMP_LIST.Options[2].subOptions[5],nTimes_Every+1,VET_201108_TB_ODDS[nTimes_Every+1][2]))
			--任务变量设置
			VET_201108_LAMP_TaskGroup:SetTask(VET_201108_LAMP_TaskGroup.Map_100,VET_201108_LAMP_TaskGroup:GetTask(VET_201108_LAMP_TaskGroup.Map_100)+1)
		end
	elseif nMap_Id == 200 then
		local nNum = random(100)
		local nTimes_Every = VET_201108_LAMP_TaskGroup:GetTask(VET_201108_LAMP_TaskGroup.Map_200) or 0
		if nNum > VET_201108_TB_ODDS[nTimes_Every+1][1] then
			--删除一个彩灯
			if DelItem(VET_201108_ITEM_LIST[4][2],VET_201108_ITEM_LIST[4][3],VET_201108_ITEM_LIST[4][4],1) == 0 then 
				return
			end
			Talk(1,"",VET_201108_NPCLAMP_LIST.Options[2].subOptions[4])
			--清零
			VET_201108_LAMP_TaskGroup:SetTask(VET_201108_LAMP_TaskGroup.Map_200,0)
		else
			--删除一个彩灯
			if DelItem(VET_201108_ITEM_LIST[4][2],VET_201108_ITEM_LIST[4][3],VET_201108_ITEM_LIST[4][4],1) == 0 then 
				return
			end
			--挂灯笼成功
			gf_Modify("Exp",VET_201108_TB_ODDS[nTimes_Every+1][2])	
			WriteLogEx(VET_201108_LAMP_LOG_TITLE, "nh薾 "..VET_201108_TB_ODDS[nTimes_Every+1][2].." exp")	
			Talk(1,"",format(VET_201108_NPCLAMP_LIST.Options[2].subOptions[5],nTimes_Every+1,VET_201108_TB_ODDS[nTimes_Every+1][2]))
			--任务变量设置
			VET_201108_LAMP_TaskGroup:SetTask(VET_201108_LAMP_TaskGroup.Map_200,VET_201108_LAMP_TaskGroup:GetTask(VET_201108_LAMP_TaskGroup.Map_200)+1)
		end
	elseif nMap_Id == 350 then
		local nNum = random(100)
		local nTimes_Every = VET_201108_LAMP_TaskGroup:GetTask(VET_201108_LAMP_TaskGroup.Map_350) or 0
		if nNum > VET_201108_TB_ODDS[nTimes_Every+1][1] then
			--删除一个彩灯
			if DelItem(VET_201108_ITEM_LIST[4][2],VET_201108_ITEM_LIST[4][3],VET_201108_ITEM_LIST[4][4],1) == 0 then 
				return
			end
			Talk(1,"",VET_201108_NPCLAMP_LIST.Options[2].subOptions[4])
			--清零
			VET_201108_LAMP_TaskGroup:SetTask(VET_201108_LAMP_TaskGroup.Map_350,0)
		else
			--删除一个彩灯
			if DelItem(VET_201108_ITEM_LIST[4][2],VET_201108_ITEM_LIST[4][3],VET_201108_ITEM_LIST[4][4],1) == 0 then 
				return
			end
			--挂灯笼成功
			gf_Modify("Exp",VET_201108_TB_ODDS[nTimes_Every+1][2])	
			WriteLogEx(VET_201108_LAMP_LOG_TITLE, "nh薾 "..VET_201108_TB_ODDS[nTimes_Every+1][2].." exp")
			Talk(1,"",format(VET_201108_NPCLAMP_LIST.Options[2].subOptions[5],nTimes_Every+1,VET_201108_TB_ODDS[nTimes_Every+1][2]))
			--任务变量设置
			VET_201108_LAMP_TaskGroup:SetTask(VET_201108_LAMP_TaskGroup.Map_350,VET_201108_LAMP_TaskGroup:GetTask(VET_201108_LAMP_TaskGroup.Map_350)+1)
		end
	elseif nMap_Id == 150 then
		local nNum = random(100)
		local nTimes_Every = VET_201108_LAMP_TaskGroup:GetTask(VET_201108_LAMP_TaskGroup.Map_150) or 0
		if nNum > VET_201108_TB_ODDS[nTimes_Every+1][1] then
			--删除一个彩灯
			if DelItem(VET_201108_ITEM_LIST[4][2],VET_201108_ITEM_LIST[4][3],VET_201108_ITEM_LIST[4][4],1) == 0 then 
				return
			end
			Talk(1,"",VET_201108_NPCLAMP_LIST.Options[2].subOptions[4])
			--清零
			VET_201108_LAMP_TaskGroup:SetTask(VET_201108_LAMP_TaskGroup.Map_150,0)
		else
			--删除一个彩灯
			if DelItem(VET_201108_ITEM_LIST[4][2],VET_201108_ITEM_LIST[4][3],VET_201108_ITEM_LIST[4][4],1) == 0 then 
				return
			end
			--挂灯笼成功
			gf_Modify("Exp",VET_201108_TB_ODDS[nTimes_Every+1][2])	
			WriteLogEx(VET_201108_LAMP_LOG_TITLE, "nh薾 "..VET_201108_TB_ODDS[nTimes_Every+1][2].." exp")
			Talk(1,"",format(VET_201108_NPCLAMP_LIST.Options[2].subOptions[5],nTimes_Every+1,VET_201108_TB_ODDS[nTimes_Every+1][2]))
			--任务变量设置
			VET_201108_LAMP_TaskGroup:SetTask(VET_201108_LAMP_TaskGroup.Map_150,VET_201108_LAMP_TaskGroup:GetTask(VET_201108_LAMP_TaskGroup.Map_150)+1)
		end
	elseif nMap_Id == 400 then
		local nNum = random(100)
		local nTimes_Every = VET_201108_LAMP_TaskGroup:GetTask(VET_201108_LAMP_TaskGroup.Map_400) or 0
		if nNum > VET_201108_TB_ODDS[nTimes_Every+1][1] then
			--删除一个彩灯
			if DelItem(VET_201108_ITEM_LIST[4][2],VET_201108_ITEM_LIST[4][3],VET_201108_ITEM_LIST[4][4],1) == 0 then 
				return
			end
			Talk(1,"",VET_201108_NPCLAMP_LIST.Options[2].subOptions[4])
			--清零
			VET_201108_LAMP_TaskGroup:SetTask(VET_201108_LAMP_TaskGroup.Map_400,0)
		else
			--删除一个彩灯
			if DelItem(VET_201108_ITEM_LIST[4][2],VET_201108_ITEM_LIST[4][3],VET_201108_ITEM_LIST[4][4],1) == 0 then 
				return
			end
			--挂灯笼成功
			gf_Modify("Exp",VET_201108_TB_ODDS[nTimes_Every+1][2])	
			WriteLogEx(VET_201108_LAMP_LOG_TITLE, "nh薾 "..VET_201108_TB_ODDS[nTimes_Every+1][2].." exp")
			Talk(1,"",format(VET_201108_NPCLAMP_LIST.Options[2].subOptions[5],nTimes_Every+1,VET_201108_TB_ODDS[nTimes_Every+1][2]))
			--任务变量设置
			VET_201108_LAMP_TaskGroup:SetTask(VET_201108_LAMP_TaskGroup.Map_400,VET_201108_LAMP_TaskGroup:GetTask(VET_201108_LAMP_TaskGroup.Map_400)+1)
		end
	elseif nMap_Id == 500 then
		local nNum = random(100)
		local nTimes_Every = VET_201108_LAMP_TaskGroup:GetTask(VET_201108_LAMP_TaskGroup.Map_500) or 0
		if nNum > VET_201108_TB_ODDS[nTimes_Every+1][1] then
			--删除一个彩灯
			if DelItem(VET_201108_ITEM_LIST[4][2],VET_201108_ITEM_LIST[4][3],VET_201108_ITEM_LIST[4][4],1) == 0 then 
				return
			end
			Talk(1,"",VET_201108_NPCLAMP_LIST.Options[2].subOptions[4])
			--清零
			VET_201108_LAMP_TaskGroup:SetTask(VET_201108_LAMP_TaskGroup.Map_500,0)
		else
			--删除一个彩灯
			if DelItem(VET_201108_ITEM_LIST[4][2],VET_201108_ITEM_LIST[4][3],VET_201108_ITEM_LIST[4][4],1) == 0 then 
				return
			end
			--挂灯笼成功
			gf_Modify("Exp",VET_201108_TB_ODDS[nTimes_Every+1][2])	
			WriteLogEx(VET_201108_LAMP_LOG_TITLE, "nh薾 "..VET_201108_TB_ODDS[nTimes_Every+1][2].." exp")
			Talk(1,"",format(VET_201108_NPCLAMP_LIST.Options[2].subOptions[5],nTimes_Every+1,VET_201108_TB_ODDS[nTimes_Every+1][2]))
			--任务变量设置
			VET_201108_LAMP_TaskGroup:SetTask(VET_201108_LAMP_TaskGroup.Map_500,VET_201108_LAMP_TaskGroup:GetTask(VET_201108_LAMP_TaskGroup.Map_500)+1)
		end
	end
	VET_201108_LAMP_TaskGroup:SetTask(VET_201108_LAMP_TaskGroup.Time,GetTime()+VET_201108_LAMP_TIME)
	VET_201108_LAMP_TaskGroup:SetTask(VET_201108_LAMP_TaskGroup.Seven_Day,VET_201108_LAMP_TaskGroup:GetTask(VET_201108_LAMP_TaskGroup.Seven_Day)+1)
end

function Exit()
	--do nothing
end

function activity_process()
	Say(VET_201108_NPCLAMP_LIST.Options[1].subOptions[1].Content,1,VET_201108_NPCLAMP_LIST.Options[1].backMenu.."/back_menu")
end

function award_show()
	Say(VET_201108_NPCLAMP_LIST.Options[1].subOptions[2].Content,1,VET_201108_NPCLAMP_LIST.Options[1].backMenu.."/back_menu")
end

function back_menu()
	--返回菜单
	main()
end

--返回天数
function zgc_pub_day_turn(day_num)
	day_num = day_num or 1
	local time_return = floor((GetTime()-57600)/(86400*day_num))
	return time_return
end


function ServerStartUp()
--	local npcIndex = 0;
--	local tNpcInfo = {
--		"Hoa ng3",
--		"C閠 treo n",
--		{
--			{300,1718,3539},
--			{100,1408,2976},
--			{200,1361,2880},
--			{350,1424,2991},
--			{150,1673,3135},
--			{400,1544,2960},
--			{500,1736,3136},
--		},
--		"\\script\\online_activites\\2011_08\\activity_03\\lamp_npc_script.lua",
--	}
--	for i = 1,getn(tNpcInfo[3]) do
--		npcIndex = CreateNpc(tNpcInfo[1],tNpcInfo[2],tNpcInfo[3][i][1],tNpcInfo[3][i][2],tNpcInfo[3][i][3])
--		SetNpcScript(npcIndex,tNpcInfo[4])
--	end
end
function PlayerLogin()
end