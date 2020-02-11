--08ĞÂÄêĞÂÄê»î¶¯Ê¹Õß½Å±¾
--by vivi
--2007/11/14

Include("\\script\\online\\newyear08\\newyear08_head.lua");

function main()
	if get_spring_festival_state() == 1 then
		local strtab = {
			"N¨m míi chóc tÕt/wind_action",
			"Thu thËp ®å cæ/guwan_collect",
			"NhËn hång bao n¨m míi/about_hongbao",
			"NhËn h­íng dÉn ho¹t ®éng/get_action_manual",
			"Ta chØ ®Õn xem thö/nothing"
			};
		Say("HÖ thèng ®· chuÈn bŞ nhiÒu lÔ héi mïa xu©n, tham gia thö xem.",
			getn(strtab),
			strtab);
	else
		Talk(1,"","N¨m míi, chóc mäi ng­êi V¹n Sù Nh­ ı.");
	end
end

function wind_action()
	local strtab = {
		"Ta muèn chóc tÕt mäi ng­êi/battle_is_finish"
		};
	if GetTask(TASK_WIND_ID) ~= 0 then
		tinsert(strtab,"Ta ®· chóc tÕt tÊt c¶ mäi ng­êi./finish_wind_task");
		tinsert(strtab,"PhiÒn phøc qu¸. Ta kh«ng muèn chóc tÕt/giveup_wind_task");
	end	
	tinsert(strtab,"ThuyÕt minh vµ phÇn th­ëng nhiÖm vô/about_wind_task");
	tinsert(strtab,"Ta muèn tham gia häa ®éng ®ã/main");
	Say("Mçi khi n¨m míi ®Õn, cã kh«ng İt ng­êi tronh thµnh sèng ®¬n ®éc, c¸c b¹n ®i chóc tÕt hä sÏ khiÕn hä c¶m nhËn ®­îc niÒm vui tÕt ®Õn. HÖ thèng cã nhiÒu quµ tÆng. Chó ı, tõ 9: 00 hÖ thèng b¾t ®Çu göi lÖnh chóc tÕt nh÷ng ng­êi ®ã, nöa tiÕng göi 1 lÇn ®Õn 23:00 tèi! Ng­êi ®Õn nhanh sÏ cã phÇn th­ëng ®Æc biÖt. \n Chó ı: phÇn th­ëng gåm cã <color=yellow>phÇn th­ëng qu©n c«ng<color>, ng­êi hoµn thµnh nhiÖm vô nµy sÏ <color=yellow>kh«ng thÓ nhËn phÇn th­ëng chiÕn tr­êng<color>.",
		getn(strtab),
		strtab);
end

function battle_is_finish()
	local nWindDate = tonumber(date("%y%m%d"));
	local nState = getwindstate();
	local nLv = GetLevel();
	if nState ~= 1 then
		Talk(1,"","Ch­a hÕt thêi gian, ®õng n«n nãng!");
		return
	end
	if nLv <= 10 then
		Talk(1,"","B¹n cßn ph¶i häc hái nhiÒu trªn giang hå.");
		return
	end	
	if nWindDate > GetTask(761) then
		SetTask(760,0);
	end;
	if GetTask(760) > 0 then
		Talk(1,"","H«m nay b¹n ®· nhËn phÇn th­ëng chiÕn tr­êng, kh«ng thÓ nhËn thªm nhiÖm vô chóc tÕt cña ngµy h«m nay.");
		return	
	else
		get_wind_task();
	end
end

function get_wind_task()
	local nMapId = GetWorldPos();	
	local nState,nWindStep = getwindstate();
	local nActionStep = GetMapTaskTemp(nMapId,MAP_WIND_TIME);
	local nWindDate = tonumber(date("%Y%m%d"));
	if GetTask(TASK_WIND_DATE) >= nWindDate then
		Talk(1,"","H«m nay b¹n ®· gióp mäi ng­êi chóc tÕt.");
		return
	end		 
	if nState ~= 1 or nWindStep > nActionStep then
		Talk(1,"","Ch­a hÕt thêi gian, ®õng n«n nãng!");
		return
	end
	if GetTask(TASK_WIND_ID) ~= 0 and GetTask(TASK_WIND_ID) < nActionStep then
		RemoveTrigger(GetTrigger(WIND_TRIGGER_ID)); --É¾³ı´¥·¢Æ÷
		SetTask(TASK_WIND_ID,0);
		SetTask(TASK_WIND_POS,0);
		SetTask(TASK_WIND_STEP,0);
		SetTask(TASK_WIND_TABLE_IDX,0);
		SetTask(TASK_WIND_RAND,0);
		Talk(1,"wind_action","B¹n ch­a hoµn thµnh nhiÖm vô, cã thÓ tiÕp nhËn l¹i nhiÖm vô chóc tÕt.");		
		return
	end	
	if GetTask(TASK_WIND_ID) > 0 then
		Talk(1,"","Ng­¬i cã ph¶i ®· nhËn nhiÖm vô chóc tÕt?");
		return
	end
	
	local nRand = random(1,getn(tWindNpc[nMapId][2]));
	if CreateTrigger(4,tWindNpc[nMapId][3][nRand],WIND_TRIGGER_ID) == 0 then
		WriteLog("[Ho¹t ®éng n¨m míi 08, kÕt nèi npc bŞ lçi]: Ng­êi ch¬i"..GetName().."ThiÕt lËp kÕt nèi npc CreateTrigge (4,tWindNpc[nMapId][3][nRand],WIND_TRIGGER_ID) ®· thÊt b¹i, trŞ WIND_TRIGGER_ID:"..WIND_TRIGGER_ID..". TrŞ tWindNpc[nMapId][3][nRand]:"..tWindNpc[nMapId][3][nRand]);
		return 0;	--´´½¨Ê§°Ü
	end;	
	SetTask(TASK_WIND_ID,nActionStep);
	SetTask(TASK_WIND_POS,nMapId);
	SetTask(TASK_WIND_STEP,1);
	SetTask(TASK_WIND_TABLE_IDX,nRand); 
	Talk(1,"","Tèt, ®©y lµ b­íc thø nhÊt, <color=yellow>"..tWindNpc[nMapId][1].."-"..tWindNpc[nMapId][2][nRand].."<color> n¨m nay ®ãn tÕt mét m×nh trong thµnh, ng­¬i ®i chóc tÕt huynh Êy ®i. TiÖn thÓ hái huynh Êy xem cßn ai ®ãn tÕt mét m×nh kh«ng, chóng ta cïng ®i chóc tÕt!")
	Msg2Player("B¹n ®· nhËn 1 nhiÖm vô chóc tÕt, chóc "..tWindNpc[nMapId][1].."-"..tWindNpc[nMapId][2][nRand].."Chóc tÕt.");
end

