--任务
--地点：汴京府  任务：天门阵任务结点6
--策划：樊万松  2004.03.
--append by lizhi
--2005-8-8 11:26

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_汴京\\task_main.lua");
Include("\\script\\task\\faction\\faction_main_ym.lua");
Include("\\script\\task\\faction\\faction_head.lua");
Include("\\script\\task\\practice\\practice_main.lua");
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- 师门任务链的头文件
Include("\\script\\结婚\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\online\\callbackplayer\\callbackplayer_head.lua");--召回老玩家活动
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
szNpcName  = "<color=green>杨门太君<color=green> : "
function main()
	local nTaskValue = FN_GetTaskState(FN_YM);
	local nTaskValuem = FN_GetTaskState(FN_YMM);
	  
	if (GetSex() == 1) then
		if ((nTaskValue > 0) and (nTaskValue < 7)) then
			Say("你去找 <color=yellow>杨宗保<color> 吧!",0);
			return
		end;
		if (nTaskValue == 7) then 
			task_115();
			return
		end;
		if (nTaskValue>=9) then
			fix_ym();
			return
	    end;
	end;
		
	if (GetSex() == 2) then
		if ((nTaskValuem > 0) and (nTaskValuem < 7)) then
			Say("你去找 <color=yellow>穆桂英<color> 吧!",0);
			return		
		end;
		if (nTaskValuem == 7) then 
			task_015();
			return
		end;
	    if (nTaskValuem>=9) then
			fix_ym();
			return
		end;
	end; 
	main_new();
end;

-- 师门任务相关
function about_faction_task()
	Say("C? chuy謓 g? v藋?",
		3,
		"我想进行师门任务/start_faction_tasklink",
		"我想查阅师门贡献度./check_query_faction_contri",
		"师门任务说明./shimenshuoming")
--		"我要修复师门任务无法完成的问题/repair_faction_bug")
end;

-- 修复杀怪任务无法完成的bug
function repair_faction_bug()
	Say("最近很忙, 我忘记完成任务了. 这次我就帮你取消,但是你要扣除5点师门贡献度，你确定吗?", 
		2,
		"是的，我同意/confirm_repair_bug",
		"我再想想/no")
end;

function confirm_repair_bug()
	RepairAllChainTask()
	Say("已经取消了!", 0)
end;

--天门阵任务与汴京任务接口
function sayhi()
  local nBjStep = GetTask(TASK_BJ_ID);    --汴京任务
  local UWorld1401 = GetTask(1401);
    
    if nBjStep >= 1 and nBjStep<=6 and UWorld1401 ~= 0 then
        local szSay = {
            "<sex> 找我有什么事吗?",
            "汴京任务/bj_question",
            "天门阵任务/tmz_question"
        }
        SelectSay(szSay);
        return
    end;
    
    if nBjStep >= 1 and nBjStep<=6 then
        bj_question();
        return
    end;
    
    if UWorld1401 ~= 0 then
        tmz_question();
        return
    end;
    --Talk(1,"","<color=green>佘太君<color>：契丹夜郎自大，岂容他踏入我大宋疆土！");     
end;



function bj_question()
    local nBjStep = 0;
    nBjStep = GetTask(TASK_BJ_ID);  --汴京系列任务的任务变量
    
    if (nBjStep == 1) then
        task_001_00();
        return
    elseif (nBjStep == 2) then
        task_002_00();
        return
    elseif (nBjStep == 3) then
        task_003_00();
        return
    elseif (nBjStep == 4) then
        task_004_01();
        return
    elseif (nBjStep == 5) then
        task_005_00();
        return
    elseif (nBjStep == 6) then
        task_006_00();
        return
    else
    	Talk(1,"","契丹夜郎自大，岂容他踏入我大宋疆土!")
    end;
end;

