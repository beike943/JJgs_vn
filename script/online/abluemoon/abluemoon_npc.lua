Include("\\script\\class\\ktabfile.lua");
Include("\\script\\online\\abluemoon\\abluemoon_head.lua")
Include("\\script\\online\\abluemoon\\abluemoon_question_head.lua")
Include("\\script\\中原二区\\成都\\npc\\镖师.lua")
gather_exp = new(KTabFile, "\\settings\\skill\\skills_gather_exp.txt");
compose_exp = new(KTabFile, "\\settings\\skill\\skills_compose_exp.txt");
tExp = new(KTabFile, "\\settings\\uplevel.txt");

THIS_FILE = "\\script\\online\\abluemoon\\abluemoon_npc.lua"

function main()
	Say("<color=green>兔小丫<color>：欢迎参加剑网2第一届科举考试第一季的考试，大侠有胆量挑战一下吗？",7,
			"来吧，我要挑战你！/abluemoon_go",
			"我想看看我现在的科考成绩/abluemoon_jifen",
			"我先看看今天的科考运势如何/abluemoon_luck",
			"我要领取上次考试的奖励/CheckHappyTimes",
			"我想看看现在科考的排名/abluemoon_paihang",
			--"我要领取科考外装/abluemoon_cloth",
			"给我讲讲规则吧/abluemoon_rule",
			"算了，今天状态不行/end_say"
			)
end

function abluemoon_go()
	if GetLevel() < 50 then
		Say("<color=green>兔小丫<color>：小于50级的玩家暂时不能参加科举考试，先回去锻炼锻炼吧。",0)
		return
	end
	local nDay = tonumber(date("%y%m%d"))
	if GetTask(ABLUEMOON_ANSWER_STAGE) ~= 0 then
		Say("<color=green>兔小丫<color>：你上次考试的奖励好像还没有领取哦，先把奖励领了再来考试吧！",0)
		return
	end
	if GetTask(ABLUEMOON_QUEST_DATE_PAY) == nDay --如果今天参加的是高经验考试
		and GetTask(ABLUEMOON_QUEST_COUNT) < GetTask(ABLUEMOON_QUEST_COUNT_MAX) --如果是答题数小于猜拳数
		and GetTask(ABLUEMOON_QUEST_ROUND) == 1 then  --如果是第一关答题框就消失了
		Say("<color=green>兔小丫<color>：你上次院试的考试好像还没有结束，你要继续参加院试吗？",2,
				"\n我要继续参加考试/#abluemoon_cuntinue(1)",
				"\n我再考虑一下/end_say"
		)
	elseif GetTask(ABLUEMOON_QUEST_DATE_PAY) == nDay 
		and GetTask(ABLUEMOON_QUEST_COUNT) < GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_1st) --如果是第二关答题数小于第一关正确题数
		and GetTask(ABLUEMOON_QUEST_ROUND) == 2 then  --如果是第二关答题框就消失了
		Say("<color=green>兔小丫<color>：你上次乡试的考试好像还没有结束，你要继续参加乡试吗？",2,
				"\n我要继续参加考试/#abluemoon_cuntinue(2)",
				"\n我再考虑一下/end_say"
		)
	elseif GetMissionV(MV_TIMER_IDEL) == 1 then
		local rest = floor((TIMER_TOTAL_TIME - GetMissionV(MV_TIMER_TIME))/60)
		Say("<color=green>兔小丫<color>：还有<color=yellow>"..rest.."<color>分钟我更换考场啦，现在已经停止接受报名！",0)
		return
	else
		local nluck = GetTask(ABLUEMOON_LUCK)
		local szluck = "未知，比大凶还凶"  --如果没算 默认大凶
		local nDay = tonumber(date("%y%m%d"))
		if GetTask(ABLUEMOON_LUCK_DATE) == nDay then  --如果算过了 显示当前运势
			szluck = tluck[nluck]  
		end
		Say("<color=green>兔小丫<color>：猜拳这个东西跟<color=yellow>运势<color>有很大关系哦，你可以先在我这里算算今天的运势怎么样，也许对你有好处。你当前的运势是：<color=yellow>"..szluck.."<color>",3,
				"\n好吧，我先算算今天的运势/abluemoon_luck",
				"\n我要参加科举考试/abluemoon_gogo_select",
				"\n算了，今天状态不行/end_say"
		)
	end
end

