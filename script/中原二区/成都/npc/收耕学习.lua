-- =========================================
-- File : 中原二区，成都，收耕学习.lua
-- Name : 李丰收
-- ID   : 0, 3
-- =========================================
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");

--*****************************************定义常量及预处理***************************************
ID_LEARNLIFESKILL		= 1925		-- 新手任务变量
TASK49_BEGGING			= 1933		-- 晋级任务开始
FORGETMAIN_NUM			= 1940		-- 遗忘主技能次数
FORGETOHTER_NUM			= 1941		-- 遗忘主技能次数
strName = "";
strTitle = "";

--*****************************************MAIN函数*******************************************
function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","玩5小时后休息一下啊!")
	 	return
	 end
	strName = GetTargetNpcName()
	if (strName == "" or strName == nil) then 
		return 
	end
	strTitle = "<color=green>"..strName.."<color>: "
	
	-------------------------------------------新手任务-----------------------------------------
	if (GetTask(ID_LEARNLIFESKILL) < 1) then
        Say(strTitle.."等 <color=yellow>10级<color> 以后去 <color=yellow>成都<color> 找 <color=yellow>D游方医生<color> 学习 <color=yellow>生活技能<color>!", 0)
        TaskTip("10级后到成都找游方医生.")
        return
    elseif (GetTask(ID_LEARNLIFESKILL) == 1) then
        Talk(1, "QUSTION",strTitle.."来啦，先做个测试。")
        return
    elseif (GetTask(ID_LEARNLIFESKILL) < 15) then
    	Say(strTitle.."想学习耕作技能吗？ 现在不是时候教你!", 0)
    	return
    end
    
	----------------------------提示玩家76级武器配方任务--------------------------
	local nGene, nSkillID = GetMainLifeSkill()
	local nSkillLevel = GetLifeSkillLevel(nGene, nSkillID)
	if (nGene == 1 and nSkillLevel >= 79 and 
		GetTask(1600) == 0 and GetTask(1602) == 0 and 
		GetTask(1603) == 0 and GetTask(1604) == 0 and 
		GetTask(1605) == 0) then 
		weapon_76_recipe_tip(nSkillID)
		return
	end
	
	---------------------------------------------主对话------------------------------------------
	Say(strTitle.."想学收耕吗?",
		6,
		"学习收耕/luaLearnLifeSkill",
		"去采集地图 (s?c蕄)/GotoWorld_Confirm1",
		"去采集地图 (trung c蕄)/GotoWorld_Confirm2",
		"去采集地图 (cao c蕄)/GotoWorld_Confirm3",
		"遗忘收耕技能/forget_life_skill",
		"收耕技能介绍/Info",
       	"没事了/Main_Exit"
		);

end;


-- 遗忘生活技能
function forget_life_skill()
	if (GetLifeSkillLevel(0, 3) > 0) then
		local nForgetTimes = GetTask(FORGETOHTER_NUM)	-- 辅技能
		local nShouldPay = 5000
		if (nForgetTimes == 0) then
			nShouldPay = 5
		elseif (nForgetTimes == 1) then
			nShouldPay = 50
		elseif (nForgetTimes == 2) then
			nShouldPay = 500
		end
	
		Say(strTitle.."Зy l?l莕 th?"..(nForgetTimes + 1)..", ngi h駓 k?n╪g thu th藀, ta ph秈 thu"..nShouldPay.." lng, ngi suy ngh?k?ch璦?",
			2,
			"忘了它!/forget_now",
			"再想想!/SayHello")
	else
		Say(strTitle.."你根本不会收耕啊!", 0)
	end
end;
function forget_now()
	local nForgetTimes = GetTask(FORGETOHTER_NUM)	-- 辅技能
	local nShouldPay = 5000
	if (nForgetTimes == 0) then
		nShouldPay = 5
	elseif (nForgetTimes == 1) then
		nShouldPay = 50
	elseif (nForgetTimes == 2) then
		nShouldPay = 500
	end
	local nShouldPayMoney = nShouldPay * 100
	
	if (GetLifeSkillLevel(0, 3) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(0, 3)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETOHTER_NUM, nForgetTimes + 1)
				SetTask(516, 0)
				Msg2Player("你已经忘记收耕技能")				
			end
		else
			Say(strTitle.."你没有带足够的钱！ 拿钱来", 0)
		end
	end
end;


-- -------------------------------学习生活技能-------------------------------
function luaLearnLifeSkill()
    if (GetLevel() < 10) then
        Say (strTitle.."10级以后再来找我吧!", 0)
		return
	end

	-- 判断是否已经学会了采集技能 - 收耕
	if (GetLifeSkillLevel(0, 3) > 0) then
        Say (strTitle.."你已经学会了啊!", 0)
		return
	end

	if GetLifeSkillsNum(0)>=2 then
        Say (strTitle.."您已经学习了2种收集技能，无法再学习!",0)
		return
	end

    Say(strTitle.."<color=yellow>收耕<color> 将是您的新收集技能。 你想学习吗?",
    	2,
    	"是的学习/LearnYes",
    	"不学了/LearnNo")
end;
--学习技能
function LearnYes(MaxLvl,nMain)
	if (GetLifeSkillLevel(0, 3) > 0) then
		Say (strTitle.."您已经学会了所有耕作技能!", 0)
	else
		if (LearnLifeSkill(0, 3, 1, 79, 0)) then
			AddItem(0, 200, 13, 1, 1)
        	Msg2Player("您已经学习了收集技能：收耕")
    	end
	end