function tmz_question() --天门阵任务
    local UWorld1401 = GetTask(1401);
    if ( UWorld1401 == 40 )  then
    	Talk(6,"","T筰 h? v蕁 an Xa L穙 Th竔 Qu﹏!","Kh?! Kh?!  t?! Xin h醝 anh h飊g c? g? ch? gi竜!","T? nh? t筰 h? v鑞 s飊g k輓h Dng tng qu﹏, nay mu鑞 b竜 danh gia nh藀 Dng Gia qu﹏ gi誸 gi芻 Khi誸 n. N祇 ng? b? bi謙 ph竔 n Lng S琻 B筩, xin L穙 Th竔 Qu﹏ ph竔 t筰 h? n Nh筺 M玭 quan ti襫 tuy課!","H?! Chuy謓 n祔 d? th玦! Chuy謓 c馻 Dng Gia qu﹏, l穙 y c? th? t? quy誸! C? n鉯 l? ta ph竔 ngi 甶 s? d? d祅g u qu﹏!","Ti謓 th? ngi chuy觧 l阨 cho phu qu﹏ <color=red>Dng Nghi謕<color> c馻 ta ? <color=red>Nh筺 M玭 quan<color> r籲g: Ti觰 nh﹏ l閚g quy襫, h? t蕋 ph秈 ph? t礽."," t? L穙 Th竔 Qu﹏ chi誹 c?! Ti觰 nh﹏ nh蕋 nh chuy觧 l阨!")
        SetTask(1401,45)
        ----AddItem(0,0,0)
        Earn(1000)
        GivePlayerExp(SkeyTianmenzhen,"setaijun")
        ModifyReputation(12,0)
        --AddNote("去雁门关找杨业，为佘太君带话，并且打听山河社稷图的情报。")
        TaskTip("去雁门关找杨业，为佘太君带话，并且打听山河社稷图的情报!")
    	
    elseif ( UWorld1401  == 45  ) then
    		Talk(1,"","为佘太君带话给<color=red>杨业<color> ở <color=red>雁门关<color>!")	
    elseif ( UWorld1401  > 45  ) then
    	Talk(1,""," t? b籲g h鱱!")
    else
    	Talk(1,"","契丹夜郎自大，岂容他踏入我大宋疆土!")
    end
end;	
	
	
	
	
	
--end;

function intertangmen()		--加入门派
	if (GetTask(1001)>0) or (GetTask(1002)>0) or (GetTask(1003)>0) or (GetTask(1004)>0) or (GetTask(1005)>0)  or (GetTask(1033)>0) then
		Say("你已加入门派! 无法再加入杨门!",0)
	elseif GetLevel() < 10 then	  --等级检测
		Say("想加入杨门必须具备一定实力.你还没到 <color=yellow>10级<color> 如何为国效力! 10级之后再来找我!",0)
	elseif GetPlayerFaction() == 6 then	--门派检测
		Say("你已加入杨门, 还想干什么?",0)
	elseif GetPlayerFaction() > 0 then	--门派检测
		Say("你已加入门派! 无法再加入杨门!",0)
	else
	  if GetSex()==2 then
		task_001();
		end;
		if GetSex()==1 then
		task_101();
		return
	  end
   end
end

function skilllearn()
	if GetPlayerFaction() ~= 6 then		--不是杨门弟子
		Say("你不是杨门弟子, 这是我天波杨府的事，不要多管闲事!",0)
	elseif  GetPlayerRoute() == 16 then 	--是杨门弟子但是还没有去拜师
		Say("天波杨府擅长精通马上战斗, 杨家军名闻天下. 如果你想学习<color=yellow>杨门枪术<color> 就去找<color=yellow>杨宗保<color>; 如果你想学习 <color=yellow>杨门弓术<color> 就去找<color=yellow>穆桂英<color>.",0)
	elseif  GetPlayerRoute() == 17 then
		Say("你想学 <color=yellow>杨门枪法<color>, 找枪法师傅 <color=yellow>杨宗保<color>.",0)
	elseif  GetPlayerRoute() == 18 then
		Say("你想学<color=yellow>杨门弓法<color>, 找弓法师傅<color=yellow>穆桂英<color>.",0)	
	end
