Include("\\script\\global\\技能树操作.lua")
Include("\\script\\faction\\npc\\faction_master_main.lua")

--技能列表
SKILLS={
--娥眉俗家
--望月心法 (技能id=90)
[90]={
     --{关键点数，前提技能数，前提技能关系（与：1，或：0），前提技能1，前提技能1等级，...}
     levelless={3,0,0,},
     --关键点（技能等级，玩家等级，玩家经验，门派贡献度}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={10,27,0,0},
	},
--随意曲 (技能id=91)
[91]={
     levelless={3,1,0,90,1},
     [1]={1,10,1000,0},
     [2]={2,13,500,0},
     [3]={7,28,0,0},
     	},
--曲艺精通 (技能id=92)
[92]={
     levelless={3,1,0,90,1},
     [1]={1,12,1500,30},
     [2]={2,14,500,30},
     [3]={9,28,0,30},
       },
--月蚀曲 (技能id=93)
[93]={
     levelless={3,1,0,91,2},
     [1]={1,17,5000,60},
     [2]={2,19,800,60},
     [3]={8,31,0,60},
     },
--断水心法 (技能id=94)
[94]={
     levelless={3,1,0,92,3},
     [1]={1,21,10000,100},
     [2]={2,24,3000,100},
     [3]={6,36,0,100},
     },
--静夜思 (技能id=95)
[95]={
     levelless={3,1,0,93,2},
     [1]={1,25,15000,200},
     [2]={2,28,5000,200},
     [3]={6,40,0,200},
     },
--余音绕梁功 (技能id=96)
[96]={
     levelless={3,1,0,92,6},
     [1]={1,29,20000,300},
     [2]={2,33,15000,300},
     [3]={5,45,0,300},
     },
--阳关三叠 (技能id=97)
[97]={
     levelless={3,1,0,93,5},
     [1]={1,33,40000,500},
     [2]={2,36,12000,500},
     [3]={6,48,0,500},
     },
--覆水心法 (技能id=98)
[98]={
     levelless={3,1,0,94,4},
     [1]={1,37,60000,600},
     [2]={2,40,20000,600},
     [3]={6,52,0,600},
     },
--焚琴煮鹤诀 (技能id=99)
[99]={
     levelless={3,2,0,98,1,96,2},
     [1]={1,42,110000,800},
     [2]={2,45,35000,800},
     [3]={7,60,0,800},
     },
--乌夜啼 (技能id=100)
[100]={
     levelless={3,1,0,95,6},
     [1]={1,48,220000,1000},
     [2]={2,51,80000,1000},
     [3]={6,63,0,1000},
     },
--迷心飘香曲 (技能id=101)
[101]={
     levelless={3,1,0,97,6},
     [1]={1,55,500000,3000},
     [2]={2,58,200000,3000},
     [3]={7,73,0,3000},
     },
--天音镇魂曲 (技能id=102)
[102]={
     levelless={5,3,1,100,6,101,7,99,7},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}



function showlimit(n)	--师门说话
--	if n==1 then
--		Say("<color=green>慧音师太<color>：你的武功精进了！",0)
	if n==2 then
		Say("Ngi ch璦  ng c蕄  h鋍 v? c玭g m韎, t╪g c蕄 xong hay quay l筰.",0)
	elseif n==3 then
		Say("Ngi ch璦  kinh nghi謒  h鋍 v? c玭g m韎, h穣 quay l筰 sau?",0)
	elseif n==4 then
		Say("Ngi ch璦  甶觤 danh v鋘g  h鋍 v? c玭g m韎, h穣 甶 l祄 nhi謒 v?  t輈h l騳 甶觤 danh v鋘g!",0)
	elseif n==5 then
		Say("V? c玭g trc y vi s? d箉 ngi ch璦 luy謓 th祅h, kh玭g th? d箉 ngi v? c玭g m韎!",0)
	elseif n==6 then
		Say("Ngi kh玭g c?  ti襫, c? ph秈  qu猲 trong rng ch鴄 ?",0)
	else
	end
end;

function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","Х qu? 5 gi? ch琲, kh玭g th? h鋍 v? c玭g n鱝, h穣 ngh? ng琲  gi? g譶 s鴆 kh醗!")
	 	return
	 end
	Say("Theo <color=yellow>C莔 ph竝<color> c? th? d飊g n閕 c玭g ph竧 ra ti課g n t蕁 c玭g k? ch,  t? theo h? ph竔 n祔 ph秈 d飊g <color=yellow>n<color>. Kh玭g bi誸 ta c? th? gi髉 g??",
		4,
		"加入娥眉俗家/entersujia",
		"学习娥眉俗家武功/skilllearn",
		"我得到了本门镇派秘籍的残本/change_mistery_book",
		"打个招呼/no")
