--文件名：月亮兔卷轴任务
--功能描述：月亮兔的任务卷轴的相关奖励。
--代码编写人：村长
--代码编写时间：2007-01-28
--修改记录：小蓝打补丁
Include("\\script\\online\\abluemoon\\abluemoon_head.lua")
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
--=============================公共变量定义区=================================
goods_and_prize_list = {
	--id-----------------------名称---------------师门令牌数量--奖励1-4数量/概率----转换健康经验数量--健康经验倍率--声望--说明
	{601,"进士证书","","",5,15,25,50,10,1600000,1.5,40,"为月亮兔收集 任意诀要5张、杀手藏宝图1本、太虚八卦盘-乾、坤、坎、兑 各1个\n<color=yellow>任务固定奖励<color>：得到 [级别x级别x级别x1.5] 点经验。\n<color=yellow>任务随机奖励1<color>：得到 [级别x级别x级别x1.5] 点经验 50%概率\n<color=yellow>任务随机奖励2<color>：陨铁10个 25%概率\n<color=yellow>任务随机奖励3<color>：声望40点 10%概率\n<color=yellow>任务随机奖励4<color>：随机师门秘籍1本 10%概率\n<color=yellow>任务随机奖励5<color>：月亮兔铁宝箱1个 5%概率"},
	{600,"贡士证书","","",4,12,30,50,8,1200000,1.2,30,"为月亮兔收集 七大门派的师门令牌各1个、铁线精木/山狮精皮/黑钨精石/赤钨灵符 各10份。\n<color=yellow>任务固定奖励<color>：得到 [级别x级别x级别x1.2] 点经验。\n<color=yellow>任务随机奖励1<color>：得到 [级别x级别x级别x1.2] 点经验		50%概率\n<color=yellow>任务随机奖励2<color>：陨铁8个					20%概率\n<color=yellow>任务随机奖励3<color>：声望30点					18%概率\n<color=yellow>任务随机奖励4<color>：随机师门秘籍1本			8%概率\n<color=yellow>任务随机奖励5<color>：月亮兔铁宝箱1个			4%概率"},
	{599,"举人证书","","",3,8,30,50,5,1000000,1,20,"为月亮兔收集 冷虫丝/山狮之皮/麝香/游龙粟 或者 黑钨石/铁线木/麝香/游龙粟 各222份\n<color=yellow>任务固定奖励<color>：得到 [级别x级别x级别] 点经验。\n<color=yellow>任务随机奖励1<color>：得到 [级别x级别x级别] 点经验		50%概率\n<color=yellow>任务随机奖励2<color>：陨铁5个					20%概率\n<color=yellow>任务随机奖励3<color>：声望20点					22%概率\n<color=yellow>任务随机奖励4<color>：随机师门秘籍1本			5%概率\n<color=yellow>任务随机奖励5<color>：月亮兔铁宝箱1个			3%概率"},
	{598,"秀才证书","","",2,5,30,50,3,800000,0.8,10,"为月亮兔收集 金蚕丝/鸾鸟羽披/穿山甲 或者 铁樟木/淳和麦/天青石 各222份\n<color=yellow>任务固定奖励<color>：得到 [级别x级别x级别x0.8] 点经验。\n<color=yellow>任务随机奖励1<color>：得到 [级别x级别x级别x0.8] 点经验		50%概率\n<color=yellow>任务随机奖励2<color>：陨铁3个					20%概率\n<color=yellow>任务随机奖励3<color>：声望10点					25%概率\n<color=yellow>任务随机奖励4<color>：随机师门秘籍1本			3%概率\n<color=yellow>任务随机奖励5<color>：月亮兔铁宝箱1个			2%概率"},
	{597,"生员证书","","",1,3,33,50,2,500000,0.5,5,"为月亮兔收集 灵蛛丝/熊皮/田七 或者 玄铁/重木/延精麦 各222份\n<color=yellow>任务固定奖励<color>：得到 [级别x级别x级别x0.5] 点经验。\n<color=yellow>任务随机奖励1<color>：得到 [级别x级别x级别x0.5] 点经验		50%概率\n<color=yellow>任务随机奖励2<color>：陨铁2个					17%概率\n<color=yellow>任务随机奖励3<color>：声望5点					30%概率\n<color=yellow>任务随机奖励4<color>：随机师门秘籍1本			2%概率\n<color=yellow>任务随机奖励5<color>：月亮兔铁宝箱1个			1%概率"},
}
token_list ={205,206,207,208,209,350,390}	
--==============================脚本主逻辑区================================
function OnUse(goods_index)
	local goods_id = GetItemParticular(goods_index)
	local goods_diff = 0
	local goods_types = {
		{},
		{},
		{"冷虫丝、山狮之皮、麝香、游龙粟 各222份","黑钨石、铁线木、麝香、游龙粟 各222份"},
		{"金蚕丝、鸾鸟羽披、穿山甲 各222份","天青石、铁樟木、淳和麦 各222份"},
		{"灵蛛丝、熊皮、田七 各222份","玄铁、重木、延精麦 各222份"}
	}
	for i = 1,getn(goods_and_prize_list) do
		if goods_id == goods_and_prize_list[i][1] then
			goods_diff = i
		end
	end
	if goods_diff == 1 then
		Say("“<color=red>"..goods_and_prize_list[goods_diff][2].."<color>”:"..goods_and_prize_list[goods_diff][13],
		3,
		"需要的东西已经收集好了/#goods_need_chk("..goods_diff..",1)",
		"我想看看需要的诀要列表/book_need_jue",
		"我再去准备一下/end_dialog")		
	elseif goods_diff == 2 then  
		Say("“<color=red>"..goods_and_prize_list[goods_diff][2].."<color>”:"..goods_and_prize_list[goods_diff][13],
		2,
		"需要的东西已经收集好了/#goods_need_chk("..goods_diff..",1)",
		"我再去准备一下/end_dialog")
	else
		Say("“<color=red>"..goods_and_prize_list[goods_diff][2].."<color>”:"..goods_and_prize_list[goods_diff][13],
		3,
		"我已经准备好"..goods_types[goods_diff][1].."/#goods_need_chk("..goods_diff..",1)",
		"我已经准备好"..goods_types[goods_diff][2].."/#goods_need_chk("..goods_diff..",2)",
		"我再去准备一下/end_dialog")		
	end
