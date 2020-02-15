-- =========================================
-- File : 中原二区，成都，短兵器锻造.lua
-- Name : 莫二
-- ID   : 1, 3
-- =========================================

Include("\\script\\task\\WeekEnd\\weekend_switch.lua");
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");
Include("\\script\\task\\lingshi_task.lua")
--*****************************************定义常量及预处理***************************************
ID_LEARNLIFESKILL		= 1925		-- 新手任务
LEV_LEARNRECIPE			= 1926		-- 配方学习情况记录
LEVELTASKID49			= 517		-- 吞龙宝刀任务
TASK49_BEGGING			= 1933		-- 49级晋级任务开始标示
RESET_ERROR				= 1938		-- 修复外网错误标示
FORGETMAIN_NUM			= 1940		-- 遗忘主技能次数
FORGETOHTER_NUM			= 1941		-- 遗忘主技能次数
strName = "";
strTitle = "";

--*****************************************MAIN函数*****************************************
function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","Х qu?5 gi?ch琲, h穣 ngh?ng琲  gi?g譶 s鴆 kh醗!")
	 	return
	 end
	strName = GetTargetNpcName()
	if random(1,15) == 1 then
		NpcChat(GetTargetNpc(),"想要使装备具有八卦属性，绝对需要具有3个隐藏属性的装备!");
	end;
	if (strName == "" or strName == nil) then 
		return 
	end
	strTitle = "<color=green>"..strName.."<color>: "
		
	-----------------------------------------新手任务-----------------------------------------
    if (GetTask(ID_LEARNLIFESKILL) < 15) then
		Say(strTitle.."等<color=yellow>10级<color> 后去 <color=yellow>成都<color> 找 <color=yellow>游方医生<color> 了解 <color=yellow> 生活技能 <color>!", 0)
		TaskTip("10级后，您可以去成都找到游方医生") 
    	return 
    end

---------------------------------------------主对话-------------------------------------------
	local strtab = {
    "学习短兵器制造技能/luaLearnLifeSkill",
	"学习新的配方/learn_all_recipe",
    "遗忘生活技能/forget_life_skill",
    "八卦相关/bagua",
	"76级武器配方任务/xinwuqi",
    "随便打听一下/Dating"
    }		
	if GetTask(TASK_LINGSHI_ID) == 2 or GetTask(TASK_LINGSHI_ID) == 11 then
		tinsert(strtab,"继续学习八卦/task_new3");
	end
	if GetLifeSkillMaxLevel(1, 3) == 79 then
		tinsert(strtab, "想要学习更多高级技能/update_max_skill_level");
	end 
	tinsert(strtab,"没事了/SayHello");
	Say(strTitle.."我的名字叫莫二，会制造短兵器武器（尤其是短剑）的强项，例如：剑，刀，护手。 有什么可以帮助你?",
    	getn(strtab),
    	strtab)
end;

-- 所有配方相关的事情
function learn_all_recipe()
	Say(strTitle.."你想学习所以配方?",
		7,
    	"学习新的配方/luaLearnRecipe",
    	"学习领土装备/learnLtEquip",
    	"周末任务配方/Weekend",
		"76级武器配方任务/get_76_task",
		"重新学习76级配方/relearn_76_recipe",
    	"补学双刀配方/luaLearnRecipeDdao",
    	"没事了/SayHello")
end;


