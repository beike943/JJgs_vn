--ÆßÏ¦»î¶¯Í·ÎÄ¼þ½Å±¾
--by vivi
--08/01/2007 

--ÈÎÎñ±äÁ¿ ×¢Òâ2400ÈÎÎñ±äÁ¿ÒÑ¾­ÓÃ¹ý
TASK_GET_SEED = 2390; --¼ÇÂ¼Íæ¼ÒÊÇ·ñÁìÈ¡¹ýÖÖ×Ó
TASK_FLOWER_GROW = 2391; --¼ÇÂ¼»¨µÄ³É³¤¶È
TASK_AWARD_ONE = 2392; --¼ÇÂ¼Íæ¼ÒÊÇ·ñÁìÈ¡¹ýÏÖ½×¶ÎµÄ³É³¤½±Àø£¬·Ö30ÊýÖµÊ¹ÓÃ£¨1-30£©
TASK_AWARD_TWO = 2393; --¼ÇÂ¼Íæ¼ÒÊÇ·ñÁìÈ¡¹ýÏÖ½×¶ÎµÄ³É³¤½±Àø£¬·Ö14ÊýÖµÊ¹ÓÃ£¨31-39£¬40£¬50£¬60£¬80£¬100£©
TASK_TOTAL_TIME = 2394; --µ±ÌìÀÛ»ýÔÚÏßÊ±¼ä
TASK_PLANT_TIME = 2395; --¼ÇÂ¼ÖÖ»¨µÄÊ±¼ä
TASK_IS_PLANT = 2396; --ÊÇ·ñÖÖÏÂÁËÉñÃØµÄ»¨
TASK_IS_GROW = 2397; --µ±Ìì³É³¤¶ÈÊÇ·ñÒÑ¾­¼Ó¹ý£¬´æÈëday
TASK_CURRENT_LOGIN = 2398; --¼ÇÂ¼µ±Ç°µÇÂ¼Ê±¼ä
TASK_LAST_LOGIN = 2399; --¼ÇÂ¼ÉÏ´ÎµÇÂ½Ê±¼ä£¬ÓÃÓÚÅÐ¶ÏÊÇ·ñÐèÒª¸üÐÂTASK_CURRENT_LOGIN
TASK_GET_FINAL = 2401; --¼ÇÂ¼ÊÇ·ñÁìÈ¡¹ý×îÖÕ½±Àø

--È«¾Ö±äÁ¿
NEED_TIME = 60; --Ã¿ÌìÔÚÏßÐèÒª¶àÉÙÊ±¼ä²ÅÈÃ³É³¤¶È¼Ó1£¬µ¥Î»£º·Ö

--³É³¤½±Àøtable
tGrowAward = {--ÏÖ½×¶Î×î´ó³É³¤¶È  ³É³¤½±Àø·¶Î§£¨Íò£© 
	{1,70,150},
	{2,70,150},
	{3,70,150},
	{4,70,150},
	{5,100,200},
	{6,100,200},
	{7,100,200},
	{8,100,200},
	{9,100,200},
	{10,100,250},
	{11,100,250},
	{12,100,250},
	{13,100,250},
	{14,100,250},
	{15,100,250},
	{16,100,250},
	{17,100,250},
	{18,100,250},
	{19,100,250},
	{20,100,300},
	{21,100,300},
	{22,100,300},
	{23,100,300},
	{24,100,300},
	{25,100,300},
	{26,100,300},
	{27,100,300},
	{28,100,300},
	{29,100,300},
	{30,100,300},
	{31,100,300},
	{32,100,300},
	{33,100,300},
	{34,100,300},
	{35,100,300},
	{36,100,300},
	{37,100,300},
	{38,100,300},
	{39,100,300},
	{49,400,1200},
	{59,500,1500},
	{79,600,1800},
	{99,1000,2200},
	{100,1000,3000}
	}

--×îÖÕ½±Àøtable
tFinalAward = {--ÏÖ½×¶Î×î´ó³É³¤¶È	×îÖÕ½±Àø»ùÊý	»ñµÃÍ¬ÐÄÏ»¸ÅÂÊ	»ñµÃÍ¬ÐÄÏ»¸öÊý	»ñµÃ³þ¹úÉñ±øÏ»¸ÅÂÊ »ñµÃ³þ¹úÉñ±øÏ»¸öÊý
	{0,500000},
	{4,1000000,0,0,0,0},
	{9,4000000,10,1,0,0},
	{19,8000000,20,1,0,0},
	{39,12000000,40,1,0,0},
	{49,16000000,60,1,0,0},
	{59,16000000,80,1,0,0},
	{79,16000000,100,1,100,1},
	{99,16000000,100,1,100,2},
	{100,20000000,100,1,100,4}
	}


--¸øÓèÍ¬ÐÄÏ»ºÍÉñ±øÏ»½±Àø£¬ÓÃÓÚÃèÊö
tBoxAward = {
	"<color=red>10%<color> x¸c suÊt nhËn ®­îc Hép §ång t©m",
	"<color=red>20%<color> x¸c suÊt nhËn ®­îc Hép §ång t©m",
	"<color=red>40%<color> x¸c suÊt nhËn ®­îc Hép §ång t©m",
	"<color=red>60%<color> x¸c suÊt nhËn ®­îc Hép §ång t©m",
	"<color=red>80%<color> x¸c suÊt nhËn ®­îc Hép §ång t©m",
	"NhËn ®­îc <color=red>1<color> Hép §ång t©m vµ <color=red>1<color> Hép ThÇn Binh Së quèc",
	"NhËn ®­îc <color=red>1<color> Hép §ång t©m vµ <color=red>2<color> Hép ThÇn Binh Së quèc",
	"NhËn ®­îc <color=red>1<color> Hép §ång t©m vµ <color=red>4<color> Hép ThÇn Binh Së quèc"
	}
	

--º¯ÊýÃû³Æ£ºÎïÆ·Ìí¼Ó¼ì²éº¯Êý
--¹¦        ÄÜ£º¶Ôµ±Ç°Íæ¼Ò¿É·ñÕý³£Ìí¼ÓÎïÆ·½øÐÐ¼ì²â
--´å³¤ 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"","<color=red>kho¶ng trèng<color> trong hµnh trang kh«ng ®ñ!")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--ÅÐ¶ÏÍæ¼Ò¸ºÖØºÍ¿Õ¼ä
			Talk (1,"","<color=red>Søc lùc<color> cña b¹n kh«ng ®ñ!")
			return 0
		else 
			return 1
		end
end