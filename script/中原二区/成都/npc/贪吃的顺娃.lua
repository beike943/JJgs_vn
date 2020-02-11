function main()
	UWorld1508 = GetTask(1508)
	if  UWorld1508 == 5  then
		Say("Tung tÝch L¨ng Nhi µ? Ta ®­¬ng nhiªn biÕt, h·y mua cho ta 3 c¸i b¸nh bao thÞt ta sÏ nãi cho nghe.",2,"Mua b¸nh bao cho ThuËn Oa/yes1508","Kh«ng mua/no1508")
	elseif  UWorld1508  == 11  then	
		Talk(1,"","Ta muèn ¨n b¸nh bao thÞt, kh«ng ph¶i b¸nh bao rau hÑ, th«i ¨n ®ì lãt d¹, nh­ng ta e r»ng kh«ng ®ñ søc nãi chuyÖn cïng ng­¬i!")
		Msg2Player("§Õn chç §«ng Muéi mua 3 c¸i b¸nh bao thÞt cho ThuËn Oa.")
	elseif ( UWorld1508  >= 10 and  UWorld1508  < 25)  then	
		Talk(1,"","Ng­¬i nhanh lªn 1 chót ®­îc kh«ng? Ta ®ãi s¾p chÕt råi nÌ!")
	elseif  UWorld1508  == 25   then	
		SetTask(1508,30)
		Earn(1)
		ModifyExp(1)
		Talk(1,"","Tê mê s¸ng ta cã thÊy L¨ng Nhi ra ngoµi thµnh, gäi nh­ng kh«ng thÊy lªn tiÕng!")
		AddNote("Ra ngoµi thµnh t×m L¨ng Nhi")
		Msg2Player("Ra ngoµi thµnh t×m L¨ng Nhi")
	else
		Talk(1,"","B¸nh bao th¬m qu¸! NÕu cã thÞt th× hay biÕt mÊy!")
	end
end;

function yes1508 ()
		Talk(1,"","Ng­¬i lµm ta thËt c¶m ®éng! Nh­ng ng­¬i ph¶i nhanh lªn nhÐ, ta ®ãi qu¸ kh«ng cßn nhí g× n÷a c¶!")
		SetTask(1508,10)
		AddNote("§Õn chç §«ng Muéi mua 3 c¸i b¸nh bao thÞt.")
		Msg2Player("§Õn chç §«ng Muéi mua 3 c¸i b¸nh bao thÞt.")
end;

function no1508 ()
		Talk(1,"","§«ng tû tû, ®Ö thÌm b¸nh bao qu¸!")
end;
