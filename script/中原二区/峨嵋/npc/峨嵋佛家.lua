Include("\\script\\global\\技能树操作.lua")
Include("\\script\\faction\\npc\\faction_master_main.lua")

--技能列表
SKILLS={
--娥眉出家
--玉女心经 (技能id=75)
[75]={
     --{关键点数，前提技能数，前提技能关系（与：1，或：0），前提技能1，前提技能1等级，...}
     levelless={3,0,0,},
     --关键点（技能等级，玩家等级，玩家经验，门派贡献度}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={10,27,0,0},
	},
--观音诀 (技能id=76)
[76]={
     levelless={3,1,0,75,1},
     [1]={1,10,1000,0},
     [2]={2,13,800,0},
     [3]={6,25,0,0},
     	},
--峨嵋佛意 (技能id=77)
[77]={
     levelless={3,1,0,76,2},
     [1]={1,16,3000,50},
     [2]={2,20,3000,50},
     [3]={5,32,0,50},
       },
--玉女剑法 (技能id=78)
[78]={
     levelless={3,1,0,75,1},
     [1]={1,12,1500,30},
     [2]={2,15,1200,30},
     [3]={7,30,0,30},
     },
--渡元诀 (技能id=79)
[79]={
     levelless={3,1,0,76,3},
     [1]={1,20,8000,80},
     [2]={2,23,2500,80},
     [3]={6,35,0,80},
     },
--佛光普照 (技能id=80)
[80]={
     levelless={3,1,0,76,4},
     [1]={1,23,11000,100},
     [2]={2,27,7000,100},
     [3]={5,39,0,100},
     },
--莲华心经 (技能id=81)
[81]={
     levelless={3,1,0,76,4},
     [1]={1,26,15000,200},
     [2]={2,28,2500,200},
     [3]={8,40,0,200},
     },
--清音梵唱 (技能id=82)
[82]={
     levelless={3,1,0,79,3},
     [1]={1,30,27000,300},
     [2]={2,33,9000,300},
     [3]={7,48,0,300},
     },
--流水诀 (技能id=83)
[83]={
     levelless={3,1,0,81,3},
     [1]={1,34,45000,500},
     [2]={2,36,7000,500},
     [3]={9,50,0,500},
     },
--普济众生 (技能id=84)
[84]={
     levelless={3,2,0,76,6,82,2},
     [1]={1,39,80000,700},
     [2]={2,42,20000,700},
     [3]={6,54,0,700},
     },
--不灭心法 (技能id=85)
[85]={
     levelless={3,1,0,83,2},
     [1]={1,43,100000,800},
     [2]={2,47,60000,800},
     [3]={5,59,0,800},
     },
--佛光战气 (技能id=86)
[86]={
     levelless={3,1,0,80,5},
     [1]={1,48,220000,1000},
     [2]={2,51,70000,1000},
     [3]={6,63,0,1000},
     },
--佛音战意 (技能id=87)
[87]={
     levelless={3,1,0,80,5},
     [1]={1,50,220000,1200},
     [2]={2,53,70000,1200},
     [3]={6,65,0,1200},
     },
--大慈大悲咒 (技能id=88)
[88]={
     levelless={3,1,0,84,4},
     [1]={1,55,500000,3000},
     [2]={2,58,200000,3000},
     [3]={7,73,0,3000},
     },
--万相神功 (技能id=89)
[89]={
     levelless={5,4,1,86,6,87,6,85,5,88,7},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}


function showlimit(n)	--师门说话
--	if n==1 then
--		Say("<color=green>慧心师太<color>：你的武功精进了！",0)
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
	Say("Ph祄 l?  t? b鎛 ph竔 ph秈 to祅 t﹎ hng Ph藅, l蕐 Ph藅 ph竝  nh﹏. <color=yellow>Ki誱<color> l? v? kh? s? trng c馻 b鎛 ph竔. Kh玭g bi誸 ta c? th? gi髉 g??",
		4,
		"加入峨眉佛家/enterfojia",
		"学习峨眉佛家武功/skilllearn",
		"我得到了本门镇派秘籍的残本/change_mistery_book",
		"打个招呼/no")
end;

canjuan1 = 928
canjuan2 = 929
canjuan3 = 930

