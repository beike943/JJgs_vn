--ĞÂÊÖÖ¸Òı
--lijinyong

function main()
	Uworld1 = GetTask(1)
	if Uworld1 == 6  then
		Say("ÄÜÈ¥Îäµ±Ñ§Ï°Îä¹¦ÊÇÃ¿¸öÈËµÄÃÎÏë! Vâ c«ng bæn ph¸i néi ngo¹i t­¬ng tÕ, h­ thùc t­¬ng sinh. Tr«ng tiÓu huynh ®Ö t­ chÊt tinh th©m nh­ng xem ra ch­a ®ñ c¨n c¬! Chi b»ng h·y häc hai chiªu c«ng phu c¬ b¶n cña L·o Nhi Tö xem thùc lùc thÕ nµo!",2,"Muèn/yes","Kh«ng cÇn ®©u!/no")
	SetTask(1,7)
	else
		Talk(1,"","ÓĞÕâÃ´¶àµÄÍ½µÜ£¬µ«Ã»ÓĞÈË¶ÔÎÒÃÇ¸Ğµ½ÂúÒâ!")
	end
end;


function yes()
	Talk(1,"no","ÏëÒª¾«ĞÄÁ·Ï°£¬ÓĞÁ½¸ö´óÃØÃÜ£ºÉîºôÎü£¬³ÁË¼Ú¤ÏëÖ±ÖÁ¾«Éñ»Ö¸´¡£ Ã¿ÌìĞèÒªĞŞÁ¶!")
	AddMagic(151,1);
	AddMagic(153,1);
end

function no()
	Talk(1,"","ÎÒ¸æËßÒ©µêµÄÀÏ°å£¬ËûµÄ´¦·½·Ç³£ÓĞĞ§£¬ÕâÓÖ¸øÁËÎÒÁ½¸ö!")
end




		