function abluemoon_cuntinue(nRound)
	AddMSPlayer(MISSION_ID,1)  --把玩家加入MISSION
	if nRound == 1 then
		abluemoon_1st()
	else
		abluemoon_2nd_go(2)
	end
end

function abluemoon_gogo_select()
	local nDay = tonumber(date("%y%m%d"))
	if GetTask(ABLUEMOON_QUEST_DATE) == -1 and GetTask(ABLUEMOON_QUEST_DATE_PAY) == -1 then  --如果是获得了免费答题机会
			Say("<color=green>兔小丫<color>：这次是你<color=yellow>免费<color>参加考试的机会，无论你选择哪种考试都免费，你要参加哪种考试呢？",
					3,
					"我要免费参加一般考试/#abluemoon_gogo(-1,1)",
					"我要免费参加高经验考试/#abluemoon_gogo(-1,2)",
					"我再考虑一下/end_say"
			)		
	else
		Say("<color=green>兔小丫<color>：目前的考试分为两种，一种是<color=yellow>一般考试<color>：不收取红萝卜，奖励一般，每人每天1次机会。一种是<color=yellow>高经验考试<color>：需要收取红萝卜，奖励丰厚。你要参加哪种考试呢？",
				3,
				"我要参加一般考试/#abluemoon_gogo_check(1)",
				"我要参加高经验考试/#abluemoon_gogo_check(2)",
				"我再考虑一下/end_say"
		)
	end
end

function abluemoon_gogo_check(nType)
	local nDay = tonumber(date("%y%m%d"))
	local nNeedItemAll = {1,2,3,5,5,10,10}  --需要的红萝卜数量
	local nNeedItemCount = 20;
	if nType == 1 then  --如果是一般考试
		if GetTask(ABLUEMOON_QUEST_DATE) < nDay then  --如果是当天第一次参加一般考试
			Say("<color=green>兔小丫<color>：这次是你今天参加<color=yellow>一般考试<color>的机会，你要参加一般考试吗？",
					2,
					"我要参加一般考试/#abluemoon_gogo(0,1)",
					"我再考虑一下/end_say"
			)	
		else
			Say("<color=green>兔小丫<color>：你今天已经参加过一般考试啦，每个人一天只有一次机会哦！",0)
		end
	else                --如果是高经验考试
		if GetTask(ABLUEMOON_QUEST_DATE_PAY) < nDay then  --如果是当天第一次参加高级考试
			SetTask(ABLUEMOON_TIMES_DAILY,1)
		end
		local nTimes = GetTask(ABLUEMOON_TIMES_DAILY) --当天答题次数
		if nTimes < 8 and nNeedItemCount ~= 0 then
			nNeedItemCount = nNeedItemAll[nTimes]
		end
		if GetItemCount(2,1,1090) >= nNeedItemCount then
			Say("<color=green>兔小丫<color>：这是你今天第<color=yellow>"..nTimes.."<color>次参加高经验考试，需要交纳<color=yellow>"..nNeedItemCount.."<color>个<color=yellow>红萝卜<color>。你要参加考试吗？",
					2,
					"我要参加考试/#abluemoon_gogo("..nNeedItemCount..",2)",
					"我再考虑一下/end_say"
			)
		else
			Say("<color=green>兔小丫<color>：这是你今天第<color=yellow>"..nTimes.."<color>次参加高经验考试，需要交纳<color=yellow>"..nNeedItemCount.."<color>个<color=yellow>红萝卜<color>。你身上好像没有这么多红萝卜哦，先去准备好吧！",0)
		end
	end
end

