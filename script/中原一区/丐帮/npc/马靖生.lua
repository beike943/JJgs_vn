Include("\\script\\global\\技能树操作.lua");
Include("\\script\\task\\faction\\faction_main_gb.lua");
Include("\\script\\faction\\npc\\faction_master_main.lua")

--技能列表
SKILLS={
--丐帮净衣
--混天气功 (技能id=103)
[103]={
     --{关键点数，前提技能数，前提技能关系（与：1，或：0），前提技能1，前提技能1等级，...}
     levelless={3,0,0,},
     --关键点（技能等级，玩家等级，玩家经验，门派贡献度}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={10,27,0,0},
	 },
--丐帮掌法 (技能id=104)
[104]={
     levelless={3,1,0,103,1},
     [1]={1,10,1000,0},
     [2]={2,12,200,0},
     [3]={10,28,0,0},
     },
--通臂拳 (技能id=105)
[105]={
     levelless={3,1,0,103,1},
     [1]={1,12,1500,30},
     [2]={2,16,1500,30},
     [3]={5,28,0,30},
     },
--千斤闸 (技能id=106)
[106]={
     levelless={3,1,0,109,3},
     [1]={1,34,45000,500},
     [2]={2,37,15000,500},
     [3]={7,52,0,500},
     },
--霸王拳 (技能id=107)
[107]={
     levelless={3,1,0,104,4},
     [1]={1,22,10000,100},
     [2]={2,26,6000,100},
     [3]={5,38,0,100},
     },
--锁喉擒拿手 (技能id=108)
[108]={
     levelless={3,1,0,105,3},
     [1]={1,28,20000,300},
     [2]={2,31,8000,300},
     [3]={7,46,0,300},
     },
--逍遥游 (技能id=109)
[109]={
     levelless={3,1,0,103,2},
     [1]={1,17,5000,60},
     [2]={2,21,3000,60},
     [3]={5,33,0,60},
     },
--六合拳法 (技能id=110)
[110]={
     levelless={3,1,0,107,4},
     [1]={1,40,90000,700},
     [2]={2,43,30000,700},
     [3]={6,55,0,700},
     },
--醉蝶 (技能id=111)
[111]={
     levelless={3,1,0,106,3},
     [1]={1,48,200000,1000},
     [2]={2,50,40000,1000},
     [3]={8,62,0,1000},
     },
--醉拳 (技能id=112)
[112]={
     levelless={3,3,1,107,5,108,6,106,5},
     [1]={1,55,500000,3000},
     [2]={2,58,200000,3000},
     [3]={7,73,0,3000},
     },
--降龙十八掌 (技能id=113)
[113]={
     levelless={5,3,1,110,6,111,8,112,7},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}


function showlimit(n)	--师门说话
--	if n==1 then
--		Say("<color=green>马靖生<color>：你的武功精进了！",0)
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
	local nTaskValue = FN_GetTaskState(FN_GB);
	if (nTaskValue==1) and (GetItemCount(2,1,12)>=1) then
		task_006();
		return
	else
		Say("V? c玭g h? ta s鴆 m筺h v? song, Gi竛g Long Th藀 B竧 Chng uy ch蕁 thi猲 h?. Binh kh? thng d飊g c馻  t? ta l? <color=yellow>H? Th?<color> n﹏g cao n╪g l鵦 t蕁 c玭g! C莕 ta gi髉 g? kh玭g?",
			4,
			"加入丐帮净衣/enterjingyi",
			"学习丐帮净衣武功/skilllearn",
			"我得到了本门镇派秘籍残本/change_mistery_book",
			"打个招呼/no");
	end
end;


canjuan1 = 934
canjuan2 = 935
canjuan3 = 936

