--ĞÂÊÖÖ¸Òı
--lijinyong

function main()
	Uworld1 = GetTask(1)
	if Uworld1 == 3  then
		Say("Dï chİnh hay tµ, chØ cÇn cã lßng ®Òu cã thÓ kÕt lµm b»ng h÷u. KÕt giao nhiÒu b»ng h÷u, hßa khİ ¾t sinh tµi. Ng­êi b¹n trÎ muèn biÕt lµm sao ®Ó kÕt giao b»ng h÷u kh«ng?",2,"Muèn/yes","Kh«ng cÇn ®©u!/no")
	SetTask(1,4)
	else
		Say("CÇn ta ®­a ng­¬i ®Õn Nam BiÖn Kinh kh«ng?",2,"CÇn/gotomap53","Kh«ng cÇn/noneed")
	end
end;


function yes()
	Talk(1,"no","Khi ng­¬i nh×n thÊy ng­êi muèn kÕt giao hoÆc tªn ng­êi ®ã, nhÊn Ctrl+chuét ph¶i lªn ng­êi hoÆc tªn lµ cã thÓ mêi ng­êi ®ã kÕt lµm b»ng h÷u. NÕu biÕt sè id cña ®èi ph­¬ng, cã thÓ th«ng qua sè id ®Ó t×m ®èi ph­¬ng mêi kÕt giao. Sau khi thµnh b»ng h÷u, ®é th©n mËt hai ng­êi sÏ t¨ng dÇn, cã thÓ kÕt thµnh phu thª hoÆc kÕt nghÜa kim lan!")
	Earn(1000)
end

function no()
	Talk(1,"","Ta ®· mang hµng hãa chñ l«i ®µi cÇn vÒ råi. H·y gióp ta nh¾n h¾n ®Õn lÊy!")
end


function gotomap53()
	SetFightState(1)
	NewWorld(201, 1575 ,3168);
end

function noneed()
end
	