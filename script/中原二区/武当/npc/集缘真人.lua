--任务
--地点： 任务：
--策划：樊万松  2004.03.
Include("\\script\\task\\world\\task_award.lua");


function main()
UWorld1402 = GetTask(1402)

------------以下是开启鬼城任务的第六部----------------------------

if ( UWorld1402 == 60 )  then
		Talk(2,"","Ngi l? T藀 Nguy猲 Ch﹏ Nh﹏? T筰 h? 頲 Huy襫 Di謙 T玭 Gi? ch? n y. Phong Й Qu? Th祅h t nhi猲 xu蕋 hi謓 t筰 nh﹏ gian, Dng Nguy謙 S? Th竔 ph竔 t筰 h? 甶 甶襲 tra nh璶g c莕 ngi gi髉  m韎 c? th? v祇 Qu? Th祅h.","Th? ra l? v藋! Ngi h穣 t譵 <color=red>1 c﹜ Chi誸 Xung B髏<color> v? <color=red>1 ph莕 Chu Sa<color> v? y, ta s? v? cho ngi 1 l? b颽.","T筰 h? tu﹏ l謓h!")
		SetTask(1402,65)
		--AddNote("需要1根折冲笔和1份朱砂好让集缘真人画遁隐灵符。")
		TaskTip("需要1根折冲笔和1份朱砂好让集缘真人画遁隐灵符.")

elseif ( UWorld1402  == 65  and ( GetItemCount(0,9,76) < 1 or GetItemCount(2,2,30) < 1 ) ) then
		Talk(1,"","Ngi h穣 t譵 <color=red>1 c﹜ Chi誸 Xung B髏<color> v? <color=red>1 ph莕 Chu Sa<color> v? y, ta s? vi誸 cho ngi 1 l? чn 萵 linh ph?.")
elseif ( UWorld1402  == 65 and GetItemCount(0,9,76) >=1 and GetItemCount(2,2,30) >= 1  ) then
		if  ( DelItem(0,9,76,1) == 1 and  DelItem(2,2,30,1) == 1 )then
					Talk(1,"","Ch﹏ nh﹏! T筰 h?  t譵 頲 r錳!","Hay l緈! H穣 c莔 l蕐 t蕀 <color=red>чn 萵 linh ph?<color> n祔. Ngi h譶h nh?  c? <color=red>X? L頸 Kim Кn<color> v? <color=red>Thi猲 Ph藅 Ch﹗<color> c馻 Nga My v? Thi誹 L﹎, ph秈 mang theo 3 m鉵  b猲 m譶h m韎 c? th? b譶h an ra v祇 Phong Й Qu? Th祅h, <color=yellow>thi誹 1 m鉵 c騨g kh玭g 頲<color>, h穣 nh? l蕐!","Ta  t鮪g v祇 <color=red>Phong Й Qu? Th祅h<color> m閠 l莕, n猲 trong r蕋 l? nguy hi觤, ngi <color=red>甶襲 tra<color> xong l藀 t鴆 quay v? b竜 tin cho <color=red>Dng Nguy謙 S? Th竔<color> bi誸.","T筰 h? l藀 t鴆 l猲 阯g!") 
					SetTask(1402,70)
					AddItem(2,1,150,1)
					Earn(1000)
					GivePlayerExp(SkeyFDGC,"fengduguicheng9")		--丰都鬼城9
					ModifyReputation(15,0)
					TaskTip("拿着灵符，舍利金丹，天佛珠3样东西去丰都调查，然后回峨嵋找阳月师太")
		else
					Talk(1,"","Chuy觧 giao v藅 ph萴 kh玭g th祅h c玭g")
		end
elseif ( UWorld1402  >= 70 ) then
			Say("дn nh? ta v? <color=red>чn 萵 linh ph?<color>? Ph秈 c? <color=red>1 c﹜ Chi誸 Xung B髏<color> v? <color=red>1 ph莕 Chu Sa<color> m韎 頲.",2,"V? чn 萵 linh ph?/yes1402_70","Kh玭g c? vi謈 g?/no1402_70")
else
		Talk(1,"","Than 玦! Tai h鋋 l韓 l筰 s緋 b総 u!")
end
end;

function  yes1402_70()
if ( GetItemCount(0,9,76) >=1 and GetItemCount(2,2,30) >= 1  ) then
		if  ( DelItem(0,9,76,1) == 1 and  DelItem(2,2,30,1) == 1 )then
				Talk(1,"","H穣 c莔 l蕐 <color=red>чn 萵 linh ph?<color>! Ngi ph秈 c? <color=red>X? L頸 Kim Кn<color> v? <color=red>Thi猲 Ph藅 Ch﹗<color>, mang theo 3 m鉵  n祔 c? th? b譶h an ra v祇 Phong Й Qu? Th祅h, h穣 nh? k? <color=yellow>thi誹 m閠 c騨g kh玭g 頲<color>!  ") 
				AddItem(2,1,150,1)
				--AddNote("得到一道遁隐灵符。")
				TaskTip("得到一道遁隐灵符.")
		else
				Talk(1,"","Chuy觧 giao v藅 ph萴 kh玭g th祅h c玭g")
		end			
elseif ( GetItemCount(0,9,76) == 0 or GetItemCount(2,2,30) == 0 ) then
		Talk(1,"","Ph秈 c? <color=red>1 c﹜ Chi誸 Xung B髏<color> v? <color=red>1 ph莕 Chu Sa<color> m韎 頲.")
else
		Talk(1,"","Trong l遪g ta 產ng kh玭g vui! Ngi h穣 quay l筰 sau 甶!")

end
end;

function  no1402_70()
				Talk(1,"","T筰 h? ch? n tham quan phong c秐h c馻 V? ng.")
end;

