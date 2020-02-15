Include("\\script\\global\\技能树操作.lua");
Include("\\script\\task\\faction\\faction_main_gb.lua");
Include("\\script\\faction\\npc\\faction_master_main.lua")

--技能列表
SKILLS={
--丐帮污衣
--天行气功 (技能id=114)
[114]={
     --{关键点数，前提技能数，前提技能关系（与：1，或：0），前提技能1，前提技能1等级，...}
     levelless={3,0,0,},
     --关键点（技能等级，玩家等级，玩家经验，门派贡献度}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={10,27,0,0},
	 },
--丐帮棍法 (技能id=115)
[115]={
     levelless={3,1,0,114,1},
     [1]={1,10,1000,0},
     [2]={2,12,200,0},
     [3]={10,28,0,0},
     },
--驱蛇棍法 (技能id=116)
[116]={
     levelless={3,1,0,115,1},
     [1]={1,12,1500,30},
     [2]={2,15,1200,30},
     [3]={7,30,0,30},
     },
--乞天讨地 (技能id=117)
[117]={
     levelless={3,1,0,114,2},
     [1]={1,16,3000,60},
     [2]={2,20,3000,60},
     [3]={5,32,0,60},
     },
--泥鳅功 (技能id=118)
[118]={
     levelless={3,1,0,115,4},
     [1]={1,22,10000,100},
     [2]={2,24,2000,100},
     [3]={8,36,0,100},
     },
--妙手诀 (技能id=119)
[119]={
     levelless={3,1,0,117,2},
     [1]={1,28,20000,300},
     [2]={2,31,8000,300},
     [3]={7,46,0,300},
     },
--偷龙转凤 (技能id=120)
[120]={
     levelless={3,1,0,119,1},
     [1]={1,35,50000,500},
     [2]={2,38,15000,500},
     [3]={6,50,0,500},
     },
--霸王卸甲 (技能id=121)
[121]={
     levelless={3,1,0,118,6},
     [1]={1,40,90000,700},
     [2]={2,43,30000,700},
     [3]={7,58,0,700},
     },
--偷天换日 (技能id=122)
[122]={
     levelless={3,1,0,119,5},
     [1]={1,48,220000,1000},
     [2]={2,51,80000,1000},
     [3]={6,63,0,1000},
     },
--打狗棍法 (技能id=123)
[123]={
     levelless={3,1,0,116,6},
     [1]={1,55,500000,3000},
     [2]={2,58,200000,3000},
     [3]={7,73,0,3000},
     },
--打狗棍阵 (技能id=124)
[124]={
     levelless={5,4,1,120,6,121,7,122,6,123,7},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}


function showlimit(n)	--师门说话
--	if n==1 then
--		Say("<color=green>宋元安<color>：你的武功精进了！",0)
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
		task_005();
		return
	else
		Say("C玭g phu ta l蕐 nhu th緉g cng, linh ho箃 kh? lng. чc m玭 t﹎ ph竝 c? th? l頸 d鬾g c玭g phu c馻 k? ch  t蕁 c玭g k? ch. Binh kh? thng d飊g c馻  t? b鎛 ph竔 l? <color=yellow>C玭<color>! C莕 ta gi髉 g? kh玭g?",
			4,
			"加入丐帮污衣/enterwuyi",
			"学习丐帮污衣武功/skilllearn",
			"我得到了本门镇派秘籍残本/change_mistery_book",
			"打个招呼/no");
	end
end;

canjuan1 = 937
canjuan2 = 938
canjuan3 = 939

