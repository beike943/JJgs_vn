-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 大理任务NPC白莹莹Script
-- By StarryNight
-- 2006/01/04 PM 16:26

--乙酉年 戊子月 癸已日 
--宜: 祭祀 塑绘 开光 裁衣 冠笄 嫁娶 纳采 拆卸 修造 动土 竖柱 上梁 安床 移徙 入宅 安香 结网 捕捉 畋猎 伐木 进人口 放水 
--忌: 出行 安葬 修坟 开市 
--吉神宜趋: 五富 益後  
--凶神宜忌: 劫煞 小耗 复日 重日 元武  
--每日胎神占方: 占房床房内北 
--五行: 长流水 执执位 
--冲: 冲猪(丁亥)煞东 
--彭祖百忌: 癸不词讼理弱敌强 已不远行财物伏藏 

-- ======================================================

-- 读入任务引擎头文件
Include("\\script\\lib\\task_main.lua");
Include("\\script\\task\\faction\\faction_main_wp.lua"); -- 门派任务头文件
Include("\\script\\task\\practice\\practice_main.lua"); --修炼的脚本
Include("\\script\\task\\tasklink\\factiontasklink_temp.lua"); -- 师门任务链的头文件

-- 西南区剧情任务文件
Include("\\script\\task\\world\\大理\\task_head.lua");
Include("\\script\\task\\world\\大理\\lv30\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");
----------------------
Include("\\script\\结婚\\marriage_head.lua");
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\online\\callbackplayer\\callbackplayer_head.lua");--召回老玩家活动
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
szNpcName = "<color=green>Ng? чc Gi竜 Ch? <color>: "
function main()

local nTaskValue = GetTask(FN_WP);

	if ((nTaskValue >= 1) and (nTaskValue <= 6)) then
		Say("Ngi mu鑞 nh藀 m玭 ?? H穣 g苝 <color=yellow>b鑞 v? qu? s?<color> thng lng.",0);
		return
	elseif (nTaskValue == 7) then
		task_011();
		return
	elseif (nTaskValue > 8) then
		fix_wp();
		return
	else
		main_new();
	end
end;

-- 师门任务相关
function about_faction_task()
	Say("想做什么?",
		3,
		"开始师门任务/start_faction_tasklink",
		"师门贡献度查询/check_query_faction_contri",
		"师门任务说明/shimenshuoming")
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

--加入门派
function interwudu()		
	if (GetTask(1001)>0) or (GetTask(1002)>0) or (GetTask(1003)>0) or (GetTask(1004)>0) or (GetTask(1005)>0) or (GetTask(1031)>0) or (GetTask(1032)>0) then
		Say("B籲g h鱱  gia nh藀 m玭 ph竔 kh竎, kh玭g th? gia nh藀 Ng? чc Gi竜!",0)
	elseif GetLevel() < 10 then	--等级检测
		Say("Ng? чc Gi竜 ta i v韎 nh﹏ t礽 kh玭g c﹗ n?, nh璶g c騨g kh玭g th? qua loa, b籲g h鱱 t <color=yellow>c蕄 10<color> r錳 quay l筰 nh?!",0)
	elseif GetPlayerFaction() == 7 then	--门派检测
		Say("B籲g h鱱 kh玭g ph秈  gia nh藀 Ng? чc gi竜 r錳 sao? Sao mau qu猲 th?.",0)
	elseif GetPlayerFaction() > 0 then	--门派检测
		Say("Ph祄  t? Ng? чc Gi竜 r蕋 trung th祅h, B籲g h鱱  l? ngi c馻 m玭 ph竔 kh竎, xin th? l鏸 cho b鎛 gi竜 kh玭g th? thu gi?.",0)
	else
		task_000();
	end
end;