end
--*****************************任务物品检测主函数*****************************
function goods_need_chk(goods_diff,goods_type)
	local jifen = GetTask(ABLUEMOON_JIFEN)
	local jifenLV = jifen2level(jifen)
	if jifenLV < (getn(goods_and_prize_list)+2-goods_diff) then 
		Say("你的科考称号还没有达到<color=yellow>"..tTitle[(getn(goods_and_prize_list)+2-goods_diff)][3].."<color>，不能使用该证书！",0)
		return
	end
	if Zgc_pub_goods_add_chk(5,20) ~= 1 then		--空间/负重判断
		Talk(1,"","请确认您的背包有足够的负重和空间！")
		return
	end

	if task_metiral_deal(goods_diff,1,goods_type) ~= 1 then		--物品数量检测
		return
	end
	if DelItem(2,0,goods_and_prize_list[goods_diff][1],1) ~= 1 then  --删掉证书
		Talk(1,"","请确认你身上有相应的证书！")
		return
	end
	if task_metiral_deal(goods_diff,2,goods_type) ~= 1 then		--物品删除
		return
	end
	 
	local palyer_level = GetLevel()
	local exp_num = floor((palyer_level*palyer_level*palyer_level)*goods_and_prize_list[goods_diff][11])
		ModifyExp(exp_num)
		Msg2Player("恭喜你获得了"..exp_num.."点经验！")
	local ran_num = random(1,100)
	if ran_num <= goods_and_prize_list[goods_diff][5] then
		ran_prize(goods_diff,1)
	elseif ran_num <= goods_and_prize_list[goods_diff][6] then
		ran_prize(goods_diff,2)
	elseif ran_num <= goods_and_prize_list[goods_diff][7] then
		ran_prize(goods_diff,3)
	elseif ran_num <= goods_and_prize_list[goods_diff][8] then
		ran_prize(goods_diff,4)
	else
		ran_prize(goods_diff,5)
	end
