Include("\\script\\global\\技能树操作.lua")
Include("\\script\\faction\\npc\\faction_master_main.lua")

--技能列表
SKILLS={
--少林禅僧
--少林禅圆功 (技能id=45)
[45]={
     --{关键点数，前提技能数，前提技能关系（与：1，或：0），前提技能1，前提技能1等级，...}
     levelless={3,0,0,},
     --关键点（技能等级，玩家等级，玩家经验，门派贡献度}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={10,27,0,0},
	},
--伏虎气功 (技能id=46)
[46]={
     levelless={3,1,0,45,1},
     [1]={1,10,1000,0},
     [2]={2,13,500,0},
     [3]={7,28,0,0},
     	},
--少林修心法 (技能id=47)
[47]={
     levelless={3,1,0,45,1},
     [1]={1,12,1500,30},
     [2]={2,15,1200,30},
     [3]={6,27,0,30},
       },
--五转指 (技能id=48)
[48]={
     levelless={3,1,0,47,1},
     [1]={1,15,3000,50},
     [2]={2,17,800,50},
     [3]={10,33,0,50},
     },
--破魔咒 (技能id=49)
[49]={
     levelless={3,1,0,47,2},
     [1]={1,20,8000,80},
     [2]={2,22,1000,80},
     [3]={8,34,0,80},
     },
--金刚不坏 (技能id=50)
[50]={
     levelless={3,1,0,48,2},
     [1]={1,22,10000,100},
     [2]={2,24,2000,100},
     [3]={10,40,0,100},
     },
--因陀罗雷印破 (技能id=51)
[51]={
     levelless={3,1,0,46,5},
     [1]={1,26,15000,300},
     [2]={2,28,2500,300},
     [3]={8,40,0,300},
     },
--袈裟伏魔神通 (技能id=52)
[52]={
     levelless={3,1,0,46,6},
     [1]={1,31,25000,500},
     [2]={2,33,5000,500},
     [3]={8,45,0,500},
     },
--无相神功 (技能id=53)
[53]={
     levelless={3,1,0,50,4},
     [1]={1,36,55000,600},
     [2]={2,39,18000,600},
     [3]={6,51,0,600},
     },
--狮子吼 (技能id=54)
[54]={
     levelless={3,1,0,52,4},
     [1]={1,43,120000,800},
     [2]={2,47,70000,800},
     [3]={5,59,0,800},
     },
--不动明王咒 (技能id=55)
[55]={
     levelless={3,1,0,49,6},
     [1]={1,48,220000,1000},
     [2]={2,51,80000,1000},
     [3]={7,66,0,1000},
     },
--大力金刚指 (技能id=56)
[56]={
     levelless={3,2,0,51,6,54,2},
     [1]={1,55,500000,3000},
     [2]={2,58,200000,3000},
     [3]={7,73,0,3000},
     },
--洗髓经 (技能id=57)
[57]={
     levelless={5,3,1,55,7,53,6,56,7},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}

function showlimit(n)	--师门说话
--	if n==1 then
--		Say("<color=green>玄晦<color>：你的武功精进了！",0)
	if n==2 then
			Say("你的等级不足，请加倍努力!",0)
	elseif n==3 then
		Say("你的经验值不足，请加倍努力!",0)
	elseif n==4 then
		Say("你的声望不足，请继续努力!",0)
	elseif n==5 then
		Say("V? c玭g trc y r蘮 luy謓 ch璦 th祅h th鬰 sao ta d竚 d箉 ngi chi猽 m韎, d鬰 t鑓 b蕋 t!",0)
	elseif n==6 then
		Say("你的银两不足，请赚够银两再来!",0)
	else
	end
end;

function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","Х qu? 5 gi? ch琲, kh玭g th? h鋍 v? c玭g n鱝, h穣 ngh? ng琲  gi? g譶 s鴆 kh醗!")
	 	return
	 end
	Say("A Di У Ph藅! е t? tu thi襫 c? th? d飊g ph藅 ph竝 v? bi猲 o ngc ng? h祅h, ng th阨 d飊g n閕 l鵦 m筺h b秓 v? b秐 th﹏ ho芻  thng ch. <color=yellow>T輈h Trng<color> l? ph竝 b秓 chuy猲 d飊g. B莕 t╪g gi髉 g? 頲 cho ngi?",
		4,
		"加入少林禅僧/entercanseng",
		"学习少林禅僧武功/skilllearn",
		"我得到了本门镇派秘籍残本/change_mistery_book",
		"打个招呼/no")
end;

canjuan1 = 922
canjuan2 = 923
canjuan3 = 924