-- 接受76级配方任务
function get_76_task()
	---------------------------------------76级武器配方任务--------------------------------------
	local nSkillGenre, nSkillDetail = GetMainLifeSkill()
	local nSkillLevel = GetLifeSkillLevel(nSkillGenre, nSkillDetail)
	local nTaskState_76 = GetTask(TASK_76WEAPON)
		
	if (nSkillGenre == 1 and nSkillDetail == 3 and nSkillLevel >= 79) then
		--尚未触发配方任务
		if nTaskState_76 == 0 then
			weapon_76_001(2)
			return
		--上交武器
		elseif nTaskState_76 == 1 then
			weapon_76_002(2)
			return
		--未与五位掌门对话
		elseif nTaskState_76 == 2 then
			weapon_76_004(2)
			return
		--已经与五位掌门对话
		elseif nTaskState_76 == 3 then
			weapon_76_005(2)
			return
		--选择学习神兵的方向
		elseif nTaskState_76 == 4 then
			weapon_76_choice(2)
			return
		end 
	end
		
	--提示玩家76级武器配方任务
	if (nSkillGenre == 1 and nSkillDetail ~= 3 and nSkillLevel >= 79 and 
		GetTask(1600) == 0 and GetTask(1602) == 0 and 
		GetTask(1603) == 0 and GetTask(1604) == 0 and 
		GetTask(1605) == 0) then 
		weapon_76_recipe_tip(nSkillDetail)
	end
	
	Say("B筺 ch璦  甶襲 ki謓 nh薾 nhi謒 v?ph鑙 ch?c蕄 76.", 0)
end;



-- 补学76级配方
function relearn_76_recipe()
	local nGene, nSkillID = GetMainLifeSkill()
	local nLevel = GetLifeSkillLevel(1, 3)
	if (nGene == 1 and nSkillID == 3) then
		if (GetTask(1600) == 5 and nLevel >= 79) then
			if (HaveLearnRecipe(793) == 0 and 
				HaveLearnRecipe(794) == 0 and 
				HaveLearnRecipe(797) == 0 and 
				HaveLearnRecipe(804) == 0) then
				Say("想学哪个:",
					5,
					"护手/learn_long_1",   
					"剑/learn_long_2",  
					"刀/learn_long_3",    
					"双刀/learn_long_4",    
					"没事了/SayHello")
			else
				Say("你已经学会了啊!", 0)
			end
		else
			Say("B筺 ch璦 l祄 nhi謒 v?ph鑙 ch?c蕄 76", 0)
		end
	else
		Say("B筺 ch璦 h鋍 k?n╪g:<color=yellow>Ch?t筼 binh kh?ng緉<color>!", 0)
	end
end;
-- 护手
function learn_long_1()
	AddRecipe(793)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch? V筺 nh蒼")
end;
-- 剑
function learn_long_2()
	AddRecipe(794)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch? H醓 Tinh")
end;
-- 刀
function learn_long_3()
	AddRecipe(797)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch? C?лnh")
end;
-- 双刀
function learn_long_4()
	AddRecipe(804)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch? L╪g Phong")
end;



-- 遗忘生活技能
function forget_life_skill()
	if (GetLifeSkillLevel(1, 3) > 0) then
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
			"Ta  quy誸 nh r錳!/forget_now",
			"Khoan ! Ch?ta suy ngh?l筰!/SayHello")
	else
		Say(strTitle.."Ngi ch璦 h鋍 k?n╪g Ch?t筼 binh kh?ng緉? Ta kh玭g th?gi髉 ngi!", 0)
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
	
	if (GetLifeSkillLevel(1, 3) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(1, 3)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETMAIN_NUM, nForgetTimes + 1)
				SetTask(LEV_LEARNRECIPE, 0)
				SetTask(LEVELTASKID49, 0)
				SetTask(1600, 0);			--清空79级武器配方任务
				SetTask(1601, 0);			--清空79级武器配方任务
				Msg2Player("B筺  b?k?n╪g Ch?t筼 binh kh?ng緉")				
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
		Say (strTitle.."B筺 kh玭g  <color=yellow>c蕄 10<color> ch?th?h鋍 k?n╪g s鑞g.", 0)
  		return
	end

    if (GetLifeSkillsNum(1) == 2) then
        Say(strTitle.."B籲g h鱱  h鋍 k?n╪g s秐 xu蕋, mu鑞 h鋍 k?n╪g m韎 c莕 ph秈 b?k?n╪g c?", 0)
    	return
	end
	
	Say(strTitle.."B籲g h鱱 mu鑞 h鋍 k?n╪g <color=yellow>Ch?t筼 binh kh?ng緉<color> ?",
    	2,
    	"学习/LearnYes",
    	"不了/LearnNo")
end