-- 兑换镇派秘籍的功能 =============================================begin==
function change_mistery_book()
	local nBook1 = GetItemCount(2, 1, canjuan1)		-- 上卷
	local nBook2 = GetItemCount(2, 1, canjuan2)		-- 中卷
	local nBook3 = GetItemCount(2, 1, canjuan3)		-- 下卷
	
	if GetPlayerRoute() ~= 11 then	--流派检测
		Say("Ngi kh玭g ph秈 l?  t? c馻 ta, M藅 t辌h tr蕁 ph竔 sao c? th? giao cho ngi ch??", 0)
		return
	end	
	
	if (nBook1 == 0 and nBook2 == 0 and nBook3 == 0) then	-- 啥也没有
		Say("Ngi ch璦 t鮪g nh薾 頲 trang m藅 t辌h v? c玭g n祇 sao c? th? n鉯 l?  c? n??", 0)
		return
	end
	
	Say("Th玭g qua luy謓 th鴆 ngi  c? nh鱪g trang M藅 t辌h tr蕁 ph竔, th藅 x鴑g ng l?   c馻 b鎛 m玭! в ta gi髉 ngi ng l筰 th祅h m閠 quy觧 m藅 t辌h ho祅 ch豱h, nh璶g ph秈 c?  3 quy觧 (thng_trung _h?)", 
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
		AddItem(0, 112, 107, 1)
		Say("Ngi th藅 l? may m緉, y l? quy觧 M藅 t辌h tr蕁 ph竔 ho祅 ch豱h!", 0)
		Msg2Player("B筺 nh薾 頲 m閠 quy觧 M藅 t辌h tr蕁 ph竔!")
		WriteLog("[фi m藅 t辌h tr蕁 ph竔]:"..GetName().."фi 1 M藅 t辌h tr蕁 ph竔 c馻 C竔 Bang T躰h Y, nChangeType:"..nChangeType);
	else
		WriteLog("[фi m藅 t辌h tr蕁 ph竔]:"..GetName().."фi M藅 t辌h tr蕁 ph竔 c馻 C竔 Bang T躰h Y th蕋 b筰, nChangeType:"..nChangeType);
		Talk(1,"","B竜 l鏸, i M藅 t辌h tr蕁 ph竔 th蕋 b筰!");
	end;
end;
-- 兑换镇派秘籍的功能 =============================================end====


function jingyi()		--察看技能
--弹界面
end;

function tedian()		--察看技能
Say("V? c玭g h? ta s鴆 m筺h v? song, Gi竛g Long Th藀 B竧 Chng uy ch蕁 thi猲 h?. Binh kh? thng d飊g c馻  t? ta l? H? Th?!",0)
end;


function enterjingyi()		--加入流派
	if GetPlayerFaction() ~= 4 then	--门派检测
		Say("B籲g h鱱 n猲 t譵 Long bang ch? xin gia nh藀 m玭 ph竔 r錳 h穣 t譵 ta b竔 s? h鋍 ngh?!",0)
	elseif   GetPlayerRoute() == 10 then	--未入流派的本门弟子 
		if join_route_main(11) == 0 then
			return
		end
		Say("Gia nh藀 T辬h Y ph竔 ta, qu? l? s竛g su鑤! Ta ch輓h th鴆 thu nh薾 ngi l祄  t?, gi髉 ngi  th玭g kinh m筩h, <color=yellow>t葃 l筰 甶觤 ti襪 n╪g<color>. C玭g phu b鎛 ph竔 l蕐 <color=yellow>S鴆 m筺h<color> l祄 g鑓! Gi? ngi c? th? n Bang ch? nh薾 <color=yellow>Nhi謒 v? s? m玭<color>!",0)
		SetPlayerRoute(11)	--直接设置流派
		LearnSkill(103)
		LearnSkill(104)
		AddItem(0,0,3,1,1,4,65,4,66)
		ResetProperty()        --洗潜能点
		TaskTip("B筺  tr? th祅h  t? C竔 Bang T躰h y!")
		TaskTip("B筺  頲 t葃 甶觤 ti襪 n╪g!")
		TaskTip("B筺  nh藀 m玭! C? th? n g苝 Bang ch? nh薾 nhi謒 v?!")
	elseif   GetPlayerRoute() == 11 then
	 	Say("H?! Mau 甶 luy謓 c玭g 甶! ng c? c? ng祔 li nh竎, 秐h hng thanh danh ta!",0)
	else
		Say("Ta ch糿g ph秈 s? ph? th豱h gi竜 c馻 ngi, ng n y n辬h h鉻!",0)
	end
end;

function skilllearn()		--学习技能
	if GetPlayerRoute() ~= 11 then	--门派检测
		Say("Ngi kh玭g ph秈  t? ta, kh玭g th? h鋍 v? c玭g C竔 Bang T躰h y!",0)
	else

		Say("D蕌 {v} bi觰 th? c? th? h鋍 v? c玭g n祔; d蕌 m騣 t猲 bi觰 th? c? th? t╪g c蕄! Nh蕄 tr鵦 ti誴 v祇  t╪g c蕄!",0)
		AllowLearnSkill()
	end
end;

function huntian()
learnskill(103)
end;

function zhangfa()
learnskill(104)
end;

function tongbi()
learnskill(105)
end;

function qianjinza()
learnskill(106)
end;

function bawang()
learnskill(107)
end;

function qinna()
learnskill(108)
end;

function xiaoyao()
learnskill(109)
end;

function liuhe()
learnskill(110)
end;

function zuidie()
learnskill(111)
end;

function zuiqian()
learnskill(112)
end;

function xianglong()
learnskill(113)
end;


function no()
end;

function change_mistery_book_linshi()
		Say("Kh玭g ng? th玭g qua vi謈 luy謓 th鴆 ngi c? th? nh薾 頲 M藅 t辌h tr蕁 ph竔, th藅 x鴑g ng l?   c馻 b鎛 m玭. Nh璶g tr蕁 ph竔 v? h鋍 n祔 ta c騨g ph秈 l躰h ng? m閠 th阨 gian m韎 c? th? truy襫 th? 頲, ngi quay l筰 sau nh?!",0)
end;

function beforelearnskill(id)
	if (id == 113) then	--降龙十八掌
		if (GetSkillLevel("Gi竛g Long Th藀 B竧 Chng") <= 0) then
			return "揋i竛g Long Th藀 B竧 Chng? l? <color=red>tuy謙 h鋍 tr蕁 ph竔<color> c馻 b鎛 m玭, ch? truy襫 cho ngi t礽 gi醝."
		end
	end
end

function afterlearnskill(id)
	if (id == 113) then	--降龙十八掌
		if (GetSkillLevel("Gi竛g Long Th藀 B竧 Chng") == 1) then
			Say("Thi誹 hi謕 qu? nhi猲 t? ch蕋 kh玭g t?, bc u  l躰h h閕 揋i竛g Long Th藀 B竧 Chng? c馻 b鎛 m玭, th藅 ng n?!<enter><color=green>Ngi ch琲<color>: Nh璶g... th璦 s? ph?, v? sao l骳  t? thi tri觧 揋i竛g Long Th藀 B竧 Chng?, n閕 kh? trong ngi b? ph﹏ t竛? Х nghe danh L鬰 M筩h Th莕 Ki誱 c馻 Чi L? 祅 Th? t? l﹗, ngh? n c騨g kh玭g d竚, h玬 nay l筰 c? d辮 th?. <enter>Thi誹 hi謕 c遪 ch璦 bi誸 甶襲 n祔, 揋i竛g Long Th藀 B竧 Chng? r蕋 m筺h, cho d? may m緉 h鋍 頲, nh璶g ch璦 ch綾 甶襲 khi觧 頲 n?. Tinh kh? b猲 trong c? th? kh玭g t輈h t? th祅h 搒竧 kh輸? (m鴆 s竧 kh?), th? kh玭g th? thi tri觧 v? c玭g n祔, c莕 ti猽 hao 搒竧 kh輸 b猲 trong. 揝竧 kh輸 g錷 10 ph莕, t╪g khi c玭g ph? s竧 thng, d莕 d莕 t輈h t? l筰.", 1, "уng ?/GiveMomentum")
		elseif (GetSkillLevel("Gi竛g Long Th藀 B竧 Chng") == 5) then
			Say("Thi誹 hi謕 qu? nhi猲 t? ch蕋 th玭g minh, 揋i竛g Long Th藀 B竧 Chng?  l躰h h閕 頲 5 ph莕. V? c玭g n祔 c? 20 c蕄, t? c蕄 5 tr? 甶 thi誹 hi謕 c莕 ra s鴆 luy謓 c玭g, n m閠 m鴆 nh蕋 nh s? t╪g th猰 1 c蕄. T? c蕄 10 tr? 甶 ph秈 l躰h h閕 M藅 t辌h tr蕁 ph竔 c馻 b鎛 m玭, m韎 c? th? h鋍 頲.", 0)
		end
	end
end

function GiveMomentum()
	Say("Ta 產ng v薾 c玭g ch? d蒼 ngi t輈h t? 10 ph莕 s竧 kh? trong ngi,  ngi th? thi tri觧 揋i竛g Long Th藀 B竧 Chng?. <enter><enter>L﹗ sau...<enter><enter>S竧 kh? trong ngi thi誹 hi謕  h譶h th祅h, l骳 n祔 c? th? th? thi tri觧 揋i竛g Long Th藀 B竧 Chng?. Tuy謙 h鋍 tr蕁 ph竔 c馻 b鎛 m玭 uy l鵦 d騨g m穘h, ch? d飊g  tr? b筼 gi髉 k? y誹, thay tr阨 h祅h o, ng h筰 ngi v? t閕, h穣 nh? k? l蕐...", 0)
	SetMomentum(10)
	RandomTaskTipEx("Nh薾 頲 10 甶觤 s竧 kh? s? ph? truy襫 cho", "momentumtip")
end

