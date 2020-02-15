--在唐楚红处加入少林，接师门任务
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- 师门任务链的头文件
Include("\\script\\task\\faction\\faction_main_tm.lua"); -- 唐门师门任务的脚本头文件
Include("\\script\\task\\practice\\practice_main.lua"); --修炼的脚本
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");--76级武器生活技能任务脚本
Include("\\script\\结婚\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\online\\callbackplayer\\callbackplayer_head.lua");--召回老玩家活动
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
szNpcName = "<color=green>Л阯g M玭 Gi竜 Ch? <color>: "
function main()

local nTaskValue = FN_GetTaskState(FN_TM)
local nSkillGenre,nSkillDetail = GetMainLifeSkill() 

	--76级武器配方学习任务
	if GetTask(1600) == 2 and GetBit(GetTask(TASK_76WEAPON_TALK),4) ~= 1 then
		weapon_76_talk(4,nSkillDetail)
		return
	end

	if (nTaskValue==7) then
		
		task_012();
		return
	elseif (nTaskValue >= 9) then
		fix_tm();
		return
	elseif ((nTaskValue > 0) and (nTaskValue < 7)) then
		Say("Ngi 甶 t譵 <color=yellow>Thi猲 Ti誹<color>, y s? an b礽 m鋓 vi謈 cho ngi c騨g nh?  L穙 l穙 th蕐 l遪g <color=yellow>trung th祅h<color> c馻 ngi th? n祇.",0);
		return
	else
		main_new();
	end
end;

