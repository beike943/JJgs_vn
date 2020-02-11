
Include("\\script\\task\\faction\\faction_main_ym.lua");
Include("\\script\\task\\faction\\faction_head.lua");




function main()
   
  local nTaskValue = FN_GetTaskState(FN_YM);

	if (nTaskValue==2) then
		task_105();
		return
	elseif (nTaskValue==3) then
		Say("Ra cöa lµ thÊy ngay ng­êi b¸n ngùa.",0);
		return
	elseif (nTaskValue==4) then
		task_109();
		return
	end;


  
	i=random(1,4)
	if i==1 then 
		Talk(1,"","Tôc ng÷ cã c©u: Thiªn h¹ ®¹i thÕ, hîp cöu tÊt ph©n, ph©n cöu tÊt hîp. MÊy n¨m nay trung nguyªn ®¹i lo¹n ®Õn lóc ph¶i thèng nhÊt giang s¬n!")
	elseif i==2 then
		Talk(1,"","Nhí n¨m x­a ta theo tiªn ®Õ nam chinh b¾c ph¹t cã trËn chiÕn nµo ch­a gÆp qua, bän Liªu cÈu d¸m ®Õn ta sÏ cho chóng biÕt tay.")
	elseif i==3 then
		Talk(1,"","Nam nhi ph¶i häc tèt vâ nghÖ x«ng pha chiÕn tr­êng giÕt giÆc, gièng th­ sinh lµm ®­îc trß trèng g×?")
	else
		Talk(1,"","Hõ! Theo tiªn ®Õ phiªu b¹t giang hå hay h¬n lµm Khu MËt sø, phiÒn chÕt ta mÊt!")
	end
  
end
  

