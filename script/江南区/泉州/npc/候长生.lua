--新手指引
--lijinyong

function main()
	Uworld1 = GetTask(1)
	if Uworld1 == 6  then
		Say("能去武当学习武功是每个人的梦想! V� c玭g b鎛 ph竔 n閕 ngo筰 tng t�, h� th鵦 tng sinh. Tr玭g ti觰 huynh  t� ch蕋 tinh th﹎ nh璶g xem ra ch璦  c╪ c�! Chi b籲g h穣 h鋍 hai chi猽 c玭g phu c� b秐 c馻 L穙 Nhi T� xem th鵦 l鵦 th� n祇!",2,"Mu鑞/yes","Kh玭g c莕 u!/no")
	SetTask(1,7)
	else
		Talk(1,"","有这么多的徒弟，但没有人对我们感到满意!")
	end
end;


function yes()
	Talk(1,"no","想要精心练习，有两个大秘密：深呼吸，沉思冥想直至精神恢复。 每天需要修炼!")
	AddMagic(151,1);
	AddMagic(153,1);
end

function no()
	Talk(1,"","我告诉药店的老板，他的处方非常有效，这又给了我两个!")
end




		