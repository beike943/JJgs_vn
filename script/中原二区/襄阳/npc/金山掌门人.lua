
---------------------------------------------------------
--	金山掌门人
--	帮会的任务接口人 - Jeep tag
---------------------------------------------------------

Include("\\script\\online\\viet_event\\200911\\event_head.lua");
Include("\\script\\online\\viet_event\\200909\\9\\head.lua");
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");

function main()
--	if (SCCheckCanGetOfflineExp() > 0) then
--		Say("<color=green>金山掌门人<color>：各位侠士成天勤学苦练，本座自是欣赏。不过凡事必有尺度，过犹不及。老夫近日正在研制一例脱离肉体的神游修身之道，可将每日领悟的功力传给各位。这道武学可在休息时日也能增长武学。一次传送的功力仅可持续<color=yellow>8个<color>时辰。除此之外，还研制出一种周期传功的功力，此新功力可在近<color=yellow>7日<color>内获得共<color=yellow>56个<color>时辰的持续功力，众侠士可免去奔波之苦。记住，周期传功期间不可再接收普通传功，众侠士可在每日任何时刻来找我。",
--			3,
--			"接受1日传功，可获得每天离线经验8个时辰(奉上5J供掌门继续研制所需)/iiiiiiwantwant",
--			"接收7日传功，可获得7天离线经验56个时辰(奉上50J供掌门继续研制所需)/i77777777want",
--			"我另找掌门有事/main_1")
--	else

	local tbDialog = {
		"我想解决有关帮会的的事情/main_1",
		"离开/noooooo_say"
		};
	if tonumber(date("%Y%m%d")) >= 20090928 and tonumber(date("%Y%m%d")) <= 20091025 then
		tinsert(tbDialog ,1,"在中秋节之际，我有些礼物要送给帮主，希望帮主收下。/give_letter")
	end	
	
	if GetTaskTrans() >= 8 then
		tinsert(tbDialog ,1,"了解帮会发展/view_info")	
		tinsert(tbDialog ,1,"想做帮会运输任务/translife_task_2")
	end
	
	Say("<color=green>金山掌门人<color>:你来找我有什么事吗?",
		getn(tbDialog),
		tbDialog
		)
--	end
end

function translife_task_2()
	local nDate = tonumber(date("%Y%m%d"))
	if GetTask(2148) ~= nDate then		
		gf_SetTaskByte(2161,2,0)
		gf_SetTaskByte(2161,3,0)
		SetTask(2148,nDate)
	end	
	if gf_GetTaskByte(2161,2) >= 2 then
		if GetTask(1537) == 9 then
			SetTask(1537,10)			
		end
	end	
	if GetTaskTrans() == 8 then
		trans_talk_09()	
	elseif GetTaskTrans() == 10 then
		trans_talk_10()
	elseif GetTaskTrans() == 11 then
		trans_talk_11()
	elseif GetTaskTrans() == 12 then	
		trans_talk_12()
	elseif GetTaskTrans() == 13 then	 	
		trans_talk_13()
	else
		Talk(1,"",szNpcName.."那里混乱得得天翻地复，谁想得到？")
		return
	end
end


function i77777777want()
	if GetTask(OFFLINE_EXP_TIME) > 0 then
		Say("我上次给你的经验还没用完，你想换吗?",
			2,
			"是的/yes7777777",
			"让我想想/noooooo_say")
	else
		yes7777777()
	end
end

function yes7777777()
	local nMoney = GetCash()
	if nMoney < 500000 then
		Talk(1, "", "你好啊朋友貌！")
	else
		Pay(500000)
		Talk(1, "", "你的离线经验时间为<color=yellow>112个小时<color>")
		SCCheckOfflineExp(1, 1)
		Msg2Player("你有112个小时的离线经验点")
	end
end

function iiiiiiwantwant()
	if GetTask(OFFLINE_EXP_TIME) > 0 then
		Say("我上次给你的经验还没用完，你想换吗?",
			2,
			"是的/yes1111111",
			"让我想想/noooooo_say")
	else
		yes1111111()
	end
end

function yes1111111()
	local nMoney = GetCash()
	if (nMoney < 50000) then
		Talk(1, "", "你好啊朋友貌！")
	else
		Pay(50000)
		Talk(1, "", "你的离线经验时间为<color=yellow>16个小时<color>")
		SCCheckOfflineExp(1, 0)
		Msg2Player("你有16个小时的离线经验点")
	end
end

function main_1()
	local bWantCreateTong = GetTask(297)
	local bWantDestoryTong = GetTask(295)

	-- <bWantDestoryTong == 1>表示玩家已经到帮会介绍人处申请解散帮会，来这里申请
	-- <bWantDestoryTong == 2>表示玩家已经在这里申请过解散帮会，又来骚扰金山掌门人了
	-- <bWantDestoryTong == 3>表示金山掌门人已经答应了解散帮会的申请
	
	-- <bWantCreateTong == 1>表示玩家已经到帮会介绍人处申请建立帮会，来这里申请
	-- <bWantCreateTong == 2>表示玩家已经获得了金山掌门人的认可，得到了(会盟令牌)
	
