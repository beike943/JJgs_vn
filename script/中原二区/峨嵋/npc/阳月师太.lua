--任务
--地点： 任务：
--策划：樊万松  2004.03.
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\online_activites\\head\\activity_kill_npc_task.lua")

function main(bTag)
	if g_akct_GetTaskStep(bTag) then
		return
	end
	UWorld1402 = GetTask(1402)
	---------------以下是打开封魔洞地图的任务------------------------------------
	if ( UWorld1402 == 20 )  then
			Talk(3,"","Ngi l? Dng Nguy謙 S? Th竔? V穘 b鑙 th蕐 y猽 ma ho祅h h祅h ? Giang T﹏ th玭, nh ra tay tng tr? nh璶g kh玭g bi誸 l祄 th? n祇 n猲 n y th豱h gi竜 s? th竔.","ng l? nghi謕 chng! Цm y猽 nghi謙 n祔 nh蕋 nh l? t? di <color=red>Phong Ma ng<color> ch箉 ra. N╩ x璦 L穙 ni  giam ch髇g ?  n猲 m韎  l筰 h藆 ho筺 cho th玭 d﹏! Ngi h穣 甶 l蕐 <color=red>1 vi猲 X? L頸 Kim Кn<color>, ta s? l祄 ph衟 gi髉 ngi n <color=red>Phong Ma ng<color> di謙 tr? y猽 ma.","T筰 h? 甶 ngay!")
			SetTask(1402,25)
			--AddNote("取1个舍利金丹来，以便得到阳月师太的帮助而能够自由出入封魔洞。")
			TaskTip("取1个舍利金丹来，以便得到阳月师太的帮助而能够自由出入封魔洞。")
	elseif ( UWorld1402  == 25 and GetItemCount(2,3,7) < 1 ) then
			Talk(1,"","H穣 t譵 <color=red>1 vi猲 X? L頸 Kim Кn<color> v?, ta s? l祄 ph衟 gi髉 ngi v祇 <color=red>Phong Ma ng<color>.")
	elseif ( UWorld1402  == 25 and GetItemCount(2,3,7) >= 1  ) then
		if  DelItem(2,3,7,1) == 1 then 
				 Talk(4,"","N╩ x璦 khi ta giam ch髇g trong ng  m蕋 r蕋 nhi襲 ch﹏ kh?, b﹜ gi? kh玭g th? tr鵦 ti誴 i u v韎 ch髇g.","V藋 t筰 h? ph秈 l祄 sao?","Hi謓 gi? ngi  c? th? t? do ra v祇 <color=red>Phong Ma ng<color>, trong ng c? con y猽 qu竔 t猲 l? <color=red>Du H錸<color>, khi n? b? ti猽 di謙 s? d錸 t蕋 c? s鴆 m筺h k誸 th祅h <color=red>U H錸<color>, ngi h穣 l蕐 <color=red>10 vi猲<color> cho ta, ta c? th? bi誸 頲 t譶h h譶h c馻 b鋘 ch髇g  t輓h bc ti誴 theo. N誹 th鵦 l鵦 c馻 ngi ch璦  th? h穣 n <color=red>Giang T﹏ th玭 t譵 Чi hi謕 Trng ёnh (191.167)<color> nh? gi髉 .","е t? xin 甶 ngay!")
				 SetTask(1402,30)
				 --AddItem(1,1,1,1)
				 Earn(1000)
				 GivePlayerExp(SkeyFDGC,"fengduguicheng3")		--丰都鬼城3
				 ModifyReputation(15,0)
				 --AddNote("去封魔洞取十颗游魂的幽魂，以便得知下一步的行动方法。")
				 TaskTip("去封魔洞取十颗游魂的幽魂，以便得知下一步的行动方法。")
		else
		 Talk(1,"","Chuy觧 giao v藅 ph萴 kh玭g th祅h c玭g")
		end
	---------------------以下是打开丰都鬼城任务的第一步------------------------------------
	elseif ( UWorld1402  == 30 and GetItemCount(2,1,51) < 10 ) then
			Talk(1,"","<color=red>Du H錸<color> trong <color=red>Phong Ma ng<color> khi b? ti猽 di謙 s? ng璶g t? th祅h <color=red>U H錸<color>, ngi l蕐 <color=red>10 vi猲<color> v? cho ta, t?  ta c? th? bi誸 t譶h h譶h c馻 b鋘 ch髇g  ngh? bc ti誴 theo.")
	elseif ( UWorld1402  == 30 and GetItemCount(2,1,51) > 9  ) then
			if  DelItem(2,1,51,10) == 1 then 
					 Talk(4,"","Hay l緈! Ta c? c秏 th蕐 trong  c? ch髏 s鴆 m筺h nh? nhoi.","V藋 c? th? ch鴑g t? 甶襲 g??","襲  ch鴑g t? nh蕋 nh c? k? kh竎 m? c鯽 ng Phong Ma. Ngi mau n Phong Ma ng h醝 <color=red>Lam D? Qu?<color> k? n祇  m? c鯽 ng.","е t? xin 甶 ngay!")
					 SetTask(1402,35)
					 --AddItem(1,1,1,1)
					 Earn(800)
					 GivePlayerExp(SkeyFDGC,"fengduguicheng4")		--丰都鬼城4
					 ModifyReputation(10,0)
					 --AddNote("去封魔洞找一个野鬼问问到底是谁打开的封魔洞口。")
					 TaskTip("去封魔洞找一个野鬼问问到底是谁打开的封魔洞口。")
			else
			 Talk(1,"","Chuy觧 giao v藅 ph萴 kh玭g th祅h c玭g")
			end
	elseif ( UWorld1402  == 35  ) then
					Talk(1,"","Nh蕋 nh c? k? kh竎 m? c鯽 ng Phong Ma. Ngi mau n Phong Ma ng h醝 <color=red>Lam D? Qu?<color> k? n祇  m? c鯽 ng.")
	
	---------------------以下是打开鬼城任务第三步----------------------------------------------
	
	elseif ( UWorld1402  == 40  ) then
					    Talk(5,"","Ta d? la 頲 tin Phong Й Qu? Th祅h  xu蕋 hi謓 ? ph輆 Йng Giang T﹏ th玭, c? th? m閠 t猲 ma tng n祇  c馻 Qu? Th祅h  m? c鯽 ng Phong Ma.","Kh玭g th? n祇! Ma tng c馻 Qu? Th祅h kh玭g th? c? s鴆 m筺h l韓 n nh? v藋. Tr? phi ch髇g c? <color=red>b秐  S琻 H? X? T綾<color>. Ngi mau 甶 甶襲 tra r?!","T筰 h? 甶 ngay!","Hi謓 gi? ngi ch璦 th? v祇 Qu? Th祅h 頲. H穣 甶 l蕐 <color=red>2 vi猲 X? L頸 Kim Кn<color> n y.","T筰 h? 甶 ngay!")
					    SetTask(1402,45)
					    --AddItem(1,1,1,1)
					    Earn(800)
						GivePlayerExp(SkeyFDGC,"fengduguicheng5")		--丰都鬼城5
					    ModifyReputation(10,0)
					    --AddNote("取两颗舍利金丹至阳月师太处。")
					    TaskTip("取两颗舍利金丹至阳月师太处。")
	elseif ( UWorld1402  == 45 and GetItemCount(2,3,7) < 2 ) then
			Talk(1,"","Hi謓 gi? ngi ch璦 th? v祇 Qu? Th祅h 頲. H穣 甶 l蕐 <color=red>2 vi猲 X? L頸 Kim Кn<color> n y.")
	
	-----------------以下是打开鬼城任务的第四步-----------------------------------------------------
	elseif ( UWorld1402  == 45 and GetItemCount(2,3,7) >= 2 ) then
				if  DelItem(2,3,7,1) == 1 then
							Talk(2,"","S? Th竔! Зy l? X? L頸 Kim Кn.","Hay l緈! Hai vi猲 kim n n祔 ngi gi? m閠 vi猲  tr竛h y猽 kh? nh藀 th?. Ngo礽 ra v韎 c玭g l鵦 c馻 ta kh玭g  gi髉 ngi x﹎ nh藀 Qu? Th祅h an to祅. h穣 n <color=red>Thi誹 L﹎ T?<color> t譵 <color=red>Huy襫 Di謙 T玭 Gi?<color>, 玭g ta ? trong <color=red>Th竝 L﹎<color>, v韎 c玭g l鵦 c馻 玭g ta c? th? gi髉 ngi v祇 Qu? Th祅h.") 
							SetTask(1402,50)
							--AddItem(1,1,1,1)
							Earn(800)
							GivePlayerExp(SkeyFDGC,"fengduguicheng6")		--丰都鬼城6
							ModifyReputation(10,0)
							--AddNote("去少林寺的少林塔林找玄灭尊者，以便能够平安的进入丰都鬼城。")
							TaskTip("去少林寺的少林塔林找玄灭尊者，以便能够平安的进入丰都鬼城。")
				else
							Talk(1,"","Chuy觧 giao v藅 ph萴 kh玭g th祅h c玭g")
				end
	elseif ( UWorld1402  == 50 ) then
				Talk(1,"","Ngi n <color=red>Thi誹 L﹎ T?<color> t譵 <color=red>Huy襫 Di謙 T玭 Gi?<color>, 玭g ta ? trong <color=red>Th竝 L﹎<color>. V韎 c玭g l鵦 c馻 玭g ta c? th? gi髉 ngi x﹎ nh藀 Qu? Th祅h an to祅. H穣 nh? khi v祇 Qu? Th祅h Phong Й nh? 甧m theo <color=red>1 vi猲 X? L頸 Kim Кn<color>  ph遪g th﹏.")
	
	------------------以下是打开天师洞的任务------------------------------------------------------
	elseif ( UWorld1402 == 75 )  then
			Talk(7,"","S? Th竔! T筰 h? v鮝 t? Phong Й Qu? Th祅h tr? v?. N琲  kh? nguy hi觤, gi? ph秈 l祄 sao y?","Xem ra nh ph秈 t譵 <color=yellow>c? ta r錳<color>.","<color=yellow>C? ta<color> l? ai?","C? ta ch輓h l? s? mu閕 c馻 ta, m芻 d? v? c玭g cao h琻 ta r蕋 nhi襲 nh璶g n╩ x璦 c? ta  c鵦 l鵦 ph秐 i ta giam b鋘 y猽 ma ? Phong Ma ng. N╩ x璦 ta tr? tu鎖 c? ch蕄 kh玭g nghe c? ta khuy猲 n猲 g﹜ ra i h鋋 h玬 nay.","Xin h醝 qu? t竛h c馻 c? ta? T筰 h? n u m韎 c? th? t譵 頲 c? ta?","C? ta  b? ta tr鬰 xu蕋 kh醝 s? m玭, l骳 trc c? ngi th蕐 c? ta ? <color=red>Th祅h Й<color>, t猲 t鬰 gia c馻 c? ta l? <color=red>Vng C萵<color>. Ngi h穣 甶 t譵 c? ta v? n鉯 n╩ x璦 l? do ta kh玭g ng v韎 c? ta, mong c? ta h穣 l蕐 vi謈 c鴘 sinh linh  th竛 l祄 tr鋘g v? ch? c竎h 畊鎖 b鋘 Qu? Th祅h kh醝 nh﹏ gian.","T筰 h? 甶 ngay!")
			SetTask(1402,80)		
			--AddItem(1,1,1,1)
			Earn(1200)
			GivePlayerExp(SkeyFDGC,"fengduguicheng10")		--丰都鬼城10
			ModifyReputation(18,0)
			--AddNote("去成都府找王瑾帮忙。")
			TaskTip("去成都府找王瑾帮忙。")
	else
			Talk(1,"","Nam M? A Di У Ph藅!")
	end
end;
