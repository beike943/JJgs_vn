Include("\\script\\global\\技能树操作.lua")
Include("\\script\\faction\\npc\\faction_master_main.lua")

--技能列表
SKILLS={
--武当道家
--武当剑经 (技能id=125)
[125]={
     --{关键点数，前提技能数，前提技能关系（与：1，或：0），前提技能1，前提技能1等级，...}
     levelless={3,0,0,},
     --关键点（技能等级，玩家等级，玩家经验，门派贡献度}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={10,27,0,0},
	},
--武当剑法 (技能id=126)
[126]={
     levelless={3,1,0,125,1},
     [1]={1,10,1000,0},
     [2]={2,12,200,0},
     [3]={8,24,0,0},
     	},
--流光剑法 (技能id=127)
[127]={
     levelless={3,1,0,126,3},
     [1]={1,15,3000,60},
     [2]={2,17,800,60},
     [3]={8,29,0,60},
     },
--未央剑法 (技能id=128)
[128]={
     levelless={3,1,0,126,3},
     [1]={1,16,4000,60},
     [2]={2,18,900,60},
     [3]={8,30,0,60},
     },
--柔云剑法 (技能id=129)
[129]={
     levelless={3,1,0,126,3},
     [1]={1,15,3000,60},
     [2]={2,17,800,60},
     [3]={8,29,0,60},
     },
--烈焰剑法 (技能id=130)
[130]={
     levelless={3,1,0,126,3},
     [1]={1,16,4000,60},
     [2]={2,18,900,60},
     [3]={8,30,0,60},
     },
--奔雷剑法 (技能id=131)
[131]={
     levelless={3,1,0,126,3},
     [1]={1,16,4000,60},
     [2]={2,18,900,60},
     [3]={8,30,0,60},
     },
--无我心法 (技能id=132)
[132]={
     levelless={3,1,0,125,6},
     [1]={1,22,10000,100},
     [2]={2,24,2000,100},
     [3]={9,38,0,100},
     },
--太清剑气 (技能id=133)
[133]={
     levelless={3,1,0,127,6},
     [1]={1,28,20000,300},
     [2]={2,31,8000,300},
     [3]={7,46,0,300},
     },
--缠梦剑意 (技能id=134)
[134]={
     levelless={3,1,0,128,6},
     [1]={1,29,20000,400},
     [2]={2,32,8000,400},
     [3]={6,44,0,400},
     },
--落霜剑意 (技能id=135)
[135]={
     levelless={3,1,0,129,6},
     [1]={1,29,20000,400},
     [2]={2,32,8000,400},
     [3]={6,44,0,400},
     },
--炙阳剑气 (技能id=136)
[136]={
     levelless={3,1,0,130,6},
     [1]={1,28,20000,300},
     [2]={2,31,8000,300},
     [3]={7,46,0,300},
     },
--玄武剑阵 (技能id=137)
[137]={
     levelless={3,1,0,131,6},
     [1]={1,30,27000,500},
     [2]={2,34,10000,500},
     [3]={5,46,0,500},
     },
--御剑诀 (技能id=138)
[138]={
     levelless={3,1,0,125,6},
     [1]={1,36,55000,600},
     [2]={2,40,30000,600},
     [3]={5,52,0,600},
     },
--正两仪剑法 (技能id=139)
[139]={
     levelless={3,1,0,126,6},
     [1]={1,41,100000,800},
     [2]={2,44,30000,800},
     [3]={6,56,0,800},
     },
--太乙三清剑 (技能id=140)
[140]={
     levelless={3,1,0,133,5},
     [1]={1,46,150000,1000},
     [2]={2,49,42000,1000},
     [3]={7,64,0,1000},
     },
--神门十三剑 (技能id=141)
[141]={
     levelless={3,1,0,134,5},
     [1]={1,47,180000,1000},
     [2]={2,50,45000,1000},
     [3]={7,65,0,1000},
     },
--地宁玄阴剑 (技能id=142)
[142]={
     levelless={3,1,0,135,5},
     [1]={1,46,150000,1000},
     [2]={2,49,42000,1000},
     [3]={7,64,0,1000},
     },
--天清纯阳剑 (技能id=143)
[143]={
     levelless={3,1,0,136,5},
     [1]={1,47,180000,1000},
     [2]={2,50,45000,1000},
     [3]={7,65,0,1000},
     },
--八卦剑气 (技能id=144)
[144]={
     levelless={3,1,0,137,5},
     [1]={1,48,200000,1000},
     [2]={2,51,48000,1000},
     [3]={7,66,0,1000},
     },
--真武七截剑 (技能id=145)
[145]={
     levelless={3,1,0,139,5},
     [1]={1,55,500000,3000},
     [2]={2,58,200000,3000},
     [3]={7,73,0,3000},
     },
--无上太极剑 (技能id=146)
[146]={
     levelless={5,6,1,140,7,141,7,142,7,143,7,144,7,145,7},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}


