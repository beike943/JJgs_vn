
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 武当门派任务实体处理脚本文件
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================

Include("\\script\\task\\faction\\faction_head.lua");

-- 与紫鹤真人的对话
function task_001()

local strMain = {
		"要成为是武当的弟子，不得不背诵《道德经》，了解其含义，然后崇拜大师的日程，以便能够开始创世。 您可以找<color=yellow>张午阳<color> 了解下?"
	}

TaskTip("紫阳真人告诉您与张午阳见面开始任务!");
TE_Talk(getn(strMain), "task_002", strMain);

end


-- 对话结束后改变变量：1
function task_002()

	SetTask(1002,1);

end


-- 与张午阳的对话
function task_003()

local strMain = {
		"《道德经》是老子写的，分为上下两册。上卷共37章，下卷共44章，内容深刻，是道教的指示。在成为武当弟子之前 ，您必须并理解其含义。是否要尝试？",
		"我先记下道德经/task_003_read",
		"开始背诵/task_003_next",
		"我还有其他事情/task_exit"
	}

Say(strMain[1],3,strMain[2],strMain[3],strMain[4]);

end


-- 熟读道德经
function task_003_read()

local strMain = {
		"Чo Kh?Чo, Phi Thng Чo. Danh Kh?Danh, Phi Thng Danh. V?Danh Thi猲 мa Chi Kh雐. H鱱 Danh V筺 V藅 Chi M蓇. C?Thng V?D鬰 D?Quan K?Di謚.",
		"Thng H鱱 D鬰 D?Quan K?Di謚. Th?Lng Gi?уng Xu蕋 Nhi D?Danh. уng V?Chi Huy襫. Huy襫 Chi H鵸 Huy襫, Ch髇g Di謚 Chi M玭.",
		"C鑓 Th莕 B蕋 T?Th?V?Huy襫 T絥. Huy襫 T絥 Chi M玭 Th?V?Thi猲 мa C╪. Mi猲 Mi猲 Nhc T錸, D鬾g Chi B蕋 C莕.",
		"Thng Thi謓 Nhc Th駓. Th駓 Thi謓 L頸 V筺 V藅 Nhi B蕋 Tranh, X?Ch髇g Nh﹏ Chi S?竎, C?C??Чo. C?Thi謓 мa, T﹎ Thi謓 Uy猲 D?Thi謓 Nh﹏, Ng玭 Thi謓 T輓, Ch輓h Thi謓 Tr? S?Thi謓 N╪g, чng Thi謓 Th阨. Phu Duy B蕋 Tranh, C?V?V璾.",
		"Чi Th祅h Nhc Khuy誸, K?D鬾g B蕋 T? Чi Doanh Nhc Xung, K?D鬾g B蕋 C飊g. Чi Tr鵦 Nhc Khu蕋. Чi X秓 Nhc Chuy誸. Чi Bi謓 Nhc N閠. T辬h Th緉g T竜. Thanh T辬h Vi Thi猲 H?Ch竛h.",
		"H鱱 V藅 H鏽 Th祅h ti猲 thi猲 a sanh. T辌h H?Li猽 H?чc L藀 B蕋 C秈, Chu H祅h Nhi B蕋 Хi, Kh?D?Vi Thi猲 H?M蓇. Ng?B蕋 Tri K?Danh, Cng T?Chi Vi誸 Чo. Cng Vi Chi Danh Vi誸 Чi. Чi Vi誸 Th? Th?Vi誸 Vi詎, Vi詎 Vi誸 Ph秐.",
		"C?Чo Чi, Thi猲 Чi, мa Чi, Nh﹏ Di謈 Чi. V鵦 Trung H鱱 Чi, Nhi Nh﹏ C?K?Nh蕋 Y猲. Nh﹏ Ph竝 мa, мa Ph竝 Thi猲, Thi猲 Ph竝 Чo, Чo Ph竝 T?Nhi猲."
	}
	
TE_Talk(getn(strMain), "task_003", strMain);

end





-- 背诵道德经
function task_003_next()

local strMain = {
		"《道德经》的第一句话是什么？",
		"Чo Sinh Nh蕋, Nh蕋 Sinh Nh? Nh?Sinh Tam, Tam Sinh V筺 V藅/task_error",
		"Nh﹏ Ph竝 мa, мa Ph竝 Thi猲, Thi猲 Ph竝 Чo, Чo Ph竝 T?Nhi猲/task_error",
		"道非道，非常道，名非名，非常名/task_004_next"
	}