-- 兑换镇派秘籍的功能 =============================================begin==
function change_mistery_book()
	local nBook1 = GetItemCount(2, 1, canjuan1)		-- 上卷
	local nBook2 = GetItemCount(2, 1, canjuan2)		-- 中卷
	local nBook3 = GetItemCount(2, 1, canjuan3)		-- 下卷
	
	if GetPlayerRoute() ~= 3 then	--流派检测
		Say("Ngi kh玭g ph秈 l?  t? c馻 ta, M藅 t辌h tr蕁 ph竔 sao c? th? giao cho ngi ch??", 0)
		return
	end
	
	if (nBook1 == 0 and nBook2 == 0 and nBook3 == 0) then	-- 啥也没有
		Say("A di  ph藅! Ngi xu蕋 gia kh玭g 頲 n鉯 d鑙. Ngi ch璦 t鮪g nh薾 trang m藅 t辌h n祇 sao l筰 b秓 l?  c? n??", 0)
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
		AddItem(0, 112, 103, 1)
		Say("Ngi th藅 l? may m緉, y l? quy觧 M藅 t辌h tr蕁 ph竔 ho祅 ch豱h!", 0)
		Msg2Player("B筺 nh薾 頲 m閠 quy觧 M藅 t辌h tr蕁 ph竔!")
		WriteLog("[фi m藅 t辌h tr蕁 ph竔]:"..GetName().."фi 1 M藅 t辌h tr蕁 ph竔 c馻 Thi誹 L﹎ thi襫 t玭g, nChangeType:"..nChangeType);
	else
		WriteLog("[фi m藅 t辌h tr蕁 ph竔]:"..GetName().."фi M藅 t辌h tr蕁 ph竔 c馻 Thi誹 L﹎ thi襫 t玭g th蕋 b筰, nChangeType:"..nChangeType);
		Talk(1,"","B竜 l鏸, i M藅 t辌h tr蕁 ph竔 th蕋 b筰!");
	end;
end;
-- 兑换镇派秘籍的功能 =============================================end====


function shaolincanseng()	--察看技能
--弹界面
end;

function tedian()	--察看技能
Say("е t? tu thi襫 c? th? d飊g ph藅 ph竝 v? bi猲 o ngc ng? h祅h, ng th阨 d飊g n閕 l鵦 m筺h b秓 v? b秐 th﹏ ho芻  thng ch. T輈h Trng l? ph竝 b秓 chuy猲 d飊g.",0)
end;


function entercanseng()		--加入流派
	if GetPlayerFaction() ~= 1 then	--门派检测
		Say("Ph秈 phng trng cho ph衟 gia nh藀 Thi誹 L﹎ m韎 c? th? n y b竔 s? h鋍 ngh?.",0)
	elseif   GetPlayerRoute() == 1 then	--未入流派的本门弟子
		if join_route_main(3) == 0 then
			return
		end
		Say("Kh? 秈 v? bi猲, quay u l? b?, b莕 t╪g ch輓h th鴆 thu nh薾 ngi l祄  t?, gi髉  th玭g l筰 kinh m筩h <color=yellow>t葃 甶觤 ti襪 n╪g<color>. C玭g phu c馻 ta ch? y誹 <color=yellow>N閕 c玭g<color>, ngi  gia nh藀 l璾 ph竔 gi? c? th? n g苝 phng trng nh薾 <color=yellow>Nhi謒 v? s? m玭<color>.",0)
		SetPlayerRoute(3)	--直接设置流派
		LearnSkill(45)
		LearnSkill(46)
		AddItem(0,8,86,1,1,4,67,4,68)
		ResetProperty()        --洗潜能点
		TaskTip("B筺  tr? th祅h  t? thi襫 t╪g!")
		TaskTip("B筺  頲 t葃 甶觤 ti襪 n╪g!")
		TaskTip("B筺  nh藀 m玭! C? th? n g苝 Phng trng nh薾 nhi謒 v?")
	elseif   GetPlayerRoute() == 3 then
	 	Say("Mau 甶 luy謓 c玭g ng  m蕋 m苩 vi s?.",0)
	else
		Say("Ta kh玭g ph秈 s? ph? c馻 ngi, nh莔 r錳!",0)
	end
end;

function skilllearn()		--学习技能
	if GetPlayerRoute() ~= 3 then	--流派检测
		Say("Ngi kh玭g ph秈  t? c馻 ta kh玭g th? h鋍 v? c玭g Thi誹 L﹎ thi襫 t╪g.",0)
	else
		Say("K? n╪g n祇 di g鉩 ph秈 c? d蕌 m騣 t猲 th? c? th? h鋍, nh蕄 chu閠  t╪g c蕄",0)
		AllowLearnSkill()
	end
end;

--Say("<color=green>玄晦<color>：你要学习什么技能？",13,"少林禅圆功/chanyuan","伏虎气功/fuhu","少林修心法/xiuxin","五转指/wuzhuan","破魔咒/pomo","金刚不坏/buhuai","因陀罗雷印破/leiyin","袈裟伏魔神通/fumo","无相神功/wuxiang","狮子吼/sizihou","不动明王咒/mingwang","大力金刚指/jingang","洗髓经/xisui")


