Include("\\script\\global\\技能树操作.lua")
Include("\\script\\faction\\npc\\faction_master_main.lua")

Include("\\script\\task\\faction\\faction_main_tm.lua"); -- 唐门师门任务的脚本头文件

--技能列表
SKILLS={
--唐门
--唐门暗器 (技能id=58)
[58]={
     --{关键点数，前提技能数，前提技能关系（与：1，或：0），前提技能1，前提技能1等级，...}
     levelless={3,0,0,},
     --关键点（技能等级，玩家等级，玩家经验，门派贡献度}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={10,27,0,0},
	},
--暗器制作术 (技能id=59)
[59]={
     levelless={3,1,0,60,1},
     [1]={1,14,3000,50},
     [2]={2,16,500,50},
     [3]={9,30,0,50},
     	},
--心眼 (技能id=60)
[60]={
     levelless={3,1,0,58,1},
     [1]={1,10,1000,0},
     [2]={2,13,500,0},
     [3]={7,28,0,0},
       },
--毒刺骨 (技能id=61)
[61]={
     levelless={3,1,0,58,1},
     [1]={1,12,1500,30},
     [2]={2,15,1200,30},
     [3]={7,30,0,30},
     },
--解毒秘术 (技能id=62)
[62]={
     levelless={3,1,0,60,2},
     [1]={1,17,5000,60},
     [2]={2,21,3000,60},
     [3]={5,33,0,60},
     },
--勾魂阱 (技能id=63)
[63]={
     levelless={3,1,0,58,4},
     [1]={1,20,8000,80},
     [2]={2,23,2500,80},
     [3]={6,35,0,80},
     },
--机关破解术 (技能id=64)
[64]={
     levelless={3,1,0,61,2},
     [1]={1,22,10000,100},
     [2]={2,25,4000,100},
     [3]={6,37,0,100},
     },
--追心箭 (技能id=65)
[65]={
     levelless={3,1,0,59,3},
     [1]={1,25,15000,200},
     [2]={2,28,5000,200},
     [3]={6,40,0,200},
     },
--秋毫明查 (技能id=66)
[66]={
     levelless={3,1,0,63,2},
     [1]={1,27,18000,300},
     [2]={2,30,6000,300},
     [3]={6,42,0,300},
     },
--穿心刺 (技能id=67)
[67]={
     levelless={3,1,0,64,2},
     [1]={1,30,27000,500},
     [2]={2,33,9000,500},
     [3]={7,48,0,500},
     },
--淬毒秘术 (技能id=68)
[68]={
     levelless={3,1,0,62,4},
     [1]={1,34,45000,500},
     [2]={2,38,15000,500},
     [3]={5,50,0,500},
     },
--夺魄幡 (技能id=69)
[69]={
     levelless={3,1,0,66,2},
     [1]={1,36,55000,600},
     [2]={2,39,18000,600},
     [3]={6,51,0,600},
     },
--暴雨梨花针 (技能id=70)
[70]={
     levelless={3,1,0,65,4},
     [1]={1,40,90000,700},
     [2]={2,43,30000,700},
     [3]={7,58,0,700},
     },
--含沙射影 (技能id=71)
[71]={
     levelless={3,1,0,68,2},
     [1]={1,45,160000,800},
     [2]={2,48,50000,800},
     [3]={6,60,0,800},
     },
--锁命针 (技能id=72)
[72]={
     levelless={3,2,0,67,5,69,3},
     [1]={1,50,280000,1000},
     [2]={2,53,90000,1000},
     [3]={7,68,0,1000},
     },
--满天花雨 (技能id=73)
[73]={
     levelless={3,1,0,70,4},
     [1]={1,55,500000,3000},
     [2]={2,58,200000,3000},
     [3]={7,73,0,3000},
     },
--吸星阵 (技能id=74)
[74]={
     levelless={5,3,1,73,7,71,6,72,7},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}

function showlimit(n)	--师门说话
--	if n==1 then
--		Say("<color=green>唐天啸<color>：你的武功精进了！",0)
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
	local nTaskValue = FN_GetTaskState(FN_TM)
	if (nTaskValue==1) then
		task_003();
		return
	elseif (nTaskValue<8) then
		Say("T鎛g qu秐 Y dc ph遪g Л阯g Xu﹏ 產ng ch? m閠 lo筰 thu鑓 m韎. H穣 n  xem th?.",0);
		return
	else
		Say("V? c玭g b鎛 m玭 nh? nh祅g linh ho箃, c? th? t蕁 c玭g k? ch t? xa, <color=yellow>c筸 b蓎<color> c m玭 c? th? l祄 ti猽 hao s鴆 l鵦 ch. е t? b鎛 m玭 thng d飊g <color=yellow>竚 kh?<color> l祄 v? kh? ch輓h. Ta c? th? gi髉 g??",
			4,
			"加入唐门暗器/entertangmen",
			"学习唐门暗器武功/skilllearn",
			"我得到了本门镇派秘籍的残本/change_mistery_book",
			"打个招呼/no");
	end
