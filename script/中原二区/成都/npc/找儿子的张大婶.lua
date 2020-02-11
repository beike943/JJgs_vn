function main()
	UWorld1508 = GetTask(1508)
	if ( UWorld1508 == 10 and  GetLevel() > 7 )  then
		Say("Cã thÓ gióp ta t×m L¨ng Nhi kh«ng? Nã ra ngoµi tõ sím ®Õn giê vÉn ch­a thÊy vÒ.",2,"§ång ı/yes1508","Ta cßn chót viÖc/no1508")
	elseif ( UWorld1508  >= 5 and  UWorld1508  < 40)  then	
		Talk(1,"","VÉn ch­a cã tin tøc cña L¨ng Nhi? Ta ph¶i lµm sao b©y giê?")
	elseif  UWorld1508  ==40    then
		Talk(1,"","T­íng c«ng! T«i vµ Méc thóc thóc kh«ng cã lµm g× cã lçi víi «ng, t¹i sao L¨ng Nhi l¹i nghÜ nh­ thÕ? ViÖc ®Õn n­íc nµy, «ng kªu t«i lµm sao sèng ®©y!")
		SetTask(1508,45)
		Earn(1000)
		ModifyExp(1000)
		AddNote("Hoµn thµnh nhiÖm vô Lang T©m TÕ Phô")
		TaskTip("Hoµn thµnh nhiÖm vô Lang T©m TÕ Phô")
	elseif  UWorld1508  >=45    then
		Talk(1,"","T­íng c«ng! L¨ng Nhi cña chóng ta còng ®· lín, kh«ng cÇn t«i ph¶i lo l¾ng, t«i sÏ theo «ng.")
	else
		Talk(1,"","Cha nã mÊt sím ®Ó l¹i hai mÑ con ta, nÕu kh«ng cã Méc thóc thóc gióp ®ì thËt kh«ng biÕt ph¶i lµm sao!")
	end
end;

function yes1508 ()
		Talk(1,"","L¨ng Nhi th­êng ch¬i chung víi ThuËn Oa trong thµnh, ng­¬i ®Õn hái ThuËn Oa xem?")
		SetTask(1508,5)
		AddNote("T×m ThuËn Oa hái tin tøc cña L¨ng Nhi")
		TaskTip("NhËn nhiÖm vô Lang T©m TÕ Phô.")
end;

function no1508 ()
		Talk(1,"","B»ng h÷u bËn viÖc ta kh«ng thÓ miÔn c­ìng!")
end;
