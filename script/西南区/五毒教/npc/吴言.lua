Include("\\script\\global\\技能树操作.lua")
Include("\\script\\faction\\npc\\faction_master_main.lua")

--技能列表
SKILLS={
--五毒邪侠
--万毒心法 (技能id=364)
[364]={
     --{关键点数，前提技能数，前提技能关系（与：1，或：0），前提技能1，前提技能1等级，...}
     levelless={3,0,0,},
     --关键点（技能等级，玩家等级，玩家经验，门派贡献度}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={10,27,0,0},
	},
--五毒刀法 (技能id=365)
[365]={
     levelless={3,1,0,364,1},
     [1]={1,10,1000,0},
     [2]={2,12,200,0},
     [3]={10,28,0,0},
     	},
--引魂咒 (技能id=366)
[366]={
     levelless={2,1,0,364,1},
     [1]={1,12,0,0},
     [2]={1,12,0,0},
     },
--操尸术 (技能id=367)
[367]={
     levelless={3,1,0,364,1},
     [1]={1,12,1500,30},
     [2]={2,15,1200,30},
     [3]={6,27,0,30},
     },
--尸毒术 (技能id=368)
[368]={
     levelless={3,1,0,364,3},
     [1]={1,16,3000,50},
     [2]={2,19,2000,50},
     [3]={7,34,0,50},
     },
--尸爆大法 (技能id=369)
[369]={
     levelless={3,1,0,368,1},
     [1]={1,20,8000,100},
     [2]={2,24,4500,100},
     [3]={5,36,0,100},
     },
--集尸邪气 (技能id=370)
[370]={
     levelless={3,1,0,365,6},
     [1]={1,23,11000,180},
     [2]={2,25,2500,180},
     [3]={8,37,0,180},
     },
--驭尸术 (技能id=371)
[371]={
     levelless={3,1,0,367,4},
     [1]={1,26,15000,220},
     [2]={2,29,9000,220},
     [3]={6,41,0,220},
     },
--万毒夺命刀 (技能id=372)
[372]={
     levelless={3,1,0,370,3},
     [1]={1,30,27000,300},
     [2]={2,33,9000,300},
     [3]={7,48,0,300},
     },
--阴邪吸魂气 (技能id=373)
[373]={
     levelless={3,1,0,370,4},
     [1]={1,34,45000,500},
     [2]={2,38,15000,500},
     [3]={5,50,0,500},
     },
--催尸邪气 (技能id=374)
[374]={
     levelless={3,1,0,369,4},
     [1]={1,38,70000,600},
     [2]={2,41,25000,600},
     [3]={7,56,0,600},
     },
--邪灵大法 (技能id=375)
[375]={
     levelless={3,1,0,371,5},
     [1]={1,43,100000,800},
     [2]={2,46,50000,800},
     [3]={7,58,0,800},
     },
--邪毒功 (技能id=376)
[376]={
     levelless={3,2,0,372,5,373,3},
     [1]={1,48,220000,1000},
     [2]={2,51,80000,1000},
     [3]={7,66,0,1000},
     },
--尸裂魔功 (技能id=377)
[377]={
     levelless={3,1,0,374,5},
     [1]={1,55,500000,3000},
     [2]={2,58,200000,3000},
     [3]={7,73,0,3000},
     },
--无天魔功 (技能id=775)
[775]={
     levelless={5,3,1,375,6,376,7,377,7},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}


function showlimit(n)	--师门说话
--	if n==1 then
--		Say("<color=green>吴言<color>：你的武功精进了！",0)
	if n==2 then
		Say("你的等级不足，请加倍努力!",0)
	elseif n==3 then
		Say("你的经验值不足，请加倍努力!",0)
	elseif n==4 then
		Say("你的声望不足，请继续努力!",0)
	elseif n==5 then
		Say("V? c玭g trc y vi s? d箉 ngi ch璦 luy謓 th祅h, kh玭g th? d箉 ngi v? c玭g m韎!",0)
	elseif n==6 then
		Say("你的银两不足，请赚够钱再来",0)
	else
	end
end;