--学习技能
function LearnYes()
	if (2 > GetLifeSkillsNum(1)) then
    	if (LearnLifeSkill(1, 3, 1, 79, 1)) then
        	Msg2Player("B筺  h鋍 k?n╪g Ch?t筼 binh kh?ng緉, nh薾 頲 3 h綾 kim ph蕁.")
        	AddItem(2, 2, 59, 3)

	    	AddRecipe(49)
    		Msg2Player("B筺 h鋍 頲 ph鑙 ch? Phi Ng?Th?")
	   		AddRecipe(50)
	   		Msg2Player("B筺 h鋍 頲 ph鑙 ch? H錸g Ma Th?")
    		AddRecipe(62)
    		Msg2Player("B筺 h鋍 頲 ph鑙 ch? Linh X?Ki誱")
			AddRecipe(63)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch? X輈h Sa Ki誱")
    		AddRecipe(73)
    		Msg2Player("B筺 h鋍 頲 ph鑙 ch? Gi韎 o")
    		AddRecipe(74)
    		Msg2Player("B筺 h鋍 頲 ph鑙 ch? Chi誸 Thi誸 o")
    		AddRecipe(782)
    		Msg2Player("B筺 h鋍 頲 ph鑙 ch? Li評 Di謕 Song o")
    		AddRecipe(783)
    		Msg2Player("B筺 h鋍 頲 ph鑙 ch? Nguy謙 Nha Th輈h")
        	SetTask(LEV_LEARNRECIPE, 10)
        end
	else
		Say(strTitle.."B筺  h鋍 k?n╪g s鑞g, kh玭g th?h鋍 th猰 k?n╪g kh竎.", 0)
	end
end;
--取消学习技能
function LearnNo()
    Say(strTitle.."H穣 suy ngh?k?r錳 quay l筰 y nh?", 0)
end

