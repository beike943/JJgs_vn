-- -----------------------------------------
-- Newbie Quest Lua Scripts / Danexx 2005.02
-- -----------------------------------------
-- Include Files
Include( "\\script\\ÖĞÔ­Ò»Çø\\ãê¾©\\npc\\init_ĞÂÊÖÈÎÎñ.lua" )

-- Variable

-- Start of Main Function
function main()
--  ĞÂÊÖÈÎÎñÏà¹Ø
	NewbieTaskStrings =	 {"    Ha ha! Cöa hiÖu ta chuyªn b¸n vò khİ tèt nhÊt. Trang bŞ bªn m×nh <color=red>Vò khİ<color> ta b¸n, ng­¬i sÏ v÷ng chİ phiªu b¹t giang hå. Ta tÆng ng­¬i thanh vò khİ phßng th©n, sau nµy cÇn mua g× cø ®Õn t×m ta!",
						  "    Khi dïng vËt liÖu c¬ b¶n nh­ <color=green>kim lo¹i<color> vµ <color=green>gç<color>, cã thÓ phèi ghĞp theo tû lÖ kh¸c nhau ®Ó chÕ t¹o c¸c lo¹i vò khİ. NÕu thªm vµo <color=green>chiÕn linh<color> hoÆc vµi <color=green>vËt phÈm thÇn bİ<color> sÏ ghĞp ®­îc vò khİ cµng tèt h¬n!"}

--  Ã¿¸öÈÎÎñ¿ÉÒÔµÃµ½µÄ½±Àø
	TaskExp		= 	 	 {15,30}
	TaskReward	=	 	 {0,0}
	TaskItem	=		{{0,2,1},
						 {0,0,0}}
						 
--  °İÉ½ÈÎÎñËùÓÃµÄ±äÁ¿ Task(101) ½«ÓÃ5¸öBitÀ´¼ÇÂ¼ÈÎÎñÍê³ÉÇé¿ö£¬Ã»¸öBit·Ö±ğ±íÊ¾ ÎäÆ÷µê/·ş×°µê/ÔÓ»õµê/Ò©µê/½Óµ½´ËÈÎÎñ
    if ( GetBit(GetTask(101), 1) == 1 ) and (GetBit(GetTask(101), 5) == 0) then
		Talk(1, "", NewbieTaskStrings[1])
		SetTask(101, SetBit(GetTask(101), 5, 1))
		ModifyExp(TaskExp[1])
		AddItem(TaskItem[1][1], TaskItem[1][2], TaskItem[1][3])
		if ( GetTask(101) == 31 ) then		--  °İÉ½ÈÎÎñÍê³É£¬ÕâÀï¿ÉÒÔ×ö³ö´¦Àí
			SetTask(100, (GetTask(100) + 1))
			Msg2Player("Quest Lv.2 Finished.")
		end
		
--  Éú»î¼¼ÄÜÈÎÎñËùÓÃµÄ±äÁ¿ Task(106) ½«ÓÃ4¸öBitÀ´¼ÇÂ¼ÈÎÎñÍê³ÉÇé¿ö£¬Ã¿¸öBit·Ö±ğ±íÊ¾ ÒÂ¼×/±øÆ÷/Á¶µ¤/½Óµ½´ËÈÎÎñ
--  Ö»³öÏÖÔÚÈªÖİ		
	elseif ( GetBit(GetTask(106), 1) == 1 ) and (GetBit(GetTask(106), 3) == 0) then
		Talk(1, "", NewbieTaskStrings[2])
		SetTask(106, SetBit(GetTask(106), 3, 1))
		ModifyExp(TaskExp[2])
		if ( GetTask(106) == 15 ) then		--  Éú»î¼¼ÄÜÈÎÎñÍê³É£¬ÕâÀï¿ÉÒÔ×ö³ö´¦Àí
			SetTask(100, (GetTask(100) + 1))
			Msg2Player("Quest Lv.7 Finished.")
		end