end;

canjuan1 = 931
canjuan2 = 932
canjuan3 = 933

-- 兑换镇派秘籍的功能 =============================================begin==
function change_mistery_book()
	local nBook1 = GetItemCount(2, 1, canjuan1)		-- 上卷
	local nBook2 = GetItemCount(2, 1, canjuan2)		-- 中卷
	local nBook3 = GetItemCount(2, 1, canjuan3)		-- 下卷
	
	if GetPlayerRoute() ~= 9 then	--流派检测
		Say("Ngi kh玭g ph秈 l?  t? c馻 ta, M藅 t辌h tr蕁 ph竔 sao c? th? giao cho ngi ch??", 0)
		return
	end		

	if (nBook1 == 0 and nBook2 == 0 and nBook3 == 0) then	-- 啥也没有
		Say("Ngi ch璦 t鮪g nh薾 頲 trang m藅 t辌h v? c玭g n祇 sao c? th? n鉯 l?  c? n??", 0)
		return
	end
	
	Say("Th藅 kh玭g ng? th玭g qua luy謓 th鴆 ngi l筰 c? th? nh薾 頲 M藅 t辌h tr蕁 ph竔, th藅 x鴑g ng l?   c馻 b鎛 m玭. Ta s? gi髉 ngi ng l筰 th祅h m閠 quy觧 ho祅 ch豱h nh璶g th祅h c玭g hay kh玭g c遪 xem ngi c? may m緉 kh玭g .", 
		2,
		"Лa c竎 trang s竎h cho s? ph?/hand_up_book",
		"Kh玭g c莕 u/no")
end;

-- 将残本交给师父
function hand_up_book()
	Say("N誹 nh? ngi c?  3 t藀 Thng_Trung_H?, ta nh蕋 nh s? ng l筰 th祅h m閠 quy觧 ho祅 ch豱h.", 
		2,
		"уng ? ng s竎h/confirm_change_book",
		"Kh玭g c莕 u/no")
end;

-- 确认找回完整秘籍
function confirm_change_book()
	local nBook1 = GetItemCount(2, 1, canjuan1)		-- 上卷
	local nBook2 = GetItemCount(2, 1, canjuan2)		-- 中卷
	local nBook3 = GetItemCount(2, 1, canjuan3)		-- 下卷
	
	local nSel = random(1, 100)
	local nCanChange = 0
	local nChangeType = 0;
	if (nBook1 >= 1 and nBook2 >= 1 and nBook3 >= 1) then	-- 全齐，100%
		if (DelItem(2, 1, canjuan1, 1) == 1 and DelItem(2, 1, canjuan2, 1) == 1 and DelItem(2, 1, canjuan3, 1) == 1) then
			nCanChange = 1
		end
		nChangeType = 1;
	elseif (nBook1 >= 1 and nBook2 >= 1) then				-- 上中，5%
		if (DelItem(2, 1, canjuan1, 1) == 1 and DelItem(2, 1, canjuan2, 1) == 1 and nSel <= 5) then
			nCanChange = 1
		end
		nChangeType = 2;
	elseif (nBook1 >= 1 and nBook3 >= 1) then				-- 上下，50%
		if (DelItem(2, 1, canjuan1, 1) == 1 and DelItem(2, 1, canjuan3, 1) == 1 and nSel <= 50) then
			nCanChange = 1
		end
		nChangeType = 3;
	elseif (nBook2 >= 1 and nBook3 >= 1) then				-- 中下，60%
		if (DelItem(2, 1, canjuan2, 1) == 1 and DelItem(2, 1, canjuan3, 1) == 1 and nSel <= 60) then
			nCanChange = 1
		end
		nChangeType = 4;
	elseif (nBook1 >= 1) then								-- 上，1%
		if (DelItem(2, 1, canjuan1, 1) == 1 and nSel == 1) then
			nCanChange = 1
		end
		nChangeType = 5;
	elseif (nBook2 >= 1) then								-- 中，3%
		if (DelItem(2, 1, canjuan2, 1) == 1 and nSel <= 3) then
			nCanChange = 1
		end
		nChangeType = 6;
	elseif (nBook3 >= 1) then								-- 下，40%
		if (DelItem(2, 1, canjuan3, 1) == 1 and nSel <= 40) then
			nCanChange = 1
		end
		nChangeType = 7;
	end
	
	if (nCanChange == 1) then		-- 可以给秘籍
		AddItem(0, 112, 106, 1)
		Say("Ngi th藅 l? may m緉, y l? quy觧 M藅 t辌h tr蕁 ph竔 ho祅 ch豱h!", 0)
		Msg2Player("B筺 nh薾 頲 m閠 quy觧 M藅 t辌h tr蕁 ph竔!")
		WriteLog("[фi m藅 t辌h tr蕁 ph竔]:"..GetName().."фi l蕐 M藅 t辌h tr蕁 ph竔 Nga My t鬰 gia, nChangeType:"..nChangeType);
	else
		WriteLog("[фi m藅 t辌h tr蕁 ph竔]:"..GetName().."фi l蕐 M藅 t辌h tr蕁 ph竔 Nga My t鬰 gia th蕋 b筰, nChangeType:"..nChangeType);
		Talk(1,"","Xin l鏸, i l蕐 M藅 t辌h tr蕁 ph竔 th蕋 b筰!");
	end;