-- 兑换镇派秘籍的功能 =============================================begin==
function change_mistery_book()
	local nBook1 = GetItemCount(2, 1, canjuan1)		-- 上卷
	local nBook2 = GetItemCount(2, 1, canjuan2)		-- 中卷
	local nBook3 = GetItemCount(2, 1, canjuan3)		-- 下卷
	
	if GetPlayerRoute() ~= 8 then	--流派检测
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
		AddItem(0, 112, 105, 1)
		Say("Ngi th藅 l? may m緉, y l? quy觧 M藅 t辌h tr蕁 ph竔 ho祅 ch豱h!", 0)
		Msg2Player("B筺 nh薾 頲 m閠 quy觧 M藅 t辌h tr蕁 ph竔!")
		WriteLog("[фi m藅 t辌h tr蕁 ph竔]:"..GetName().."фi l蕐 M藅 t辌h tr蕁 ph竔 Nga My Ph藅 gia, nChangeType:"..nChangeType);
	else
		WriteLog("[фi m藅 t辌h tr蕁 ph竔]:"..GetName().."фi l蕐 M藅 t辌h tr蕁 ph竔 Nga My Ph藅 gia th蕋 b筰, nChangeType:"..nChangeType);
		Talk(1,"","Xin l鏸, i l蕐 M藅 t辌h tr蕁 ph竔 th蕋 b筰!");
	end;
end;
-- 兑换镇派秘籍的功能 =============================================end====


function fojia()		--察看技能
--弹界面
end;

function tedian()		--察看技能
Say("Ph祄 l?  t? b鎛 ph竔 ph秈 to祅 t﹎ hng Ph藅, l蕐 Ph藅 ph竝  nh﹏. <color=yellow>Ki誱<color> l? v? kh? s? trng c馻 b鎛 ph竔.",0)
end;


function enterfojia()		--加入流派
	if GetPlayerFaction() ~= 3 then	  --门派检测
		Say("C? nng ph秈 頲 s? ng ? c馻 Ch﹏ Nh? S? Th竔 m韎 c? th? gia nh藀 Nga My, sau  m韎 c? th? b竔 s? h鋍 ngh?.",0)
	elseif   GetPlayerRoute() == 7 then	--未入流派的本门弟子 
		if join_route_main(8) == 0 then
			return
		end
		Say("Tr? ma v? o l? b鎛 ph薾 c馻  t? Nga My. Ngi c? quy誸 t﹎ nh? th? ta r蕋 vui m鮪g. Vi s? ch輓h th鴆 nh薾 ngi l祄  t? v? gi髉 ngi  th玭g kinh m筩h, <color=yellow>t葃 l筰 甶觤 ti襪 n╪g<color>. B鎛 m玭 l蕐 <color=yellow>N閕 c玭g<color> l祄 g鑓, sau n祔 h穣 c? g緉g luy謓 t藀. Gi? ngi c? th? n g苝 Chng m玭  ti誴 nh薾 <color=yellow>Nhi謒 v? s? m玭<color>.",0)
		SetPlayerRoute(8)	--直接设置流派
		LearnSkill(75)
		LearnSkill(76)
		AddItem(0,2,16,1,1,4,67,4,68)
		ResetProperty()        --洗潜能点
		TaskTip("B筺  tr? th祅h  t? Ph藅 gia Nga My")
		TaskTip("B筺  頲 t葃 甶觤 ti襪 n╪g.")
		TaskTip("B筺  nh藀 m玭! C? th? n g苝 Chng m玭 nh薾 nhi謒 v?")
	elseif   GetPlayerRoute() == 8 then
	 	Say("H穣 c? g緉g luy謓 c玭g! Kh玭g ch鮪g c? ng祔 ngi s? thay vi s? ph竧 dng b鎛 ph竔.",0)
	else
		Say("S? ph? c馻 ngi l? Hu?  S? Th竔 m韎 ph秈.",0)
	end
end;

function skilllearn()		--学习技能
	if GetPlayerRoute() ~= 8 then	--门派检测
		Say("Ngi kh玭g ph秈  t? c馻 ta, kh玭g th? h鋍 v? c玭g Nga My Ph藅 gia.",0)
	else
		Say("G鉩 ph秈 ph輆 di bi觰 tng v? c玭g xu蕋 hi謓 d蕌 m騣 t猲 bi觰 th? c? th? h鋍 v? c玭g n祔, nh蕁 chu閠  t╪g c蕄.",0)
		AllowLearnSkill()
	end
