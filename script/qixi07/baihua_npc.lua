--ÆßÏ¦»î¶¯½Å±¾
--by vivi
--07/26/2007

Include("\\script\\online\\qixi07\\qixi07_head.lua")

function main()
	local strtab={
		"Ta muèn nhËn h¹t gièng hoa hång vµ H¹t ThÇn bİ/get_seed",
		"Ta ®· nu«i lín H¹t ThÇn bİ, ng­¬i ®Õn xem thö ®i/check_seed",
		"Ta cã thÓ lµm g× vµo LÔ ThÊt TŞch nµy, trång hoa thÕ nµo/know_detail",
		"Ta chØ ®Õn xem thö/nothing"
		};
	local nDate = tonumber(date("%Y%m%d"));
	if nDate < 20070816 then
		Talk(1,"","Ho¹t ®éng ThÊt tŞch vÉn ch­a b¾t ®Çu.")
	else
		Say("Ngµy Ng­u Lang Chøc n÷ gÆp nhau ®· ®Õn råi.. Ta cã rÊt nhiÒu h¹t gièng hoa hång, vµo ngµy nµy h·y trång cho ng­êi yªu cña m×nh mét khãm hoa hång. Ta gÇn ®©y ph¸t hiÖn 1 lo¹i H¹t ThÇn bİ, nh­ng trång hoµi kh«ng ®­îc, nÕu ng­¬i gióp ta trång, ta sÏ tr¶ c«ng cho ng­¬i.",
			getn(strtab),
			strtab);
	end 
end

function get_seed()
	if Zgc_pub_goods_add_chk(2,2) ~= 1 then
		return
	end
	if GetLevel() < 11 then
		Talk(1,"","ng­¬i vÉn ph¶i rÌn luyÖn giang hå nhiÒu h¬n n÷a!");
		return
	end
	if MkTime(2007,08,16)+28800 <= GetCreateTime()+28800 then
		Talk(1,"","RÊt tiÕc, chØ nh÷ng ng­êi t¹o tr­íc ngµy 16 th¸ng 8 n¨m 2007 míi nhËn ®­îc.");
		return
	end
	local nDate = tonumber(date("%Y%m%d"));
	if	nDate > 20070830 then
		Talk(1,"","§· hÕt thêi gian nhËn. Xin lÇn sau h·y ®Õn sím!");
		return
	end
	if GetTask(TASK_GET_SEED) == 0 then
		Talk(1,"","H«m nay LÔ T×nh Nh©n, HÖ thèng tÆng b¹n h¹t 1 h¹t gièng hoa hång vµ 1 h¹t gièng thÇn kú. NÕu b¹n trång h¹t gièng nµy lín lªn, hÖ thèng sÏ tÆng b¹n phÇn th­ëng thİch hîp.");
		SetTask(TASK_GET_SEED,1);
		local add_flog_one = AddItem(2,1,1154,1);  --ÉñÃØÖÖ×Ó
		local add_flog_two = AddItem(2,0,352,1);  --Ãµ¹å»¨ÖÖ×Ó
		if add_flog_one == 1 and add_flog_two == 1 then
			Msg2Player("B¹n nhËn ®­îc 1 h¹t gièng hoa hång vµ h¹t gièng thÇn kú.");
		else
			WriteLog("Ho¹t ®éng ThÊt TŞch: Ng­êi ch¬i"..GetName().."NhËn lÊy h¹t gièng hoa hång vµ h¹t gièng thÇn kú thÊt b¹i. VŞ trİ thÊt b¹i. VŞ trİ thÊt b¹i:"..add_flog_one.." vµ"..add_flog_two);
		end
	else
		Talk(1,"","RÊt tiÕc! Mçi ng­êi chØ nhËn ®­îc 1 phÇn.");
	end
end

