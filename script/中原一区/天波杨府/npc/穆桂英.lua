Include("\\script\\task\\faction\\faction_main_ym.lua");
Include("\\script\\task\\faction\\faction_head.lua");
Include("\\script\\global\\技能树操作.lua")
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\faction\\npc\\faction_master_main.lua")

function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","Х qu? 5 gi? ch琲, kh玭g th? h鋍 v? c玭g n鱝, h穣 ngh? ng琲  gi? g譶 s鴆 kh醗!")
	 	return
	 end
  local nTaskValue = FN_GetTaskState(FN_YM);
  local nTaskValuem = FN_GetTaskState(FN_YMM);

	if (nTaskValuem==1) then
		task_003();
		return
	elseif (nTaskValuem==2) then
		Say("Tri謚 Ph? ? Bi謓 Kinh",0);
		return
	elseif (nTaskValuem==3) then
		Say("C蕀 qu﹏ ? ch輓h m玭 ho祅g cung",0);
		return
	elseif (nTaskValuem==4) then
		Say("дn Bi謓 Kinh t譵 Tri謚 Ph?",0);
		return
  elseif (nTaskValuem==5) then
		task_011();
		return
	elseif (nTaskValuem==6) then
		task_013();
	return
	elseif (nTaskValuem==7) then
		Say("дn b萴 b竜 Xa Th竔 Qu﹏",0);
		return
	elseif GetTask(1401) == 135 or GetTask(1401) == 125 then --天门阵后续任务
		Talk(1,"","<color=green>M閏 Qu? Anh<color>: nghe n鉯 l莕 n祔 ngi mu鑞 tham gia ph? Thi猲 M玭 Tr薾? Chuy謓 n祔 kh玭g ph秈 tr? a ngay c? ta c騨g ch璦 c? n緈 ch綾 ph莕 th緉g d?  n緈 r? m鋓 y誹 甶觤 c馻 Thi猲 M玭 Tr薾. V? th? ta  l謓h cho <color=yellow>Phi猽 K? tng qu﹏ Qu竎h Qu﹏ B籲g<color> n <color=yellow>Tng Dng [178,175]<color> l藀 n猲 Thi猲 M玭 Tr薾,d祅h cho qu﹏ s? ng祔 m r蘮 luy謓mong s韒 t譵 ra c竎h ph? gi秈 huy襫 c?, thi誹 hi謕 n誹 mu鑞 tham gia th? h穣 n  r蘮 luy謓 trc.");
		SetTask(1401,136);
		GivePlayerExp(SkeyTianmenzhen,"guojunpen")
		TaskTip("T譵 Qu竎h Qu﹏ B籲g (Tng Dng [178,175]) h醝 th╩ v? t譶h h譶h Thi猲 M玭 Tr薾.");
		return 0;	
	elseif GetTask(1401) == 138 then
		Talk(8,"","<color=green>M閏 Qu? Anh<color>: l莕 n祔 thi誹 hi謕 vt 秈 n緈 頲 bao nhi猽 kh? n╪g chi課 th緉g?","<color=green> <color>: Kho秐 50 ph莕 tr╩ c? h閕, ho芻 輙 h琻.","<color=green>M閏 Qu? Anh<color>: ch糿g l? l筰 l? v? m穘h b秐  S琻 H? X? T綾?","<color=green> <color>: ng v藋.","<color=green>M閏 Qu? Anh<color>: qu﹏ ta th竚 t? h錳 b竜, m秐h b秐  S琻 H? X? T綾  b? b? m藅 mang n Nh筺 M玭 Quan r錳.","<color=green> <color>: th? tng qu﹏ c? bi誸 c? th? m穘h b秐   頲 a n n琲 n祇?","<color=green>M閏 Qu? Anh<color>: c? l? gi?  n Th秓 Nguy猲 r錳, thi誹 hi謕 h穣 n  xem th? n祇.","<color=green> <color>: 產 t? tng qu﹏!")
		SetTask(1401,139);
		GivePlayerExp(SkeyTianmenzhen,"yanwushengli")
		TaskTip("T譵 qu﹏ quan qu﹏ Li猽 (Nh筺 M玭 Quan [194,195]) 畂箃 l筰 b秐  S琻 H? X? T綾.");
		return 0;	
	elseif GetTask(1401) == 140 then
		Talk(4,"","<color=green>M閏 Qu? Anh<color>: xem ra qu﹏ Li猽  i hng 甶,  b秐   b? h? t鑞g chuy觧 v? r錳.","<color=green> <color>: 竔 ch?! Ch糿g l? ta l筰 kh玭g th? t譵 ra b秐  S琻 H? X? T綾.","<color=green>M閏 Qu? Anh<color>: thi誹 hi謕 ch? lo ﹗,  ng祔 sau n誹 mu鑞 th竚 th輓h th猰 th玭g tin h穣 n y t譵 ta.","<color=green> <color>: ch? nh nh? v藋, 產 t? tng qu﹏!");
		SetTask(1401,141);
		GivePlayerExp(SkeyTianmenzhen,"huibingmuguiying")
		return 0;
	end;
	
	if  GetSex()==1 then
		if (nTaskValue>=8) or (nTaskValue==0) then
		Say("杨门弓骑专供<color=yellow>弓骑弟子<color> 修习, 重在牵制敌人，确保战友。以<color=yellow>弓<color> 为武器. 有什么我能帮你的?",
			4,
			"拜见师傅/entersujia",
			"学习杨门弓骑武功/skilllearn",
			"我得到了本门镇派秘籍的残本/change_mistery_book",
			"跟将军打个招呼/no")
		else
			Say("穆桂英: 你去报名再回来.",0);
		end
	end 
		  
	if  GetSex()==2 then
		if (nTaskValuem>=8) or (nTaskValuem==0) then
		Say("杨门弓骑专供<color=yellow>弓骑弟子<color> 修习, 重在牵制敌人，确保战友。以<color=yellow>弓<color> 为武器. 有什么我能帮你的?",
			4,
			"拜见师傅/entersujia",
			"学习杨门弓骑武功/skilllearn",
			"我得到了本门镇派秘籍的残本/change_mistery_book",
			"跟将军打个招呼/no")
	   end;
	end;
