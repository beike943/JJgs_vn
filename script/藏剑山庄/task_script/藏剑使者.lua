Include("\\script\\online\\viet_2008_51\\viet_51_function.lua")
Include("\\script\\online\\fruit_event_08_viet\\fruit_event_head.lua");		--越南2008 水果宴会活动
Include("\\script\\online\\viet_event\\mooncake_08\\mooncake_head.lua")
Include("\\script\\online\\viet_event\\200912\\event_head.lua");--越南2009年12月活动

ACT1_BOSS_Index = {}
nJiFenDivRate = 100

--09年8月藏剑调整新增奖励
tNEW_AWARD_EX_STAGE_7 = {
		[5] = 225000,
		[6] = 675000,
		[7] = 1125000,
		[8] = 2250000,
		[9] = 2812500,
};

tNEW_AWARD_EX_STAGE_7_2 = {
		[5] = 200000,
		[6] = 600000,
		[7] = 1000000,
		[8] = 2000000,
		[9] = 2500000,
};

-- ------------------------------------------------------------------------------------------------ <Act I Function> ----
function ACT1_Trap()
	local nZone = TC_GetTeamZone()
	local nMaxLevel = TM_GetMaxLevel()

	if (TC_TASK_EventCount[nZone][2] ~= 1) and (TC_STAGE_State[nZone] >= 10) then
		TC_STAGE_State[nZone] = 11
		TC_TASK_EventCount[nZone][2] = 1
		MC_NoSpawnNPCs(nStage, nMaxLevel, "家丁")
		MC_BeSpawnNPCs(nStage, nMaxLevel, "家丁")
		-- Stage Event Start
		local nETRow = MU_Div(TM_GetMinLevel()) - 2
		-- Msg2Player(nETRow.." "..TM_GetMinLevel())
		local nScore = TB_BONUS_TABLE[nETRow][1]/nJiFenDivRate
		local nCTime = random(180, 360)
		local nRelation = random(-5, 0)
		SetTask(TB_BONUS_SCORE, (GetTask(TB_BONUS_SCORE)+nScore))	-- 增加积分
		if random(1,100000) <= 80000 then
			SetTask(TB_BONUS_RELATION, (GetTask(TB_BONUS_RELATION)+nRelation))		-- 降低友好度
			Msg2Player("H祅g lo箃 gia 甶nh ph蒼 n閰?")
		end
		if random(1,100000) <= 50000 then
			CastState("state_confusion",100, nCTime)
			Msg2Player("Th譶h l譶h b? mai ph鬰, ch籲g bi誸 xoay s? ra sao.")
		end
		local nFlag = SetBit(GetTask(SB_EVENT_STAGE[1]), 3, 1)
		SetTask(SB_EVENT_STAGE[1], nFlag)
		SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 3, 1)
--		TaskTip("特殊事件激活：山门·家丁陷阱\n    积分变化：+"..nScore.."\n    友好变化："..nRelation.."\n    惊吓时间："..(nCTime/18).."s")
--		TaskTip("特殊事件激活：山门·家丁陷阱")
		-- Stage Event End
--		MU_Msg2Team("护院家丁：有人闯进山庄了！大家快来啊！", 2)
--		MU_Msg2Team("前方涌出大批护院家丁。")
	end
end
function ACT1_Timer()
	local nZone = TC_GetTeamZone()
	local nMaxLevel = TM_GetMaxLevel()	
	if (TC_STAGE_State[nZone] >= 10) and (TC_STAGE_State[nZone] < 20) then
		if TC_STAGE_State[nZone] < 11 then
--			MC_BeSpawnNPCs(nStage, nMaxLevel, "看门狗")
			MC_BeSpawnNPCs(nStage, nMaxLevel)
		else
			MC_BeSpawnNPCs(nStage, nMaxLevel)
		end
	end 
end
function ACT1_Killer()
	local nZone = TC_GetTeamZone()
	if TT_TARGET_Name == "家丁" then
		TC_TASK_EventCount[nZone][1] = TC_TASK_EventCount[nZone][1] + 1
--		MU_Msg2Team(TC_TASK_EventCount[nZone][1].."/"..TC_TASK_Conditions[nZone][1])
	end
	if (TC_TASK_EventCount[nZone][1] >= TC_TASK_Conditions[nZone][1]) and (TC_STAGE_State[nZone] <= 11) then
		TC_STAGE_State[nZone] = 12
		ACT1_BOSS_Index[nZone] = MC_CreateBoss(1)
		MU_Msg2Team("谁敢进入藏剑山庄？", 2)
		MU_Msg2Team("Kinh ng n T鎛g qu秐 ngo筰 vi謓!")
		TC_TASK_Conditions[nZone][4] = TC_TASK_Conditions[nZone][4] + TC_KILL_Stage[nZone]
--		Msg2Player("fenlu: "..TC_TASK_Conditions[nZone][4])
	end
	if (TC_KILL_Stage[nZone] == TC_TASK_Conditions[nZone][4]) and (random(1, 100000) <= 75000) and (TC_STAGE_State[nZone] == 12) then
		-- Stage Event Start
		local nFlag = SetBit(GetTask(SB_EVENT_STAGE[1]), 4, 1)
		SetTask(SB_EVENT_STAGE[1], nFlag)
		SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 4, 1)
		AddUnitStates(ACT1_BOSS_Index[nZone], 1, GetUnitBaseStates(ACT1_BOSS_Index[nZone], 1)*2)
		AddUnitStates(ACT1_BOSS_Index[nZone], 2, GetUnitBaseStates(ACT1_BOSS_Index[nZone], 2)*2)
		local nETRow = MU_Div(TM_GetMinLevel()) - 2
		TB_AddScore(1, (TB_BONUS_TABLE[nETRow][1]/nJiFenDivRate))
		TB_AddScore(3, random(-5, 0))
		TaskTip("特殊事件激活:山门·外院总管的愤怒")
		MU_Msg2Team("你敢到藏剑山庄来!那就看看我们是怎么教训你的。", 2)
		-- Stage Event End
	end
	if TT_TARGET_Name == "Ch? canh" then
		TC_TASK_EventCount[nZone][3] = TC_TASK_EventCount[nZone][3] + 1
--		Msg2Player("看门狗： "..TC_TASK_EventCount[nZone][3].."/"..TC_TASK_Conditions[nZone][3])
		if (TC_TASK_EventCount[nZone][3] == TC_TASK_Conditions[nZone][3]) then
			-- Stage Event Start
			local nRnd = random(1,100000)
--			Msg2Player("Random: "..nRnd)
			if nRnd <= 20000 then
				local nETRow = MU_Div(TM_GetMinLevel()) - 2
				TB_AddScore(1, (TB_BONUS_TABLE[nETRow][1]/nJiFenDivRate))
				TB_AddScore(3, random(-5, 0))
				local nFlag = SetBit(GetTask(SB_EVENT_STAGE[1]), 2, 1)
				SetTask(SB_EVENT_STAGE[1], nFlag)
				SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 2, 1)
				local nlevel = MU_Div(TM_MEMBER_MaxLevel[nZone]) * 10
				local LastedCreatedUnit = CreateNpc("家丁"..tostring(nlevel), "愤怒的家丁", GetWorldPos())		
				MC_Add2Group(LastedCreatedUnit)
				AddUnitStates(LastedCreatedUnit, 1, GetUnitBaseStates(LastedCreatedUnit, 1)*5)
				AddUnitStates(LastedCreatedUnit, 2, GetUnitBaseStates(LastedCreatedUnit, 2)*5)
				TaskTip("特殊事件激活:山门·愤怒的家丁")
				MU_Msg2Team("你敢伤害我的宠物狗!看我不弄死你。", 2)
			end
			-- Stage Event End
		end
	end
	if TT_TARGET_Name == "外院总管" then
		TC_STAGE_State[nZone] = 20
		MC_ClearGroup(nZone)
		GS_CreateMessenger()
		--AddGlobalNews("江湖传言：一群江湖豪杰在队长<"..GetCaptainName()..">的带领下，已经击败了藏剑山庄外院总管，顺利闯过了藏剑第一关")
--		Msg2Player("hahaha:"..TC_TASK_EventCount[nZone][3])
		if (TC_TASK_EventCount[nZone][3] == 0) and (GetBit(SB_STAGE_RECORD[nZone], 4) == 0) then
			-- Stage Event Start
			MU_Msg2Team("你通过第一关，没有伤害任何看门狗!既然你不是野蛮人，我就不再为难你了。", 2)
			local nFlag = SetBit(GetTask(SB_EVENT_STAGE[1]), 1, 1)
			SetTask(SB_EVENT_STAGE[1], nFlag)
			SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 1, 1)
			TB_AddScore(3, random(5, 10))
			TaskTip("特殊事件激活:山门·典礼")
			-- Stage Event End
		else
			MU_Msg2Team("你让我等了这么久！", 2)
		end
		MU_Msg2Team("外院总管被打败了")
	end
	if TT_TARGET_Name == "愤怒的家丁" then
		MU_Msg2Team("你们这些残暴的人，一定会受到惩罚！", 2)
	end
end
-- ------------------------------------------------------------------------------------------------ <Act II> ----
ACT2_BOSSTALK = {
"дn ng l骳 l緈, b鎛 trang c? vi謈 n祔 c莕 thng lng. Khi c竎 ngi v祇 i vi謓 th? Thi猲 Cng Du Long ki誱 b鏽g nhi猲 bi課 m蕋. Ta kh玭g nghi ng? c竎 ngi nh璶g vi謈 n祔 c騨g n猲 l祄 r?.",
"你为什么这么说?ACT2_StartBoss",
"总管/ACT2_StartBossWithRules",
"N誹 c竎 ngi kh玭g c? t藅 gi藅 m譶h, h? t蕋 ph秈 x蕌 h? m? h鉧 gi薾 th?? Xem T祅g Ki誱 s琻 trang ta l? ch鑞 kh玭g ngi ?? B﹜ u? B総 n? cho ta!",
"Ch綾 ch緉 c? k? nh c緋 Du Long ki誱 r錳 vu oan cho ta, Ta ph秈 l祄 r? chuy謓 n祔 m韎 頲. \n Л頲! Ta i tin c馻 ngi!",
"Ch璦 c? tin t鴆 Du Long ki誱 sao? Chuy謓 n祔 e r籲g c? ch髏 kh? nghi!",
"Th? ra l? do S琻 trang gi竜 nh c緋! Th藅 c? l鏸 v韎 c竎 v?, l穙 phu v? c飊g x蕌 h?! T鎛g qu秐 ngo筰 vi謓 n鉯: C竎 v? qu? th藅 th﹏ th? b蕋 ph祄! L穙 phu mu鑞 l躰h gi竜 v礽 chi猽, xin c竎 v? t薾 t譶h ch? b秓! B﹜ u? Lui!",
"Ti觰 t芻 kia! C竎 ngi kh玭g th? 甶 頲! Чi ti觰 th? 產ng ch? c竎 ngi ? h藆 vi謓!",
"Qu? l? tu鎖 tr? t礽 cao, l穙 phu kh玭g th緉g n鎖 c竎 ngi! Xin m阨 v祇 trong.",
"C﹜ ki誱 B輈h T祄 m? c竎 ngi t譵 頲 kh玭g ph秈 l? b秓 ki誱 ta l祄 m蕋 nh璶g n? 頲 c t? XXX. N誹 g苝 頲 t鎛g qu秐 XXX nh? mang tr? l筰 cho h緉.",
"Qua Li猲 Ho祅 S祇 l? n i c ki誱, n誹 g苝 頲 t鎛g qu秐 th? g鰅 l筰 cho h緉, nh? ng l祄 kinh ng ti觰 th?."}		-- 初步定为获得[冰晶]的任务
ACT2_GotSword = {}
-- ------------------------------------------------------------------------------------------------ <Act II Function> ----
function ACT2_Talk()
	local nZone = TC_GetTeamZone()
	if TC_STAGE_State[nZone] < 16 then
		if TM_IsCaptain() == 1 then
			Say(ACT2_BOSSTALK[1], 2, ACT2_BOSSTALK[2], ACT2_BOSSTALK[3])
		else
			Talk(1, "", ACT2_BOSSTALK[1])
		end
	else
		if TC_STAGE_State[nZone] == 16 then
			Talk(1, "", ACT2_BOSSTALK[6])
		elseif TC_STAGE_State[nZone] == 17 then
			Talk(1, "", ACT2_BOSSTALK[7])
			MC_Del4Group(TT_GetTarget(), 0)
			MC_ClearGroup(2)
			TC_STAGE_State[nZone] = 19
			MC_CreateBoss(2)
			-- Stage Event Start
			local nFlag = SetBit(GetTask(SB_EVENT_STAGE[2]), 2, 1)
			SetTask(SB_EVENT_STAGE[2], nFlag)
			SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 2, 1)
			local nETRow = MU_Div(TM_GetMinLevel()) - 2
			TB_AddScore(1, (TB_BONUS_TABLE[nETRow][2]/nJiFenDivRate))
			TB_AddScore(3, random(1, 5))
			TaskTip("激活特殊事件:山门.Th駓 L筩 Th筩h Xu蕋?")
			-- Stage Event End
		elseif TC_STAGE_State[nZone] == 18 then
			Talk(1, "", ACT2_BOSSTALK[10])
			MC_Del4Group(TT_GetTarget(), 0)
			MC_ClearGroup(2)
			TC_STAGE_State[nZone] = 19
			MC_CreateBoss(2)
			ACT2_GotSword[nZone] = 1					-- 用来记录是否得到了 碧蚕剑
			-- Stage Event Start
			local nFlag = SetBit(GetTask(SB_EVENT_STAGE[2]), 3, 1)
			SetTask(SB_EVENT_STAGE[2], nFlag)
			SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 3, 1)
			local nETRow = MU_Div(TM_GetMinLevel()) - 2
			TB_AddScore(1, (TB_BONUS_TABLE[nETRow][2]/nJiFenDivRate))
			TB_AddScore(3, random(1, 5))
			TaskTip("激活特殊事件:山门·碧蚕剑")
			-- Stage Event End
		end
	end