function check_seed()
	if GetItemCount(2,1,1154) == 0 and GetItemCount(2,1,1155) == 0 then
		Talk(1,"","Trªn ng­êi b¹n kh«ng cã h¹t gièng thÇn kú vµ hoa thÇn kú!");
		return
	end
	local strtab = {
		"Xem hoa nµy! T«i muèn nhËn phÇn th­ëng tr­ëng thµnh/get_grow_award",
		"T«i ®­a hoa cho b¹n. T«i muèn nhËn phÇn th­ëng cuèi cïng./get_final_award",
		"T«i cÇn ph¶i tiÕp tôc trång hoa/nothing"
		};
	Say("Kh«ng ngê ng­¬i ®· trång Hoa thÇn bİ lín thÕ nµy. Tèt l¾m! C¨n cø vµo ®é lín cña hoa, ta sÏ cho ng­¬i 1 phÇn th­ëng tr­ëng thµnh, nÕu ng­¬i trùc tiÕp ®­a hoa cho ta, ta sÏ tÆng ng­¬i phÇn th­ëng cuèi cïng, nh­ng ph¶i chó ı, kh«ng thÓ nhËn hai phÇn th­ëng cïng lóc.",
		getn(strtab),
		strtab
		);
end

function get_grow_award()
	local fl_grow = GetTask(TASK_FLOWER_GROW);
	local exp_arg = ((GetLevel()^3)/(80^3))*0.8;  --¾­ÑéÏµÊı
	if fl_grow == 0 then	
		Talk(1,"","Hoa ch­a tr­ëng thµnh!");
	else
		for i = 1,getn(tGrowAward) do
			if fl_grow <= tGrowAward[i][1] and fl_grow <= 100 then  
				if fl_grow <= 30 and GetBit(GetTask(TASK_AWARD_ONE),i) ~= 0 then 
					Talk(1,"","Hoa kh«ng cã thay ®æi g×. TiÕp tôc trång."); 
				elseif fl_grow <= 30 and GetBit(GetTask(TASK_AWARD_ONE),i) == 0 then
					Talk(1,"","B¹n ®­îc 1 ®iÓm ch¨m chØ. ");
					SetBit(GetTask(TASK_AWARD_ONE),i,1);
					SetTask(TASK_AWARD_ONE,SetBit(GetTask(TASK_AWARD_ONE),i,1));
					local r=random(tGrowAward[i][2],tGrowAward[i][3]);  --ÔÚ¸ø¶¨·¶Î§¸øËæ»ú¾­Ñé
					ModifyExp(floor(r*10000*exp_arg));
					Msg2Player("Chóc mõng b¹n nhËn ®­îc "..floor(r*10000*exp_arg).." kinh nghiÖm.");
				elseif fl_grow > 30 and GetBit(GetTask(TASK_AWARD_TWO),i-30) ~= 0 then
					Talk(1,"","Hoa kh«ng cã thay ®æi g×. TiÕp tôc trång."); 
				elseif fl_grow > 30 and GetBit(GetTask(TASK_AWARD_TWO),i-30) == 0 then
					Talk(1,"","B¹n ®­îc 1 ®iÓm ch¨m chØ. ");
					SetBit(GetTask(TASK_AWARD_TWO),i-30,1);
					SetTask(TASK_AWARD_TWO,SetBit(GetTask(TASK_AWARD_TWO),i-30,1));
					local r=random(tGrowAward[i][2],tGrowAward[i][3]);  --ÔÚ¸ø¶¨·¶Î§¸øËæ»ú¾­Ñé
					ModifyExp(floor(r*10000*exp_arg));
					Msg2Player("Chóc mõng b¹n nhËn ®­îc "..floor(r*10000*exp_arg).." kinh nghiÖm.");										
				end
				break	   
			elseif fl_grow > 100 then
				WriteLog("Ho¹t ®éng ThÊt TŞch, hoa thËt ®Æc biÖt. TrŞ sè ®Æc biÖt lµ:"..fl_grow);
				return
			end
		end
	end
end

