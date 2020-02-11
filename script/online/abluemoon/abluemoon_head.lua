Include("\\script\\class\\ktabfile.lua");
Include("\\script\\task\\world\\task_head.lua")
QuestTab = new(KTabFile, "\\settings\\abluemoon_question.txt");
Include("\\script\\item\\yanhuo.lua")

--===========================================任务变量相关================================
ABLUEMOON_QUEST_DATE = 610; --参加一般考试的日期
ABLUEMOON_QUEST_COUNT = 611; --当天回答次数
ABLUEMOON_QUEST_RIGHT_COUNT_1st = 612;--当天第一关回答正确次数
ABLUEMOON_QUEST_COUNT_MAX = 613; --当天能回答问题的数量
ABLUEMOON_JIFEN = 614; --积分

ABLUEMOON_STATE = 615; --开始答题标记,用于计时 1:开始答题 2:结束答题 3:答题超时
ABLUEMOON_TIMER = 616; --答题计时器

ABLUEMOON_LUCK_DATE = 617 --算命的日期
ABLUEMOON_LUCK = 618; --每天的幸运值 1～7表示运势 
ABLUEMOON_LUCKY_COUNT = 619 --每天转运的计数

ABLUEMOON_ANSWER_STAGE = 620 --记录领奖的关数
ABLUEMOON_ANSWER_WIN   = 621 --记录领奖的输赢

ABLUEMOON_ITEM_TO_EXP = 622 --记录生活材料换经验的日期
ABLUEMOON_COMPENSATION = 623	--个位记录是否领取过补偿 十位记录是否领取过科考外装 
ABLUEMOON_QUEST_DATE_PAY  = 624 ----参加高级考试的日期 IB专用
ABLUEMOON_TIMES_DAILY = 625 --每天高级考试的次数
ABLUEMOON_QUEST_RIGHT_COUNT_2nd = 626;--当天第二关回答正确次数
ABLUEMOON_CAIQUAN_COUNT = 627;  --每天已经猜拳的次数
ABLUEMOON_AWARD_TYPE    = 628;  --记录奖励类型， 1是普通奖励 2是高级奖励
ABLUEMOON_QUEST_ROUND   = 629;  --当天闯到第几关了
--=======================================================================================
--===========================================全局变量相关=================================
ABLUEMOON_TIME = 60; --答题限制,1分钟
 
MISSION_ID = 33; --140 MISSION ID
TIMER_ID = 61; --140
TIMER_LOOP_TIME = 18*1; --1秒循环一次
MV_MISSION_STATE = 1; --MISSION状态，1为开启，0为关闭  现在没用到
MV_TIMER_TIME = 2; --计时器运行时间
MV_TIMER_IDEL = 3; --停止答题时间
MV_ABLUEMOON_NEED_ROUTE = 4; --领取奖励需要的组队门派，一共15个
tMS_NAME = { 1,2,3,4,5 }  --排名相关名字用到的MISSION S 的ID
tMV_JIFEN = { 5,6,7,8,9 } --排名相关积分用到的MISSION V 的ID
MV_NPC_INDEX = 10;  --兔小丫的索引
MV_COUNT_PAY = 11;  --每小时参加高经验考试的人数
MV_COUNT_LUOBO = 12;  --每小时消耗的萝卜总数
TIMER_TOTAL_TIME = 59*60*1 --MISSION存在时间59分钟
NEED_TEAM = 1; --领奖需不需要组队 0:不需要 1:需要
--========================================================================================
--===================================================答题公共部分开始============================================
-- 显示灯谜对话
tbl_answer_index = {
	['A'] = 1,
	['B'] = 2,
	['C'] = 3,
	['D'] = 4,
	['a'] = 1,
	['b'] = 2,
	['c'] = 3,
	['d'] = 4,
};

tbl_answer_order = {
	"A",
	"B",
	"C",
	"D",
};

