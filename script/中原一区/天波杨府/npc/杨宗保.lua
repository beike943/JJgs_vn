Include("\\script\\task\\faction\\faction_main_ym.lua");
Include("\\script\\task\\faction\\faction_head.lua");
Include("\\script\\global\\技能树操作.lua")
Include("\\script\\faction\\npc\\faction_master_main.lua")

function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","Х qu? 5 gi? ch琲, kh玭g th? h鋍 v? c玭g n鱝, h穣 ngh? ng琲  gi? g譶 s鴆 kh醗!")
	 	return
	 end
  local nTaskValue = FN_GetTaskState(FN_YM);
  local nTaskValuem = FN_GetTaskState(FN_YMM);

	if (nTaskValue==1) then
		task_103();
		return
	elseif (nTaskValue==2) then
		Say("T祇 B﹏ ? th祅h Bi謓 Kinh.",0);
		return
	elseif (nTaskValue==3) then
		Say("Ngi B竛 ng鵤 ? Bi謓 Kinh c竎h c鎛g binh b? kh玭g xa!",0);
		return
	elseif (nTaskValue==4) then
		Say("H穣 n T祇 B﹏ h錳 b竜 chuy謓 chi課 m?!",0);
		return
  elseif (nTaskValue==5) then
		task_111();
		return
	elseif (nTaskValue==6) then
		task_113();
		return
	elseif (nTaskValue==7) then
		Say("Gi? c? th? n g苝 Xa Th竔 Qu﹏ r錳!",0);
		return
	end;
	
	if  GetSex()==1 then
		if (nTaskValue>=8) or (nTaskValue==0) then
		Say("杨门枪骑专供 <color=yellow>枪骑弟子<color> 修习，重在冲锋陷阵, 斩敌立功。随身武器<color=yellow>长枪<color>一根，有什么我能帮你的?",
			4,
			"拜见师傅/entersujia",
			"学习杨门枪骑武功/skilllearn",
			"我得到了本门镇派秘籍的残本/change_mistery_book",
			"跟将军打个招呼/no")
		end
	end 
		  
	if  GetSex()==2 then
		if (nTaskValuem>=8) or (nTaskValuem==0) then
		Say("杨门枪骑专供 <color=yellow>枪骑弟子<color> 修习，重在冲锋陷阵, 斩敌立功。随身武器<color=yellow>长枪<color>一根，有什么我能帮你的?",
			4,
			"拜见师傅/entersujia",
			"学习杨门枪骑武功/skilllearn",
			"我得到了本门镇派秘籍的残本/change_mistery_book",
			"跟将军打个招呼/no")
		else
			Say("你先去报名再来.",0);
   		end;
	end;
end	
	
canjuan1 = 946
canjuan2 = 947
canjuan3 = 948