--**********************************************配方学习部分***************************************
--学习新的配方
function luaLearnRecipe()
	local nLevel = GetLifeSkillLevel(1, 3);
	if GetLifeSkillLevel(1, 3)>1 then
		if (nLevel >= 1 and GetTask(LEV_LEARNRECIPE) == 0) then
			AddRecipe(49)
    		Msg2Player("B筺 h鋍 頲 ph鑙 ch? Phi Ng?Th")
	   		AddRecipe(50)
	   		Msg2Player("B筺 h鋍 頲 ph鑙 ch? H錸g Ma Th")
    		AddRecipe(62)
    		Msg2Player("B筺 h鋍 頲 ph鑙 ch? Linh X?Ki誱")
			AddRecipe(63)
			Msg2Player("B筺 h鋍 頲 ph鑙 ch? X輈h Sa Ki誱")
    		AddRecipe(73)
    		Msg2Player("B筺 h鋍 頲 ph鑙 ch? Gi韎 o")
    		AddRecipe(74)
    		Msg2Player("B筺 h鋍 頲 ph鑙 ch? Chi誸 Thi誸 o")
    		AddRecipe(782)
    		Msg2Player("B筺 h鋍 頲 ph鑙 ch? Li評 Di謕 Song o")
    		AddRecipe(783)
    		Msg2Player("B筺 h鋍 頲 ph鑙 ch? Nguy謙 Nha Th輈h")
        	SetTask(LEV_LEARNRECIPE, 10)
    	elseif nLevel>=10 and GetTask(LEV_LEARNRECIPE)==10 then
        	AddRecipe(51)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch? Xuy猲 V﹏ Th")
        	AddRecipe(52)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch? Tam Dng Th")
        	AddRecipe(64)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch? Thanh Minh Ki誱")
        	AddRecipe(65)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch? Huy誸 S竧 Ki誱")
        	AddRecipe(75)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch? Li謙 Di謒 o")
        	AddRecipe(76)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch? Ng?H?筺 M玭 o")
        	AddRecipe(784)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch? цi Phi Th輈h")
        	AddRecipe(785)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch? H錸g 蕁 o")
        	SetTask(LEV_LEARNRECIPE,20)
    	elseif nLevel>=20 and GetTask(LEV_LEARNRECIPE)==20 then
        	AddRecipe(53)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch? Thi猲 Ng璾 Th")
        	AddRecipe(66)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch? H祄 Quang Ki誱")
        	AddRecipe(77)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch? C鰑  o")
        	AddRecipe(786)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch? Bi猲 B鴆 o")
        	SetTask(LEV_LEARNRECIPE,30)
    	elseif nLevel>=30 and GetTask(LEV_LEARNRECIPE)==30 then
        	AddRecipe(54)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch? B輈h X?Th")
        	AddRecipe(55)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch? Kh竛g Long Th")
        	AddRecipe(67)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch? L筩 Dng")
        	AddRecipe(68)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch? Huy襫 謓")
        	AddRecipe(78)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch? Ph?S琻 o")
        	AddRecipe(79)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch? Nh﹏ у o")
        	AddRecipe(787)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch? N?H錸g")
        	AddRecipe(788)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch? B竜 Hoa")
        	SetTask(LEV_LEARNRECIPE,40)
    	elseif nLevel>=40 and GetTask(LEV_LEARNRECIPE)==40 then
        	AddRecipe(56)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch? Tng Ph鬾g")
        	AddRecipe(57)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch? N?Long")
        	AddRecipe(69)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch? Thanh Sng")
        	AddRecipe(70)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch? Dao Quang")
        	AddRecipe(80)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch? Long L﹏")
        	AddRecipe(81)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch? B竎h B輈h")
        	AddRecipe(789)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch? Uy猲 Μng Li猲 Ho祅")
        	SetTask(LEV_LEARNRECIPE,50)
    	elseif nLevel>=50 and GetTask(LEV_LEARNRECIPE)==50 then
        	AddRecipe(58)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch? Ng?Phng Qu?Ch髇g")
        	AddRecipe(71)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch? B輈h Huy誸")
        	AddRecipe(82)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch? Thi猲 S竧")
        	AddRecipe(790)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch? Huy誸 Li猲 Ho祅")
        	SetTask(LEV_LEARNRECIPE,60)
    	elseif nLevel>=60 and GetTask(LEV_LEARNRECIPE)==60 then
        	AddRecipe(59)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch? N?L?мa Ng鬰")
        	AddRecipe(72)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch? Huy襫 thi誸 Tr鋘g Ki誱")
        	AddRecipe(83)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch? B?Vng")
        	AddRecipe(791)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch? T玦 Nguy謙")
        	SetTask(LEV_LEARNRECIPE,70)
      	elseif nLevel>=70 and GetTask(LEV_LEARNRECIPE)==70 then
        	AddRecipe(792)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch? 筺 Trng")
        	SetTask(LEV_LEARNRECIPE,80)
    	else
        	Say (strTitle..": ng qu?n玭 n鉵g, kinh nghi謒 giang h?ngi c遪 k衜 l緈, c?g緉g th猰 nh?",0)
    	end
    end
end

function learnLtEquip()
	local nLevel = GetLifeSkillLevel(1, 3)
	if nLevel >= 79 then
    	AddRecipe(1114)
    	Msg2Player(format("Х h鋍 ph鑙 ch?m韎: %s", "Linh у Thi誹 L﹎ o"))
    	AddRecipe(1116)
    	Msg2Player(format("Х h鋍 ph鑙 ch?m韎: %s", "Linh у Thi誹 L﹎ Th"))
    	AddRecipe(1118)
    	Msg2Player(format("Х h鋍 ph鑙 ch?m韎: %s", "Linh у Nga My Ki誱"))
    	AddRecipe(1120)
    	Msg2Player(format("Х h鋍 ph鑙 ch?m韎: %s", "Linh у C竔 Bang Th"))
    	AddRecipe(1122)
    	Msg2Player(format("Х h鋍 ph鑙 ch?m韎: %s", "Linh у V?ng Ki誱"))
    	AddRecipe(1126)
    	Msg2Player(format("Х h鋍 ph鑙 ch?m韎: %s", "Linh у Ng?чc o"))
    	AddRecipe(1128)
    	Msg2Player(format("Х h鋍 ph鑙 ch?m韎: %s", "Linh у C玭 L玭 Ki誱"))
	else
    	Say(strTitle..": ng qu?n玭 n鉵g, kinh nghi謒 giang h?ngi c遪 k衜 l緈, c?g緉g th猰 nh?",0)
	end