end
--*******************************任务材料检测********************************
function task_metiral_deal(task_diff,deal_flag,goods_type)		--deal_flag:为1表示检测，为2表示删除
	local task_goods_need_list = {
		{  --进士证书需要的材料
			{{2,14,1,1,"杀手藏宝图"},{2,1,469,1,"太虚八卦盘-乾"},{2,1,470,1,"太虚八卦盘-坤"},{2,1,471,1,"太虚八卦盘-坎"},{2,1,472,1,"太虚八卦盘-兑"}}
		},
		{  --贡士证书需要的材料
			{{2,0,205,1,"少林师门令牌"},{2,0,206,1,"武当师门令牌"},{2,0,207,1,"峨嵋师门令牌"},{2,0,208,1,"丐帮师门令牌"},{2,0,209,1,"唐门师门令牌"},{2,0,350,1,"杨门师门令牌"},{2,0,390,1,"五毒师门令牌"},{2,2,67,10,"铁线精木"},{2,2,68,10,"山狮精皮"},{2,2,66,10,"黑钨精石"},{2,2,69,10,"赤钨灵符"}},
		},
		{  --举人证书需要的材料
--			{{2,9,4,200,"冷虫丝"},{2,2,47,200,"山狮之皮"},{2,2,37,200,"黑钨石"},{2,2,11,200,"铁线木"},{1,2,4,200,"麝香"},{1,3,16,200,"游龙粟"}},
			{{2,9,4,222,"冷虫丝"},{2,2,47,222,"山狮之皮"},{1,2,4,222,"麝香"},{1,3,16,222,"游龙粟"}},
			{{2,2,11,222,"铁线木"},{2,2,37,222,"黑钨石"},{1,2,4,222,"麝香"},{1,3,16,222,"游龙粟"}},
		},
		{  --秀才证书需要的材料
--			{{2,2,55,99,"金蚕丝"},{2,10,7,99,"鸾鸟羽披"},{2,2,36,99,"天青石"},{2,2,10,99,"铁樟木"},{1,2,11,99,"穿山甲"},{1,3,15,99,"淳和麦"}},
			{{2,2,55,222,"金蚕丝"},{2,10,7,222,"鸾鸟羽披"},{1,2,11,222,"穿山甲"},},
			{{2,2,10,222,"铁樟木"},{2,2,36,222,"天青石"},{1,3,15,222,"淳和麦"}},
		},
		{  --生员证书需要的材料
--			{{2,2,54,99,"灵蛛丝"},{2,2,20,99,"熊皮"},{2,2,6,99,"玄铁"},{2,2,9,99,"重木"},{1,2,10,99,"田七"},{1,3,14,99,"延精麦"}},
			{{2,2,54,222,"灵蛛丝"},{2,2,20,222,"熊皮"},{1,2,10,222,"田七"},},
			{{2,2,9,222,"重木"},{2,2,6,222,"玄铁"},{1,3,14,222,"延精麦"}},
		},
	}
	local cangbaotu_num = 0;
	if deal_flag == 1 then							--检测
		for i = 1,getn(task_goods_need_list[task_diff][goods_type]) do
			if task_goods_need_list[task_diff][goods_type][i][2] == 14 then   --如果是该死的藏宝图
				for i = 1,117 do
					if GetItemCount(2,14,i) > 0 then
						cangbaotu_num = 1;
						break
					end
				end
				if cangbaotu_num == 0 then
					Talk(1,"","您身上的“<color=red>杀手藏宝图<color>”不足<color=red>1<color>个！")
					return 0
				end
			else
				if GetItemCount(task_goods_need_list[task_diff][goods_type][i][1],task_goods_need_list[task_diff][goods_type][i][2],task_goods_need_list[task_diff][goods_type][i][3]) < task_goods_need_list[task_diff][goods_type][i][4] then
					Talk(1,"","您身上的“<color=red>"..task_goods_need_list[task_diff][goods_type][i][5].."<color>”不足<color=red>"..task_goods_need_list[task_diff][goods_type][i][4].."<color>个！")
					return 0
				end
			end
		end
		if task_diff > 1 or abluemoon_check_jue(deal_flag) == 1 then
			return 1	
		else
			return 0	
		end
	else
		for i = 1,getn(task_goods_need_list[task_diff][goods_type]) do
			if task_goods_need_list[task_diff][goods_type][i][2] == 14 then   --如果是该死的藏宝图
				for i = 1,117 do
					if DelItem(2,14,i,1) ~= 0 then
						cangbaotu_num = 1;
						break
					end
				end
				if cangbaotu_num == 0 then
					Talk(1,"","您身上的“<color=red>杀手藏宝图<color>”不足<color=red>1<color>个！")
					return 0
				end				
			else
				if DelItem(task_goods_need_list[task_diff][goods_type][i][1],task_goods_need_list[task_diff][goods_type][i][2],task_goods_need_list[task_diff][goods_type][i][3],task_goods_need_list[task_diff][goods_type][i][4]) ~= 1 then
					Talk(1,"","您身上的“<color=red>"..task_goods_need_list[task_diff][goods_type][i][5].."<color>”不足<color=red>"..task_goods_need_list[task_diff][goods_type][i][4].."<color>个！")
					return 0
				end
			end
		end
		if task_diff > 1 or abluemoon_check_jue(deal_flag) == 1 then
			return 1	
		else
			return 0	
		end
	end	