--给予领奖资格
function GetHappyTimes(nStage,bWin)
	DelMSPlayer(MISSION_ID,1)  --把玩家从MISSION中删除
	SetTask(ABLUEMOON_ANSWER_STAGE,nStage)
	SetTask(ABLUEMOON_ANSWER_WIN,bWin)
	abluemoon_sort() --加入排名
	local level = GetLevel()
	local route = GetMissionV(MV_ABLUEMOON_NEED_ROUTE)
	if NEED_TEAM == 1 then
		Say("<color=green>兔小丫<color>：你已经获得了领奖的资格，但是，还需要经过最后一道考验才能领到奖励。这样吧，你去找一个<color=yellow>"..(level-10).."级到"..(level+10).."级的"..tNeedRoute[route][2].."<color>朋友和你一起<color=yellow>组队<color>来找我，我就把奖励给你。",2,
			"我已经带来了，给我奖励吧/CheckHappyTimes","我再去找找/end_say")
	else
		Say("<color=green>兔小丫<color>：你已经获得了领奖的资格。任何时候来找我领取都行。",2,
			"给我奖励吧/CheckHappyTimes","我先不领/end_say")		
	end
end

--确认领奖资格
function CheckHappyTimes()
	local stage = GetTask(ABLUEMOON_ANSWER_STAGE)
	local win = GetTask(ABLUEMOON_ANSWER_WIN)
	if stage == 0 then
		Say("<color=green>兔小丫<color>：你上次考试的奖励已经领过啦！",0)
		return
	end
	
	local canwin = 0; --是否能领取奖励
	local level = GetLevel()
	local route = GetMissionV(MV_ABLUEMOON_NEED_ROUTE)
	if NEED_TEAM == 1 then  --需要组队领奖
		local nOldPlayerIndex = PlayerIndex
		local count = GetTeamSize()
		if count >= 2 then
			for i = 1,count do
				PlayerIndex = GetTeamMember(i)
				if GetPlayerRoute() == tNeedRoute[route][1] and GetLevel() <= (level+10) and GetLevel() >= (level-10) and PlayerIndex ~= nOldPlayerIndex then
						canwin = 1;
				end
			end
			PlayerIndex = nOldPlayerIndex
		end 	
	else
		canwin = 1;
	end
	
	if canwin == 0 then 
		Say("<color=green>兔小丫<color>：你还没有找到一个<color=yellow>"..(level-10).."级到"..(level+10).."级的"..tNeedRoute[route][2].."<color>朋友和你一起<color=yellow>组队<color>来找我，不能给你奖励哦！",0)
	else
		--SetTask(ABLUEMOON_ANSWER_STAGE,0) --放到领取成功之后再清吧
		HappyTimes(stage,win)
	end
end

-- 发奖
function HappyTimes(nStage,bWin)
	local stage = nStage;
	local win = bWin;
	local bonus_1st = tonumber(GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_1st))
	local bonus_2nd = tonumber(GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_2nd))
	local nLevel = GetLevel();
	local award_1st = nLevel^2*3;  --第一关每题奖励 [级别*级别*3]经验
	local award_2nd = nLevel^2*6;
	local nEarnExp_1st = 0;
	local nEarnExp_2nd = 0;
	local nTotalExp = 0;
	local award_type = GetTask(ABLUEMOON_AWARD_TYPE)
	
	if award_type == 1 then  --如果是一般考试
		award_1st = floor(award_1st/10)
		award_2nd = floor(award_2nd/10)
	end
	nEarnExp_1st = award_1st * bonus_1st  --第一关奖励
	if nStage == 2 then --第二关领取
			nEarnExp_2nd = award_2nd * bonus_2nd  --第二关奖励
	else  --以后扩展
		
	end

	nTotalExp = nEarnExp_1st + nEarnExp_2nd
	if win == 0 then
		nTotalExp = floor(nTotalExp / 2);  --答错了只有一半奖励
	end
	local tPrize = { 
			"<enter>院试答对的题目：<color=yellow>"..bonus_1st.."<color>题",
			"<enter>院试每题的奖励：<color=yellow>"..award_1st.."<color>点经验",
			"<enter>乡试答对的题目：<color=yellow>"..bonus_2nd.."<color>题",
			"<enter>乡试每题的奖励：<color=yellow>"..award_2nd.."<color>点经验",
		}		
	if win == 0 then
		tinsert(tPrize,"<enter>但是你最后失败了，只能给你一半的奖励，一共是：<color=yellow>"..nTotalExp.."<color>点经验")
	else
		tinsert(tPrize,"<enter>恭喜你，你今天能获得的奖励一共是：<color=yellow>"..nTotalExp.."<color>点经验")
	end	
	if stage == 1 then
		for i=1,2 do tremove(tPrize,3) end
	end
	local szPrize = "";
	for i=1,getn(tPrize) do 
		szPrize = szPrize..tPrize[i]
	end
	Say("<color=green>兔小丫<color>：根据你上次考试的记录，我们来算一下帐，你今天答题的奖励如下："..szPrize,1,"我现在就领取/#GetPrize("..nTotalExp..","..win..","..nStage..")")