end
function ACT2_StartBoss()
	local nZone = TC_GetTeamZone()
	TC_STAGE_State[nZone] = 11			-- 11~14 是不交剑
	MC_Del4Group(TT_GetTarget(), 0)
	local nBossIndex = MC_CreateBoss(2)
	AddUnitStates(nBossIndex, 1, 100)
	MU_Msg2Team(ACT2_BOSSTALK[4], 2)
	-- Stage Event Start
	local nFlag = SetBit(GetTask(SB_EVENT_STAGE[2]), 1, 1)
	SetTask(SB_EVENT_STAGE[2], nFlag)
	SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 1, 1)
	local nETRow = MU_Div(TM_GetMinLevel()) - 2
	TB_AddScore(1, (TB_BONUS_TABLE[nETRow][2]/nJiFenDivRate))
	TB_AddScore(3, random(-5, 0))
	TaskTip("特殊事件激活:山门·误会")
	-- Stage Event End
end
function ACT2_StartBossWithRules()
	local nZone = TC_GetTeamZone()
	TC_STAGE_State[nZone] = 16			-- 16~19 是交剑
	MU_Msg2Team(ACT2_BOSSTALK[5], 2)
end
function ACT2_Timer()
	local nZone = TC_GetTeamZone()
	local nMaxLevel = TM_GetMaxLevel()	
	if (TC_STAGE_State[nZone] >= 10) and (TC_STAGE_State[nZone] < 20) then
		if TC_STAGE_State[nZone] < 11 then
			MC_BeSpawnNPCs(nStage, nMaxLevel, "家丁")
		elseif TC_STAGE_State[nZone] < 19 then
			MC_BeSpawnNPCs(nStage, nMaxLevel)
		end
	end 
end
function ACT2_Killer()
	local nZone = TC_GetTeamZone()
	if (TT_TARGET_Name == "家丁") and (TC_STAGE_State[nZone] == 16) then
		TC_TASK_EventCount[nZone][1] = TC_TASK_EventCount[nZone][1] + 1
--		MU_Msg2Team(TC_TASK_EventCount[nZone][1].."/"..TC_TASK_Conditions[nZone][1])
		if (TC_TASK_EventCount[nZone][1] >= TC_TASK_Conditions[nZone][1]) then
			if (random(1,100000) <= 30000) or (TC_TASK_EventCount[nZone][1] >= TC_TASK_Conditions[nZone][2]) then
				TC_STAGE_State[nZone] = 17
				MU_Msg2Team(GetName().."发现了一把剑", 2)
				MU_Msg2Team("任务:完成任务")
			elseif random(1,100000) <= 10000 then
				TC_STAGE_State[nZone] = 18
				MU_Msg2Team(GetName().."发现了一把剑", 2)
				MU_Msg2Team("任务:碧蚕剑")
			end
		end
	end
	if TT_TARGET_Name == "内院总管" then
		if (TC_STAGE_State[nZone] == 11) then
			MU_Msg2Team(ACT2_BOSSTALK[8], 2)
		elseif (TC_STAGE_State[nZone] == 19) and (ACT2_GotSword[nZone] ~= 1) then
			MU_Msg2Team(ACT2_BOSSTALK[9], 2)
		elseif (TC_STAGE_State[nZone] == 19) and (ACT2_GotSword[nZone] == 1) then
			MU_Msg2Team(ACT2_BOSSTALK[11], 1)
		end
		TC_STAGE_State[nZone] = 20
		MC_ClearGroup(nZone)
		GS_CreateMessenger()
		MU_Msg2Team("击败了内院总管")
		--AddGlobalNews("江湖传言：一群江湖豪杰在队长<"..GetCaptainName()..">的带领下，已经击败了藏剑山庄内院总管，顺利闯过了藏剑第二关")
	end
end
-- ------------------------------------------------------------------------------------------------ <Act III> ----
ACT3_ODDER_POS = {
{1587, 3134}, {1609, 3111}, {1631, 3088}, {1660, 3092}, {1684, 3113}, {1681, 3132}, {1664, 3153}, {1644, 3174}}
ACT3_ODDER_Table = {}
ACT3_Keeper = {}
ACT3_Traped = {}
ACT3_CONTRACK = {2, 0, 213}				-- 卖身契
ACT3_SKEY = {2, 0, 337}					-- 银钥匙
ACT3_CKEY = {2, 0, 336}					-- 铜钥匙
ACT3_ContrackSent = {}
-- ------------------------------------------------------------------------------------------------ <Act VIII Function> ----
function ACT3_Trap()
	local nZone = TC_GetTeamZone()
	-- Stage Event Start
	Msg2Player("你踩到花园了"..ACT3_Traped[nZone].."/3]")
	ACT3_Traped[nZone] = ACT3_Traped[nZone] + 1
	-- Stage Event End
end
function ACT3_Talk()
	local nZone = TC_GetTeamZone()
	if TT_TARGET_ModID == "乞丐" then
		-- Stage Event Start
		local nETRow = MU_Div(TM_GetMinLevel()) - 2
--		TB_AddScore(1, (TB_BONUS_TABLE[nETRow][3]/nJiFenDivRate))
		local nFlag = SetBit(GetTask(SB_EVENT_STAGE[3]), 3, 1)
		SetTask(SB_EVENT_STAGE[3], nFlag)
		SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 3, 1)
		if (GetItemCount(ACT3_CONTRACK[1], ACT3_CONTRACK[2], ACT3_CONTRACK[3]) >= 1) and (ACT3_ContrackSent[nZone] == 0) then
			DelItem(ACT3_CONTRACK[1], ACT3_CONTRACK[2], ACT3_CONTRACK[3], 1)
			ACT3_ContrackSent[nZone] = 1
			if random(1,100000) < 10000 then
				AddItem(ACT3_SKEY[1], ACT3_SKEY[2], ACT3_SKEY[3], 1)
			else
				AddItem(ACT3_CKEY[1], ACT3_CKEY[2], ACT3_CKEY[3], 1)
			end
			MU_Msg2Team("Зy l? <color=green>Ch譨 kh鉧 th莕 k?<color> trc y khi ti觰 nh﹏ b? l筩 ? h藆 s琻 nh苩 頲, xin t苙g l筰 cho i nh﹏!", 1)
		elseif (ACT3_ContrackSent[nZone] == 1) then
			MU_Msg2Team("谢谢！我终于自由了。", 2)
		else
			MU_Msg2Team("我被大小姐抢了我的钱，还把我关起来。", 1)
		end
		-- Stage Event End
	end
end
function ACT3_Timer()
	local nZone = TC_GetTeamZone()
	local nMaxLevel = TM_GetMaxLevel()	
	if (TC_STAGE_State[nZone] >= 10) and (TC_STAGE_State[nZone] < 19) then
		MC_BeSpawnNPCs(nStage, nMaxLevel, "家丁")
	end 
end
function ACT3_Killer()
	local nZone = TC_GetTeamZone()
	if (TT_TARGET_Name == "家丁") and (TC_TASK_EventCount[nZone][1] < TC_TASK_Conditions[nZone][1]) then
		TC_TASK_EventCount[nZone][1] = TC_TASK_EventCount[nZone][1] + 1
--		MU_Msg2Team(TC_TASK_EventCount[nZone][1].."/"..TC_TASK_Conditions[nZone][1])
		if mod(TC_TASK_EventCount[nZone][1], 2) == 0 then
			MU_Msg2Team(MU_GetColoredText("护院家丁", "green")..":人在那里，有闯入者在偷东西。", 2)
			ACT3_CreateOdder()
		end
	end
	if (TT_TARGET_Name == "护院家丁") then
		TC_STAGE_State[nZone] = TC_STAGE_State[nZone] + 1
--		Msg2Player(TC_STAGE_State[nZone])
		if TC_STAGE_State[nZone] == 18 then
			MC_Del4Group(TT_GetTarget(), 0)	--清除护院家丁
			MC_ClearGroup(3)	--清除护院家丁
			TC_STAGE_State[nZone] = 19
			local nBossIndex = MC_CreateBoss(3)
			if ACT3_Traped[nZone] >= 3 then
				MU_Msg2Team("谁敢到这里来捣乱，打扰我们大小姐的休息?", 2)
				-- Stage Event Start
				local nETRow = MU_Div(TM_GetMinLevel()) - 2
				TB_AddScore(1, (TB_BONUS_TABLE[nETRow][3]/nJiFenDivRate))
				TB_AddScore(3, random(-5,0))
				local nFlag = SetBit(GetTask(SB_EVENT_STAGE[3]), 2, 1)
				SetTask(SB_EVENT_STAGE[3], nFlag)
				SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 2, 1)
				AddUnitStates(nBossIndex, 1, GetUnitBaseStates(nBossIndex, 1)*(ACT3_Traped[nZone]^0.5))
				AddUnitStates(nBossIndex, 2, GetUnitBaseStates(nBossIndex, 2)*(ACT3_Traped[nZone]^0.5))
				TaskTip("触发特殊事件:小姐.愤怒的小姐")
				-- Stage Event End
			else
				MU_Msg2Team("谁敢到这里来捣乱，打扰我们大小姐的休息?", 2)
			end
			MU_Msg2Team("大小姐被吓坏了")
		end
	end
	if (TC_TASK_EventCount[nZone][2] >= 6) and (TC_STAGE_State[nZone] <= 12) and (ACT3_Keeper[nZone] == 0) then		-- 判断是否有 6 个女仆同时存在
		-- Stage Event Start
		ACT3_Keeper[nZone] = 1
		-- Stage Event End
	end
	if (TC_STAGE_State[nZone] == 19) and (ACT3_Keeper[nZone] == 1) then			-- 出现执事
		ACT3_Keeper[nZone] = 2
		if random(1, 100000) <= 80000 then
			-- Stage Event Start
			local nETRow = MU_Div(TM_GetMinLevel()) - 2
			TB_AddScore(1, (TB_BONUS_TABLE[nETRow][1]/nJiFenDivRate))
			local nFlag = SetBit(GetTask(SB_EVENT_STAGE[3]), 1, 1)
			SetTask(SB_EVENT_STAGE[3], nFlag)
			SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 1, 1)
			local nMapID = GetWorldPos()
			local nlevel = MU_Div(TM_MEMBER_MaxLevel[nZone]) * 10
			local LastedCreatedUnit = CreateNpc("L穙 b閏"..tostring(nlevel), "H藆 Hoa Vi猲 nghi trng", nMapID, 1630, 3147)		
			MC_Add2Group(LastedCreatedUnit)
			AddUnitStates(LastedCreatedUnit, 1, GetUnitBaseStates(LastedCreatedUnit, 1)*5)
			AddUnitStates(LastedCreatedUnit, 2, GetUnitBaseStates(LastedCreatedUnit, 2)*5)
			TaskTip("触发特殊事件: H藆 Hoa Vi猲.H藆 Hoa Vi猲 nghi trng")
			MU_Msg2Team("又有个大块头闯进了小姐的房间，大小姐派我来保护她。", 2)
			-- Stage Event End
		end
	end
	if TT_TARGET_Name == "大小姐" then
		TC_STAGE_State[nZone] = 20
		MC_ClearGroup(nZone)
		GS_CreateMessenger()
		if TM_SexCount() == 0 then
			-- Stage Event Start
			local nETRow = MU_Div(TM_GetMinLevel()) - 2
			TB_AddScore(1, (TB_BONUS_TABLE[nETRow][1]/nJiFenDivRate))
			TB_AddScore(3, random(4, 6))
			local nFlag = SetBit(GetTask(SB_EVENT_STAGE[3]), 4, 1)
			SetTask(SB_EVENT_STAGE[3], nFlag)
			SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], 4, 1)
			TaskTip("触发特殊事件: H藆 Hoa Vi猲.大小姐的心情")
			MU_Msg2Team("C竎 c? nng qu? nhi猲 v? ngh? cao cng! B鎛 ti觰 th? v鑞 kh﹎ ph鬰 c竎 n? nh﹏ kh玭g t? v? nhu m? 蝟 l?, ch鴑g t? n? nhi ta kh玭g thua g? b鋘 nam nh﹏ ng tr竎h! M阨 ch? v? 甶 qua! H穣 gi髉 ta gi竜 hu蕁 m蕐 g? kia!", 2)
			-- Stage Event End
		else
			MU_Msg2Team("你们踩着我的花了，还想跑哪儿去了?", 2)
		end
		MU_Msg2Team("打败了大小姐")
		--AddGlobalNews("江湖传言：一群江湖豪杰在队长<"..GetCaptainName()..">的带领下，已经击败了藏剑山庄大小姐，顺利闯过了藏剑第三关")
		if random(1,100000) <= 90000 then
			local nMapID = GetWorldPos()
			local nRndPoint = random(1, 8)
			local LastedCreatedUnit = CreateNpc("乞丐", "可怜的家庭", nMapID, ACT3_ODDER_POS[nRndPoint][1], ACT3_ODDER_POS[nRndPoint][2])
			SetNpcDeathScript(LastedCreatedUnit, SF_FILE)
			MC_Add2Group(LastedCreatedUnit)
			MU_Msg2Team("可怜的家庭:......", 2)
		end
	end