function get_final_award()
	local strtab = {
		"Hoa nµy tÆng cho hÖ thèng. Ta muèn phÇn th­ëng /confirm_award",
		"T«i muèn suy nghÜ l¹i/nothing"
		};
	local fl_grow = GetTask(TASK_FLOWER_GROW);
	local j = 0;
	local exp_arg = ((GetLevel()^3)/(80^3))*0.8;			
	if fl_grow == 0 then
		Say("Ng­¬i kh«ng ch¨m chØ trång hoa, chØ cã thÓ nhËn phÇn th­êng nµy th«i!",
			getn(strtab),
			strtab
			);
	else 
		for i = 2,getn(tFinalAward) do
			if fl_grow <= tFinalAward[i][1] and fl_grow <= 100 then
				j = i;
				break
			elseif fl_grow > 100 then
				WriteLog("Ho¹t ®éng ThÊt TŞch, hoa thËt ®Æc biÖt. TrŞ sè ®Æc biÖt lµ:"..fl_grow);
				return
			end
		end		
		if j == 2 then
			Say("Ng­¬i ®· ch¨m chØ trång hoa, ®­îc nhËn 1 sè phÇn th­ëng båi th­êng. Tïy theo ®é lín cña hoa, ng­¬i nhËn ®­îc <color=red>"..floor(tFinalAward[j][2]*exp_arg).." <color> kinh nghiÖm,",
				getn(strtab),
				strtab
				);
		elseif j > 2 then
			Say("Ng­¬i ®· ch¨m chØ trång hoa, ®­îc nhËn 1 sè phÇn th­ëng båi th­êng. Tïy theo ®é lín cña hoa, ng­¬i nhËn ®­îc <color=red>"..floor(tFinalAward[j][2]*exp_arg).." <color> kinh nghiÖm,"..tBoxAward[j-2],
				getn(strtab),
				strtab
				);
		end			
	end
end

function confirm_award()
	local fl_grow = GetTask(TASK_FLOWER_GROW);
	local j = 0;
	local exp_arg = ((GetLevel()^3)/(80^3))*0.8;
	if fl_grow < 80 then
		if Zgc_pub_goods_add_chk(1,1) ~= 1 then
			return
		end
	elseif fl_grow < 100 then
		if Zgc_pub_goods_add_chk(2,2) ~= 1 then
			return
		end
	elseif fl_grow >= 100 then
		if Zgc_pub_goods_add_chk(3,3) ~= 1 then
			return
		end
	end					
	if fl_grow == 0 then
		if DelItem(2,1,1154,1) == 1 then   --Ã»ÓĞÖÖÏÂ»¨
			set_task_ling();
			ModifyExp(floor(tFinalAward[1][2]*exp_arg));
			Msg2Player("Chóc mõng b¹n nhËn ®­îc "..floor(tFinalAward[1][2]*exp_arg).." kinh nghiÖm.");
		elseif DelItem(2,1,1155,1) == 1 then  --ÖÖÏÂÁË»¨
			set_task_ling();
			ModifyExp(floor(tFinalAward[1][2]*exp_arg));
			Msg2Player("Chóc mõng b¹n nhËn ®­îc "..floor(tFinalAward[1][2]*exp_arg).." kinh nghiÖm.");
		end
	else
		for i = 2,getn(tFinalAward) do
			if fl_grow <= tFinalAward[i][1] and fl_grow <= 100 then
				j = i;
				break
			elseif fl_grow > 100 then
				WriteLog("Ho¹t ®éng ThÊt TŞch, hoa thËt ®Æc biÖt. TrŞ sè ®Æc biÖt lµ:"..fl_grow);
				return
			end
		end
		local r=random(1,100)
		local p=random(1,100)
		if DelItem(2,1,1155,1) == 1 then
			ModifyExp(floor(tFinalAward[j][2]*exp_arg));
			Msg2Player("Chóc mõng b¹n nhËn ®­îc "..floor(tFinalAward[j][2]*exp_arg).." kinh nghiÖm.");			
			if r <= tFinalAward[j][3] then 					
				local add_flog = AddItem(2,1,1153,tFinalAward[j][4]);
				if add_flog == 1 then
					Msg2Player("Chóc mõng b¹n nhËn ®­îc hép §ång T©m"..tFinalAward[j][4].."!");
				else
					WriteLog("Ho¹t ®éng ThÊt TŞch: Ng­êi ch¬i"..GetName().."NhËn hép §ång T©m thÊt b¹i. VŞ trİ:"..add_flog);
					return				
				end
			end
			if p <= tFinalAward[j][5] then
				local add_flog_two = AddItem(2,1,1152,tFinalAward[j][6]);
				if add_flog_two == 1 then
					Msg2Player("Chóc mõng b¹n nhËn ®­îc hép ThÇn Binh Së quèc"..tFinalAward[j][6].."!");
				else
					WriteLog("Ho¹t ®éng ThÊt TŞch: Ng­êi ch¬i"..GetName().."NhËn hép ThÇn Binh Së quèc thÊt b¹i. VŞ trİ:"..add_flog_two);
					return
				end
			end
			set_task_ling(); --±äÁ¿Çå0
		end
	end
