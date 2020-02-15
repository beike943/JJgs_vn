Include("\\script\\global\\技能树操作.lua")
Include("\\script\\faction\\npc\\faction_master_main.lua")

--技能列表
SKILLS={
--五毒蛊师
--百蛊心经 (技能id=347)
[347]={
     --{关键点数，前提技能数，前提技能关系（与：1，或：0），前提技能1，前提技能1等级，...}
     levelless={3,0,0,},
     --关键点（技能等级，玩家等级，玩家经验，门派贡献度}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={10,27,0,0},
	},
--下蛊秘方 (技能id=348)
[348]={
     levelless={3,1,0,347,1},
     [1]={1,10,0,0},
     [2]={2,20,100000,0},
     [3]={4,40,0,0},
     	},
--喂养蛊母 (技能id=349)
[349]={
     levelless={2,1,0,347,1},
     [1]={1,10,0,0},
     [2]={1,10,0,0},
      },
--产蛊 (技能id=350)
[350]={
     levelless={2,1,0,349,1},
     [1]={1,10,0,0},
     [2]={1,10,0,0},
     },
--疯蛊 (技能id=351)
[351]={
     levelless={3,1,0,347,1},
     [1]={1,10,1000,0},
     [2]={2,13,500,0},
     [3]={7,28,0,0},
     },
--养蛊秘术 (技能id=352)
[352]={
     levelless={3,1,0,349,1},
     [1]={1,12,1500,30},
     [2]={2,13,500,30},
     [3]={10,21,0,30},
     },
--狂风爪 (技能id=353)
[353]={
     levelless={3,1,0,351,2},
     [1]={1,15,2000,50},
     [2]={2,18,1500,50},
     [3]={6,30,0,50},
     },
--毒蛊 (技能id=354)
[354]={
     levelless={3,1,0,347,3},
     [1]={1,17,5000,60},
     [2]={2,20,2000,60},
     [3]={7,35,0,60},
     },
--血鼎功 (技能id=355)
[355]={
     levelless={3,1,0,352,4},
     [1]={1,21,10000,100},
     [2]={2,25,4000,100},
     [3]={5,37,0,100},
     },
--血蛊 (技能id=356)
[356]={
     levelless={3,1,0,354,2},
     [1]={1,25,15000,200},
     [2]={2,28,5000,200},
     [3]={7,43,0,200},
     },
--香蛊 (技能id=357)
[357]={
     levelless={3,1,0,347,6},
     [1]={1,29,20000,300},
     [2]={2,32,8000,300},
     [3]={7,47,0,300},
     },
--尸蛊 (技能id=358)
[358]={
     levelless={3,1,0,356,2},
     [1]={1,33,40000,500},
     [2]={2,38,12000,500},
     [3]={7,51,0,500},
     },
--妖蛊 (技能id=359)
[359]={
     levelless={3,1,0,357,2},
     [1]={1,37,60000,600},
     [2]={2,40,18000,600},
     [3]={7,55,0,600},
     },
--心蛊 (技能id=360)
[360]={
     levelless={3,1,0,358,2},
     [1]={1,40,90000,700},
     [2]={2,43,24000,700},
     [3]={7,58,0,700},
     },
--万蛊蚀天 (技能id=361)
[361]={
     levelless={3,1,0,353,6},
     [1]={1,44,140000,800},
     [2]={2,46,30000,800},
     [3]={8,58,0,800},
     },
--幻蛊 (技能id=362)
[362]={
     levelless={3,1,0,359,3},
     [1]={1,48,220000,1000},
     [2]={2,51,70000,1000},
     [3]={7,66,0,1000},
     },
--蠶蛊 (技能id=363)
[363]={
     levelless={3,3,0,360,4,361,4,362,2},
     [1]={1,55,500000,3000},
     [2]={2,58,200000,3000},
     [3]={7,73,0,3000},
     },
--无影魔蛊 (技能id=774)
[774]={
     levelless={5,1,0,363,7},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}