end;
-- 兑换镇派秘籍的功能 =============================================end====

function sujia()		--察看技能
--弹界面
end;

function tedian()		--察看技能
Say("Theo C莔 ph竝 c? th? d飊g n閕 c玭g ph竧 ra ti課g n t蕁 c玭g k? ch,  t? theo h? ph竔 n祔 ph秈 d飊g n. Kh玭g bi誸 ta c? th? gi髉 g??",0)
end;


function entersujia()		--加入流派
	if GetPlayerFaction() ~= 3 then	--门派检测
		Say("C? nng ph秈 頲 s? ng ? c馻 Ch﹏ Nh? S? Th竔 m韎 c? th? gia nh藀 Nga My, sau  m韎 c? th? b竔 s? h鋍 ngh?.",0)
	elseif   GetPlayerRoute() == 7 then	--未入流派的本门弟子 
		if join_route_main(9) == 0 then
			return
		end
		Say("Tr? ma v? o l? b鎛 ph薾 c馻  t? Nga My. Ngi c? quy誸 t﹎ nh? th? ta r蕋 vui m鮪g. Vi s? ch輓h th鴆 nh薾 ngi l祄  t? v? gi髉 ngi  th玭g kinh m筩h, <color=yellow>t葃 l筰 甶觤 ti襪 n╪g<color>. B鎛 m玭 l蕐 <color=yellow>N閕 c玭g<color> l祄 g鑓, sau n祔 h穣 c? g緉g luy謓 t藀. Gi? c? th? n g苝 Chng m玭  ti誴 nh薾 <color=yellow>Nhi謒 v? s? m玭<color>.",0)
		SetPlayerRoute(9)	 --直接设置流派
		LearnSkill(90)
		LearnSkill(91)
		AddItem(0,10,64,1,1,4,67,4,68)
		ResetProperty()        --洗潜能点
		TaskTip("B筺  tr? th祅h  t? t鬰 gia Nga My")
		TaskTip("B筺  頲 t葃 甶觤 ti襪 n╪g!")
		TaskTip("B筺  nh藀 m玭! C? th? n g苝 Chng m玭 nh薾 nhi謒 v?")
	elseif   GetPlayerRoute() == 9 then
	 	Say("H穣 c? g緉g luy謓 c玭g! Kh玭g ch鮪g c? ng祔 ngi s? thay vi s? ph竧 dng b鎛 ph竔.",0)
	else
		Say("Ta kh玭g ph秈 l? s? ph? c馻 ngi, ngi n猲 g鋓 ta l? s? c? m韎 ng!",0)
	end
end;

function skilllearn()		--学习技能
	if GetPlayerRoute() ~= 9 then	--流派检测
		Say("Ngi kh玭g ph秈  t? c馻 ta, kh玭g th? h鋍 v? c玭g Nga My t鬰 gia.",0)
	else
		Say("G鉩 ph秈 ph輆 di bi觰 tng v? c玭g xu蕋 hi謓 d蕌 m騣 t猲 bi觰 th? c? th? h鋍, nh蕁 chu閠  t╪g c蕄.",0)
		AllowLearnSkill()
	end
end;

