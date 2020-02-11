--ÈÎÎñ
--µØµã£º ÈÎÎñ£º
--²ß»®£º·®ÍòËÉ  2004.03.
Include("\\script\\task\\world\\task_award.lua");


function main()
UWorld1402 = GetTask(1402)

-------------------´ò¿ª¹í³ÇÈÎÎñµÚÎå²½---------------------------------------------
if ( UWorld1402 == 50  )  then
		Talk(2,"","S­ phô ch¾c lµ HuyÒn DiÖt T«n Gi¶! D­¬ng NguyÖt s­ th¸i tiÕn cö ta ®Õn ®iÒu tra viÖc Phong §« Quû thµnh ®ét nhiªn xuÊt hiÖn ë Giang T©n Th«n. Víi søc lùc cña S­ th¸i kÕt hîp víi X¸ Lîi kim ®¬n vÉn ch­a ®ñ cÇn ®­îc sù gióp ®ì cña s­ phô!","Ra lµ vËy! Kh«ng ngê Phong §« Quû thµnh l¹i xuÊt hiÖn ë nh©n gian. Thİ chñ h·y gióp ta t×m <color=red>2 x©u Thiªn PhËt ch©u<color> vÒ tr­íc ®·!","T¹i h¹ ®i ngay!")
		SetTask(1402,55)
		--AddItem(1,1,1,1)
		Earn(800)
		GivePlayerExp(SkeyFDGC,"fengduguicheng7")		--·á¶¼¹í³Ç7
		ModifyReputation(11,0)
		--AddNote("ĞèÒªÈ¥È¡2´®ÉÙÁÖµÄÌì·ğÖéµ½ĞşÃğ×ğÕßÄÇÀï¡£")
		TaskTip("T×m 2 chuçi Thiªn PhËt ch©u cho HuyÒn DiÖt T«n Gi¶.")	
		
elseif ( UWorld1402  == 55 and GetItemCount(2,3,4) < 2 ) then
		Talk(1,"","Mau t×m <color=red>2 chuçi Thiªn PhËt ch©u<color> vÒ!")
elseif ( UWorld1402  == 55 and GetItemCount(2,3,4) >= 2 ) then
		if  DelItem(2,3,4,1) == 1 then
				Talk(5,"","Thiªn PhËt ch©u ®©y!","CÊt mét c¸i ®i ta sÏ phï phĞp c¸i kia ®Ó yªu ma kh«ng nhËp ®­îc vµo ng­¬i. Nhí lÊy! PhĞp thuËt ta chØ gióp ng­êi phßng th©n chø kh«ng thÓ ®i l¹i trong Quû thµnh.","VËy ph¶i lµm sao?","Ng­¬i ph¶i ®Õn <color=red>Vâ §ang<color> t×m <color=red>TËp Nguyªn ch©n nh©n<color> thØnh <color=red>§én Èn linh phï<color> míi cã thÓ ®i l¹i trong Quû thµnh.","T¹i h¹ ®i ngay!") 
				SetTask(1402,60)
				--AddItem(1,1,1,1)
				Earn(1000)
				GivePlayerExp(SkeyFDGC,"fengduguicheng8")		--·á¶¼¹í³Ç8
				ModifyReputation(12,0)
				--AddNote("ÔÙÈ¥Îäµ±É½ÕÒ¼¯ÔµÕæÈË£¬ÇóÒ»µÀ¶İÒşÁé·û¾Í¿ÉÒÔÆ½°²µÄ³öÈëÓÚ·á¶¼¹í³ÇÁË¡£")
				TaskTip("§Õn Vâ §ang t×m TËp Nguyªn ch©n nh©n thØnh §én Èn linh phï ®Ó ra vµo Phong §« Quû thµnh.")
		else
				Talk(1,"","ChuyÓn giao vËt phÈm kh«ng thµnh c«ng")
		end
elseif ( UWorld1402  == 60 ) then
		Talk(1,"","Ng­¬i ph¶i ®Õn <color=red>Vâ §ang<color> t×m <color=red>TËp Nguyªn ch©n nh©n<color> thØnh <color=red>§én Èn linh phï<color> míi ®­îc.")
else
		Talk(1,"","Ta cã c¶m gi¸c th¶m häa s¾p Ëp ®Õn!")
end
end;
