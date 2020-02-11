function main()
	Say("<color=green>§­êng Ng¹o<color>: §­êng M«n mÊy tr¨m n¨m hµnh tÈu giang hå, còng ®· dÇn dÇn t¹o lËp ®­îc danh tiÕng råi.",0)
end;

function start()
	Talk(1,"start2","§­êng M«n lµ danh m«n ë Tø Xuyªn c¶ tr¨m n¨m nay. Tõ ®êi §­êng Thóc Quy mét tay dùng nªn. §Õn nay bæn ph¸i cã 4 tuyÖt kü ¸m khİ, háa khİ, ®éc d­îc, c¹m bÉy.")
end;

function start2()
--  Ã¿¸öÈÎÎñ¿ÉÒÔµÃµ½µÄ½±Àø
	TaskExp		= 	 	 {10,0}
--	TaskReward	=	 	 {0,0}
--	TaskItem	=		{{0,2,1},
--						 {0,0,0}}
						 
--  °İÉ½ÈÎÎñËùÓÃµÄ±äÁ¿ Task(107) ½«ÓÃ6¸öBitÀ´¼ÇÂ¼ÈÎÎñÍê³ÉÇé¿ö£¬Ã¿¸öBit·Ö±ğ±íÊ¾ ÉÙÁÖ/Ø¤°ï/Îäµ±/ÌÆÃÅ/¶ëáÒ/½Óµ½´ËÈÎÎñ
    if ( GetBit(GetTask(107), 1) == 1 ) and (GetBit(GetTask(107), 3) == 0) then
		SetTask(107, SetBit(GetTask(107), 3, 1))
		ModifyExp(TaskExp[1])
		if ( GetTask(107) == 63 ) then		--  Ê®´óÃÅÅÉÈÎÎñÍê³Éºó£¬ÕâÀï¿ÉÒÔ×ö³ö´¦Àí
			SetTask(100, (GetTask(100) + 1))
			TaskTip("Quest Lv.8 Finished.")
		end
	end

	Say("<color=green>§­êng Ng¹o<color>: §­êng M«n mÊy tr¨m n¨m hµnh tÈu giang hå, còng ®· dÇn dÇn t¹o lËp ®­îc danh tiÕng råi.",0)
end;

function zuzhi()
	Talk(1,"start2","§­êng M«n do §­êng M«n L·o L·o ch­ëng qu¶n, mäi chuyÖn do Tæng qu¶n vµ Tø phßng tæng qu¶n phô tr¸ch, §­êng M«n L·o L·o do n÷ giíi cã vai vÕ cao nhÊt trong m«n ®¶m nhiÖm, ngò ®¹i tæng qu¶n ph¶i do ®Ö tö trùc hÖ ®¶m nhiÖm.")
end;

function tiaojian()
	Talk(1,"start2","Gia nhËp §­êng M«n ph¶i ®æi hä §­êng, ch­a gia nhËp m«n ph¸i kh¸c.")
end;

function rule()
	Talk(1,"start2","Phµm lµ ®Ö tö §­êng M«n, kh«ng ®­îc tiÕt lé tuyÖt kü bæn m«n, kh«ng ®­îc häc lĞn tuyÖt kü bæn m«n, ai vŞ ph¹m sÏ bŞ trõng trŞ nghiªm kh¾c.")
end;


function task()
	Talk(1,"start2","§Ö tö §­êng M«n sau khi nhËp m«n cã thÓ t×m L·o l·o nhËn nhiÖm vô s­ m«n, mçi ngµy hoµn thµnh liªn tôc 20 nhiÖm vô cã thÓ nhËn ®­îc 2 giê nh©n ®«i ®iÓm kinh nghiÖm.")
end;


function skill()
	Talk(1,"start2","Vâ c«ng §­êng M«n do Tæng qu¶n §­êng Thiªn TiÕu ®İch th©n truyÒn thô, h·y ®Õn ®ã t×m «ng ta.")
end;

function guanxi()
	Talk(1,"start2","Ng­êi trong §­êng M«n ta hµnh tÈu giang hå ©n ®Òn o¸n tr¶, kh«ng cã nhiÒu kÎ thï nh­ng h¶o h÷u còng ch¼ng bao nhiªu.")
end;

function no()
end;