end
--*******************************随机奖励给予*********************************
function ran_prize(goods_diff,ran_diff)
	if ran_diff == 1 then			--增加月亮兔宝箱
		local add_flag = AddItem(2,0,606,1)		
		if add_flag == 1 then
			Msg2Player("恭喜你获得了一个月亮兔铁宝箱！")
			Msg2SubWorld(GetName().."完成了科考任务，获得了一个“月亮兔铁宝箱”！")		--test
			WriteLog(GetName().."获得一个月亮兔铁宝箱")
		else
			WriteLog(GetName().."增加月亮兔宝箱失败，失败标志："..add_flag)
		end
	elseif ran_diff == 2 then		--师门秘籍增加
		local book_name = {"金刚伏魔经","潜龙秘籍","无尘秘籍","天罗秘籍","如意秘籍","碧海谱","混沌秘籍",
						"揆天秘籍","幻影秘籍","君子秘籍","镇军秘籍","穿云秘籍","幽冥鬼录","灵蛊秘籍"}
		local book_seq = random(1,getn(book_name))
		local book_id = ((book_seq - 1) * 2) + 1
		local add_flag = AddItem(0,107,book_id,1)
		if add_flag == 1 then
			Msg2Player("恭喜您获得“"..book_name[book_seq].."”！")
			Msg2SubWorld("玩家："..GetName().."完成了科考任务获得了一本“"..book_name[book_seq].."”！")	--test
		else		--test
			WriteLog("科考任务活动：玩家："..GetName().."增加"..book_name[book_seq].."失败，失败标志："..add_flag)
		end
	elseif ran_diff == 3 then		--陨铁增加
		local add_flag = AddItem(2,2,8,goods_and_prize_list[goods_diff][9])
		if add_flag == 1 then
			Msg2Player("恭喜你获得了"..goods_and_prize_list[goods_diff][9].."个陨铁！")
		end
	elseif ran_diff == 4 then		--声望增加
		ModifyReputation(goods_and_prize_list[goods_diff][12],0)
	else							--给经验
		local palyer_level = GetLevel()
		local exp_num = floor((palyer_level*palyer_level*palyer_level)*goods_and_prize_list[goods_diff][11])
		ModifyExp(exp_num)
		Msg2Player("恭喜你获得了"..exp_num.."点经验！")
	end
end
--*************************************进士证书需要的诀要列表*******************************
function book_need_jue()
	Talk(1,"","<color=yellow>除了以下稀有诀要以外的任意5张诀要都可以：<color>"..
			"<enter>    少林稀有诀要：达摩武经，大须弥掌，狮子吼，大力金刚指"..
			"<enter>    唐门稀有诀要：满天花雨，暴雨犁花针"..
			"<enter>    峨嵋稀有诀要：莲花心经，迷心飘香曲，覆水心法"..
			"<enter>    丐帮稀有诀要：醉拳，泥鳅功，醉蝶，打狗棍法"..
			"<enter>    武当稀有诀要：炙阳剑气，真武七截剑，御剑诀，少阳诀，上清无极功，梯云纵"..
			"<enter>    杨门稀有诀要：杨家倒海枪，杨家御马术，杨家续命诀，杨家正气箭"..
			"<enter>    五毒稀有诀要：集尸邪气，幻蛊，驭尸术，妖蛊，万蛊蚀天"
	)
end

function abluemoon_check_jue(deal_flag)
	local tNormalPage = {  --进士证书需要的诀要
		1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,19,20,21,22,23,24,25,26,27,28,30,32,
		33,34,35,36,37,38,39,40,41,42,44,45,47,48,49,50,51,53,54,55,56,57,58,59,60,
		61,62,63,64,65,66,68,69,71,72,73,74,75,76,77,80,81,82,84,85,86,87,89,
		90,91,92,93,94,95,96,97,98,100,102,103,104,105,106,107,109,110,111,
		113,115,116,117,118,120,121,122,123,124,125,126,127,130,131,132,133,134,
		135,136,138,139,141,142,143,144,145,146,149,150,151,152,153,154,155,156,
		157,158,159,160,161,162,163,165,168}
	local jue_count = 0;
	if deal_flag == 1 then      --检测
		for i = 1,getn(tNormalPage) do 
			if GetItemCount(2,6,tNormalPage[i]) > 0 then
				jue_count = jue_count + GetItemCount(2,6,tNormalPage[i])
			end
		end
		if jue_count ~= 5 then
			Talk(1,"","你身上<color=yellow>满足要求<color>的诀要数量<color=yellow>不等于5张<color>！请把缺少的补齐或者把多余的放到仓库再说。")
			return 0
		end
		return 1
	else
		for i = 1,getn(tNormalPage) do 
			if GetItemCount(2,6,tNormalPage[i]) > 0 then
				DelItem(2,6,tNormalPage[i],GetItemCount(2,6,tNormalPage[i]))
			end
		end
		return 1
	end
end