end

--领奖
function GetPrize(nExp,bWin,nStage) 
	local win = bWin
	ModifyExp(nExp);
	Msg2Player("你获得了"..nExp.."点经验")
--	if GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_1st) == 10 and GetTask(ABLUEMOON_QUEST_COUNT) == 5 and win == 1 then
--		AddItem(0,107,155,1)  --五行秘籍
--		Say("<color=green>兔小丫<color>：由于你表现优异，特奖励你一本五行秘籍，下次继续努力！",0)
--	end
	
	local jifen = GetTask(ABLUEMOON_JIFEN)
	local jifenLV = jifen2level(jifen)
	if jifenLV >= 3 then 
		Msg2SubWorld("恭喜玩家 "..GetName().." 获得“"..tTitle[jifenLV][3].."”的称号！")
	end
	local award_type = GetTask(ABLUEMOON_AWARD_TYPE)
	local book_num = 1;
	if award_type == 2 then  --如果是高级考试
		book_num = 2;
	end
	local book = random(100)
	if nStage == 2 and GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_2nd) >= 5 then  --第二关答对5题以上才给证书
		if jifenLV == 2 then  --生员
			AddItem(2,0,597,book_num)  --月亮兔的任务卷轴－生员
			Msg2Player("你获得了科举考试的奖励－生员证书"..book_num.."本！")
		elseif jifenLV == 3 then  --秀才
			if book < 50 then
				AddItem(2,0,597,book_num)  --月亮兔的任务卷轴－生员
				Msg2Player("你获得了科举考试的奖励－生员证书"..book_num.."本！")
			else
				AddItem(2,0,598,book_num)  --月亮兔的任务卷轴－秀才
				Msg2Player("你获得了科举考试的奖励－秀才证书"..book_num.."本！")
			end
		elseif jifenLV == 4 then --举人
			if book < 40 then
				AddItem(2,0,597,book_num)  --月亮兔的任务卷轴－生员
				Msg2Player("你获得了科举考试的奖励－生员证书"..book_num.."本！")
			elseif book < 70 then
				AddItem(2,0,598,book_num)  --月亮兔的任务卷轴－秀才
				Msg2Player("你获得了科举考试的奖励－秀才证书"..book_num.."本！")
			else
				AddItem(2,0,599,book_num)  --月亮兔的任务卷轴－举人
				Msg2Player("你获得了科举考试的奖励－举人证书"..book_num.."本！")
			end
		elseif jifenLV == 5 then --贡士
			if book < 30 then
				AddItem(2,0,597,book_num)  --月亮兔的任务卷轴－生员
				Msg2Player("你获得了月亮兔的任务卷轴－生员证书"..book_num.."本！")
			elseif book < 60 then
				AddItem(2,0,598,book_num)  --月亮兔的任务卷轴－秀才
				Msg2Player("你获得了月亮兔的任务卷轴－秀才证书"..book_num.."本！")
			elseif book < 80 then
				AddItem(2,0,599,book_num)  --月亮兔的任务卷轴－举人
				Msg2Player("你获得了月亮兔的任务卷轴－举人证书"..book_num.."本！")
			else
				AddItem(2,0,600,book_num)  --月亮兔的任务卷轴－贡士
				Msg2Player("你获得了月亮兔的任务卷轴－贡士证书"..book_num.."本！")				
			end			
		elseif jifenLV >= 6 then --进士以上
			if book < 30 then
				AddItem(2,0,597,book_num)  --月亮兔的任务卷轴－生员
				Msg2Player("你获得了月亮兔的任务卷轴－生员证书"..book_num.."本！")
			elseif book < 55 then
				AddItem(2,0,598,book_num)  --月亮兔的任务卷轴－秀才
				Msg2Player("你获得了月亮兔的任务卷轴－秀才证书"..book_num.."本！")
			elseif book < 75 then
				AddItem(2,0,599,book_num)  --月亮兔的任务卷轴－举人
				Msg2Player("你获得了月亮兔的任务卷轴－举人证书"..book_num.."本！")
			elseif book < 95 then
				AddItem(2,0,600,book_num)  --月亮兔的任务卷轴－贡士
				Msg2Player("你获得了月亮兔的任务卷轴－贡士证书"..book_num.."本！")	
			else
				AddItem(2,0,601,book_num)  --月亮兔的任务卷轴－进士
				Msg2Player("你获得了月亮兔的任务卷轴－进士证书"..book_num.."本！")							
			end			
		end
	end
	
	SetTask(ABLUEMOON_ANSWER_STAGE, 0) --领完奖励之后清空答题信息
	SetTask(ABLUEMOON_QUEST_ROUND, 0)  --清空用于继续答题的标志
	local level = GetLevel()
	local nOldPlayerIndex = PlayerIndex
	local count = GetTeamSize()
	local route = GetMissionV(MV_ABLUEMOON_NEED_ROUTE)
	if count >= 2 then
		for i = 1,count do
			PlayerIndex = GetTeamMember(i)
			if GetPlayerRoute() == tNeedRoute[route][1] and GetLevel() <= (level+10) and GetLevel() >= (level-10) and PlayerIndex ~= nOldPlayerIndex then
					local nOtherExp = GetLevel()^2*20
					ModifyExp(nOtherExp) --给队友加级别^2*20经验
					Msg2Player("你获得了"..nOtherExp.."点经验！")
			end
		end
		PlayerIndex = nOldPlayerIndex
	end 