end

--补学双刀配方
function luaLearnRecipeDdao()
		local nLevel = GetLifeSkillLevel(1, 3);
		if GetLifeSkillLevel(1, 3)>1 then
    if GetTask(LEV_LEARNRECIPE)==10 and HaveLearnRecipe(782)==0 then
    	AddRecipe(782)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? Li評 Di謕 Song o")
      AddRecipe(783)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? Nguy謙 Nha Th輈h")
    elseif GetTask(LEV_LEARNRECIPE)==20 and HaveLearnRecipe(782)==0 then
      AddRecipe(782)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? Li評 Di謕 Song o")
      AddRecipe(783)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? Nguy謙 Nha Th輈h")
      AddRecipe(784)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? цi Phi Th輈h")
      AddRecipe(785)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? H錸g 蕁 o")
    elseif GetTask(LEV_LEARNRECIPE)==30 and HaveLearnRecipe(782)==0 then
      AddRecipe(782)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? Li評 Di謕 Song o")
      AddRecipe(783)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? Nguy謙 Nha Th輈h")
      AddRecipe(784)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? цi Phi Th輈h")
      AddRecipe(785)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? H錸g 蕁 o")
      AddRecipe(786)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? Bi猲 B鴆 o")
      elseif GetTask(LEV_LEARNRECIPE)==40 and HaveLearnRecipe(782)==0 then
      AddRecipe(782)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? Li評 Di謕 Song o")
      AddRecipe(783)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? Nguy謙 Nha Th輈h")
      AddRecipe(784)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? цi Phi Th輈h")
      AddRecipe(785)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? H錸g 蕁 o")
      AddRecipe(786)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? Bi猲 B鴆 o")
      AddRecipe(787)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? N?H錸g")
      AddRecipe(788)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? B竜 Hoa")
      elseif GetTask(LEV_LEARNRECIPE)==50 and HaveLearnRecipe(782)==0 then
      AddRecipe(782)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? Li評 Di謕 Song o")
      AddRecipe(783)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? Nguy謙 Nha Th輈h")
      AddRecipe(784)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? цi Phi Th輈h")
      AddRecipe(785)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? H錸g 蕁 o")
      AddRecipe(786)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? Bi猲 B鴆 o")
      AddRecipe(787)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? N?H錸g")
      AddRecipe(788)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? B竜 Hoa")
      AddRecipe(789)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? Uy猲 Μng Li猲 Ho祅")
      elseif GetTask(LEV_LEARNRECIPE)==60 and HaveLearnRecipe(782)==0 then
      AddRecipe(782)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? Li評 Di謕 Song o")
      AddRecipe(783)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? Nguy謙 Nha Th輈h")
      AddRecipe(784)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? цi Phi Th輈h")
      AddRecipe(785)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? H錸g 蕁 o")
      AddRecipe(786)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? Bi猲 B鴆 o")
      AddRecipe(787)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? N?H錸g")
      AddRecipe(788)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? B竜 Hoa")
      AddRecipe(789)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? Uy猲 Μng Li猲 Ho祅")
      AddRecipe(790)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? Huy誸 Li猲 Ho祅")
      elseif GetTask(LEV_LEARNRECIPE)==70 and HaveLearnRecipe(782)==0 then
      AddRecipe(782)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? Li評 Di謕 Song o")
      AddRecipe(783)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? Nguy謙 Nha Th輈h")
      AddRecipe(784)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? цi Phi Th輈h")
      AddRecipe(785)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? H錸g 蕁 o")
      AddRecipe(786)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? Bi猲 B鴆 o")
      AddRecipe(787)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? N?H錸g")
      AddRecipe(788)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? B竜 Hoa")
      AddRecipe(789)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? Uy猲 Μng Li猲 Ho祅")
      AddRecipe(790)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? Huy誸 Li猲 Ho祅")
      AddRecipe(791)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? T玦 Nguy謙")
      elseif GetTask(LEV_LEARNRECIPE)==80 and HaveLearnRecipe(782)==0 then
      AddRecipe(782)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? Li評 Di謕 Song o")
      AddRecipe(783)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? Nguy謙 Nha Th輈h")
      AddRecipe(784)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? цi Phi Th輈h")
      AddRecipe(785)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? H錸g 蕁 o")
      AddRecipe(786)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? Bi猲 B鴆 o")
      AddRecipe(787)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? N?H錸g")
      AddRecipe(788)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? B竜 Hoa")
      AddRecipe(789)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? Uy猲 Μng Li猲 Ho祅")
      AddRecipe(790)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? Huy誸 Li猲 Ho祅")
      AddRecipe(791)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? T玦 Nguy謙")
      AddRecipe(792)
      Msg2Player("B筺 h鋍 頲 ph鑙 ch? 筺 Trng")
      end
     end
    end
      
