Include("\\script\\task\\faction\\faction_main_gb.lua");
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- 师门任务链的头文件
Include("\\script\\lib\\task_main.lua");
Include("\\script\\task\\practice\\practice_main.lua"); --修炼的脚本
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_江津村\\task_main.lua");
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");--76级武器生活技能任务脚本
Include("\\script\\结婚\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\online\\callbackplayer\\callbackplayer_head.lua");--召回老玩家活动
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
szNpcName = "<color=green>C竔 Bang Gi竜 Ch? <color>: "
function main()

local nTaskValue = FN_GetTaskState(FN_GB)
local nSkillGenre,nSkillDetail = GetMainLifeSkill() 

	--76级武器配方学习任务
	if GetTask(1600) == 2 and GetBit(GetTask(TASK_76WEAPON_TALK),5) ~= 1 then
		weapon_76_talk(5,nSkillDetail)
		return
	end

	if (nTaskValue==1) and (GetItemCount(2,1,12)>=1) then
		task_008();
		return
	elseif (nTaskValue==1) then
		Say("C? ru th辴 h穣  c竎 huynh  trong bang d飊g trc! Ta l? bang ch?, ng lo cho ta!",0);
		return
	elseif (nTaskValue>=3) then
		fix_gb()
		return
	else
		main_new();
	end
end;