function finish_wind_task()
	local nStep = GetTask(TASK_WIND_STEP);
	local nMapId = GetWorldPos();
	local nIdx = GetTask(TASK_WIND_TABLE_IDX);
	local nLv = GetLevel();
	local nExp = floor(6000000*nLv^2/80^2);
	local nState = getwindstate();
	local nActionStep = GetMapTaskTemp(nMapId,MAP_WIND_TIME);
	local nTianshiNum = 15; --ÌìÊ±×¢½âÊıÁ¿£¬99¼¶Íæ¼Ò
	local nWindDate = tonumber(date("%Y%m%d"));
		
	if GetTask(TASK_WIND_POS) ~= nMapId then
		Talk(1,"","Ng­¬i kh«ng nhËn nhiÖm vô chóc tÕt t¹i ®©y. ");
		return
	end
	if GetTask(TASK_WIND_ID) ~= 0 and GetTask(TASK_WIND_ID) < nActionStep then
		RemoveTrigger(GetTrigger(WIND_TRIGGER_ID)); --É¾³ı´¥·¢Æ÷
		SetTask(TASK_WIND_ID,0);
		SetTask(TASK_WIND_POS,0);
		SetTask(TASK_WIND_STEP,0);
		SetTask(TASK_WIND_TABLE_IDX,0);
		SetTask(TASK_WIND_RAND,0);
		Talk(1,"wind_action","B¹n ch­a hoµn thµnh nhiÖm vô, cã thÓ tiÕp nhËn l¹i nhiÖm vô chóc tÕt.");		
		return
	end
	if nStep <= WIND_STEP_TOTAL then
		Talk(1,"","Ng­¬i kh«ng ph¶i ®Õn chóc tÕt <color=yellow>"..tWindNpc[nMapId][1].."-"..tWindNpc[nMapId][2][nIdx].."<color> sao? Cí chi l¹i quay vÒ?");
	else
		if GetTask(760) > 0 then 
			SetTask(TASK_WIND_ID,0);
			SetTask(WIND_STEP_TOTAL,0);
			SetTask(TASK_WIND_POS,0);
			SetTask(TASK_WIND_TABLE_IDX,0);
			SetTask(TASK_WIND_RAND,0);
			SetTask(TASK_WIND_NUM,GetTask(TASK_WIND_NUM)+1);
			SetTask(TASK_WIND_FINISH,nActionStep);
			SetTask(TASK_WIND_DATE,nWindDate);			
			Talk(1,"","RÊt tèt, ng­¬i ®· chóc tÕt tÊt c¶ mäi ng­êi vµ nhËn phÇn th­ëng chiÕn tr­êng nªn h«m nay kh«ng ®­îc l·nh th­ëng, ngµy mai h·y lµm tiÕp nhĞ!");
			return
		end   
    if GetTask(TASK_WIND_RAND) == 0 then
    	SetMapTaskTemp(nMapId,MAP_WIND_RAND,GetMapTaskTemp(nMapId,MAP_WIND_RAND)+1);
    	SetTask(TASK_WIND_RAND,GetMapTaskTemp(nMapId,MAP_WIND_RAND));    	
    end
    local nNum = GetTask(TASK_WIND_RAND);
    if nNum == 1 then	
    	nExp = nExp*2;
    	nTianshiNum = nTianshiNum*2;
			Msg2SubWorld(GetName().."Ng­êi ®Çu tiªn ®Õn chóc tÕt ng­êi c« ®¬n sÏ nhËn ®­îc phÇn th­ëng gÊp ®«i (kh«ng bao gåm qu©n c«ng). ");    	
    elseif nNum >= 2 and nNum <= 5 then
    	nExp = floor(nExp*1.6);
    	nTianshiNum = nTianshiNum*1.5;
			Msg2SubWorld(GetName().."Ng­¬i lµ ng­êi thø "..nNum.." chóc tÕt ng­êi c« ®¬n, ®­îc nhËn phÇn th­ëng gÊp 1.6 lÇn (kh«ng bao gåm qu©n c«ng). ");    
    elseif nNum >=6 and nNum <= 10 then
    	nExp = floor(nExp*1.2);
    	nTianshiNum = nTianshiNum*1.2
    end
    if nLv == 99 then
	    Say("Ng­¬i ®· chóc tÕt xong, ng­¬i lµ ng­êi thø <color=yellow>"..nNum.."<color> hoµn thµnh nhiÖm vô nµy. Ta sÏ th­ëng cho ng­¬i <color=yellow>"..nTianshiNum.."<color> quyÓn Thiªn Thêi Chó Gi¶i vµ <color=yellow>600 qu©n c«ng<color>. ng­¬i cã thÓ dïng <color=yellow>qu©n c«ng ch­¬ng<color> ®Ó t¨ng nhËn qu©n c«ng. Ng­¬i h·y s½n sµng nhËn th­ëng. Ng­¬i còng cã thÓ hñy nhiÖm vô lÇn nµy vµ thùc hiÖn nhiÖm vô nµy sau. ",
	    	2,
	    	"Ta ®· s½n sµng nhËn th­ëng /is_use_jungong",
	    	"Ta ch­a s½n sµng nhËn th­ëng /nothing");    
    else
	    Say("Ng­¬i ®· chóc tÕt xong, ng­¬i lµ ng­êi thø <color=yellow>"..nNum.."<color> hoµn thµnh nhiÖm vô nµy. Ta sÏ th­ëng cho ng­¬i <color=yellow>"..nExp.."<color> ®iÓm kinh nghiÖm vµ <color=yellow>600 qu©n c«ng<color>. ng­¬i cã thÓ dïng <color=yellow>qu©n c«ng ch­¬ng<color> ®Ó t¨ng nhËn qu©n c«ng. Ng­¬i h·y s½n sµng nhËn th­ëng. Ng­¬i còng cã thÓ hñy nhiÖm vô lÇn nµy vµ thùc hiÖn l¹i sau.",
	    	2,
	    	"Ta ®· s½n sµng nhËn th­ëng /is_use_jungong",
	    	"Ta ch­a s½n sµng nhËn th­ëng /nothing");
	  end
  end
end

function is_use_jungong()
	Say("Cã dïng qu©n c«ng ch­¬ng ®Ó t¨ng th­ëng qu©n c«ng kh«ng?",
		5,
		"Ta kh«ng dïng qu©n c«ng ch­¬ng (600 qu©n c«ng)/#confirm_get_final(0)",
		"Ta dïng 2 qu©n c«ng ch­¬ng (1600 qu©n c«ng)/#confirm_get_final(1)",
		"Ta dïng 2 ®¹i qu©n c«ng ch­¬ng (4000 qu©n c«ng)/#confirm_get_final(2)",
		"Ta dïng 2 huy hoµng qu©n c«ng ch­¬ng (8000 qu©n c«ng)/#confirm_get_final(3)",
		"T¹m thêi kh«ng l·nh/nothing");
end    
    
function confirm_get_final(nType)
	local nJungong = GetTask(701); --Íæ¼Òµ±Ç°¾ü¹¦£¬ÕıÎªËÎ£¬¸ºÎªÁÉ
	local nGetJungong = 600; --»ñµÃµÄ¾ü¹¦
	local nStep = GetTask(TASK_WIND_STEP);
	local nMapId = GetWorldPos();
	local nIdx = GetTask(TASK_WIND_TABLE_IDX);
	local nLv = GetLevel();
	local nExp = floor(6000000*nLv^2/80^2);
	local nNum = GetTask(TASK_WIND_RAND);
	local nState = getwindstate();  
	local nActionStep = GetMapTaskTemp(nMapId,MAP_WIND_TIME);
	local nWindDate = tonumber(date("%Y%m%d"));
	local nTianshiNum = 15; --ÌìÊ±×¢½âÊıÁ¿£¬99¼¶Íæ¼Ò
	
	if GetTask(TASK_WIND_POS) ~= nMapId then
		Talk(1,"","Ng­¬i kh«ng nhËn nhiÖm vô chóc tÕt t¹i ®©y. ");
		return
	end
	if GetTask(TASK_WIND_ID) ~= 0 and GetTask(TASK_WIND_ID) < nActionStep then
		SetTask(TASK_WIND_ID,0);
		SetTask(TASK_WIND_POS,0);
		SetTask(TASK_WIND_STEP,0);
		SetTask(TASK_WIND_TABLE_IDX,0);
		SetTask(TASK_WIND_RAND,0);
		Talk(1,"wind_action","Ng­¬i kh«ng ®Õn nhËn th­ëng trong thêi gian quy ®Şnh nªn bŞ hñy phÇn th­ëng, ng­¬i cã thÓ nhËn nhiÖm vô chóc tÕt kh¸c.");		
		return
	end
	
	if nLv == 99 then
		if Zgc_pub_goods_add_chk(1,15) ~= 1 then
			return
		end
	end
	
	if nType == 1 then
		if GetItemCount(2,1,9999) < 2 then
			Talk(1,"","Ng­¬i kh«ng ®ñ qu©n c«ng ch­¬ng. ");
			return
		else
			if DelItem(2,1,9999,2) == 1 then
				if nJungong >= 0 then
					nGetJungong = 800*2;
				else
					nGetJungong = -800*2;
				end
			end
		end
	elseif nType == 2 then
		if GetItemCount(2,1,9998) < 2 then
			Talk(1,"","Ng­¬i kh«ng ®ñ ®¹i qu©n c«ng ch­¬ng. ");
			return
		else
			if DelItem(2,1,9998,2) == 1 then
				if nJungong >= 0 then
					nGetJungong = 800*5;
				else
					nGetJungong = -800*5;
				end
			end
		end
	elseif nType == 3 then
		if GetItemCount(2,1,9977) < 2 then
			Talk(1,"","Ng­¬i kh«ng ®ñ huy hoµng qu©n c«ng ch­¬ng. ");
			return
		else
			if DelItem(2,1,9977,2) == 1 then
				if nJungong >= 0 then
					nGetJungong = 800*10;
				else
					nGetJungong = -800*10;
				end
			end
		end
	else
		if nJungong >= 0 then
			nGetJungong = 600;
		else
			nGetJungong = -600;
		end		
	end	
 
  if nNum == 1 then	
  	nExp = nExp*2;
  	nTianshiNum = nTianshiNum*2;
  elseif nNum >= 2 and nNum <= 5 then
  	nExp = floor(nExp*1.6);
  	nTianshiNum = nTianshiNum*1.6;
  elseif nNum >=6 and nNum <= 10 then
  	nExp = floor(nExp*1.2);
  	nTianshiNum = nTianshiNum*1.2;
  end	

	SetTask(TASK_WIND_ID,0);
	SetTask(WIND_STEP_TOTAL,0);
	SetTask(TASK_WIND_POS,0);
	SetTask(TASK_WIND_TABLE_IDX,0);
	SetTask(TASK_WIND_RAND,0);
	SetTask(TASK_WIND_NUM,GetTask(TASK_WIND_NUM)+1);
	SetTask(TASK_WIND_FINISH,nActionStep);
	SetTask(TASK_WIND_DATE,nWindDate);