end
-- ------------------------------------------------------------------------------------------------ <Act IV> ----
ACT4_SWITCH_POS = {					-- 机关坐标
{1796, 2912}, {1810, 2955}, {1856, 2977}, {1761, 2949}, {1770, 2999}, {1818, 3009}, {1714, 2998}, {1741, 3032}, {1772, 3064}}
ACT4_SWITCH_DEFENDER = {			-- 机关守卫
{{1795, 2911}, {1801, 2910}, {1798, 2900}, {1790, 2907}}, {{1801, 2960}, {1806, 2952}, {1812, 2942}, {1804, 2949}},
{{1856, 2981}, {1862, 2973}, {1857, 2963}, {1850, 2972}}, {{1761, 2853}, {1767, 2947}, {1763, 2938}, {1756, 2944}},
{{1769, 3004}, {1776, 2995}, {1772, 2986}, {1764, 2993}}, {{1817, 3013}, {1822, 3005}, {1819, 2996}, {1812, 3005}},
{{1713, 3003}, {1708, 2995}, {1719, 2996}, {1716, 2985}}, {{1741, 3037}, {1747, 3030}, {1743, 3020}, {1736, 3027}},
{{1772, 3070}, {1777, 3062}, {1773, 3051}, {1766, 3059}}}
ACT4_SWITCH_Name = {"<机关守卫>","<机关守卫>","<机关守卫>"}
ACT4_SWITCH_Table = {}
ACT4_SWITCH_Count = {{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}}
ACT4_SWITCH_DEBUFF = {{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}}
ACT4_SWITCH_TimeLim = {{999,999,999},{999,999,999},{999,999,999},{999,999,999},{999,999,999}}
ACT4_SWITCH_Index = {{{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0}},{{0,0,0},{0,0,0},{0,0,0}}}
ACT4_BOSS_Spwaned = {0,0,0,0,0}
-- ------------------------------------------------------------------------------------------------ <Act IV Function> ----
function ACT4_Timer()
	local nZone = TC_GetTeamZone()
	local nMaxLevel = TM_GetMaxLevel()	
	if (TC_STAGE_State[nZone] >= 10) and (TC_STAGE_State[nZone] < 20) then
		MC_BeSpawnNPCs(nStage, nMaxLevel)
		if mod(TC_TIMER_Count[nZone],2) == 0 then		-- 每28秒添加一次 Debuff
--			MU_Msg2Team("时间经过中…… ["..TC_TIMER_Count[nZone].."]")
			ACT4_Debuff(1)
		end
--		Msg2Player(ACT4_SWITCH_TimeLim[nZone][1].."/"..ACT4_SWITCH_TimeLim[nZone][2].."/"..ACT4_SWITCH_TimeLim[nZone][3])
		if TC_TIMER_Count[nZone] >= ACT4_SWITCH_TimeLim[nZone][1] then
			ACT4_RebrithSwitch(nZone, 1)
			ACT4_SWITCH_TimeLim[nZone][1] = 999
			MU_Msg2Team("K? Th筩h c秏 鴑g, b? ph? ho筰"..ACT4_SWITCH_Name[1].." t? ng tr飊g sinh!")
		end
		if TC_TIMER_Count[nZone] >= ACT4_SWITCH_TimeLim[nZone][2] then
			ACT4_RebrithSwitch(nZone, 2)
			ACT4_SWITCH_TimeLim[nZone][2] = 999
			MU_Msg2Team("K? Th筩h c秏 鴑g, b? ph? ho筰"..ACT4_SWITCH_Name[2].." t? ng tr飊g sinh!")
		end
		if TC_TIMER_Count[nZone] >= ACT4_SWITCH_TimeLim[nZone][3] then
			ACT4_RebrithSwitch(nZone, 3)
			ACT4_SWITCH_TimeLim[nZone][3] = 999
			MU_Msg2Team("K? Th筩h c秏 鴑g, b? ph? ho筰"..ACT4_SWITCH_Name[3].." t? ng tr飊g sinh!")
		end
	end 
end
function ACT4_Killer()
	local nZone = TC_GetTeamZone()
	if TT_TARGET_ModID == "隐形人2" then
		local nType = ACT4_GetSwitchType(TT_TARGET_Name)
		ACT4_SWITCH_TimeLim[nZone][nType] = TC_TIMER_Count[nZone] + 6				-- 时间啊时间
		ACT4_SWITCH_Count[nZone][nType] = ACT4_SWITCH_Count[nZone][nType] - 1
		MU_Msg2Team("90秒后破坏1"..ACT4_SWITCH_Name[nType]..", b籲g kh玭g K? Th筩h c秏 鴑g b? ph? h醤g"..ACT4_SWITCH_Name[nType].." s? t? ng tr飊g sinh!")
		MC_Del4Group(TT_TARGET_Index, 2)
		for i=1,3 do
			for j=1,3 do
				if ACT4_SWITCH_Index[nZone][i][j] == TT_TARGET_Index then
					ACT4_SWITCH_Index[nZone][i][j] = 0
				end
			end
		end
		if (ACT4_SWITCH_Count[nZone][nType] == 0) then
			ACT4_SWITCH_DEBUFF[nZone][nType] = 1
			ACT4_SWITCH_TimeLim[nZone][nType] = 999
			if (ACT4_BOSS_Spwaned[nZone] == 0) then
				MU_Msg2Team("Ti誴 t鬰 th糿g ti課 l? c蕀 a c馻 b鎛 trang, c竎 anh h飊g h穣 quay l筰 甶!",2)
				MC_CreateBoss(4)
				ACT4_BOSS_Spwaned[nZone] = 1
				-- boss的掉落类型
				SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], nType + 1, 1)
			else
				MU_Msg2Team("nh 莔 m閠 ti課g,"..ACT4_SWITCH_Name[nType].." b? ph? h醤g ho祅 to祅, kh玭g th? tr飊g sinh n鱝,  ph竧 huy h誸 uy l鵦!")
			end
		end
	end
	if TT_TARGET_Name == "大庄主" then
		TC_STAGE_State[nZone] = 20
		MC_ClearGroup(nZone)
		GS_CreateMessenger()
		MU_Msg2Team("我们拭目以待，你逃不掉的。", 2)
		MU_Msg2Team("击败了藏剑山庄大庄主")
		--AddGlobalNews("江湖传言：一群江湖豪杰在队长<"..GetCaptainName()..">的带领下，已经击败了藏剑山庄大庄主，顺利闯过了藏剑第四关")
	end
end

-- ------------------------------------------------------------------------------------------------ <Act V> ----
ACT5_SWORD_PICKPOS = {					-- 取剑坐标
{1710, 3317}, {1673, 3343}, {1678, 3407}, {1718, 3420}, {1728, 3363}}
ACT5_SWORD_DROPPOS = {					-- 插剑坐标
{1632, 3193}, {1610, 3164}, {1583, 3170}, {1574, 3203}, {1600, 3225}}
ACT5_SWORD_PICKDEFENDER = {				-- 取剑时守卫坐标
{{1710, 3326}, {1716, 3325}, {1714, 3330}, {1711, 3332}, {1707, 3330}, {1704, 3324}},
{{1682, 3341}, {1681, 3330}, {1685, 3334}, {1686, 3340}, {1685, 3347}, {1682, 3350}},
{{1686, 3400}, {1684, 3390}, {1689, 3391}, {1691, 3398}, {1690, 3405}, {1687, 3408}},
{{1710, 3404}, {1716, 3399}, {1711, 3395}, {1706, 3396}, {1705, 3404}, {1705, 3411}},
{{1720, 3357}, {1721, 3345}, {1716, 3349}, {1715, 3358}, {1719, 3364}, {1723, 3365}}}
ACT5_SWORD_DROPDEFENDER = {				-- 插剑时守卫坐标
{{1630, 3188}, {1634, 3185}, {1630, 3179}, {1625, 3182}, {1625, 3190}, {1628, 3196}},
{{1609, 3165}, {1606, 3159}, {1605, 3166}, {1608, 3171}, {1612, 3171}, {1615, 3168}},
{{1585, 3172}, {1587, 3164}, {1588, 3171}, {1586, 3175}, {1582, 3175}, {1579, 3172}},
{{1575, 3199}, {1569, 3195}, {1573, 3192}, {1577, 3193}, {1579, 3201}, {1578, 3207}},
{{1599, 3216}, {1607, 3217}, {1603, 3211}, {1597, 3211}, {1596, 3219}, {1597, 3227}}}
ACT5_SWORD_SHAPE = {
{{1, 1}, {2, 2}, {3, 3}, {4, 4}, {5, 5}},	-- 金归金，木归木，水归水，火归火，土归土
{{1, 3}, {3, 2}, {2, 4}, {4, 5}, {5, 1}},	-- 金生水，水生木，木生火，火生土，土生金
{{1, 2}, {2, 5}, {5, 3}, {3, 4}, {4, 1}},	-- 金克木，木克土，土克水，水克火，火克金
{{1, 4}, {4, 3}, {3, 5}, {5, 2}, {2, 1}},	-- 金从火，火从水，水从土，土从木，木从金
{{1, 5}, {5, 4}, {4, 2}, {2, 3}, {3, 1}}}	-- 金破土，土破火，火破木，木破水，水破金
ACT5_SWORD_SHAPEWORD = {
"Kim quy Kim, M閏 quy M閏, Th駓 quy Th駓, H醓 quy H醓, Th? quy Th?, u l? <color=metal>Tng Th?<color>.",
"Kim sinh Th駓, Th駓 sinh M閏, M閏 sinh H醓, H醓 sinh Th?, Th? sinh Kim, u l? <color=metal>Tng Sinh<color>.",
"Kim kh綾 M閏, M閏 kh綾 Th?, Th? kh綾 Th駓, Th駓 kh綾 H醓, H醓 kh綾 Kim, u l? <color=metal>Tng T?<color>.",
"Kim t飊g H醓, H醓 t飊g Th駓, Th駓 t飊g Th?, Th? t飊g M閏, M閏 t飊g Kim, u l? <color=metal>Tng Tr?<color>.",
"Kim ph? Th?, Th? ph? H醓, H醓 ph? M閏, M閏 ph? Th駓, Th駓 ph? Kim, u l? <color=metal>Tng Ph?<color>."}
ACT5_PICKORDER_Table = {}
ACT5_DROP_ROW = {0,0,0,0,0}		-- 记录插剑时确定的相
ACT5_CHACUOLE = {}				-- 记录插错剑的次数
-- ------------------------------------------------------------------------------------------------ <Act V Function> ----
function ACT5_Talk()
	local nZone = TC_GetTeamZone()
	local nMaxLevel = TM_GetMaxLevel()
	nMaxLevel = MU_Div(nMaxLevel)
	local nStatesLimit = 0
	local tStatesLimit =
	{
		[5] = 150,
		[6] = 200,
		[7] = 250,
	}
	if nMaxLevel < 5 then
		nStatesLimit = tStatesLimit[5]
	elseif nMaxLevel > 7 then
		nStatesLimit = tStatesLimit[7]
	else
		nStatesLimit = tStatesLimit[nMaxLevel]
	end
	
	if TT_TARGET_ModID ~= "" then
