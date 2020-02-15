
-- 读入任务引擎头文件
Include("\\script\\lib\\task_main.lua");

--在紫鹤真人处加入武当，接师门任务
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- 师门任务链的头文件

Include("\\script\\task\\faction\\faction_main_wd.lua"); -- 门派任务头文件

Include("\\script\\task\\practice\\practice_main.lua"); --修炼的脚本

-------襄阳任务------
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\lizhi_襄阳\\task_main.lua");
----------------------
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");--76级武器生活技能任务脚本
Include("\\script\\结婚\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\online\\callbackplayer\\callbackplayer_head.lua");--召回老玩家活动
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
szNpcName = "<color=green>V?ng Gi竜 Ch?<color>: "

function main()
	local nTaskValue = FN_GetTaskState(FN_WD);
	local strMain_001 = {
	"Ngi bi誸 ngi  l祄 sai m閠 chuy謓 r錳 kh玭g!",
	"?s?ph?l?",
	"B譶h g鑝 c馻 T?M?Th竔 Th??Tng Dng tuy kh玭g ng gi?nh璶g b猲 trong n?c?gi蕌 m秐h b秐  S琻 H?X?T綾! Hi謓 Ho祅g Thng 產ng b総 c竎 quan ph?a phng mau ch鉵g t譵 v藅 , t猲 Th竔 Th?c??t筼 ph秐 v?th?kh玭g ch辵 giao n閜 m秐h b秐  n祔.",
	"G莕 y c?ngi nghe T?M?Th竔 Th?t?th玭g v韎 nc Li猽, c?kh?n╪g s?chuy觧 t蕀 b秐  n祔 ra quan ngo筰, n誹  t蕀 b秐  S琻 H?X?T綾 r琲 v祇 tay nc Li猽 th?Чi T鑞g ta g苝 i ho筺!",
	"Ta c?nh?bang ch髇g ?tr猲 Ph鬰 Ng璾 s琻 ra m苩 n祇 ng?l筰 b?ngi 畂箃 l蕐!",
	"厖Xem ra l鏸 l??do t筰 h?ph秈 do t筰 h?b?p.",
	"Hi謓 gi?t猲 Th竔 Th?ch綾 產ng nh chuy觧 m秐h b秐  ra quan ngo筰, ngi mau n Tng Dng t譵 <color=yellow>Xa phu<color> h醝 c?ngi trong ph?Th竔 Th?ra ngo礽 kh玭g?",
	"е t?l藀 t鴆 l猲 阯g!"
}
local nSkillGenre,nSkillDetail = GetMainLifeSkill() 

	--76级武器配方学习任务
	if GetTask(1600) == 2 and GetBit(GetTask(TASK_76WEAPON_TALK),2) ~= 1 then
		weapon_76_talk(2,nSkillDetail)
		return
	end

	if CTask:IsTaskStart("Tng Dng_t譵 T?H筩 Ch﹏ Nh﹏")==1 then
		CTask:TalkEx("task_yes_001", strMain_001);
		return
	end;
	
	if CTask:IsTaskStart("Tng Dng_t譵 Xa phu")==1 then
		Say("Ngi mau n Tng Dng t譵 <color=yellow>Xa phu<color> h醝 xem Th竔 Th?c?ph竔 ngi chuy觧 m秐h b秐  S琻 H?X?T綾 甶 ch璦!",0);
		return
	end;

	if (nTaskValue==0) then
		main_new();
		return
	elseif (nTaskValue==1) or (nTaskValue==2) then
	
		Say("Chuy謓 nh藀 m玭 ngi c?th?t譵 <color=yellow>Trng Ng?Dng<color> thng lng.",0);
		return
				
	elseif (nTaskValue==3) then
	
		task_011();
		return
	elseif (nTaskValue>=5) then
	
		fix_wd();
		return
		
	else
		main_new();
	end
end;