--对技能的说明信息
function Weekend()
    if (GetLifeSkillLevel(1, 3) >= 1 and 
    	(CheckTime(0)==1 or CheckTime(5)==1 or CheckTime(6)==1)) then
    	Say(strTitle.."Ti襫 tuy課 chi課 tranh 竎 li謙, ta c?1 c竎h ch?t筼 v?kh?r蕋 c o, mu鑞 truy襫 th?cho ngi, ngi h穣 ch?t筼 v?kh?chi vi謓 cho ti襫 tuy課 gi髉  tri襲 nh!", 0)
    	AddRecipe(228)
    	Msg2Player("B筺 h鋍 頲 ph鑙 ch?- Qu﹏ d鬾g trng ki誱!")
    else
   		Say(strTitle.."Ngi v蒼 ch璦 h鋍 k?n╪g Ch?t筼 binh kh?ng緉 ho芻 ch璦  kinh nghi謒, ta kh玭g th?truy襫 th?c竎h ph鑙 ch?n祔.", 0)
    end
end


--添加物信息
function Dating()
	Talk(1,"",strTitle.."如果要创建无与伦比的武器，则需要添加更多的添加剂，并尝试添加一些好的材料，也许您会伪造独特的武器.")
end

--取消函数
function SayHello()
end

function task_new3()
	talk_IV();
end

function bagua()
	Say("<color=red>Trang b?b竧 qu竔<color>l?huynh  M筩 gia ta v?l穙 L璾 ?Tng Dng, C萴 Nng  to祅 l鵦 c飊g nhau nghi猲 c鴘 ra t﹎ huy誸. L祄 th?n祇 nh薾 頲 nh鱪g m鉵 c?linh th筩h ngi 甶 h醝 truy襫 nh﹏ s?r? n誹 ngi mu鑞 t譵 hi觰 l祄 th?n祇 ch?t筼 頲 <color=yellow>trang b?color> kh秏 linh th筩h, th?n ch?ta t譵 hi觰 nh?",
	4,
	"L祄 sao ch?t筼 trang b?c?l?kh秏 n筸/kongzhuangbeizhizuo",
	"V藅 ph萴 th猰 v祇 c?t竎 d鬾g g?tianjiawu",
	"L祄 sao trang b?頲 ch?t筼 th祅h trang b?B竧 Qu竔/xiangqianzhuyi",
	"дn h醝 th╩ th玦 m?/SayHello"
	)
end

function kongzhuangbeizhizuo()
	Talk(1,"",strTitle.."R蕋 n gi秐, qua nghi猲 c鴘 c馻 b鋘 ta, c秈 ti課 phng ph竝 ch?t筼 ta truy襫 th?cho c竎 ngi, b﹜ gi?ngi 產ng thu th藀 nguy猲 li謚 ?khu v鵦 thu th藀, nh鱪g trang b?ch?t筼 ra c?m鴆 linh kh?t鑙 產 v?c?th?c?l?kh秏 n筸, nh璶g m?c騨g ch輓h v?v藋, nh鱪g trang b?c?thu閏 t輓h linh kh?kh玭g c遪 ch?t筼 頲 n鱝.")