--		Msg2Player(type(TT_TARGET_ModID))
--		return
	end
	local nSwordType = ACT5_GetSwordFlag(TT_GetTarget())
	if TC_STAGE_State[nZone] < 15 then
		if (TT_TARGET_Name == "Kim ki誱") and (GetStrength() >= nStatesLimit) then
		elseif (TT_TARGET_Name == "M閏 ki誱") and (GetDexterity() >= nStatesLimit) then
		elseif (TT_TARGET_Name == "Th駓 ki誱") and (GetEnergy() >= nStatesLimit) then
		elseif (TT_TARGET_Name == "H醓 Ki誱") and (GetObserve() >= nStatesLimit) then
		elseif (TT_TARGET_Name == "Th? ki誱") and (GetVitality() >= nStatesLimit) then
		else
			Msg2Player("你没有能力拔出这把剑")
			return
		end
		TC_TASK_EventCount[nZone][1] = TC_TASK_EventCount[nZone][1] + 1
		if TC_TASK_EventCount[nZone][1] == 1 then
			ACT5_PICKORDER_Table[nZone] = {}
		end
		ACT5_PICKORDER_Table[nZone][TC_TASK_EventCount[nZone][1]] = TT_TARGET_Name
		MU_Msg2Team(TT_TARGET_Name.."已经拔出来了", 2)
		MC_Del4Group(TT_GetTarget(), 0)
--		Msg2Player(nSwordType.." "..TT_TARGET_Name)
		ACT5_CreateDefender(nSwordType, TT_TARGET_Name)
	else
		if ACT5_CHACUOLE[nZone][nSwordType] == nil then
			ACT5_CHACUOLE[nZone][nSwordType] = 0
		end
		
		Msg2Player(GetName().."点击剑台")
		local nWithOrder = ACT5_Word2Num(ACT5_PICKORDER_Table[nZone][TC_TASK_EventCount[nZone][2]])
		local IndexForLoop = 1
		local IndexForLoopEnd = 5
		if ACT5_DROP_ROW[nZone] ~= 0 then
			IndexForLoop = ACT5_DROP_ROW[nZone]
			IndexForLoopEnd = ACT5_DROP_ROW[nZone]
		end
		for i=IndexForLoop, IndexForLoopEnd do
			for j=1, 5 do
				if (ACT5_SWORD_SHAPE[i][j][1] == nWithOrder) and (ACT5_SWORD_SHAPE[i][j][2] == nSwordType) then
					if (ACT5_DROP_ROW[nZone] == 0) or (ACT5_DROP_ROW[nZone] == i) then
						ACT5_DROP_ROW[nZone] = i
						TC_TASK_EventCount[nZone][2] = TC_TASK_EventCount[nZone][2] + 1
						MC_Del4Group(TT_GetTarget(), 0)
						MU_Msg2Team(GetName().."m "..ACT5_Word2Num(nWithOrder).." v祇 "..ACT5_Word2Num(nSwordType)..". ["..(TC_TASK_EventCount[nZone][2]-1).."/"..(TC_TASK_Conditions[nZone][2]-1).."]")
						if TC_TASK_EventCount[nZone][2] >= TC_TASK_Conditions[nZone][2] then
							MC_CreateBoss(5)
							MU_Msg2Team("Trng l穙 T祅g Ki誱 C竎:"..ACT5_SWORD_SHAPEWORD[ACT5_DROP_ROW[nZone]].."Х l﹗ ko c? ai d竚 qua y. Ti觰 t?! Ngi l筰 n ?? в ta xem b秐 l躰h c馻 ngi th? n祇.", 2)
							MU_Msg2Team("Trng l穙 T祅g Ki誱 C竎 hi謓 th﹏!")
							-- Stage Event Start
							local nETRow = MU_Div(TM_GetMinLevel()) - 2
							TB_AddScore(1, (TB_BONUS_TABLE[nETRow][1]/nJiFenDivRate))
							TB_AddScore(3, random(3, 6))
							local nFlag = SetBit(GetTask(SB_EVENT_STAGE[5]), ACT5_DROP_ROW[nZone], 1)
							SetTask(SB_EVENT_STAGE[5], nFlag)
							SB_STAGE_RECORD[nZone] = SetBit(SB_STAGE_RECORD[nZone], ACT5_DROP_ROW[nZone], 1)
							TaskTip("触发特殊事件:击剑. Ng? h祅h chi tng")
							-- Stage Event End
						end
						return
					end
				end
			end
		end
		MU_Msg2Team("放下你的剑，你会发现一股强大的力量从你的身体里涌出来。")
		ACT5_CHACUOLE[nZone][nSwordType] = ACT5_CHACUOLE[nZone][nSwordType] + 1
		
		-- 每次插错剑只刷一次守卫
		if ACT5_CHACUOLE[nZone][nSwordType] <= 1 then
			ACT5_CreateDefender(nSwordType, 1)
		end
	end
end
function ACT5_Timer()
	local nZone = TC_GetTeamZone()
	local nMaxLevel = TM_GetMaxLevel()	
end
function ACT5_Killer()
	local nZone = TC_GetTeamZone()
	if (TT_TARGET_Name == "B秓 v? ng? h祅h") and (TC_STAGE_State[nZone] < 15) then
		TC_STAGE_State[nZone] = TC_STAGE_State[nZone] + 1
--		MU_Msg2Team((TC_STAGE_State[nZone]-10).."/5")
		if TC_STAGE_State[nZone] == 15 then
			ACT5_CreateDesk()
			MU_Msg2Team("T祅g Ki誱 C竎 Чi Vi謓 v鋘g n ti課g ch箉 n苙g n? c馻 gu錸g quay.", 2)
		end
	end
	if (TT_TARGET_Name == "Trng l穙 T祅g Ki誱 C竎") then
		TC_STAGE_State[nZone] = 20
		MC_ClearGroup(nZone)
		GS_CreateMessenger()
		MU_Msg2Team("江湖有很多好人，我不应该在这里睡觉。我真的老了吗?", 2)
		MU_Msg2Team("打败了XXX？")
		--AddGlobalNews("Giang h? n i: Цm giang h? h祇 ki謙 di trng c馻 i trng <"..GetCaptainName().."> d蒼 d総  nh b筰 Trng l穙 T祅g Ki誱 C竎, thu薾 l頸 vt qua 秈 th? 5 trong T祅g Ki誱")	
	end
end

-- ------------------------------------------------------------------------------------------------ <Act VI> ----
-- ------------------------------------------------------------------------------------------------ <Act VII> ----
-- ------------------------------------------------------------------------------------------------ <Act VIII> ----
ACT8_PATH_Pointer = {}
ACT8_PATH_PortIn = {
{8,1387,3093},{8,1432,3161},{8,1441,3046},
{8,1536,3157},{8,1593,3081},{8,1534,3052},
{8,1597,2839},{8,1551,2752},{8,1546,2863},
{8,1429,2752},{8,1381,2834},{8,1437,2866},
{8,1489,3108},{8,1572,2946},{8,1484,2786},{8,1405,2956}}
ACT8_PATH_PortOut = {
{8,1383,3098},{8,1427,3163},{8,1437,3053},
{8,1542,3161},{8,1598,3086},{8,1539,3058},
{8,1594,2845},{8,1547,2758},{8,1541,2866},
{8,1434,2753},{8,1382,2842},{8,1438,2871},
{8,1489,3116},{8,1566,2949},{8,1483,2794},{8,1409,2961}}
ACT8_CHEST_S_Pos = {
{1378,3098}, {1434,3046}, {1423,3165}, {1495,3117}, {1546,3161}, {1541,3050}, {1589,3090}, {1564,2941},
{1590,2837}, {1539,2859}, {1545,2750}, {1491,2790}, {1438,2750}, {1444,2865}, {1389,2830}, {1409,2947}}
ACT8_CHEST_L_Pos = {
{1378,2989}, {1489,3168}, {1510,3154}, {1594,2984}, {1589,2936}, {1497,2755}, {1473,2756}, {1383,2947}, {1497,3030},
{1590,2837}, {1513,3103}, {1522,3021}, {1505,2963}, {1520,2921}, {1510,2889}, {1472,2887}, {1459,2927}, {1444,3000}}
ACT8_CHEST_StoreIndex = {}
-- ------------------------------------------------------------------------------------------------ <Act VIII Function> ----
function ACT8_Trap()
	local nZone = TC_GetTeamZone()
	if (TC_STAGE_State[nZone] >= 10) then
		local nTrapIndex = ACT8_GetTPTIndex()
		local nTrapTarget = ACT8_PATH_Pointer[nZone][nTrapIndex]
--		local nMapID = 898 + nZone * 10
--		if (nTrapTarget >= 1) and (nTrapTarget <= 16) then
--			nMapID = ACT8_PATH_PortOut[nTrapTarget][1] - 10 + nZone * 10
--		end
		local nMapID = SF_MAPBASE + (nZone * 10) + 8
		if nTrapTarget == 0 then
		elseif nTrapTarget == 17 then
		elseif (nTrapTarget == 13) or (nTrapTarget == 15) then
			if random(1, 10000) <= 5000 then
				NewWorld(nMapID, ACT8_PATH_PortOut[nTrapTarget][2], ACT8_PATH_PortOut[nTrapTarget][3])
			else
				NewWorld(nMapID, ACT8_PATH_PortOut[nTrapTarget+1][2], ACT8_PATH_PortOut[nTrapTarget+1][3])
			end
		else
			NewWorld(nMapID, ACT8_PATH_PortOut[nTrapTarget][2], ACT8_PATH_PortOut[nTrapTarget][3])
		end
	end
end
function ACT8_Timer()
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
	local nMaxLevel = TM_GetMaxLevel()
	if (TC_STAGE_State[nZone] >= 10) and (TC_STAGE_State[nZone] < 30) then
		MC_BeSpawnNPCs(nStage, nMaxLevel)
	end
	if mod(TC_TIMER_Count[nZone], 20) == 0 then
		ACT8_DelSmallChest()
		ACT8_CreateSmallChest()
	end
end
function ACT8_Killer()
	local nZone = TC_GetTeamZone()
	if TT_TARGET_Name == "金色宝箱" then
		Earn(100000)
	end
	if TT_TARGET_Name == "银色宝箱" then
		ModifyExp(100000)
	end
end
-- ------------------------------------------------------------------------------------------------ <Act IX> ----
SWORD_LOC = {{1505, 3154}, {1473, 3335}, {1612, 3374}, {1677, 3218}, {1589, 3116}}
SWORD_NAME = {"Kim Ki誱 phong kh綾", "M閏 Ki誱 phong kh綾", "Th駓 Ki誱 phong kh綾", "H醓 Ki誱 phong kh綾", "Th? Ki誱 phong kh綾"}
SWORD_MINNAME = {"Kim ki誱", "M閏 ki誱", "Th駓 ki誱", "H醓 Ki誱", "Th? ki誱"}
SWORD_SEALTIME = {}
SWORD_SEALINDEX = {}
SWORD_BOSSSPWANED = {0,0,0,0,0}
SWORD_SleepOne = {}
-- ------------------------------------------------------------------------------------------------ <Act IX Function> ----
function ACT9_Talk()
	if TT_TARGET_ModID == "B祅 Long Tr?" then
		Talk(1,"","C鰑 Tuy謙 hi謓 th?, ki誱 kh? tung ho祅h, tr猲 tr阨 di t, duy ng? c t玭!")
	end
end
function ACT9_Timer()
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
	local nMaxLevel = TM_GetMaxLevel()
	if 	TC_STAGE_State[nZone] < 10 then
		return
	end
	for i=1, 5 do
		if (SWORD_SEALINDEX[nZone][i] > 0) then
			if TC_TIMER_Count[nZone] < SWORD_SEALTIME[nZone][i] then		-- 没到时间
				Msg2Player(SWORD_MINNAME[i].."封锁了，还没到时间。["..TC_TIMER_Count[nZone].."/"..SWORD_SEALTIME[nZone][i].."]["..SWORD_SEALINDEX[nZone][i].."]")
				MC_BeSpawnNPCs(nStage, nMaxLevel, SWORD_MINNAME[i])
			else															-- 到时间了
				MC_Del4Group(SWORD_SEALINDEX[nZone][i], 0)
				Msg2Player(SWORD_MINNAME[i].."解锁完成 ["..SWORD_SEALINDEX[nZone][i].."]")
				SWORD_SEALTIME[nZone][i] = 0
				SWORD_SEALINDEX[nZone][i] = -1	
			end
		end
	end
	local nSealCount = 0
	for i=1,5 do
		if SWORD_SEALINDEX[nZone][1] == -1 then
			nSealCount = nSealCount + 1
		end
	end
	if (SWORD_SEALINDEX[nZone][1] < 0) and (SWORD_SEALINDEX[nZone][2] < 0) and (SWORD_SEALINDEX[nZone][3] < 0) and (SWORD_SEALINDEX[nZone][4] < 0) and (SWORD_SEALINDEX[nZone][5] < 0) and (SWORD_BOSSSPWANED[nZone] == 0) then
		local nBossIndex = MC_CreateBoss(9)
		MC_Del4Group(SWORD_SleepOne[nZone],0)
		SWORD_BOSSSPWANED[nZone] = 1
	end
	
	-- 增加一个保底的时间，10分钟一定刷9绝
	if SWORD_BOSSSPWANED[nZone] == 0 and TC_TIMER_Count[nZone] == 42 then	-- 42 tick
		local nBossIndex = MC_CreateBoss(9)
		MC_Del4Group(SWORD_SleepOne[nZone],0)
		SWORD_BOSSSPWANED[nZone] = 1
	end
	