--Say("<color=green>慧音师太<color>：你要学习什么技能？",13,"望月心法/wangyue","随意曲/suiyi","曲艺精通/jingtong","月蚀曲/yueshi","断水心法/duanshui","静夜思/jingye","余音绕梁功/yuyin","阳关三叠/yangguan","覆水心法/fushui","焚琴煮鹤诀/fenqin","乌夜啼/wuye","迷心飘香曲/miren","天音镇魂曲/zhenhun")

function wangyue()
learnskill(90)
end;

function suiyi()
learnskill(91)
end;

function jingtong()
learnskill(92)
end;

function yueshi()
learnskill(93)
end;

function duanshui()
learnskill(94)
end;

function jingye()
learnskill(95)
end;

function yuyin()
learnskill(96)
end;

function yangguan()
learnskill(97)
end;

function fushui()
learnskill(98)
end;

function fenqin()
learnskill(99)
end;

function wuye()
learnskill(100)
end;

function miren()
learnskill(101)
end;

function zhenhun()
learnskill(102)
end;



function no()
end;

function change_mistery_book_linshi()
		Say("Kh玭g ng? th玭g qua vi謈 luy謓 th鴆 ngi c? th? nh薾 頲 M藅 t辌h tr蕁 ph竔, th藅 x鴑g ng l?   c馻 b鎛 m玭. Nh璶g tr蕁 ph竔 v? h鋍 n祔 ta c騨g ph秈 l躰h ng? m閠 th阨 gian m韎 c? th? truy襫 th? 頲, ngi quay l筰 sau nh?!",0)
end;

function beforelearnskill(id)
	if (id == 102) then	--天音镇魂曲
		if (GetSkillLevel("Thi猲  Tr蕁 H錸 Kh骳") <= 0) then
			return "\'Thi猲  Tr蕁 H錸 Kh骳\' l? <color=red>Tuy謙 h鋍 tr蕁 ph竔<color>, kh玭g ph秈  t? b鎛 m玭 th? kh玭g th? n緈 頲."
		end
	end
end

function afterlearnskill(id)
	if (id == 102) then	--天音镇魂曲
		if (GetSkillLevel("Thi猲  Tr蕁 H錸 Kh骳") == 1) then
			Say("Thi誹 hi謕 qu? nhi猲 t? ch蕋 th﹎ s﹗,  bc u l躰h ng? 頲 \'Thi猲  Tr蕁 H錸 Kh骳\', th藅 ng n?! <enter><color=green>Ngi ch琲<color>: Nh璶g....s? ph?, t筰 sao khi con th? thi tri觧 \'Thi猲  Tr蕁 H錸 Kh骳\', n閕 kh? ph﹏ t竛, kh? m? thi tri觧? Nghe n鉯 L鬰 M筩h Th莕 Ki誱 ? 筺 Th?,  ao c t? l﹗, h玬 nay m韎 th? 頲. <enter>\'Thi猲  Tr蕁 H錸 Kh骳\' r蕋 l頸 h筰, cho d? c? may m緉 h鋍 頲, mu鑞 s? d鬾g th祅h th筼,  kh玭g ph秈 l? chuy謓 d?.", 1, "уng ?/GiveMomentum")
		elseif (GetSkillLevel("Thi猲  Tr蕁 H錸 Kh骳") == 5) then
			Say("Thi誹 hi謕 qu? nhi猲 t? ch蕋 th玭g minh, \'Thi猲  Tr蕁 H錸 Kh骳\'  l躰h h閕 頲 5 ph莕. C遪 xa m韎 t n c秐h gi韎 cao nh蕋. Lo筰 v? c玭g n祔 g錷 20 c蕄, 5 c蕄 sau c莕 thi誹 hi謕 kh? luy謓 h琻 n鱝, 10 c蕄 cu鑙 c莕 c? m藅 t輈h tr蕁 ph竔 m韎 l躰h h閕 頲.", 0)
		end
	end
end

function GiveMomentum()
	Say("Th玦 頲,  ta gi髉 ngi thi tri觧 \'Thi猲  Tr蕁 H錸 Kh骳\'. <enter><enter>R蕋 l﹗....<enter><enter>Л頲 r錳, s竧 kh?  h譶h th祅h, c? th? th? thi tri觧 \'Thi猲  Tr蕁 H錸 Kh骳\'. Tuy謙 h鋍 tr蕁 ph竔 r蕋 m筺h, d飊g  tr? gian di謙 b筼, thay tr阨 h祅h o, kh玭g h筰 ngi v? t閕...", 0)
	SetMomentum(10)
	RandomTaskTipEx("Nh薾 頲 10 甶觤 s竧 kh? s? ph? truy襫 cho", "momentumtip")
end

