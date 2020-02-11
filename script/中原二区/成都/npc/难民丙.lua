-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ¶ëÃ¼ÃÅÅÉÈÎÎñÄÑÃñ±û½Å±¾ÎÄ¼ş
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================

Include("\\script\\task\\faction\\faction_main_em.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_½­½ò´å\\task_main.lua");

function main ()
    local nTaskValue = FN_GetTaskState(FN_EM);
    local nStep = GetTask(TASK_JJC_BING);
    
    if nTaskValue == 2 and nStep == 1 then
        local szSay = {
            "<sex>T×m tiÓu nh©n cã viÖc g×?",
            "NhiÖm vô Nga My ph¸i/em_question",
            "NhiÖm vô Giang T©n th«n/jjc_question"
        };
        SelectSay(szSay);
        return
    end;
    
    if nTaskValue == 2 then
        em_question();
        return
    end;
    
    if nStep == 1 then
        jjc_question();
        return
    end;
    
  	UWorld1506 = GetTask(1506)
  	UWorld1515 = GetTask(1515)
  	if ( UWorld1506 >= 5   and  UWorld1515 == 0 )   then
  		Talk(3,"","Chu ThiÖn Nh©n më kho ph¸t l­¬ng thùc, sai ta ®Õn th«ng b¸o cho ng­¬i biÕt.","§a t¹ B»ng h÷u ®· ®Õn b¸o tin, ®¹i ©n ®¹i ®øc nµy ta sÏ kh«ng quªn!","ChØ lµ chuyÖn nhá! §õng nªn kh¸ch s¸o. H·y mau ®Õn ®ã, ta cßn ph¶i b¸o tin cho ng­êi kh¸c n÷a!")
  		SetTask(1515,1)
  		UWorld1506=UWorld1506+1
  		SetTask(1506,UWorld1506)
  		if UWorld1506 == 9 then 
  			AddNote("Th«ng b¸o N¹n d©n xong, quay vÒ gÆp Chu ThiÖn Nh©n!")
			TaskTip("Th«ng b¸o N¹n d©n xong, quay vÒ gÆp Chu ThiÖn Nh©n!")
  		end	
  	elseif ( GetCash() >=50000  )  then
		Say("Cho t«i vµi ®ång mua mµn thÇu ¨n ®i! TiÓu d©n cßn mÑ giµ vµ vî con cÇn ph¶i lo, ng­êi nãi xem cßn ai khæ h¬n ta n÷a?",2,"ThËt lµ téi nghiÖp!/zaimin1000_yes","H·y t×m ng­êi kh¸c ®i!/zaimin_no")
	elseif ( GetCash() >=4000 and GetCash() < 50000  )  then
		Say("Cho t«i xin vµi ®ång mua chĞn ch¸o ¨n ®i! Vî cña tiÓu d©n ®· bá theo ng­êi kh¸c, con th× b¸n cho «ng chñ lµm A Hoµn, ng­êi nãi xem cßn ai khæ h¬n ta?",2,"ThËt lµ téi nghiÖp!/zaimin500_yes","H·y t×m ng­êi kh¸c ®i!/zaimin_no")
	elseif ( GetCash() >=1000 and GetCash() < 4000 )  then
		Say("Cho t«i xin vµi ®ång mua chĞn ch¸o ¨n ®i! TiÓu nh©n ®· ®Õn b­íc ®­êng cïng råi, ng­êi nãi xem cßn ai khæ h¬n ta?",2,"ThËt lµ téi nghiÖp!/zaimin100_yes","H·y t×m ng­êi kh¸c ®i!/zaimin_no")
	elseif ( GetCash() >=50 and GetCash() < 1000 )  then
		Say("Cho tiÓu nh©n mÊy ®ång mua ch¸o ¨n ®i! TiÓu nh©n ®ãi ®Õn nçi ph¶i b¸n con chã ®Ó ®æi mµn thÇu ¨n. Ng­êi nãi xem cßn ai khæ h¬n ta chø?",2,"ThËt lµ téi nghiÖp!/zaimin10_yes","H·y t×m ng­êi kh¸c ®i!/zaimin_no")
	elseif ( GetCash() < 50 )  then
		Say("TiÒn trong ng­êi cßn İt h¬n ¨n mµy n÷a. Ng­êi nãi xem cßn ai khæ h¬n ta n÷a?",2,"Cho dï cã còng kh«ng cho ng­¬i! Cã tay cã ch©n ch¼ng lÏ kh«ng biÕt tù kiÕm sèng sao!/zaimin_zdd","Ng­êi cïng c¶nh ngé chí nªn chª c­êi/zaimin_zbd")
	end
end;

function jjc_question()
    local nStep = GetTask(TASK_JJC);
    if nStep == 4 then
        task_jjc_fq(3);
    end;
end;

function em_question()
    
    local nTaskValue = FN_GetTaskState(FN_EM);

	if (nTaskValue==2) then
	
		if (GetTask(EM_MANTALK_03)==0) then
			task_007();
			return
		else
			Say("§a t¹ §¹i hiÖp!",0);
			return
		end;
		
	end
end;

function  zaimin1000_yes()
	Talk(1,"","Bå T¸t chuyÓn thÕ! §Õn cøu chóng ta råi!")
	Pay(1000)
	TaskTip("B¹n bè thİ cho N¹n d©n 1000 tiÒn ®ång!")
end;

function  zaimin500_yes()
	Talk(1,"","Trêi! Kh«ng ph¶i ta ®ang n»m m¬ chø?")
	Pay(500)
	TaskTip("B¹n bè thİ cho N¹n d©n 500 tiÒn ®ång!")
end;

function  zaimin100_yes()
	Talk(1,"","Oa! §óng lµ ra ®­êng gÆp quı nh©n!")
	Pay(100)
	TaskTip("B¹n ®· ®­a N¹n d©n 100 tiÒn ®ång!")
end;

function  zaimin10_yes()
	Talk(1,"","Xin h·y gióp ®ì kÎ khèn khã nµy!")
	Pay(10)
	TaskTip("B¹n bè thİ cho N¹n d©n 10 tiÒn ®ång")
end;

function  zaimin_no()
	Talk(1,"","Lµm ¬n bè thİ cho tiÓu nh©n vµi ®ång b¹c lÎ.")
end;
function  zaimin_zdd()
	Talk(1,"","¡n xin thËt ra còng kh«ng tÖ l¾m!")
end;

function  zaimin_zbd()
	Talk(1,"","Yªn t©m! Sau nµy ta ph¸t tµi mçi ngµy sÏ ®­a ng­¬i 10 l­îng b¹c.")
end;