function showlimit(n)	--师门说话
--	if n==1 then
--		Say("<color=green>俞振生<color>：你的武功精进了！",0)
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
	Say("D? kh? ng? ki誱, ki誱 kh? h頿 nh蕋, h? ph竔 ta l? ki誱 kh?, mn <color=yellow>ki誱<color> ph竧 ra ki誱 kh?. Kh玭g bi誸 ta c? th? gi髉 g??",
		4,
		"加入武当道家/enterdaojia",
		"学习武当道家武功/skilllearn",
		"我得到了本门镇派秘籍的残本/change_mistery_book",
		"跟道长打个招呼/no")
end;

canjuan1 = 940
canjuan2 = 941
canjuan3 = 942

-- 兑换镇派秘籍的功能 =============================================begin==
function change_mistery_book()
	local nBook1 = GetItemCount(2, 1, canjuan1)		-- 上卷
	local nBook2 = GetItemCount(2, 1, canjuan2)		-- 中卷
	local nBook3 = GetItemCount(2, 1, canjuan3)		-- 下卷
	
	if GetPlayerRoute() ~= 14 then	--流派检测
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
	Say("N誹 c?  3 t藀 Thng_Trung_H?, ta nh蕋 nh s? gi髉 ngi ng l筰 th祅h m閠 quy觧 ho祅 ch豱h", 
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
		AddItem(0, 112, 109, 1)
		Say("Ngi th藅 l? may m緉, y l? quy觧 M藅 t辌h tr蕁 ph竔 ho祅 ch豱h!", 0)
		Msg2Player("B筺 nh薾 頲 m閠 quy觧 M藅 t辌h tr蕁 ph竔!")
		WriteLog("[фi m藅 t辌h tr蕁 ph竔]:"..GetName().."фi l蕐 M藅 t辌h tr蕁 ph竔 V? ng o gia, nChangeType:"..nChangeType);
	else
		WriteLog("[фi m藅 t辌h tr蕁 ph竔]:"..GetName().."фi l蕐 M藅 t辌h tr蕁 ph竔 V? ng o gia th蕋 b筰, nChangeType:"..nChangeType);
		Talk(1,"","Xin l鏸, i l蕐 M藅 t辌h tr蕁 ph竔 th蕋 b筰!");
	end;
end;
-- 兑换镇派秘籍的功能 =============================================end====


function daojia()		--察看技能
--弹界面
end;

function tedian()		--察看技能
Say("D? kh? ng? ki誱, ki誱 kh? h頿 nh蕋, h? ph竔 ta l? ki誱 kh?, mn ki誱 ph竧 ra ki誱 kh?.",0)
end;


function enterdaojia()		--加入流派
	if GetPlayerFaction() ~= 2 then	--门派检测
		Say("Ngi ph秈 頲 V? ng chng m玭 T? H筩 Ch﹏ Nh﹏ ch蕄 thu薾 m韎 頲 gia nh藀 V? ng, sau  c? th? n t譵 ta b竔 s? h鋍 ngh?.",0)
	elseif   GetPlayerRoute() == 13 then	--未入流派的本门弟子 
		if join_route_main(14) == 0 then
			return
		end
		Say("Vi s? ch輓h th鴆 nh薾 ngi l祄  t? v? gi髉 ngi  th玭g kinh m筩h, <color=yellow>t葃 l筰 甶觤 ti襪 n╪g<color>. V? c玭g h? ph竔 l蕐 <color=yellow>N閕 c玭g<color> l祄 tr鋘g. Sau n祔 h穣 c? g緉g r蘮 luy謓! Gi? ngi c? th? n g苝 Chng m玭 ti誴 nh薾 <color=yellow>Nhi謒 v? m玭 ph竔<color>.",0)
		SetPlayerRoute(14)	--直接设置流派
		LearnSkill(125)
		LearnSkill(126)
		AddItem(0,2,16,1,1,4,67,4,68)
		ResetProperty()        --洗潜能点
		TaskTip("B筺  tr? th祅h  t? V? ng o gia!")
		TaskTip("B筺   頲 t葃 甶觤 ti襪 n╪g!")
		TaskTip("B筺  nh藀 m玭! C? th? t譵 Chng m玭 nh薾 nhi謒 v? ")
	elseif   GetPlayerRoute() == 14 then
	 	Say("H穣 c? g緉g luy謓 t藀! Mai n祔 ph竧 dng quang i b鎛 ph竔.",0)
	else
		Say("Ta ch? l? s? b? c馻 ngi! Kh玭g ph秈 s? ph? c馻 ngi! Sao c? qu猲 ho礽 v藋?",0)
	end
end;

function skilllearn()		--学习技能
	if GetPlayerRoute() ~= 14 then	--流派检测
		Say("Ngi kh玭g ph秈 l?  t? c馻 ta, kh玭g th? h鋍 v? c玭g V? ng o gia.",0)
	else
		Say("G鉩 ph秈 ph輆 di bi觰 tng v? c玭g xu蕋 hi謓 d蕌 {v} bi觰 th? c? th? h鋍 v? c玭g n祔, d蕌 m騣 t猲 bi觰 th? c? th? t╪g c蕄, nh蕄 tr鵦 ti誴 v祇  t╪g c蕄.",0)
		AllowLearnSkill()
	end
end;


function jianjing()
learnskill(125)
end;

function jianfa()
learnskill(126)
end;

function liuguang()
learnskill(127)
end;

function weiyang()
learnskill(128)
end;

function rouyun()
learnskill(129)
end;

function lieyan()
learnskill(130)
end;

function benlei()
learnskill(131)
end;

function wuwo()
learnskill(132)
end;

function taiqing()
learnskill(133)
end;

function chanmeng()
learnskill(134)
end;

function luoshuang()
learnskill(135)
end;

function yanyang()
learnskill(136)
end;

function xuanwu()
learnskill(137)
end;

function yujian()
learnskill(138)
end;

function zhengfan()
learnskill(139)
end;

function taiyi()
learnskill(140)
end;

function shenmen()
learnskill(141)
end;

function dining()
learnskill(142)
end;

function tianqing()
learnskill(143)
end;


function bagua()
learnskill(144)
end;

function zhenwu()
learnskill(145)
end;

function wushang()
learnskill(146)
end;

function no()
end;

function change_mistery_book_linshi()
		Say("Kh玭g ng? th玭g qua vi謈 luy謓 th鴆 ngi c? th? nh薾 頲 M藅 t辌h tr蕁 ph竔, th藅 x鴑g ng l?   c馻 b鎛 m玭. Nh璶g tr蕁 ph竔 v? h鋍 n祔 ta c騨g ph秈 l躰h ng? m閠 th阨 gian m韎 c? th? truy襫 th? 頲, ngi quay l筰 sau nh?!",0)
end;

function beforelearnskill(id)
	if (id == 146) then	--无上太极剑
		if (GetSkillLevel("V? Thng Th竔 C鵦 Ki誱") <= 0) then
			return "\'V? Thng Th竔 C鵦 Ki誱\' l? <color=red>Tuy謙 h鋍 tr蕁 ph竔<color>, kh玭g ph秈  t? b鎛 m玭 th? kh玭g th? n緈 頲."
		end
	end
end

function afterlearnskill(id)
	if (id == 146) then	--无上太极剑
		if (GetSkillLevel("V? Thng Th竔 C鵦 Ki誱") == 1) then
			Say("Thi誹 hi謕 qu? nhi猲 t? ch蕋 th﹎ s﹗,  bc u l躰h ng? 頲 \'V? Thng Th竔 C鵦 Ki誱\', th藅 ng n?! <enter><color=green>Ngi ch琲<color>: Nh璶g....s? ph?, t筰 sao khi con th? thi tri觧 \'V? Thng Th竔 C鵦 Ki誱\', n閕 kh? ph﹏ t竛, kh? m? thi tri觧? Nghe n鉯 L鬰 M筩h Th莕 Ki誱 ? 筺 Th?,  ao c t? l﹗, h玬 nay m韎 th? 頲. <enter>\'V? Thng Th竔 C鵦 Ki誱\' r蕋 l頸 h筰, cho d? c? may m緉 h鋍 頲, mu鑞 s? d鬾g th祅h th筼,  kh玭g ph秈 l? chuy謓 d?.", 1, "уng ?/GiveMomentum")
		elseif (GetSkillLevel("V? Thng Th竔 C鵦 Ki誱") == 5) then
			Say("Thi誹 hi謕 qu? nhi猲 t? ch蕋 th玭g minh, \'V? Thng Th竔 C鵦 Ki誱\'  l躰h h閕 頲 5 ph莕. C遪 xa m韎 t n c秐h gi韎 cao nh蕋. Lo筰 v? c玭g n祔 g錷 20 c蕄, 5 c蕄 sau c莕 thi誹 hi謕 kh? luy謓 h琻 n鱝, 10 c蕄 cu鑙 c莕 c? m藅 t輈h tr蕁 ph竔 m韎 l躰h h閕 頲.", 0)
		end
	end
end

function GiveMomentum()
	Say("Th玦 頲,  ta v薾 c玭g gi髉 ngi thi tri觧 \'V? Thng Th竔 C鵦 Ki誱\'.<enter><enter>R蕋 l﹗....<enter><enter>Л頲 r錳, s竧 kh?  h譶h th祅h, c? th? th? thi tri觧 \'V? Thng Th竔 C鵦 Ki誱\'. Tuy謙 h鋍 tr蕁 ph竔 r蕋 m筺h, d飊g  tr? gian di謙 b筼, thay tr阨 h祅h o, kh玭g h筰 ngi v? t閕...", 0)
	SetMomentum(10)
	RandomTaskTipEx("Nh薾 頲 10 甶觤 s竧 kh? s? ph? truy襫 cho", "momentumtip")
end

