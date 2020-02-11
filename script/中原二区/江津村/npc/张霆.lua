--ÈÎÎñ
--µØµã£º ÈÎÎñ£º
--²ß»®£º·®ÍòËÉ  2004.03.
Include("\\script\\task\\world\\task_award.lua");


function main()

	if GetTask(150) == 9 then
		Say("T×m ta cã viÖc g×?",
			4,
			"T×m hiÓu t×nh h×nh Giang T©n th«n/fengdu",
			"Lµm c¸ch nµo ®iÒu khiÓn Táa Yªu chung?/suoyaozhong",
			"§¹i hiÖp! Ta cã thÓ gióp g×?/huanyouhun",
			"Kh«ng cã g×/no")
	else
		Say("T×m ta cã viÖc g×?",
			3,
			"T×m hiÓu t×nh h×nh Giang T©n th«n/fengdu",
			"§¹i hiÖp! Ta cã thÓ gióp g×?/huanyouhun",
			"Kh«ng cã g×/no")
	end

end

function huanyouhun()
UWorld1402 = GetTask(1402)
if ( UWorld1402 > 20 )  then
		Say("Ta cÇn <color=red>Kú Th¹ch TuyÕt Ph¸ch<color> cña <color=red>B¨ng Qu¸i<color> ë tÇng 2 B¨ng T©m ®éng ®Ó lµm Thiªn Lang Ch©m, nÕu ng­¬i cã thÓ t×m gióp ta <color=red>15 TuyÕt Ph¸ch<color> ®Ó ta lµm ph¸p khİ, ta sÏ cho ng­¬i 10 viªn kú th¹ch <color=red>U Hån<color>.",
		2,
		"§­a ng­êi 15 TuyÕt Ph¸ch/huan",
		"Sau nµy h·y tİnh/no")
		else 
		Say("T¹m thêi kh«ng cÇn ng­¬i gióp.",0)
end
end

function huan()
	if	GetItemCount(2,1,45) >= 15 then
	DelItem(2,1,45,15)
	AddItem(2,1,51,10)
	Say("§a t¹ b»ng h÷u!", 0);	
	else
	Say("H×nh nh­ TuyÕt Ph¸ch kh«ng ®ñ! B»ng h÷u quªn mang theo råi ­?",0)
end
end;


function fengdu()
UWorld1402 = GetTask(1402)
if ( UWorld1402 == 10 )  then
		Talk(2,"","Ta ®· tróng Thi ®éc, mau t×m <color=red>10 Ph¸ Ma Chó<color> ®Õn kh¾c chÕ chóng!","T¹i h¹ ®i ngay!")
		SetTask(1402,15)
elseif ( UWorld1402  == 15 and  GetItemCount(2,3,12) < 9 ) then
		Talk(1,"","Mau t×m <color=red>10 Ph¸ Ma Chó<color> vÒ ®©y! Nhanh lªn!")
elseif ( UWorld1402  == 15 and  GetItemCount(2,3,12) >  9 ) then
		if  DelItem(2,3,12,10) == 1 then 
				Talk(1,"","Hay l¾m! §a t¹ b»ng h÷u t­¬ng trî! Ta vèn nghÜ chØ cÇn mét m×nh ta còng cã thÓ ®uæi bän yªu ma quû qu¸i nh­ng xem ra kh«ng ®­îc. h·y ®Õn <color=red>Nga My s¬n<color> t×m <color=red>D­¬ng NguyÖt S­ Th¸i<color>, víi ph¸p lùc cña bµ ta kh«ng chõng sÏ cã c¸ch ®èi phã.")
				 SetTask(1402,20)
				 --AddItem(1,1,1,1)
				 Earn(800)
				 GivePlayerExp(SkeyFDGC,"fengduguicheng2")		--·á¶¼¹í³Ç2
				 ModifyReputation(10,0)
				 --AddNote("È¥¶ëÃ¼É½ÇóÖúÓÚÑôÔÂÊ¦Ì«£¬¿´¿´ÓĞÊ²Ã´°ì·¨¡£")
				 TaskTip("§Õn Nga My s¬n nhê D­¬ng NguyÖt S­ Th¸i gióp ®ì.")
		else
				 Talk(1,"","ChuyÓn giao vËt phÈm kh«ng thµnh c«ng")
		end
elseif ( UWorld1402  == 20 ) then
				Talk(1,"","§¸m yªu nghiÖt nµy nhÊt ®Şnh cã chót xuÊt sø, h·y ®Õn <color=red>Nga My s¬n<color> t×m <color=red>D­¬ng NguyÖt S­ Th¸i<color>, víi ph¸p lùc cña bµ ta kh«ng chõng sÏ cã c¸ch ®èi phã.")
else
		Talk(1,"","Ta nhÊt ®Şnh sÏ diÖt trõ bän yªu nghiÖt nµy!")
end
end;

function suoyaozhong()

	if GetItemCount(2,1,19) >= 30 then
		Talk(5,"",
				"TiÒn bèi ®©y lµ 30 ®u«i hæ.",
				"Hay l¾m! Chê ta chót xİu.",
				"Mét l¸t sau……",
				"§©y lµ Hµnh Thi vµ Hñ Thi ng­¬i cÇn, mau ®em vÒ cho <color=yellow>Gia C¸t Kú<color>.",
				"§a t¹ tiÒn bèi!"
				);
		DelItem(2,1,19,30);
		AddItem(2,0,85,25);
		AddItem(2,0,86,15);
		TaskTip("§em Oan Hån vÒ cho Gia C¸t Kú");
	else
		Talk(2,"",
				"§­îc biÕt tiÒn bèi biÕt c¸ch dïng Táa Yªu chung thu phôc Hµnh thi vµ Hñ Thi nªn m¹o muéi nhê tiÒn bèi chØ dÉn cho!",
				"§óng vËy! §Ó ph¸t huy uy lùc cña Táa Yªu chung cÇn <color=yellow>30 c¸i ®u«i hæ<color>, ng­¬i thö ®Õn <color=yellow>ThiÕu L©m<color> t×m xem!"
				);
		TaskTip("§em 30 §u«i hæ cho Tr­¬ng §×nh");	
	end
end

function no()

end