end;




function sunv()
learnskill(75)
end;

function guanyin()
learnskill(76)
end;

function foyi()
learnskill(77)
end;

function yunv()
learnskill(78)
end;

function duyuan()
learnskill(79)
end;

function puzhao()
learnskill(80)
end;

function lianhua()
learnskill(81)
end;

function qingyin()
learnskill(82)
end;

function liushui()
learnskill(83)
end;

function puji()
learnskill(84)
end;

function bumie()
learnskill(85)
end;

function zhanqi()
learnskill(86)
end;

function zhanyi()
learnskill(87)
end;

function dabei()
learnskill(88)
end;

function wanxiang()
learnskill(89)
end;


function no()
end;

function change_mistery_book_linshi()
		Say("Kh玭g ng? th玭g qua vi謈 luy謓 th鴆 ngi c? th? nh薾 頲 M藅 t辌h tr蕁 ph竔, th藅 x鴑g ng l?   c馻 b鎛 m玭. Nh璶g tr蕁 ph竔 v? h鋍 n祔 ta c騨g ph秈 l躰h ng? m閠 th阨 gian m韎 c? th? truy襫 th? 頲, ngi quay l筰 sau nh?!",0)
end;

function beforelearnskill(id)
	if (id == 89) then	--万相神功
		if (GetSkillLevel("V筺 Tng Th莕 C玭g") <= 0) then
			return "\'V筺 Tng th莕 c玭g\' l? <color=red>Tuy謙 h鋍 tr蕁 ph竔<color>, kh玭g ph秈  t? b鎛 m玭 th? kh玭g th? n緈 頲."
		end
	end
end

function afterlearnskill(id)
	if (id == 89) then	--万相神功
		if (GetSkillLevel("V筺 Tng Th莕 C玭g") == 1) then
			Say("Thi誹 hi謕 qu? nhi猲 t? ch蕋 th﹎ s﹗,  bc u l躰h ng? 頲 \'V筺 Tng th莕 c玭g\', th藅 ng n?! <enter><color=green>Ngi ch琲<color>: Nh璶g....s? ph?, t筰 sao khi con th? thi tri觧 \'V筺 Tng th莕 c玭g\', n閕 kh? ph﹏ t竛, kh? m? thi tri觧? Nghe n鉯 L鬰 M筩h Th莕 Ki誱 ? 筺 Th?,  ao c t? l﹗, h玬 nay m韎 th? 頲. <enter>\'V筺 Tng th莕 c玭g\' r蕋 l頸 h筰, cho d? c? may m緉 h鋍 頲, mu鑞 s? d鬾g th祅h th筼,  kh玭g ph秈 l? chuy謓 d?.", 1, "уng ?/GiveMomentum")
		elseif (GetSkillLevel("V筺 Tng Th莕 C玭g") == 5) then
			Say("Thi誹 hi謕 qu? nhi猲 t? ch蕋 th玭g minh, \'V筺 Tng th莕 c玭g\'  l躰h h閕 頲 5 ph莕. C遪 xa m韎 t n c秐h gi韎 cao nh蕋. Lo筰 v? c玭g n祔 g錷 20 c蕄, 5 c蕄 sau c莕 thi誹 hi謕 kh? luy謓 h琻 n鱝, 10 c蕄 cu鑙 c莕 c? m藅 t輈h tr蕁 ph竔 m韎 l躰h h閕 頲.", 0)
		end
	end
end

function GiveMomentum()
	Say("Th玦 頲,  ta gi髉 ngi thi tri觧 \'V筺 Tng th莕 c玭g\'. <enter><enter>R蕋 l﹗....<enter><enter>Л頲 r錳, s竧 kh?  h譶h th祅h, c? th? th? thi tri觧 \'V筺 Tng th莕 c玭g\'. Tuy謙 h鋍 tr蕁 ph竔 r蕋 m筺h, d飊g  tr? gian di謙 b筼, thay tr阨 h祅h o, kh玭g h筰 ngi v? t閕...", 0)
	SetMomentum(10)
	RandomTaskTipEx("Nh薾 頲 10 甶觤 s竧 kh? s? ph? truy襫 cho", "momentumtip")
end

