Include("\\script\\task\\world\\task_award.lua")
function main()
	UWorld1507 = GetTask(1507)
		if ( UWorld1507 == 0 and  GetLevel() > 4 )  then
				Say("Rau c¶i trong v­ên ta ®Òu bŞ thá c¾n hÕt! Cã thÓ gióp ta diÖt chóng kh«ng?",2,"§Ó ta ra tay!/yes1507","Ta cßn chót viÖc/no1507")
		elseif ( UWorld1507  == 5 and  GetItemCount(2,1,2) >= 10)  then	
							Talk(1,"","B»ng h÷u qu¶ lµ th©n thñ bÊt phµm! §©y lµ mét chót thµnh ı, xin nhËn lÊy!")
							SetTask(1507,10)
										DelItem(2,1,2,10)
							--AddItem(2,1,1,1)
					    Earn(300)
						GivePlayerExp(SkeyShiJieChongFu,"xiaohuitu")
					    ModifyReputation(2,0)
					    --AddNote("°ï°¢Ê¢³ÍÖÎÍÃ×ÓµÄÈÎÎñÍê³É")
					    TaskTip("Hoµn thµnh nhiÖm vô gióp A ThŞnh trõng trŞ Thá hoang")
		elseif ( UWorld1507  == 5  and  GetItemCount(2,1,2)<= 9  )  then
							Talk(1,"","§¸m Thá X¸m ®ang ph¸ v­ên rau cña ta, h·y ®Õn ®¸nh chóng vµ lÊy <color=red>10 ®u«i Thá<color> vÒ ®©y.")
				else
							Talk(1,"","V­ên nhµ ta bŞ ®¸m Thá x¸m lµm lo¹n c¶ lªn, kh«ng biÕt ph¶i lµm sao ®©y!")
		end
end;

function yes1507 ()
		Talk(1,"","Nhê b»ng h÷u gióp ta diÖt chóng vµ lÊy <color=red>10 ®u«i Thá<color> vÒ ®©y!")
		SetTask(1507,5)
		--AddNote("½ÓÊÜ°ï°¢Ê¢³ÍÖÎÍÃ×ÓµÄÈÎÎñ")
		TaskTip("NhËn nhiÖm vô gióp A ThŞnh trõng trŞ Thá x¸m")
end;

function no1507 ()
		Talk(1,"","B»ng h÷u bËn viÖc ta còng kh«ng miÔn c­ìng!")
end;