function abluemoon_gogo(nNeedItemCount,nType)
	local nDay = tonumber(date("%y%m%d"))
	if GetTask(ABLUEMOON_LUCK_DATE) < nDay then  --如果没算命,默认是大凶
		SetTask(ABLUEMOON_LUCK,0)
	end
	if nNeedItemCount == 0 or nNeedItemCount == -1 or DelItem(2,1,1090,nNeedItemCount) == 1 then
		if GetTask(ABLUEMOON_QUEST_DATE) < nDay and GetTask(ABLUEMOON_QUEST_DATE_PAY) < nDay and nNeedItemCount ~= -1 and GetTask(ABLUEMOON_AWARD_TYPE) == 1 then  --如果是今天第一次参加考试且上次考试没用萝卜
			local nJifen = floor(GetTask(ABLUEMOON_JIFEN)/6)  --衰减的积分
			if nJifen > 80 then nJifen = 80 end               --最多衰减80分
			SetTask(ABLUEMOON_JIFEN,(GetTask(ABLUEMOON_JIFEN)-nJifen))
			Talk(1,"","由于你今天之前参加的最后一次考试不是高经验考试，积分被衰减了<color=yellow>"..nJifen.."<color>分！")
			Msg2Player("由于你今天之前参加的最后一次考试不是高经验考试，积分被衰减了"..nJifen.."分！")
		end
		if nNeedItemCount > 0 then  --免费赠送的和一般考试不算次数
			SetTask(ABLUEMOON_TIMES_DAILY,GetTask(ABLUEMOON_TIMES_DAILY)+1)
		end
		if nType == 1 then  --如果是一般考试
			SetTask(ABLUEMOON_QUEST_DATE, nDay)
			SetTask(ABLUEMOON_AWARD_TYPE,1)  --设置奖励类型1
		else
			if nNeedItemCount > 0 then --免费赠送的不记
				SetTask(ABLUEMOON_QUEST_DATE_PAY, nDay)
			elseif nNeedItemCount == -1 then --免费赠送的
				SetTask(ABLUEMOON_QUEST_DATE_PAY, 0)
			end
			SetTask(ABLUEMOON_AWARD_TYPE,2)  --设置奖励类型2
			SetMissionV(MV_COUNT_PAY,GetMissionV(MV_COUNT_PAY)+1)  --统计这个小时参加高经验的人数
			SetMissionV(MV_COUNT_LUOBO,GetMissionV(MV_COUNT_LUOBO)+nNeedItemCount)
			--WriteLog("[科考统计]玩家 "..GetName().." 参加了高经验考试,花费萝卜"..nNeedItemCount.."个!")
		end
		SetTask(ABLUEMOON_QUEST_COUNT, 0)
		SetTask(ABLUEMOON_QUEST_RIGHT_COUNT_1st, 0)
		SetTask(ABLUEMOON_QUEST_RIGHT_COUNT_2nd, 0)
		SetTask(ABLUEMOON_CAIQUAN_COUNT, 0)
		SetTask(ABLUEMOON_QUEST_COUNT_MAX, 0)
		AddMSPlayer(MISSION_ID,1)  --把玩家加入MISSION
		ApplyRelayShareData("abluemoon_count", nDay, 0, THIS_FILE, "abluemoon_gogogo")
	else
		Say("<color=green>兔小丫<color>：你身上好像没有这么多红萝卜啊！",0)
	end
end

function abluemoon_gogogo(szKey, nKey1, nKey2, nCount)
	local nDay = tonumber(date("%y%m%d"))
	if nCount == 0 then  --第一次初始化人数
		DelRelayShareDataCopy(szKey,nKey1,nKey2)
		AddRelayShareData("abluemoon_count", nDay, 0, THIS_FILE, "end_say", 0,"count", "d", 0)
		ApplyRelayShareData("abluemoon_count", nDay, 0, THIS_FILE, "abluemoon_gogogo")
		return
	end
	local count = GetRelayShareDataByKey(szKey, nKey1, nKey2,"count")
	count = count + 1
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	AddRelayShareData("abluemoon_count", nDay, 0, THIS_FILE, "end_say", 0,"count", "d", count)
	if count == 1 or mod(count,100) == 0 then  --彩蛋～
		SetTask(ABLUEMOON_QUEST_DATE, -1)
		SetTask(ABLUEMOON_QUEST_DATE_PAY, -1)
		Msg2Player("恭喜你获得今天再次闯关的机会！下次考试将会免费！")
	end
	Say("<color=green>兔小丫<color>：你是今天第<color=yellow>"..count.."<color>个挑战者。先跟我猜拳，一共10局，你能赢几局就给你几次答题的机会，怎么样？放弃的话今天就没有机会了哦！",2,
		"\n开始挑战/WantCaiquan",                               --猜拳
		"\n我放弃今天的机会/end_say"
	)	
end

function abluemoon_jifen()
	local jifen = GetTask(ABLUEMOON_JIFEN)
	local nTitleLevel = jifen2level(jifen)
	Say("<color=green>兔小丫<color>：你现在的积分是：<color=yellow>"..jifen.."<color>分。",0)
	for i = 1,getn(tTitle) do --删除原有的称号
		RemoveTitle(50,i)
	end
	if AddTitle(tTitle[nTitleLevel][1],tTitle[nTitleLevel][2]) == 1 then
		SetCurTitle(tTitle[nTitleLevel][1],tTitle[nTitleLevel][2]);
		Msg2Player("你获得“"..tTitle[nTitleLevel][3].."”的称号");
	end;