end

-- 显示灯谜问题
function show_question(num, caption)
	local row_start = 0;
	local row_end = 0;
	local Qnum = num;
	local Onum = Qnum;
	if num ~= 1 then
		if random(100) < 50 then 
			Qnum = 6 ;               --乱入特殊问题 1/5概率
		end
	end
	if Qnum == 1 then  --第一关题库
		row_start = 2;
		row_end = 278
	elseif Qnum == 2 then  --第二关第1类题库
		row_start = 279;
		row_end = QuestTab:getRow() - 1		
	elseif Qnum == 3 then  --第二关第2类题库
		row_start = 279;
		row_end = QuestTab:getRow() - 1		
	elseif Qnum == 4 then  --第二关第3类题库
		row_start = 279;
		row_end = QuestTab:getRow() - 1		
	elseif Qnum == 5 then  --第二关第4类题库
		row_start = 279;
		row_end = QuestTab:getRow() - 1		
	elseif Qnum == 6 then  --乱入特殊问题
		SpecialQues(Onum)
	end
	if (row_end > 1) then
		local row = random(row_start, row_end)
		local answer = QuestTab:getCell(row, 2)
		local question = format("%s%s", caption, QuestTab:getCell(row, 3))
		local options = {}
		
		for i = 1, 4 do
			options[i] = QuestTab:getCell(row, 3 + i)
			if (tbl_answer_index[answer] == i) then
				options[i] = format("%s/#answer_ok(%d,%d)", options[i], Onum, Qnum)
			else
				options[i] = format("%s/#answer_fail(%d,%d)", options[i], Onum, Qnum)
			end
		end
		ReSort(options)
		Say(question, 4, options[1], options[2], options[3], options[4])
	end
end

function ReSort(options)
	local count = getn(options)
	for i = 1, count do
		j = random(1, count)
		local tmp = options[i]
		options[i] = options[j]
		options[j] = tmp  
	end
	
	for i = 1, count do
		options[i] = format("%s. %s", tbl_answer_order[i], options[i])
	end
end