-- 兑换镇派秘籍的功能 =============================================begin==
function change_mistery_book()
	local nBook1 = GetItemCount(2, 1, canjuan1)		-- 上卷
	local nBook2 = GetItemCount(2, 1, canjuan2)		-- 中卷
	local nBook3 = GetItemCount(2, 1, canjuan3)		-- 下卷
	
	if GetPlayerRoute() ~= 12 then	--流派检测
		Say("Ngi kh玭g ph秈 l?  t? c馻 b鎛 m玭, M藅 t辌h tr蕁 ph竔 sao c? th? a cho ngi 頲 ch??", 0)
		return
	end	
	
	if (nBook1 == 0 and nBook2 == 0 and nBook3 == 0) then	-- 啥也没有
		Say("Ngi ch璦 t鮪g nh薾 頲 quy觧 M藅 T辌h v? c玭g c馻 b鎛 m玭 sao c? th? n鉯 l?  c? n??", 0)
		return
	end
	
	Say("Th玭g qua luy謓 th鴆 ngi  c? 頲 nh鱪g trang M藅 t辌h tr蕁 ph竔, th藅 x鴑g ng l?   c馻 b鎛 m玭! в ta gi髉 ngi ng l筰 th祅h m閠 quy觧 m藅 t辌h ho祅 ch豱h, nh璶g c? th祅h c玭g hay kh玭g c遪 ph? thu閏 v祇 ngi c? t譵  c竎 trang m藅 t辌h kh玭g n鱝.", 
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
		AddItem(0, 112, 108, 1)
		Say("Ngi th藅 l? may m緉, y l? quy觧 M藅 t辌h tr蕁 ph竔 ho祅 ch豱h!", 0)
		Msg2Player("B筺 nh薾 頲 m閠 quy觧 M藅 t辌h tr蕁 ph竔!")
		WriteLog("[фi m藅 t辌h tr蕁 ph竔]:"..GetName().."фi 1 M藅 t辌h tr蕁 ph竔 c馻 C竔 Bang ? Y, nChangeType:"..nChangeType);
	else
		WriteLog("[фi m藅 t辌h tr蕁 ph竔]:"..GetName().."фi M藅 t辌h tr蕁 ph竔 c馻 C竔 Bang ? Y th蕋 b筰, nChangeType:"..nChangeType);
		Talk(1,"","B竜 l鏸, i M藅 t辌h tr蕁 ph竔 th蕋 b筰!");
	end;
end;
-- 兑换镇派秘籍的功能 =============================================end====


function jingyi()		--察看技能
--弹界面
end;

function tedian()		--察看技能
Say("C玭g phu ta l蕐 nhu th緉g cng, linh ho箃 kh? lng. чc m玭 t﹎ ph竝 c? th? l頸 d鬾g c玭g phu c馻 k? ch  t蕁 c玭g k? ch. Binh kh? thng d飊g c馻  t? b鎛 ph竔 l? c玭!",0)
end;


function enterwuyi()		--加入流派
	if GetPlayerFaction() ~= 4 then	--门派检测
		Say("B籲g h鱱 n猲 t譵 Long bang ch? xin gia nh藀 m玭 ph竔 r錳 h穣 t譵 ta b竔 s? h鋍 ngh?!",0)
	elseif   GetPlayerRoute() == 10 then	--未入流派的本门弟子 
		if join_route_main(12) == 0 then
			return
		end
		Say("? Y ph竔 m韎 l? C竔 Bang ch輓h t玭g. Ngi c? th? gia nh藀, ta th蕐 r蕋 vui l遪g! Ta ch輓h th鴆 thu nh薾 ngi l祄  t?, gi髉 ngi  th玭g kinh m筩h, <color=yellow>t葃 l筰 甶觤 ti襪 n╪g<color>. C玭g phu b鎛 ph竔 l蕐 <color=yellow>Th﹏ ph竝<color> l祄 g鑓! Ngi  gia nh藀 h? ph竔, c? th? n Bang ch? nh薾 <color=yellow>Nhi謒 v? s? m玭<color>!",0)
		SetPlayerRoute(12)	--直接设置流派
		LearnSkill(114)
		LearnSkill(115)
		AddItem(0,5,29,1,1,4,65,4,66)
		ResetProperty()        --洗潜能点
		TaskTip("B筺  tr? th祅h  t? C竔 Bang ? Y!")
		TaskTip("B筺  頲 t葃 l筰 甶觤 ti襪 n╪g!")
		TaskTip("B筺  nh藀 m玭! C? th? n g苝 Bang ch? nh薾 nhi謒 v?!")
	elseif   GetPlayerRoute() == 12 then
	 	Say("H?! Mau 甶 luy謓 c玭g 甶! ng c? c? ng祔 li nh竎, 秐h hng thanh danh ta!",0)
	else
		Say("Ta ch糿g ph秈 s? ph? th豱h gi竜 c馻 ngi, ng n y n辬h h鉻!",0)
	end
end;

function skilllearn()		--学习技能
	if GetPlayerRoute() ~= 12 then	--流派检测
		Say("Ngi kh玭g ph秈  t? ta, kh玭g th? h鋍 v? c玭g C竔 Bang ? Y!",0)
	else
		Say("D蕌 {v} bi觰 th? c? th? h鋍 v? c玭g n祔; d蕌 m騣 t猲 bi觰 th? c? th? t╪g c蕄! Nh蕄 tr鵦 ti誴 v祇  t╪g c蕄!",0)
		AllowLearnSkill()
	end
end;


--		Say("<color=green>宋元安<color>：你要学习什么技能？",11,"天行气功/tianxing","丐帮棍法/gunfa","驱蛇棍法/qushe","乞天讨地/qutao","泥鳅功/niqiu","妙手诀/miaoshou","偷龙转凤/toulong","霸王卸甲/xiejia","偷天换日/toutian","打狗棍法/dagougun","打狗棍阵/dagouzhen")

function tianxing()
learnskill(114)
end;

function gunfa()
learnskill(115)
end;

function qushe()
learnskill(116)
end;

function qutao()
learnskill(117)
end;

function niqiu()
learnskill(118)
end;

function miaoshou()
learnskill(119)
end;

function toulong()
learnskill(120)
end;

function xiejia()
learnskill(121)
end;

function toutian()
learnskill(122)
end;

function dagougun()
learnskill(123)
end;

function dagouzhen()
learnskill(124)
end;


function no()
end;

function change_mistery_book_linshi()
		Say("Kh玭g ng? th玭g qua vi謈 luy謓 th鴆 ngi c? th? nh薾 頲 M藅 t辌h tr蕁 ph竔, th藅 x鴑g ng l?   c馻 b鎛 m玭. Nh璶g tr蕁 ph竔 v? h鋍 n祔 ta c騨g ph秈 l躰h ng? m閠 th阨 gian m韎 c? th? truy襫 th? 頲, ngi quay l筰 sau nh?!",0)
end;

function beforelearnskill(id)
	if (id == 124) then	--打狗棍阵
		if (GetSkillLevel("Ф C萿 c玭 ph竝") <= 0) then
			return "摟? C萿 B鎛g tr薾? l? <color=red>tuy謙 h鋍 tr蕁 ph竔<color> c馻 b鎛 m玭, ch? truy襫 cho ngi t礽 gi醝."
		end
	end
end

function afterlearnskill(id)
	if (id == 124) then	--打狗棍阵
		if (GetSkillLevel("Ф C萿 c玭 ph竝") == 1) then
			Say("Thi誹 hi謕 qu? nhi猲 t? ch蕋 kh玭g t?, bc u  l躰h h閕 摟? C萿 B鎛g tr薾? c馻 b鎛 m玭, th藅 hi誱 th蕐! <enter><color=green>Ngi ch琲<color>: Nh璶g... th璦 s? ph?, v? sao l骳  t? thi tri觧 摟? C萿 B鎛g tr薾?, n閕 kh? trong ngi b? ph﹏ t竛? Х nghe danh L鬰 M筩h Th莕 Ki誱 c馻 Чi L? 祅 Th? t? l﹗, ngh? n c騨g kh玭g d竚, h玬 nay l筰 c? d辮 th?. <enter>Thi誹 hi謕 c遪 ch璦 bi誸 甶襲 n祔, 摟? C萿 B鎛g tr薾? r蕋 m筺h, cho d? may m緉 h鋍 頲, nh璶g ch璦 ch綾 甶襲 khi觧 頲 n?. Tinh kh? b猲 trong c? th? kh玭g t輈h t? th祅h 搒竧 kh輸? (m鴆 s竧 kh?), th? kh玭g th? thi tri觧 v? c玭g n祔, c莕 ti猽 hao 搒竧 kh輸 b猲 trong. 揝竧 kh輸 g錷 10 ph莕, t╪g khi c玭g ph? s竧 thng, d莕 d莕 t輈h t? l筰.", 1, "уng ?/GiveMomentum")
		elseif (GetSkillLevel("Ф C萿 c玭 ph竝") == 5) then
			Say("Thi誹 hi謕 qu? nhi猲 t? ch蕋 th玭g minh, 摟? C萿 B鎛g tr薾?  l躰h h閕 頲 5 ph莕. V? c玭g n祔 c? 20 c蕄, t? c蕄 th? 5 tr? 甶 thi誹 hi謕 c莕 ra s鴆 luy謓 c玭g, n m閠 m鴆 nh蕋 nh s? t╪g th猰 1 c蕄. T? c蕄 10 tr? 甶 ph秈 l躰h h閕 M藅 t辌h tr蕁 ph竔 c馻 b鎛 m玭, m韎 c? th? h鋍 頲.", 0)
		end
	end
end

function GiveMomentum()
	Say("Ta 產ng v薾 c玭g ch? d蒼 ngi t輈h t? 10 ph莕 s竧 kh? trong ngi,  ngi th? thi tri觧 摟? C萿 B鎛g tr薾?. <enter><enter>L﹗ sau...<enter><enter>S竧 kh? trong ngi thi誹 hi謕  h譶h th祅h, l骳 n祔 c? th? th? thi tri觧 摟? C萿 B鎛g tr薾?. Tuy謙 h鋍 tr蕁 ph竔 c馻 b鎛 m玭 uy l鵦 d騨g m穘h, ch? d飊g  tr? b筼 gi髉 k? y誹, thay tr阨 h祅h o, ng h筰 ngi v? t閕, h穣 nh? k? l蕐...", 0)
	SetMomentum(10)
	RandomTaskTipEx("Nh薾 頲 10 甶觤 s竧 kh? s? ph? truy襫 cho", "momentumtip")
end