-- 兑换镇派秘籍的功能 =============================================begin==
function change_mistery_book()
	local nBook1 = GetItemCount(2, 1, canjuan1)		-- 上卷
	local nBook2 = GetItemCount(2, 1, canjuan2)		-- 中卷
	local nBook3 = GetItemCount(2, 1, canjuan3)		-- 下卷
	
	if GetPlayerRoute() ~= 17 then	--流派检测
		Say("Ngi kh玭g ph秈 l?  t? c馻 ta, M藅 t辌h tr蕁 ph竔 sao c? th? giao cho ngi ch??", 0)
		return
	end	
	
	if (nBook1 == 0 and nBook2 == 0 and nBook3 == 0) then	-- 啥也没有
		Say("Ngi ch璦 t鮪g nh薾 頲 trang m藅 t辌h v? c玭g n祇 sao c? th? n鉯 l?  c? n??", 0)
		return
	end
	
	Say("Th藅 kh玭g ng? th玭g qua luy謓 th鴆 ngi l筰 c? th? nh薾 頲 M藅 t辌h tr蕁 ph竔, th藅 x鴑g ng l?   c馻 b鎛 m玭. Ta s? gi髉 ngi ng l筰 th祅h m閠 quy觧 ho祅 ch豱h nh璶g th祅h c玭g hay kh玭g c遪 t飝 v祇 may m緉!", 
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
		AddItem(0, 112, 111, 1)
		Say("Ngi th藅 l? may m緉, y l? quy觧 M藅 t辌h tr蕁 ph竔 ho祅 ch豱h!", 0)
		Msg2Player("B筺 nh薾 頲 m閠 quy觧 M藅 t辌h tr蕁 ph竔!")
		WriteLog("[фi m藅 t辌h tr蕁 ph竔]:"..GetName().."фi 1 M藅 t辌h tr蕁 ph竔 c馻 Dng M玭 thng k?, nChangeType:"..nChangeType);
	else
		WriteLog("[фi m藅 t辌h tr蕁 ph竔]:"..GetName().."фi M藅 t辌h tr蕁 ph竔 c馻 Dng M玭 thng k? th蕋 b筰, nChangeType:"..nChangeType);
		Talk(1,"","B竜 l鏸, i M藅 t辌h tr蕁 ph竔 th蕋 b筰!");
	end;
end;
-- 兑换镇派秘籍的功能 =============================================end====


--技能列表
SKILLS={
--杨门枪骑
--杨家枪心法 (技能id=720)
[720]={
     --{关键点数，前提技能数，前提技能关系（与：1，或：0），前提技能1，前提技能1等级，...}
     levelless={3,0,0,},
     --关键点（技能等级，玩家等级，玩家经验，门派贡献度}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={10,27,0,0},
	},
--杨家枪法总决 (技能id=721)
[721]={
     levelless={3,1,0,720,1},
     [1]={1,10,1000,0},
     [2]={2,12,200,0},
     [3]={10,28,0,0},
     	},
--杨家破风抢 (技能id=722)
[722]={
     levelless={3,1,0,721,1},
     [1]={1,12,1500,30},
     [2]={2,15,1200,30},
     [3]={7,30,0,30},
       },
--杨家驭马术 (技能id=723)
[723]={
     levelless={3,1,0,721,3},
     [1]={1,16,3000,50},
     [2]={2,18,1200,50},
     [3]={8,30,0,50},
     },
--杨家奔狼抢 (技能id=724)
[724]={
     levelless={3,1,0,721,4},
     [1]={1,20,8000,100},
     [2]={2,23,2500,100},
     [3]={7,38,0,100},
     },
--杨家战定诀 (技能id=725)
[725]={
     levelless={3,1,0,721,6},
     [1]={1,24,13000,180},
     [2]={2,27,4500,180},
     [3]={6,39,0,180},
     },
--杨家巧战诀 (技能id=726)
[726]={
     levelless={3,1,0,723,5},
     [1]={1,29,20000,300},
     [2]={2,33,15000,300},
     [3]={5,45,0,300},
     },
--杨家天衡枪 (技能id=727)
[727]={
     levelless={3,1,0,722,6},
     [1]={1,34,45000,500},
     [2]={2,37,15000,500},
     [3]={7,52,0,500},
     },
--杨家英雄气 (技能id=728)
[728]={
     levelless={3,1,0,725,4},
     [1]={1,38,70000,600},
     [2]={2,41,25000,600},
     [3]={6,53,0,600},
     },
--杨家倒海枪 (技能id=729)
[729]={
     levelless={3,1,0,724,6},
     [1]={1,44,140000,800},
     [2]={2,47,40000,800},
     [3]={6,59,0,800},
     },
--杨家御马术 (技能id=730)
[730]={
     levelless={3,2,0,726,4,728,2},
     [1]={1,48,250000,1000},
     [2]={2,51,100000,1000},
     [3]={6,63,0,1000},
     },
--碧月飞星枪 (技能id=731)
[731]={
     levelless={3,2,0,727,6,729,3},
     [1]={1,55,500000,3000},
     [2]={2,58,200000,3000},
     [3]={7,73,0,3000},
     },
--连环钻龙枪 (技能id=732)
[732]={
     levelless={5,2,1,730,6,731,7},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}



function showlimit(n)	--师门说话
--	if n==1 then
--		Say("<color=green>杨宗保<color>：你的武功精进了！",0)
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



function shaolinsujia()		--察看技能
--弹界面
end;

function tedian()		--察看技能
Say("V? c玭g ta d箉 ngi thu閏 Dng M玭 thng k?, x玭g pha chi課 tr薾, gi誸 gi芻 l藀 c玭g l? 璾 甶觤! Trng thng l? v? kh? chuy猲 d飊g!",0)
end;


function entersujia()		--加入流派
	if GetPlayerFaction() ~= 6 then	--门派检测
		Say("H穣 t譵 Xa Th竔 Qu﹏ xin gia nh藀 Dng M玭 r錳 n y h鋍 v? ngh?!",0)
	elseif   GetPlayerRoute() == 16 then	--未入流派的本门弟子 
		if join_route_main(17) == 0 then
			return
		end
		Say("T鑤! Sau n祔 theo ta h鋍 v? c玭g! Ta  gi髉 ngi  th玭g kinh m筩h, <color=yellow>t葃 l筰 甶觤 ti襪 n╪g<color>. V? c玭g Thng K? l蕐 <color=yellow>S鴆 m筺h<color> l祄 g鑓! Gi? ngi c? th? n Xa Th竔 Qu﹏ nh薾 <color=yellow>Nhi謒 v? s? m玭<color>!",0)
		SetPlayerRoute(17)	--直接设置流派
		LearnSkill(720)
		AddItem(0,105,10,1)
		ResetProperty()        --洗潜能点
		TaskTip("B筺  tr? th祅h  t? Dng M玭 thng k?!")
		TaskTip("B筺  頲 t葃 l筰 甶觤 ti襪 n╪g!")
		TaskTip("B筺  nh藀 m玭! C? th? n g苝 Xa Th竔 Qu﹏ nh薾 nhi謒 v?.")
	elseif   GetPlayerRoute() == 17 then
	 	Say("Ngi ph秈 si猲g n╪g luy謓 t藀, ng  m蕋 m苩 ta!",0)
	else
		Say("Ta kh玭g ph秈 l? s? ph? c馻 ngi, nh莔 r錳!",0)
	end
end;

function skilllearn()		--学习技能
	if GetPlayerRoute() ~= 17 then	--流派检测
		Say("Ngi kh玭g ph秈 l? thng k?  t?, kh玭g th? h鋍 v? c玭g thng k? c馻 Dng M玭",0)
	else
		Say("G鉩 ph秈 di c馻 h譶h tng v? c玭g c? d蕌 *v*, bi觰 th? c? th? h鋍; d蕌 m騣 t猲 bi觰 th? c? th? t╪g c蕄! Nh蕄 tr鵦 ti誴 v祇  th╪g",0)
		AllowLearnSkill()
	end
end;

function change_mistery_book_linshi()
		Say("Kh玭g ng? th玭g qua vi謈 luy謓 th鴆 ngi c? th? nh薾 頲 M藅 t辌h tr蕁 ph竔, th藅 x鴑g ng l?   c馻 b鎛 m玭. Nh璶g tr蕁 ph竔 v? h鋍 n祔 ta c騨g ph秈 l躰h ng? m閠 th阨 gian m韎 c? th? truy襫 th? 頲, ngi quay l筰 sau nh?!",0)
end;

function beforelearnskill(id)
	if (id == 732) then	--连环钻龙枪
		if (GetSkillLevel("Li猲 Ho祅 To祅 Long thng") <= 0) then
			return "揕i猲 Ho祅 To祅 Long Thng? l? <color=red>tuy謙 h鋍 tr蕁 ph竔<color> c馻 b鎛 m玭, ch? truy襫 cho ngi t礽 gi醝."
		end
	end
end

function afterlearnskill(id)
	if (id == 732) then	--连环钻龙枪
		if (GetSkillLevel("Li猲 Ho祅 To祅 Long thng") == 1) then
			Say("Thi誹 hi謕 qu? nhi猲 t? ch蕋 kh玭g t?, bc u  l躰h h閕 揕i猲 Ho祅 To祅 Long Thng? c馻 b鎛 m玭, th藅 ng n?!<enter><color=green>Ngi ch琲<color>: Nh璶g... th璦 s? ph?, v? sao l骳  t? thi tri觧 揕i猲 Ho祅 To祅 Long Thng?, n閕 kh? trong ngi b? ph﹏ t竛? Х nghe danh L鬰 M筩h Th莕 Ki誱 c馻 Чi L? 祅 Th? t? l﹗, ngh? n c騨g kh玭g d竚, h玬 nay l筰 c? d辮 th?. <enter>Thi誹 hi謕 c遪 ch璦 bi誸 甶襲 n祔, 揕i猲 Ho祅 To祅 Long Thng攔蕋 m筺h, cho d? may m緉 h鋍 頲, nh璶g ch璦 ch綾 甶襲 khi觧 頲 n?. Tinh kh? b猲 trong c? th? kh玭g t輈h t? th祅h 搒竧 kh輸? (m鴆 s竧 kh?), th? kh玭g th? thi tri觧 v? c玭g n祔, c莕 ti猽 hao 搒竧 kh輸 b猲 trong. 揝竧 kh輸 g錷 10 ph莕, t╪g khi c玭g ph? s竧 thng, d莕 d莕 t輈h t? l筰.", 1, "уng ?/GiveMomentum")
		elseif (GetSkillLevel("Li猲 Ho祅 To祅 Long thng") == 5) then
			Say("Thi誹 hi謕 qu? nhi猲 t? ch蕋 th玭g minh, 揕i猲 Ho祅 To祅 Long Thng?  l躰h h閕 頲 5 ph莕. V? c玭g n祔 c? 20 c蕄, t? c蕄 5 tr? 甶 thi誹 hi謕 c莕 ra s鴆 luy謓 c玭g, n m閠 m鴆 nh蕋 nh s? t╪g th猰 1 c蕄. T? c蕄 10 tr? 甶 ph秈 l躰h h閕 M藅 t辌h tr蕁 ph竔 c馻 b鎛 m玭, m韎 c? th? h鋍 頲.", 0)
		end
	end
end

function GiveMomentum()
	Say("Ta 產ng v薾 c玭g ch? d蒼 ngi t輈h t? 10 ph莕 s竧 kh? trong ngi,  ngi th? thi tri觧 揕i猲 Ho祅 To祅 Long Thng?. <enter><enter>L﹗ sau...<enter><enter>S竧 kh? trong ngi thi誹 hi謕  h譶h th祅h, l骳 n祔 c? th? th? thi tri觧 揕i猲 Ho祅 To祅 Long Thng?. Tuy謙 h鋍 tr蕁 ph竔 c馻 b鎛 m玭 uy l鵦 d騨g m穘h, ch? d飊g  tr? b筼 gi髉 k? y誹, thay tr阨 h祅h o, ng h筰 ngi v? t閕, h穣 nh? k? l蕐...", 0)
	SetMomentum(10)
	RandomTaskTipEx("Nh薾 頲 10 甶觤 s竧 kh? s? ph? truy襫 cho", "momentumtip")
end