end;
--取消学习技能
function LearnNo()
    Say (strTitle.."仔细想想再来！",0)
end



-- 确认去相应挂机地点
function GotoWorld_Confirm1()
	Say(strTitle.."你想来 <color=yellow>Thanh Th駓 th玭<color> 耕种？ 那地方有很多 <color=yellow>Quang Th玭g Ma<color>, <color=yellow>M閏 nh?color>, <color=yellow>Khuynh Ly u<color>, <color=yellow>N蕀 <color>, <color=yellow>Nhi評 minh u<color>, <color=yellow>M╪g tr骳<color>, <color=yellow>Dung tr筩h c鑓<color> v?<color=yellow>H?ti猽<color>. Nh?mang theo <color=yellow>Cu鑓<color>!",
		2,
		"去/#GotoWorld(713,1477,2948)",
		"不去/Main_Exit")
end;
function GotoWorld_Confirm2()
	Say(strTitle.."你想来 <color=yellow>Doanh D﹏ th玭<color> 耕种？ 那地方有很多  c?nhi襲 <color=yellow>M輆<color>, <color=yellow>Di猲 Tinh M筩h<color> v?<color=yellow>Thu莕 h遖 m筩h<color>. Nh?mang theo <color=yellow>Cu鑓<color>!",
		2,
		"去/#GotoWorld(718,1708,3405)",
		"不去/Main_Exit")
end;
function GotoWorld_Confirm3()
	Say(strTitle.."你想来 <color=yellow>Lam Nh筩 th玭<color> 耕种？ 那地方有很多  c?nhi襲 <color=yellow>Du long t骳<color>, <color=yellow>Ph鬾g Qu竛 T骳<color> v?<color=yellow>Dao Chi T骳<color>. Nh?mang theo <color=yellow>Cu鑓<color>!",
		2,
		"去/#GotoWorld(723,1700,3448)",
		"不去/Main_Exit")
end;
-- 去相应的挂机地点
function GotoWorld(MapID, x, y)
		CleanInteractive()
		LeaveTeam()
		SetFightState(0)
		
		NewWorld(MapID, x, y)
end;


-- 介绍相关信息
function Info()
	Say(strTitle.."<color=yellow>收耕<color> 是 <color=yellow>6<color> 种收集技能之一，学习此技能你可以获得<color=yellow>烹饪材料<color>. 你可以去 <color=yellow>杂货店<color> 购买 <color=yellow>收耕工具<color> !", 0)
end;
-- 什么也不做的空函数
function Main_Exit()
end;


--******************************************新手任务部分*****************************************
--新手任务问题函数
function QUSTION()
		Say(strTitle.."问题1: 怎样使用生产技能?",4,
		"1. 打开技能用户界面./QUS_ERROR",
		"2. 学习了如何创建新的使用技巧界面之后./QUS_ERROR",
		"3. 学习如何收集所有必要的材料，然后打开技能使用界面（对）./QUS2_GOTO",
		"4. 你看不起我的智慧吗？/QUS_ERROR")
end
function QUS2_GOTO()
		Say(strTitle.."问题2: 以下哪项是生产技能?",4,
		"1. 采摘烟草，晒黑，制作长武器，烹饪，迷人，砍伐，耕种/QUS_ERROR",
		"2. 砍伐，挖掘，耕种，晒黑，聚会，丝绸/QUS_ERROR",
		"3. 制造长武器，护身符，制造武器，短武器，烹饪，医药，制甲（对）/QUS3_GOTO",
		"4. .制造武器，制造武器，烹饪，准备药品，晒黑，收集药品，丝绸剪刀/QUS_ERROR")
end

function QUS3_GOTO()
		Say(strTitle.."问题3: 刘一斧的专长是砍伐树木，那么他的材料可以用来做什么?",4,
		"1. 制造长装甲和装甲/QUS_ERROR",
		"2. 烹饪和制造武器/QUS_ERROR",
		"3. 制造武器和短武器（对）/QUS4_GOTO",
		"4. 制造装甲和护身符/QUS_ERROR")
end
function QUS4_GOTO()
		Say(strTitle.."问题4: 我们想学习制符，所以请问需要学习什么技能?",4,
		"1. 制造装甲/QUS_ERROR",
		"2. Ch?dc/QUS_ERROR",
		"3. 烹饪/QUS_ERROR",
		"4. 集灵（对）/QUS5_GOTO")
end
function QUS5_GOTO()
		Say(strTitle.."问题5: 在制造武器的过程中，可以添加增强武器性能的材料。 请问，我可以添加多少材料?",4,
		"1. 6 种/QUS_ERROR",
		"2. 8 种/QUS_ERROR",
		"3. 10 种（对）/QUS_PASS",
		"4. 12 种/QUS_ERROR")
end
function QUS_PASS()
		Say(strTitle.."很好，去 <color=yellow>汴京<color>找<color=yellow>云游道人<color> 了解一下!",0)
		SetTask(ID_LEARNLIFESKILL,2)
		TaskTip("去汴京找 云游道人")
end
function QUS_ERROR()
		Say(strTitle.."您似乎对生产技能一无所知。 快来找 <color=yellow> 游方医生<color> 去!",0)
end