end

--====================================================资格赛猜拳开始=========================================================
partner_caimei  = {"吴越老祖","九绝剑魔","月亮兔"}
function WantCaiquan()
	if GetTask(ABLUEMOON_CAIQUAN_COUNT) < 10 then 
		Say("<color=green>兔小丫<color>： 来来来，开始划拳咯。你还有<color=yellow>"..(10-GetTask(ABLUEMOON_CAIQUAN_COUNT)).."<color>次猜拳的机会，你出什么？",4,
				"\n吴越老祖\n/Caiquan_shitou",
				"\n九绝剑魔\n/Caiquan_jianzi",
				"\n月亮兔\n/Caiquan_bu",
				"\n先让我知道规则\n/Caiquan_info"
		)
	else
		Say("<color=green>兔小丫<color>：已经猜完10次啦，你现在一共有<color=yellow>"..GetTask(ABLUEMOON_QUEST_COUNT_MAX).."<color>次答题的机会，开始咯！",1,
				"我已经准备好了/abluemoon_1st"
				)
	end
end

function Caiquan_shitou()
	SetTask(ABLUEMOON_CAIQUAN_COUNT,GetTask(ABLUEMOON_CAIQUAN_COUNT)+1)
	local i = 1;
	if random(100) > 50 then
		i = 3;
	end
	local win = random(7)
	if GetTask(ABLUEMOON_LUCK) >= win then i = 2 end
	if i ~= 2 then	
		Say("<color=green>兔小丫<color>：我出<color=yellow>"..partner_caimei[i].."<color>,哎呀！我赢啦，嘻嘻！",1,
				"我就不信邪，再来！/WantCaiquan")
	else
		SetTask(ABLUEMOON_QUEST_COUNT_MAX,GetTask(ABLUEMOON_QUEST_COUNT_MAX)+1)
		Say("<color=green>兔小丫<color>：我出<color=yellow>"..partner_caimei[i].."<color>,哎呀！被你赢啦，今天<color=yellow>运气<color>不错嘛。给你加上一次答题机会。",1,
				"太好了，继续继续/WantCaiquan")
	end
end

function Caiquan_jianzi()
	SetTask(ABLUEMOON_CAIQUAN_COUNT,GetTask(ABLUEMOON_CAIQUAN_COUNT)+1)
	local i = random(1,2)
	local win = random(7)
	if GetTask(ABLUEMOON_LUCK) >= win then i = 3 end
	if i ~= 3 then
		Say("<color=green>兔小丫<color>：我出<color=yellow>"..partner_caimei[i].."<color>,哎呀！我赢啦，嘻嘻！",1,
				"我就不信邪，再来！/WantCaiquan")
	else
		SetTask(ABLUEMOON_QUEST_COUNT_MAX,GetTask(ABLUEMOON_QUEST_COUNT_MAX)+1)
		Say("<color=green>兔小丫<color>：我出<color=yellow>"..partner_caimei[i].."<color>,哎呀！被你赢啦，今天<color=yellow>运气<color>不错嘛。给你加上一次答题机会。",1,
				"太好了，继续继续/WantCaiquan")
	end
end

function Caiquan_bu()
	SetTask(ABLUEMOON_CAIQUAN_COUNT,GetTask(ABLUEMOON_CAIQUAN_COUNT)+1)
	local i = random(2,3)
	local win = random(7)
	if GetTask(ABLUEMOON_LUCK) >= win then i = 1 end
	if i ~= 1 then
		Say("<color=green>兔小丫<color>：我出<color=yellow>"..partner_caimei[i].."<color>,哎呀！我赢啦，嘻嘻！",1,
				"我就不信邪，再来！/WantCaiquan")
	else
		SetTask(ABLUEMOON_QUEST_COUNT_MAX,GetTask(ABLUEMOON_QUEST_COUNT_MAX)+1)
		Say("<color=green>兔小丫<color>：我出<color=yellow>"..partner_caimei[i].."<color>,哎呀！被你赢啦，今天<color=yellow>运气<color>不错嘛。给你加上一次答题机会。",1,
				"太好了，继续继续/WantCaiquan")
	end
end