-- 回答正确
function answer_ok(num1,num2)
	local njifen = GetTask(ABLUEMOON_JIFEN)
	local Qnum = num2;
	local num = num1;
	local jifenLV = jifen2level(njifen)  --获得积分等级
	local jifen = 1;
	if Qnum > 1 and Qnum < 7 then  --第二关 
		jifen = tJifen[1][jifenLV] --按积分等级给积分，只对第二关有效
		if GetTask(ABLUEMOON_AWARD_TYPE) == 1 then  --如果是一般考试
			jifen = floor(jifen/2)
		else
			jifen = jifen * 2
		end
	end
	if njifen >= 4999 then jifen = 0 end  --限制分数上限

	if GetTask(ABLUEMOON_STATE) == 3 then 
		Say("<color=green>兔小丫<color>：你回答时间超时，算你答错哦！",1,"知道了/#answer_fail("..num..","..Qnum..")")
		return
	else
		SetTask(ABLUEMOON_STATE,2) --停止答题
	end
	Msg2Player("恭喜你答对了！")
	use_yanhuo("神秘烟花")  --放烟花庆祝,能不能做情绪动作？
	--DoFireworks(862,1)  --后羿效果
	SetTask(ABLUEMOON_QUEST_COUNT, GetTask(ABLUEMOON_QUEST_COUNT) + 1)   --答题数+1
	if Qnum == 1 then  --第一关
		SetTask(ABLUEMOON_JIFEN,GetTask(ABLUEMOON_JIFEN)+jifen)	  --积分+1
		SetTask(ABLUEMOON_QUEST_RIGHT_COUNT_1st, GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_1st) + 1)  --第一关正确题数+1
		Say("<color=green>兔小丫<color>：恭喜你答对了！再给你加上<color=yellow>"..jifen.."分<color>。",1,"继续答题/abluemoon_1st")
	elseif Qnum > 1 and Qnum < 7 then  --第二关
		SetTask(ABLUEMOON_JIFEN,(GetTask(ABLUEMOON_JIFEN)+jifen))	  --积分+2
		SetTask(ABLUEMOON_QUEST_RIGHT_COUNT_2nd, GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_2nd) + 1)  --第二关正确题数+1
		if GetTask(ABLUEMOON_QUEST_COUNT) < GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_1st) then  --第二关可以答题的数量＝第一关正确的数量
			Say("<color=green>兔小丫<color>：恭喜你答对了！再给你加上<color=yellow>"..jifen.."分<color>。你乡试目前一共答对了<color=yellow>"..GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_2nd).."<color>道题。你可以继续闯关，也可以现在领取累积的奖励。",2,"\n继续闯关/#abluemoon_2nd_go("..num..")","\n我现在就领取奖励吧/#GetHappyTimes(2,1)")
		elseif GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_2nd) >= 5 then
			local bonus = 10;
			if GetTask(ABLUEMOON_AWARD_TYPE) == 1 then  --如果是一般考试
				bonus = bonus/2
			else
				bonus = bonus*2
			end
			if njifen <= 4989 then 
				SetTask(ABLUEMOON_JIFEN,GetTask(ABLUEMOON_JIFEN)+bonus)	  --积分+1
			end
			Say("<color=green>兔小丫<color>：恭喜你乡试答对了<color=yellow>5题<color>以上！再给你额外奖励<color=yellow>"..bonus.."分<color>！",1,"我现在就领取奖励吧/#GetHappyTimes(2,1)")
		else
			Say("<color=green>兔小丫<color>：你在乡试的表现欠佳，没有答对<color=yellow>5题<color>以上。没有额外奖励哦！",1,"我现在就领取奖励吧/#GetHappyTimes(2,0)")
		end
	end
end

-- 回答错误
function answer_fail(num1,num2)
	local njifen = GetTask(ABLUEMOON_JIFEN)
	SetTask(ABLUEMOON_STATE,2) --停止答题
	local Qnum = num2;
	local num = num1;
	local jifenLV = jifen2level(njifen)  --获得积分等级
	local jifen = tJifen[2][jifenLV]  --按积分等级给积分，只对第二关有效
	Msg2Player("你答错了！")
	CastState("state_lost_life_per18",250,18*5)
	SetTask(ABLUEMOON_QUEST_COUNT, GetTask(ABLUEMOON_QUEST_COUNT) + 1)  --答题数+1
	if Qnum == 1 then  --第一关
		SetTask(ABLUEMOON_JIFEN,GetTask(ABLUEMOON_JIFEN)-1)  --积分-1
		Say("<color=green>兔小丫<color>：太可惜了，答错啦！你被扣了<color=yellow>1分<color>哦，嘻嘻！",1,"继续答题/abluemoon_1st")
	elseif Qnum > 1 and Qnum < 7 then  --第二关
		SetTask(ABLUEMOON_JIFEN,(GetTask(ABLUEMOON_JIFEN)+jifen))  --积分-2
		if GetTask(ABLUEMOON_QUEST_RIGHT_COUNT_2nd) >= 5 then
			Say("<color=green>兔小丫<color>：太可惜了，答错啦！你被扣了<color=yellow>"..-jifen.."分<color>，不能继续闯关了，累积的奖励也只能领取一半，下次努力！你乡试答对了<color=yellow>5题<color>以上，可能会有证书奖励哦！",1,"领取奖励/#GetHappyTimes(2,0)")
		else
			Say("<color=green>兔小丫<color>：太可惜了，答错啦！你被扣了<color=yellow>"..-jifen.."分<color>，不能继续闯关了，累积的奖励也只能领取一半，下次努力！你在乡试的表现欠佳，没有答对<color=yellow>5题<color>以上。没有证书奖励哦！",1,"我现在就领取奖励吧/#GetHappyTimes(2,0)")
		end
	end
