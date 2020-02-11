ABLUEMOON_ITEM_TO_EXP = 622 --记录生活材料换经验的日期
THIS_FILE = "\\script\\online\\abluemoon\\abluemoon_item2exp.lua"

--===================================================用收集品换取经验开始============================================
function item_to_exp()
	if GetLevel() < 50 then
		Say("<color=green>周善人<color>：毋以恶小而为之，毋以善小而不为。少侠年纪还轻，等锻炼到50级以后考虑来为难民奉献些粮食吧！",0)
		return
	end
	local nDay = tonumber(date("%y%m%d"))
	if ( GetTask(ABLUEMOON_ITEM_TO_EXP) == nDay ) then
		Say("<color=green>周善人<color>：毋以恶小而为之，毋以善小而不为。大侠今天已经捐献过粮食了！",0)
		return
	end
	Say("<color=green>周善人<color>：连年的战乱，给两国国民带来很多苦难。大侠如果有多余的物资，可以交给我去分发给灾民，作为奖励，我会给你加上一些经验。大侠考虑一下吧！",
			3,
			"我要捐献一些生活材料/gather",
			"我要捐献一些做好的食品/food",
			"我回去找找吧/end_say"
			)
end

function gather()	
	Say("<color=green>周善人<color>：大侠要捐献哪些东西呢？",
			7,
			"我要捐献一些抽丝材料/#item2exp(1)",
			"我要捐献一些制皮材料/#item2exp(2)",
			"我要捐献一些挖矿材料/#item2exp(3)",
			"我要捐献一些伐木材料/#item2exp(4)",
			"我要捐献一些采药材料/#item2exp(5)",
			"我要捐献一些收耕材料/#item2exp(6)",
			"我回去找找吧/end_say"
			)
end

function food()
	Say("<color=green>周善人<color>：大侠要捐献哪些东西呢？",4,
		"我要捐献一些主食/#item2exp(7)",
		"我要捐献一些菜肴/#item2exp(8)",
		"我要捐献一些美酒/#item2exp(9)",
		"我再考虑一下/end_say"
	)
end

function item2exp(nType)
	local tSay = {}
	for i = 1,getn(tItem2Exp[nType]) do
		tSay[i] = "我要捐献"..tItem2Exp[nType][i][5].."个"..tItem2Exp[nType][i][1].."/#giveexp("..nType..","..i..")"
	end
	tSay[getn(tSay)+1] = "我再考虑一下/end_say"
	Say("<color=green>周善人<color>：大侠要捐献哪些东西呢？",getn(tSay),tSay	)	
end

function wantexp()
	ApplyRelayShareData("item2exp_count", nDay, 0, THIS_FILE, "giveexp_go")
end

function giveexp(ntype,nlevel)
	local nDay = tonumber(date("%y%m%d"))
	local Genre = tItem2Exp[ntype][nlevel][2]
	local Detail = tItem2Exp[ntype][nlevel][3]
	local Particular = tItem2Exp[ntype][nlevel][4]
	local neednum = tItem2Exp[ntype][nlevel][5]
	if GetItemCount(Genre,Detail,Particular) < neednum then
		Say("<color=green>周善人<color>：大侠身上没有足够的材料哦！",0)
		return
	end
	if DelItem(Genre,Detail,Particular,neednum) == 1 then
		Msg2SubWorld("大侠 "..GetName().." 在成都周善人处为灾民捐献了大量"..tItem2Exp[ntype][nlevel][1].."，被百姓广为传颂！")
		ApplyRelayShareData("item2exp_count", nDay, 0, THIS_FILE, "giveexp_go")
	end
end