-- 师门任务相关
function about_faction_task()
	Say("叫花们的地方破破烂烂，见笑见笑。",
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

function intergaibang()		--加入门派
	if (GetTask(1001)>0) or (GetTask(1002)>0) or (GetTask(1003)>0) or (GetTask(1005)>0) or (GetTask(1031)>0) or (GetTask(1032)>0)  or (GetTask(1033)>0) then --入门任务检测
		Say("你已加入门派，无法再加入丐帮!",0)
	elseif GetLevel() < 10 then	--等级检测
		Say("想加入丐帮必须具备一定实力.你还没到<color=yellow>10级<color> ，10级之后再来找我!",0)；
	elseif GetPlayerFaction() == 4 then	
		Say("你已加入丐帮, 还想干什么?",0)；
	elseif GetPlayerFaction() > 0 then	
		Say("你已加入门派! 无法再加入丐帮",0)；
	else
		task_001();
		return
	end
end;


function skilllearn()
	if GetPlayerFaction() ~= 4 then
		Say("Kh玭g ph秈  t? C竔 Bang, kh玭g th? h鋍 頲 v? c玭g b鎛 ph竔!",0)
	elseif  GetPlayerRoute() == 10 then 
		Say("Bang ch髇g C竔 Bang ta chia l祄 2 ph竔 <color=yellow>T辬h Y<color> v? <color=yellow>? Y<color>. V? c玭g T辬h Y ph竔 do H? C玭 trng l穙 <color=yellow>M? T辬h Sinh<color> truy襫 th?. V? c玭g ? Y ph竔 do Tr? B竧 trng l穙 <color=yellow>T鑞g Nguy猲 An<color> truy襫 th?. H穣 suy ngh? c萵 th薾, ch鋘 h? ph竔 r錳 t譵 c竎 trng l穙 th豱h gi竜 v? c玭g!",0)
	elseif  GetPlayerRoute() == 11 then
		Say("е t? <color=yellow>T辬h Y<color> n猲 t譵 <color=yellow>M? trng l穙<color> h鋍 v? c玭g m韎 ng!",0)
	else 
		Say("е t? <color=yellow>? Y<color> n猲 t譵 <color=yellow>T鑞g trng l穙<color> h鋍 v? c玭g m韎 ng!",0)
	end
end;
		

function gettask()
	if GetPlayerFaction() ~= 4 then
		Say("Ngi ch糿g ph秈  t? C竔 Bang, Khi誹 H鉧 T? ta ch糿g d竚 l祄 phi襫!",0)
	else
		taskmain("Long T筰 Thi猲", 4)
	end
end;				


function no()
    local nStep = GetTask(TASK_JJC);
    if nStep == 31 then
        task_31_00();
        return
    end;
end;


function StartTask001()
	local strMain = {
		"C? vi謈 g? kh玭g?",
		"Ta ph鬾g l謓h T鑞g Giang i ca ? Lng S琻 B筩 nh? Long Bang ch? ph竔 cao th? n ch? ng? quan binh!",
		"M竨 ch箉 ru閠 m襪, ta nh蕋 nh s? ra tay gi髉 s鴆. Nh璶g g莕 y, v鮝 l骳 C竔 Bang ta s緋 c? h祅h Hi猲 Vi猲 i h閕, c遪 nhi襲 vi謈 ph秈 l祄, e l祬.",
		"T筰 h? c? th? gi髉 頲 g? kh玭g?",
		"H穣 gi髉 ta t譵 10 b譶h T髖 M閚g T鰑  t? ch鴆 i h閕! C? h祅h xong ta s? gi髉 s鴆 cho T鑞g i ca!",
		"Л頲! Ta 甶 t譵 ngay y!",
}
	CTask:TalkEx("",strMain)
	CTask:StartTask("S琻 tr筰 Long T筰 Thi猲");
	TaskTip("T譵 10 b譶h T髖 M閚g T鰑 cho C竔 Bang m? Hi猲 Vi猲 i h閕!")
end


function FinishTask001()
local strMain = {
	"Long bang ch?! H穣 nh薾 l蕐 10 b譶h T髖 M閚g T鰑!",
	"T鑤 l緈! B籲g h鱱 qu? nhi猲 tr鋘g ch? t輓, C竔 Bang ta c騨g kh玭g ph? l遪g. B籲g h鱱 c? tr? v? n鉯 v韎 T鑞g u l躰h, c? h祅h xong Hi猲 Vi猲 i h閕, C竔 Bang ta s? n ngay!",
}
	CTask:TalkEx("",strMain)
	CTask:FinishTask("S琻 tr筰 Long T筰 Thi猲")
	CTask:PayAward("S琻 tr筰 Long T筰 Thi猲")
end;

function practice()
    if GetPlayerFaction() ~= 4 then
       Talk(1,"","Kh玭g ph秈  t? b鎛 bang, kh玭g th? v祇 bang tu luy謓!");
    else
        if GetItemCount(2, 0, 208) >= 1 then  --师门令牌
           Say("你想进行闭关修炼吗?",2,"是/practice_start","不是/no");
        else
            Talk(1,"","你没有<color=yellow>师门令牌<color>, 无法进行修炼.");
        end;
    end;
end;

function no_practice()

end;

-- 丐帮师门重复任务的入口
function start_faction_tasklink()
	if (GetPlayerFaction() ~= 4) then
		Say("Kh玭g ph秈  t? C竔 Bang, sao c? th? c鑞g hi課 cho ta!", 0);
	elseif (GetPlayerRoute() == 10) then 
		Say("Chi b籲g h穣 n c竎 trng l穙 c馻 b鎛 bang b竔 s? h鋍 ngh?, r錳 h穣 nh薾 nhi謒 v?!", 0);
	elseif (GetPlayerRoute() == 11) then
		task_main_entrance(TASK_ID_GAIBANG_JINGYI);			-- 净衣
	else 
		task_main_entrance(TASK_ID_GAIBANG_WUYI);			-- 污衣
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
	
	if (GetPlayerFaction() ~= 4) then	-- 不是本门弟子
		Say("Ngi kh玭g ph秈 l?  t? c馻 b鎛 gi竜, h穣 v? m玭 ph竔 c馻 ngi m? tra xem  c鑞g hi課 s? m玭 nh?. Giao di謓 F3 c騨g c? th? tra xem  c鑞g hi課 s? m玭.", 0)
		return
	end
	
	query_faction_contribute()
	
end;
--========================================================================================
g_szInfoHead = "<color=green>龙在天<color>:";
g_tbColorInfo = 
{
	{"{","}","yellow"},
};
--新的入口
function main_new()
	local selTab = {
				"丐帮起源/know_qiyuan",
				"丐帮武功/know_wugong",
				"入门条件/know_rumentiaojian",
				"加入丐帮/intergaibang",
				"师门任务介绍/about_faction_task",
				"闭关修炼/practice",
				"我打算成亲，我想出师/#faction_graduate(4)",
				"打个招呼/no",
				}
	if (GetPlayerRoute() == 11) or (GetPlayerRoute() == 12) then
		tinsert(selTab, 1, "Nhi謒 v? Chuy觧 Sinh - C秈 L穙 Ho祅 уng/trans_talk_32");
	end
--	tinsert(selTab,8,"武林争霸战相关/wulin_zhengba");			
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 091106 and nDate <= 091112 then
		tinsert(selTab, 1, "е t? xin k輓h d﹏g s? ph? tr? hoa c骳 v? b竛h b竎h hoa!/#GiveItemToMaster(\""..g_szInfoHead.."\", 4)");
	end
	Say(g_szInfoHead.."M閠 n琲 l魀 x魀 nh? th? n祔, mong lng th? cho!",getn(selTab),selTab);
end;

function know_qiyuan()
	Talk(1,"main_new",g_szInfoHead.."Th阨 i n祇 c騨g y d穣 ╪ m祔, nh鱪g ngi b? n筺, thu? m? l筰 cao, n筺 n閕 chi課 li猲 mi猲, th? l鵦 C竔 Bang c騨g t?  m? r閚g, h? m閠 l遪g m閠 d? ch鑞g ngo筰 x﹎, ph竧 huy bang ph竔.");
end;

function know_wugong()
	Talk(2,"main_new",g_szInfoHead..sf_ConvertColorString("C竔 Bang ph﹏ th祅h 2 h? ? Y v? T辬h Y. T辬h Y chuy猲 luy謓 v? ngo筰 c玭g, chuy猲 v? C竔 Bang Chng Ph竝, chi猽 th鴆 ch? tr鋘g v? t蕁 c玭g, d飊g quy襫 nh ra n ch? m筺g, c? th? h鋍 頲 v? c玭g tr蕁 ph竔 {Gi竛g Long Th藀 B竧 Chng}. ? Y ch? tr鋘g th﹏ ph竝 nhanh nh裯, chuy猲 v? C竔 Bang C玭 Ph竝, quy襫 b鎛g nhanh nh裯 甶猽 luy謓, d飊g  c萿 b鎛g t蕁 c玭g k? th?, c? th? h鋍 v? c玭g tr蕁 ph竔 {Ф C萿 C玭 Tr薾}."),g_szInfoHead..sf_ConvertColorString("S? ph? T辬h Y l? B鎛g trng l穙 {M? T辬h Sinh}, S? ph? ? Y l? Chng B竧 trng l穙 {T鑞g Nguy猲 An}."));
end;

function know_rumentiaojian()
	Talk(1,"main_new",g_szInfoHead.."Kh玭g ph﹏ bi謙 nam n?, xu蕋 th﹏, ch? c莕 kh玭g l祄 甶襲 竎, kh玭g gia nh藀 bang ph竔 kh竎, kh玭g ph秈 l? ph秐  c馻 b鎛 ph竔.  m祔 th? c莕 quy t綾 g? ch?? Ch? c莕 tu﹏ theo qui nh c馻 b鎛 m玭, v? i ngh躠 d﹏ t閏, b秓 v? x? t綾.");
end;