function Caiquan_info()
	Say("<color=green>兔小丫<color>：规则是这样滴：吴越老祖、九绝剑魔和月亮兔呢，吴越老祖赢九绝剑魔，九绝剑魔赢月亮兔，月亮兔赢吴越老祖。懂了没？你赢了我就过关，没赢我或者打成平手，比如你出九绝剑魔我也出九绝剑魔，那也算我赢。哼哼。",1,"我要返回上一层菜单/WantCaiquan")
end
--=====================================================资格赛猜拳结束===============================================================

--=====================================================第一关答题开始===============================================================
function abluemoon_1st()	
	local right_count_1st = GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_1st);
	SetTask(ABLUEMOON_QUEST_ROUND,1)
	if GetTask(ABLUEMOON_QUEST_COUNT_MAX) > GetTask(ABLUEMOON_QUEST_COUNT) then
		SetTask(ABLUEMOON_STATE,1) --开始答题
		SetTask(ABLUEMOON_TIMER,GetGameTime()) --设置计时器起始时间
		show_question(1, "你今天<color=yellow>院试<color>的第<color=yellow>"..(GetTask(ABLUEMOON_QUEST_COUNT)+1).."<color>个问题如下，请听题：<enter>" )
	elseif GetTask(ABLUEMOON_QUEST_COUNT_MAX) == GetTask(ABLUEMOON_QUEST_COUNT) then  --如果已经回答完毕
--		if GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_1st) == GetTask(ABLUEMOON_QUEST_COUNT_MAX) then  --如果全对
		if right_count_1st >= 5  then  --如果答对5题以上
			Say("<color=green>兔小丫<color>：今天<color=yellow>院试<color>问题已经回答完毕，你一共答对了<color=yellow>"..right_count_1st.."<color>道题，正确率<color=yellow>"..floor((right_count_1st/GetTask(ABLUEMOON_QUEST_COUNT)*100)).."%<color>。恭喜你可以<color=yellow>继续闯关<color>，也可以现在就领取奖励。你在<color=yellow>乡试<color>中共有<color=yellow>"..right_count_1st.."<color>次答题机会，加油！",2,
					"\n我现在就领取奖励吧/#GetHappyTimes(1,1)",
					"\n我要继续闯关/abluemoon_2nd"
					)

		elseif right_count_1st == 0 then  --全错
			DelMSPlayer(MISSION_ID,1)  --把玩家从MISSION中删除
			Say("<color=green>兔小丫<color>：真可惜丫，你一题都没有答对，下次再来挑战吧！",0)
		else
			Say("<color=green>兔小丫<color>：今天<color=yellow>院试<color>问题已经回答完毕，你一共答对了<color=yellow>"..right_count_1st.."<color>道题，正确率<color=yellow>"..floor((right_count_1st/GetTask(ABLUEMOON_QUEST_COUNT)*100)).."%<color>。由于没有答对<color=yellow>5<color>题以上，不能继续闯关啦，下次努力！",1,
						"\n我现在就领取奖励吧/#GetHappyTimes(1,1)")
		end
	end
end
--=====================================================第一关答题结束=====================================================

--=====================================================第二关答题开始=====================================================
function abluemoon_2nd()
	SetTask(ABLUEMOON_QUEST_COUNT, 0)
	SetTask(ABLUEMOON_QUEST_ROUND, 2)
--	Say("<color=green>兔小丫<color>：大侠真厉害，居然能闯入第二关！我这里有几类题目，你想选哪类呢？",4,
--			"\n自然科学/#abluemoon_2nd_go(2)",
--			"\n人文历史/#abluemoon_2nd_go(3)",
--			"\n剑侠情缘/#abluemoon_2nd_go(4)",
--			"\n乱七八糟/#abluemoon_2nd_go(5)"
--		)
	Say("<color=green>兔小丫<color>：大侠真厉害，居然能闯入<color=yellow>乡试<color>！我这里有几类题目，你想选哪类呢？",4,
			"\n剑/#abluemoon_2nd_go(2)",
			"\n侠/#abluemoon_2nd_go(3)",
			"\n情/#abluemoon_2nd_go(4)",
			"\n缘/#abluemoon_2nd_go(5)"
		)
end

function abluemoon_2nd_go(choice)
	SetTask(ABLUEMOON_STATE,1) --开始答题
	SetTask(ABLUEMOON_TIMER,GetGameTime()) --设置计时器起始时间
	local num = choice;
	if num < 2 or num > 5 then --防止传进来一个非法值
		num = random(2,5)
	end
	show_question(num, "你今天<color=yellow>乡试<color>的第<color=yellow>"..(GetTask(ABLUEMOON_QUEST_COUNT)+1).."<color>个问题如下，请听题：<enter>" )		