end;

canjuan1 = 925
canjuan2 = 926
canjuan3 = 927

-- 兑换镇派秘籍的功能 =============================================begin==
function change_mistery_book()
	local nBook1 = GetItemCount(2, 1, canjuan1)		-- 上卷
	local nBook2 = GetItemCount(2, 1, canjuan2)		-- 中卷
	local nBook3 = GetItemCount(2, 1, canjuan3)		-- 下卷
	
	if GetPlayerRoute() ~= 6 then	--流派检测
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
		AddItem(0, 112, 104, 1)
		Say("Ngi th藅 l? may m緉, y l? quy觧 M藅 t辌h tr蕁 ph竔 ho祅 ch豱h!", 0)
		Msg2Player("B筺 nh薾 頲 m閠 quy觧 M藅 t辌h tr蕁 ph竔!")
		WriteLog("[фi m藅 t辌h tr蕁 ph竔]:"..GetName().."фi l蕐 1 Л阯g M玭 M藅 t辌h tr蕁 ph竔, nChangeType:"..nChangeType);
	else
		WriteLog("[фi m藅 t辌h tr蕁 ph竔]:"..GetName().."фi l蕐 Л阯g M玭 M藅 t辌h tr蕁 ph竔 th蕋 b筰, nChangeType:"..nChangeType);
		Talk(1,"","Xin l鏸, i l蕐 M藅 t辌h tr蕁 ph竔 th蕋 b筰!");
	end;
end;
-- 兑换镇派秘籍的功能 =============================================end====


function tangmenskill()		--察看技能
--弹界面
end;

function tedian()		--察看技能
Say("V? c玭g b鎛 m玭 nh? nh祅g linh ho箃, c? th? t蕁 c玭g k? ch t? xa, <color=yellow>c筸 b蓎<color> c m玭 c? th? l祄 ti猽 hao s鴆 l鵦 ch. е t? b鎛 m玭 thng d飊g 竚 kh? l祄 v? kh? ch輓h.",0)
end;


function entertangmen()		--加入流派
	if GetPlayerFaction() ~= 5 then	--门派检测
		Say("Ngi ph秈 頲 L穙 l穙 ng ? m韎 c? th? gia nh藀 Л阯g M玭, sau  m韎 c? th? n t譵 ta b竔 s? h鋍 ngh?.",0)
	elseif   GetPlayerRoute() == 5 then	--未入流派的本门弟子 
		if join_route_main(6) == 0 then
			return
		end
		Say("L穙 l穙  ng ?! V藋 ta ch輓h th鴆 nh薾 ngi l祄  t? v?  th玭g kinh m筩h cho ngi, <color=yellow>t葃 l筰 甶觤 ti襪 n╪g<color>. B鎛 ph竔 l蕐 <color=yellow>Th﹏ ph竝<color> l祄 tr鋘g, sau n祔 h穣 c? g緉g r蘮 luy謓. Gi? ngi c? th? n t譵 L穙 l穙 nh薾 <color=yellow>Nhi謒 v? m玭 ph竔<color>.",0)
		SetPlayerRoute(6)	--直接设置流派
		LearnSkill(58)
		LearnSkill(60)
		AddItem(0,1,42,1,1,4,65,4,66)
		ResetProperty()        --洗潜能点
		TaskTip("B筺  tr? th祅h  t? Л阯g M玭!")
		TaskTip("B筺  頲 t葃 l筰 甶觤 ti襪 n╪g!")
		TaskTip("B筺  nh藀 m玭! C? th? n g苝 Chng m玭 nh薾 nhi謒 v?")
	else
	 	Say("H穣 c? g緉g luy謓 t藀, mai sau ph竧 dng quang i b鎛 m玭.",0)

	end
end;

function skilllearn()		--学习技能
	if GetPlayerRoute() ~= 6 then	--门派检测
		Say("Ngi kh玭g ph秈  t? c馻 ta! Ta kh玭g th? d箉 ngi.",0)
	else
		Say("G鉩 ph秈 ph輆 di bi觰 tng v? c玭g xu蕋 hi謓 d蕌 {v} bi觰 th? c? th? h鋍 v? c玭g n祔, d蕌 m騣 t猲 bi觰 th? c? th? t╪g c蕄, nh蕄 tr鵦 ti誴 v祇  t╪g c蕄.",0)
		AllowLearnSkill()
	end