--  	SetMapTaskTemp(nMapId,MAP_WIND_RAND,GetMapTaskTemp(nMapId,MAP_WIND_RAND)+1);

	SetTask(701,nJungong+nGetJungong);
	if nJungong >= 0 then
		Msg2Player("Chóc mõng b¹n nhËn ®­îc "..nGetJungong.."C«ng tr¹ng");
	else
		Msg2Player("Chóc mõng b¹n nhËn ®­îc "..-nGetJungong.."C«ng tr¹ng");
	end
	
	if nLv == 99 then
		AddItem(2,1,3210,nTianshiNum);
		Msg2Player("Chóc mõng b¹n nhËn ®­îc "..nTianshiNum.."Thiªn Thêi Chó Gi¶i.");
	else
		ModifyExp(nExp);
		Msg2Player("Chóc mõng b¹n nhËn ®­îc "..nExp.."Kinh nghiÖm");
	end
	
	if nNum == 1 then		
		Talk(1,"","Ng­¬i lµ ng­êi ®Çu tiªn chóc tÕt tÊt c¶ mäi ng­êi, thËt ®¸ng khen, cè g¾ng ph¸t huy nhĞ. ");
	elseif nNum >= 2 and nNum <=5 then		
		Talk(1,"","Tèt, ng­¬i lµ ng­êi thø "..nNum.." chóc tÕt tÊt c¶ mäi ng­êi, thËt ®¸ng khen, cè g¾ng ph¸t huy nhĞ. "); 
	elseif nNum >=6 and nNum <= 10 then
		Talk(1,"","Tèt, ng­¬i lµ ng­êi thø "..nNum.." chóc tÕt tÊt c¶ mäi ng­êi, thËt ®¸ng khen, cè g¾ng ph¸t huy nhĞ. "); 	
	else
		Talk(1,"","Giái, ng­¬i ®· chóc tÕt tÊt c¶ mäi ng­êi, phÇn th­ëng cña ng­¬i ®©y. ");
	end	 			
end   

function giveup_wind_task()
	Talk(1,"","NÕu kh«ng muèn tiÕp tôc chóc tÕt còng kh«ng nªn bá cuéc gi÷a chõng, nhiÖm vô chóc tÕt sÏ tù hñy nÕu cã nhiÖm vô kh¸c. ");
end

--function confirm_giveup_wind()
--	RemoveTrigger(GetTrigger(WIND_TRIGGER_ID)); --É¾³ı´¥·¢Æ÷
--	local nActionStep = GetMapTaskTemp(nMapId,MAP_WIND_TIME);
--	local nWindDate = tonumber(date("%Y%m%d"));
--	SetTask(TASK_WIND_ID,0);
--	SetTask(WIND_STEP_TOTAL,0);
--	SetTask(TASK_WIND_POS,0);
--	SetTask(TASK_WIND_TABLE_IDX,0);
--	SetTask(TASK_WIND_FINISH,nActionStep);
--	SetTask(TASK_WIND_DATE,nWindDate);
--	SetTask(TASK_WIND_RAND,0);
--	Talk(1,"","<color=green>ĞÂÄê»î¶¯Ê¹Õß<color>£ºÄã·ÅÆúÁË±¾´ÎµÄ·çÃ½ÈÎÎñ£¬Ï£ÍûÒÔºóÄÜÔÙ½ÓÔÙÀ÷¡£");	
--end

function about_wind_task()
	local strtab = {
		"H­íng dÉn ho¹t ®éng/about_wind_action",
		"ThuyÕt minh phÇn th­ëng/about_wind_award",
		"ChØ xem thö!/nothing"
		};
	Say("Ng­¬i muèn biÕt vÒ vÊn ®Ò g×?",
		getn(strtab),
		strtab);
end

function about_wind_action()
	Talk(1,"about_wind_action2","Sø gi¶ n¨m míi: 9:00 s¸ng h»ng ngµy ta sÏ c«ng bè nhiÖm vô chóc tÕt, ng­êi ch¬i cÊp 10 cã thÓ ®Õn chç ta l·nh th­ëng. Ta sÏ chØ ®Şnh ng­êi ph¶i ®Õn chóc tÕt, ng­êi ®ã sÏ chØ dÉn ng­¬i ®Õn chóc tÕt ng­êi tiÕp theo, khi chóc tÕt xong tÊt c¶ mäi ng­êi, h·y quay vÒ chç nµy x¸c nhËn vµ l·nh th­ëng. ");
end	

function about_wind_action2()
	Talk(1,"about_wind_task","PhÇn th­ëng: \n Sau khi chóc tÕt tÊt c¶ mäi ng­êi, h·y ®Õn ®©y l·nh th­ëng. Chó ı: ng­êi ®Çu tiªn hoµn thµnh nhiÖm vô sÏ ®­îc th­ëng gÊp ®«i, tõ ng­êi thø 2 ®Õn thø 5 sÏ d­îc th­ëng gÊp 1.6, tõ ng­êi thø 6 ®Õn ng­êi thø 10 ®­îc th­ëng gÊp 1.2. \n NÕu kh«ng hµi lßng víi xÕp h¹ng chóc tÕt lÇn nµy, cã thÓ kh«ng giao nép nhiÖm vô vµ tham gia l¹i vµo lÇn sau, nh­ng khi ®· nhËn th­ëng th× h«m ®ã kh«ng ®­îc tham gia n÷a. \ NÕu kh«ng muèn tiÕp tôc chóc tÕt n÷a, còng kh«ng nªn bá cuéc gi÷a chõng, nhiÖm vô chóc tÕt sÏ tù hñy nÕu cã nhiÖm vô kh¸c.");
end

function about_wind_award()
	Talk(1,"about_wind_task","PhÇn th­ëng chóc tÕt rÊt phong phó, ta sÏ th­ëng kinh nghiÖm c¬ b¶n vµ qu©n c«ng.\n §iÒu cÇn chó ı lµ sau khi nhËn th­ëng th× <color=yellow>kh«ng thÓ nhËn phÇn th­ëng chiÕn tr­êng trong ngµy ®ã n÷a<color>. \nTÊt c¶ phÇn th­ëng ®Òu c¨n cø vµo ®¼ng cÊp cña ng­¬i. \nNÕu kh«ng cã thêi gian chóc tÕt cã thÓ ®i mua thiÖp chóc tÕt, vµ cã thÓ nhËn ngay phÇn th­ëng, tuy nhiªn phÇn th­ëng kh«ng nhiÒu, nhiÖm vô chóc tÕt h«m nay cã thÓ dïng 1 thiÖp chóc tÕt ®Ó hoµn thµnh. Ng­¬i cã mÊy ngµy ch­a hoµn thµnh nhiÖm vô th× sö dông bÊy nhiªu thiÖp chóc tÕt. ");
end

function who_is_hero()
	local strtab = {
		"NhËn b÷a ¨n tÊt niªn/get_hero_drink",
		"H­íng dÉn ho¹t ®éng vµ phÇn th­ëng/about_hero_drink",
		"ChØ xem thö!/nothing"
		}
	Say("Ta ®· ®Æt tiÖc chiªu ®·i ch­ vŞ anh hïng h¶o h¸n t¹i §Ö NhÊt LÇu vµo ®ªm giao thõa, mêi ch­ vŞ ®Õn tham gia.",
		getn(strtab),
		strtab)	
end

function get_hero_drink()
	local nDate = tonumber(date("%Y%m%d"));
	if GetTask(TASK_GET_DRINK) >= nDate then
		Talk(1,"","Ta chØ chuÈn bŞ cho mçi vŞ mét phÇn, kh«ng thÓ nhËn thªm.");
		return
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	local Add_flag = AddItem(0,0,1,1); --ÄêÒ¹·¹¶©µ¥
	if Add_flag == 1 then
		SetTask(TASK_GET_DRINK,nDate);
		Talk(1,"","§©y lµ ®¬n ®Æt tiÖc cña ng­¬i, h·y ®i cïng víi nhãm b¹n vµ sö dông ®¬n ®Æt tiÖc nµy.");
	end
end

function about_hero_drink()
	Talk(1,"who_is_hero","T¹o thµnh tæ ®éi víi b»ng h÷u råi sö dông ®¬n ®Æt tiÖc, tõ mÆt ®Êt sÏ xuÊt hiÖn bµn tiÖc do §Ö NhÊt LÇu mang ®Õn, c¸c vŞ trong buæi tiÖc sÏ nhËn ®­îc phÇn th­ëng. \nNg­êi trong tæ ®éi cµng sö dông nhiÒu ®¬n ®Æt tiÖc th× cµng nhËn ®­îc nhiÒu quµ, nhiÒu nhÊt lµ sö dông cïng lóc <color=yellow>8 ®¬n ®Æt tiÖc<color>, sÏ nhËn ®­îc b÷a tiÖc thŞnh so¹n. \nNéi dung phÇn th­ëng: \nSau mét kho¶ng thêi gian ngåi t¹i bµn tiÖc sÏ nhËn ®­îc kinh nghiÖm, c¸ch 5 phót sÏ dän lªn mãn sñi c¶o 1 lÇn. \n¡n sñi c¶o sÏ nhËn ®­îc kinh nghiÖm. \n1 B÷a tiÖc cã thÓ kĞo dµi 12 phót. ");