end
--==================================================第二关答题结束====================================================

--=================================================乱入特殊问题开始===================================================
function SpecialQues(choice)
	local nchoice = choice
	local options = {}
	--randomseed(GetTime())
	local num = random(1,8)  --以后增加题目的时候记得修改后面这个数
	if num == 1 and GetGlbValue(151) == 0 then num = random(2,8) end
	if num == 1 then  --1.猜辉煌之夜
		Say("<color=green>兔小丫<color>：啊！老是问同一类问题太无聊了，我突然想到一个问题，请问今天的辉煌之夜是什么活动？",6,
					"战场/#SpecialAnswer(1,1,"..nchoice..")",
					"商会/#SpecialAnswer(1,2,"..nchoice..")",
					"师门随机任务/#SpecialAnswer(1,3,"..nchoice..")",
					"师门重复任务/#SpecialAnswer(1,4,"..nchoice..")",
					"杀手任务/#SpecialAnswer(1,5,"..nchoice..")",
					"龙舟/#SpecialAnswer(1,6,"..nchoice..")"
				)
	elseif num == 2 then  --2.根据声望猜称号
		local nShengwang = random(-500,35000)	
		for i = 2,21 do  --表格的大小
			if nShengwang < tShengwang[i][1] then 
				options[1] = format("%s/#answer_ok(%d,%d)", tShengwang[i][2], nchoice, 6)
				options[2] = format("%s/#answer_fail(%d,%d)", tShengwang[i-1][2], nchoice, 6)
				options[3] = format("%s/#answer_fail(%d,%d)", tShengwang[i+1][2], nchoice, 6)
				options[4] = format("%s/#answer_fail(%d,%d)", tShengwang[i+2][2], nchoice, 6)
				break
			end
		end
		ReSort(options)
		Say("<color=green>兔小丫<color>：啊！老是问同一类问题太无聊了，我突然想到一个问题，请问声望是<color=yellow>"..nShengwang.."<color>时的称号是什么？",4,
				 options[1], options[2], options[3], options[4])
	elseif num == 3 then  --3.猜升级所需经验
		local level = random(50,97)
		local exp = tExp:getCell((level+2),2)
		local tab_exp = {}
		for i = 1,3 do
			tab_exp[i] = random(-10000,10000)
			if tab_exp[i] == 0 then tab_exp[i] = tab_exp[i] + random(1,5) end
		end
		options[1] = format("%s/#answer_ok(%d,%d)", exp, nchoice, 6)
		options[2] = format("%s/#answer_fail(%d,%d)", (exp+tab_exp[1]), nchoice, 6)
		options[3] = format("%s/#answer_fail(%d,%d)", (exp+tab_exp[2]), nchoice, 6)
		options[4] = format("%s/#answer_fail(%d,%d)", (exp+tab_exp[3]), nchoice, 6)		
		ReSort(options)
		Say("<color=green>兔小丫<color>：啊！老是问同一类问题太无聊了，我突然想到一个问题，请问<color=yellow>"..level.."级升到"..(level+1).."级<color>需要多少经验？",4,
				 options[1], options[2], options[3], options[4])
	elseif num == 4 then  --4.猜当前等级交满收集品能获得多少钱
		local num_max = Zgc_conf_task_num_max()
		local sinup = random(10,num_max)
		local gold = task_money_prize(sinup)
		local tab_gold = {}
		for i = 1,3 do
			tab_gold[i] = random(-1000,1000)
			if tab_gold[i] == 0 then tab_gold[i] = tab_gold[i] + random(1,5) end
		end
		options[1] = format("%s/#answer_ok(%d,%d)", gold, nchoice, 6)
		options[2] = format("%s/#answer_fail(%d,%d)", (gold+tab_gold[1]), nchoice, 6)
		options[3] = format("%s/#answer_fail(%d,%d)", (gold+tab_gold[2]), nchoice, 6)
		options[4] = format("%s/#answer_fail(%d,%d)", (gold+tab_gold[3]), nchoice, 6)		
		ReSort(options)
		Say("<color=green>兔小丫<color>：啊！老是问同一类问题太无聊了，我突然想到一个问题，请问你现在上交帮会高级收集品<color=yellow>"..sinup.."个<color>能获得多少钱？以<color=yellow>铜<color>为单位。",4,
				 options[1], options[2], options[3], options[4])		
	elseif num == 5 then  --5.猜某个等级采集技能升级经验
		local skillID = random(1,6)
		local level = random(9,78)
		local exp = gather_exp:getCell((level+2),3)
		local tab_exp = {}
		for i = 1,3 do
			tab_exp[i] = random(-100,100)
			if tab_exp[i] == 0 then tab_exp[i] = tab_exp[i] + random(1,5) end
		end
		options[1] = format("%s/#answer_ok(%d,%d)", exp, nchoice, 6)
		options[2] = format("%s/#answer_fail(%d,%d)", (exp+tab_exp[1]), nchoice, 6)
		options[3] = format("%s/#answer_fail(%d,%d)", (exp+tab_exp[2]), nchoice, 6)
		options[4] = format("%s/#answer_fail(%d,%d)", (exp+tab_exp[3]), nchoice, 6)		
		ReSort(options)
		Say("<color=green>兔小丫<color>：啊！老是问同一类问题太无聊了，我突然想到一个问题，请问<color=yellow>"..tGatherSkill[skillID].."<color>从<color=yellow>"..level.."级升到"..(level+1).."级<color>需要多少经验？",4,
				 options[1], options[2], options[3], options[4])
	elseif num == 6 then  --6.猜某个等级生产系技能升级经验
		local skillID = random(1,9)
		local level = random(9,78)
		local exp = compose_exp:getCell((level+2),3)
		local tab_exp = {}
		for i = 1,3 do
			tab_exp[i] = random(-100,100)
			if tab_exp[i] == 0 then tab_exp[i] = tab_exp[i] + random(1,5) end
		end
		options[1] = format("%s/#answer_ok(%d,%d)", exp, nchoice, 6)
		options[2] = format("%s/#answer_fail(%d,%d)", (exp+tab_exp[1]), nchoice, 6)
		options[3] = format("%s/#answer_fail(%d,%d)", (exp+tab_exp[2]), nchoice, 6)
		options[4] = format("%s/#answer_fail(%d,%d)", (exp+tab_exp[3]), nchoice, 6)		
		ReSort(options)
		Say("<color=green>兔小丫<color>：啊！老是问同一类问题太无聊了，我突然想到一个问题，请问<color=yellow>"..tComposeSkill[skillID].."<color>从<color=yellow>"..level.."级升到"..(level+1).."级<color>需要多少经验？",4,
				 options[1], options[2], options[3], options[4])	
	elseif num == 7 then  --根据XX猜XX,调用吴炜脚本
		options = MoonRabbit_GetAQuestion(1)
		for i = 2,5 do 
			if i == options[6] then
				options[i] = options[i].."/#answer_ok("..nchoice..",6)"
			else
				options[i] = options[i].."/#answer_fail("..nchoice..",6)"
			end
		end
		Say(options[1],4,options[2], options[3], options[4], options[5])			
	elseif num == 8 then  --出一个简单的算数题-_-
		local A,B,C,D = random(100),random(10),random(100),random(10)
		local result = (A*B + C*D)*2*0.9  --瞎掰的题目，大概需要1分钟搞定
		local radnum = {-45,-36,-27,-18,-9,9,18,27,36,45}
		local radresult = {}
		local radtime = 0;
		for i = 1,3 do 
			radresult[i] = radnum[random(10)]
			for j = 1,i-1 do
				if radresult[j] == radresult[i] then
					radresult[i] = radnum[random(10)]
					radtime = radtime + 1;
					if radtime > 10 then
						break;
					end
					j = 1;
				end
			end
		end
		options[1] = format("%s/#answer_ok(%d,%d)", result, nchoice, 6)
		options[2] = format("%s/#answer_fail(%d,%d)", result+radresult[1], nchoice, 6)
		options[3] = format("%s/#answer_fail(%d,%d)", result+radresult[2], nchoice, 6)
		options[4] = format("%s/#answer_fail(%d,%d)", result+radresult[3], nchoice, 6)
		ReSort(options)		
		Say("<color=green>兔小丫<color>：最近我在研究九九口诀，遇到一个问题不知道大侠能不能帮我解决：隔壁老王养了<color=yellow>"..A.."<color>只鸡，每只鸡每天都会下<color=yellow>"..B.."<color>个蛋。他还养了<color=yellow>"..C.."<color>只鸭子，每只鸭子每天都会下<color=yellow>"..D.."<color>个蛋。每个蛋能卖<color=yellow>2<color>个铜板，卖蛋的收入还得交给官府<color=yellow>十分之一<color>的关税，请问他一天能赚多少个铜板啊？",4,
				 options[1], options[2], options[3], options[4])	
	end