end
--==================================================答题公共部分结束=================================================

--====================================================当天运势开始===================================================
function abluemoon_luck()
	local nDay = tonumber(date("%y%m%d"))
	if GetTask(ABLUEMOON_LUCK_DATE) < nDay then
		SetTask(ABLUEMOON_LUCK_DATE,nDay) 
		SetTask(ABLUEMOON_LUCK,0)
		SetTask(ABLUEMOON_LUCKY_COUNT,1)
	end 
	local nluck = random(1,7)
	if GetTask(ABLUEMOON_LUCK) == 0 then
		SetTask(ABLUEMOON_LUCK,nluck)
		Say("<color=green>兔小丫<color>：天灵灵，地灵灵，都没有我兔子灵，（咒语）％￥＃％￥※……※（咒语），掐指一算，这位大侠今天的运势是：<color=yellow>"..tluck[nluck].."<color>。",2,
				"我要转运/want_lucky",
				"多谢兔半仙/end_say")
	else
		Say("<color=green>兔小丫<color>：我已经给你算过一卦啦，算来算去都一样，你今天的运势是：<color=yellow>"..tluck[GetTask(ABLUEMOON_LUCK)].."<color>。不过既然我是兔半仙，你求求我还是可以给你转转运的……",2,
				"我要转运/want_lucky",
				"我认命了/end_say"
				)
	end
end

function want_lucky()
	local nPay = 10 * GetTask(ABLUEMOON_LUCKY_COUNT) + 15
	Say("<color=green>兔小丫<color>：想转运，还得看看神灵舍不舍得帮忙啦！这样吧，你给我带来一个<color=yellow>神秘物品<color>，我供奉给神灵，看看他能不能帮你转个好运。没有的话也没关系，你给我<color=yellow>"..nPay.."金<color>香火费，我烧烧香给你试试。另外，能不能转个好运给你，要看你的个人造化啦！如果你带有<color=yellow>金萝卜<color>，我可以免费给你转到<color=yellow>大吉<color>哦！",5,
			"我交点香火费转运/give_lucky_money",
			"我交神秘物品转运/give_lucky_shenmi",
			"我想直接转大吉/want_daji",
			"我想看看哪些神秘物品能转运/shenmi_info",
			"我去找找看/end_say"
			)
end

function give_lucky_money()  --用钱转运 
	local nCount = GetTask(ABLUEMOON_LUCKY_COUNT)
	local nPay = nCount * 100000 + 150000
	local nluck = random(1,7)
	if GetCash() >= nPay then
			Pay(nPay)
			SetTask(ABLUEMOON_LUCK,nluck)
			SetTask(ABLUEMOON_LUCKY_COUNT,nCount+1)
			Say("<color=green>兔小丫<color>：太好了，你的香火费我收下啦！你的运势也给你重新算过了，现在是：<color=yellow>"..tluck[nluck].."<color>。",0)
	else
		Say("<color=green>兔小丫<color>：不要欺骗我，小心我给你转个大凶！",0)
	end
end

function give_lucky_shenmi()  --看看玩家身上有什么可以用的物品
	local num = 0;
	local index = 0;
	for i = 1, getn(tShenmi) do
		if GetItemCount(2,1,tShenmi[i][2]) > 0 then
			index = i;
			num = tShenmi[i][2];
			break
		end
	end
	if num == 0 then
		Say("<color=green>兔小丫<color>：你身上好像没有可以转运的神秘物品哦！",0)
	else
		Say("<color=green>兔小丫<color>：你身上的<color=yellow>"..tShenmi[index][1].."<color>可以用来转运，你确认要用它来转运吗？如果不想用它来转的话请先把它放到仓库或者摆摊栏里。",2,
				"是的，我要用它来转运/#del_lucky_shenmi("..num..")",
				"我不转了/end_say")
	end
