--ĞÂÊÖÖ¸Òı
--lijinyong

function main()
	Uworld1 = GetTask(1)
	if Uworld1 == 5  then
		Say("Cuèi cïng ta ®· gia nhËp ®­îc Vâ §ang. Ta quyÕt sÏ trë thµnh mét ®¹i hiÖp ®Ønh thiªn lËp ®Şa. §a t¹ tiÓu huynh ®Ö b¸o tin lµnh! Cã muèn ta truyÒn l¹i kinh nghiÖm kh«ng? ",2,"Muèn/yes","Kh«ng cÇn ®©u!/no")
	SetTask(1,6)
	else
		Talk(1,"","§a t¹ c¸c h¹ dÉn d¾t ta tíi ®Êt Trung Nguyªn! A men!")
	end
end;


function yes()
	Talk(1,"no","Th©n thñ cña ng­¬i hiÖn giê ch­a nªn ra ngoµi ®¸nh qu¸i! H·y vµo c¸c thµnh thŞ th­ëng ngo¹n, kÕt giao b»ng h÷u nhÊt ®Şnh sÏ gÆp nhiÒu ®iÒu bÊt ngê! H·y ®Õn thØnh gi¸o c¸c tiÒn bèi cao nh©n trªn giang hå! Träng th­¬ng cã thÓ ®Õn TrÇn L·o H¸n tèt bông trong thµnh ch÷a miÔn phİ!")
	Earn(1000)
end

function no()
	Talk(1,"","H·y b¸o víi HËu Tr­êng Sinh ë gi÷a qu¶ng tr­êng, ngµy mai ta ph¶i lªn nói Vâ §ang, e r»ng kh«ng thÓ häc vâ nghÖ víi h¾n n÷a!")
end




		