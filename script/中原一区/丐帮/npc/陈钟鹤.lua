Include("\\script\\task\\faction\\faction_main_gb.lua");

function main()

local nTaskValue = FN_GetTaskState(FN_GB);

	if (nTaskValue==1) and (GetItemCount(2,1,12)>=1) then
		task_007();
		return
	
	else
		Say("<color=green>陈钟鹤<color>: M芻 d? l? nh鱪g k? xin ╪, nh璶g l筰 c? ni襪 vui ti猽 di猽 t? t筰.",0)
	end

end;

function start()
	Talk(1,"start2","L穙 Khi誹 H鉧 c騨g ch糿g r? ngu錸 g鑓 C竔 Bang c? t? bao gi?. Ch? bi誸 r籲g do thi猲 tai nh﹏ h鋋, cu閏 s鑞g qu? v蕋 v?, nh ph秈 甶 ╪ m祔. Tr猲 阯g kh蕋 th鵦 g苝 mu玭 v祅 hi觤 nguy, n猲 c竎 bang ch髇g 畂祅 k誸 l筰 ch鑞g ch鋓, t?  c? C竔 Bang. дn nay, C竔 Bang ta c騨g c? ch髏 danh ti課g trong giang h?!")
end;

function start2()
--  每个任务可以得到的奖励
	TaskExp		= 	 	 {10,0}
--	TaskReward	=	 	 {0,0}
--	TaskItem	=		{{0,2,1},
--						 {0,0,0}}
						 
--  拜山任务所用的变量 Task(107) 将用6个Bit来记录任务完成情况，每个Bit分别表示 少林/丐帮/武当/唐门/峨嵋/接到此任务
    if ( GetBit(GetTask(107), 1) == 1 ) and (GetBit(GetTask(107), 5) == 0) then
		SetTask(107, SetBit(GetTask(107), 5, 1))
		ModifyExp(TaskExp[1])
		if ( GetTask(107) == 63 ) then		--  十大门派任务完成后，这里可以做出处理
			SetTask(100, (GetTask(100) + 1))
			TaskTip("Quest Lv.8 Finished.")
		end
	end

	Say("<color=green>Tr莕 Chung H筩<color>: M芻 d? l? nh鱪g k? xin ╪, nh璶g l筰 c? ni襪 vui ti猽 di猽 t? t筰.",0)
end;

function zuzhi()
	Talk(1,"start2","C竎 Khi誹 H鉧 T? tuy ng祔 thng hay s? x遖 nh璶g t玭 ti tr藅 t? trong bang r蕋 nghi猰 kh綾. C竔 Bang do bang ch? th鑞g l躰h, di trng c? Ch蕄 Ph竝, H? C玭, Chng B竧, Truy襫 C玭g...t? i trng l穙 ch? tr? c玭g vi謈 thng ng祔. Di c竎 trng l穙 c? c竎 Thi誸  ch? ? th藀 phng ph﹏ , ph? tr竎h thu th藀 tin t鴆 h祅g ng祔 v? truy襫 tin 甶 c竎 n琲. Di tay c竎  ch? l? c竎  t? C竔 Bang!")
end;

function tiaojian()
	Talk(3,"start2","Gia nh藀 C竔 Bang r蕋 n gi秐. Ch? c莕 l? k? lng thi謓, ch璦 gia nh藀 m玭 ph竔 kh竎, kh玭g ph秈 ph秐  c馻 b鎛 bang l? c? th? gia nh藀!","V藋 ngi gi祏 c騨g c? th? gia nh藀 C竔 Bang sao?","Ngi gi祏 ch? c莕 c? l遪g gi髉  cho i, sao kh玭g gia nh藀 頲 ch?? T辬h Y ph竔 c馻 b鎛 bang chuy猲 thu nh薾 nh鱪g  t? c? t蕀 l遪g b竎 竔!")
end;

function rule()
	Talk(1,"start2","Khi誹 H鉧 T? ch糿g c? ph衟 t綾 g?: Ch? c莕 kh玭g l祄 chuy謓 竎, kh玭g k誸 giao t? ma ngo筰 o l? 頲!")
end;


function task()
	Talk(1,"start2","Sau khi nh藀 m玭, c竎  t? c? th? t譵 bang ch?  nh薾 nhi謒 v? s? m玭. N誹 m鏸 ng祔 ho祅 th祅h li猲 t鬰 20 nhi謒 v?, c? th? nh薾 頲 th阨 gian 2 gi? 甶觤 kinh nghi謒 nh﹏ i!")
end;


function skill()
	Talk(1,"start2","Bang ch髇g chia th祅h hai h? T辬h Y v? ? Y. V? c玭g T辬h Y do H? C玭 trng l穙 M? T辬h Sinh truy襫 th?, ? Y do Tr? B竧 trng l穙 T鑞g Nguy猲 An truy襫 th?. C? th? h穣 n hai v? trng l穙 t譵 hi觰 th猰!")
end;

function guanxi()
	Talk(1,"start2","е t? b鎛 ph竔 h祅h t萿 giang h? n猲 ch? ?, V? ng, Nga My l? h秓 bang c馻 C竔 Bang. Thi誹 L﹎, Л阯g M玭, Th髖 Y猲, C玭 L玭, Thi猲 Ba Ph? quan h? trung l藀 v韎 C竔 Bang. C竔 Bang c? th﹎ th? v韎 Ng? чc v? Minh Gi竜 !")
end;

function no()
end;