end

function del_lucky_shenmi(num)  --用神秘物品转运
	local nluck = random(1,7)
	if DelItem(2,1,num,1) == 1 then
		SetTask(ABLUEMOON_LUCK,nluck)
		SetTask(ABLUEMOON_LUCKY_COUNT,GetTask(ABLUEMOON_LUCKY_COUNT)+1)
		Say("<color=green>兔小丫<color>：太好了，你的神秘物品我收下啦！你的运势也给你重新算过了，现在是：<color=yellow>"..tluck[nluck].."<color>。",0)	
	else
		Say("<color=green>兔小丫<color>：不要欺骗我，小心我给你转个大凶！",0)
	end
end

function shenmi_info()  --能转运的神秘物品
 local shenmi = ""
 for i = 1, getn(tShenmi) do
 	shenmi = shenmi..tShenmi[i][1].." "
 end
 Talk(1,"","<color=green>兔小丫<color>：下面的东西就可以转运哦："..shenmi)
end

function want_daji()
	if GetItemCount(2,1,1091) >= 1 then
		Say("<color=green>兔小丫<color>：你身上有<color=yellow>金萝卜<color>，送给我的话就可以帮你转到<color=yellow>大吉<color>哦！要不要送给我呢？",2,
				"就送给你吧/want_daji_go",
				"我在想想/end_say"
		)
	else
		Say("<color=green>兔小丫<color>：想转大吉需要一个<color=yellow>金萝卜<color>才行哦！",0)
	end
end

function want_daji_go()
	if DelItem(2,1,1091,1) == 1 then
		SetTask(ABLUEMOON_LUCK,7) 
		Say("<color=green>兔小丫<color>：恭喜你，你今天的运势是<color=yellow>大吉<color>了！",0)
	else
		Say("<color=green>兔小丫<color>：想转大吉需要一个<color=yellow>金萝卜<color>才行哦！",0)
	end
end
--==================================================当天运势结束=========================================

--==================================================返回积分等级开始=========================================
function jifen2level(jifen)
	local nTitleLevel = 1;
	if jifen < 0 then
			nTitleLevel = 1
	elseif jifen < 100 then
			nTitleLevel = 2
	elseif jifen < 200 then
			nTitleLevel = 3
	elseif jifen < 500 then
			nTitleLevel = 4
	elseif jifen < 1000 then
			nTitleLevel = 5
	elseif jifen < 1500 then
			nTitleLevel = 6
	elseif jifen < 3000 then
			nTitleLevel = 7
	elseif jifen < 5000 then
			nTitleLevel = 8
	elseif jifen < 10000 then
			nTitleLevel = 9
	else
			nTitleLevel = 10
	end
	return nTitleLevel
end
--===================================================返回积分等级结束===================================================
--===================================================排行榜开始===========================================================
function abluemoon_paihang()  --显示排行榜
	local tab_jifen = {};
	local tab_name = {};
	local tab_level = {};
	for i = 1,5 do  --取出MISSION中的排名信息
		tab_jifen[i] = GetMissionV(tMV_JIFEN[i])
		tab_name[i] = GetMissionS(tMS_NAME[i])
		tab_level[i] = jifen2level(tab_jifen[i])
	end
	Say("<color=green>兔小丫<color>：依照我今天登记的名册来看，这次考试排名前五的考生是："..
			"<enter>第一名："..tab_name[1].."，积分："..tab_jifen[1].."，称号："..tTitle[tab_level[1]][3]..
			"<enter>第二名："..tab_name[2].."，积分："..tab_jifen[2].."，称号："..tTitle[tab_level[2]][3]..
			"<enter>第三名："..tab_name[3].."，积分："..tab_jifen[3].."，称号："..tTitle[tab_level[3]][3]..
			"<enter>第四名："..tab_name[4].."，积分："..tab_jifen[4].."，称号："..tTitle[tab_level[4]][3]..
			"<enter>第五名："..tab_name[5].."，积分："..tab_jifen[5].."，称号："..tTitle[tab_level[5]][3],
			0)