end

function tianjiawu()
	Talk(1,"",strTitle.."V筺 v藅 tr猲 th?gian u c?gi?tr?ri猲g, gi?tr?t飝 v祇 linh kh?輙 hay nhi襲, khi ch?t筼 trang b?t╪g v藅 ph萴 th猰 v祇, c?th?t╪g m鴆 linh kh?t鑙 產 v?t╪g s?l?kh秏 n筸 linh th筩h tr猲 trang b? M鴆 linh kh?t鑙 產 c馻 trang b?quy誸 nh m鴆 linh kh? kh秏 n筸 linh th筩h, v?s?l?quy誸 nh n?c?th?kh秏 bao nhi猽 linh th筩h, c?th?th祅h thu閏 t輓h b竧 qu竔 hay kh玭g, cho n猲 n誹 頲 th?c?g緉g th猰 v礽 v藅 c?gi?tr?")
end

function xiangqianzhuyi()
	Talk(1,"",strTitle.."?tr猲  nh綾 n r錳, tr猲 trang b?c?m鴆 linh kh?t鑙 產 v?l?kh秏 n筸, 1 trang b?kh秏 <color=yellow>3 vi猲<color> linh th筩h, khi m鴆 linh kh?c馻 3 vi猲 linh th筩h b籲g v韎 m鴆 linh kh?t鑙 產 c馻 trang b? s?h譶h th祅h trang b?thu閏 t輓h b竧 qu竔. Linh th筩h l?s?l?th?m鴆 linh kh?﹎, Linh th筩h l?s?ch絥 th?m鴆 linh kh?dng, n誹 th?t?Linh Th筩h 頲 kh秏 kh玭g gi鑞g nhau, th?trang b?c?thu閏 t輓h b竧 qu竔 kh竎 nhau, tr猲 \'B竧 qu竔 B秓 觧\' d祅h cho h藆 du?c馻 C玭g D?Th?Gian c?ghi r蕋 r?l祄 th?n祇  ch?t筼 1 trang b?c?thu閏 t輓h b竧 qu竔 mong mu鑞, c?th阨 gian th?xem.")
end
function xinwuqi()
	local nLevel = GetLifeSkillLevel(1, 3)
	if (GetLifeSkillLevel(1, 3) > 1) then
		if (GetTask(LEV_LEARNRECIPE) == 80 and HaveLearnRecipe(1007) == 0) then
        	AddRecipe(1003)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch? V筺 nh蒼")
        	AddRecipe(1004)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch? H醓 Tinh")
        	AddRecipe(1014)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch? L╪g Phong")
        	AddRecipe(1007)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch? C?лnh") 
       else
        	Say(strTitle.."嘿，年轻人，别急，您的素质现在很差，等着您掌握所有常用的长武器，然后来找我.",0)
    end
end
end

function update_max_skill_level()
	Say(strTitle..format("扩大生产技能水平要求收集技能达到79级并消耗 %d 金", 1000), 
		2, "是的/update_max_skill_level_ensure", "不了/SayHello")
end

function update_max_skill_level_ensure()
	if GetLifeSkillLevel(1, 3) < 79 then
		Talk(1,"",format("Hi謓 t筰 c蕄 k?n╪g s秐 xu蕋 ch璦 t c蕄 %d, kh玭g th?m?r閚g c蕄 gi韎 h筺 k?n╪g", 79));
		return 0;
	end
	if Pay(1000 * 10000) ~= 1 then
		Say(strTitle..format("Ng﹏ lng kh玭g  %d 金", 1000), 0);
		return 0;
	end
	SetLifeSkillMaxLevel(1, 3, 99);
	Msg2Player("Ch骳 m鮪g c蕄 gi韎 h筺 k?n╪g s秐 xu蕋  t c蕄 99");
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end

