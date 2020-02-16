--******************************************************
--********************金山软件剑网2脚本*****************
--功能：2006重阳活动
--开发人员：赵贵春
--开发时间：2006-10-12
--******************************************************
prize_table = {
	{"黄菊",546,"菊花酒",549,"酿酒","器"},
	{"紫菊",547,"菊花糕",550,"制作","部分"},
	{"茱萸",548,"茱萸束",551,"制作","结束"},
}
change_num = 9			--兑换需要的原料数量
map_id_min = 969
map_id_max = 971
use_att_Y = 2954
exp_num_1 = 500000
exp_num_2 = 200000
healthy_exp_need = 500000
prize_use_start_time = 13447
prize_use_end_time = 13463

function main()
	local palyer_sex = "大侠"
	if GetSex() == 2 then
		palyer_sex = "女侠"
	end
	if GetLevel() < 11 then
		Say("V? "..palyer_sex.."如果你想成为大侠，你需要更多的训练。",
		1,
		"我知道/end_dialog")
		return
	end
	local plant_talble = {
	{"黄菊",546},
	{"紫菊",547},
	{"茱萸",548},	
	}
	local npc_index = GetTargetNpc()
	if npc_index == 0 then
		return
	end
	
	local num_save = GetUnitCurStates(npc_index,2)
	if num_save == 0 then
		return
	else
		AddUnitStates(npc_index,2,( - num_save))
	end
	if GetFreeItemRoom() < 1 or (GetMaxItemWeight() - GetCurItemWeight()) < 1 then
		Msg2Player("背包空间不足或负重不足，请重新检查！")
		AddUnitStates(npc_index,2,1)
		return
	end
	local npc_name = GetNpcName(npc_index)
	for i = 1,getn(plant_talble) do
		if npc_name == plant_talble[i][1] then
			SetNpcLifeTime(npc_index,0)
			local add_flag = AddItem(2,0,plant_talble[i][2],1)
			if add_flag == 0 then
				WriteLog("重阳活动:"..npc_name.."又失败了, 增加:"..add_flag)
			end
		end
	end	
end
function OnUse(id)
	local palyer_sex = "大侠"
	if GetSex() == 2 then
		palyer_sex = "女侠"
	end
	if GetLevel() < 11 then
		Say("V? "..palyer_sex.."如果你想成为大侠，你需要更多的训练",
		1,
		"知道了/end_dialog")
		return
	end
	if prze_use_date_chk() == 0 then
		Say("活动结束了",
		1,
		"知道了/end_dialog")
		return
	end
	--初始变量定义
	local goods_ID = GetItemParticular(id)
	--主逻辑
	if goods_ID >= prize_table[1][2] and goods_ID <= prize_table[3][2] then					--判断玩家使用的是什么道具
		for i = 1, getn(prize_table) do
			if goods_ID == prize_table[i][2] then			--找到对应道具，增加对应物品
				if GetItemCount(2,0,prize_table[i][2]) < change_num then
					Say(change_num.."сa"..prize_table[i][1].." m韎 c? th? "..prize_table[i][5].."m閠"..prize_table[i][6]..prize_table[i][3]..". Tr猲 ngi b筺 h譶h nh? kh玭g "..prize_table[i][1].." H譶h nh? kh玭g !",
					1,
					"知道了/end_dialog"
					)
				else
					Say("你同意使用"..change_num.."сa"..prize_table[i][1]..prize_table[i][5].."朵菊花吗"..prize_table[i][6]..prize_table[i][3].."?",
					2,
					"制作/#plant_use("..i..")",
					"知道了/end_dialog"
					)
				end
			end
		end
	elseif goods_ID >= prize_table[1][4] and goods_ID <= prize_table[3][4] then
		local map_ID,att_X,att_Y = GetWorldPos()
		if map_ID < map_id_min or map_ID > map_id_max then
			Say("Tr猲 nh Hoa s琻 m韎 s? d鬾g 頲 v藅 ph萴 n祔. B筺 c? th? n g苝 V? L﹎ Minh truy襫 nh﹏ a 甶!",
			1,
			"知道了/end_dialog")
			return
		elseif att_Y >= use_att_Y  then
			Say("L猲 t韎 nh m韎 s? d鬾g v藅 ph萴 n祔!",
			1,
			"知道了/end_dialog")
			return
		end
		if GetTask(962) >= 42 then
			Say("对不起！ 您收到的奖励总数超过42次，邀请您下次加入合作！",
			    1,
				"知道了/end_dialog")
			return			
		end	
		if GetTask(960) >= 6 and GetTask(961) >= day_num_return() then
			Say("对不起!今天的奖励已经超过6次了，明天再来吧！",
			    1,
				"知道了/end_dialog")
			return			
		end
		for i = 1 ,getn(prize_table) do
			if goods_ID == prize_table[i][4] then			--找到对应道具，增加对应物品
				Say("你同意使用"..prize_table[i][3].."吗?",
					2,
					"同意使用/#Prize_use("..i..")",
					"让我想想/end_dialog"
				)
			end
		end
	end