end

function abluemoon_sort()  --每次答完一个就统计一次排名
	local jifen = GetTask(ABLUEMOON_JIFEN);
	local tab_jifen = {};
	local tab_name = {};
	for i = 1,5 do  --取出MISSION中的排名信息
		tab_jifen[i] = GetMissionV(tMV_JIFEN[i])
		tab_name[i] = GetMissionS(tMS_NAME[i])
	end
	for i = 1,5 do  --插入并排序
		if jifen > tab_jifen[i] then
			for j = 5,i+1,-1 do 
				tab_jifen[j] = tab_jifen[j-1]
				tab_name[j] = tab_name[j-1]
			end
			tab_jifen[i] = jifen
			tab_name[i] = GetName()
			break
		end
	end
	for i = 1,5 do  --重新设置排名信息
		SetMissionV(tMV_JIFEN[i],tab_jifen[i])
		SetMissionS(tMS_NAME[i],tab_name[i])
	end	
end
--===================================================排行榜结束===========================================================
tluck = { "大凶", "中凶", "小凶", "中", "小吉", "中吉", "大吉"}
	
tShenmi = {  --转运用的神秘物品(2,1,...)
	{"黄金宝箱",108},
	{"传功舍利",109},
	{"山河社稷图碎片",110},
	{"玫瑰",111},
	{"幸运兔脚",112},
	{"苍狼牙",113},
	{"防水油绸",114},
	{"破天弓",115},
	{"龙骨",116},
	{"醉仙菊",117},
	{"尸王肋骨",118},
	{"尸气瓶",119},
	{"管子",120},
	{"飞鱼袋",121},
	{"双星壶",122},
	{"兽王心",123},
	{"头骨",124},
	{"聚魂鼎",125},
	{"蜡丸",126},
	{"蝠毒",127},
	{"官帽",128},
	{"密杀令",129},
	{"震天雷",130},
	{"藏宝图",131},
	{"风筝",132},
	{"木傀儡",133},
	{"槽银",134},
	{"花石纲",135},
	{"墨油",136},
	{"长成镜",137},
	{"毕升泥活字版",138},
	{"人头念珠",139},
	{"溪山行旅图",140},
	{"妖王战旗",141},
	{"皇朝玉玺",142},
	{"天罡五雷大法",143},
	{"金砖",144},
	{"雷炎金沙",146},
	{"天衣无缝",147},
	{"菩提子",151},
	{"秘银",152},
	{"颜料",153},
}

tNeedItem = {  --领取奖励所需物品
	{"灵蛛丝", 2,2,54 },
	{"金蚕丝", 2,2,55 },
	{"熊皮",   2,2,20 },
	{"鸾鸟羽披",2,10,7 },
	{"玄铁",   2,2,6 },
	{"天青石", 2,2,36 },
	{"重木",   2,2,9 },
	{"铁樟木", 2,2,10 },
}

tNeedRoute = {  --领取奖励需要组队的流派
	{0,"无门无派"},
	{2,"少林俗家"},
	{3,"少林禅宗"}, 
	{4,"少林武宗"}, 
	{6,"唐门"},
	{8,"峨嵋佛家"},
	{9,"峨嵋俗家"},
	{11,"丐帮净衣"},
	{12,"丐帮污衣"}, 
	{14,"武当道家"},
	{15,"武当俗家"},
	{17,"杨门枪骑"},
	{18,"杨门弓骑"},
	{20,"五毒邪侠"},
	{21,"五毒蛊师"},
}

tJifen = {  -- 相应称号等级答题的分数
	[1] = {  --加分，一共10级
		15,10,7,6,5,5,5,5,5,5
	},
	[2] = {  --扣分
	  -1,-1,-1,-3,-10,-20,-30,-40,-50,-100
	}
}

tTitle = {  --相应积分对应的称号
	{50,1,"文盲" },
	{50,2,"生员"},
	{50,3,"秀才"},
	{50,4,"举人"},
	{50,5,"贡士"},
	{50,6,"进士"},
	{50,7,"学士"},
	{50,8,"文书阁学士"},
	{50,9,"翰林院大学士"},
	{50,10,"文曲星"},
}


function end_say()

end