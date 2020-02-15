-- =========================================
-- File : 中原二区，成都，游方医生.lua
-- Name : 游方医生
-- ID   : 1, 6
-- =========================================

Include("\\script\\task\\WeekEnd\\weekend_switch.lua");
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");

--*****************************************定义常量及预处理***************************************
ID_LEARNLIFESKILL		= 1925		-- 新手任务变量
LEV_LEARNRECIPE			= 1926		-- 配方学习任务变量
TASK49_BEGGING			= 1933		-- 晋级任务开始
FORGETMAIN_NUM			= 1940		-- 遗忘主技能次数
FORGETOHTER_NUM			= 1941		-- 遗忘辅技能次数
strName = "";
strTitle = "";

--*****************************************MAIN函数*******************************************
function main()	
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","玩了5个小时后，请休息一下以保持健康!")
	 	return
	 end
	strName = GetTargetNpcName()
	if (strName == "" or strName == nil) then 
		return 
	end
	strTitle = "<color=green>"..strName.."<color>: "
		
	-------------------------------------------新手任务-----------------------------------------
    if (GetTask(ID_LEARNLIFESKILL) > 3 and GetTask(ID_LEARNLIFESKILL) < 15) then
		SetTask(ID_LEARNLIFESKILL, 0)
		TaskTip("  gi髉 b筺 s鯽 nhi謒 v?T﹏ Th?k?n╪g s鑞g, xin h穣 b総 u l筰.")
		return
	end
    if (GetLevel() < 10) then
		Say(strTitle.."你还年轻！ 想学习生活技能吗？ 等到你达到10级，来找我!", 0)
		return
    elseif (GetTask(ID_LEARNLIFESKILL) >= 0 and GetTask(ID_LEARNLIFESKILL) < 15 and GetLevel() >= 10) then
		Talk(2, "NewLifeSkills", 
			 strTitle.."我将向您展示基本技能，首先包括生产技能: <color=yellow>长武器制造，短武器制造，武器，装甲，服装，帽子，烹饪等<color>.",
			 strTitle.."制作物品需要技巧和材料。 制造3种类型<color=yellow>武器类<color> 需要结合技能<color=yellow>砍树<color>和<color=yellow>采矿<color>提供原材料。 制作工艺 <color=yellow>装甲，服装和头饰<color>需要技能组合<color=yellow>缝纫 <color> 和<color=yellow>刺绣<color>. Mu鑞 <color=yellow>烹饪<color> 需要 <color=yellow>收耕<color>...")
		if (GetTask(ID_LEARNLIFESKILL) == 0) then
			SetTask(ID_LEARNLIFESKILL, 1)
			TaskTip("去泉州找 李丰收")
		end
		return
    end
    
--------------------------------------------主对话-------------------------------------------
	Say(strTitle.."我是游方医生，以专业的医学知识而闻名，不知道我能为您做些什么?",
		4,
		"学习制药/luaLearnLifeSkill",
		"76级配方/learn_all_recipe",
		"忘记制药技能/forget_life_skill",
		"没事了/SayHello")
end;


-- 所有配方相关的事情
function learn_all_recipe()
	Say(strTitle.."想做什么?",
		5,
		"学习新的配方/luaLearnRecipe",
		"了解如何为周末活动做准备/Weekend",
		"接受76级配方任务/get_76_task",
		"补学76级配方/relearn_76_recipe",
		"没事了/SayHello")
end;


-- 接受76级配方任务
function get_76_task()
----------------------------------76级武器配方黑钨精石任务----------------------------------
	local nSkillGenre, nSkillDetail = GetMainLifeSkill()
	local nSkillLevel = GetLifeSkillLevel(nSkillGenre, nSkillDetail)
	local nTaskState_heiwu = GetTask(TASK_MEDICINE_HEIWU)
		
	if nSkillGenre == 1 and nSkillDetail == 6 and nSkillLevel >= 79 then
		--尚未触发配方任务
		if nTaskState_heiwu == 0 then
			medicine_heiwu_001()
			return
		--上交药品
		elseif nTaskState_heiwu == 1 then
			medicine_heiwu_002()
			return
		--未与代矿工对话
		elseif nTaskState_heiwu == 2 then
			medicine_heiwu_004()
			return
		--学会黑钨精石配方
		elseif nTaskState_heiwu == 4 then
			medicine_heiwu_009()
			return
		end 
	end
		
	--提示玩家76级武器配方任务
	if nSkillGenre == 1 and nSkillDetail ~= 6 and nSkillLevel >= 79 and GetTask(1600) == 0 and GetTask(1602) == 0 and GetTask(1603) == 0 and GetTask(1604) == 0 and GetTask(1605) == 0 then 
		weapon_76_recipe_tip(nSkillDetail);
	end
	
	Say("你不配接受76级配方任务.", 0)