-- 师门任务相关
function about_faction_task()
	Say("怎么回事?",
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

-- 开始新的任务，去找车夫
function task_yes_001()
	CTask:FinishTask("Tng Dng_t譵 T?H筩 Ch﹏ Nh﹏");
	CTask:PayAward("Tng Dng_t譵 T?H筩 Ch﹏ Nh﹏");
	CTask:StartTask("Tng Dng_t譵 Xa phu");
	return
end;

function interwudang()		--加入门派
	if (GetTask(1001)>0) or (GetTask(1003)>0) or (GetTask(1004)>0) or (GetTask(1005)>0) or (GetTask(1031)>0) or (GetTask(1032)>0) or (GetTask(1033)>0) then
		Say("您加入了另一个教派！",0)
	elseif GetLevel() < 10 then	--等级检测
		Say("想要成为武当弟子必须具备一定的素质。 等你达到<color=yellow>10级<color>再来!",0)
	elseif GetPlayerFaction() == 2 then	--门派检测
		Say("您加入了武当，为什么这么快就忘记了！",0)
	elseif GetPlayerFaction() > 0 then	--门派检测
		Say("什么啊,叛逆于其他教派还不足以要我们去武当谈什么？",0)
	else
		task_001();
	end
end;


function skilllearn()
	if GetPlayerFaction() ~= 2 then
		Say("Ngi kh玭g ph秈 l? t?V?ng! Th?l鏸 B莕 o kh玭g ti謓 n鉯 r?",0)
	elseif  GetPlayerRoute() == 13 then 
		Say("V?ng m玭  chia l祄 2 h?Чo gia v?T鬰 gia, <color=yellow>Чo gia<color>  t?do <color=yellow>Du Ch蕁 Sinh<color> truy襫 th?v?c玭g, <color=yellow>T鬰 gia<color>  t?do <color=yellow>Чi Ki誱 Ch﹗<color> truy襫 th?v?c玭g. M鏸 ngi ch?c?th?ch鋘 m閠 h?ph竔.",0)
	elseif  GetPlayerRoute() == 14 then
		Say("Ngi l?<color=yellow>Чo gia<color>  t? mu鑞 h鋍 v?c玭g ph秈 t譵 <color=yellow>Du Ch蕁 Sinh<color>.",0)
	else 
		Say("Ngi l?<color=yellow>T鬰 gia<color>  t? mu鑞 h鋍 v?c玭g ph秈 t譵 <color=yellow>Чi Ki誱 Ch﹗<color>.",0)
	end
end;
		

function gettask()
	if GetPlayerFaction() ~= 2 then
		Say("Ngi kh玭g ph秈  t?V?ng! Kh玭g d竚 l祄 phi襫!",0)
	else
		taskmain("T?H筩 ch﹏ nh﹏", 2)
	end
end;				

function no()

end;

function task_xy()
-------襄阳任务------


    local nStep = GetTask(TASK_XYTY);
    if nStep == 2 then
        task_02_00();
        return
    elseif nStep == 4 then
        task_04_00();
        return
    elseif nStep == 5 then
    	task_05_00();
    	return
    elseif nStep == 6 then
        task_06_00();
        return
    elseif nStep == 8 then
        task_08_00();
        return
    elseif nStep == 14 then
        task_14_00();
        return
    elseif nStep == 15 then
        task_15_00();
        return
    elseif nStep == 19 then
        task_19_00();
        return
    elseif nStep == 21 then
        task_21_00();
        return
    elseif nStep == 50 then
        task_50_00();
        return
    elseif nStep == 51 then
        task_51_00();
        return
    elseif nStep == 52 then
        task_52_00();
        return
    end;

    local nStep = GetTask(TASK_XY_TWO);
    if nStep == 1 then
        two_01_00();
        return
    elseif nStep == 2 then
        two_02_00();
        return
    elseif nStep == 3 then
        two_03_00();
        return
    end;
end;

function practice()
    if GetPlayerFaction() ~= 2 then
       Talk(1,"","你不是武当弟子, 这是我武当派的事，不要多管闲事");
    else
        if GetItemCount(2, 0, 206) >= 1 then  --师门令牌
            Say("你想进行闭关修炼吗?",2,"是/practice_start","Sai/no");
        else
            Talk(1,"","你没有<color=yellow>武当令牌<color>, 无法进行修炼.");
        end;
    end;
end;

-- 武当师门重复任务的入口
function start_faction_tasklink()
	if (GetPlayerFaction() ~= 2) then
		Say("不是武当弟子, 武当的事你还是少打听为妙", 0);
	elseif (GetPlayerRoute() == 13) then 
		Say("你去拜师后再来找我!.", 0);
	elseif (GetPlayerRoute() == 14) then
		task_main_entrance(TASK_ID_WUDANG_DAOJIA);		-- 道家
	else 
		task_main_entrance(TASK_ID_WUDANG_SUJIA);		-- 俗家
	end
end;

function shimenshuoming()
		Say("<color=green>Thuy誸 minh  c鑞g hi課 s?m玭<color>: \n <color=yellow>ч c鑞g hi課 s?m玭<color>: Th玭g qua vi謈 ho祅 th祅h nhi謒 v?S?M玭 t n m閠 ng c蕄 nh蕋 nh, b筺 c?th?nh薾 頲 trang ph鬰 ho芻 v?kh?c馻 S?M玭. \n <color=yellow>Gi韎 h筺  c鑞g hi課 s?m玭<color>: Hi謓 nay  c鑞g hi課 S?M玭 kh玭g b?h筺 ch? ch?c莕 ho祅 th祅h nhi謒 v?th?c?th?n﹏g cao  c鑞g hi課. \n <color=yellow>S?ki謓 V?L﹎<color>: L祄 xong nhi謒 v?c?nh s?nh薾 th猰 m閠 nhi謒 v?ng蓇 nhi猲, ho祅 th祅h s?nh薾 頲 50 甶觤 c鑞g hi課 S?m玭 v?c?kh?n╪g nh薾 頲 m藅 t辌h s?m玭.", 
			1,
			"Trang k?shuoming2")		
end;

function shuoming2()
		Say("<color=green>Thuy誸 minh  c鑞g hi課 s?m玭<color>: \n <color=yellow>Gi韎 h筺 ng c蕄  c鑞g hi課 S?M玭<color>: Ъng c蕄 kh竎 nhau th?甶觤 t輈h l騳  c鑞g hi課 c騨g kh玭g gi鑞g nhau. ч c鑞g hi課 S?M玭 c祅g cao c祅g n﹏g cao ng c蕄 c馻 m譶h, t?sau c蕄 75 th?kh玭g c遪 gi韎 h筺  c鑞g hi課 n鱝. \n <color=yellow>觤 kinh nghi謒 ng蓇 nhi猲<color>. L祄 nhi襲 nhi謒 v?s?m玭  c鑞g hi課 c祅g cao 甶觤 kinh nghi謒 c祅g nhi襲. 觤 c鑞g hi課 <3000 <color=yellow>觤 kinh nghi謒 tng i<color>, >3000 <color=yellow>甶觤 kinh nghi謒 c祅g nhi襲<color>.", 0);
end

function check_query_faction_contri()

	if (GetPlayerFaction() == 0) then	-- 没有加入门派
		Say("Mu鑞 l祄 nhi謒 v?s?m玭 trc ti猲 ph秈 gia nh藀 b鎛 gi竜. Sau  h穣 gia nh藀 trng ph竔, r錳 quay l筰 ch?ta nh薾 nhi謒 v? Sau khi ho祅 th祅h nhi謒 v?s?m玭 s?nh薾 頲  c鑞g hi課 s?m玭, t輈h l騳  c鑞g hi課 nh蕋 nh c?th?mua v藅 ph萴 b?truy襫 b鎛 m玭.", 0)
		return
	end
	
	if (GetPlayerFaction() ~= 2) then	-- 不是本门弟子
		Say("Ngi kh玭g ph秈 l? t?c馻 b鎛 gi竜, h穣 v?m玭 ph竔 c馻 ngi m?tra xem  c鑞g hi課 s?m玭 nh? Giao di謓 F3 c騨g c?th?tra xem  c鑞g hi課 s?m玭.", 0)
		return
	end
	
	query_faction_contribute()
	
end;
--========================================================================================
g_szInfoHead = "<color=green>紫鹤真人<color>:";
g_tbColorInfo = 
{
	{"{","}","yellow"},
};
--新的入口
function main_new()
	local selTab = {
				"武当派起源/know_qiyuan",
				"武当派武功介绍/know_wugong",
				"入门条件/know_rumentiaojian",
				"加入武当派/interwudang",
				"师门任务介绍/about_faction_task",
				"闭关修炼/practice",
				"我打算成亲，我想出师/#faction_graduate(2)",
				"打个招呼/task_xy",
				}
	if (GetPlayerRoute() == 14) or (GetPlayerRoute() == 15)  then
		tinsert(selTab, 1, "Nhi謒 v?Chuy觧 Sinh - C秈 L穙 Ho祅 уng/trans_talk_32");
	end
--	tinsert(selTab,8,"武林争霸战相关/wulin_zhengba");			
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 091106 and nDate <= 091112 then
		tinsert(selTab, 1, "е t?xin k輓h d﹏g s?ph?tr?hoa c骳 v?b竛h b竎h hoa!/#GiveItemToMaster(\""..g_szInfoHead.."\", 2)");
	end
	Say(g_szInfoHead.."请看一下风景，武当山是世界上水稀有的地方！",getn(selTab),selTab);
end;

function know_qiyuan()
	Talk(1,"main_new",g_szInfoHead.."L穙 T?m?u Чo gia, h藆 th?chia l祄 2 h?ph竔 Thi猲 S?v?Thu莕 Dng. Thi猲 S?luy謓 ph? Thu莕 Dng luy謓 n. V?ng thu閏 h?Thu莕 Dng. V?ng s琻 Th竔 Ho?cung 頲 d鵱g l猲 v祇 th阨 Л阯g, t玭 Ch﹏ V?i  l祄 th莥. V?c玭g b秐 ph竔 ch?y誹 thi猲 v?h? l蕐 n閕 ch鑞g ngo筰. C?nhi襲 cao nh﹏ ng祔 x璦, n ng祔 nay v蒼 頲 giang h?k輓h tr鋘g.");
end;

function know_wugong()
	Talk(2,"main_new",g_szInfoHead..sf_ConvertColorString("V?ng chia th祅h 2 h?v?c玭g Чo gia v?T鬰 gia. Чo gia ch?tu n閕 c玭g, tu luy謓 V?ng n閕 gia t﹎ ph竝, l蕐 n閕 c玭g th﹎ h藆 l祄 tr鋘g, l蕐 ti猲 thi猲 ki誱 kh? nh b筰 ch th? c?th?h鋍 v?c玭g tr蕁 ph竔 V?Thng Th竔 C鵦 Ki誱. T鬰 gia c?th?t?th﹏ linh ng, tu luy謓 V?ng b髏 ph竝, d飊g n t蕁 c玭g nhanh li猲 t鬰  nh b筰 i phng, c?th?h鋍 v?c玭g tr蕁 ph竔 Th竔 C鵦 Th莕 C玭g."),g_szInfoHead..sf_ConvertColorString("Чo gia th?nghi謕 s?ph?l?Du Ch蕁 Sinh, T鬰 gia th?nghi謕 s?ph?l?Чi Ki誱 Ch﹗."));
end;

function know_rumentiaojian()
	Talk(1,"main_new",g_szInfoHead.."Kh玭g gi韎 h筺 nam n? ph秈 l?ngi kh玭g l祄 vi謈 竎, ch璦 gia nh藀 m玭 ph竔, kh玭g ph秈 l?ph秐  c馻 b秐 ph竔 u c?th?gia nh藀. е t?V?ng kh玭g 頲 l祄 vi謈 竎, kh玭g 頲 k誸 giao v韎 t?ma ngo筰 o, khi h祅h t萿 giang h?ph秈 gi?g譶 thanh quy, h祅h hi謕 trng ngh躠.");
end;