function main()
	Say("<color=green>Nghi Thanh<color>: Tu©n theo ı chØ cña tr­ëng bèi, truyÒn ®¹t t«n chØ cña Nga My.",0)
end;

function start()
	Talk(1,"start2","TuyÖt kü Nga My lµ ®iÖu móa kiÕm cã tõ thêi §­êng nh­ng ®­êng kiÕm uyÓn chuyÓn kh«ng gièng kiÕm ph¸p cña nam nh©n, giang hå gäi lµ Ngäc N÷ kiÕm ph¸p hoÆc Nga My kiÕm. Sau ®ã cã ®Ö tö ®Õn nói Nga My khai s¬n lËp ph¸i nªn hµi ©m víi tªn gäi tõ ®ã truyÒn cho ®Õn nay.")
end;

function start2()
--  Ã¿¸öÈÎÎñ¿ÉÒÔµÃµ½µÄ½±Àø
	TaskExp		= 	 	 {10,0}
--	TaskReward	=	 	 {0,0}
--	TaskItem	=		{{0,2,1},
--						 {0,0,0}}
						 
--  °İÉ½ÈÎÎñËùÓÃµÄ±äÁ¿ Task(107) ½«ÓÃ6¸öBitÀ´¼ÇÂ¼ÈÎÎñÍê³ÉÇé¿ö£¬Ã¿¸öBit·Ö±ğ±íÊ¾ ÉÙÁÖ/Ø¤°ï/Îäµ±/ÌÆÃÅ/¶ëáÒ/½Óµ½´ËÈÎÎñ
    if ( GetBit(GetTask(107), 1) == 1 ) and (GetBit(GetTask(107), 2) == 0) then
		SetTask(107, SetBit(GetTask(107), 2, 1))
		ModifyExp(TaskExp[1])
		if ( GetTask(107) == 63 ) then		--  Ê®´óÃÅÅÉÈÎÎñÍê³Éºó£¬ÕâÀï¿ÉÒÔ×ö³ö´¦Àí
			SetTask(100, (GetTask(100) + 1))
			TaskTip("Quest Lv.8 Finished.")
		end
	end

	Say("Ng­¬i cßn muèn hái g× n÷a?",0)
end;

function zuzhi()
	Talk(1,"start2","Trªn d­íi Nga My ph¸i cã Ch­ëng m«n, thô nghiÖp s­ th¸i, Nga My ®Ö tö. Ch­ëng m«n b¾t buéc ph¶i do ®Ö tö xuÊt gia ®¶m nhiÖm.")
end;

function tiaojian()
	Talk(1,"start2","Muèn gia nhËp Nga My ph¶i lµ n÷ giíi, ch­a gia nhËp m«n ph¸i kh¸c.")
end;

function rule()
	Talk(1,"start2","Phµm lµ ®Ö tö Nga My, hµnh thiÖn tİch ®øc, kh«ng ®­îc kÕt giao tµ ph¸i. §Ö tö xuÊt gia ph¶i tu©n thñ giíi luËt PhËt m«n.")
end;


function task()
	Talk(1,"start2","Sau khi §Ö tö nhËp m«n Nga My cã thÓ t×m Ch­ëng m«n nhËn nhiÖm vô s­ m«n, mçi ngµy liªn tôc hoµn thµnh 20 nhiÖm vô sÏ nhËn ®­îc 2 giê nh©n ®«i kinh nghiÖm.")
end;


function skill()
	Talk(1,"start2","Nga My cã XuÊt gia vµ Tôc gia, ®Ö tö xuÊt gia häc kiÕm do TuÖ T©m S­ Th¸i truyÒn thô, tôc gia ®Ö tö häc cÇm do HuÖ ¢m S­ Th¸i truyÒn thô.")
end;

function guanxi()
	Talk(1,"start2","§Ö tö bæn ph¸i hµnh tÈu giang hå nªn chó ı, Vâ §ang, ThiÕu L©m lµ h¶o bang cña Nga My. C¸i Bang, §­êng M«n, Thóy Yªn, C«n L«n, Thiªn Ba Phñ cã mèi quan hÖ trung lËp víi Nga My. Ngò §éc, Minh Gi¸o ®èi nghŞch víi Nga My.")
end;

function no()
end;