end;
		

function gettask()
	if GetPlayerFaction() ~= 6 then
		Say("你不是杨门弟子, 这是我天波杨府的事，不要多管闲事!",0)
	else
		taskmain("Xa Th竔 Qu﹏", 5)
	end
end;				


function no()
--	Say("<color=green>佘太君<color>：fuck u！")
end;

function practice()
    if GetPlayerFaction() ~= 6 then
       Talk(1,"","你不是杨门弟子, 这是我天波杨府的事，不要多管闲事!");
    else
        if GetItemCount(2, 0, 350) >= 1 then  --师门令牌
            Say("你想进行训练吗?",2,"对/practice_start","Sai/no");
        else
            Talk(1,"","你没有<color=yellow>杨门令牌<color>, 无法进行训练.");
        end;
    end;
end;

-- 杨门师门重复任务的入口
function start_faction_tasklink()
	if (GetPlayerFaction() ~= 6) then						--不是杨门弟子
		Say("不是杨门弟子, 杨门的事你还是少打听为妙!", 0)
	elseif (GetPlayerRoute() == 16) then 					--是杨门弟子但是还没有去拜师
		Say("你去拜师后再来找我!", 0)
	elseif (GetPlayerRoute() == 17) then
		task_main_entrance(TASK_ID_YANGMEN_QIANGQI);		-- 枪骑
	elseif (GetPlayerRoute() == 18) then
		task_main_entrance(TASK_ID_YANGMEN_GONGQI);			-- 弓骑
	end
end;

function shimenshuoming()
		Say("<color=green>Thuy誸 minh  c鑞g hi課 s? m玭<color>: \n <color=yellow>ч c鑞g hi課 s? m玭<color>: Th玭g qua vi謈 ho祅 th祅h nhi謒 v? S? M玭 t n m閠 ng c蕄 nh蕋 nh, b筺 c? th? nh薾 頲 trang ph鬰 ho芻 v? kh? c馻 S? M玭. \n <color=yellow>Gi韎 h筺  c鑞g hi課 s? m玭<color>: Hi謓 nay  c鑞g hi課 S? M玭 kh玭g b? h筺 ch?, ch? c莕 ho祅 th祅h nhi謒 v? th? c? th? n﹏g cao  c鑞g hi課. \n <color=yellow>S? ki謓 V? L﹎<color>: L祄 xong nhi謒 v? c? nh s? nh薾 th猰 m閠 nhi謒 v? ng蓇 nhi猲, ho祅 th祅h s? nh薾 頲 50 甶觤 c鑞g hi課 S? m玭 v? c? kh? n╪g nh薾 頲 m藅 t辌h s? m玭.", 
			1,
			"Trang k?/shuoming2")		
end;

function shuoming2()
		Say("<color=green>Thuy誸 minh  c鑞g hi課 s? m玭<color>: \n <color=yellow>Gi韎 h筺 ng c蕄  c鑞g hi課 S? M玭<color>: Ъng c蕄 kh竎 nhau th? 甶觤 t輈h l騳  c鑞g hi課 c騨g kh玭g gi鑞g nhau. ч c鑞g hi課 S? M玭 c祅g cao c祅g n﹏g cao ng c蕄 c馻 m譶h, t? sau c蕄 75 th? kh玭g c遪 gi韎 h筺  c鑞g hi課 n鱝. \n <color=yellow>觤 kinh nghi謒 ng蓇 nhi猲<color>. L祄 nhi襲 nhi謒 v? s? m玭  c鑞g hi課 c祅g cao 甶觤 kinh nghi謒 c祅g nhi襲. 觤 c鑞g hi課 <3000 <color=yellow>觤 kinh nghi謒 tng i<color>, >3000 <color=yellow>甶觤 kinh nghi謒 c祅g nhi襲<color>.", 0);
end