end

function set_task_ling()
	SetTask(TASK_FLOWER_GROW,0);
	SetTask(TASK_AWARD_ONE,0);
	SetTask(TASK_AWARD_TWO,0);
	SetTask(TASK_TOTAL_TIME,0);
	SetTask(TASK_PLANT_TIME,0);
	SetTask(TASK_IS_PLANT,0);	
	SetTask(TASK_IS_GROW,0);
	SetTask(TASK_CURRENT_LOGIN,0);
	SetTask(TASK_LAST_LOGIN,0);	
end

function know_detail()
	local strtab = {
		"Ta cã thÓ tham gia ho¹t ®éng nµo/active",
		"Trång hoa nh­ thÕ nµo?/grow_flower",
		"Sau nµy h·y hái/nothing"
		};
	Say("ThÊt TŞch nµy hÖ thèng ®· chuÈn bŞ rÊt nhiÒu quµ tÆng. C¸c h¹ muèn t×m hiÓu g×?",
		getn(strtab),
		strtab
		);
end

function active()
	Talk(1,"","ThÊt TŞch lµ ngµy lÔ l·ng m¹n, lµ dŞp gÆp nhau mçi n¨m 1 lÇn cña Ng­u lang vµ Chøc N÷ t¹i cÇu ¤ Th­íc. HÖ thèng ®· chuÈn bŞ h¹t gièng hoa hång cho nh÷ng ng­êi yªu nhau, c¸c vŞ thiÕu hiÖp h·y v× ng­êi yªu mµ trång 1 ®ãa hoa hång, cµi lªn tãc ng­êi yªu. HÖ thèng cã 1 h¹t gièng thÇn kú tÆng cho b¹n trång, nÕu trång hoa lín lªn sÏ ®­îc 1 sè lÔ vËt. <color=yellow> ChØ nhËn h¹t gièng trong vßng 2 tuÇn khi ho¹t ®éng b¾t ®Çu<color>");
end

function grow_flower()
	Talk(1,"","ChØ cÇn nhÊp chuét ph¶i vµo tªn lo¹i hoa lµ cã thÓ trång, trong hµnh trang cña b¹n sÏ xuÊt hiÖn 1 'Hoa thÇn bİ', chó ı, chØ khi ®ang sö dông <color=red>Bång Lai Tiªn thñy<color> hoÆc <color=red>Bång Lai Tiªn lé<color> hoÆc <color=red>Bång Lai Tiªn ®¬n<color>, mçi ngµy b¹n chØ cÇn lªn m¹ng 1 tiÕng trë lªn, sÏ t¨ng ®é tr­ëng thµnh lªn 1 ®iÓm, nh­ng mçi ngµy chØ tr­ëng thµnh 1 lÇn, ®é tr­ëng thµnh cao nhÊt lµ 100.");
end

function nothing()
end