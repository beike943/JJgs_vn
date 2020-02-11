Include("\\script\\task\\faction\\faction_main_gb.lua");

function main()

local nTaskValue = FN_GetTaskState(FN_GB);

	if (nTaskValue==1) and (GetItemCount(2,1,12)>=1) then
		task_007();
		return
	
	else
		Say("<color=green>TrÇn Chung H¹c<color>: MÆc dï lµ nh÷ng kÎ xin ¨n, nh­ng l¹i cã niÒm vui tiªu diªu tù t¹i.",0)
	end

end;

function start()
	Talk(1,"start2","L·o KhiÕu Hãa còng ch¼ng râ nguån gèc C¸i Bang cã tõ bao giê. ChØ biÕt r»ng do thiªn tai nh©n häa, cuéc sèng qu¸ vÊt v¶, ®µnh ph¶i ®i ¨n mµy. Trªn ®­êng khÊt thùc gÆp mu«n vµn hiÓm nguy, nªn c¸c bang chóng ®oµn kÕt l¹i chèng chäi, tõ ®ã cã C¸i Bang. §Õn nay, C¸i Bang ta còng cã chót danh tiÕng trong giang hå!")
end;

function start2()
--  Ã¿¸öÈÎÎñ¿ÉÒÔµÃµ½µÄ½±Àø
	TaskExp		= 	 	 {10,0}
--	TaskReward	=	 	 {0,0}
--	TaskItem	=		{{0,2,1},
--						 {0,0,0}}
						 
--  °İÉ½ÈÎÎñËùÓÃµÄ±äÁ¿ Task(107) ½«ÓÃ6¸öBitÀ´¼ÇÂ¼ÈÎÎñÍê³ÉÇé¿ö£¬Ã¿¸öBit·Ö±ğ±íÊ¾ ÉÙÁÖ/Ø¤°ï/Îäµ±/ÌÆÃÅ/¶ëáÒ/½Óµ½´ËÈÎÎñ
    if ( GetBit(GetTask(107), 1) == 1 ) and (GetBit(GetTask(107), 5) == 0) then
		SetTask(107, SetBit(GetTask(107), 5, 1))
		ModifyExp(TaskExp[1])
		if ( GetTask(107) == 63 ) then		--  Ê®´óÃÅÅÉÈÎÎñÍê³Éºó£¬ÕâÀï¿ÉÒÔ×ö³ö´¦Àí
			SetTask(100, (GetTask(100) + 1))
			TaskTip("Quest Lv.8 Finished.")
		end
	end

	Say("<color=green>TrÇn Chung H¹c<color>: MÆc dï lµ nh÷ng kÎ xin ¨n, nh­ng l¹i cã niÒm vui tiªu diªu tù t¹i.",0)
end;

function zuzhi()
	Talk(1,"start2","C¸c KhiÕu Hãa Tö tuy ngµy th­êng hay sÒ xßa nh­ng t«n ti trËt tù trong bang rÊt nghiªm kh¾c. C¸i Bang do bang chñ thèng lÜnh, d­íi tr­íng cã ChÊp Ph¸p, Hé C«n, Ch­ëng B¸t, TruyÒn C«ng...tø ®¹i tr­ëng l·o chñ tr× c«ng viÖc th­êng ngµy. D­íi c¸c tr­ëng l·o cã c¸c ThiÕt ®µ chñ ë thËp ph­¬ng ph©n ®µ, phô tr¸ch thu thËp tin tøc hµng ngµy vµ truyÒn tin ®i c¸c n¬i. D­íi tay c¸c ®µ chñ lµ c¸c ®Ö tö C¸i Bang!")
end;

function tiaojian()
	Talk(3,"start2","Gia nhËp C¸i Bang rÊt ®¬n gi¶n. ChØ cÇn lµ kÎ l­¬ng thiÖn, ch­a gia nhËp m«n ph¸i kh¸c, kh«ng ph¶i ph¶n ®å cña bæn bang lµ cã thÓ gia nhËp!","VËy ng­êi giµu còng cã thÓ gia nhËp C¸i Bang sao?","Ng­êi giµu chØ cÇn cã lßng gióp ®ì cho ®êi, sao kh«ng gia nhËp ®­îc chø? TŞnh Y ph¸i cña bæn bang chuyªn thu nhËn nh÷ng ®Ö tö cã tÊm lßng b¸c ¸i!")
end;

function rule()
	Talk(1,"start2","KhiÕu Hãa Tö ch¼ng cã phĞp t¾c g×: ChØ cÇn kh«ng lµm chuyÖn ¸c, kh«ng kÕt giao tµ ma ngo¹i ®¹o lµ ®­îc!")
end;


function task()
	Talk(1,"start2","Sau khi nhËp m«n, c¸c ®Ö tö cã thÓ t×m bang chñ ®Ó nhËn nhiÖm vô s­ m«n. NÕu mçi ngµy hoµn thµnh liªn tôc 20 nhiÖm vô, cã thÓ nhËn ®­îc thêi gian 2 giê ®iÓm kinh nghiÖm nh©n ®«i!")
end;


function skill()
	Talk(1,"start2","Bang chóng chia thµnh hai hÖ TŞnh Y vµ ¤ Y. Vâ c«ng TŞnh Y do Hé C«n tr­ëng l·o M· TŞnh Sinh truyÒn thô, ¤ Y do Tr× B¸t tr­ëng l·o Tèng Nguyªn An truyÒn thô. Cô thÓ h·y ®Õn hai vŞ tr­ëng l·o t×m hiÓu thªm!")
end;

function guanxi()
	Talk(1,"start2","§Ö tö bæn ph¸i hµnh tÈu giang hå nªn chó ı, Vâ §ang, Nga My lµ h¶o bang cña C¸i Bang. ThiÕu L©m, §­êng M«n, Thóy Yªn, C«n L«n, Thiªn Ba Phñ quan hÖ trung lËp víi C¸i Bang. C¸i Bang cã th©m thï víi Ngò §éc vµ Minh Gi¸o !")
end;

function no()
end;