end
function ACT9_Killer()
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
	local nMapID = GetWorldPos()
	local nLevel = MU_Div(TM_GetMaxLevel())*10
	local nMaxLevel = TM_GetMaxLevel()
	local nSwordFlag = 0
	for i=1,5 do
		if TT_TARGET_Name == SWORD_NAME[i] then
			nSwordFlag = i
			break;
		end
	end
	for i=1,5 do
		if TT_TARGET_Name == SWORD_NAME[i].."(解锁)" then
			MC_Del4Group(TT_TARGET_Index, 2)
			Msg2Player("阻止"..SWORD_MINNAME[i].."解锁成功["..SWORD_SEALINDEX[nZone][i].."]")
			SWORD_SEALTIME[nZone][i] = 0
			SWORD_SEALINDEX[nZone][i] = -2	
			break;
		end
	end
	local nSealCount = 0
	for i=1,5 do
		if SWORD_SEALINDEX[nZone][1] == -1 then
			nSealCount = nSealCount + 1
		end
	end
	if (SWORD_SEALINDEX[nZone][1] < 0) and (SWORD_SEALINDEX[nZone][2] < 0) and (SWORD_SEALINDEX[nZone][3] < 0) and (SWORD_SEALINDEX[nZone][4] < 0) and (SWORD_SEALINDEX[nZone][5] < 0) and (SWORD_BOSSSPWANED[nZone] == 0) then
		local nBossIndex = MC_CreateBoss(9)
		MC_Del4Group(SWORD_SleepOne[nZone],0)
		SWORD_BOSSSPWANED[nZone] = 1
	end
	if nSwordFlag ~= 0 then
		local nBossIndex = CreateNpc("Ki誱 i"..nLevel, SWORD_NAME[nSwordFlag].."(解锁)", nMapID, SWORD_LOC[nSwordFlag][1], SWORD_LOC[nSwordFlag][2])
		MC_Add2Group(nBossIndex)
		MC_BeSpawnNPCs(nStage, nMaxLevel, SWORD_MINNAME[nSwordFlag], nil, 1)			-- 刷守卫
		SWORD_SEALTIME[nZone][nSwordFlag] = TC_TIMER_Count[nZone] + 40		-- 记录开始解除封印的剑台的解除时间
		if SWORD_SEALTIME[nZone][nSwordFlag] >= 127 then
			SWORD_SEALTIME[nZone][nSwordFlag] = 127
		end
		SWORD_SEALINDEX[nZone][nSwordFlag] = nBossIndex						-- 记录开始解除封印的剑台的INDEX
	end
-- ===============体服规则：通关奖励 edit by yanjun============================

	if TT_TARGET_Name ~= "九绝剑魔" then
		return
	end;

	local nPreservedPlayerIndex = PlayerIndex;	--保留PlayerIndex
	local nMemCount = GetTeamSize();	--获得队伍人数
	TC_STAGE_State[nZone] = 20
	MC_ClearGroup(nZone)
	GS_CreateMessenger()	--召唤藏剑使者
	MU_Msg2Team("怎么…怎么…怎么了？")
	MU_Msg2Team("队伍通关成功")
	--AddGlobalNews("Tin n kinh ng: Цm giang h? h祇 ki謙 di trng c馻 i trng <"..GetCaptainName().."> d蒼 d総,  nh b筰 C鰑 Tuy謙 Ki誱 Ma, thu薾 l頸 vt 秈 th? 7 c馻 T祅g Ki誱! Qu? l? chuy謓 x璦 nay hi誱 c?!")
	WriteLog("[藏剑使者] vt 秈! чi trng : "..GetCaptainName()..",  th阨 gian  : "..date("%H").." : "..date("%M"))
	for i=1,nMemCount do
		PlayerIndex = GetTeamMember(i);	
		if GetTask(GS_RECORD_CHANCE) > 1 then
			ModifyExp(2000000)
			Msg2Player("获得20000000经验")
			Earn(100000)
			Msg2Player("获得10个金币")
		end
		 if GetTask(GS_RECORD_CHANCE) == 7 then
--		 	local rand = random(1,10000)
--		 	if rand <= 2626 then
--		 		Earn(70000)
--		 		Msg2Player("B筺 nh薾 頲 7 v祅g")
--		 	elseif  rand <= 3737 then
--		 		gf_AddItemEx2({2,0,31,1}, "英雄帖", "Tang Kiem Son Trang", "nh薾",7*24*60*60)
--		 	elseif  rand <= 5192 then
--		 		gf_AddItemEx2({2,1,30321,4}, "Thi猲 Ngo筰 L璾 Tinh", "Tang Kiem Son Trang", "nh薾")
--		 	elseif  rand <= 2910 then
--		 		gf_AddItemEx2({2,1,30320,2}, "Ng? H祅h B秓 Rng", "Tang Kiem Son Trang", "nh薾")
--		 	elseif  rand <= 2916 then
--		 		gf_AddItemEx2({2,95,204,1}, "天罡令", "Tang Kiem Son Trang", "nh薾")
--		 	elseif  rand <= 6249 then
--		 		gf_AddItemEx2({2,1,30306,1}, "Linh Th筩h Bao C蕄 6", "Tang Kiem Son Trang", "nh薾")
--		 	else
--		 		gf_AddItemEx2({2,1,30305,1}, "Linh Th筩h Bao C蕄 7", "Tang Kiem Son Trang", "nh薾")
--		 	end
			VET_TANGKIEM2012 = {
				{3, 2626, 70000, 0},
				{1, 1111, "T祅g Ki誱 Anh H飊g Thi誴", {2,0,31,1}, 7*24*60*60},
				{1, 1455, "Thi猲 Ngo筰 L璾 Tinh", {2,1,30321,4}, 0},
				{1, 1455, "Ng? H祅h B秓 Rng", {2,1,30320,2}, 0},
				{1, 6, "Thi猲 Cang L謓h", {2,95,204,1}, 0},
				{1, 3333, "Linh Th筩h Bao C蕄 6", {2,1,30306,1}, 0},
				{1, 14, "Linh Th筩h Bao C蕄 7", {2,1,30305,1}, 0},
			}
			
			gf_EventGiveRandAward(VET_TANGKIEM2012,10000,1)
		end
		--Earn(500000)	--奖励500G
		--Msg2Player("通关奖励：获得50金。")
--		local nHorse_type = random(3,7)
--		AddItem(0,105,nHorse_type,1,1)	--奖励一匹70级的马(随机类型)
--		Msg2Player("通关奖励：获得一匹马。")
--		nRoute = GetPlayerRoute()	
--		local nType = nRoute*100+floor(GetLevel()/10)*10+GetBody()
--		AddItem(0,103,nType,1,1, -1, -1, -1, -1, -1, -1)	--奖励套装：帽子
--		AddItem(0,100,nType,1,1, -1, -1, -1, -1, -1, -1)	--奖励套装：内衣
--		AddItem(0,101,nType,1,1, -1, -1, -1, -1, -1, -1)	--奖励套装：内裤
--		AddItem(0,102,nType,1,1, -1, -1, -1, -1, -1, -1)	--奖励套装：饰物
--		--奖励套装:武器
--		if nRoute == 2 then	
--			AddItem(0,3,nType,1,1, -1, -1, -1, -1, -1, -1) --少林俗家奖励两件武器
--			AddItem(0,5,nType,1,1, -1, -1, -1, -1, -1, -1)
--		elseif nRoute == 3 then
--			AddItem(0,8,nType,1,1, -1, -1, -1, -1, -1, -1)
--		elseif nRoute == 4 then
--			AddItem(0,0,nType,1,1, -1, -1, -1, -1, -1, -1)
--		elseif nRoute == 6 then
--			AddItem(0,1,nType,1,1, -1, -1, -1, -1, -1, -1)
--		elseif nRoute == 8 then
--			AddItem(0,2,nType,1,1, -1, -1, -1, -1, -1, -1)
--		elseif nRoute == 9 then
--			AddItem(0,10,nType,1,1, -1, -1, -1, -1, -1, -1)
--		elseif nRoute == 11 then
--			AddItem(0,0,nType,1,1, -1, -1, -1, -1, -1, -1)
--		elseif nRoute == 12 then
--			AddItem(0,5,nType,1,1, -1, -1, -1, -1, -1, -1)
--		elseif nRoute == 14 then
--			AddItem(0,2,nType,1,1, -1, -1, -1, -1, -1, -1)
--		elseif nRoute == 15 then
--			AddItem(0,9,nType,1,1, -1, -1, -1, -1, -1, -1)
--		end
--		Msg2Player("通关奖励：获得一件套装。")
	end
	PlayerIndex = nPreservedPlayerIndex;
-- =============================================================================
end

-- ================================================================================================ <MAIN> ====
-- ------------------------------------------------------------------------------------------------ <Function> ----
function main()
--	CureWound(2)
	local nZone = TC_GetTeamZone()
	local a,b,c = GetWorldPos()
	TT_TARGET_Index, TT_TARGET_ModID, TT_TARGET_Name = GetTriggeringUnit()
	
	TT_SetTarget(TT_TARGET_Index)
	if a == SF_TOWNID then
		if nZone > 0 then
			WriteLog("[藏剑使者] "..GetName().." in town but nZone not correct.. nZone:"..nZone.." at:"..a)
		end
	else
		if nZone < 1 or nZone == nil then
			WriteLog("[藏剑使者] "..GetName().." not in town but nZone not correct.. nZone:"..nZone.." at:"..a)
		end
	end
	if a == SF_TOWNID and (TT_TARGET_ModID == "Vng An Th筩h") and (TT_TARGET_Name == "藏剑使者") then
		GS_EnterTaskTalk()
	else
--		Msg2Player(TT_TARGET_Name.." "..GetName())
--		if (TT_TARGET_ModID ~= "藏剑使者") and (TT_TARGET_Name == GetName()) then
		if TM_IsPlayer() == 1 then
			On_Trap()
		elseif (TT_TARGET_ModID == "Vng An Th筩h") and (TT_TARGET_Name == "S? gi? T祅g Ki誱") then	-- 只有在和藏剑使者说话的时候才有效果
			GS_TalkWithMessenger()
		elseif (TT_TARGET_ModID == "宝箱") and (TT_TARGET_Name == "精致的箱子") then
			On_Dropis()
		elseif TT_TARGET_ModID == "宝箱" and TT_TARGET_Name == "箱子" then
			On_Good_Dropis()
		else	-- 其他情况（目前为对话）
			On_Talk()
		end
	end
-----------------------------------------------------------------------------------
end

-- ================================================================================================ <TRIGGER> ====
-- ------------------------------------------------------------------------------------------------ <Timer Function> ----
function Period_Timer()
	local nZone = TC_GetTeamZone()
	TT_Stepper()			-- 记步器
	if TC_CheckTimer() == 1 then
		return
	end
	if mod(TC_TIMER_Count[nZone],4) == 0 then
		MU_Msg2Team("时光流逝....["..TC_TIMER_Count[nZone].."]")
	end
	if TC_STAGE_Index[nZone] == 1 then					-- ACT I
		ACT1_Timer()
	elseif TC_STAGE_Index[nZone] == 2 then				-- ACT II
		ACT2_Timer()
	elseif TC_STAGE_Index[nZone] == 3 then				-- ACT III
		ACT3_Timer()
	elseif TC_STAGE_Index[nZone] == 4 then				-- ACT IV
		ACT4_Timer()
	elseif TC_STAGE_Index[nZone] == 5 then				-- ACT V
		ACT5_Timer()
	elseif TC_STAGE_Index[nZone] == 6 then				-- ACT VI
	elseif TC_STAGE_Index[nZone] == 7 then				-- ACT VII
	elseif TC_STAGE_Index[nZone] == 8 then				-- ACT VIII
		ACT8_Timer()
	elseif TC_STAGE_Index[nZone] == 9 then				-- ACT IX
		ACT9_Timer()
	end	
end

-- ------------------------------------------------------------------------------------------------ <Killer Function> ----
function Killing_Unit()
	local nZone = TC_GetTeamZone()
	TT_TARGET_Index, TT_TARGET_ModID, TT_TARGET_Name = GetTriggeringUnit()