-- 解散帮会的部分分割线 -- 开始 ------------------------------------------------------------------------------	
	if (bWantDestoryTong == 1) then		-- 想要解散帮会
		Say("我从我的手下那里听说你想解散这个帮派归隐山林，对吧?",
		    2,
		    "我已经决定，请掌门人同意！/first_apply_destroy_tong",
		    "我想了想，我不想再解散了./cancel_destroy_tong")
		return
	end
	
	if (bWantDestoryTong == 2) then		-- 已经申请了，想要正式解散帮会或者是取消解散帮会
		Say("又来了，你想解散帮会吗?",
		    2,
		    "我已经考虑过了，我不想离开我的兄弟们，所以我不想再解散了。/cancel_destroy_tong",
		    "是的，我已经决定了。/second_apply_destroy_tong")
		return
	end
	
	if (bWantDestoryTong == 3) then		-- 已经被答应了
		Say("金山掌门人同意了你的请求", 0)
		return
	end
-- 解散帮会的部分分割线 -- 结束 ------------------------------------------------------------------------------

-- 建立帮会的部分分割线 -- 开始 ------------------------------------------------------------------------------
	if (bWantCreateTong == 1) then		-- 帮会介绍人介绍来的，给他检查情况！
		Say("我听到我的人说，你想建立一个帮会，召集天下的英雄，对吧?",
		    1,
		    "是的，我想让我们的英雄们团结在一起。/check_apply_create_tong_cond")
		return
	end
	
	if (bWantCreateTong == 2) then
		Talk(1,"","汴京，成都，泉州都有帮派使者，你可以去那里解散帮派，我已经派人通知他们了。</font></font>")
		return
	end
-- 建立帮会的部分分割线 -- 结束 ------------------------------------------------------------------------------
	
-- 领取仙草露的功能对话 -- 开始 ------------------------------------------------------------------------------
	local bIsTongMember = IsTongMember()		-- 判断这个玩家是不是帮会成员
	local bChangedPopulation = 0			-- 判断帮会人气是否有改变过
	local bTongLadder = 0				-- 这个玩家的帮会当前人气排名
	local nLastTongPopulation = GetTask(298)	-- 这个玩家上次的人气数值，和当前相同的话就是不用再领取了
	local nLastGetPrizeDate = GetTask(299)		-- 这个玩家上次领取仙草的日期（每天只能领一次）
	local nCurTongPopulation = nLastTongPopulation	-- 这个玩家当前的人气数值
	
	local nCurPrizeDate = {date("%y"), date("%m"), date("%d")}
	local nCurPrizeDateNum = tonumber(nCurPrizeDate[1]..nCurPrizeDate[2]..nCurPrizeDate[3])	-- 当前时间(年月日)
	local nExpireDataNum = tonumber("5".."11".."11")	-- 过期的时间
	
	-- 如果是帮会成员的话，就改变nCurTongPopulation和bTongLadder两个数值
	-- 而且是在2005年11月11日以前
	if ((bIsTongMember == 1) and (nCurPrizeDateNum < nExpireDataNum)) then
		bTongLadder = GetTongPopuLadder()
		nCurTongPopulation = GetTongPopulation()
	end
	
	-- 如果人气数值不相等，就是有更新过了
	if ((nCurTongPopulation ~= nLastTongPopulation) and (nCurPrizeDateNum ~= nLastGetPrizeDate)) then
		bChangedPopulation = 1
	end
	
	if ((bTongLadder == 1) and (bChangedPopulation == 1)) then	-- 如果是第一名，而且今天没有领，领3个仙草
		SetTask(298, nCurTongPopulation)
		SetTask(299, nCurPrizeDateNum)
		AddItem(2,0,109,3)
		Talk(1,"","你当前的公会排名第一名，得到<color=yellow>3个仙草的奖励<color>.")
		return
	end
	
	if ((bTongLadder == 2) and (bChangedPopulation == 1)) then	-- 如果是第二名，而且今天没有领，领2个仙草
		SetTask(298, nCurTongPopulation)
		SetTask(299, nCurPrizeDateNum)
		AddItem(2,0,109,2)
		Talk(1,"","你当前的公会排名第一名，得到<color=yellow>2个仙草的奖励<color>.")
		return
	end
	
	if ((bTongLadder == 3) and (bChangedPopulation == 1)) then	-- 如果是第三名，而且今天没有领，领1个仙草
		SetTask(298, nCurTongPopulation)
		SetTask(299, nCurPrizeDateNum)
		AddItem(2,0,109,1)
		Talk(1,"","你当前的公会排名第一名，得到<color=yellow>1个仙草的奖励<color>.")
		return
	end