function check_query_faction_contri()

	if (GetPlayerFaction() == 0) then	-- 没有加入门派
		Say("Mu鑞 l祄 nhi謒 v? s? m玭 trc ti猲 ph秈 gia nh藀 b鎛 gi竜. Sau  h穣 gia nh藀 trng ph竔, r錳 quay l筰 ch? ta nh薾 nhi謒 v?. Sau khi ho祅 th祅h nhi謒 v? s? m玭 s? nh薾 頲  c鑞g hi課 s? m玭, t輈h l騳  c鑞g hi課 nh蕋 nh c? th? mua v藅 ph萴 b? truy襫 b鎛 m玭.", 0)
		return
	end
	
	if (GetPlayerFaction() ~= 6) then	-- 不是本门弟子
		Say("Ngi kh玭g ph秈 l?  t? c馻 b鎛 gi竜, h穣 v? m玭 ph竔 c馻 ngi m? tra xem  c鑞g hi課 s? m玭 nh?. Giao di謓 F3 c騨g c? th? tra xem  c鑞g hi課 s? m玭.", 0)
		return
	end
	
	query_faction_contribute()
	
end;
--========================================================================================
g_szInfoHead = "<color=green>佘太君<color>:";
g_tbColorInfo = 
{
	{"{","}","yellow"},
};
--新的入口
function main_new()
	local selTab = {
				"天波杨府起源/know_qiyuan",
				"天波杨府武功/know_wugong",
				"入门条件/know_rumentiaojian",
				"加入天波杨府/intertangmen",
				"帮派任务介绍/about_faction_task",
				"闭关修炼/practice",
				"我打算成亲，我想出师/#faction_graduate(6)",
				"打个招呼/sayhi",
				}
	if (GetPlayerRoute() == 17) or  (GetPlayerRoute() == 18) then
		tinsert(selTab, 1, "Nhi謒 v? Chuy觧 Sinh - C秈 L穙 Ho祅 уng/trans_talk_32");
	end
--	tinsert(selTab,8,"武林争霸战相关/wulin_zhengba");			
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 091113 and nDate < 091130 then
		tinsert(selTab, 1, "е t? xin k輓h d﹏g s? ph? tr? hoa c骳 v? b竛h b竎h hoa!/#GiveItemToMaster(\""..g_szInfoHead.."\", 6)");
	end
	Say(g_szInfoHead.."Thi猲 Ba Dng ph?, trung ngh躠 ki猲 cng, h誸 l遪g v? Чi T鑞g.",getn(selTab),selTab);
end;

function know_qiyuan()
	Talk(1,"main_new",g_szInfoHead.."宋太宗太平兴国四年，宋灭北汉，令公归宋，封为大将军，扼守雁门关。太平兴国五年，辽派十万大军攻打雁门关，当时令公手下兵马只有几千，采取请君入瓮之策包围奇袭，大破十万辽军，雁门关大捷，令公威名远播，至此辽国看见杨家战旗，闻风丧胆。天波杨府名扬天下。.");
end;

function know_wugong()
	Talk(2,"main_new",g_szInfoHead..sf_ConvertColorString("杨家演武校场，分为枪骑、弓骑两军，必须骑马攻击 (马匹在杨排风处可以购得)。 枪骑军讲究力量爆发, 杨家枪法可近身刺打、可远距离迅猛冲杀,招式刚劲勇猛杀伤力极大, 以大面积伤敌见长,一杆长枪闯军来去如风, 可学镇派武功 {连环钻龙枪}。弓骑军讲求身法速度, 可快速发箭连射敌人,又可全力射出致命一击,以远程压制见长, 可学镇派武功 {霸王翔凤箭}."),g_szInfoHead..sf_ConvertColorString("枪骑的授业师傅是枪骑教头{杨宗保}, 弓骑的授业师傅是弓骑教头{穆桂英}."));
end;

function know_rumentiaojian()
	Talk(1,"main_new",g_szInfoHead.."不限男女,品行端正, 没有加入其它门派,非本军叛徒即可参军.我军报效家国,效忠朝廷, 维护天下苍生，参军者谨记以此为志.");
end;