end

--¹ÅÍæ´óÊÕ¼¯
function guwan_collect()
	local strtab = {
				"Dïng nh÷ng m¶nh vì ghĞp l¹i thµnh ®å cæ/suipian_cube_guwan",
				"Ta muèn dïng ®å cæ ®æi phÇn th­ëng víi ng­¬i/guwan_change_award",
				"H­íng dÉn quy t¾c thu gom ®å cæ/about_guwan_collect",
				"ChØ xem thö!/nothing"
				};
	Say("Ta muèn tÆng 1 mãn ®å cæ cho b»ng h÷u ta, nh­ng vÉn ch­a t×m ®­îc mãn ®å ­ng ı, nÕu ng­¬i cã, ta sÏ träng träng cã th­ëng. §å cæ kh«ng nh­ nh÷ng ®å vËt kh¸c, tuy chØ vµi m¶nh vôn nh­ng vÉn cã gi¸ trŞ rÊt cao, ng­¬i cã thÓ ®­a cho ta thµnh phÈm hoÆc b¸n thµnh phÈm còng ®­îc.",
		getn(strtab),
		strtab); 
end

function suipian_cube_guwan()
	local strtab = {
				"Ta ph¶i dïng m¶nh ®ång cÊp 2 ®Ó hîp thµnh m¶nh ®ång cÊp 1/cube_input_num",
				"Ta ph¶i dïng m¶nh ®ång cÊp 1 vµ phô kiÖn Thanh §ång ®Ønh cÊp 4 hîp thµnh Thanh §ång ®Ønh cÊp 4/#ask_is_cube(2)",
				"Ta ph¶i dïng Thanh §ång ®Ønh cÊp 4 vµ phô kiÖn Thanh §ång ®Ønh cÊp 3 hîp thµnh Thanh §ång ®Ønh cÊp 3/#ask_is_cube(3)",
				"Ta ph¶i dïng Thanh §ång ®Ønh cÊp 3 vµ phô kiÖn Thanh §ång ®Ønh cÊp 2 hîp thµnh Thanh §ång ®Ønh cÊp 2./#ask_is_cube(4)",
				"Ta ph¶i dïng Thanh §ång ®Ønh cÊp 2 vµ phô kiÖn Thanh §ång ®Ønh cÊp 1 hîp thµnh Thanh §ång ®Ønh cÊp 1/#ask_is_cube(5)",
				"Chän sai råi, trë l¹i/guwan_collect",
				"Ta sÏ quay l¹i lµm sau/nothing"
				};
	Say("Kh«ng biÕt ng­¬i ®Şnh dïng m¶nh nµo thÓ hîp thµnh!",
		getn(strtab),
		strtab);	
end

function cube_input_num()
	local nNum = floor(GetItemCount(2,1,3212)/5);
	if nNum < 1 then
		Talk(1,"","<color=yellow>5<color> m¶nh ®ång hîp thµnh <color=yellow>1<color>m¶nh ®ång cÊp 1, ng­¬i kh«ng ®ñ m¶nh ®ång cÊp 2. ");
		return
	else
		AskClientForNumber("confirm_cube_erjitongqi",1,tonumber(nNum)," Ng­¬i muèn ®æi m¶nh ®ång cÊp 1 víi gi¸ bao nhiªu?")
	end
end

function confirm_cube_erjitongqi(nNum)
	local nDelNum = nNum*5;
	if GetItemCount(2,1,3212) < nDelNum then
		Talk(1,"","Ng­¬i kh«ng cã ®ñ m¶nh ®ång cÊp 2. ");
		return
	end
	if Zgc_pub_goods_add_chk(1,nNum) ~= 1 then
		return
	end
	if DelItem(2,1,3212,nDelNum) == 1 then
		AddItem(2,1,3211,nNum);
		Msg2Player("Chóc mõng b¹n ®· ®æi m¶nh ®ång cÊp 2 thµnh c«ng!");
		Talk(1,"","Chóc mõng ng­¬i ®· ®æi m¶nh ®ång cÊp 2 thµnh c«ng. ");	
	end	
end

function ask_is_cube(nType)
	if nType == 1 then
		return
	else
		local strtab = {
			"Ta muèn ®æi 1 "..tTingTong[nType][11].."/#confirm_cube(1,"..nType..")",
			"Ta muèn ®æi 10 "..tTingTong[nType][11].."/#confirm_cube(10,"..nType..")"			
			};
		if nType ~= 5 then
			tinsert(strtab,"Ta muèn ®æi 50 "..tTingTong[nType][11].."/#confirm_cube(50,"..nType..")");
			tinsert(strtab,"Ta muèn ®æi 500 "..tTingTong[nType][11].."/#confirm_cube(500,"..nType..")");
		end
		tinsert(strtab,"Chän sai råi, trë l¹i/suipian_cube_guwan");
		tinsert(strtab,"Ta sÏ quay l¹i lµm sau/nothing");
		Say("§æi quy t¾c thµnh <color=yellow>"..tTingTong[nType][2].."c¸i"..tTingTong[nType][1].." vµ"..tTingTong[nType][7].."c¸i"..tTingTong[nType][6].."<color> hîp thµnh <color=yellow>"..tTingTong[nType][12].."c¸i"..tTingTong[nType][11].."<color>. Mçi lÇn ®æi ng­¬i cã <color=yellow>"..tTingTong[nType][16].."%<color> x¸c suÊt thµnh c«ng, nÕu thÊt b¹i, ng­¬i sÏ mÊt tÊt c¶ ®å vËt. Ng­¬i muèn ®æi bao nhiªu?",
				getn(strtab),
				strtab);
	end
end

function confirm_cube(nNum,nType)
	local nRequestNumOne = tTingTong[nType][2]*nNum;
	local nRequestNumTwo = tTingTong[nType][7]*nNum;
	local nNeedNum = tTingTong[nType][12]*nNum;
	if GetItemCount(tTingTong[nType][3],tTingTong[nType][4],tTingTong[nType][5]) < nRequestNumOne then
		Talk(1,"","Hµnh trang cña ng­¬i ch­a ®ñ "..tTingTong[nType][1]..". ");
		return
	end
	if nType ~= 1 then
		if GetItemCount(tTingTong[nType][8],tTingTong[nType][9],tTingTong[nType][10]) < nRequestNumTwo then
			Talk(1,"","Hµnh trang cña ng­¬i ch­a ®ñ "..tTingTong[nType][6]..". ");
			return
		end
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	if nType == 1 then
		return
	else
		if DelItem(tTingTong[nType][3],tTingTong[nType][4],tTingTong[nType][5],nRequestNumOne) == 1 and DelItem(tTingTong[nType][8],tTingTong[nType][9],tTingTong[nType][10],nRequestNumTwo) == 1 then
			local nSuccNum = 0; --³É¹¦¶Ò»»´ÎÊı
			for i = 1,nNeedNum do 
				local nRand = random(1,100);
				if nRand <= tTingTong[nType][16] then
					local add_flag = AddItem(tTingTong[nType][13],tTingTong[nType][14],tTingTong[nType][15],tTingTong[nType][12]);			
					if add_flag == 1 then
						nSuccNum = nSuccNum+1;
						if nType == 4 or nType == 5 then
							WriteLog("Ho¹t ®éng mïa xu©n ®æi Thanh §ång ®Ønh: "..GetName().."§æi"..tTingTong[nType][11].."Thµnh c«ng.");
						end
					else
						WriteLog("Ho¹t ®éng mïa xu©n ®æi Thanh §ång ®Ønh: "..GetName().."§æi"..tTingTong[nType][11].." thÊt b¹i, vŞ trİ thÊt b¹i:"..add_flag);
					end
				end
			end
			if nSuccNum ~= 0 then
				if nNeedNum ~= 1 then
					Msg2Player("Chóc mõng b¹n ®· ®æi "..tTingTong[nType][11].." thµnh c«ng!");
					Talk(1,"","Chóc mõng ng­¬i nhËn ®­îc <color=yellow>"..(tTingTong[nType][12]*nSuccNum).."c¸i"..tTingTong[nType][11].."<color>. Ng­¬i ®æi "..tTingTong[nType][11].." thµnh c«ng <color=yellow>"..nSuccNum.."<color> lÇn, thÊt b¹i "..(nNeedNum-nSuccNum).." lÇn.");	
				else
					Msg2Player("Chóc mõng b¹n ®· ®æi "..tTingTong[nType][11].." thµnh c«ng!");
					Talk(1,"","Chóc mõng ng­¬i ®· ®æi "..tTingTong[nType][11].."Thµnh c«ng.");					
				end
			else
				Talk(1,"","Kh«ng thµnh c«ng, thö l¹i nhĞ!");
			end			
		else
			Talk(1,"","Trogn hµnh trang cña ng­¬i kh«ng ®ñ vËt liÖu hîp thµnh.");
		end
	end