-- 领取仙草露的功能对话 -- 结束 ------------------------------------------------------------------------------
	-- 没有想要建立帮会，闲聊
	local bIsTongMaster = IsTongMaster()
	if (bIsTongMaster == 0) then
		Talk(1,"","L穙 phu tung ho祅h giang h?  nhi襲 n╩ nh薾 頲 s鵦 tin y猽 c馻 ng o, nay m nh薾 ch鴆 minh ch? c馻 V? L﹎, kh玭g bi誸 trong giang h? c遪 ai c? th? x鴑g 頲 v韎 danh hi謚 <color=yellow>Чi hi謕<color> n祔 kh玭g?")
	else
		Talk(1,"","你已经是一个帮会的帮主了，你可以召集你的兄弟们，坚持住。")
	end
end;





-- 第一次向掌门人申请，要解散帮会
function first_apply_destroy_tong()
	local bIsTongMaster = IsTongMaster()
	if (bIsTongMaster == 0)	then	-- 不是帮主
		Talk(1,"","非帮主勿操作！")
		SetTask(295, 0)
		SetTask(296, 0)
		return
	end
	
	local nCurDate = {date("%y"), date("%m"), date("%d")}
	local nCurDateNum = tonumber(nCurDate[1]..nCurDate[2]..nCurDate[3])	-- 当前时间(年月日)
	
	SetTask(295, 2)			-- 设置成已经接收了玩家在金山掌门人处的申请
	SetTask(296, nCurDateNum)	-- 设置申请的时间
	
	-- 将玩家打发走
	Say("你费了好大的劲才组建了一个帮派，却因为一场小冲突而想要解散，这值得吗?听着，我给你三天时间考虑一下，然后再来找我，怎么样?",
	    1,
	    "好吧！我重新考虑一下。/delay_for_three_days")
end;

-- 跟掌门人再见，三天以后再来找
function delay_for_three_days()
	Talk(1,"","三天后再来找我，但要记住，要学会尊重他们，不要让你的兄弟失望。")
end;

-- 第二次向掌门人正式申请，要解散帮会
function second_apply_destroy_tong()
	local bIsTongMaster = IsTongMaster()
	if (bIsTongMaster == 0)	then	-- 不是帮主
		Talk(1,"","非帮主勿操作！")
		SetTask(295, 0)
		SetTask(296, 0)
		return
	end
	
	local nCurDate = {date("%y"), date("%m"), date("%d")}
	local nCurDateNum = tonumber(nCurDate[1]..nCurDate[2]..nCurDate[3])	-- 当前时间(年月日)
	local nApplyDateNum = GetTask(296)					-- 申请解散的时间
	local nExpiredDate = nCurDateNum - nApplyDateNum			-- 已经经过了的时间
	
	if (nExpiredDate < 3) then		-- 不够三日的期限
		Talk(1,"","你累不累啊，我们不是说好三天后再来吗?")
	else
		SetTask(295, 3)			-- 已经答应了解散帮会的申请
		Say("如果你的心已经决定了，我不会阻止你，我会通知我的部下解散你的帮会。", 0)
	end
end;

-- 翻悔了不想解散帮会了
function cancel_destroy_tong()
	SetTask(295, 0)
	SetTask(296, 0)
	Talk(1,"","很好，给你时间再考虑一下！")
end;

-- 对一个想要建立帮会的人进行条件检查
function check_apply_create_tong_cond()
	Say("Xem ngi c遪 tr? m? t? ch蕋 kh玭g t?. Anh h飊g n? hi謕 h穣 v? <color=yellow>b? t竛h<color> c骳 cung t薾 t魕 nh? v藋 m韎 x鴑g danh <color=yello>Чi hi謕<color>!", 
	    1,
	    "谢谢你的教导！/get_tong_card")
end;

function get_tong_card()
	local nCurReputation = GetReputation()		-- 当前声望
	local bHaveTongCard = GetItemCount(2,0,125)	-- 是否有会盟令牌
	
	if ((nCurReputation >= 1000) and (bHaveTongCard >= 1) and (GetItemCount(2,0,555) >=1)) then
		SetTask(297, 2)				-- 记录任务变量
		Talk(1,"","你虽然年轻但不坏，武功配得上骑士的名字<color=yellow>去接受联盟的命令和国家的选择<color>召唤英雄来提升你的身份")
	else
		Talk(1,"","虽然你武功出众但还不足以获得建立帮会的资格。先累积<color=yellow>10000点<color>声望<color=yellow>和会盟令牌再来找我.<color>.<color=yellow>Minh H閕 l謓h b礽 <color> c? th? d飊g 甶觤 chi課 c玭g n Nh筺 M玭 quan g苝 Qu﹏ Nhu Quan  i. <color=yellow>C祅 Kh玭 Ph?<color> c? th? mua t筰 Ng? C竎.")
	end
end;

function noooooo_say()

end