end
--*******************************兑换奖励函数**********************************
function plant_use(goods_seq)
	if GetFreeItemRoom() < 1 then
		Say("背包空间不够，请检查!",
		    1,
			"知道了/end_dialog")
		return		
	end
	if GetItemCount(2,0,prize_table[goods_seq][2]) < change_num then
		Msg2Player("请确认携带足够的物品以换取奖赏!")
		return
	end
	local deal_flag = DelItem(2,0,prize_table[goods_seq][2],change_num)
	if deal_flag == 0 then
		Msg2Player("请确认携带足够的物品以换取奖赏!")
	else
		local add_flag = AddItem(2,0,prize_table[goods_seq][4],1)
		if add_flag ~= 0 then
			Msg2Player("恭喜你使用"..change_num.."сa"..prize_table[goods_seq][1]..prize_table[goods_seq][5].." d飊g 1 "..prize_table[goods_seq][6]..prize_table[goods_seq][3].."!")
		else
			WriteLog ("玩家:"..GetName().."增加"..prize_table[goods_seq][3].."失败, 返回:"..add_flag..".")
		end
	end
end
--*******************************使用奖励函数**********************************
function Prize_use(goods_seq)
	if goods_seq == 1 then
		local healthy_exp = GetGoldenExp() 							--获取玩家健康经验
		if healthy_exp == 0 then
			Say("你没有健康点",
			1,
			"知道了/end_dialog")
		elseif healthy_exp < exp_num_1 then
			Say("你的健康点:"..healthy_exp..",还不到50,确定要换取经验吗？",
			2,
			"我想把健康分数变成经验/#exp_change(1)",
			"改天吧/end_dialog")
		else
			exp_change(1)
		end
	elseif goods_seq == 2 or goods_seq == 3 then
		if goods_seq == 2 then
			local healthy_exp = GetGoldenExp() 							--获取玩家健康经验
			if healthy_exp == 0 then
				Say("你没有健康点",
				1,
				"知道了/end_dialog")
			elseif healthy_exp < exp_num_2 then
				Say("你的健康点:"..healthy_exp..",还不到20,确定要换取经验吗？",
				2,
				"我想把健康分数变成经验/#exp_change(2)",
				"改天吧/end_dialog")
			else
				exp_change(2)
			end
		elseif goods_seq == 3 then
			local del_flag = DelItem(2,0,prize_table[3][4],1)
			if del_flag == 1 then
				ModifyGoldenExp(healthy_exp_need)
				Msg2Player("你使用了"..prize_table[goods_seq][3]..",得到50个健康分数!")
				use_times_save()
				prize_end_dialog()
			else
				Msg2Player("请确认一下背包空间"..prize_table[goods_seq][4].."!")
			end
		end
	end
end
--****************************健康经验转换为经验***********************************
function exp_change(change_flag)											--健康经验转为经验
	local healthy_exp = GetGoldenExp() 										--获取玩家健康经验
	local del_flag = DelItem(2,0,prize_table[change_flag][4],1)
	if del_flag == 1 and change_flag == 1 then
		if healthy_exp >= exp_num_1 then
			ModifyGoldenExp(-exp_num_1)
			ModifyExp(exp_num_1)
			Msg2Player("你使用"..prize_table[change_flag][3]..",把"..exp_num_1.."健康点"..exp_num_1.."兑换成经验值")
		else
			ModifyGoldenExp(-healthy_exp)
			ModifyExp(healthy_exp)
			Msg2Player("你使用"..prize_table[change_flag][3]..",把"..healthy_exp.."健康点"..healthy_exp.."兑换成经验值")
		end
		use_times_save()
		prize_end_dialog()
	elseif del_flag == 1 and change_flag == 2 then
		if healthy_exp >= exp_num_2 then
			ModifyGoldenExp(-exp_num_2)
			ModifyExp(exp_num_2)
			Msg2Player("你使用"..prize_table[change_flag][3]..",把"..exp_num_2.."健康点"..exp_num_2.."兑换成经验值")
		else
			ModifyGoldenExp(-healthy_exp)
			ModifyExp(healthy_exp)
			Msg2Player("你使用"..prize_table[change_flag][3]..",把"..healthy_exp.."健康点"..healthy_exp.."兑换成经验值")
		end
		ModifyReputation(10,0)
		Msg2Player("你使用"..prize_table[change_flag][3].."获得10个健康点")
		use_times_save()
		prize_end_dialog()
	else
		Msg2Player("请确认一下背包空间"..plant_talble[1][4].."!")
	end
end
--**********************************使用时间判断**********************************
function prze_use_date_chk()
	if day_num_return() < prize_use_start_time or day_num_return() > prize_use_end_time then
		return 0 
	else
		return 1
	end
end
--**********************************使用次数记录**********************************
function use_times_save()
	local use_times = GetTask(960)
	local use_date_seq = GetTask(961)
	local use_time_total = GetTask(962)
	if use_date_seq == day_num_return() then
		SetTask(960,use_times + 1)
	else
		SetTask(961,day_num_return())
		SetTask(960,1)
	end
	SetTask(962,use_time_total + 1)
end
--*******************************使用次数提示************************************
function prize_end_dialog()
	local use_times = GetTask(960)
	local use_num_today = 6 - use_times
	local use_num_total = GetTask(962)
	if use_times < 6 and use_num_total < 42 then
		Msg2Player("今天"..use_times.."你得到奖励了,还有"..use_num_today.."次获得奖励的机会。这就是积累"..use_num_total.."兑换奖励。还可以换"..(42-use_num_total).."次")
	elseif use_times == 6 and use_num_total < 42 then
		Msg2Player("你今天得到了6次奖励,明天再来把！这就是积累"..use_num_total.."兑换奖励。还可以换"..(42-use_num_total).."次")
	elseif use_num_total == 42 then
		Msg2Player("你已经兑换了42次奖励不能继续兑换,请参加下次活动！")
	end
end
function end_dialog()
end
--**************************轮次计算函数******************************************
function day_num_return()
	local times_return = floor((GetTime() - 57600)/(86400))
	return times_return
end