function giveexp_go(szKey, nKey1, nKey2, nCount)
	local nDay = tonumber(date("%y%m%d"))
	local player_level = GetLevel()
	local Exp = player_level^3 
	if nCount == 0 then  --第一次初始化人数
		DelRelayShareDataCopy(szKey,nKey1,nKey2)
		AddRelayShareData("item2exp_count", nDay, 0, THIS_FILE, "end_say", 0,"count", "d", 0)
		ApplyRelayShareData("item2exp_count", nDay, 0, THIS_FILE, "giveexp_go")
		return
	end
	local count = GetRelayShareDataByKey(szKey, nKey1, nKey2,"count")
	count = count + 1
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	AddRelayShareData("item2exp_count", nDay, 0, THIS_FILE, "end_say", 0,"count", "d", count)
	if count == 1 or mod(count,100) == 0 then  --彩蛋～
		SetTask(ABLUEMOON_ITEM_TO_EXP,nDay)
		ModifyExp(Exp*2)
		Msg2Player("你获得"..(Exp*2).."点经验！")
		Say("<color=green>周善人<color>：谢谢大侠为国民作出的奉献！由于你是今天第<color=yellow>"..count.."<color>位捐献的人，特别给你<color=yellow>两倍<color>的奖励，以示鼓励！",0)
	else
		SetTask(ABLUEMOON_ITEM_TO_EXP,nDay)
		ModifyExp(Exp)
		Msg2Player("你获得"..Exp.."点经验！")
		Say("<color=green>周善人<color>：谢谢大侠为国民作出的奉献！你是今天第<color=yellow>"..count.."<color>位捐献的人。如果你是第一位或者整百位的捐献者，将会有<color=yellow>两倍<color>的奖励哦！",0)		
	end
end

function end_say()
end
--====================================================用收集品换取经验结束===========================================

tItem2Exp = {  --换取经验所需生活材料
	[1] = { --丝
					{"兔毛",2,9,1,999},
					{"蚕丝",2,9,2,999},
					{"五色丝",2,9,3,799},
					{"狼蛛丝",2,2,52,799},
					{"血蚕丝",2,2,53,599},
					{"灵蛛丝",2,2,54,300},
					{"金蚕丝",2,2,55,300},
					{"冷虫丝",2,9,4,300},
	},
	[2] = { --皮
					{"狼皮",2,2,15,999},
					{"虎皮",2,2,16,999},
					{"蛇皮",2,2,18,799},
					{"狐皮",2,2,17,799},
					{"白虎之皮",2,2,46,599},
					{"熊皮",2,2,20,300},
					{"鸾鸟羽披",2,10,7,300},
					{"山狮之皮",2,2,47,300},
	},
	[3] = { --矿
					{"精铁",2,2,1,999},
					{"百炼钢",2,2,2,999},
					{"乌金石",2,8,5,799},
					{"寒铁",2,2,4,799},
					{"太白精金",2,2,5,599},
					{"玄铁",2,2,6,300},
					{"天青石",2,2,36,300},
					{"黑钨石",2,2,37,300},
	},
	[4] = { --木
					{"松木",2,2,41,999},
					{"杨木",2,2,42,999},
					{"杉木",2,2,43,799},
					{"铁木",2,2,44,799},
					{"梧桐木",2,2,45,599},
					{"重木",2,2,9,300},
					{"铁樟木",2,2,10,300},
					{"铁线木",2,2,11,300},
	},
	[5] = { --采药
					{"巴豆",1,2,8,1998},
					{"藏红花",1,2,1,1998},
					{"桔梗",1,2,2,1998},
					{"黄连",1,2,3,1998},
					{"蝉蜕",1,2,9,1599},
					{"田七",1,2,10,999},
					{"穿山甲",1,2,11,899},
					{"麝香",1,2,4,799},					
	},
	[6] = { --收耕
					{"光通麻",1,3,9,1299},
					{"木耳",1,3,19,1299},
					{"倾篱豆",1,3,10,1299},
					{"石菌",1,3,20,1299},
					{"绕明豆",1,3,11,1299},
					{"竹肉",1,3,21,1299},
					{"融泽谷",1,3,12,1299},
					{"胡椒",1,3,22,1299},
					{"甘蔗",1,3,13,999},
					{"延精麦",1,3,14,899},
					{"淳和麦",1,3,15,799},
					{"游龙栗",1,3,16,699},	
	},
	[7] = { --主食
					{"饭团",1,1,2,250},
					{"馒头",1,1,3,250},
					{"花卷",1,1,4,220},
					{"肉包",1,1,5,200},		
	},
	[8] = { --主菜
					{"素炒竹肉",1,1,6,250},
					{"家常四季豆",1,1,7,250},
					{"炒豌豆角",1,1,8,220},
					{"蒜茸生菜",1,1,9,200},		
	},
	[9] = { --酒
					{"烧刀子",1,1,10,250},
					{"女儿红",1,1,11,250},
					{"稻花香",1,1,12,220},
					{"醉生梦死",1,1,13,200},		
	},
}