-- 师门任务相关
function about_faction_task()
	Say("想做什么？",
		3,
		"开始师门任务/start_faction_tasklink",
		"师门贡献度查阅./check_query_faction_contri",
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

function intertangmen()		--加入门派
	if (GetTask(1001)>0) or (GetTask(1002)>0) or (GetTask(1003)>0) or (GetTask(1004)>0) or (GetTask(1031)>0) or (GetTask(1032)>0) or (GetTask(1033)>0) then
			Say("你已加入门派，无法再加入丐帮!",0)
	elseif GetLevel() < 10 then	--等级检测
		Say("想加入唐门必须具备一定实力.你还没到<color=yellow>10级<color> ，10级之后再来找我!",0)；
	elseif GetPlayerFaction() == 4 then	
		Say("你已加入唐门, 还想干什么?",0)；
	elseif GetPlayerFaction() > 0 then	
		Say("你已加入门派! 无法再加入唐门",0)；
	else
		task_001();
		return
	end
end;


function skilllearn()
	if GetPlayerFaction() ~= 5 then		--不是唐门弟子
		Say("Ngi kh玭g ph秈  t? b鎛 m玭, tuy謙 h鋍 gia truy襫 l? n祇 l筰  ngi bi誸 頲.",0)
	elseif  GetPlayerRoute() == 5 then 	--是唐门弟子但是还没有去拜师
		Say("Ta gi? r錳! Vi謈 truy襫 th? v? c玭g chi b籲g h穣 n t譵 <color=yellow>Thi猲 Ti誹<color> 甶! g ta m韎 l? t鎛g qu秐 c馻 Л阯g M玭.",0)
	else  	--唐门弟子，且已经拜师
		Say("Mu鑞 h鋍 v? c玭g h穣 t譵 <color=yellow>Thi猲 Ti誹<color> l祄 <color=yellow>Nhi謒 v?<color> m韎 n t譵 ta.",0)
	end
end;
		

function gettask()
	if GetPlayerFaction() ~= 5 then
		Say("Ngi kh玭g ph秈  t? Л阯g M玭, chuy謓 c馻 Л阯g M玭 kh玭g th? cho ngi bi誸 頲.",0)
	else
		taskmain("Л阯g S? H錸g", 5)
	end
end;				


function no()
end;

function practice()
    if GetPlayerFaction() ~= 5 then
       Talk(1,"","Ngi kh玭g ph秈 l?  t? Л阯g M玭! Kh玭g th? tu luy謓 ? y.");
    else
        if GetItemCount(2, 0, 209) >= 1 then  --师门令牌
            Say("Mu鑞 v祇 y tu luy謓?",2,"ng/practice_start","Sai/no");
        else
            Talk(1,"","Ngi kh玭g c? <color=yellow>L謓h b礽 Л阯g M玭<color>, kh玭g th? v祇 y b? quan tu luy謓.");
        end;
    end;
end;

-- 唐门师门重复任务入口
function start_faction_tasklink()
	if (GetPlayerFaction() ~= 5) then		--不是唐门弟子
		Say("Ngi kh玭g ph秈 l?  t? Л阯g M玭, nhi謒 v? m玭 ph竔 sao c? th?  ngi l祄!", 0)
	elseif (GetPlayerRoute() == 5) then 	--是唐门弟子但是还没有去拜师
		Say("H穣 t譵 Thi猲 Ti誹 t鎛g qu秐 h鋍 v? c玭g trc r錳 quay l筰 y nh薾 nhi謒 v?.", 0)
	else  	--唐门弟子，且已经拜师
		task_main_entrance(TASK_ID_TANGMEN);
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
	
	if (GetPlayerFaction() ~= 5) then	-- 不是本门弟子
		Say("Ngi kh玭g ph秈 l?  t? c馻 b鎛 gi竜, h穣 v? m玭 ph竔 c馻 ngi m? tra xem  c鑞g hi課 s? m玭 nh?. Giao di謓 F3 c騨g c? th? tra xem  c鑞g hi課 s? m玭.", 0)
		return
	end
	
	query_faction_contribute()
	
end;
--========================================================================================
g_szInfoHead = "<color=green>Л阯g S? H錸g<color>:";
g_tbColorInfo = 
{
	{"{","}","yellow"},
};
--新的入口
function main_new()
	local selTab = {
				"唐门起源/know_qiyuan",
				"唐门武功/know_wugong",
				"入门条件/know_rumentiaojian",
				"加入唐门/intertangmen",
				"师门任务介绍/about_faction_task",
				"闭关修炼/practice",
				"我打算成亲，我想出师/#faction_graduate(5)",
				"打个招呼/no",
				}
	if (GetPlayerRoute() == 6)  then
		tinsert(selTab, 1, "Nhi謒 v? Chuy觧 Sinh - C秈 L穙 Ho祅 уng/trans_talk_32");
	end
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 091106 and nDate <= 091112 then
		tinsert(selTab, 1, "е t? xin k輓h d﹏g s? ph? tr? hoa c骳 v? b竛h b竎h hoa!/#GiveItemToMaster(\""..g_szInfoHead.."\", 5)");
	end
--	tinsert(selTab,8,"武林争霸战相关/wulin_zhengba");		
	Say(g_szInfoHead.."Л阯g M玭 kh玭g ph秈 l? n琲 c? th? tu? ti謓 ra v祇, c? chuy謓 g? mau n鉯 甶, n誹 kh玭g th? m阨 l飅 bc!",getn(selTab),selTab);
end;

function know_qiyuan()
	Talk(1,"main_new",g_szInfoHead.."Л阯g M玭 thu閏 t Th鬰,  m蕐 tr╩ n╩ h飊g c? t筰 t Th鬰, n鎖 ti課g tr猲 v? l﹎ v? 4 m玭: ho? kh?, 竚 kh?, c筸 b蓎, d飊g c. Л阯g M玭 a linh nh﹏ ki謙, r蕋 gi醝 thi誸 k?, ph竧 minh c竎 lo筰 竚 kh? v? c? quan m韎, c? uy l鵦 kinh ngi. V? Л阯g M玭 r蕋 hi誱 khi h祅h t萿 giang h?, n琲 ? l筰 tr祅 ng藀 c? quan, 竚 kh?, kh? x﹎ nh藀, cho n猲 Л阯g M玭 tuy c? danh ti課g tr猲 giang h?, nh璶g kh玭g mu鑞 cho ngi kh竎 nh譶 th蕐 khu玭 m苩 c馻 m譶h. Kh玭g mu鑞 k誸 giao v韎 danh m玭 ch輓h ph竔, c騨g kh玭g giao du v韎 t? ma ngo筰 o, thi謓 竎 tu? t﹎, t? do t? t筰.");
end;

function know_wugong()
	Talk(2,"main_new",g_szInfoHead..sf_ConvertColorString("V? c玭g Л阯g M玭 kh玭g chia h? ph竔, v? cho d? l? 竚 kh?, c? quan hay d飊g c, u c? m鑙 li猲 h? ch苩 ch? v韎 nhau. Л阯g M玭 th﹏ ph竝 nhanh nh裯, k? thu藅 tinh x秓, s? d鬾g c? quan, 竚 kh? t萴 c c? th? khi課 cho k? ch r琲 v祇 tr筺g th竔 x蕌, h筺 ch? h祅h ng c馻 k? ch, c? th? h鋍 頲 v? c玭g tr蕁 ph竔 H蕄 Tinh Tr薾."),g_szInfoHead..sf_ConvertColorString("Л阯g M玭 th? nghi謕 s? ph? l? t鎛g qu秐 Л阯g Thi猲 Ti誹."));
end;

function know_rumentiaojian()
	Talk(1,"main_new",g_szInfoHead.."Kh玭g gi韎 h筺 nam n?. Tuy kh玭g ph秈 l? danh m玭 ch輓h ph竔, nh璶g Л阯g M玭 c騨g r蕋 gh衪 b鋘 ti觰 nh﹏ b? 鎖. Nh鱪g ai ch璦 gia nh藀 m玭 ph竔, kh玭g ph秈 l? ph秐  c馻 b秐 ph竔 u c? th? gia nh藀. 'Th? 甶 g苝 Di猰 Vng, ch? ng Л阯g M玭 lang.' е t? Л阯g M玭 h祅h t萿 giang h?, t? do t? t筰, lu玭 t薾 trung t薾 ngh躠 v韎 ngi c馻 b秐 ph竔.");
end;