end;


-- 补学76级配方
function relearn_76_recipe()
	local nGene, nSkillID = GetMainLifeSkill()
	local nLevel = GetLifeSkillLevel(1, 6)
	if (nGene == 1 and nSkillID == 6) then
		if (GetTask(1602) == 5 and nLevel >= 79) then
			AddRecipe(805)
			Msg2Player("你学会了制作 H綾 ?Tinh Th筩h")
		else
			Say("B筺 ch璦 ho祅 th祅h nhi謒 v?ph鑙 ch?c蕄 76 c馻 k?n╪g Ch?dc!", 0)
		end
	else
		Say("B筺 ch璦 h鋍 k?n╪g: <color=yellow>Ch?dc<color>!", 0)
	end
end;


-- 遗忘生活技能
function forget_life_skill()
	if (GetLifeSkillLevel(1, 6) > 0) then
		local nForgetTimes = GetTask(FORGETMAIN_NUM)	-- 主技能
		local nShouldPay = 5000
		if (nForgetTimes == 0) then
			nShouldPay = 5
		elseif (nForgetTimes == 1) then
			nShouldPay = 50
		elseif (nForgetTimes == 2) then
			nShouldPay = 500
		end
	
		Say(strTitle.."Зy l?l莕 th?"..(nForgetTimes + 1).." l莕 b?k?n╪g s秐 xu蕋, m蕋 "..nShouldPay.." lng, ngi suy ngh?k?ch璦?",
			2,
			"确定要忘了它!/forget_now",
			"再想想/SayHello")
	else
		Say(strTitle.."你也不会制药技能啊.", 0)
	end
end;
function forget_now()
	local nForgetTimes = GetTask(FORGETMAIN_NUM)	-- 辅技能
	local nShouldPay = 5000
	if (nForgetTimes == 0) then
		nShouldPay = 5
	elseif (nForgetTimes == 1) then
		nShouldPay = 50
	elseif (nForgetTimes == 2) then
		nShouldPay = 500
	end
	local nShouldPayMoney = nShouldPay * 100
	
	if (GetLifeSkillLevel(1, 6) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(1, 6)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETMAIN_NUM, nForgetTimes + 1)
				SetTask(LEV_LEARNRECIPE, 0)
				SetTask(LEVELTASKID49, 0)
				SetTask(RESET_ERROR, 0)
				SetTask(1602, 0);						--清空79级武器配方任务
				Msg2Player("K?n╪g Ch?dc c馻 b筺  h駓.")				
			end
		else
			Say(strTitle.."Ngi kh玭g mang theo  ti襫! L蕐 ti襫 r錳 h穣 n nh?", 0)
		end
	end
end;





 ------------------------------------------时间判定--------------------------------------------
 --返回星期几，0代表星期天
function GetWeekDay()
	return tonumber(date("%w"))
end;

--返回当前小时和分钟
function GetLocalTime()
	nHour = date("%H");
	nMin = date("%M");
	return tonumber(nHour), tonumber(nMin)
end;

--19 - 23点59分
function CheckTime(day)
	--活动开关
	if WEEKEND_SWITCH == 0 then
		return 0
	end;
	if day ~= GetWeekDay() then
		return 0
	end;

	--换算19:00 - 24:00是什么区间
	local nBegin = 19 * 60;
	local nEnd = 24 * 60;
	
	local nHour, nMin = GetLocalTime();
	local nValue = nHour * 60 + nMin;
	if nValue >= nBegin and nValue <= nEnd then
		return 1
	else
		return 0
	end
end;


--**********************************************技能学习部分***************************************
--技能学习选择
function luaLearnLifeSkill()
	if (GetLevel() < 10) then
		Say (strTitle.."请 <color=yellow>10级<color> 以后再来找我.",0)
		return
	end

    if (GetLifeSkillsNum(1) == 2) then
        Say(strTitle.."已经学习了生产技能，想学习新技能需要放弃旧技能", 0)
    	return
	end
    
	Say(strTitle.."<color=yellow>制药<color>作为您的新生活技能，您确定要学习?",
    	2,
    	"学习制药/LearnYes",
    	"先不学/LearnNo")
end

