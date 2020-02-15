--任务
--地点： 任务：
--策划：樊万松  2004.03.
Include("\\script\\task\\world\\task_award.lua");


function main()
UWorld1402 = GetTask(1402)

-------------------打开鬼城任务第五步---------------------------------------------
if ( UWorld1402 == 50  )  then
		Talk(2,"","S? ph? ch綾 l? Huy襫 Di謙 T玭 Gi?! Dng Nguy謙 s? th竔 ti課 c? ta n 甶襲 tra vi謈 Phong Й Qu? th祅h t nhi猲 xu蕋 hi謓 ? Giang T﹏ Th玭. V韎 s鴆 l鵦 c馻 S? th竔 k誸 h頿 v韎 X? L頸 kim n v蒼 ch璦  c莕 頲 s? gi髉  c馻 s? ph?!","Ra l? v藋! Kh玭g ng? Phong Й Qu? th祅h l筰 xu蕋 hi謓 ? nh﹏ gian. Th? ch? h穣 gi髉 ta t譵 <color=red>2 x﹗ Thi猲 Ph藅 ch﹗<color> v? trc !","T筰 h? 甶 ngay!")
		SetTask(1402,55)
		--AddItem(1,1,1,1)
		Earn(800)
		GivePlayerExp(SkeyFDGC,"fengduguicheng7")		--丰都鬼城7
		ModifyReputation(11,0)
		--AddNote("需要去取2串少林的天佛珠到玄灭尊者那里。")
		TaskTip("需要去取2串少林的天佛珠到玄灭尊者那里.")	
		
elseif ( UWorld1402  == 55 and GetItemCount(2,3,4) < 2 ) then
		Talk(1,"","Mau t譵 <color=red>2 chu鏸 Thi猲 Ph藅 ch﹗<color> v?!")
elseif ( UWorld1402  == 55 and GetItemCount(2,3,4) >= 2 ) then
		if  DelItem(2,3,4,1) == 1 then
				Talk(5,"","Thi猲 Ph藅 ch﹗ y!","C蕋 m閠 c竔 甶 ta s? ph? ph衟 c竔 kia  y猽 ma kh玭g nh藀 頲 v祇 ngi. Nh? l蕐! Ph衟 thu藅 ta ch? gi髉 ngi ph遪g th﹏ ch? kh玭g th? 甶 l筰 trong Qu? th祅h.","V藋 ph秈 l祄 sao?","Ngi ph秈 n <color=red>V? ng<color> t譵 <color=red>T藀 Nguy猲 ch﹏ nh﹏<color> th豱h <color=red>чn 萵 linh ph?<color> m韎 c? th? 甶 l筰 trong Qu? th祅h.","T筰 h? 甶 ngay!") 
				SetTask(1402,60)
				--AddItem(1,1,1,1)
				Earn(1000)
				GivePlayerExp(SkeyFDGC,"fengduguicheng8")		--丰都鬼城8
				ModifyReputation(12,0)
				--AddNote("再去武当山找集缘真人，求一道遁隐灵符就可以平安的出入于丰都鬼城了。")
				TaskTip("再去武当山找集缘真人，求一道遁隐灵符就可以平安的出入于丰都鬼城了.")
		else
				Talk(1,"","Chuy觧 giao v藅 ph萴 kh玭g th祅h c玭g")
		end
elseif ( UWorld1402  == 60 ) then
		Talk(1,"","Ngi ph秈 n <color=red>V? ng<color> t譵 <color=red>T藀 Nguy猲 ch﹏ nh﹏<color> th豱h <color=red>чn 萵 linh ph?<color> m韎 頲.")
else
		Talk(1,"","Ta c? c秏 gi竎 th秏 h鋋 s緋 藀 n!")
end
end;