end

function guwan_change_award()
	local strtab = {		
			"Ta cã thÓ ®æi phÇn th­ëng nµo/about_guwan_award",
			"Ta ph¶i dïng m¶nh ®ång cÊp 1 ®æi phÇn th­ëng/#ask_is_change(1)",
			"Ta ph¶i dïng Thanh §ång ®Ønh cÊp 4 ®æi phÇn th­ëng/#ask_is_change(2)",
			"Ta ph¶i dïng Thanh §ång ®Ønh cÊp 3 ®æi phÇn th­ëng/#ask_is_change(3)",
			"Ta ph¶i dïng Thanh §ång ®Ønh cÊp 2 ®æi phÇn th­ëng/#ask_is_change(4)",
			"Ta ph¶i dïng Thanh §ång ®Ønh cÊp 1 ®æi phÇn th­ëng/#ask_is_change(5)",
			"Ta ph¶i dïng 2000 m¶nh ®ång ®æi phÇn th­ëng/#ask_is_change(6)",
			"T¹m thêi kh«ng ®æi phÇn th­ëng	/nothing"
			};
	Say("Ng­¬i ®Şnh ®æi phÇn th­ëng g×?",
		getn(strtab),
		strtab);
end

function about_guwan_award()
	Talk(1,"guwan_change_award","M¶nh ®ång cÊp 1: cã thÓ ®æi 1 İt kinh nghiÖm, mçi ng­êi cã thÓ nhËn tæng céng 1000 lÇn. \nThanh §ång ®Ønh cÊp 4: ®æi Thiªn Thêi Chó Gi¶i, mçi ng­êi cã thÓ nhËn tæng céng 100 lÇn. \nThanh §ång ®Ønh cÊp 3: ®æi 1 NguyÖt Hoa 1 hoÆc tïy ı 1 quyÓn sinh ho¹t kü n¨ng. \nThanh §ång ®Ønh cÊp 2: ®æi 1 tinh NguyÖt Hoa? (120 linh khİ th­îng h¹n vËt phÈm) hoÆc tïy ı 1 quyÓn sinh ho¹t kü n¨ng phèi ph­¬ng. \nThanh §ång ®Ønh cÊp 1: ®æi trang bŞ Thiªn §Şa HuyÒn Hoµng. \n2000 m¶nh ®ång: ®æi trang bŞ Thiªn §Şa HuyÒn Hoµng. ");
end

function ask_is_change(nType)
	local nLv = GetLevel();
	local nExp = nLv^2;
	if nType == 1 then
		if nLv == 99 then
			Say("Dïng m¶nh ®ång cÊp 1 cã thÓ ®æi <color=yellow>50 ®iÓm<color> Danh väng, ®æi kh«ng? Mçi ng­êi cã thÓ nhËn tæng céng 1000 lÇn. ",
				3,
				"Ta muèn ®æi 1 m¶nh ®ång cÊp 1/#change_yijisuipian(1)",
				"Ta muèn ®æi 50 m¶nh ®ång cÊp 1/#change_yijisuipian(50)",
				"Kh«ng, ta nhÇm!/guwan_change_award");
		else	
			Say("Dïng m¶nh ®ång cÊp 1 cã thÓ ®æi <color=yellow>"..nExp.."<color> kinh nghiÖm, ®æi kh«ng? Mçi ng­êi cã thÓ nhËn tæng céng 1000 lÇn. ",
				3,
				"Ta muèn ®æi 1 m¶nh ®ång cÊp 1/#change_yijisuipian(1)",
				"Ta muèn ®æi 50 m¶nh ®ång cÊp 1/#change_yijisuipian(50)",
				"Kh«ng, ta nhÇm!/guwan_change_award");
		end
	elseif nType == 2 then
		Say("Dïng Thanh §ång ®Ønh cÊp 4 cã thÓ ®æi <color=yellow>1 Thiªn Thêi Chó Gi¶i<color>, ®æi kh«ng? Mçi ng­êi cã thÓ nhËn tæng céng 100 lÇn. ",
			2,
			"õ, ta muèn ®æi./change_sijiding",
			"Kh«ng, ta nhÇm!/guwan_change_award");
	elseif nType == 3 then
		Say("Dïng Thanh §ång ®Ønh cÊp 3 cã thÓ ®æi <color=yellow>1 NguyÖt Hoa hoÆc tïy ı 1 quyÓn sinh ho¹t kü n¨ng th­îng h¹n<color>, ®æi kh«ng? ",
			2,
			"õ, ta muèn ®æi./change_sanjiding",
			"Kh«ng, ta nhÇm!/guwan_change_award");
	elseif nType == 4 then
		Say("Dïng Thanh §ång ®Ønh cÊp 2 cã thÓ ®æi <color=yellow>1 tinh NguyÖt Hoa (120 linh khİ th­îng h¹n vËt phÈm) hoÆc tïy ı 1 quyÓn sinh ho¹t kü n¨ng phèi ph­¬ng<color>, ®æi kh«ng? ",
			2,
			"õ, ta muèn ®æi./#change_erjiding(0)",
			"Kh«ng, ta nhÇm!/guwan_change_award");
	elseif nType == 5 then
		Say("Dïng Thanh §ång ®Ønh cÊp 1 cã thÓ ®æi <color=yellow>trang bŞ Thiªn §Şa HuyÒn Hoµng<color>, ®æi kh«ng? ",
			2,
			"õ, ta muèn ®æi./chang_yijiding",
			"Kh«ng, ta nhÇm!/guwan_change_award");
	elseif nType == 6 then
		Say("Dïng 2000 m¶nh ®ång cã thÓ ®æi <color=yellow>trang bŞ Thiªn §Şa HuyÒn Hoµng<color>, ®æi kh«ng? ",
			2,
			"õ, ta muèn ®æi./chang_tongqisuipian",
			"Kh«ng, ta nhÇm!/guwan_change_award");
	end					
end

function change_yijisuipian(nNum)
	local nLv = GetLevel();
	local nExp = (nLv^2)*nNum;
	local nRep = 50*nNum;
	if GetItemCount(2,1,3211) < nNum then
		Talk(1,"","Ng­¬i kh«ng ®ñ m¶nh ®ång cÊp 1.");
	else
		if GetTask(TASK_TONGQI_AWARD) >= 1000 then
			Talk(1,"","Mçi ng­êi cã thÓ ®æi tæng céng 1000 lÇn, ng­¬i ®· hÕt l­ît ®æi. ");
			return
		end
		if GetTask(TASK_TONGQI_AWARD)+nNum > 1000 then
			Talk(1,"","Mçi ng­êi cã thÓ ®æi tæng céng 1000 lÇn, ng­¬i kh«ng thÓ ®æi "..nNum.." n÷a. ");
			return
		end
		if DelItem(2,1,3211,nNum) == 1 then
			if nLv == 99 then
				ModifyReputation(nRep,0);
				SetTask(TASK_TONGQI_AWARD,GetTask(TASK_TONGQI_AWARD)+nNum);
				Talk(1,"guwan_change_award","Chóc mõng ng­¬i ®· ®æi thµnh c«ng m¶nh ®ång cÊp 1, hiÖn ®· ®æi <color=yellow>"..GetTask(TASK_TONGQI_AWARD).."<color> lÇn, mçi ng­êi cã thÓ nhËn tæng céng 1000 lÇn. ");
			else
				ModifyExp(nExp);
				SetTask(TASK_TONGQI_AWARD,GetTask(TASK_TONGQI_AWARD)+nNum);
				Talk(1,"guwan_change_award","Chóc mõng ng­¬i ®· ®æi thµnh c«ng m¶nh ®ång cÊp 1, hiÖn ®· ®æi <color=yellow>"..GetTask(TASK_TONGQI_AWARD).."<color> lÇn, mçi ng­êi cã thÓ nhËn tæng céng 1000 lÇn. ");
			end
		end
	end
end

function change_sijiding()
	if GetItemCount(2,1,3216) < 1 then
		Talk(1,"","Ng­¬i kh«ng ®ñ Thanh §ång ®Ønh cÊp 4. ");
	else
		if Zgc_pub_goods_add_chk(1,1) ~= 1 then
			return
		end
		if GetTask(TASK_QTD_AWARD) >= 100 then
			Talk(1,"","Mçi ng­êi cã thÓ nhËn tæng céng 100 lÇn, ng­¬i ®· hÕt l­ît ®æi.");
			return
		end
		if DelItem(2,1,3216,1) == 1 then
			  AddItem(2,1,3210,1);
				SetTask(TASK_QTD_AWARD,GetTask(TASK_QTD_AWARD)+1);
				Msg2Player("Chóc mõng ng­¬i nhËn ®­îc 1 quyÓn Thiªn Thêi Chó Gi¶i.");
				Talk(1,"guwan_change_award","Chóc mõng ng­¬i ®· ®æi thµnh c«ng Thanh §ång ®Ønh cÊp 4, hiÖn ng­¬i ®· ®æi <color=yellow>"..GetTask(TASK_QTD_AWARD).."<color> lÇn, mçi ng­êi cã thÓ nhËn tæng céng 100 lÇn. ");
		end
	end	