end

function SpecialAnswer(num,select,choice)  --一些特殊问题的特殊答案,没有配置表读的
	local nchoice = choice
	if num == 1 then 
		if select == GetGlbValue(151) then
				answer_ok(nchoice,6)
		else
				answer_fail(nchoice,6)
		end
	end
end

--===================================================乱入特殊问题结束============================================

--=======================================================给科考外装=========================================================
function abluemoon_cloth()
	if GetTask(ABLUEMOON_JIFEN) < 1000 then
		Say("<color=green>兔小丫<color>： 你的科考成绩还没有达到<color=yellow>进士<color>，还没有资格领取文魁花锦袍。不过，你可以去<color=yellow>御街<color>看看，好像有各种颜色的科考外装卖。",0)
		return
	end
	if floor(GetTask(ABLUEMOON_COMPENSATION)/10) == 0 then --个位记录是否领取过补偿 十位记录是否领取过科考外装
		if GetFreeItemRoom() < 2 or (GetMaxItemWeight() - GetCurItemWeight()) < 10 then
			Say("<color=green>兔小丫<color>： 你的背包空间已经装不下了，先整理一下再来吧！",0)
			return
		end
		local player_sex = GetBody();
		SetTask(ABLUEMOON_COMPENSATION,GetTask(ABLUEMOON_COMPENSATION)+10)
		if player_sex == 1 then
			AddItem(0,109,260,1)  --文魁花锦袍(蓝) 标准男永久
		elseif player_sex == 2 then
			AddItem(0,109,262,1)  --文魁花锦袍(蓝) 魁梧男永久
		elseif player_sex == 3 then
			AddItem(0,109,268,1)  --文魁花锦裳(橙) 性感女永久
		else
			AddItem(0,109,275,1)  --文魁花锦裳(橙) 娇小女永久
		end
		Say("<color=green>兔小丫<color>： 文魁花锦裳拿好啦，穿上去看看。大侠能文能武，国家有望了！",0)
	else
		Say("<color=green>兔小丫<color>： 你已经领取过科考外装啦！每个人只能领取一套，如果还想要其他颜色的外装，可以去<color=yellow>御街<color>挑选。",0)
	end