function chanyuan()
learnskill(45)
end;

function fuhu()
learnskill(46)
end;

function xiuxin()
learnskill(47)
end;

function wuzhuan()
learnskill(48)
end;

function pomo()
learnskill(49)
end;

function buhuai()
learnskill(50)
end;

function leiyin()
learnskill(51)
end;

function fumo()
learnskill(52)
end;

function wuxiang()
learnskill(53)
end;

function sizihou()
learnskill(54)
end;

function mingwang()
learnskill(55)
end;

function jingang()
learnskill(56)
end;

function xisui()
learnskill(57)
end;

function no()
end;

function change_mistery_book_linshi()
		Say("Kh玭g ng? th玭g qua vi謈 luy謓 th鴆 ngi c? th? nh薾 頲 M藅 t辌h tr蕁 ph竔, th藅 x鴑g ng l?   c馻 b鎛 m玭. Nh璶g tr蕁 ph竔 v? h鋍 n祔 ta c騨g ph秈 l躰h ng? m閠 th阨 gian m韎 c? th? truy襫 th? 頲, ngi quay l筰 sau nh?!",0)
end;

function beforelearnskill(id)
	if (id == 57) then	--洗髓经
		if (GetSkillLevel("T葃 T駓 Kinh") <= 0) then
			return "揟葃 T駓 Kinh? l? <color=red>tuy謙 h鋍 tr蕁 ph竔<color> c馻 b鎛 m玭, ch? truy襫 cho ngi t礽 gi醝."
		end
	end
end

function afterlearnskill(id)
	if (id == 57) then	--洗髓经
		if (GetSkillLevel("T葃 T駓 Kinh") == 1) then
			Say("Thi誹 hi謕 qu? nhi猲 t? ch蕋 kh玭g t?, bc u  l躰h h閕 揟葃 T駓 Kinh? c馻 b鎛 m玭, th藅 ng n?!<enter><color=green>Ngi ch琲<color>: Nh璶g... th璦 s? ph?, v? sao l骳  t? thi tri觧 揟葃 T駓 Kinh?, n閕 kh? trong ngi b? ph﹏ t竛? Х nghe danh L鬰 M筩h Th莕 Ki誱 c馻 Чi L? 祅 Th? t? l﹗, ngh? n c騨g kh玭g d竚, h玬 nay l筰 c? d辮 th?. <enter>Thi誹 hi謕 c遪 ch璦 bi誸 甶襲 n祔, 揟葃 T駓 Kinh攔蕋 m筺h, cho d? may m緉 h鋍 頲, nh璶g ch璦 ch綾 甶襲 khi觧 頲 n?. Tinh kh? b猲 trong c? th? kh玭g t輈h t? th祅h 搒竧 kh輸? (m鴆 s竧 kh?), th? kh玭g th? thi tri觧 v? c玭g n祔, c莕 ti猽 hao 搒竧 kh輸 b猲 trong. 揝竧 kh輸 g錷 10 ph莕, t╪g khi c玭g ph? s竧 thng, d莕 d莕 t輈h t? l筰.", 1, "уng ?/GiveMomentum")
		elseif (GetSkillLevel("T葃 T駓 Kinh") == 5) then
			Say("Thi誹 hi謕 qu? nhi猲 t? ch蕋 th玭g minh, 揟葃 T駓 Kinh?  l躰h h閕 頲 5 ph莕. V? c玭g n祔 c? 20 c蕄, t? c蕄 5 tr? 甶 thi誹 hi謕 c莕 ra s鴆 luy謓 c玭g, n m閠 m鴆 nh蕋 nh s? t╪g th猰 1 c蕄. T? c蕄 10 tr? 甶 ph秈 l躰h h閕 M藅 t辌h tr蕁 ph竔 c馻 b鎛 m玭, m韎 c? th? h鋍 頲.", 0)
		end
	end
end

function GiveMomentum()
	Say("Ta 產ng v薾 c玭g ch? d蒼 ngi t輈h t? 10 ph莕 s竧 kh? trong ngi,  ngi th? thi tri觧 揟葃 T駓 Kinh?. <enter><enter>L﹗ sau...<enter><enter>S竧 kh? trong ngi thi誹 hi謕  h譶h th祅h, l骳 n祔 c? th? th? thi tri觧 揟葃 T駓 Kinh?. Tuy謙 h鋍 tr蕁 ph竔 c馻 b鎛 m玭 uy l鵦 d騨g m穘h, ch? d飊g  tr? b筼 gi髉 k? y誹, thay tr阨 h祅h o, ng h筰 ngi v? t閕, h穣 nh? k? l蕐...", 0)
	SetMomentum(10)
	RandomTaskTipEx("Nh薾 頲 10 甶觤 s竧 kh? s? ph? truy襫 cho", "momentumtip")
end