end	
	
canjuan1 = 949
canjuan2 = 950
canjuan3 = 951

-- 兑换镇派秘籍的功能 =============================================begin==
function change_mistery_book()
	local nBook1 = GetItemCount(2, 1, canjuan1)		-- 上卷
	local nBook2 = GetItemCount(2, 1, canjuan2)		-- 中卷
	local nBook3 = GetItemCount(2, 1, canjuan3)		-- 下卷
	
	if GetPlayerRoute() ~= 18 then	--流派检测
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
		AddItem(0, 112, 112, 1)
		Say("Ngi th藅 l? may m緉, y l? quy觧 M藅 t辌h tr蕁 ph竔 ho祅 ch豱h!", 0)
		Msg2Player("B筺 nh薾 頲 m閠 quy觧 M藅 t辌h tr蕁 ph竔!")
		WriteLog("[фi m藅 t辌h tr蕁 ph竔]:"..GetName().."фi 1 M藅 t辌h tr蕁 ph竔 c馻 Dng M玭 cung k?, nChangeType:"..nChangeType);
	else
		WriteLog("[фi m藅 t辌h tr蕁 ph竔]:"..GetName().."фi M藅 t辌h tr蕁 ph竔 c馻 Dng M玭 cung k? th蕋 b筰, nChangeType:"..nChangeType);
		Talk(1,"","B竜 l鏸, i M藅 t辌h tr蕁 ph竔 th蕋 b筰!");
	end;
end;
-- 兑换镇派秘籍的功能 =============================================end====


--技能列表
SKILLS={
--杨门枪骑
--杨家弓心法 (技能id=733)
[733]={
     --{关键点数，前提技能数，前提技能关系（与：1，或：0），前提技能1，前提技能1等级，...}
     levelless={3,0,0,},
     --关键点（技能等级，玩家等级，玩家经验，门派贡献度}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={10,27,0,0},
	},
--杨家弓法总决 (技能id=734)
[734]={
     levelless={3,1,0,733,1},
     [1]={1,10,1000,0},
     [2]={2,12,200,0},
     [3]={10,28,0,0},
     	},
--杨家连射术 (技能id=735)
[735]={
     levelless={3,1,0,734,1},
     [1]={1,12,1500,30},
     [2]={2,15,1200,30},
     [3]={7,30,0,30},
       },
--杨家阵疗术 (技能id=736)
[736]={
     levelless={3,1,0,734,2},
     [1]={1,16,3000,50},
     [2]={2,19,2000,50},
     [3]={6,31,0,50},
     },
--杨家回龙箭 (技能id=737)
[737]={
     levelless={3,1,0,734,4},
     [1]={1,20,8000,100},
     [2]={2,23,2500,100},
     [3]={7,38,0,100},
     },
--杨家缠云箭 (技能id=738)
[738]={
     levelless={3,1,0,737,1},
     [1]={1,24,13000,180},
     [2]={2,26,2500,180},
     [3]={8,38,0,180},
     },
