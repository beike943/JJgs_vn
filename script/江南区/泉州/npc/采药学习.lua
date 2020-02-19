-- =========================================
-- File : 中原一区，汴京，采药学习.lua
-- Name : 林药师
-- ID   : 0, 4
-- =========================================
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");

--*****************************************定义常量及预处理***************************************
ID_LEARNLIFESKILL	= 1925		-- 配方学习任务变量
LEVELTASKID49		= 516		-- 回龙转凤羹
TASK49_BEGGING		= 1933		-- 49级晋级任务开始标示
FORGETMAIN_NUM		= 1940		-- 遗忘主技能次数
FORGETOHTER_NUM		= 1941		-- 遗忘主技能次数

strName = "";
strTitle = "";

--*****************************************MAIN函数*****************************************
function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","Х qu?5 gi?ch琲, h穣 ngh?ng琲  gi?g譶 s鴆 kh醗!")
	 	return
	 end
	strName = GetTargetNpcName()
	if (strName == "" or strName == nil) then 
		return 
	end
	strTitle = "<color=green>"..strName.."<color>: "
	
	-----------------------------------------新手任务-----------------------------------------
    if (GetTask(ID_LEARNLIFESKILL) < 15) then
        Say(strTitle.."等<color=yellow>10 级<color> 后去<color=yellow>成都<color> 找 <color=yellow>游方医生<color> 开启 <color=yellow>生活技能任务<color>!", 0)
        TaskTip("10级后去成都找游方医生.")       
        return 
    end
    
	--提示玩家76级武器配方任务
	local nGene,nSKIllId = GetMainLifeSkill()
	local nMainLevel = GetLifeSkillLevel(nGene, nSKIllId)
	if (nGene == 1 and nMainLevel >= 79 and 
		GetTask(1600) == 0 and GetTask(1602) == 0 and 
		GetTask(1603) == 0 and GetTask(1604) == 0 and 
		GetTask(1605) == 0) then 
		weapon_76_recipe_tip(nSKIllId);
		return
	end	

---------------------------------------------主对话-------------------------------------------
    Say(strTitle.."我只会采药，你想干？!",
		6,
		"学习采集技能./luaLearnLifeSkill",
		"去采集地图1/GotoWorld_Confirm1",
		"去采集地图2/GotoWorld_Confirm2",
		"去采集地图3/GotoWorld_Confirm3",
		"遗忘采药技能/forget_life_skill",
		"介绍相关信息/Info",
		"没事了/Main_Exit");
end;

-- 遗忘生活技能
function forget_life_skill()
	if (GetLifeSkillLevel(0, 4) > 0) then
		local nForgetTimes = GetTask(FORGETOHTER_NUM)	-- 辅技能
		local nShouldPay = 5000
		if (nForgetTimes == 0) then
			nShouldPay = 5
		elseif (nForgetTimes == 1) then
			nShouldPay = 50
		elseif (nForgetTimes == 2) then
			nShouldPay = 500
		end
	
		Say(strTitle.."不想采集了？"..(nForgetTimes + 1)..", ngi h駓 k?n╪g thu th藀, ta ph秈 thu"..nShouldPay.." lng, ngi suy ngh?k?ch璦?",
			2,
			"不想干了，忘了吧/forget_now",
			"再想想/SayHello")
	else
		Say(strTitle.."你本来也不会采集啊，别来我这捣乱!", 0)
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
	
	if (GetLifeSkillLevel(0, 4) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(0, 4)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETOHTER_NUM, nForgetTimes + 1)
				SetTask(LEVELTASKID49, 0)
				Msg2Player("忘了采集技能")				
			end
		else
			Say(strTitle.."忘了采集技能", 0)
		end
	end
end;



--**********************************************技能学习部分***************************************
-- 学习生活技能
function luaLearnLifeSkill()
    if (GetLevel() < 10) then
        Say (strTitle.."10级以下的人我不教！", 0)
		return
	end

	-- 判断是否已经学会了采集技能 - 采药
	if (GetLifeSkillLevel(0, 4) > 0) then
        Say (strTitle.."你已经学会了啊", 0)
		return
	end

	if GetLifeSkillsNum(0)>=2 then
        Say (strTitle.."你已经学了两个采集技能了，再学多累啊",0)
		return
	end
	
	Say(strTitle.."确定要学习<color=yellow>采集<color>吗？",
    	2,
    	"我要学习/LearnYes",
    	"啊，不学了/LearnNo")
end;
--学习技能
function LearnYes()
	if (GetLifeSkillLevel(0, 4) > 0) then
		Say (strTitle.."Ngi  h鋍 頲 t蕋 c?k?n╪g h竔 thu鑓!", 0)
	else
		if (LearnLifeSkill(0, 4, 1, 79, 0)) then
			AddItem(0, 200, 16, 1, 1)
        	Msg2Player("已经学会啦！")
    	end
	end
end;
--取消学习技能
function LearnNo()
    Say (strTitle.."不学是对的", 0)
end;



-- 确认去相应挂机地点=====================================================================
function GotoWorld_Confirm1()
	Say(strTitle.."去采集地图1？ <color=yellow>Nam H遝 c鑓<color> 这里有 <color=yellow>Ba u<color>, <color=yellow>T祅g H錸g Hoa<color>, <color=yellow>C竧 C竛h<color> v?<color=yellow>Ho祅g li猲<color>. Nh?mang theo <color=yellow>Cu鑓 thu鑓<color>!",
		2,
		"现在就去/#GotoWorld(714, 1511, 3004)",
		"先不去了/Main_Exit");
end;
function GotoWorld_Confirm2()
	Say(strTitle.."去采集地图2？ <color=yellow>H祄 U c鑓<color> 这里有 <color=yellow>X竎 ve<color>, <color=yellow>襫 th蕋<color> v?<color=yellow>Xuy猲 s琻 gi竝<color>. Nh?mang theo <color=yellow>Cu鑓 thu鑓<color>!",
		2,
		"现在就去/#GotoWorld(719, 1708, 3396)",
		"先不去了/Main_Exit");
end;
function GotoWorld_Confirm3()
	Say(strTitle.."去采集地图3？<color=yellow>Hi猲 Vi猲 c鑓<color> 这里有 <color=yellow>X?hng<color>, <color=yellow>gan g蕌<color> v?<color=yellow>Nh﹏ s﹎<color>. Nh?l蕐 <color=yellow>cu鑓 thu鑓<color> m韎 c?th?h竔 thu鑓!",	2,
		"现在就去/#GotoWorld(724, 1721, 3386)",
		"先不去了/Main_Exit");
end;
-- 去相应的挂机地点
function GotoWorld(MapID, x, y)
		CleanInteractive()
		LeaveTeam()
		SetFightState(0)
				
		NewWorld(MapID,x,y)
end;


-- 介绍相关信息
function Info()
	--Say(strTitle.."<color=yellow>H竔 thu鑓<color> l?m閠 trong <color=yellow>6<color> k?n╪g thu th藀 trong h?th鑞g k?n╪g s鑞g. H鋍 頲 k?n╪g n祔 c?th?nh薾 頲 v藅 li謚 <color=yellow>luy謓 n<color>. Ngi c?th?n <color=yellow>ti謒 t筽 h鉧<color> mua c玭g c?h竔 thu鑓 <color=yellow>s?c蕄<color>  l猲 n骾 t譵 thu鑓!", 0);
	Say(strTitle.."<color=yellow>采集是门艺术，别的我就不多说了。<color>", 0);

end;

-- 什么也不做的空函数
function Main_Exit()
end;