function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","Х qu? 5 gi? ch琲, kh玭g th? h鋍 v? c玭g n鱝, h穣 ngh? ng琲  gi? g譶 s鴆 kh醗!")
	 	return
	 end
	Say("B鋘 u tr﹗ m苩 ng鵤 kh緋 n琲 u b? ta sai khi課. T? thi ho祅 h錸, sai khi課 thi th? gi誸 ngi trng ph竔 ta u tinh th玭g. е t? t? hi謕 n猲 d飊g <color=yellow>song 產o<color>. Ch糿g hay ta c? th? gi髉 g? cho ngi?",
		4,
		"加入五毒邪侠/enterxiexia",
		"学习五毒邪侠武功/skilllearn",
		"我得到了本门镇派秘籍的残本/change_mistery_book",
		"打个招呼/no")
end;

canjuan1 = 955
canjuan2 = 956
canjuan3 = 957

-- 兑换镇派秘籍的功能 =============================================begin==
function change_mistery_book()
	local nBook1 = GetItemCount(2, 1, canjuan1)		-- 上卷
	local nBook2 = GetItemCount(2, 1, canjuan2)		-- 中卷
	local nBook3 = GetItemCount(2, 1, canjuan3)		-- 下卷
	
	if GetPlayerRoute() ~= 20 then	--流派检测
		Say("Ngi kh玭g ph秈 l?  t? c馻 ta, M藅 t辌h tr蕁 ph竔 sao c? th? giao cho ngi ch??", 0)
		return
	end	
	
	if (nBook1 == 0 and nBook2 == 0 and nBook3 == 0) then	-- 啥也没有
		Say("Ngi ch璦 t鮪g nh薾 頲 trang m藅 t辌h v? c玭g n祇 sao c? th? n鉯 l?  c? n??", 0)
		return
	end
	
	Say("Th藅 kh玭g ng? th玭g qua luy謓 th鴆 ngi l筰 c? th? nh薾 頲 M藅 t辌h tr蕁 ph竔, th藅 x鴑g ng l?   c馻 b鎛 m玭. Ta s? gi髉 ngi ng l筰 th祅h m閠 quy觧 ho祅 ch豱h nh璶g th祅h c玭g hay kh玭g c遪 xem ngi c? may m緉 kh玭g.", 
		2,
		"Лa c竎 trang s竎h cho s? ph?/hand_up_book",
		"Kh玭g c莕 u/no")
end;

