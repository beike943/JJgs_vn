
Include("\\script\\task\\faction\\faction_main_wd.lua"); -- ÃÅÅÉÈÎÎñÍ·ÎÄ¼ş

function main()

local nTaskValue = FN_GetTaskState(FN_WD);

	if (nTaskValue==1) then
		task_003();
		return
	elseif (nTaskValue==2) then
		task_009();
		return
	elseif (nTaskValue==3) then
		Say("Kh¸ l¾m! Giê h·y ®Õn gÆp Ch­ëng m«n.",0);
		return
	else
		Say("Muèn t×m hiÓu g× vÒ Vâ §ang xin cø hái.",0)
	end
	
end;

function start()
	Talk(1,"start2","L·o Tö më ®Çu §¹o gia, hËu thÕ chia lµm 2 hÖ ph¸i Thiªn S­ vµ ThuÇn D­¬ng. Thiªn S­ luyÖn phï, ThuÇn D­¬ng luyÖn ®¬n. Vâ §ang thuéc hÖ ThuÇn D­¬ng")
end;

function start2()
--  Ã¿¸öÈÎÎñ¿ÉÒÔµÃµ½µÄ½±Àø
	TaskExp		= 	 	 {10,0}
--	TaskReward	=	 	 {0,0}
--	TaskItem	=		{{0,2,1},
--						 {0,0,0}}
						 
--  °İÉ½ÈÎÎñËùÓÃµÄ±äÁ¿ Task(107) ½«ÓÃ6¸öBitÀ´¼ÇÂ¼ÈÎÎñÍê³ÉÇé¿ö£¬Ã¿¸öBit·Ö±ğ±íÊ¾ ÉÙÁÖ/Ø¤°ï/Îäµ±/ÌÆÃÅ/¶ëáÒ/½Óµ½´ËÈÎÎñ
    if ( GetBit(GetTask(107), 1) == 1 ) and (GetBit(GetTask(107), 4) == 0) then
		SetTask(107, SetBit(GetTask(107), 4, 1))
		ModifyExp(TaskExp[1])
		if ( GetTask(107) == 63 ) then		--  Ê®´óÃÅÅÉÈÎÎñÍê³Éºó£¬ÕâÀï¿ÉÒÔ×ö³ö´¦Àí
			SetTask(100, (GetTask(100) + 1))
			TaskTip("Quest Lv.8 Finished.")
		end
	end

	Say("Ng­¬i cßn muèn hái g× kh«ng?",0)
end;

function zuzhi()
	Talk(1,"start2","Vâ §ang ph¸i trªn cã Ch­ëng m«n, ®Ö tö ®êi thø nhÊt vµ ®Ö tö ®êi thø 2. Ch­ëng m«n ph¶i do ®Ö tö xuÊt gia ®¶m nhiÖm.")
end;

function tiaojian()
	Talk(1,"start2","Muèn gia nhËp Vâ §ang ph¶i kh«ng lµm ®iÒu ¸c, ch­a gia nhËp m«n ph¸i kh¸c vµ kh«ng ®­îc ph¶n béi bæn m«n.")
end;

function rule()
	Talk(1,"start2","Phµm lµ ®Ö tö Vâ §ang kh«ng ®­îc lµm ®iÒu ¸c, kh«ng kÕt giao tµ ph¸i. §¹o gia ®Ö tö ph¶i tu©n thñ thanh quy kh«ng ®­îc ph¹m s¾c giíi.")
end;


function task()
	Talk(1,"start2","§Ö tö Vâ §ang sau khi nhËp m«n cã thÓ t×m Ch­ëng m«n nhËn nhiÖm vô m«n ph¸i, mçi ngµy liªn tôc hoµn thµnh 20 nhiÖm vô cã thÓ nhËn ®­îc 2 giê nh©n ®«i kinh nghiÖm.")
end;


function skill()
	Talk(1,"start2","Vâ c«ng Vâ §ang chia lµm 2 hÖ §¹o gia vµ Tôc gia. §¹o gia ®Ö tö theo kiÕm do Du ChÊn Sinh ®¹o tr­ëng truyÒn thô. Tôc gia ®Ö tö dïng bót do §¹i KiÕm Ch©u truyÒn thô. Néi dung cô thÓ ng­¬i cã thÓ t×m 2 ®¹o tr­ëng hái râ.")
end;

function guanxi()
	Talk(1,"start2","§Ö tö bæn ph¸i hµnh tÈu giang hå h·y nhí C¸i Bang, Nga My lµ h¶o bang cña Vâ §ang. ThiÕu L©m, §­êng M«n, Thóy Yªn, C«n L«n, Thiªn Ba Phñ cã mèi quan hÖ trung lËp víi Vâ §ang. Ngò §éc, Minh gi¸o lu«n ®èi nghŞch víi Vâ §ang.")
end;

function no()
end;