end

function change_sanjiding()
	if GetItemCount(2,1,3215) < 1 then
		Talk(1,"","Ng­¬i kh«ng ®ñ Thanh §ång ®Ønh cÊp 3. ");
	else
		local strtab = {
			" 1 NguyÖt Hoa/#confirm_change_sanjiding(1)",
			"Thiªn ı Phæ (sö dông cÊp 79 may Hé Gi¸p giíi h¹n t¨ng ®Õn cÊp 99)/#confirm_change_sanjiding(2)",
			"Chøc N÷ Kinh (sö dông cÊp 79 may nãn giíi h¹n t¨ng ®Õn cÊp 99)/#confirm_change_sanjiding(3)",
			"Luy Tæ Tµm Kinh (sö dông cÊp 79 may h¹ y giíi h¹n t¨ng ®Õn cÊp 99)/#confirm_change_sanjiding(4)",
			"¢u D· Tóy Chó Kinh (sö dông cÊp 79 chÕ t¹o vò khİ ng¾n giíi h¹n t¨ng ®Õn cÊp 99)/#confirm_change_sanjiding(5)",
			"Can T­íng Chó Kinh (sö dông cÊp 79 chÕ t¹o binh khİ dµi giíi h¹n t¨ng ®Õn cÊp 99)/#confirm_change_sanjiding(6)",
			"Trang kÕ/change_sanjiding2",
			"T¹m thêi kh«ng ®æi. /nothing"					
					}
		Say("Xin mêi chän phÇn th­ëng muèn ®æi. ",
			getn(strtab),
			strtab);
	end	
end

function change_sanjiding2()
	if GetItemCount(2,1,3215) < 1 then
		Talk(1,"","Ng­¬i kh«ng ®ñ Thanh §ång ®Ønh cÊp 3. ");
	else
		local strtab = {
			"M¹c Tµ Chó Kinh (sö dông cÊp 79 chÕ t¹o binh khİ kú m«n giíi h¹n t¨ng ®Õn cÊp 99)/#confirm_change_sanjiding(7)",
			"V¹n Méc §å (sö dông kü n¨ng ®èn gç cÊp 79 giíi h¹n t¨ng ®Õn cÊp 99)/#confirm_change_sanjiding(8)",
			"V¹n Thó Phæ (sö dông cÊp 79 kü n¨ng Thuéc da giíi h¹n t¨ng ®Õn ca61p)/#confirm_change_sanjiding(9)",
			"Ngò Tµng S¬n Kinh (sö dông cÊp 79 kü n¨ng ®µo kho¸ng giíi h¹n t¨ng ®Õn cÊp 99)/#confirm_change_sanjiding(10)",
			"M« MÉu Tµm Kinh (sö dông cÊp 79 kü n¨ng kĞo t¬ giíi h¹n t¨ng ®Õn cÊp 99)/#confirm_change_sanjiding(11)",
			"Trang tr­íc/change_sanjiding",
			"T¹m thêi kh«ng ®æi. /nothing"					
					}
		Say("Xin mêi chän phÇn th­ëng muèn ®æi. ",
			getn(strtab),
			strtab);
	end	
end

function confirm_change_sanjiding(nType)
	if GetItemCount(2,1,3215) < 1 then
		Talk(1,"","Ng­¬i kh«ng ®ñ Thanh §ång ®Ønh cÊp 3. ");
	else
		if Zgc_pub_goods_add_chk(1,1) ~= 1 then
			return
		end
		if DelItem(2,1,3215,1) == 1 then
			AddItem(tSanjiAward[nType][2],tSanjiAward[nType][3],tSanjiAward[nType][4],1);
			Msg2Player("Chóc mõng b¹n nhËn ®­îc "..tSanjiAward[nType][1]);
			Talk(1,"guwan_change_award","Chóc mõng ng­¬i ®æi thµnh c«ng Thanh §ång ®Ønh cÊp 3, nhËn ®­îc "..tSanjiAward[nType][1]..".");
		end
	end		
end

function change_erjiding(nPage)	
	local nPageNum = 7;
	local nRemaidNum = getn(tErjiAward)-nPage*nPageNum;
	local strtab = {};
	local nThisNum = 7;
	if nRemaidNum < nThisNum then
		nThisNum = nRemaidNum;
	end
	for i=1,nThisNum do
		tinsert(strtab,tErjiAward[nPage*nPageNum+i][1].."/#confirm_change_erjiding("..(nPage*nPageNum+i)..")");
	end
	if nPage ~= 0 then
		tinsert(strtab,"Trang tr­íc/#change_erjiding("..(nPage-1)..")");
	end
	if nRemaidNum > nPageNum	then
		tinsert(strtab,"Trang kÕ/#change_erjiding("..(nPage+1)..")");
	end  
	tinsert(strtab,"T¹m thêi kh«ng ®æi. /nothing");
	if GetItemCount(2,1,3214) < 1 then
		Talk(1,"","Ng­¬i kh«ng ®ñ Thanh §ång ®Ønh cÊp 2. ");
	else	
		Say("Xin mêi chän phÇn th­ëng muèn ®æi. ",
			getn(strtab),
			strtab);
	end		
end

function confirm_change_erjiding(nType)
	if GetItemCount(2,1,3214) < 1 then
		Talk(1,"","Ng­¬i kh«ng ®ñ Thanh §ång ®Ønh cÊp 2. ");
	else
		if Zgc_pub_goods_add_chk(1,1) ~= 1 then
			return
		end	
		if DelItem(2,1,3214,1) == 1 then
			AddItem(tErjiAward[nType][2],tErjiAward[nType][3],tErjiAward[nType][4],1);
			Msg2Player("Chóc mõng b¹n nhËn ®­îc "..tErjiAward[nType][1]);
			Talk(1,"guwan_change_award","Chóc mõng ng­¬i ®æi thµnh c«ng Thanh §ång ®Ønh cÊp 2, nhËn ®­îc "..tErjiAward[nType][1]);
		end
	end
end

function chang_yijiding()
	if GetItemCount(2,1,3213) < 1 then
		Talk(1,"","ng­¬i kh«ng ®ñ Thanh §ång ®Ønh cÊp 1. ");	
	else
		Say("Ng­¬i muèn ®æi trang bŞ nµo? ",
			5,
			"Thiªn §Şa HuyÒn Hoµng Kh«i/#choose_tiandi_lingqi(1,0)",
			"Thiªn §Şa HuyÒn Hoµng Gi¸p /#choose_tiandi_lingqi(2,0)",
			"GiÇy Thiªn §Şa HuyÒn Hoµng/#choose_tiandi_lingqi(3,0)",
			"Vò khİ Thiªn §Şa HuyÒn Hoµng/choose_tiandi_weapon",
			"T¹m thêi kh«ng ®æi. /nothing")
	end
end

function choose_tiandi_weapon()
	local nRoute = GetPlayerRoute();
	if nRoute == 2 then 
		Say("Ng­¬i muèn ®æi vò khİ nµo?",
			3,
			"Thiªn §Şa HuyÒn Hoµng Dao/#choose_tiandi_lingqi(4,1)",
			"Thiªn §Şa HuyÒn Hoµng C«n/#choose_tiandi_lingqi(4,2)",
			"T¹m thêi kh«ng ®æi. /nothing")
	else
		choose_tiandi_lingqi(4,0);
	end
end

function choose_tiandi_lingqi(nType,nWp)
	Say("H·y chän ®iÓm linh khİ cña trang bŞ nµy.",
		3,
		"119 linh khİ [Cµn Kh¶m ChÊn CÊn]/#ask_is_duihuan("..nType..","..nWp..",119)",
		"120 linh khİ [Kh«n §oµi Ly Tèn]/#ask_is_duihuan("..nType..","..nWp..",120)",
		"T¹m thêi kh«ng ®æi. /nothing")
end

function ask_is_duihuan(nType,nWp,nLingqi)
	local tTiandiName = {"Thiªn §Şa HuyÒn Hoµng Kh«i","Thiªn §Şa HuyÒn Hoµng Gi¸p ","GiÇy Thiªn §Şa HuyÒn Hoµng","Vò khİ Thiªn §Şa HuyÒn Hoµng"};
	Say("X¸c nhËn sö dông linh khİ Thanh §ång ®Ønh cÊp 1 ®æi <color=yellow>"..nLingqi.."-"..tTiandiName[nType].."<color> chø?",
		3,
		"õ, ta muèn ®æi./#confirm_change_yijiding("..nType..","..nWp..","..nLingqi..")",
		"Kh«ng, ta nhÇm!/chang_yijiding",
		"T¹m thêi kh«ng ®æi. /nothing"
		)