Say(strMain[1],3,strMain[2],strMain[3],strMain[4]);

end

function task_004_next()

local strMain = {
		"那杯不朽的自我宣称?",
		"Huy襫 V?task_error",
		"玄/task_005_next",
		"H鵸 Huy襫/task_error"
	}

Say(strMain[1],3,strMain[2],strMain[3],strMain[4]);

end

function task_005_next()

local strMain = {
		"通天?",
		" Kim /task_error",
		"M閏/task_error",
		"汞/task_006_next",
		"H醓/task_error",
		"Th?task_error"
	}

Say(strMain[1],5,strMain[2],strMain[3],strMain[4],strMain[5],strMain[6]);

end

function task_006_next()

local strMain = {
		"主要的微型星系是什么？",
		"V?vi/task_error",
		"Sung Doanh/task_error",
		"Khu蕋 Chuy誸/task_error",
		"清廷/task_007_next"
	}

Say(strMain[1],4,strMain[2],strMain[3],strMain[4],strMain[5]);

end

function task_007_next()

local strMain = {
		"土地法，佛法景观，佛法景观，佛法之路？",
		"自然/task_008",
		" dng/task_error",
		"V?vi/task_error",
		"H?th鵦/task_error"
	}

Say(strMain[1],4,strMain[2],strMain[3],strMain[4],strMain[5]);

end

-- 全部回答正确了之后改变任务变量：2
function task_008()

	SetTask(1002,2);
	
	Say("在很短的时间内就记住了《道德经》，看来你也很不错。寻找<color = yellow> 1 瓶酒 <color> 和 <color = yellow> 1 把侠少剑<color> （剑在商店买，酒在流氓身上）",0);
	
	TaskTip("去找1把侠少剑和1瓶酒！");
	
end


function task_009()

local strMain = {
		"纯正的进气口，单个冶金体！",
		"Х b竔 T?s? C?th?quay v?g苝 <color=yellow>Chng m玭<color>."
	}

	if (GetItemCount(0,2,14)>=1) and (GetItemCount(2,1,12)>=1) then
	
		TE_Talk(getn(strMain), "task_010", strMain);
		
		TaskTip("您已完成考验，可以返回以找到紫阳真人！");
		
	else
	
		Say("赶紧就找！",0);
	
	end
	
return

end

-- 删除剑和酒，并改变任务变量：3
function task_010()

	DelItem(0,2,14,1);
	DelItem(2,1,12,1);
	SetTask(1002,3);

end


-- 回见掌门的对话
function task_011()

local strMain = {
		"宗教将接受您作为武当的第四弟子。 将来，您必须遵守规则，尝试练习武术，不要背叛我们的期望。"
	}
	
TE_Talk(getn(strMain), "task_012", strMain);

end


-- 与掌门对话结束，改变任务变量：4
function task_012()

	SetTask(1002,4);
	
	SetPlayerFaction(2)
	SetPlayerRoute(13)
	i=GetBody()
	if i==1 then 
		AddItem(0,109,74,1)
		AddItem(0,108,74,1)
	elseif i==2 then
		AddItem(0,109,78,1)
		AddItem(0,108,78,1)
	elseif i==3 then
		AddItem(0,109,82,1)
		AddItem(0,108,82,1)
	else
		AddItem(0,109,86,1)
		AddItem(0,108,86,1)
	end
	ModifyReputation(10,0);
	--AddGlobalNews("江湖传言玩家"..GetName().."已于近日加入武当！")
	TaskTip("您已经加入了武当！")
	
	-- 清空其它门派任务的状态
	FN_SetTaskState(FN_SL, 0);
	FN_SetTaskState(FN_EM, 0);
	FN_SetTaskState(FN_GB, 0);
	FN_SetTaskState(FN_TM, 0);
	
end


function task_exit()

end;


function task_error()

	Say("朋友不属于道德经，背诵并回来！",0);

end


function fix_wd()
FN_SetTaskState(FN_WD, 0);
Say("发生了一些小问题，但已解决！ 您可以再次加入氏族。",0);
end;