function showlimit(n)	--师门说话
--	if n==1 then
--		Say("<color=green>柳新竹<color>：你的武功精进了！",0)
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
	Say("T﹜ Nam r鮪g thi猲 nc c, l? n琲 sinh ra thu藅 d鬾g c c馻 ph竔 ta, b蕋 k? cao th? n祇 d輓h c v祇 l? v? phng c鴘 ch鱝. е t? ta u ph秈 bi誸 d飊g <color=yellow>tr秓<color>. C莕 ta gi髉 vi謈 chi c? n鉯?",
		6,
		"加入五毒蛊师/entergushi",
		"学习五毒蛊师武功/skilllearn",
		"е t? mu鑞 mn quy觧 C? Kinh/requestbook",
		"我得到了本门镇派秘籍的残本/change_mistery_book",
		"H穣 a ta 1 Th莕 M閏 Vng жnh/get_guding",
		"打个招呼/no")
end;

function get_guding()
	local nPlayerRoute = GetPlayerRoute();
	if nPlayerRoute ~= 21 then
		Say("<color=green>Li評 T﹏ Tr骳<color>: Ngi kh玭g ph秈  t? c馻 ta, Th莕 M閏 Vng жnh sao c? th? a cho ngi ch?!", 0)
		return 0;
	end;
	if GetItemCount(2,0,1063) >= 1 then
		Talk(1,"","<color=green>Li評 T﹏ Tr骳<color>: Ngi  c? 1 Th莕 M閏 Vng жnh r錳.");
		return 0;
	end;
	AddItem(2,0,1063,1);
	Msg2Player("B筺 nh薾 頲 1 Th莕 M閏 Vng жnh");
end;

canjuan1 = 952
canjuan2 = 953
canjuan3 = 954