--	Msg2Player(TT_TARGET_Name.." 的当前等级为： "..GetUnitBaseStates(TT_TARGET_Index, 0))
	local nTargetLife = GetUnitBaseStates(TT_TARGET_Index, 1)
	if (GetItemCount(2,0,334) >= 1) and (random(1,100000) <= 10000) then
		local nDrainedLife = (nTargetLife*GetLevel()/100)*0.02
		ModifyLife(GetLife()+nDrainedLife)
		nDrainedLife = SB_Div(nDrainedLife, 1)
		if nDrainedLife > 0 then
			Msg2Player("[Huy誸 Ph竎h]c馻 b筺 ph竧 ra 竛h s竛g h錸g m? 秓,  kh玦 ph鬰 cho b筺"..nDrainedLife.." 甶觤 sinh l鵦.")
		end
	end
	if (GetItemCount(2,0,335) >= 1) and (random(1,100000) <= 10000) then
		local nDrainedNeili = (nTargetLife*GetLevel()/100)*0.02
		ModifyNeili(GetNeili()+nDrainedNeili)
		nDrainedNeili = SB_Div(nDrainedNeili, 1)
		if nDrainedNeili > 0 then
			Msg2Player("[Th駓 Tinh]c馻 b筺 ph竧 ra 竛h s竛g xanh,  kh玦 ph鬰 cho b筺"..nDrainedNeili.." 甶觤 n閕 l鵦.")
		end
	end
	TC_RefKilledNpc()				-- 杀人数量记录
	if TT_TARGET_Name == "随机宝箱" then
		TB_OpenCommonChest()
	else
		TT_SetTarget(TT_TARGET_Index)
		MC_Del4Group(TT_TARGET_Index, 5)
--		Msg2Player("杀人拉! Stage "..TC_STAGE_Index[nZone].." Zone "..nZone)
		
		if TC_STAGE_Index[nZone] == 1 then					-- ACT I
			ACT1_Killer()
		elseif TC_STAGE_Index[nZone] == 2 then				-- ACT II
			ACT2_Killer()
		elseif TC_STAGE_Index[nZone] == 3 then				-- ACT III
			ACT3_Killer()
		elseif TC_STAGE_Index[nZone] == 4 then				-- ACT IV
			ACT4_Killer()
		elseif TC_STAGE_Index[nZone] == 5 then				-- ACT V
			ACT5_Killer()
		elseif TC_STAGE_Index[nZone] == 6 then				-- ACT VI
		elseif TC_STAGE_Index[nZone] == 7 then				-- ACT VII
		elseif TC_STAGE_Index[nZone] == 8 then				-- ACT VIII
			ACT8_Killer()
		elseif TC_STAGE_Index[nZone] == 9 then				-- ACT IX
			ACT9_Killer()
		end	
		GT_Drop(TT_TARGET_Name, 2)
		GT_BossGiveNew(TT_TARGET_Name)		--物品的掉落添加在这里
		GT_NewBossDrop(TT_TARGET_Name)
		
		-- 越南2008 51活动
--		viet_2008_51_cangjian_award(TT_TARGET_Index);
		
		-- 越南2008 水果宴会活动