--学习武功
function skilllearn()
	if GetPlayerFaction() ~= 7 then
		Say("B籲g h鱱 kh玭g ph秈 l?  t? b鎛 gi竜, th藅 kh玭g ti謓 n鉯 chuy謓.",0)
	elseif  GetPlayerRoute() == 19 then 
		Say("е t? b鎛 gi竜 ph﹏ l祄 2 lo筰: t? hi謕 v? c? s?,  t? <color=yellow>t? hi謕<color> do Thi Thng Thng Ch? <color=yellow>Ng? Ng玭<color> truy襫 th? v? c玭g,  t? <color=yellow>c? s?<color> do C? Thng Thng Ch? <color=yellow>Li評 T﹏ Tr骳<color> truy襫 th? v? c玭g. Ngu琲 c? th? g苝 h? b竔 s? h鋍 ngh?, nh璶g m鏸 ngi ch? c? th? h鋍 1 trng ph竔.",0)
	elseif  GetPlayerRoute() == 20 then
		Say("Ngu琲 l?  t? <color=yellow>t? hi謕<color> Ng? чc Gi竜, mu鑞 h鋍 v? c玭g ph秈 ki誱 <color=yellow>Ng? Ng玭<color> m韎 ng ch?!",0)
	else 
		Say("Ngu琲 l?  t? <color=yellow>c? s?<color> Ng? чc Gi竜, mu鑞 h鋍 v? c玭g ph秈 ki誱 <color=yellow>Li評 T﹏ Tr骳<color> m韎 ng ch?!",0)
	end
end;

--西南区剧情任务
function task_xn()
local nTask_DL_State_30 = GetTask(TASK_DL_LV30_ID);
local nTask_DL_State_62 = GetTask(TASK_DL_LV62_ID);
local nTask_DL_State_75 = GetTask(TASK_DL_LV75_ID);

	if nTask_DL_State_30 == 1 then
		task_001_00();
		return
	end
	
	if nTask_DL_State_30 == 2 then
		task_002_00();
		return
	end
	
	if nTask_DL_State_30 == 3 then
		task_003_00();
		return
	end
	
	if nTask_DL_State_30 == 4 then
		task_004_00();
		return
	end
	
	if nTask_DL_State_30 == 5 then
		task_005_00();
		return
	end
	
	--领取62级任务五毒教的怒火
	if nTask_DL_State_62 == 5 then 
		task_006_00();
		return
	end
	
	--未杀死蚩火大长老
	if nTask_DL_State_75 == 1 then 
		task_007_00();
		return
	end
	
	--已经杀死蚩火大长老
	if nTask_DL_State_75 == 2 then 
		task_008_00();
		return
	end
	
	--完成五毒教的怒火任务,未与百晓生对话
	if nTask_DL_State_75 == 3 then 
		task_009_00();
		return
	end
end
--闭关修炼
function practice()
    if GetPlayerFaction() ~= 7 then
       Talk(1,"","Ngu琲 kh玭g ph秈 l?  t? b鎛 gi竜, kh玭g th? tu luy謓 ? y.");
    else
        if GetItemCount(2, 0, 390) >= 1 then  --师门令牌
            Say("你想闭关修炼?",2,"是/practice_start","不是/no");
        else
            Talk(1,"","你没有<color=yellow>师门令牌<color>,无法修炼.");
        end;
    end;
end;

-- 五毒教师门重复任务入口
function start_faction_tasklink()
	if (GetPlayerFaction() ~= 7) then
		Say("Ngu琲 kh玭g ph秈 l?  t? b鎛 gi竜, vi謈 b鎛 gi竜 kh玭g can h? g? n ngi!", 0)
	elseif (GetPlayerRoute() == 19) then 
		Say("е t? b鎛 gi竜 ph﹏ l祄 t? hi謕, c? s?, ch? c?  t?  b竔 s? m韎 c? th? ti誴 nh薾 nhi謒 v? c馻 ta!", 0)
	elseif (GetPlayerRoute() == 20) then
		task_main_entrance(TASK_ID_WUDU_XIEXIA);		-- 邪侠
	else 
		task_main_entrance(TASK_ID_WUDU_GUSHI);			-- 蛊师
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
	
	if (GetPlayerFaction() ~= 7) then	-- 不是本门弟子
		Say("Ngi kh玭g ph秈 l?  t? c馻 b鎛 gi竜, h穣 v? m玭 ph竔 c馻 ngi m? tra xem  c鑞g hi課 s? m玭 nh?. Giao di謓 F3 c騨g c? th? tra xem  c鑞g hi課 s? m玭.", 0)
		return
	end
	
	query_faction_contribute()
	
