--ÈÎÎñ
--µØµã£º ÈÎÎñ£º
--²ß»®£º·®ÍòËÉ  2004.03.
Include("\\script\\task\\world\\task_award.lua");


function main()
UWorld1402 = GetTask(1402)

------------ÒÔÏÂÊÇ¿ªÆô¹í³ÇÈÎÎñµÄµÚÁù²¿----------------------------

if ( UWorld1402 == 60 )  then
		Talk(2,"","Ng­êi lµ TËp Nguyªn Ch©n Nh©n? T¹i h¹ ®­îc HuyÒn DiÖt T«n Gi¶ chØ ®Õn ®©y. Phong §« Quû Thµnh ®ét nhiªn xuÊt hiÖn t¹i nh©n gian, D­¬ng NguyÖt S­ Th¸i ph¸i t¹i h¹ ®i ®iÒu tra nh­ng cÇn ng­êi gióp ®ì míi cã thÓ vµo Quû Thµnh.","Th× ra lµ vËy! Ng­¬i h·y t×m <color=red>1 c©y ChiÕt Xung Bót<color> vµ <color=red>1 phÇn Chu Sa<color> vÒ ®©y, ta sÏ vÏ cho ng­¬i 1 l¸ bïa.","T¹i h¹ tu©n lÖnh!")
		SetTask(1402,65)
		--AddNote("ĞèÒª1¸ùÕÛ³å±ÊºÍ1·İÖìÉ°ºÃÈÃ¼¯ÔµÕæÈË»­¶İÒşÁé·û¡£")
		TaskTip("T×m 1 c©y ChiÕt Xung Bót vµ 1 phÇn Chu Sa ®Ó TËp Nguyªn Ch©n Nh©n vÏ §én Èn linh phï.")

elseif ( UWorld1402  == 65  and ( GetItemCount(0,9,76) < 1 or GetItemCount(2,2,30) < 1 ) ) then
		Talk(1,"","Ng­¬i h·y t×m <color=red>1 c©y ChiÕt Xung Bót<color> vµ <color=red>1 phÇn Chu Sa<color> vÒ ®©y, ta sÏ viÕt cho ng­¬i 1 l¸ §én Èn linh phï.")
elseif ( UWorld1402  == 65 and GetItemCount(0,9,76) >=1 and GetItemCount(2,2,30) >= 1  ) then
		if  ( DelItem(0,9,76,1) == 1 and  DelItem(2,2,30,1) == 1 )then
					Talk(1,"","Ch©n nh©n! T¹i h¹ ®· t×m ®­îc råi!","Hay l¾m! H·y cÇm lÊy tÊm <color=red>§én Èn linh phï<color> nµy. Ng­¬i h×nh nh­ ®· cã <color=red>X¸ Lîi Kim §¬n<color> vµ <color=red>Thiªn PhËt Ch©u<color> cña Nga My vµ ThiÕu L©m, ph¶i mang theo 3 mãn ®ã bªn m×nh míi cã thÓ b×nh an ra vµo Phong §« Quû Thµnh, <color=yellow>thiÕu 1 mãn còng kh«ng ®­îc<color>, h·y nhí lÊy!","Ta ®· tõng vµo <color=red>Phong §« Quû Thµnh<color> mét lÇn, nªn trong rÊt lµ nguy hiÓm, ng­¬i <color=red>®iÒu tra<color> xong lËp tøc quay vÒ b¸o tin cho <color=red>D­¬ng NguyÖt S­ Th¸i<color> biÕt.","T¹i h¹ lËp tøc lªn ®­êng!") 
					SetTask(1402,70)
					AddItem(2,1,150,1)
					Earn(1000)
					GivePlayerExp(SkeyFDGC,"fengduguicheng9")		--·á¶¼¹í³Ç9
					ModifyReputation(15,0)
					TaskTip("§em theo X¸ Lîi Kim §¬n, Thiªn PhËt Ch©u, §én Èn linh phï ®Õn Phong §« Quû Thµnh ®iÒu tra xong quay vÒ b¸o tin cho D­¬ng NguyÖt S­ Th¸i")
		else
					Talk(1,"","ChuyÓn giao vËt phÈm kh«ng thµnh c«ng")
		end
elseif ( UWorld1402  >= 70 ) then
			Say("§Õn nhê ta vÏ <color=red>§én Èn linh phï<color>? Ph¶i cã <color=red>1 c©y ChiÕt Xung Bót<color> vµ <color=red>1 phÇn Chu Sa<color> míi ®­îc.",2,"VÏ §én Èn linh phï/yes1402_70","Kh«ng cã viÖc g×/no1402_70")
else
		Talk(1,"","Than «i! Tai häa lín l¹i s¾p b¾t ®Çu!")
end
end;

function  yes1402_70()
if ( GetItemCount(0,9,76) >=1 and GetItemCount(2,2,30) >= 1  ) then
		if  ( DelItem(0,9,76,1) == 1 and  DelItem(2,2,30,1) == 1 )then
				Talk(1,"","H·y cÇm lÊy <color=red>§én Èn linh phï<color>! Ng­¬i ph¶i cã <color=red>X¸ Lîi Kim §¬n<color> vµ <color=red>Thiªn PhËt Ch©u<color>, mang theo 3 mãn ®å nµy cã thÓ b×nh an ra vµo Phong §« Quû Thµnh, h·y nhí kü <color=yellow>thiÕu mét còng kh«ng ®­îc<color>!  ") 
				AddItem(2,1,150,1)
				--AddNote("µÃµ½Ò»µÀ¶İÒşÁé·û¡£")
				TaskTip("NhËn ®­îc mét §én Èn linh phï.")
		else
				Talk(1,"","ChuyÓn giao vËt phÈm kh«ng thµnh c«ng")
		end			
elseif ( GetItemCount(0,9,76) == 0 or GetItemCount(2,2,30) == 0 ) then
		Talk(1,"","Ph¶i cã <color=red>1 c©y ChiÕt Xung Bót<color> vµ <color=red>1 phÇn Chu Sa<color> míi ®­îc.")
else
		Talk(1,"","Trong lßng ta ®ang kh«ng vui! Ng­¬i h·y quay l¹i sau ®i!")

end
end;

function  no1402_70()
				Talk(1,"","T¹i h¹ chØ ®Õn tham quan phong c¶nh cña Vâ §ang.")
end;