--杨家奇门盾 (技能id=739)
[739]={
     levelless={3,1,0,736,3},
     [1]={1,28,20000,300},
     [2]={2,32,12000,300},
     [3]={5,44,0,300},
     },
--杨家正气箭 (技能id=740)
[740]={
     levelless={3,1,0,737,4},
     [1]={1,33,40000,500},
     [2]={2,35,7000,500},
     [3]={9,49,0,500},
     },
--杨家碎金箭 (技能id=741)
[741]={
     levelless={3,1,0,735,6},
     [1]={1,38,70000,600},
     [2]={2,40,12000,600},
     [3]={8,52,0,600},
     },
--杨家幻神诀 (技能id=742)
[742]={
     levelless={3,1,0,739,4},
     [1]={1,44,140000,800},
     [2]={2,47,40000,800},
     [3]={6,59,0,800},
     },
--杨家续命诀 (技能id=743)
[743]={
     levelless={3,1,0,739,5},
     [1]={1,48,250000,1000},
     [2]={2,51,60000,1000},
     [3]={7,66,0,1000},
     },
--流光绝影箭 (技能id=744)
[744]={
     levelless={3,3,0,738,6,740,6,741,6},
     [1]={1,55,500000,3000},
     [2]={2,58,200000,3000},
     [3]={7,73,0,3000},
     },
--霸王翔凤箭 (技能id=745)
[745]={
     levelless={5,3,0,742,6,743,7,744,7},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}


function showlimit(n)	--师门说话
--	if n==1 then
--		Say("<color=green>穆桂英<color>：你的武功精进了！",0)
	if n==2 then
		Say("你的等级不足, 请加倍努力!",0)
	elseif n==3 then
		Say("你的经验值不足, 请加倍努力!",0)
	elseif n==4 then
		Say("你的声望不足, 请继续努力!",0)
	elseif n==5 then
		Say("V? c玭g l骳 trc ta d箉 c遪 ch璦 h鋍 xong sao h鋍 頲 c竔 m韎, mau r蘮 luy謓 th猰 甶!",0)
	elseif n==6 then
		Say("你的银两不足，请赚够银两再来!",0)
	else
	end
end;



function shaolinsujia()		--察看技能
--弹界面
end;

function tedian()		--察看技能
Say("V? c玭g ta d箉 thu閏 Dng M玭 cung k? ch? y誹 kh鑞g ch? i phng b秓 v? b猲 m譶h, l蕐 cung l祄 v? kh?.",0)
end;


function entersujia()		--加入流派
	if GetPlayerFaction() ~= 6 then	--门派检测
		Say("Mau t譵 Xa Th竔 Qu﹏ gia nh藀 Dng M玭 r錳 n g苝 ta!",0)
	elseif   GetPlayerRoute() == 16 then	--未入流派的本门弟子 
		if join_route_main(18) == 0 then
			return
		end
		Say("T鑤! Ngi  gia nh藀 Dng M玭 sau n祔 c? th? theo ta h鋍 ngh?, ta s? gi髉  th玭g l筰 kinh m筩h <color=yellow>t葃 甶觤 ti襪 n╪g<color>. V? c玭g cung k? ch? y誹 <color=yellow>Th﹏ ph竝<color> l祄 ch?. Gi? c? th? n g苝 Xa Th竔 Qu﹏ nh薾 <color=yellow>Nhi謒 v? s? m玭<color>.",0)
		SetPlayerRoute(18)	--直接设置流派
		LearnSkill(733)
		AddItem(0,4,108,1,1,4,65,4,66)
		AddItem(0,105,10,1)
		ResetProperty()        --洗潜能点
		TaskTip("Ngi  tr? th祅h  t? Dng M玭 cung k?!")
		TaskTip("B筺  頲 t葃 甶觤 ti襪 n╪g!")
		TaskTip("B筺  nh藀 m玭! C? th? n g苝 Xa Th竔 Qu﹏ nh薾 nhi謒 v?.")
	elseif   GetPlayerRoute() == 18 then
	 	Say("Mau 甶 luy謓 c玭g ng  m蕋 m苩 vi s?.",0)
	else
		Say("Ta kh玭g ph秈 l? s? ph? c馻 ngi, nh莔 r錳!",0)
	end
end;

function skilllearn()		--学习技能
	if GetPlayerRoute() ~= 18 then	--流派检测
		Say("Ngi kh玭g ph秈  t? cung k? kh玭g th? h鋍 v? c玭g Dng M玭 cung k?.",0)
	else
		Say("K? n╪g n祇 di g鉩 ph秈 c? d蕌 m騣 t猲 th? c? th? h鋍, nh蕄 chu閠  t╪g c蕄",0)
		AllowLearnSkill()
	end