end;


function xinfa()
learnskill(58)
end;

function zhizuo()
learnskill(59)
end;

function xinyan()
learnskill(60)
end;

function duci()
learnskill(61)
end;

function jiedu()
learnskill(62)
end;

function gouhun()
learnskill(63)
end;

function jiguan()
learnskill(64)
end;

function zhuixin()
learnskill(65)
end;

function mingcha()
learnskill(66)
end;

function chuanxin()
learnskill(67)
end;

function cuidu()
learnskill(68)
end;

function duopo()
learnskill(69)
end;

function baoyu()
learnskill(70)
end;

function sheying()
learnskill(71)
end;


function suoming()
learnskill(72)
end;

function mantian()
learnskill(73)
end;

function xixing()
learnskill(74)
end;

function no()
end;

function change_mistery_book_linshi()
		Say("Kh玭g ng? th玭g qua vi謈 luy謓 th鴆 ngi c? th? nh薾 頲 M藅 t辌h tr蕁 ph竔, th藅 x鴑g ng l?   c馻 b鎛 m玭. Nh璶g tr蕁 ph竔 v? h鋍 n祔 ta c騨g ph秈 l躰h ng? m閠 th阨 gian m韎 c? th? truy襫 th? 頲, ngi quay l筰 sau nh?!",0)
end;

function beforelearnskill(id)
	if (id == 74) then	--吸星阵
		if (GetSkillLevel("H蕄 Tinh Tr薾") <= 0) then
			return "\'H蕄 Tinh Tr薾\' l? <color=red>Tuy謙 h鋍 tr蕁 ph竔<color>, kh玭g ph秈  t? b鎛 m玭 th? kh玭g th? n緈 頲."
		end
	end
end

function afterlearnskill(id)
	if (id == 74) then	--吸星阵
		if (GetSkillLevel("H蕄 Tinh Tr薾") == 1) then
			Say("Thi誹 hi謕 qu? nhi猲 t? ch蕋 th﹎ s﹗,  bc u l躰h ng? 頲 \'H蕄 Tinh Tr薾\', th藅 ng n?! <enter><color=green>Ngi ch琲<color>: Nh璶g...s? ph?, t筰 sao khi con th? thi tri觧 \'H蕄 Tinh Tr薾\', n閕 kh? ph﹏ t竛, kh? m? thi tri觧? Nghe n鉯 L鬰 M筩h Th莕 Ki誱 ? 筺 Th?,  ao c t? l﹗, h玬 nay m韎 th? 頲. <enter>\'H蕄 Tinh Tr薾\' r蕋 l頸 h筰, cho d? c? may m緉 h鋍 頲, mu鑞 s? d鬾g th祅h th筼,  kh玭g ph秈 l? chuy謓 d?.", 1, "уng ?/GiveMomentum")
		elseif (GetSkillLevel("H蕄 Tinh Tr薾") == 5) then
			Say("Thi誹 hi謕 qu? nhi猲 t? ch蕋 th玭g minh, \'H蕄 Tinh Tr薾\'  l躰h h閕 頲 5 ph莕. C遪 xa m韎 t n c秐h gi韎 cao nh蕋. Lo筰 v? c玭g n祔 g錷 20 c蕄, 5 c蕄 sau c莕 thi誹 hi謕 kh? luy謓 h琻 n鱝, 10 c蕄 cu鑙 c莕 c? m藅 t輈h tr蕁 ph竔 m韎 l躰h h閕 頲.", 0)
		end
	end
end

function GiveMomentum()
	Say("Th玦 頲,  ta gi髉 ngi thi tri觧 \'H蕄 Tinh Tr薾\'. <enter><enter>R蕋 l﹗....<enter><enter>Л頲 r錳, s竧 kh?  h譶h th祅h, c? th? th? thi tri觧 \'H蕄 Tinh Tr薾\'. Tuy謙 h鋍 tr蕁 ph竔 r蕋 m筺h, d飊g  tr? gian di謙 b筼, thay tr阨 h祅h o, kh玭g h筰 ngi v? t閕...", 0)
	SetMomentum(10)
	RandomTaskTipEx("Nh薾 頲 10 甶觤 s竧 kh? s? ph? truy襫 cho", "momentumtip")
end