end
--=====================================================规则介绍=================================================
function abluemoon_rule()
	local tSay = {
		"<enter>每天<color=yellow>除23：00－8：00时间段外<color>，我都会随机出现在各大城市中，接受大家的挑战。每人每天只能挑战一次，每次先要跟我猜拳，根据猜拳获胜的次数决定",
		"院试题目的数目，院试答对5题以上的话可以进入乡试。乡试的题数由院试正确的题数决定。乡试答对5题以上的话会有证书发放。",
		--继续在这里添加就行
	}
	local szSay = "";
	for i = 1,getn(tSay) do szSay = szSay..tSay[i] end
	Say("<color=green>兔小丫<color>：规则是这样的……"..szSay,0)
end

tShengwang = {  --根据声望猜称号
	{-500,"恶名昭著"},
	{-100,"声名狼藉"},
	{0,"平民百姓"},
	{50,"不名一文"},
	{150,"初出江湖"},
	{300,"无名小辈"},
	{500,"默默无闻"},
	{700,"初显锋芒"},
	{1000,"小有名气"},
	{1500,"声名鹊起"},
	{2250,"锋芒毕露"},
	{3000,"名声显赫"},
	{4500,"德高望重"},
	{6000,"威风八面"},
	{9000,"如雷贯耳"},
	{12000,"威镇九州"},
	{15000,"傲视群雄"},
	{18000,"一代宗师"},
	{22500,"笑傲江湖"},
	{27000,"举世无双"},
	{31500,"震古铄今"},
	{36500,"空前绝后"},
	{45000,"武林神话"},
}

tGatherSkill = { "伐木", "制皮", "收耕", "采药", "挖矿", "抽丝", }

tComposeSkill = { "长兵器锻造", "短兵器锻造", "奇门兵器锻造", "护甲织造", "制药", "烹饪", "制符", "下装织造", "头冠织造",}