end;
--========================================================================================
g_szInfoHead = "<color=green>B筩h Doanh Doanh<color>:";
g_tbColorInfo = 
{
	{"{","}","yellow"},
};
--新的入口
function main_new()
	local selTab = {
				"五毒起源/know_qiyuan",
				"五毒功法/know_wugong",
				"入门条件/know_rumentiaojian",
				"加入五毒派/interwudu",
				"师门任务说明/about_faction_task",
				"闭关修炼/practice",
				"我打算成亲，我想出师/#faction_graduate(7)",
				"打个招呼/task_xn",
				}
	if GetPlayerRoute() == 20 or GetPlayerRoute() == 21  then
		tinsert(selTab, 1, "Nhi謒 v? Chuy觧 Sinh - C秈 L穙 Ho祅 уng/trans_talk_32");
	end
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 091106 and nDate <= 091112 then
		tinsert(selTab, 1, "е t? xin k輓h d﹏g s? ph? tr? hoa c骳 v? b竛h b竎h hoa!/#GiveItemToMaster(\""..g_szInfoHead.."\", 7)");
	end
--	tinsert(selTab,8,"武林争霸战相关/wulin_zhengba");
	Say(g_szInfoHead.."ng tr竎h ta kh玭g n鉯 trc, n誹 ngi g苝 chuy謓 g? k? l? th? ng c? m? t? x豼 ",getn(selTab),selTab);
end;

function know_qiyuan()
	Talk(1,"main_new",g_szInfoHead.."t Mi猽 Cng nguy hi觤 v? c飊g, c? nhi襲 m穘h th? c tr飊g, ngi Mi猽 bi誸 c竎h ch? ng? c tr飊g c遪 g鋓 l? C? thu藅, ngo礽 ra c遪 c? th? gi? t? thi v? d飊g k? c kh鑞g ch? c遪 g鋓 l? Phong thi thu藅. Sau n祔 c? ngi s鑞g ? Mi猽 Cng h琻 mn n╩ h鋍 頲 t蕋 c? b? thu藅 t? x璶g l? Kim T祄 L穙 Ti猲,  t? c馻 玭g ta l? B筩h Di謓 Lang Qu﹏ ngi s竛g l藀 Ng? c gi竜 v? t玭 L穙 ti猲 l? Ng? чc t? s?.");
end;

function know_wugong()
	Talk(2,"main_new",g_szInfoHead..sf_ConvertColorString("Mi猽 Cng k? thu藅 chia l祄 C? thu藅 v? Kh鑞g thi thu藅, Ng? чc gi竜 chia th祅h 2 h? ph竔 C? s? v? T? hi謕. C? S? chuy猲 nghi猲 c鴘 Ng? чc C? Thu藅, d飊g c t蕁 c玭g k? ch, sau khi trng th祅h c? th? h鋍 v? c玭g tr蕁 ph竔 {V? 秐h Ma C鎪. T? hi謕 d鵤 v祇 s? nhanh nh裯 c馻 th﹏ ph竝  kh鑞g ch? t? thi, s? d鬾g song 產o t蕁 c玭g k? ch, sau khi trng th祅h c? th? h鋍 v? c玭g tr蕁 ph竔 {V? Thi猲 Ma C玭g}."),g_szInfoHead..sf_ConvertColorString("S? ph? truy襫 th? C? s? l? C? Thng Thng Ch? {Li評 T﹏ Tr骳}, truy襫 th? T? hi謕 l? Thi Thng Thng Ch? {Ng? Ng玭}."));
end;

function know_rumentiaojian()
	Talk(1,"main_new",g_szInfoHead.."Kh玭g gi韎 h筺 nam n?, ch璦 gia nh藀 m玭 ph竔 kh竎, kh玭g ph秈 l? ph秐  b鎛 m玭 th? c? th? nh藀 m玭. Ng? чc gi竜 kh玭g xem tr鋘g ch輓h t?, gi誸 ngi ph鉵g h醓 c騨g kh玭g sao nh璶g n誹 m璾 h筰 ng m玭 s? b? v筺 c? th鵦 t﹎ m? ch誸.");
end;