--	elseif ( GetTask(8) ~= 1 ) and ( GetItemCount(2, 2, 1) >= 2 ) then
--		SetTask(8, 1)
--		Talk(1, "", NewbieString[13])
--		ModifyExp(NewbieExp[8])
--		Earn(2*200)
--	    DelItem(2, 2, 1)
--	    DelItem(2, 2, 1)
--		--AddItem(0, 2, 15) ÈÎÎñ½±Àø(µÈ´ı´¦ÀíÎåĞĞ)
	else
		Sale(12)
	end
end;



















--ĞÂÊÖÖ¸Òı
--lijinyong


--function main()
--	Say("Ìú½³ÆÌÀÏ°å£ºÂò¶«Î÷»¹ÊÇÏâÇ¶£¿",2,"Âò¶«Î÷/buy","ÏâÇ¶/xiangqian")

--end;


--function buy()
--		i=random(1,2)
--		if i==1 then
--			Sale(12)
--		else
--			Sale(13)
--		end
--end;


--function xiangqian()
--	EnchaseItem()
--end;





--	Uworld1 = GetTask(1)
--	if Uworld1 == 8  then
--		Say("Ìú½³ÆÌÀÏ°å£ºÄÄÀïµÄ»°£¿ÎÒ¼¸ÌìÇ°¾ÍÒÑ¾­»¹¸øËû¶ù×ÓÁË°¡¡£²»ºÃ£¬¿Ï¶¨ÊÇËûµÄ°Ü¼Ò¶ù×ÓÓÖÄÃÁËÒø×ÓÈ¥¹äÒ¤£¬Ã»ÓĞ¸úËû½²¡£°¥£¬¿´À´´ËÊÂÓÖÒªÎÒÇ××Ô×ßÒ»ÌËÁË¡£Ğ¡ĞÖµÜ£¬º¦Äã°×ÅÜÒ»ÌË£¬ÊµÔÚ²»ºÃÒâË¼£¬ÎÒÀÏÕÅÒ»±²×Ó´òÌú£¬Ã»Ê²Ã´ºÃ²¹³¥µÄ£¬¾Í¸øÄã½²½²±øÆ÷µÄÖªÊ¶°É¡£",2,"Òª/yes","²»ÓÃÁË/no")
--	SetTask(1,9)
--	else
--		i=random(1,2)
--		if i==1 then
--			Sale(7)
--		else
--			sale(8)
--		end
--		Talk(1,"","Ìú½³ÆÌÀÏ°å£º¿Í¹ÙÊÇÂòÂô±øÆ÷»¹ÊÇÑ§´òÌú£¿ÂòÂô±øÆ÷ÕÒÎÒ¾ÍºÃÁË£¬Ñ§´òÌú¾Í¸úÎÒÍ½µÜÈ¥ÂÕ´¸×Ó°É¡£")
--		Sale(1)
--	end
--end;


--function yes()
--	Talk(1,"no","Ìú½³ÆÌÀÏ°å£º±øÆ÷Ò»°ã·ÖÎª¶Ì±ø¡¢³¤±øºÍÆæÃÅÈıÀà£¬½­ºşÖĞÊ®´óÃÅÅÉ£¬Ò²¸÷×ÔÓĞ×Ô¼º³ÆÊÖµÄ±øÆ÷ÀàĞÍ£¬ÈËÃÇ³£ËµÊ®°Ë°ã±øÆ÷£¬µ«ÕæÕı³£ÓÃµÄ²¢Ã»ÓĞÕâÃ´¶à¡£Ò»°ãÀ´Ëµ£¬Ô½ÊÇ¶Ì±ø£¬¹¥»÷ËÙ¶ÈÔ½¿ì£¬µ«¹¥»÷Á¦Ô½µÍ¡£ÖÁÓÚ±øÆ÷µÄÀ´Ô´£¬³ıÁËÒ°ÍâµôÂä£¬Ìú½³ÆÌÂò£¬Íæ¼Ò»¹¿ÉÒÔÇë¸ßÊÖ´òÔì£¬²»¹ı´ú¼Û¿Ï¶¨²»·Æ¡£")
	
--end

--function no()
--	Talk(1,"","Ìú½³ÆÌÀÏ°å£º½­ºşĞ×ÏÕ£¬Ğ¡ÏÀ¾ÍËæ±ã¼ìÒ»°Ñ±øÆ÷°øÉí°É¡£")
--	AddGoldItem(0,2);
--end




