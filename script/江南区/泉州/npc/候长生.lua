--ĞÂÊÖÖ¸Òı
--lijinyong

function main()
	Uworld1 = GetTask(1)
	if Uworld1 == 6  then
		Say("§­îc lªn Vâ §ang häc néi gia bİ truyÒn lµ ®iÒu m¬ ­íc cña c¸c nh©n sÜ vâ l©m! Vâ c«ng bæn ph¸i néi ngo¹i t­¬ng tÕ, h­ thùc t­¬ng sinh. Tr«ng tiÓu huynh ®Ö t­ chÊt tinh th©m nh­ng xem ra ch­a ®ñ c¨n c¬! Chi b»ng h·y häc hai chiªu c«ng phu c¬ b¶n cña L·o Nhi Tö xem thùc lùc thÕ nµo!",2,"Muèn/yes","Kh«ng cÇn ®©u!/no")
	SetTask(1,7)
	else
		Talk(1,"","Qu¸ nhiÒu ®Ö tö nh­ng kh«ng cã ai hµi lßng ta!")
	end
end;


function yes()
	Talk(1,"no","Muèn luyÖn tËp néi gia c«ng phu cã 2 bİ quyÕt lín: H¬i thë s©u chËm, tŞnh t©m täa thiÒn ®Õn khi kh«i phôc ®­îc nguyªn thÇn. CÇn tu luyÖn mçi ngµy, chó ı ®Õn kinh m¹ch cã thÓ tr¸ch ®­îc bÖnh tËt, ch©n khİ ®­îc t¨ng lªn. ThÊu hiÓu ®¹o lı nµy cã thÓ dïng khİ vËn chiªu, häc bÊt cø c«ng phu g× ®Òu cã thÓ nhËn ®­îc béi phÇn c«ng lùc!")
	AddMagic(151,1);
	AddMagic(153,1);
end

function no()
	Talk(1,"","H·y thay ta nãi víi chñ d­îc ®iÕm, ®¬n d­îc h¾n bèc rÊt linh nghiÖm, tiÖn thÓ bèc thªm cho ta 2 thang!")
end




		