--学习技能
function LearnYes()
	if (2 > GetLifeSkillsNum(1)) then
    	if (LearnLifeSkill(1, 6, 1, 79, 1)) then
        	Msg2Player("您学习了生活技能：制药和一些基本材料.")
        	AddItem(1,2,8,9)
        	AddItem(1,2,1,3)
	   		
	   		AddRecipe(3)
        	Msg2Player("你学会了制作 Kim S竛g t竛")
        	AddRecipe(8)
        	Msg2Player("你学会了制作 Ti觰 Ho祅 n")
    	    SetTask(LEV_LEARNRECIPE,10)
		end
	else
		Say(strTitle.."您已经学习了生活技能，无法学习其他技能.", 0)
	end
end;
--取消学习技能
function LearnNo()
    Say(strTitle.."H穣 suy ngh?k?r錳 quay l筰 y nh?", 0)
end

--**********************************************配方学习部分***************************************
--学习新的配方
function luaLearnRecipe()
	local nLevel = GetLifeSkillLevel(1, 6)
	if (nLevel >= 1) then
		if GetTask(LEV_LEARNRECIPE)>=20 and HaveLearnRecipe(234)==0 then
			AddRecipe(234)
            Msg2Player("你学会了制作 B筩h Nh藅 n")
            AddRecipe(239)
            Msg2Player("你学会了制作 輈h Dng t竛")
            AddRecipe(244)
            Msg2Player("你学会了制作 Gi秈 чc n")
		elseif GetTask(LEV_LEARNRECIPE)==30 and HaveLearnRecipe(234)==0 then
            AddRecipe(234)
            Msg2Player("你学会了制作 B筩h Nh藅 n")
            AddRecipe(239)
            Msg2Player("你学会了制作 輈h Dng t竛")
            AddRecipe(244)
            Msg2Player("你学会了制作 Gi秈 чc n")
            AddRecipe(235)
            Msg2Player("你学会了制作 To祅 Sinh n")
            AddRecipe(245)
            Msg2Player("你学会了制作 Ch?Th駓 n")
        elseif GetTask(LEV_LEARNRECIPE)==40 and HaveLearnRecipe(234)==0 then
        	AddRecipe(234)
            Msg2Player("你学会了制作 B筩h Nh藅 n")
            AddRecipe(239)
            Msg2Player("你学会了制作 輈h Dng t竛")
            AddRecipe(244)
            Msg2Player("你学会了制作 Gi秈 чc n")
            AddRecipe(235)
            Msg2Player("你学会了制作 To祅 Sinh n")
            AddRecipe(245)
            Msg2Player("你学会了制作 Ch?Th駓 n")
            AddRecipe(240)
            Msg2Player("你学会了制作 Thi猲 Kim t竛")
            AddRecipe(246)
            Msg2Player("你学会了制作 B礽 V﹏ n")
		elseif GetTask(LEV_LEARNRECIPE)==50 and HaveLearnRecipe(234)==0 then
            AddRecipe(234)
            Msg2Player("你学会了制作 B筩h Nh藅 n")
            AddRecipe(239)
            Msg2Player("你学会了制作 輈h Dng t竛")
            AddRecipe(244)
            Msg2Player("你学会了制作 Gi秈 чc n")
            AddRecipe(235)
            Msg2Player("你学会了制作 To祅 Sinh n")
            AddRecipe(245)
            Msg2Player("你学会了制作 Ch?Th駓 n")
            AddRecipe(240)
            Msg2Player("你学会了制作 Thi猲 Kim t竛")
            AddRecipe(246)
            Msg2Player("你学会了制作 B礽 V﹏ n")
            AddRecipe(236)
            Msg2Player("你学会了制作 Chi猽 H錸 n")
            AddRecipe(241)
            Msg2Player("你学会了制作 B?Thi猲 t竛")
        elseif GetTask(LEV_LEARNRECIPE)==60 and HaveLearnRecipe(234)==0 then
            AddRecipe(234)
            Msg2Player("你学会了制作 B筩h Nh藅 n")
            AddRecipe(239)
            Msg2Player("你学会了制作 輈h Dng t竛")
            AddRecipe(244)
            Msg2Player("你学会了制作 Gi秈 чc n")
            AddRecipe(235)
            Msg2Player("你学会了制作 To祅 Sinh n")
            AddRecipe(245)
            Msg2Player("你学会了制作 Ch?Th駓 n")
            AddRecipe(240)
            Msg2Player("你学会了制作 Thi猲 Kim t竛")
            AddRecipe(246)
            Msg2Player("你学会了制作 B礽 V﹏ n")
            AddRecipe(236)
            Msg2Player("你学会了制作 Chi猽 H錸 n")
            AddRecipe(241)
            Msg2Player("你学会了制作 B?Thi猲 t竛")
            AddRecipe(237)
            Msg2Player("你学会了制作 Ng?D辌h n")
            AddRecipe(247)
            Msg2Player("你学会了制作 C祅 Nguy猲 Ch輓h Kh?n")
        elseif GetTask(LEV_LEARNRECIPE)==70 and HaveLearnRecipe(234)==0 then
            AddRecipe(234)
            Msg2Player("你学会了制作 B筩h Nh藅 n")
            AddRecipe(239)
            Msg2Player("你学会了制作 輈h Dng t竛")
            AddRecipe(244)
            Msg2Player("你学会了制作 Gi秈 чc n")
            AddRecipe(235)
            Msg2Player("你学会了制作 To祅 Sinh n")
            AddRecipe(245)
            Msg2Player("你学会了制作 Ch?Th駓 n")
            AddRecipe(240)
            Msg2Player("你学会了制作 Thi猲 Kim t竛")
            AddRecipe(246)
            Msg2Player("你学会了制作 B礽 V﹏ n")
            AddRecipe(236)
            Msg2Player("你学会了制作 Chi猽 H錸 n")
            AddRecipe(241)
            Msg2Player("你学会了制作 B?Thi猲 t竛")
            AddRecipe(237)
            Msg2Player("你学会了制作 Ng?D辌h n")
            AddRecipe(247)
            Msg2Player("你学会了制作 C祅 Nguy猲 Ch輓h Kh?n")
            AddRecipe(242)
            Msg2Player("你学会了制作 Th蕋 Tr飊g Th蕋 Hoa t竛")
        elseif GetTask(LEV_LEARNRECIPE)==80 and HaveLearnRecipe(234)==0 then
            AddRecipe(234)
            Msg2Player("你学会了制作 B筩h Nh藅 n")
            AddRecipe(239)
            Msg2Player("你学会了制作 輈h Dng t竛")
            AddRecipe(244)
            Msg2Player("你学会了制作 Gi秈 чc n")
            AddRecipe(235)
            Msg2Player("你学会了制作 To祅 Sinh n")
            AddRecipe(245)
            Msg2Player("你学会了制作 Ch?Th駓 n")
            AddRecipe(240)
            Msg2Player("你学会了制作 Thi猲 Kim t竛")
            AddRecipe(246)
            Msg2Player("你学会了制作 B礽 V﹏ n")
            AddRecipe(236)
            Msg2Player("你学会了制作 Chi猽 H錸 n")
            AddRecipe(241)
            Msg2Player("你学会了制作 B?Thi猲 t竛")
            AddRecipe(237)
            Msg2Player("你学会了制作 Ng?D辌h n")
            AddRecipe(247)
            Msg2Player("你学会了制作 C祅 Nguy猲 Ch輓h Kh?n")
            AddRecipe(242)
            Msg2Player("你学会了制作 Th蕋 Tr飊g Th蕋 Hoa t竛")
            AddRecipe(238)
            Msg2Player("你学会了制作 B玭 Tinh Nguy謙 Кn")
            AddRecipe(243)
            Msg2Player("你学会了制作 Чi Nh藅 Dng T竛")
            AddRecipe(248)
            Msg2Player("你学会了制作 Thi猲 Vng B?T﹎ n")    
		elseif nLevel>=1 and GetTask(LEV_LEARNRECIPE)==0 then
       		AddRecipe(3)
        	Msg2Player("你学会了制作 Kim S竛g t竛")
        	AddRecipe(8)
        	Msg2Player("你学会了制作 Ti觰 Ho祅 n")
    	    SetTask(LEV_LEARNRECIPE,10)
        elseif nLevel>=10 and GetTask(LEV_LEARNRECIPE)==10 then
        	AddRecipe(4)
        	Msg2Player("你学会了制作 Ch?Huy誸 t竛")
        	AddRecipe(13)
        	Msg2Player("你学会了制作 Thanh T﹎ t竛")
        	AddRecipe(234)
        	Msg2Player("你学会了制作 B筩h Nh藅 n")
        	AddRecipe(239)
        	Msg2Player("你学会了制作 輈h Dng t竛")
        	AddRecipe(244)
        	Msg2Player("你学会了制作 Gi秈 чc n")
        	SetTask(LEV_LEARNRECIPE,20)
    	elseif nLevel>=20 and GetTask(LEV_LEARNRECIPE)==20 then
        	AddRecipe(9)
        	Msg2Player("你学会了制作 Ho祅 Dng n")
        	AddRecipe(14)
        	Msg2Player("你学会了制作 輈h Kh?t竛")
        	AddRecipe(235)
        	Msg2Player("你学会了制作 To祅 Sinh n")
        	AddRecipe(245)
        	Msg2Player("你学会了制作 Ch?Th駓 n")
        	SetTask(LEV_LEARNRECIPE,30)
    	elseif nLevel>=30 and GetTask(LEV_LEARNRECIPE)==30 then
        	AddRecipe(5)
        	Msg2Player("你学会了制作 B筩h V﹏ t竛")
        	AddRecipe(240)
        	Msg2Player("你学会了制作 Thi猲 Kim t竛")
        	AddRecipe(246)
        	Msg2Player("你学会了制作 B礽 V﹏ n")
        	SetTask(LEV_LEARNRECIPE,40)
    	elseif nLevel>=40 and GetTask(LEV_LEARNRECIPE)==40 then
        	AddRecipe(10)
        	Msg2Player("你学会了制作 Чi Ho祅 n")
        	AddRecipe(15)
        	Msg2Player("你学会了制作 Ng鋍 Linh t竛")
        	AddRecipe(236)
        	Msg2Player("你学会了制作 Chi猽 H錸 n")
        	AddRecipe(241)
        	Msg2Player("你学会了制作 B?Thi猲 t竛")
        	SetTask(LEV_LEARNRECIPE,50)
    	elseif nLevel>=50 and GetTask(LEV_LEARNRECIPE)==50 then
        	AddRecipe(6)
        	Msg2Player("你学会了制作 Thi猲 Hng C萴 T鬰")
        	AddRecipe(11)
        	Msg2Player("你学会了制作 Nh蕋 Nguy猲 Ph鬰 Th駓 n")
        	AddRecipe(237)
        	Msg2Player("你学会了制作 Ng?D辌h n")
        	AddRecipe(247)
        	Msg2Player("你学会了制作 C祅 Nguy猲 Ch輓h Kh?n")
        	SetTask(LEV_LEARNRECIPE,60)
    	elseif nLevel>=60 and GetTask(LEV_LEARNRECIPE)==60 then
        	AddRecipe(16)
        	Msg2Player("你学会了制作 Ng?Hoa Ng鋍 L?Ho祅")
        	AddRecipe(7)
        	Msg2Player("你学会了制作 H綾 Ng鋍 筺 T鬰 cao")
        	AddRecipe(12)
        	Msg2Player("你学会了制作 V筺 V藅 Quy Nguy猲 n")
        	AddRecipe(242)
        	Msg2Player("你学会了制作 Th蕋 Tr飊g Th蕋 Hoa t竛")
        	SetTask(LEV_LEARNRECIPE,70)
      	elseif nLevel>=70 and GetTask(LEV_LEARNRECIPE)==70 then
	    	AddRecipe(17)
        	Msg2Player("你学会了制作 Sinh Sinh H鉧 T竛")
        	AddRecipe(238)
        	Msg2Player("你学会了制作 B玭 Tinh Nguy謙 Кn")
        	AddRecipe(243)
        	Msg2Player("你学会了制作 Чi Nh藅 Dng T竛")
        	AddRecipe(248)
        	Msg2Player("你学会了制作 Thi猲 Vng B?T﹎ n")
        	SetTask(LEV_LEARNRECIPE,80)
       	elseif GetTask(LEV_LEARNRECIPE)==80 and HaveLearnRecipe(238)==0 then
        	AddRecipe(238)
        	Msg2Player("你学会了制作 B玭 Tinh Nguy謙 Кn")
        	AddRecipe(243)
        	Msg2Player("你学会了制作 Чi Nh藅 Dng T竛")
        	AddRecipe(248)
        	Msg2Player("你学会了制作 Thi猲 Vng B?T﹎ n")
    	else
        	Say (strTitle..":经验不够，请继续努力",0)
      	end
    end
end;


--对技能的说明信息
function Weekend()
    if (GetLifeSkillLevel(1,6) >= 1 and 
    	(CheckTime(0)==1 or CheckTime(5)==1 or CheckTime(6)==1)) then
    	Talk(1,"",strTitle.."在战争面前，我会给一些药让你治愈士兵!")
    	AddRecipe(232)
    	Msg2Player("您学会了一种新方法-军用医药制作!")
    else
    	Say(strTitle.."您尚未学会制药或时间尚未到，我无法将准备方法传授给您.", 0)
    end
end

--取消函数
function SayHello()
end

function NewLifeSkills()
	Talk(2, "",
		 strTitle.."",
		 "好吧！ 相信你对生产技能有一点了解<color=yellow>想学习生产技能<color>. 现在你去找 <color=yellow>泉州李丰收<color>.")
	return
end;