end;

function change_mistery_book_linshi()
		Say("Kh玭g ng? th玭g qua vi謈 luy謓 th鴆 ngi c? th? nh薾 頲 M藅 t辌h tr蕁 ph竔, th藅 x鴑g ng l?   c馻 b鎛 m玭. Nh璶g tr蕁 ph竔 v? h鋍 n祔 ta c騨g ph秈 l躰h ng? m閠 th阨 gian m韎 c? th? truy襫 th? 頲, ngi quay l筰 sau nh?!",0)
end;

function beforelearnskill(id)
	if (id == 745) then	--霸王翔凤箭
		if (GetSkillLevel("B? Vng Tng Ph鬾g Ti詎") <= 0) then
			return "揃? Vng Tng Ph鬾g Ti詎? l? <color=red>tuy謙 h鋍 tr蕁 ph竔<color> c馻 b鎛 m玭, ch? truy襫 cho ngi t礽 gi醝."
		end
	end
end

function afterlearnskill(id)
	if (id == 745) then	--霸王翔凤箭
		if (GetSkillLevel("B? Vng Tng Ph鬾g Ti詎") == 1) then
			Say("Thi誹 hi謕 qu? nhi猲 t? ch蕋 kh玭g t?, bc u  l躰h h閕 揃? Vng Tng Ph鬾g Ti詎? c馻 b鎛 m玭, th藅 ng n?!<enter><color=green>Ngi ch琲<color>: Nh璶g... th璦 s? ph?, v? sao l骳  t? thi tri觧 揃? Vng Tng Ph鬾g Ti詎?, n閕 kh? trong ngi b? ph﹏ t竛? Х nghe danh L鬰 M筩h Th莕 Ki誱 c馻 Чi L? 祅 Th? t? l﹗, ngh? n c騨g kh玭g d竚, h玬 nay l筰 c? d辮 th?. <enter>Thi誹 hi謕 c遪 ch璦 bi誸 甶襲 n祔, 揃? Vng Tng Ph鬾g Ti詎攔蕋 m筺h, cho d? may m緉 h鋍 頲, nh璶g ch璦 ch綾 甶襲 khi觧 頲 n?. Tinh kh? b猲 trong c? th? kh玭g t輈h t? th祅h 搒竧 kh輸? (m鴆 s竧 kh?), th? kh玭g th? thi tri觧 v? c玭g n祔, c莕 ti猽 hao 搒竧 kh輸 b猲 trong. 揝竧 kh輸 g錷 10 ph莕, t╪g khi c玭g ph? s竧 thng, d莕 d莕 t輈h t? l筰.", 1, "уng ?/GiveMomentum")
		elseif (GetSkillLevel("B? Vng Tng Ph鬾g Ti詎") == 5) then
			Say("Thi誹 hi謕 qu? nhi猲 t? ch蕋 th玭g minh, 揃? Vng Tng Ph鬾g Ti詎?  l躰h h閕 頲 5 ph莕. V? c玭g n祔 c? 20 c蕄, t? c蕄 5 tr? 甶 thi誹 hi謕 c莕 ra s鴆 luy謓 c玭g, n m閠 m鴆 nh蕋 nh s? t╪g th猰 1 c蕄. T? c蕄 10 tr? 甶 ph秈 l躰h h閕 M藅 t辌h tr蕁 ph竔 c馻 b鎛 m玭, m韎 c? th? h鋍 頲.", 0)
		end
	end
end

function GiveMomentum()
	Say("Ta 產ng v薾 c玭g ch? d蒼 ngi t輈h t? 10 ph莕 s竧 kh? trong ngi,  ngi th? thi tri觧 揃? Vng Tng Ph鬾g Ti詎?. <enter><enter>L﹗ sau...<enter><enter>S竧 kh? trong ngi thi誹 hi謕  h譶h th祅h, l骳 n祔 c? th? th? thi tri觧 揃? Vng Tng Ph鬾g Ti詎?. Tuy謙 h鋍 tr蕁 ph竔 c馻 b鎛 m玭 uy l鵦 d騨g m穘h, ch? d飊g  tr? b筼 gi髉 k? y誹, thay tr阨 h祅h o, ng h筰 ngi v? t閕, h穣 nh? k? l蕐...", 0)
	SetMomentum(10)
	RandomTaskTipEx("Nh薾 頲 10 甶觤 s竧 kh? s? ph? truy襫 cho", "momentumtip")
end