end

function confirm_change_yijiding(nType,nWp,nLingqi)
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	if GetItemCount(2,1,3213) < 1 then
		Talk(1,"","ng­¬i kh«ng ®ñ Thanh §ång ®Ønh cÊp 1. ");
		return
	end	
	if Zgc_pub_goods_add_chk(1,250) ~= 1 then
		return
	end	
	if nType == 4 then
		if nRoute == 2 then
			if DelItem(2,1,3213,1) == 1 then
				local add_flag,add_idx = AddItem(tTiandi[nType][nRoute][nWp][2],tTiandi[nType][nRoute][nWp][3],tTiandi[nType][nRoute][nWp][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
				if add_flag == 1 then
					SetEquipCanChouQu(add_idx,1);
					Msg2Player("Chóc mõng ®æi thµnh c«ng, nhËn ®­îc "..tTiandi[nType][nRoute][nWp][1]);
					Talk(1,"","Chóc mõng ®æi thµnh c«ng, nhËn ®­îc "..tTiandi[nType][nRoute][nWp][1]);
					Msg2Global(GetName().."Dïng Thanh §ång ®Ønh ®Ó ®æi thµnh c«ng, nhËn ®­îc "..tTiandi[nType][nRoute][nWp][1]);
					WriteLog(" Ho¹t ®éng xu©n 2008: ng­êi ch¬i "..GetName().."Dïng Thanh §ång ®Ønh ®Ó ®æi thµnh c«ng, nhËn ®­îc "..tTiandi[nType][nRoute][nWp][1]);
				else
					WriteLog(" Ho¹t ®éng xu©n 2008: ng­êi ch¬i "..GetName().."Sö dông Thanh §ång ®Ønh cÊp 1 thÊt b¹i, log:"..add_flag);
				end
			end
		else
			if DelItem(2,1,3213,1) == 1 then
				local nRand = random(1,getn(tTiandi[nType][nRoute]));
				local add_flag,add_idx = AddItem(tTiandi[nType][nRoute][nRand][2],tTiandi[nType][nRoute][nRand][3],tTiandi[nType][nRoute][nRand][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
				if add_flag == 1 then
					SetEquipCanChouQu(add_idx,1);
					Msg2Player("Chóc mõng ®æi thµnh c«ng, nhËn ®­îc "..tTiandi[nType][nRoute][nRand][1]);
					Talk(1,"","Chóc mõng ®æi thµnh c«ng, nhËn ®­îc "..tTiandi[nType][nRoute][nRand][1]);
					Msg2Global(GetName().."Dïng Thanh §ång ®Ønh ®Ó ®æi thµnh c«ng, nhËn ®­îc "..tTiandi[nType][nRoute][nRand][1]);
					WriteLog(" Ho¹t ®éng xu©n 2008: ng­êi ch¬i "..GetName().."Dïng Thanh §ång ®Ønh ®Ó ®æi thµnh c«ng, nhËn ®­îc "..tTiandi[nType][nRoute][nRand][1]);
				else
					WriteLog(" Ho¹t ®éng xu©n 2008: ng­êi ch¬i "..GetName().."Sö dông Thanh §ång ®Ønh cÊp 1 thÊt b¹i, log:"..add_flag);
				end	
			end				
		end
	elseif nType == 1 or nType ==2 or nType == 3 then
		if DelItem(2,1,3213,1) == 1 then
			local add_flag,add_idx = AddItem(tTiandi[nType][nBody][2],tTiandi[nType][nBody][3],tTiandi[nType][nBody][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
			if add_flag == 1 then
			  SetEquipCanChouQu(add_idx,1);
				Msg2Player("Chóc mõng ®æi thµnh c«ng, nhËn ®­îc "..tTiandi[nType][nBody][1]);
				Talk(1,"","Chóc mõng ®æi thµnh c«ng, nhËn ®­îc "..tTiandi[nType][nBody][1]);
				Msg2Global(GetName().."Dïng Thanh §ång ®Ønh ®Ó ®æi thµnh c«ng, nhËn ®­îc "..tTiandi[nType][nBody][1]);
				WriteLog(" Ho¹t ®éng xu©n 2008: ng­êi ch¬i "..GetName().."Dïng Thanh §ång ®Ønh ®Ó ®æi thµnh c«ng, nhËn ®­îc "..tTiandi[nType][nBody][1]);
			else
				WriteLog(" Ho¹t ®éng xu©n 2008: ng­êi ch¬i "..GetName().."Sö dông Thanh §ång ®Ønh cÊp 1 thÊt b¹i, log:"..add_flag);
			end	
		end
	end				
end

function chang_tongqisuipian()
	if GetItemCount(2,1,3217) < 2000 then
		Talk(1,"","<color=green>Sø gi¶ n¨m míi<color>: Trªn ng­êi ng­¬i kh«ng ®ñ m¶nh ®ång dïng ®­îc ");	
	else
		Say("Ng­¬i muèn ®æi trang bŞ nµo? ",
			5,
			"Thiªn §Şa HuyÒn Hoµng Kh«i/#choose_tiandi_lingqi_suipian(1,0)",
			"Thiªn §Şa HuyÒn Hoµng Gi¸p /#choose_tiandi_lingqi_suipian(2,0)",
			"GiÇy Thiªn §Şa HuyÒn Hoµng/#choose_tiandi_lingqi_suipian(3,0)",
			"Vò khİ Thiªn §Şa HuyÒn Hoµng/choose_tiandi_weapon_suipian",
			"T¹m thêi kh«ng ®æi. /nothing")
	end	
end

function choose_tiandi_weapon_suipian()
	local nRoute = GetPlayerRoute();
	if nRoute == 2 then 
		Say("Ng­¬i muèn ®æi vò khİ nµo?",
			3,
			"Thiªn §Şa HuyÒn Hoµng Dao/#choose_tiandi_lingqi_suipian(4,1)",
			"Thiªn §Şa HuyÒn Hoµng C«n/#choose_tiandi_lingqi_suipian(4,2)",
			"T¹m thêi kh«ng ®æi. /nothing")
	else
		choose_tiandi_lingqi_suipian(4,0);
	end
end

function choose_tiandi_lingqi_suipian(nType,nWp)
	Say("H·y chän ®iÓm linh khİ cña trang bŞ nµy.",
		3,
		"119 linh khİ [Cµn Kh¶m ChÊn CÊn]/#ask_is_duihuan_suipian("..nType..","..nWp..",119)",
		"120 linh khİ [Kh«n §oµi Ly Tèn]/#ask_is_duihuan_suipian("..nType..","..nWp..",120)",
		"T¹m thêi kh«ng ®æi. /nothing")
end

function ask_is_duihuan_suipian(nType,nWp,nLingqi)
	local tTiandiName = {"Thiªn §Şa HuyÒn Hoµng Kh«i","Thiªn §Şa HuyÒn Hoµng Gi¸p ","GiÇy Thiªn §Şa HuyÒn Hoµng","Vò khİ Thiªn §Şa HuyÒn Hoµng"};
	Say("<color=green>Sø gi¶ n¨m míi<color>: Muèn sö dông 2000 m¶nh ®ång ®æi Linh Khİ thµnh<color=yellow>"..nLingqi.."-"..tTiandiName[nType].."<color> chø?",
		3,
		"õ, ta muèn ®æi./#confirm_change_yijiding_suipian("..nType..","..nWp..","..nLingqi..")",
		"Kh«ng, ta nhÇm!/chang_tongqisuipian",
		"T¹m thêi kh«ng ®æi. /nothing"
		)
end

function confirm_change_yijiding_suipian(nType,nWp,nLingqi)
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	if GetItemCount(2,1,3217) < 2000 then
		Talk(1,"","<color=green>Sø gi¶ n¨m míi<color>: Trªn ng­êi ng­¬i kh«ng cã 2000 m¶nh ®ång dïng ®­îc ");
		return
	end	
	if Zgc_pub_goods_add_chk(1,250) ~= 1 then
		return
	end	
	if nType == 4 then
		if nRoute == 2 then
			if DelItem(2,1,3217,2000) == 1 then
				local add_flag,add_idx = AddItem(tTiandi[nType][nRoute][nWp][2],tTiandi[nType][nRoute][nWp][3],tTiandi[nType][nRoute][nWp][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
				if add_flag == 1 then
					SetEquipCanChouQu(add_idx,1);
					Msg2Player("Chóc mõng ng­¬i ®æi thµnh c«ng 2000 m¶nh ®ång h÷u dông, nhËn ®­îc "..tTiandi[nType][nRoute][nWp][1]);
					Talk(1,"","<color=green>Sø gi¶ n¨m míi<color>: Chóc mõng ng­¬i ®æi thµnh c«ng 2000 m¶nh ®ång h÷u dông, nhËn ®­îc "..tTiandi[nType][nRoute][nWp][1]);
					Msg2Global(GetName().."§æi thµnh c«ng 2000 m¶nh ®ång h÷u dông, nhËn ®­îc "..tTiandi[nType][nRoute][nWp][1]);
					WriteLog(" Ho¹t ®éng xu©n 2008: ng­êi ch¬i "..GetName().."§æi thµnh c«ng 2000 m¶nh ®ång h÷u dông, nhËn ®­îc "..tTiandi[nType][nRoute][nWp][1]);
				else
					WriteLog(" Ho¹t ®éng xu©n 2008: ng­êi ch¬i "..GetName().."§æi 2000 m¶nh ®ång h÷u dông thÊt b¹i, tiªu chİ thÊt b¹i: "..add_flag);
				end
			end
		else
			if DelItem(2,1,3217,2000) == 1 then
				local nRand = random(1,getn(tTiandi[nType][nRoute]));
				local add_flag,add_idx = AddItem(tTiandi[nType][nRoute][nRand][2],tTiandi[nType][nRoute][nRand][3],tTiandi[nType][nRoute][nRand][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
				if add_flag == 1 then
					SetEquipCanChouQu(add_idx,1);
					Msg2Player("Chóc mõng ng­¬i ®æi thµnh c«ng 2000 m¶nh ®ång h÷u dông, nhËn ®­îc "..tTiandi[nType][nRoute][nRand][1]);
					Talk(1,"","<color=green>Sø gi¶ n¨m míi<color>: Chóc mõng ng­¬i ®æi thµnh c«ng 2000 m¶nh ®ång h÷u dông, nhËn ®­îc "..tTiandi[nType][nRoute][nRand][1]);
					Msg2Global(GetName().."§æi thµnh c«ng 2000 m¶nh ®ång h÷u dông, nhËn ®­îc "..tTiandi[nType][nRoute][nRand][1]);
					WriteLog(" Ho¹t ®éng xu©n 2008: ng­êi ch¬i "..GetName().."§æi thµnh c«ng 2000 m¶nh ®ång h÷u dông, nhËn ®­îc "..tTiandi[nType][nRoute][nRand][1]);
				else
					WriteLog(" Ho¹t ®éng xu©n 2008: ng­êi ch¬i "..GetName().."§æi 2000 m¶nh ®ång h÷u dông thÊt b¹i, tiªu chİ thÊt b¹i: "..add_flag);
				end	
			end				
		end
	elseif nType == 1 or nType ==2 or nType == 3 then
		if DelItem(2,1,3217,2000) == 1 then
			local add_flag,add_idx = AddItem(tTiandi[nType][nBody][2],tTiandi[nType][nBody][3],tTiandi[nType][nBody][4],1,1,0,0,0,0,0,0,0,0,nLingqi);
			if add_flag == 1 then
				SetEquipCanChouQu(add_idx,1);
				Msg2Player("Chóc mõng ng­¬i ®æi thµnh c«ng 2000 m¶nh ®ång h÷u dông, nhËn ®­îc "..tTiandi[nType][nBody][1]);
				Talk(1,"","<color=green>Sø gi¶ n¨m míi<color>: Chóc mõng ng­¬i ®æi thµnh c«ng 2000 m¶nh ®ång h÷u dông, nhËn ®­îc "..tTiandi[nType][nBody][1]);
				Msg2Global(GetName().."§æi thµnh c«ng 2000 m¶nh ®ång h÷u dông, nhËn ®­îc "..tTiandi[nType][nBody][1]);
				WriteLog(" Ho¹t ®éng xu©n 2008: ng­êi ch¬i "..GetName().."§æi thµnh c«ng 2000 m¶nh ®ång h÷u dông, nhËn ®­îc "..tTiandi[nType][nBody][1]);
			else
				WriteLog(" Ho¹t ®éng xu©n 2008: ng­êi ch¬i "..GetName().."§æi 2000 m¶nh ®ång h÷u dông thÊt b¹i, tiªu chİ thÊt b¹i: "..add_flag);
			end	
		end
	end				
end

function about_guwan_collect()
	Talk(1,"about_guwan_collect2","<color=green>Sø gi¶ n¨m míi<color>: \nTa nghe nãi gÇn ®©y vâ l©m nh©n sÜ khai quËt ®­îc nhiÒu Thanh §ång m·nh khİ, bŞ mét sè d· thó, qu¸i vËt vµ c­êng ®¹o lÊy ®i. NÕu ng­¬i t×m ®­îc m¶nh Thanh ®ång khİ vÒ, cã thÓ hîp thµnh 1 Thanh §ång ®Ønh giao cho ta.");
end

function about_guwan_collect2()
	Talk(1,"guwan_collect","<color=green>Sø gi¶ n¨m míi<color>: CÇn chó ı: cho dï ch­a hîp thµnh thµnh c«ng th× gi¸ trŞ cña Thanh §ång ®Ønh háng còng kh«ng ph¶i lµ nhá, vÉn cã thÓ ®æi ®­îc phÇn th­ëng chç ta. \nNgoµi ra ®¸nh qu¸i cao cÊp ngoµi thµnh ®Òu cã kh¶ n¨ng lÊy ®­îc Thanh §ång khİ huyÕt cao cÊp, \nNgù C¸c còng cã b¸n 1 sè m¶nh §ång khİ")
end

function about_hongbao()
	local nMapId = GetWorldPos();
	local nNum = GetMapTaskTemp(nMapId,MAP_HONGBAO_NUM);
	local nDate = tonumber(date("%Y%m%d"));
	local nLv = GetLevel();
	
	if GetTask(TASK_HONGBAO_DATE) >= nDate then
		Talk(1,"","<color=green>Sø gi¶ n¨m míi<color>: Ng­¬i h«m nay ®· nhËn 1 hång bao råi, mçi ngµy chØ nhËn ®­îc 1 lÇn th«i!");
		return
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	if nNum >= HONGBAO_TOTAL_NUM or (nNum < HONGBAO_TOTAL_NUM and nLv < 70)then
		Say("<color=green>Sø gi¶ n¨m míi<color>: Chµo ®ãn n¨m míi, ta ®· chuÈn bŞ rÊt nhiÒu hång bao tÆng cho nh©n sÜ. Mçi ngµy lóc 9h00, 13h00, 19h30, 21h30 sÏ ph¸t 50 §¹i hång bao, ai ®Õn tr­íc nhËn tr­íc. §¹i hång bao chØ ph¸t cho ai tõ cÊp70. Nh÷ng thêi gian cßn l¹i mäi ng­êi ®Òu cã thÓ tóy ı ®Õn nhËn TiÓu hång bao, ai còng cã phÇn!",
			2,
			"§­îc/get_xiao_hongbao",
			"Ta sÏ quay l¹i sau!/nothing")
	elseif nNum < HONGBAO_TOTAL_NUM and nLv >= 70 then
		AddItem(2,1,212,1);
		SetTask(TASK_HONGBAO_DATE,nDate);
		SetMapTaskTemp(nMapId,MAP_HONGBAO_NUM,nNum+1);
		Msg2Player("Chóc mõng Ng­¬i nhËn ®­îc 1 §¹i hång bao");
		Talk(1,"","<color=green>Sø gi¶ n¨m míi<color>: N¨m míi ®Õn råi, ta cã chuÈn bŞ bao l× x× cho mäi ng­êi, vµo lóc 9:00, 13:00, 19:30, 21:30 giê mçi ngµy sÏ ph¸t 50 §¹i hång bao, ®Õn tr­íc ®­îc tr­íc, chó ı, ng­êi l·nh §¹i hång bao ph¶i ®¹t cÊp 70 trë lªn. Cã thÓ ®Õn chç ta nhËn TiÓu hång bao bÊt cø lóc nµo. \nCÇm ®i, §¹i hång bao cña ng­¬i ®©y, chóc n¨m míi v¹n sù nh­ ı.");
	end
end

function get_xiao_hongbao()
	local nDate = tonumber(date("%Y%m%d"));
	if GetTask(TASK_HONGBAO_DATE) >= nDate then
		Talk(1,"","<color=green>Sø gi¶ n¨m míi<color>: Ng­¬i h«m nay ®· nhËn 1 hång bao råi, mçi ngµy chØ nhËn ®­îc 1 lÇn th«i!");
		return
	end	
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	AddItem(2,1,213,1);
	SetTask(TASK_HONGBAO_DATE,nDate);
	Msg2Player("Chóc mõng Ng­¬i nhËn ®­îc 1 TiÓu hång bao. ");
end

function get_action_manual()
	if BigGetItemCount(2,1,3225) >= 1 then
		Talk(1,"","<color=green>Sø gi¶ n¨m míi<color>: Ch¼ng ph¶i ng­¬i ®· cã mét chØ nam ho¹t ®éng ngµy xu©n råi sao?")
	else
		if Zgc_pub_goods_add_chk(1,1) ~= 1 then
			return
		end
		AddItem(2,1,3225,1);
	end		
end