-- 将残本交给师父
function hand_up_book()
	Say("N誹 nh? ngi c?  3 t藀 Thng_Trung_H?, ta nh蕋 nh s? ng l筰 th祅h m閠 quy觧 ho祅 ch豱h cho ngi.", 
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
		AddItem(0, 112, 113, 1)
		Say("Ngi th藅 l? may m緉, y l? quy觧 M藅 t辌h tr蕁 ph竔 ho祅 ch豱h!", 0)
		Msg2Player("B筺 nh薾 頲 m閠 quy觧 M藅 t辌h tr蕁 ph竔!")
		WriteLog("[фi m藅 t辌h tr蕁 ph竔]:"..GetName().."Х i 1 Ng? чc T? Hi謕 M藅 t辌h tr蕁 ph竔, nChangeType:"..nChangeType);
	else
		WriteLog("[фi m藅 t辌h tr蕁 ph竔]:"..GetName().."фi Ng? чc T? Hi謕 M藅 t辌h tr蕁 ph竔 th蕋 b筰, nChangeType:"..nChangeType);
		Talk(1,"","фi M藅 t辌h tr蕁 ph竔 th蕋 b筰 r錳!");
	end;
end;
-- 兑换镇派秘籍的功能 =============================================end====

function tedian()		--察看技能
Say("е t? ta thi謓 d飊g t? thu藅, gi誸 ngi trong nh竬 m総 khi課 i phng kh玭g k辮 tr? tay. Luy謓 n c秐h gi韎 t鑙 cao tinh th玭g c m玭 tuy謙 k?, c? th? sai khi課 ngi ch誸. Cho d? cao th? tuy謙 nh nghe danh  khi誴 s?.",0)
end;


function enterxiexia()		--加入流派
	if GetPlayerFaction() ~= 7 then	--门派检测
		Say("Trc ti猲, ngi ph秈 g苝 B筩h gi竜 ch? xin gia nh藀 b鎛 gi竜, r錳 m韎 quay l筰 y b竔 s? h鋍 ngh?.",0)
	elseif   GetPlayerRoute() == 19 then	--未入流派的本门弟子 
		if join_route_main(20) == 0 then
			return
		end
		Say("Trng ph竔 ta c? th? sai khi課 thi th?, ngi nghe qua  khi誴 s?. Ngo礽 thi猲 ph? b萴 sinh ra c莕 ph秈 th藅 nh蒼 n筰. Th蕐 ngi th祅h t﹎ nh? th?, ta ch輓h th鴆 thu nh薾 ngi l祄  t?. u ti猲 ta gi髉 ngi <color=yellow>T葃 甶觤 ti襪 n╪g<color>. V? c玭g b鎛 gi竜 l蕐 <color=yellow>Th﹏ ph竝<color>, <color=yellow>S鴆 m筺h<color>, <color=yellow>N閕 c玭g<color> l祄 c? s?. Gi? c? th? n g苝 B筩h gi竜 ch? nh薾 <color=yellow>Nhi謒 v? s? m玭<color>.",0)
		SetPlayerRoute(20)	--直接设置流派
		LearnSkill(13)--设置爪普通攻击
		LearnSkill(364)
		LearnSkill(365)
		AddItem(0,7,1,1,1,4,65,4,66)
		ResetProperty()        --洗潜能点
		TaskTip("B筺  tr? th祅h  t? Ng? чc t? hi謕!")
		TaskTip("B筺  頲 t葃 甶觤 ti襪 n╪g!")
		TaskTip("B筺  nh藀 m玭! C? th? n g苝 B筩h gi竜 ch? nh薾 nhi謒 v?")
	elseif   GetPlayerRoute() == 20 then
	 	Say("Sai khi課 thi th? ph秈 th藅 tinh th玭g n誹 kh玭g s? r蕋 nguy hi觤, ngi h穣 甶 luy謓 t藀 th猰!",0)
	else
		Say("Ngi l?  t? c馻 Li評 Thng Ch?, sao n ch? ta l祄 chi!",0)
	end
end;

function skilllearn()		--学习技能
	if GetPlayerRoute() ~= 20 then	--流派检测
		Say("Ngi kh玭g ph秈 l?  t? c馻 ta, kh玭g th? h鋍 v? c玭g Ng? чc t? hi謕.",0)
	else
		Say("K? n╪g n祇 di g鉩 ph秈 c? d蕌 m騣 t猲 th? c? th? h鋍, nh蕄 chu閠  t╪g c蕄",0)
		AllowLearnSkill()
	end
end;

--洗潜能点
function resetpoint()

	if GetPlayerRoute() == 20 then
		if GetTask(1150) == 0 then
			Say("V? c玭g b鎛 gi竜 l蕐 <color=yellow>Th﹏ ph竝<color>, <color=yellow>S鴆 m筺h<color>, <color=yellow>N閕 c玭g<color> l祄 c? s?. Ngi ch? c? <color=yellow>1 l莕<color>c? h閕 t葃 甶觤. H穣 suy ngh? th藅 k?!",
		2,
		"T葃 甶觤/confirm_reset",
		"Ch璦 mu鑞 t葃 甶觤./no");
		else
			Say("Ta  gi髉 ngi ti課 h祅h t葃 甶觤, kh玭g 頲 c閚g sai 甶觤 n鱝 nh?!",0);
		end
	else
		Say("Ngi kh玭g ph秈 l? <color=green>е t? t? hi謕<color>, tha l鏸 cho ta kh玭g th? gi髉 ngi t葃 甶觤.",0);
	end
end

function confirm_reset()

	Say("Ngi  t葃 甶觤 ti襪 n╪g th祅h c玭g, v? c玭g trng ph竔 ta l蕐 <color=yellow>Th﹏ ph竝<color>, <color=yellow>S鴆 m筺h<color> v? <color=yellow>N閕 c玭g<color> l祄 c? b秐, l莕 n祔 kh玭g n猲 c閚g sai nh?!",0);
	ResetProperty()
	SetTask(1150,1);
	
end

function change_mistery_book_linshi()
		Say("Kh玭g ng? th玭g qua vi謈 luy謓 th鴆 ngi c? th? nh薾 頲 M藅 t辌h tr蕁 ph竔, th藅 x鴑g ng l?   c馻 b鎛 m玭. Nh璶g tr蕁 ph竔 v? h鋍 n祔 ta c騨g ph秈 l躰h ng? m閠 th阨 gian m韎 c? th? truy襫 th? 頲, ngi quay l筰 sau nh?!",0)
end;

function beforelearnskill(id)
	if (id == 775) then	--无天魔功
		if (GetSkillLevel("V? Thi猲 Ma C玭g") <= 0) then
			return "V? Thi猲 Ma C玭g' l? <color=red>Tuy謙 h鋍 tr蕁 ph竔<color> c馻 b鎛 m玭 , kh玭g ph秈 ngi c馻 b鎛 m玭 kh玭g 頲 h鋍."
		end
	end
end

function afterlearnskill(id)
	if (id == 775) then	--无天魔功
		if (GetSkillLevel("V? Thi猲 Ma C玭g") == 1) then
			Say("T? ch蕋 c馻 con qu? kh玭g t錳, c? b秐  l躰h h閕 頲 'V? Thi猲 Ma C玭g' c馻 b鎛 m玭, qu? l? hi誱 c?!<enter><color=green>Ngi ch琲<color>: Nh璶g? s? ph?, l骳 con th? thi tri觧 揤? Thi猲 Ma C玭g?, th蕐 n閕 kh? trong ngi kh玭g th? t? l筰 r蕋 kh? thi tri觧? Nay con  bi誸 頲 c秏 gi竎 kh玭g th? ph竧 ra nh? L鬰 M筩h Th莕 Ki誱 c馻 Чi L? 祅 Th?.<enter>V藋 l? con kh玭g bi誸 r錳, 'V? Thi猲 Ma C玭g' uy l鵦 r蕋 l韓, h鋍 r錳 mu鑞 t? do thi tri觧 c騨g kh玭g ph秈 chuy謓 d?. Tinh kh? trong ngi kh玭g th? t? l筰 l? 's竧 kh?'? (Tr? s竧 kh?), kh玭g ph竧 頲. Mu鑞 thi tri觧 th? ph秈 ti猽 t鑞 's竧 kh?'. 'S竧 kh?' g錷 10 ph莕, c? th? t╪g l猲 l骳 nh b筰 i phng ho芻 t? l筰 d莕 d莕.", 1, "уng ?/GiveMomentum")
		elseif (GetSkillLevel("V? Thi猲 Ma C玭g") == 5) then
			Say("V? Thi猲 Ma C玭g'  l躰h h閕 n c蕄 5 con qu? l? th玭g minh, nh鱪g c蕄 sau n祔 l? do con si猲g n╪g r蘮 luy謓 r錳. N? c? t蕋 c? 20 c蕄, sau khi luy謓 n  thu莕 th鬰 nh蕋 nh s? qua c蕄 m韎. 10 c蕄 cu鑙 c飊g ph秈 tham kh秓 M藅 t辌h tr蕁 ph竔 c馻 b鎛 m玭 m韎 c? th? l躰h ng?.", 0)
		end
	end
end

function GiveMomentum()
	Say("Л頲 r錳, b﹜ gi? ta s? v薾 c玭g  s竧 kh? trong ngi con t? l筰  con th? thi tri觧 'V? Thi猲 Ma C玭g'.<enter><enter>M閠 th阨 gian sau?<enter><enter>Л頲 r錳, s竧 kh? trong ngi con  h譶h th祅h, c? th? th? thi tri觧 'V? Thi猲 Ma C玭g'. H穣 nh? l蕐 tuy謙 h鋍 tr蕁 ph竔 c馻 b鎛 m玭 uy l鵦 r蕋 l韓 h穣 d飊g  gi髉  k? y誹, thay tr阨 h祅h o, kh玭g l祄 h筰 ngi v? t閕....", 0)
	SetMomentum(10)
	RandomTaskTipEx("Nh薾 頲 10 甶觤 s竧 kh? s? ph? truy襫 cho", "momentumtip")
end