--		if is_fruit_event_viet_open() == 1 then
--		
--			local tDropFruitBag =
--			{
--				["藏剑阁长老"] = 20,
--				["九绝剑魔"] = 20,
--			}
--			
--			local nItemNum = tDropFruitBag[TT_TARGET_Name]
--			local szLogTitle = "水果宴会 : ".."藏剑山庄";		--此处分为2段只是为了不增加新的翻译
--			local nRetCode = 0
--			
--			if nItemNum == nil then
--				nItemNum = 1
--				local nRandom = random(1,100)
--				if nRandom <= 4 then
--					nRetCode = AddItem(2,1,30008,nItemNum)
--					if nRetCode == 1 then
--						Msg2Player("你获得了 "..nItemNum.." 个水果包");
--						WriteLog("["..szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." 个水果包");
--					else
--						WriteLog("["..szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." 个水果包".." Failed, return value = "..nRetCode);
--					end
--				end
--			else
--				local nOldPlayer = PlayerIndex
--	
--				for i=1, GetTeamSize() do
--					PlayerIndex = GetTeamMember(i)
--					if PlayerIndex > 0 then
--						if GetLevel() >= 55 then
--							nRetCode = AddItem(2,1,30008,nItemNum)
--							if nRetCode == 1 then
--								Msg2Player("你获得了 "..nItemNum.." 个水果包");
--								if TT_TARGET_Name == MC_BOSS_POS[5][2] then
--									WriteLog("["..szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Stage 5th Obtain "..nItemNum.." 个水果包");
--								elseif TT_TARGET_Name == MC_BOSS_POS[9][2] then
--									WriteLog("["..szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Stage 7th Obtain "..nItemNum.." 个水果包");
--								end		
--							else
--								WriteLog("["..szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." 个水果包".." Failed, return value = "..nRetCode);
--							end
--						end
--					end
--				end
--				PlayerIndex = nOldPlayer
--			end
--		end
		
		-- 越南2008 中秋活动
--		if is_mooncake_viet_open() == 1 then
--			local tDropFruitBag = {}
--			
--			if GetTask(GS_RECORD_CHANCE) == 1 then
--				tDropFruitBag =
--				{
--					["大庄主"] = 20,
--					["九绝剑魔"] = 40,
--				}
--			elseif GetTask(GS_RECORD_CHANCE) > 1 then
--				tDropFruitBag =
--				{
--					["大庄主"] = 100,
--					["九绝剑魔"] = 200,
--				}
--			end
--			
--			local nItemNum = tDropFruitBag[TT_TARGET_Name]
--			local szLogTitle = "中秋活动 : ".."藏剑山庄";		--此处分为2段只是为了不增加新的翻译
--			local nRetCode = 0
--			
--			if nItemNum == nil then
--				nItemNum = 1
--				local nRandom = random(1,100)
--				if nRandom <= 3 then
--					nRetCode = AddItem(2,1,30016,nItemNum)
--					if nRetCode == 1 then
--						Msg2Player("你获得了 "..nItemNum.." 个 ".."原料包");
--						WriteLog("["..szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." 个 ".."原料包");
--					else
--						WriteLog("["..szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." 个 ".."原料包".." Failed, return value = "..nRetCode);
--					end
--				end
--			else
--				local nOldPlayer = PlayerIndex
--	
--				for i=1, GetTeamSize() do
--					PlayerIndex = GetTeamMember(i)
--					if PlayerIndex > 0 then
--						if GetLevel() >= 54 then
--							nRetCode = AddItem(2,1,30016,nItemNum)
--							if nRetCode == 1 then
--								Msg2Player("你获得了 "..nItemNum.." 个 ".."原料包");
--								if TT_TARGET_Name == MC_BOSS_POS[4][2] then
--									WriteLog("["..szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Stage 4th Obtain "..nItemNum.." 个 ".."原料包");
--								elseif TT_TARGET_Name == MC_BOSS_POS[9][2] then
--									WriteLog("["..szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Stage 7th Obtain "..nItemNum.." 个 ".."原料包");
--								end		
--							else
--								WriteLog("["..szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." 个 ".."原料包".." Failed, return value = "..nRetCode);
--							end
--						end
--					end
--				end
--				PlayerIndex = nOldPlayer
--			end
--		end
                --09年12月活动-----------------------------------------------------------------------------------------------
		if tonumber(date("%y%m%d")) >= 091218 and tonumber(date("%y%m%d")) <= 100117 then			
			if TT_TARGET_Name == "九绝剑魔" then
				local nOldPlayer = PlayerIndex;
				for i = 1, GetTeamSize() do
					PlayerIndex = GetTeamMember(i);						
					if PlayerIndex > 0 then
						if GetTask(GS_RECORD_CHANCE) > 1 then
							local szFullTitle = VIET_0912_STR_EVENT_LOG_TITLE
                                    			gf_AddItemEx2({2, 1, 30138, 80}, "圣诞糖果", szFullTitle, 0, 1, 10, 1,"T祅g Ki誱 秈 7");
                                   		end
					end
				end
				PlayerIndex = nOldPlayer;
			end			
		end
		
		--杀死九绝剑魔，也就是过了第7关给奖励---------------2009年9月中秋活动----------------------------------------
		if tonumber(date("%y%m%d")) >= 090918 and tonumber(date("%y%m%d")) < 091026 then
			if TT_TARGET_Name == "九绝剑魔" then
				local nOldPlayer = PlayerIndex				
				for i = 1, GetTeamSize() do
					PlayerIndex = GetTeamMember(i);
					if PlayerIndex > 0 then
						if GetTask(GS_RECORD_CHANCE) > 1 then
							nRetCode = AddItem(2, 1, 30106, 100);
							if nRetCode == 1 then
								Msg2Player("获得 " .. "100" .. "面粉");
								WriteLogEx("中秋节","Vt 秈 7",100,"B閠 M?")
							else
								WriteLog("[Hoat dong trung thu]: [Account: "..GetAccount().."][Role Name:"..GetName().."] " .. "Nh薾 頲" .. "100" .. "c竔" .. "B閠 M?" .. "Th蕋 b筰" .. "," .. "return value = "..nRetCode);
							end
						end
					end
				end
				PlayerIndex = nOldPlayer
			end
		end
	end
	local nChecka, nCheckb = SB_Div(TC_KILL_Stage[nZone], 50)
--	Msg2Player("钥匙掉落："..nChecka.."/"..nCheckb.." ["..TC_KILL_KeyGot[nZone].."/".."1]")
	if (nCheckb == 0) and (TC_KILL_KeyGot[nZone] >= 1) then
		TC_KILL_KeyGot[nZone] = TC_KILL_KeyGot[nZone] - 1
		AddItem(2,0,336,1)
		-- Stage Event Start
		local nFlag = SetBit(GetTask(SB_EVENT_STAGE[10]), 3, 1)
		SetTask(SB_EVENT_STAGE[10], nFlag)
--		TB_AddScore(3, random(0, 2))
		TaskTip("触发特殊事件:一般.铁钥匙")
		-- Stage Event End
	end
end

-- ------------------------------------------------------------------------------------------------ <Rect Function> ----
function Leave_Map()
	local nZone = TC_GetTeamZone()
	local nStage = TC_STAGE_Index[nZone]
--	Msg2Player(TC_STAGE_State[nZone].." "..nStage.." "..GetWorldPos())
	if (TC_STAGE_State[nZone] < 30) and (nStage >= 1) and (nStage <= 9) then
--		Msg2Player("回去吃饭咯……")
		TM_LeaveMap(nZone, PlayerIndex)
	end
end

-- ------------------------------------------------------------------------------------------------ <DropChest Function> ----
function On_Dropis()
	local nZone = TC_GetTeamZone()
	local nChestIndex = TT_GetTarget()
	local nChestState = GetUnitCurStates(nChestIndex, 8)
	local nIsLocked = GetBit(nChestState, 1)
	local nIsUsed = GetBit(nChestState, 2)
	local a = GetUnitCurStates(nChestIndex, 5)
	local b = GetUnitCurStates(nChestIndex, 6)
	local c = GetUnitCurStates(nChestIndex, 1)
	
	if nIsUsed == 1 then
		Msg2Player("这箱子现在有人在使用")
		return
	end
	if nIsLocked == 0 then											-- 没有上锁的箱子
		local nNewChestState = SetBit(nChestState, 2, 1) - nChestState
		AddUnitStates(nChestIndex, 8, nNewChestState)				-- 设置箱子的独占权限
		On_Dropis_Loot(a,b,c)
	elseif nIsLocked == 1 then										-- 上锁的箱子
		if GetItemCount(ACT3_CKEY[1], ACT3_CKEY[2], ACT3_CKEY[3]) < 1 then
			Msg2Player("你根本没有钥匙怎么打开箱子？")
		elseif GetItemCount(ACT3_CKEY[1], ACT3_CKEY[2], ACT3_CKEY[3]) >= 1 then
			local nNewChestState = SetBit(nChestState, 2, 1) - nChestState
			AddUnitStates(nChestIndex, 8, nNewChestState)				-- 设置箱子的独占权限
			Say("用这把钥匙打开？", 2, "使用钥匙打开/#On_Dropis_Open("..a..","..b..","..c..")", "离开/On_Dropis_Exit")
		end
	end
end

function On_Dropis_Open(a,b,c)
	local nZone = TC_GetTeamZone()
	local nChestIndex = TT_GetTarget()
	local nChestState = GetUnitCurStates(nChestIndex, 8)
	local nIsLocked = GetBit(nChestState, 1)
	local nIsUsed = GetBit(nChestState, 2)
	if nIsLocked == 1 then
		if GetItemCount(ACT3_CKEY[1], ACT3_CKEY[2], ACT3_CKEY[3]) >= 1 then
			DelItem(ACT3_CKEY[1], ACT3_CKEY[2], ACT3_CKEY[3], 1)
			--AddUnitStates(nChestIndex, 8, (2-nChestState))		-- 开锁并且设置独占模式
			local nNewChestState = SetBit(nChestState, 1, 0) - nChestState
			AddUnitStates(nChestIndex, 8, nNewChestState)				-- 把箱子的锁打开
			MU_Msg2Team(GetName().."启动保护箱 ("..nChestIndex..")")
			On_Dropis_Loot(a,b,c)
		else
			Msg2Player("没有正确的钥匙，你怎么能打开箱子呢?")
		end
	else
		--local nNewChestState = SetBit(nChestState, 2, 1) - nChestState			-- 设置箱子的独占权限
		--AddUnitStates(nChestIndex, 8, SetBit(nChestState, 2, 1))				-- 设置箱子的独占权限
		On_Dropis_Loot(a,b,c)
	end
end

function On_Dropis_Loot(a,b,c)
	local nZone = TC_GetTeamZone()
	local aGearsIndex = {a,b,c}

	local nBody =  GetBody()
	local nFaction = GetPlayerFaction()
	aGearsIndex[3] = aGearsIndex[3] + nBody
--	Msg2Player("#"..aGearsIndex[1].." "..aGearsIndex[2].." "..aGearsIndex[3])
	if nFaction == 0 then
		Say("箱子里有10枚金币，你想把它们拿出来吗?", 2, "取金币/#On_Dropis_Get("..a..","..b..","..c..")", "离开/On_Dropis_Exit")
		MU_Msg2Team(GetName().."箱子里有"..GT_GetGearFaction(aGearsIndex[3]).."-"..GT_GetGearPart(aGearsIndex[2]).."装备")
	else
		Say("箱子里有"..GT_GetGearFaction(aGearsIndex[3]).."-"..GT_GetGearPart(aGearsIndex[2]).."装备，你想要吗?", 2, "取装备/#On_Dropis_Get("..a..","..b..","..c..")", "离开/On_Dropis_Exit")
		MU_Msg2Team(GetName().."箱子里有"..GT_GetGearFaction(aGearsIndex[3]).."-"..GT_GetGearPart(aGearsIndex[2]).."装备")
	end
end

function On_Dropis_Get(a,b,c)
	local nChestIndex = TT_GetTarget()
	local nZone = TC_GetTeamZone()
	local aGearsIndex = {a,b,c}
	local nBody = GetBody()
	-- emei & shaolin check
	local nFaction = MU_Div(aGearsIndex[3], 100)
	if (nFaction == 2) or (nFaction == 3) or (nFaction == 4) then
		if nBody > 2 then
			aGearsIndex[3] = aGearsIndex[3] + random(1, 2)
		else
			aGearsIndex[3] = aGearsIndex[3] + nBody
		end
	elseif (nFaction == 8) or (nFaction == 9) then
		if nBody < 3 then
			aGearsIndex[3] = aGearsIndex[3] + random(3, 4)
		else
			aGearsIndex[3] = aGearsIndex[3] + nBody
		end
	else
		aGearsIndex[3] = aGearsIndex[3] + nBody
	end
	if GetPlayerFaction() == 0 then
		Earn(100000)
		MU_Msg2Team(GetName().."拿走了10枚金币")
	else
		AddItem(aGearsIndex[1], aGearsIndex[2], aGearsIndex[3], 1, 1, -1, -1, -1, -1, -1, -1)
		WriteLog("#"..GetName().." "..GetWorldPos().."拾得"..aGearsIndex[1].." "..aGearsIndex[2].." "..aGearsIndex[3])
		MU_Msg2Team(GetName().."拾得 "..GT_GetGearFaction(aGearsIndex[3]).."-"..GT_GetGearPart(aGearsIndex[2]).."装备")
	end
	MC_Del4Group(nChestIndex, 0)
end
function On_Dropis_Exit()
	local nZone = TC_GetTeamZone()
	local nChestIndex = TT_GetTarget()
	local nChestState = GetUnitCurStates(nChestIndex, 8)
	local nIsLocked = GetBit(nChestState, 1)
	local nIsUsed = GetBit(nChestState, 2)
	local nNewChestState = SetBit(nChestState, 2, 0) - nChestState
	AddUnitStates(nChestIndex, 8, nNewChestState)	-- 解除箱子的独占权限
	TT_SetTarget(0)
end
-- ------------------------------------------------------------------------------------------------ <Trap Function> ----
function On_Trap()
	local nZone = TC_GetTeamZone()
	TT_TARGET_Index, TT_TARGET_ModID, TT_TARGET_Name = GetTriggeringUnit()
--	Msg2Player("踩到 BB 了……")
	if TC_STAGE_Index[nZone] == 1 then					-- ACT I
--		ACT1_Trap()
	elseif TC_STAGE_Index[nZone] == 2 then				-- ACT II
	elseif TC_STAGE_Index[nZone] == 3 then				-- ACT III
		ACT3_Trap()
	elseif TC_STAGE_Index[nZone] == 4 then				-- ACT IV
	elseif TC_STAGE_Index[nZone] == 5 then				-- ACT V
	elseif TC_STAGE_Index[nZone] == 6 then				-- ACT VI
	elseif TC_STAGE_Index[nZone] == 7 then				-- ACT VII
	elseif TC_STAGE_Index[nZone] == 8 then				-- ACT VIII
		ACT8_Trap()
	elseif TC_STAGE_Index[nZone] == 9 then				-- ACT IX
	end	
end

-- ------------------------------------------------------------------------------------------------ <Talk Function> ----
function On_Talk()
	local nZone = TC_GetTeamZone()
--	Msg2Player("说话中……")
	if TC_STAGE_Index[nZone] == 1 then					-- ACT I
	elseif TC_STAGE_Index[nZone] == 2 then				-- ACT II
		ACT2_Talk()
	elseif TC_STAGE_Index[nZone] == 3 then				-- ACT III
		ACT3_Talk()
	elseif TC_STAGE_Index[nZone] == 4 then				-- ACT IV
	elseif TC_STAGE_Index[nZone] == 5 then				-- ACT V
		ACT5_Talk()
	elseif TC_STAGE_Index[nZone] == 6 then				-- ACT VI
	elseif TC_STAGE_Index[nZone] == 7 then				-- ACT VII
	elseif TC_STAGE_Index[nZone] == 8 then				-- ACT VIII
	elseif TC_STAGE_Index[nZone] == 9 then				-- ACT IX
		ACT9_Talk()
	end	
end

-- ================================================================================================ <GAME STAGE> ====
-- ------------------------------------------------------------------------------------------------ <Function> ----
function OnDeath()
--	Msg2Player("Death."..GetTriggeringUnit())
end

-- ================================================================================================ <SCORE BAR> ====
SB_PAGE_INFO = {
"撤回提示",
"Xem ph莕 th? 1 [Th玭g tin c? b秐 c馻 T祅g Ki誱 s琻 trang] ",
"Xem ph莕 th? 2 [Th玭g tin nh﹏ v藅][V? 甶觤 t輈h l騳] ",
"Xem ph莕 th? 3 [Th玭g tin vt 秈][Tin t鴆 秈] ",
"Xem ph莕 th? 4 [S? ki謓 vt 秈]",
"Xem ph莕 b猲 tr猲",
"Xem ph莕 b猲 di"}

-- 通常是发生事件后激活显示这些信息，但也有个别稀有信息是通过某种途径激活后才会反映在游戏中。
SB_EVENT_CRUSTG = 1809		-- 记录当前翻到第N页的变量号 Task
SB_EVENT_STAGE = {1811, 1812, 1813, 1814, 1815,  1816, 1817, 1818, 1819, 1810}		-- 记录关卡事件的变量号 Task
SB_STAGE_RECORD = {}
SB_EVENT_TITLE = {
{"  .  ", "  S琻  ", "      ", "  M玭  ", "      "},
{"  .  ", "  Чi  ", "      ", "  vi謓  ", "      "},
{"  .  ", "  H藆  ", "  Hoa  ", "  Vi猲  ", "      "},
{"  .  ", "  Li猲  ", "  Ho祅   ", "  s祇  ", "      "},
{"  .  ", "  T祅g  ", "  Ki誱  ", "  c竎  ", "      "},
{"  .  ", "  ?  ", "  ?  ", "  ?  ", "      "},
{"  .  ", "  ?  ", "  ?  ", "  ?  ", "      "},
{"  .  ", "  T?  ", "  Tr骳  ", "  L﹎  ", "      "},
{"  .  ", "  Ki誱  ", "      ", "  Tr駈g  ", "      "},
{"  .  ", "  th玭g  ", "      ", "  Thng  ", "      "}}
SB_EVENT_CONT = {
	{"  [Ch璦 gi誸 頲 <color=metal>Ch? canh c鯽<color> n祇 ]",
	 "  [Gi誸 nhi襲 <color=metal>Ch? canh c鯽<color> c? th? ch鋍 t鴆 <color=metal>Gia 甶nh ph蒼 n?<color>]",
	 "  [Qua c鯽 s? g苝 r蕋 nhi襲 <color=metal>Gia 甶nh h? vi謓<color> mai ph鬰 ]",
	 "  [Цnh b筰 nhi襲 <color=metal>Gia 甶nh h? vi謓<color> c? th? ch鋍 t鴆 <color=metal>T鎛g qu秐 Ngo筰 vi謓<color>]",
	 "  ??????",
	 "  ??????",
	 "S琻 M玭"},
	{"  [C? th? i tho筰 v韎 <color=metal>T鎛g qu秐 N閕 vi謓<color>, ch鋘 tr鵦 ti誴 chi課 u!]",
	 "  [Gi髉 <color=metal>T鎛g qu秐 N閕 vi謓<color> t譵 Du Long ki誱 v?, c? th? c飊g h緉 luy謓 t藀 v? ngh?.]",
	 "  [Khi gi髉 <color=metal>T鎛g qu秐 N閕 vi謓<color> t譵 Du Long ki誱 c? th? th蕐 頲 B輈h T祄 ki誱.]",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "Чi Vi謓"},
	{"  [N誹 <color=metal>N? l穙 b閏<color> ? H藆 Hoa Vi猲 qu? nhi襲 c? th? l祄 kinh ng <color=metal>H藆 Hoa Vi猲 nghi trng<color> ]",
	 "  [ qua vn hoa, s? khi課 <color=metal>Чi ti觰 th?<color> c祅g ph蒼 n?.]",
	 "  [N誹 t譵 頲 <color=metal>Gia 甶nh<color> b? <color=metal>Чi ti觰 th?<color> b鴆 hi誴, gi髉 h緉 tr? ti襫 chu閏 th﹏.]",							-- 可交换获得钥匙
	 "  [<color=metal>Чi ti觰 th?<color> s? kh玭g qu? l祄 kh? (n誹 i ng? u l? n?)]",
	 "  ??????",
	 "  ??????",
	 "H藆 hoa vi猲"},
	{"  [Trong th阨 gian nh蕋 nh ph? h駓 3 L? hng c? th? ph? ho筰 k誸 c蕌 tr薾 ph竝, c竎 L? hng kh竎 v蒼 ph竧 huy t竎 d鬾g.]",
	 "  [Trong th阨 gian nh蕋 nh ph? h駓 3 L? hng, <color=metal>Чi trang ch?<color> s? hi謓 th﹏!",
 	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "Li猲 Ho祅 S祇"},
	{"  [Kim quy Kim, M閏 quy M閏, Th駓 quy Th駓, H醓 quy H醓, Th? quy Th?, u l? <color=metal>Tng Th?<color> ]",	-- 70级以上 只在这里掉落 丐帮·偷天换日诀要		峨嵋·覆水心法诀要
	 "  [Kim sinh Th駓, Th駓 sinh M閏, M閏 sinh H醓, H醓 sinh Th?, Th? sinh Kim, u l? <color=metal>Tng Sinh<color> ]",	-- 70级以上 只在这里掉落 峨嵋·大慈大悲咒诀要	少林·大乘如来心法诀要
	 "  [Kim kh綾 M閏, M閏 kh綾 Th?, Th? kh綾 Th駓, Th駓 kh綾 H醓, H醓 kh綾 Kim, u l? <color=metal>Tng T?<color> ]",	-- 70级以上 只在这里掉落 唐门·暴雨梨花针诀要	武当·残影诀心法
	 "  [Kim t飊g H醓, H醓 t飊g Th駓, Th駓 t飊g Th?, Th? t飊g M閏, M閏 t飊g Kim,u l? <color=metal>Tng Tr?<color> ]",	-- 60级以上 只在这里掉落 武当·玄武剑阵诀要		少林·罗汉阵诀要
	 "  [Kim ph? Th?, Th? ph? H醓, H醓 ph? M閏, M閏 ph? Th駓, Th駓 ph? Kim, u l? <color=metal>Tng Ph?<color> ]",	-- 60级以上 只在这里掉落 少林·无相神功诀要		丐帮·醉蝶诀要
	 "  ??????",
	 "T祅g Ki誱 c竎"},
	{"  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "???"},
	{"  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "???"},
	{"  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "T? Tr骳 l﹎"},
	{"  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "Ki誱 Ch駈g"},
	{"  ??????",
	 "  [ч h秓 h鱱 c祅g cao, c? th? n g苝 S? gi? T祅g Ki誱 k輈h ho箃 rng, kh玭g ti猽 hao Anh H飊g thi誴]",
	 "  [Khi gi誸 qu竔 ? m鏸 秈 u c? th? nh薾 頲 ch譨 kh鉧 m? Rng tinh ch? ]",
	 "  ??????",
	 "  ??????",
	 "  ??????",
	 "Th玭g Thng"}}
SB_UNKNOWN_INFO = "  [?????? ]"
-- ------------------------------------------------------------------------------------------------ <Function> ----
function SB_Page_0()
end
function SB_Page_1()
	local nZone = TC_GetTeamZone()
	if not ((nZone >= 1) and (nZone <= 5)) then
		SB_Page_1_Bak()
	else
		GS_ViewZone(nZone)
	end
end
function SB_Page_1_Bak()
	local sL1 = "<color=green>.<color><color=gold>Li猲 quan n S琻 trang<color>: <color=gray>X n╩ Y T祅g Ki誱 s琻 trang thi誸 l藀 n nay ch糿g nh鱪g  thu nh薾 nhi襲 danh ki誱 trong thi猲 h?, m? c遪 c? c玭g ngh? c t筼 v? kh? ph遪g v? l? tuy謙 k? b? truy襫  nh蕋 trong giang h?. Nhi襲 nh﹏ s? t譵 n mong t譵 cho m譶h Th莕 Binh B秓 Gi竝.<color>".."\n"
	local sL2 = ""..""
	local sL3 = ""..""
	local sL4 = "<color=green>.<color> <color=gold>Li猲 quan n Khi猽 chi課<color>: <color=gray>Hi謓 nay trang ch? m阨 c竎 nh﹏ s? n T祅g Ki誱 s琻 trang. Nh鱪g ai c? th祅h ? xin n g苝 s? gi? ? Tng Dng<color>.".."\n"
	local sL5 = ""..""
	local sL6 = ""..""
	
	local nStage = GetTask(SB_EVENT_CRUSTG)
	if nStage == 0 then
		nStage = 10
	end
	local sP0 = SB_PAGE_INFO[1].."/SB_Page_0"
	local sP1 = SB_PAGE_INFO[2].."./SB_Page_1"
	local sP2 = SB_PAGE_INFO[3].."/SB_Page_2"
	local sP3 = SB_PAGE_INFO[4].."/SB_Page_3"
	local sP4 = SB_PAGE_INFO[5].."."..SB_EVENT_CONT[nStage][7].."] /SB_Page_Event"
	
	Say(sL1..sL2..sL3..sL4..sL5..sL6, 5, sP1, sP2, sP3, sP4, sP0)
end
function SB_Page_2()
	local nName = "<color=wood>"..SB_FormatStr().."<color>"
	local nScore = "<color=wood>"..SB_FormatStr(GetTask(TB_BONUS_SCORE), 12).."<color>"
	local nTime = tostring(GetTask(TB_BONUS_TIME))
	local nDataS, nDataM, nDataH = 0, 0, 0
	nTime, nDataS = SB_Div(nTime, 60)
	nTime, nDataM = SB_Div(nTime, 60)
	nTime, nDataH = SB_Div(nTime, 60)
	local nData = "<color=green>"..SB_FormatStr(nDataH, 5, 3).."<color><color=water>:<color><color=green>"..SB_FormatStr(nDataM, 2, 3).."<color><color=water>:<color><color=green>"..SB_FormatStr(nDataS, 2, 3).."<color><color=water>'<color>"
	local nRelation = "<color=wood>"..SB_FormatStr(GetTask(TB_BONUS_RELATION), 8)
	
	local sL1 = "<color=green>.<color><color=gold>Th玭g tin nh﹏ v藅<color>: <color=gray>Bao g錷 甶觤 danh v鋘g v? n╪g l鵦 chi課 u.<color>".."\n"
	local sL2 = "  T猲:"..nName.."  Danh v鋘g: Chi課 u:".."\n"
	local sL3 = "".."\n"
	local sL4 = "<color=green>.<color> <color=gold>觤 t輈h l騳<color>: <color=gray>Tr譶h  h秓 h鱱 bi觰 th? tr譶h  quan h? th? l鵦 trong T祅g Ki誱 s琻 trang.<color>".."\n"
	local sL5 = "  T輈h l騳:"..nScore.."  Th阨 gian:"..nData.."  Quan h? S琻 trang:"..nRelation.."\n"
	local sL6 = "".."\n"	

	local nStage = GetTask(SB_EVENT_CRUSTG)
	if nStage == 0 then
		nStage = 10
	end	
	local sP0 = SB_PAGE_INFO[1].."/SB_Page_0"
	local sP1 = SB_PAGE_INFO[2].."/SB_Page_1"
	local sP2 = SB_PAGE_INFO[3].."./SB_Page_2"
	local sP3 = SB_PAGE_INFO[4].."/SB_Page_3"
	local sP4 = SB_PAGE_INFO[5].."."..SB_EVENT_CONT[nStage][7].."] /SB_Page_Event"
	
	Say(sL1..sL2..sL4..sL5, 5, sP1, sP2, sP3, sP4, sP0)	
end
function SB_Page_3()
	local nPlayed = GetTask(TB_BONUS_PLAYED)
	local nFinished = GetTask(TB_BONUS_FINISHED)
	local nSRate = "<color=wood>0%<color>"
	if nPlayed ~= 0 then
		nSRate = "<color=wood>"..(SB_Div(((nFinished*10000)/nPlayed), 1)/100).."<color>%"
	end
	local nPlayed = "<color=wood>"..SB_FormatStr(nPlayed, 12) .."<color>"
	local nFinished = "<color=wood>"..SB_FormatStr(nFinished, 12).."<color>"
	local nStage = "<color=wood>"..SB_FormatStr(GetTask(TB_BONUS_STAGE), 12).."<color>"
	local nKilled = "<color=wood>"..SB_FormatStr(GetTask(TB_BONUS_KILLED), 12).."<color>"
	local nBecaptain = "<color=wood>"..SB_FormatStr(GetTask(TB_BONUS_BECAPTAIN), 12).."<color>"
	
	local sL1 = "<color=green>.<color><color=gold>Tin t鴆 vt 秈<color>: <color=gray>Th玭g qua s? l莕 tham d? v? s? l莕  th玭g qua  t輓h t? l?.<color>".."\n"
	local sL2 = "  S? l莕 tham d?:"..nPlayed.."  S? l莕 vt 秈:"..nFinished.."  T? l? th玭g qua:"..nSRate.."\n"
	local sL3 = "".."\n"
	local sL4 = "<color=green>.<color><color=gold>Th玭g tin 秈<color>: <color=gray>Ghi nh? v礽 th玭g tin vu顃 秈 n gi秐.<color>".."\n"
	local sL5 = "  T鎛g s? vt 秈:"..nStage.."  T鎛g s? s竧 qu竔:"..nKilled.."  S? l莕 i trng:"..nBecaptain.."\n"
	local sL6 = "".."\n"

	local nStage = GetTask(SB_EVENT_CRUSTG)
	if nStage == 0 then
		nStage = 10
	end
	local sP0 = SB_PAGE_INFO[1].."/SB_Page_0"
	local sP1 = SB_PAGE_INFO[2].."/SB_Page_1"
	local sP2 = SB_PAGE_INFO[3].."/SB_Page_2"
	local sP3 = SB_PAGE_INFO[4].."./SB_Page_3"
	local sP4 = SB_PAGE_INFO[5].."."..SB_EVENT_CONT[nStage][7].."] /SB_Page_Event"
	
	Say(sL1..sL2..sL4..sL5, 5, sP1, sP2, sP3, sP4, sP0)
end
function SB_Page_Event(nStage)
	if nStage == nil then
		nStage = GetTask(SB_EVENT_CRUSTG)
	end
	if (nStage < 1) or (nStage > 9) then
		nStage = 10
	end
	SetTask(SB_EVENT_CRUSTG, nStage)
	--local sLine = "  [<color=green>----"..SB_EVENT_CONT[nStage][7].."----<color>]".."\n"
	local sLine = ""
	for i=1,5 do
		sLine = sLine.."<color=green>"..SB_EVENT_TITLE[nStage][i].."<color>"
		if GetBit(GetTask(SB_EVENT_STAGE[nStage]), i) == 1 then
			sLine = sLine..SB_EVENT_CONT[nStage][i].."\n"
		else
			sLine = sLine..SB_UNKNOWN_INFO.."\n"
		end
	end
	local nStagePre, nStageNext = SB_GetPNPage(GetTask(SB_EVENT_CRUSTG))
	local sP0 = SB_PAGE_INFO[6].." ["..SB_EVENT_CONT[nStagePre][7].."]/SB_Page_Event_Pre"
	local sP1 = SB_PAGE_INFO[7].." ["..SB_EVENT_CONT[nStageNext][7].."]/SB_Page_Event_Next"
	local sP2 = SB_PAGE_INFO[3].."/SB_Page_2"
	local sP3 = SB_PAGE_INFO[1].."/SB_Page_0"
	Say(sLine, 4, sP0, sP1, sP2, sP3)
end
function SB_Page_Event_Pre()
	local nStagePre, nStageNext = SB_GetPNPage(GetTask(SB_EVENT_CRUSTG))
	SB_Page_Event(nStagePre)
end
function SB_Page_Event_Next()
	local nStagePre, nStageNext = SB_GetPNPage(GetTask(SB_EVENT_CRUSTG))
	SB_Page_Event(nStageNext)
end

function OnUse()
	SB_Page_2()
end

---------------------------------------------------------------------------------------------

function On_Good_Dropis()

	local npcIndex = GetTargetNpc()
	if npcIndex <= 0 then
		return
	end
	
	local dwID = GetUnitCurStates(npcIndex, 3)
	if dwID == 0 then
		local nRet = ApplyItemDice(1, 100, 300, SF_FILE, "GD_Time_Over", GetTeamSize())
		local nItemIndex = GetUnitCurStates(npcIndex, 5)
		local nBody = 0
		if tGOOD_DROP_ITEM[nItemIndex][1] == 1 then
			nBody = random(0, 3)
		end
		
		local nGenre = tGOOD_DROP_ITEM[nItemIndex][3]
		local nDetail = tGOOD_DROP_ITEM[nItemIndex][4]
		local nParticular = tGOOD_DROP_ITEM[nItemIndex][5] + nBody

		AddDiceItemInfo(nRet, nGenre,nDetail,nParticular,1,1,-1,-1,-1,-1,-1,-1)
		AddUnitStates(npcIndex, 3, nRet)
		local nPlayerOld = PlayerIndex
		for i=1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i)
			RollItem(nRet)
		end
		PlayerIndex = nPlayerOld
		return
	end
	
	local nState = GetItemDiceState(dwID)
	if nState == 0 then
		Msg2Player("正在鉴定物品属性")
	elseif nState == 1 then
		local n, szItem = DiceLootItem(dwID)
		if n == 0 then
			local szMsg = GetName().."拾得"..szItem
			WriteLogEx("Tang Kiem son trang","nh苩 頲","1",szItem)
			MU_Msg2Team(szMsg)
			ToServerMsg(szMsg, szItem, 1)
		elseif n == 1 then
			Msg2Player("背包里没有足够的空间，你不能拿这个东西！")
		end
	elseif nState == 2 then
		Msg2Player("箱子里没有东西了")
	end
end

function GD_Time_Over(dwID)
	show_roll_info(dwID)
end

function show_roll_info(dwID)
	local t, nSize, szItem = GetItemDiceRollInfo(dwID)
	local bAllGiveUp = 1
	for index, value in t do
		local str = value[1].."N衜"..value[2].." 甶觤"
		if value[3] == 0 then
			str = value[1].."Ph鉵g"
		elseif value[3] == 1 then
			str = str.." (Tuy誸 c莡)"
			if value[4] == 1 then
				str = str.." -- Nh苩 頲 "..szItem
				ToServerMsg(str, szItem, 0)
			end
			bAllGiveUp = 0
		elseif value[3] == 2 then
			str = str.." (Tham lam)"
			if value[4] == 1 then
				str = str.." -- Nh苩 頲 "..szItem
				ToServerMsg(str, szItem, 0)
			end
			bAllGiveUp = 0
		end
		Msg2Player(str)
	end
	if bAllGiveUp == 1 then
		Msg2Player("所有队员都放弃了")
	elseif nSize ~= getn(t) then
		Msg2Player("其他的队员都已经过时间了，考虑放弃。")
	end
end

function IsGoldenItem(szItem)
	for i=6, getn(tGOOD_DROP_ITEM) do
		if tGOOD_DROP_ITEM[i][2] == szItem then
			return 1
		end
	end
	return 0
end

function ToServerMsg(sz, szItem, nForce)
	if IsGoldenItem(szItem) == 0 then
		return
	end
	
	if nForce == 1 then
		Msg2SubWorld(sz)
		return
	end
	
	local nOldPlayer = PlayerIndex
	local szName = GetName()
	PlayerIndex = GetTeamMember(0)
	if PlayerIndex > 0 then
		if szName == GetName() then
			Msg2SubWorld(sz)
		end
	end
end