-- 兑换镇派秘籍的功能 =============================================begin==
function change_mistery_book()
	local nBook1 = GetItemCount(2, 1, canjuan1)		-- 上卷
	local nBook2 = GetItemCount(2, 1, canjuan2)		-- 中卷
	local nBook3 = GetItemCount(2, 1, canjuan3)		-- 下卷
	
	if GetPlayerRoute() ~= 21 then	--流派检测
		Say("Ngi kh玭g ph秈 l?  t? c馻 ta, M藅 t辌h tr蕁 ph竔 sao c? th? giao cho ngi ch??", 0)
		return
	end	
	
	if (nBook1 == 0 and nBook2 == 0 and nBook3 == 0) then	-- 啥也没有
		Say("Ngi ch璦 t鮪g nh薾 頲 trang m藅 t辌h v? c玭g n祇 sao c? th? n鉯 l?  c? n??", 0)
		return
	end
	
	Say("Th藅 kh玭g ng? th玭g qua luy謓 th鴆 ngi l筰 c? th? nh薾 頲 M藅 t辌h tr蕁 ph竔, th藅 x鴑g ng l?   c馻 b鎛 m玭. Ta s? gi髉 ngi ng l筰 th祅h m閠 quy觧 ho祅 ch豱h nh璶g th祅h c玭g hay kh玭g c遪 xem ngi c? may m緉 kh玭g n鱝.", 
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
		AddItem(0, 112, 114, 1)
		Say("Ngi th藅 l? may m緉, y l? quy觧 M藅 t辌h tr蕁 ph竔 ho祅 ch豱h!", 0)
		Msg2Player("B筺 nh薾 頲 m閠 quy觧 M藅 t辌h tr蕁 ph竔!")
		WriteLog("[фi m藅 t辌h tr蕁 ph竔]:"..GetName().."Х i 1 Ng? чc C? S? M藅 t辌h tr蕁 ph竔, nChangeType:"..nChangeType);
	else
		WriteLog("[фi m藅 t辌h tr蕁 ph竔]:"..GetName().."фi Ng? чc C? S? M藅 t辌h tr蕁 ph竔 th蕋 b筰, nChangeType:"..nChangeType);
		Talk(1,"","фi M藅 t辌h tr蕁 ph竔 th蕋 b筰 r錳!");
	end;
end;
-- 兑换镇派秘籍的功能 =============================================end====

function tedian()		--察看技能
Say("V? c玭g tinh hoa c馻 trng ph竔 ta ch? y誹 ph? thu閏 v祇 c? m蓇, ch? c莕 chuy猲 t﹎ d飊g n閕 l鵦 nu玦 dng, nh蕋 nh c? th? sai khi課 ch髇g l祄 nh鱪g vi謈 ch髇g ta mu鑞. M閠 khi  tr髇g c c馻 ta th? ngay c? cao th? c騨g ph秈 b? tay ch辵 ch誸. е t? c馻 ta u ph秈 bi誸 d飊g c tr秓.",0)
end;


function entergushi()		--加入流派
	if GetPlayerFaction() ~= 7 then	--门派检测
		Say("Trc ti猲 ph秈 g苝 B筩h gi竜 ch? xin gia nh藀 b鎛 gi竜, r錳 m韎 quay l筰 y b竔 s? h鋍 ngh?.",0)
	elseif   GetPlayerRoute() == 19 then	--未入流派的本门弟子 
		if join_route_main(21) == 0 then
			return
		end
		Say("Luy謓 c ph秈 th藅 nh蒼 n筰. Th蕐 ngi th祅h t﹎ nh? th?, ta ch輓h th鴆 thu nh薾 ngi l祄  t?. u ti猲 ta gi髉 ngi <color=yellow>T葃 l筰 甶觤 ti襪 n╪g<color>. V? c玭g b鎛 gi竜 l蕐 <color=yellow>Linh ho箃<color> l祄 c? s?. Зy l? quy觧 <color=yellow>C? Kinh<color>, ngi h穣 t? t? nghi猲 c鴘, ng l祄 ta th蕋 v鋘g! Gi? c? th? n g苝 B筩h gi竜 ch? nh薾 <color=yellow>Nhi謒 v? s? m玭<color>.",0)
		SetPlayerRoute(21)	--直接设置流派
		LearnSkill(14)--设置双刀普通攻击
		LearnSkill(347)
		LearnSkill(351)
		AddItem(2,0,385,1)
		AddItem(2,0,1063,1);	--给他一个神木王鼎
		AddItem(0,11,1,1,1,4,65,4,66)
		ResetProperty()        --洗潜能点
		TaskTip("B筺  tr? th祅h  t? Ng? чc C? s?!")
		TaskTip("B筺  頲 t葃 l筰 ti襪 n╪g!")
		TaskTip("B筺  nh藀 m玭! C? th? n g苝 B筩h gi竜 ch? nh薾 nhi謒 v?")
	elseif   GetPlayerRoute() == 21 then
	 	Say("Luy謓 c kh玭g th? g蕄 r髏 n誹 kh玭g d? b? t萿 h醓 nh藀 ma, ngi h穣 t? t? m? nghi猲 c鴘!",0)
	else
		Say("Ngi l?  t? c馻 Ng? Thng Ch?, n ch? ta l祄 g??",0)
		
	end
end;

function skilllearn()		--学习技能
	if GetPlayerRoute() ~= 21 then	--门派检测
		Say("Ngi kh玭g ph秈 l?  t? c馻 ta, kh玭g th? h鋍 v? c玭g Ng? чc c? s?.",0)
	else
		Say("K? n╪g n祇 di g鉩 ph秈 c? d蕌 m騣 t猲 th? c? th? h鋍, nh蕄 chu閠  t╪g c蕄",0)
		AllowLearnSkill()
	end
end;

function requestbook()

	if GetPlayerRoute() ~= 21 then
		Say("Ngi kh玭g ph秈  t? c馻 ta, kh玭g th? mn C? Kinh.",0);
	else
		Say("Зy l? quy觧 C? Kinh, s竎h ch? nam v? c玭g nh藀 m玭 c馻 b鎛 gi竜, ngi h穣 t? t? nghi猲 c鴘, kh玭g 頲  m蕋 y!",0);
		AddItem(2,0,385,1);
	end
end

function change_mistery_book_linshi()
		Say("Kh玭g ng? th玭g qua vi謈 luy謓 th鴆 ngi c? th? nh薾 頲 M藅 t辌h tr蕁 ph竔, th藅 x鴑g ng l?   c馻 b鎛 m玭. Nh璶g tr蕁 ph竔 v? h鋍 n祔 ta c騨g ph秈 l躰h ng? m閠 th阨 gian m韎 c? th? truy襫 th? 頲, ngi quay l筰 sau nh?!",0)
end;

function beforelearnskill(id)
	if (id == 774) then	--无影魔蛊
		if (GetSkillLevel("V? 秐h Ma C?") <= 0) then
			return "V? 秐h Ma C?' l? <color=red>Tuy謙 h鋍 tr蕁 ph竔<color> c馻 b鎛 m玭, kh玭g ph秈 ngi c馻 b鎛 m玭 kh玭g 頲 h鋍."
		end
	end
end

function afterlearnskill(id)
	if (id == 774) then	--无影魔蛊
		if (GetSkillLevel("V? 秐h Ma C?") == 1) then
			Say("T? ch蕋 c馻 con qu? kh玭g t錳, c? b秐  l躰h h閕 頲 'V? Thi猲 Ma C玭g' c馻 b鎛 m玭, qu? l? hi誱 c?!<enter><color=green>Ngi ch琲<color>: Nh璶g? s? ph?, l骳 con th? thi tri觧 揤? Thi猲 Ma C玭g?, th蕐 n閕 kh? trong ngi kh玭g th? t? l筰 r蕋 kh? thi tri觧? Nay con  bi誸 頲 c秏 gi竎 kh玭g th? ph竧 ra nh? L鬰 M筩h Th莕 Ki誱 c馻 Чi L? 祅 Th?.<enter>V藋 l? con kh玭g bi誸 r錳, 'V? Thi猲 Ma C玭g' uy l鵦 r蕋 l韓, h鋍 r錳 mu鑞 t? do thi tri觧 c騨g kh玭g ph秈 chuy謓 d?. Tinh kh? trong ngi kh玭g th? t? l筰 l? 's竧 kh?'? (Tr? s竧 kh?), kh玭g ph竧 頲. Mu鑞 thi tri觧 th? ph秈 ti猽 t鑞 's竧 kh?'. 'S竧 kh?' g錷 10 ph莕, c? th? t╪g l猲 l骳 nh b筰 i phng ho芻 t? l筰 d莕 d莕.", 1, "уng ?/GiveMomentum")
		elseif (GetSkillLevel("V? 秐h Ma C?") == 5) then
			Say("V? 秐h Ma C?'  l躰h h閕 n c蕄 5 con qu? l? th玭g minh, nh鱪g c蕄 sau n祔 l? do con si猲g n╪g r蘮 luy謓 r錳. N? c? t蕋 c? 20 c蕄, sau khi luy謓 n  thu莕 th鬰 nh蕋 nh s? qua c蕄 m韎. 10 c蕄 cu鑙 c飊g ph秈 tham kh秓 M藅 t辌h tr蕁 ph竔 c馻 b鎛 m玭 m韎 c? th? l躰h ng?.", 0)
		end
	end
end

function GiveMomentum()
	Say("Л頲 r錳, b﹜ gi? ta s? v薾 c玭g  s竧 kh? trong ngi con t? l筰  con th? thi tri觧 'V? 秐h Ma C?'.<enter><enter>M閠 th阨 gian sau?<enter><enter>Л頲 r錳, s竧 kh? trong ngi con  h譶h th祅h, c? th? th? thi tri觧 'V? 秐h Ma C?'. H穣 nh? l蕐 tuy謙 h鋍 tr蕁 ph竔 c馻 b鎛 m玭 uy l鵦 r蕋 l韓 h穣 d飊g  gi髉  k? y誹, thay tr阨 h祅h o, kh玭g l祄 h筰 ngi v? t閕....", 0)
	SetMomentum(10)
	RandomTaskTipEx("Nh薾 頲 10 甶觤 s竧 kh? s? ph? truy襫 cho", "momentumtip")
end

