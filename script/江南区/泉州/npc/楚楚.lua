--ĞÂÊÖÖ¸Òı
--lijinyong

function main()
	Uworld1 = GetTask(1)
	if ((Uworld1 == 1) and (HaveItem(0)>0)) then
		Say("§a t¹ ng­¬i! Nµo ngê M¹nh c«ng tö còng bá Së Së. Ta c¶m thÊy qu¸ c« ®¬n, muèn cã ng­êi chia sÎ. Ng­¬i muèn biÕt c¸ch giao tÕ kh«ng?",2,"Muèn/yes","Kh«ng cÇn ®©u!/no")
	DelItem(0)
	SetTask(1,2)
	else
		Talk(1,"","H«m nay ta ph¶i dù d¹ yÕn cña Tri Ch©u ®¹i nh©n! Ch¼ng biÕt ph¶i diÖn ®å g× ®©y! ThËt phiÒn phøc!")
	end
end;


function yes()
	Talk(1,"no","Giao l­u gåm: t×m hiÓu, trß chuyÖn hoÆc chøc n¨ng kh¸c. NhÊn Ctrl + chuét ph¶i lªn nh©n vËt ®Ó xem tin tøc. Cã thÓ trß chuyÖn víi ng­êi kh¸c b»ng c¸c c¸ch: chän môc trß chuyÖn trong cöa sæ t×m hiÓu; nhÊp ®óp vµo tªn nh©n vËt ®­îc nh×n thÊy hoÆc nhËp tªn ng­êi ch¬i vµo kªnh trß chuyÖn ®Ó tiÕn hµnh giao l­u trùc tiÕp!")
	AddGoldItem(0,10);
end

function no()
	Talk(1,"","Ta ®Æt mua Gi¸ng Sa bµo ë tiÖm Kim hoµn ®· 10 n¨m, ®Õn nay vÉn ch­a mang tíi! PhiÒn b»ng h÷u ®Õn hái gióp! Ta ®Şnh mÆc nã ®i dù d¹ yÕn cña YÕn Thï ®¹i nh©n!")
end