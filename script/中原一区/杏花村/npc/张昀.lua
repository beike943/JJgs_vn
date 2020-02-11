--ÈÎÎñ
--µØµã£ºãê¾© ÈÎÎñ£ºÌìÃÅ¹ØÈÎÎñ½áµã9
--²ß»®£º·®ÍòËÉ  2004.03.
Include("\\script\\task\\world\\task_award.lua");
function main()
UWorld1401 = GetTask(1401)
if ( UWorld1401 == 60  )  then
		Talk(2,"","C­ d©n cña H¹nh Hoa th«n ®· ®i ®©u hÕt råi? <color=red>Hµn Trİ Nh­îng<color> l·o nh©n ë ®©u?","T×m ta cã chuyÖn chi? Gióp ta ®Õn H¹nh Hoa th«n lÊy <color=red>10 bé quan phôc<color> cña bän <color=red>Quan sø <color>®· råi h·y ®Õn ®©y!")
		SetTask(1401,65)
    --AddNote("ÒªÄÃ10Ì×¹Ù·ş²ÅÄÜµÃµ½½øÒ»²½µÄÏûÏ¢¡£")
    TaskTip("LÊy vÒ 10 bé quan phôc míi biÕt thªm tin tøc!")
						    		
elseif ( UWorld1401  == 65 and GetItemCount(2,1,34) >= 10 ) then
				if  DelItem(2,1,34,10) == 1 then
						    Talk(2,"","Qu¶ nhiªn lµ h¶o h¸n! Hµn Trİ Nh­îng v× muèn tr¸nh lo¹n l¹c ®· Èn tr¸nh ë <color=red>§«ng BiÖn Kinh Phñ<color>. Tù m×nh ®i t×m «ng ta ®i!.","§a t¹ ®· chØ gi¸o!")
						    SetTask(1401,70)
						    GivePlayerExp(SkeyTianmenzhen,"eli")
						    Earn(1000)
						    ModifyReputation(12,0)
						    --AddNote("µÃÖªº«ÖÇÈÃÒÑ¾­°áµ½ãê¾©¸®Î÷ÁË£¬ĞèÒª½øÈë×÷½øÒ»²½µ÷²é¡£")
						    TaskTip("Hµn Trİ Nh­îng ®ang ë T©y BiÖn Kinh (189.174), mau ®Õn ®ã gÆp!")
				else
						 Talk(1,"","ChuyÓn giao vËt phÈm kh«ng thµnh c«ng")
				end
elseif ( UWorld1401  == 65 and GetItemCount(2,1,34) < 10 ) then
			Talk(1,"","Gióp ta ®¸nh <color=red>Quan sø<color>, lÊy ®­îc <color=red>10 bé quan phôc<color> råi h·y ®Õn gÆp ta!")
elseif ( UWorld1401  == 70 ) then
			Talk(1,"","C­ d©n cña H¹nh Hoa th«n ®· ®Õn <color=red>BiÖn Kinh phñ t©y<color> l¸nh n¹n, ng­¬i mau ®Õn ®ã ®i.")	
else
			Talk(1,"","Bän Quan sø nµy ta quyÕt kh«ng tha cho chóng!")
	end
end;
