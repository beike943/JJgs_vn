
Include("\\script\\task\\faction\\faction_main_sl.lua");

function main()

local nTaskValue = FN_GetTaskState(FN_SL);

	if (nTaskValue==1) then
		task_003();
		return
	elseif (nTaskValue==2) then
		Say("Tr­íc bæn tù cã mét con suèi nhá, thİ chñ ra ®ã t×m Háa C«ng §Çu sau ®ã quay l¹i gÆp ta.",0);
		return
	elseif (nTaskValue==3) then
		task_006();
		return
	elseif (nTaskValue==4) then
		Say("Phµm lµ ®Ö tö ThiÕu L©m tr­íc khi nhËp tù ph¶i cóng mét b¸t ch¸o l¹p b¸t ®Ó tá lßng thµnh kİnh, nh­ng bæn tù l¹i kh«ng cã. Cã lÏ ng­¬i ph¶i xuèng ch©n nói t×m H­¬ng kh¸ch, hä thµnh t©m lÔ phËt may ra cã.",0);
		return
	elseif (nTaskValue==6) and (GetItemCount(2,0,5) >= 1)   then
		task_012();
		return		
	else
		Say("Thİ chñ muèn t×m hiÓu vÒ vÇn ®Ò g×?",0);
		return
	end

end;

function start()
	Talk(1,"start1","N¨m Th¸i Hßa thø 19 vua V¨n §Õ thêi B¾c Ngôy. T¨ng nh©n B¹t §µ tõ Thiªn Tróc ®Õn Trung Nguyªn. V¨n §Õ lµ ng­êi hiÕu lÔ, B¹t §µ nh×n thÊy Tung S¬n nh­ mét ®ãa sen bÌn lËp tù khai s¸ng ThiÕu L©m. 30 n¨m sau T¨ng nh©n Bå ®Ò l¹i tõ nam ThiÕn Tróc ®Õn ThiÕu L©m khai ThiÒn T«ng, d¹y vâ häc ThiÕu L©m còng tõ ®ã ph¸t huy.")
end;

function start1()
	Talk(1,"start2","§Çu ®êi §­êng, TÇn V­¬ng Lı ThÕ D©n vµ V­¬ng ThÕ Sung giao chiÕn kŞch liÖt ë L¹c D­¬ng, Vâ t¨ng ThiÕu L©m lóc ®ã còng cã tham gia xuÊt chiÕn, nhÊt cö thµnh cÇm. Tªn tuæi vâ häc ThiÕu L©m còng tõ ®ã mµ d­îc nhiÒu ng­êi biÕt ®Õn.")
end;

function start2()
--  Ã¿¸öÈÎÎñ¿ÉÒÔµÃµ½µÄ½±Àø
	TaskExp		= 	 	 {10,0}
--	TaskReward	=	 	 {0,0}
--	TaskItem	=		{{0,2,1},
--						 {0,0,0}}
						 
--  °İÉ½ÈÎÎñËùÓÃµÄ±äÁ¿ Task(107) ½«ÓÃ6¸öBitÀ´¼ÇÂ¼ÈÎÎñÍê³ÉÇé¿ö£¬Ã¿¸öBit·Ö±ğ±íÊ¾ ÉÙÁÖ/Ø¤°ï/Îäµ±/ÌÆÃÅ/¶ëáÒ/½Óµ½´ËÈÎÎñ
    if ( GetBit(GetTask(107), 1) == 1 ) and (GetBit(GetTask(107), 6) == 0) then
		SetTask(107, SetBit(GetTask(107), 6, 1))
		ModifyExp(TaskExp[1])
		if ( GetTask(107) == 63 ) then		--  Ê®´óÃÅÅÉÈÎÎñÍê³Éºó£¬ÕâÀï¿ÉÒÔ×ö³ö´¦Àí
			SetTask(100, (GetTask(100) + 1))
			TaskTip("Quest Lv.8 Finished.")
		end
	end
	
	Say("Thİ chñ muèn t×m hiÓu vÒ vÇn ®Ò g×?",0)
end;

function zuzhi()
	Talk(1,"start2","ThiÕu L©m do Ph­¬ng Tr­îng lµm tæng qu¶n, d­íi cã Giíi luËt viÖn, §¹t Ma ®­êng, La H¸n ®­êng, B¸t Nh· ®­êng, Tµng Kinh C¸c, Chİnh ®¹o lôc ®Çu täa. §Ö tö ph©n lµ: Tôc gia, Vâ t¨ng, ThiÒn t¨ng!")
end;

function tiaojian()
	Talk(3,"start2","Gia nhËp ThiÕu L©m cÇn 3 ®iÒu kiÖn: Nam, ch­a gia nhËp m«n ph¸i nµo, kh«ng ph¶i lµ ph¶n ®å cña ThiÕu L©m.","VËy nh÷ng ng­êi lµm viÖc ¸c kh«ng ®­îc vµo ThiÕu L©m µ?","§¹i phËt tõ bi phæ ®é chóng sinh sao l¹i ph©n biÖt lµnh d÷ ë ®©y?")
end;

function rule()
	Talk(1,"start2","Cã 5 giíi: S¸t sinh, väng ng÷, tµ d©m, trém c­íp, kiªng mÆn. Phµm hÔ lµ ®Ö tö ThiÕu L©m cÇn ph¶i tu©n thñ nghiªm ngÆt c¸c giíi trªn.")
end;


function task()
	Talk(1,"start2","§Ö tö ThiÕu L©m sau khi nhËp m«n cã thÓ ®Õn gÆp Ph­¬ng Tr­îng ®Ó nhËn nhiÖm vô s­ m«n, Mçi khi hoµn thµnh 20 nhiÖm vô nhËn ®­îc phÇn th­ëng*2 ®iÓm kinh nghiÖm trong 2 giê.")
end;


function skill()
	Talk(1,"start2","ThiÕu L©m cã 3 vŞ Cao t¨ng: §¹t Ma §­êng HuyÒn Khæ truyÒn thô vâ c«ng ThiÕu L©m Vâ T¨ng, B¸t Nh­îc §­êng HuyÒn Bi truyÒn thô vâ c«ng ThiÕu L©m tôc gia, Tµng Kinh C¸c HuyÒn Hèi truyÒn thô vâ c«ng ThiÕu L©m ThiÒn T¨ng. Cßn g× kh«ng hiÓu ng­¬i cã thÓ ®Õn gÆp 3 vŞ ®¹i s­!")
end;

function guanxi()
	Talk(1,"start2","Nga My, C¸i Bang ®Òu lµ b»ng h÷u cña ThiÕu L©m. Vâ §ang, §­êng M«n, Thóy Yªn, C«n L«n ®Òu cã mèi quan hÖ víi bæn tù rÊt tèt, Ngò §éc lµ Cõu nh©n. C¸c ®Ö tö hµnh tÈu giang hå ph¶i cÈn th©n.")
end;

function no()
end;