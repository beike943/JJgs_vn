--ÆßÏ¦»î¶¯½Å±¾
--by vivi
--07/26/2007

Include("\\script\\online\\qixi07\\qixi07_head.lua")
Include("\\script\\lib\\lingshi_head.lua")

--ÈÎÎñ±äÁ¿
TASK_QINGREN_AWARD = 2402; --Î÷·½ÇéÈË½ÚÊÇ·ñÁìÈ¡¹ıµ±Ìì½±Àø
TASK_SANBA_AWARD = 2403;  --ÊÇ·ñÁìÈ¡¹ıµ±ÌìÈı°Ë¸¾Å®½Ú½±Àø
TASK_SANBA_MAPID = 2404;  --ÁìÈ¡³ÇÊĞ
TASK_SANBA_TIME = 2405;		--ÁìÈ¡Ê±¼ä
TASK_SANBA_PIG = 2406;    --ÁìÈ¡ÖíµÄÀàĞÍ£¬ÓÃÓÚ¶ş´ÎÁì½±
TASK_SANBA_PETTIME = 2407; --¸ú³èÊ±¼ä
TASK_SANBA_TWO = 2408;    --ÊÇ·ñÁìÈ¡ÁË¶ş´Î½±Àø
TASK_SANBA_TONGXIN = 2409; --ÊÇ·ñÊ¹ÓÃÁËÍ¬ĞÄÍè

--È«¾Ö±äÁ¿
SANBA_AWARD_TIME = 1800; --Èı°Ë½Ú¶ş´ÎÁìÈ¡½±ÀøÊ±¼ä£¬µ¥Î»£ºÃë

--ºÃ¸Ğ¶È ¾­ÑéÏµÊı ÌìÊ±×¢½âÊıÁ¿
tExp = {{500,750000,2},{2000,1500000,5},{10000,3000000,7},{9999999,4500000,10}};

tSanbaAward =--µÈ¼¶ Ä£°å µÚÒ»´Î¾­Ñé£¨ÄĞ£© µÚ¶ş´Î¾­Ñé£¨ÄĞ£© Ä£°å µÚÒ»´Î¾­Ñé£¨Å®£© µÚ¶ş´Î¾­Ñé£¨Å®£© ¶ÔÓ¦Öí·ûid
	{{{"TiÓu H¾c tr­ (mÑ)",300000,800000},{"TiÓu H¾c tr­ (bè)",300000,900000},120,2,0,619},
	 {{"TiÓu B¹ch tr­ (mÑ)",300000,1100000},{"TiÓu B¹ch tr­ (bè)",400000,1200000},180,2,0,621},	
	 {{"TiÓu Kim tr­ (mÑ)",500000,1300000},{"TiÓu Kim tr­ (bè)",600000,1500000},999,2,0,625},	
	};

function main()
	local strtab={
		"Ta muèn nhËn h¹t gièng hoa hång vµ H¹t ThÇn bİ/get_seed",
		"Ta ®· nu«i lín H¹t ThÇn bİ, ng­¬i ®Õn xem thö ®i/check_seed",
		"Ta cã thÓ lµm g× vµo LÔ ThÊt TŞch nµy, trång hoa thÕ nµo/know_detail",
		"Ta chØ ®Õn xem thö/nothing"
		};
	local nDate = tonumber(date("%Y%m%d"));
	if nDate >= 20071110 and nDate <= 20071111 then
		tinsert(strtab,4,"Chóc Mõng lÔ Quang C«n, nhËn phÇn th­ëng chóc mõng/request_singleman_award");
	end;
	if nDate >= 20080213 and nDate <= 20080215 then
		tinsert(strtab,4,"H«m nay lµ LÔ T×nh nh©n, bän ta ®Õn ®©y ®Ó ®­îc chóc phóc/about_qingren");
	end
	if nDate >= 20080308 and nDate <= 20080309 then
		tinsert(strtab,4,"Chóc mõng ngµy quèc tÕ phô n÷ 8-3/about_sanba")
	end
	if nDate >= 20080614 and nDate <= 20080615 then
		tinsert(strtab,4,"Nh©n ®«i kinh nghiÖm/about_shuangbei")
	end
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
		if GetSex() == 1 then --ÄĞµÄ
			local add_flog_one = AddItem(2,0,1154,1);  --ÉñÃØÖÖ×Ó
			local add_flog_two = AddItem(2,0,352,1);  --Ãµ¹å»¨ÖÖ×Ó
			if add_flog_one == 1 and add_flog_two == 1 then
				Msg2Player("B¹n nhËn ®­îc 1 h¹t gièng hoa hång vµ h¹t gièng thÇn kú.");
			else
				WriteLog("Ho¹t ®éng ThÊt TŞch: Ng­êi ch¬i"..GetName().."NhËn lÊy h¹t gièng hoa hång vµ h¹t gièng thÇn kú thÊt b¹i. VŞ trİ thÊt b¹i. VŞ trİ thÊt b¹i:"..add_flog_one.." vµ"..add_flog_two);
			end
		else --Å®µÄ
			local add_flog_one = AddItem(2,0,1154,1);  --ÉñÃØÖÖ×Ó
			if add_flog_one == 1 then
				Msg2Player("B¹n nhËn ®­îc 1 h¹t gièng thÇn kú!");
			else
				WriteLog("Ho¹t ®éng ThÊt TŞch: Ng­êi ch¬i"..GetName().."NhËn lÊy h¹t gièng hoa hång vµ h¹t gièng thÇn kú thÊt b¹i. VŞ trİ thÊt b¹i. VŞ trİ thÊt b¹i:"..add_flog_one);
			end
		end	
	else
		Talk(1,"","RÊt tiÕc! Mçi ng­êi chØ nhËn ®­îc 1 phÇn.");
	end
end

function check_seed()
	if GetItemCount(2,0,1154) == 0 and GetItemCount(2,0,1155) == 0 then
		Talk(1,"","Trªn ng­êi b¹n kh«ng cã h¹t gièng thÇn kú vµ hoa thÇn kú!");
		return
	end
	local strtab = {
		"Xem hoa nµy! T«i muèn nhËn phÇn th­ëng tr­ëng thµnh/get_grow_award",
		"T«i ®­a hoa cho b¹n. T«i muèn nhËn phÇn th­ëng cuèi cïng./get_final_award",
		"T«i cÇn ph¶i tiÕp tôc trång hoa/nothing"
		};
	Say("B¹n ®· trång ®­îc hoa thÇn kú nµy. HÖ thèng ®· chuÈn bŞ 2 phÇn th­ëng kh«ng liªn tiÕp, c¨n c­ vµo ®é lín cña hoa ®­îc: phÇn th­ëng tr­ëng thµnh, nÕu trùc tiÕp ®­a hoa cho hÖ thèng sÏ ®­îc phÇn th­ëng cuèi cïng. <color=yellow>Mçi ng­êi chØ ®­îc trång 1 lÇn hoa thÇn kú<color>.",
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
					local tGrow = {40,50,60,80,100}
					for i = 1,getn(tGrow)-1 do
						if fl_grow > tGrow[i] and fl_grow < tGrow[i+1] then
							Talk(1,"","Hoa kh«ng cã thay ®æi g×, tiÕp tôc trång ®Õn khi <color=red>"..tGrow[i+1].."<color>. ")
							return
						end
					end
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
	if GetTask(TASK_GET_FINAL) ~= 0 then
		Talk(1,"main","PhÇn th­ëng cuèi cïng cña mçi nh©n vËt chØ ®­îc nhËn 1 lÇn. B¹n ®· nhËn råi.");
		return
	end	
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
	if fl_grow < 60 then
		if Zgc_pub_goods_add_chk(1,1) ~= 1 then
			return
		end
	elseif fl_grow < 80 then
		if Zgc_pub_goods_add_chk(2,2) ~= 1 then
			return
		end
	elseif fl_grow < 100 then
		if Zgc_pub_goods_add_chk(3,3) ~= 1 then
			return
		end		
	elseif fl_grow >= 100 then
		if Zgc_pub_goods_add_chk(5,5) ~= 1 then
			return
		end
	end					
	if fl_grow == 0 then
		if DelItem(2,0,1154,1) == 1 then   --Ã»ÓĞÖÖÏÂ»¨
			set_task_ling();
			ModifyExp(floor(tFinalAward[1][2]*exp_arg));
			Msg2Player("Chóc mõng b¹n nhËn ®­îc "..floor(tFinalAward[1][2]*exp_arg).." kinh nghiÖm.");
		elseif DelItem(2,0,1155,1) == 1 then  --ÖÖÏÂÁË»¨
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
		if DelItem(2,0,1155,1) == 1 then
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
	SetTask(TASK_IS_PLANT,0);	
	SetTask(TASK_IS_GROW,0);
	SetTask(TASK_CURRENT_LOGIN,0);
	SetTask(TASK_LAST_LOGIN,0);
	SetTask(TASK_GET_FINAL,1);	
end

function know_detail()
	local strtab = {
		"Ta cã thÓ tham gia ho¹t ®éng nµo/active",
		"Trång hoa nh­ thÕ nµo?/grow_flower",
		"T«i muèn xem phÇn th­ëng vÒ hoa cã nh÷ng mãn nµo/see_award",
		"Sau nµy h·y hái/nothing"
		};
	Say("ThÊt TŞch nµy hÖ thèng ®· chuÈn bŞ rÊt nhiÒu quµ tÆng. C¸c h¹ muèn t×m hiÓu g×?",
		getn(strtab),
		strtab
		);
end

function active()
	Talk(1,"know_detail","ThÊt TŞch lµ ngµy lÔ l·ng m¹n, lµ dŞp gÆp nhau mçi n¨m 1 lÇn cña Ng­u lang vµ Chøc N÷ t¹i cÇu ¤ Th­íc. HÖ thèng ®· chuÈn bŞ h¹t gièng hoa hång cho nh÷ng ng­êi yªu nhau, c¸c vŞ thiÕu hiÖp h·y v× ng­êi yªu mµ trång 1 ®ãa hoa hång, cµi lªn tãc ng­êi yªu. HÖ thèng cã 1 h¹t gièng thÇn kú tÆng cho b¹n trång, nÕu trång hoa lín lªn sÏ ®­îc 1 sè lÔ vËt. <color=yellow> ChØ nhËn h¹t gièng trong vßng 2 tuÇn khi ho¹t ®éng b¾t ®Çu<color>");
end

function grow_flower()
	Talk(1,"know_detail","ChØ cÇn b¹n nhÊp chuét ph¶i vµo c¸c lo¹i hoa, thÕ lµ cã thÓ trång hoa, trong hµnh lı cña b¹n sÏ xuÊt hiÖn 1 'Hoa thÇn bİ', chó ı, chØ khi sö dông <color=red>Bång Lai Tiªn thñy<color> hoÆc <color=red>Bång Lai Tiªn lé<color> hoÆc <color=red>Bång Lai Tiªn ®¬n<color>, mçi ngµy b¹n chØ cÇn lªn m¹ng 1 tiÕng trë lªn, cã thÓ t¨ng 1 ®iÓm ®é tr­ëng thµnh, nh­ng mçi ngµy chØ cã thÓ tr­ëng thµnh mét lÇn, ®é tr­ëng thµnh tèi ®a lµ 100 ®iÓm.");
end

function see_award()
	Talk(1,"see_award2","Ta chuÈn bŞ hai lo¹i phÇn th­ëng, tïy theo b¹n nu«i hoa lín tíi ®©u, ta sÏ cho b¹n mét sè kinh nghiÖm lµm phÇn th­ëng tr­ëng thµnh, nÕu b¹n trùc tiÕp ®­a hoa cho ta, ta sÏ cho b¹n phÇn th­ëng cuèi cïng, nh­ng ph¶i chó ı, kh«ng thÓ cho hai phÇn th­ëng cïng lóc, ph¶i chia ra nhËn. <color=yellow>H¬n n÷a mçi ng­êi chØ cã thÓ trång Hoa thÇn bİ 1 lÇn, nÕu ®æi hoa lÊy phÇn th­ëng cuèi cïng, b¹n kh«ng ®­îc tiÕp tôc trång hoa n÷a<color>.");
end

function see_award2()
	Talk(1,"see_award3","PhÇn th­ëng cuèi cïng nh­ sau:: <color=yellow>\n®é tr­ëng thµnh tõ 5 trë xuèng, cho kinh nghiÖm\n®é tr­ëng thµnh tõ 10 trë xuèng, cho kinh nghiÖm vµ 10% x¸c suÊt nhËn ®­îc 1 Hép §ång t©m\n®é tr­ëng thµnh tõ 20 trá xuèng, cho kinh nghiÖm vµ 20% x¸c suÊt nhËn ®­îc 1 Hép §ång t©m\n®é tr­ëng thµnh tõ 40 trë xuèng, cho kinh nghiÖm vµ 40% x¸c xuÊt nhËn ®­îc 1 Hép §ång t©m\n®é tr­ëng thµnh tõ 50 trë xuèng, cho kinh nghiÖm vµ 60% xuÊt nhËn ®­îc 1 Hép §ång t©m<color>");
end

function see_award3()
	Talk(1,"know_detail","<color=yellow>\n®é tr­ëng thµnh tõ 60 trë xuèng, cho kinh nghiÖm vµ 80% x¸c suÊt nhËn ®­îc 1 Hép §ång t©m\n®é tr­ëng thµnh tõ 80 trë xuèng, cho kinh nghiÖm cho 1 Hép §ång t©m, 1 Hép ThÇn Binh Së quèc\n®é tr­ëng thµnh tõ 100 trë xuèng, cho kinh nghiÖm vµ 1 Hép §ång t©m, 2 Hép ThÇn Binh Së quèc\n®é tr­ëng thµnh ®¹t 100, cho kinh nghiÖm vµ cho 1 Hép §ång t©m, 4 Hép ThÇn Binh Së quèc<color>");
end

function request_singleman_award()
	local selTab = {
				"NhËn lÔ vËt chóc mõng/get_singleman_award",
				"Quay ®Çu nhËn lÔ vËt/nothing",
				}
	Say("LÔ Quang c«n ®Õn råi, kh«ng biÕt ph¶i ch¨ng b»ng h÷u? (hiÖp n÷) vÉn cßn mét m×nh phiªu b¹t chèn giang hå, ®õng ®au lßng, trong dŞp lÔ nµy, 2 ®¹i lÔ kiÕm vâng sÏ ®­îc göi ®Õn, chóng ta mÆc søc h­ëng thô thÕ giíi trß ch¬i! NÕu ng­¬i kh«ng ph¶i c« gia qu¶ phô, ®õng ®au lßng, ta còng cã lÔ vËt tÆng ng­¬i. Vµo <color=yellow>ngµy 10 vµ 11 th¸ng 11, mçi tèi tõ 18:00##23:00<color> ®Õn l·nh ®¹i lÔ kinh nghiÖm!",getn(selTab),selTab);
end;

function get_singleman_award()
	local nDate = tonumber(date("%y%m%d"));
	local nHour = tonumber(date("%H"));
	local nGetDate = GetTask(1850);
	local nLevel = GetLevel();
	if nLevel <= 10 then
		Talk(1,"","ThËt ng¹i qu¸, ng­êi ch¬i tõ cÊp 10 trë lªn míi ®­îc nhËn lÔ phÈm.");
		return 0;
	end;
	if (nGetDate ~= 0 and nGetDate ~= 071110 and nGetDate ~= 071111) or nGetDate >= nDate then
		Talk(1,"","ThËt ng¹i qu¸, h«m nay b¹n ®· nhËn lÔ phÈm råi.");
		return 0;	
	end;
	if nHour >= 18 and nHour < 23 then
		SetTask(1850,nDate);
		local nExp = 0;
		if GetMateName() == "" then
			nExp = floor((nLevel^4)/12);
		else
			nExp = floor((nLevel^4)/16);
		end;
		ModifyExp(nExp);
		Msg2Player("B¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm");
		Talk(1,"","Cã chót quµ män cho b¹n, chóc b¹n vui vÎ!");
	else
		Talk(1,"","VÉn ch­a ®Õn giê. Xin ®îi ®Õn <color=yellow>18:00##23:00<color>giê nhËn");
	end;
end;

function nothing()
end

function about_qingren()
	local strtab = {
			"Ta ®i cïng ı trung nh©n/get_award_qingren",
			"ThuyÕt minh ho¹t ®éng lÔ T×nh nh©n/about_qingren_detail",
			"Ta vÉn ch­a cã ı trung nh©n/nothing"};
			
	Say("LÔ t×nh nh©n ®· ®Õn, tõ ngµy13 ®Õn ngµy 15 th¸ng 2, nÕu c¸c h¹ cã c¶m t×nh víi ai ®ã, cã thÓ cïng tæ ®éi ®Õn gÆp ta, ta sÏ c¨n cø vµo ®é h¶o c¶m gi÷a c¸c ng­¬i, ban tÆng lêi chóc phóc. Xin chó ı, mét ng­êi mét ngµy nhËn ®­îc 1 lÇn chóc phóc.",
		getn(strtab),
		strtab);
end

function get_award_qingren()
	local nDate = tonumber(date("%Y%m%d"));
	local nOldIndex = PlayerIndex;
	local nSex1,nSex2 = 0,0;
	local nFriend = 0; --ºÃ¸Ğ¶È
	
	if GetTeamSize() ~= 2 then
		Talk(1,"","Ph¶i dÉn ı trung nh©n cña ng­¬i mét m×nh ®Õn gÆp ta.");
	else
		PlayerIndex = GetTeamMember(1);
		nSex1 = GetSex();
		if GetTask(TASK_QINGREN_AWARD) >= nDate then
			PlayerIndex = nOldIndex;
			Talk(1,"","ThËt ®¸ng tiÕc, ta ®· chóc phóc cho ng­êi trong ®éi cña ng­¬i råi.");
			return
		end
		PlayerIndex = GetTeamMember(2);
		nSex2 = GetSex();
		if GetTask(TASK_QINGREN_AWARD) >= nDate then
			PlayerIndex = nOldIndex;
			Talk(1,"","ThËt ®¸ng tiÕc, ta ®· chóc phóc cho ng­êi trong ®éi cña ng­¬i råi.");
			return
		end		
		PlayerIndex = nOldIndex;
		if nSex1 == nSex2 then
			Talk(1,"","Ph¶i dÉn ı trung nh©n cña ng­¬i ®Õn, kh«ng ph¶i b»ng h÷u.");
			return
		end
		if PlayerIndex == GetTeamMember(1) then
			nFriend = GetMemberFriendliness(2);
		elseif PlayerIndex == GetTeamMember(2) then
			nFriend = GetMemberFriendliness(1);
		end
		for i = 1,getn(tExp) do
			if nFriend <= tExp[i][1] then 
				PlayerIndex = GetTeamMember(1);
				local nLv = GetLevel();
				if nLv == 99 then  --ÏÈ¶ÔÁ½¸öÈË½øĞĞ¸ºÖØ¼ì²â
					if GetFreeItemRoom() < 1 or (GetMaxItemWeight() - GetCurItemWeight()) < tExp[i][3] then
						PlayerIndex = nOldIndex;
						Talk(1,"","Hµnh trang hoÆc søc lùc cña b¹n hoÆc ®ång ®éi kh«ng ®ñ, h·y chØnh lı l¹i ®i.");
						return
					end
				elseif nLv <= 30 then
					PlayerIndex = nOldIndex;
					Talk(1,"","Hai ng­êi ph¶i ®¹t cÊp 30 trë lªn míi ®i ®­îc.");
					return						
				end
				PlayerIndex = GetTeamMember(2);
				local nLv2 = GetLevel();
				if nLv2 == 99 then
					if GetFreeItemRoom() < 1 or (GetMaxItemWeight() - GetCurItemWeight()) < tExp[i][3] then
						PlayerIndex = nOldIndex;
						Talk(1,"","Hµnh trang hoÆc søc lùc cña b¹n hoÆc ®ång ®éi kh«ng ®ñ, h·y chØnh lı l¹i ®i.");
						return
					end
				elseif nLv2 <= 30 then
					PlayerIndex = nOldIndex;
					Talk(1,"","Hai ng­êi ph¶i ®¹t cÊp 30 trë lªn míi ®i ®­îc.");
					return						
				end
				
				PlayerIndex = GetTeamMember(1);								
				local nExp = floor(tExp[i][2]*nLv^2/80^2);				
				if nLv ~= 99 then
					SetTask(TASK_QINGREN_AWARD,nDate);
					ModifyExp(nExp);
					Msg2Player("Chóc mõng b¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm.");
					Talk(1,"","Ta chóc hai ng­¬i h¹nh phóc, cã chót quµ tÆng c¸c ng­¬i, "..nExp.." ®iÓm kinh nghiÖm, gióp c¸c ng­¬i hµnh tÈu giang hå.");
				else
					SetTask(TASK_QINGREN_AWARD,nDate);
					AddItem(2,1,3210,tExp[i][3]);
					Msg2Player("Chóc mõng b¹n nhËn ®­îc "..tExp[i][3].."quyÓn Thiªn Thêi Chó Gi¶i");
					Talk(1,"","Ta chóc hai ng­¬i h¹nh phóc, cã chót quµ tÆng c¸c ng­¬i, "..tExp[i][3].."quyÓn Thiªn Thêi Chó Gi¶i, gióp c¸c ng­¬i phiªu b¹t giang hå");
				end
				PlayerIndex = GetTeamMember(2);
				local nExp2 = floor(tExp[i][2]*nLv2^2/80^2);				
				if nLv2 ~= 99 then
					SetTask(TASK_QINGREN_AWARD,nDate);
					ModifyExp(nExp2);
					Msg2Player("Chóc mõng b¹n nhËn ®­îc "..nExp2.." ®iÓm kinh nghiÖm.");
					Talk(1,"","Ta chóc hai ng­¬i h¹nh phóc, cã chót quµ tÆng c¸c ng­¬i, "..nExp2.." ®iÓm kinh nghiÖm, gióp c¸c ng­¬i hµnh tÈu giang hå.");
				else
					SetTask(TASK_QINGREN_AWARD,nDate);
					AddItem(2,1,3210,tExp[i][3]);
					Msg2Player("Chóc mõng b¹n nhËn ®­îc "..tExp[i][3].."quyÓn Thiªn Thêi Chó Gi¶i");
					Talk(1,"","Ta chóc hai ng­¬i h¹nh phóc, cã chót quµ tÆng c¸c ng­¬i, "..tExp[i][3].."quyÓn Thiªn Thêi Chó Gi¶i, gióp c¸c ng­¬i phiªu b¹t giang hå");
				end
				PlayerIndex = nOldIndex;
				break
			end
		end
	end								
end

function about_qingren_detail()
	Talk(1,"","Ta sÏ c¨n cø vµo ®é h¶o c¶m gi÷a ng­¬i vµ ®éi h÷u ®Ó tÆng phÇn th­ëng.\n0-500 ®é h¶o c¶m, nÕu b¹n ë cÊp 80 sÏ ®­îc 75 v¹n kinh nghiÖm\n501-2000 ®é h¶o c¶m, nÕu b¹n ë cÊp 80 sÏ ®­îc 150 v¹n kinh nghiÖm\n2001-10000 ®é h¶o c¶m, nÕu b¹n ë cÊp 80 sÏ ®­îc 300 v¹n kinh nghiÖm\n10001 ®é h¶o c¶m trë lªn, nÕu b¹n ë cÊp 80 sÏ ®­îc 450 v¹n kinh nghiÖm\n§¼ng cÊp kh¸c sÏ ®­îc gi¶m hoÆc t¨ng nhÊt ®Şnh, nÕu trong ®éi cã ng­êi ®¹t cÊp 99 sÏ nhËn ®­îc'thiªn thêi chó gi¶i' lµm phÇn th­ëng. Chóc LÔ t×nh nh©n vui vÎ!");
end

function about_sanba()
	local strtab={
		"Chóc mõng Quèc tÕ phô n÷, mêi nhËn quµ/get_sanba_one",
		"NhËn lÔ vËt chóc mõng lÇn thø 2/get_sanba_two",
		"ThuyÕt minh phÇn th­ëng/sanba_deteil",
		"Ta chØ ®Õn xem thö/nothing"
		};
	Say("Xu©n vÒ kh¾p n¬i, v¹n vËt håi sinh. Chóng ta l¹i chµo ®ãn ngµy lÔ 'Quèc tÕ phô n÷ 8-3', ®Ó c¶m ¬n c¸c chŞ em phô n÷ ®· ñng hé trß ch¬i, vµo lóc 08:00—22:30 ngµy 8 vµ ngµy 9 th¸ng 3 chóng ta sÏ cã nh÷ng phÇn quµ ®Æc biÖt dµnh cho chŞ em. Hai ng­êi mét tæ, ®¼ng cÊp hai ng­êi cµng cao cµng cã c¬ héi nhËn quµ tèt. Mçi ng­êi mét ngµy chØ nhËn mét phÇn quµ. H·y s¾p xÕp l¹i hµnh trang. M¸ch nhá: ®­a cho ta 1 viªn §ång T©m Hoµn, ta sÏ cho c¸c ng­¬i sù ng¹c nhiªn gÊp 3 lÇn.",
			getn(strtab),
			strtab);	
end

function get_sanba_one()
	local strtab = {
			"Chóng ta ph¶i lÊy lÔ vËt/#ask_use_tongxin(1)",
			"Ta muèn lÊy lÔ vËt/give_him_award",
			"Ta ®i t×m mét b»ng h÷u ®·!/nothing"
			};
	Say("Ng­¬i mét m×nh ®Õn lÊy hay dÉn theo b¹n kh¸c giíi ®Õn lÊy?",
		getn(strtab),
		strtab)
end

function ask_use_tongxin(nNum)
	if nNum == 1 then
		Say("Sö dông §ång T©m Hoµn nhËn ®uîc phÇn th­ëng kinh nghiÖm gÊp 3 lÇn, hai ng­êi cÇn 2 viªn §ång T©m Hoµn, ®­a §ång T©m Hoµn cho ®éi tr­ëng. Muèn sö dông kh«ng?",
			3,
			"§­îc, ta chÊp nhËn./#give_them_award(1)",
			"Kh«ng cÇn, trùc tiÕp nhËn lÔ phÈm/#give_them_award(2)",
			"§îi ®·, ta vÉn ch­a chuÈn bŞ/nothing")
	elseif nNum == 2 then
		Say("Sö dông §ång T©m Hoµn nhËn ®uîc phÇn th­ëng kinh nghiÖm gÊp 3 lÇn, muèn sö dông kh«ng?",
			3,
			"§­îc, ta ®ång ı./#confirm_sanba_award(1)",
			"Kh«ng cÇn, trùc tiÕp nhËn lÔ phÈm/#confirm_sanba_award(2)",
			"§îi ®·, ta vÉn ch­a chuÈn bŞ/nothing")
	end
end

function give_them_award(nType)
	local nDate = tonumber(date("%Y%m%d"));
	local nPos = GetWorldPos();
	local nOldIndex = PlayerIndex;
	local nSexOne,nSexTwo = 0,0;
	local nLvOne,nLvTwo,nLvTotal = 0,0,0;
	local sNameOne,sNameTwo = "","";
	local nTempType = 0; 
	
	if GetTeamSize() ~= 2 then
		Talk(1,"","DÉn theo b¹n kh¸c giíi ®Õn sÏ cµng cã nhiÒu phÇn th­ëng, c¶ hai ng­êi nhÊt ®Şnh ph¶i ®Õn gÆp ta.");
	else 
		if PlayerIndex ~= GetTeamMember(0) then
			Talk(1,"","Mêi ®éi tr­ëng ®Õn lÊy.");
			return
		end
		if nType == 1 then
			if GetItemCount(2,1,573) < 2 then
				Talk(1,"","CÇn 2 viªn §ång T©m Hoµn, ng­¬i kh«ng cã ®ñ.");
				return
			end
		end
		
		nSexOne = GetSex();
		nLvOne = GetLevel();
		sNameOne = GetName();
		if GetTask(TASK_SANBA_AWARD) >= nDate then
			PlayerIndex = nOldIndex;
			Talk(1,"","ThËt ®¸ng tiÕc, ta ®· tÆng quµ cho ng­êi trong ®éi cña ng­¬i råi, mçi ng­êi mét ngµy chØ ®uîc l·nh mét lÇn.");
			return
		end
		if PlayerIndex == GetTeamMember(1) then
			PlayerIndex = GetTeamMember(2);
		elseif PlayerIndex == GetTeamMember(2) then
			PlayerIndex = GetTeamMember(1);
		end
		nSexTwo = GetSex();
		nLvTwo = GetLevel();
		sNameTwo = GetName();
		if GetTask(TASK_SANBA_AWARD) >= nDate then
			PlayerIndex = nOldIndex;
			Talk(1,"","ThËt ®¸ng tiÕc, ta ®· tÆng quµ cho ng­êi trong ®éi cña ng­¬i råi, mçi ng­êi mét ngµy chØ ®uîc l·nh mét lÇn.");
			return
		end		
		PlayerIndex = nOldIndex;
		
		if nSexOne == nSexTwo then
			Talk(1,"","Ph¶i mang theo b¹n kh¸c giíi cña ng­¬i ®Õn míi ®­îc.");
			return
		end
		if nLvOne < 11 or nLvTwo < 11 then
			Talk(1,"","Ng­êi trong ®éi ng­¬i cÇn rÌn luyÖn thªm trªn giang hå.");
			return
		end			
		nLvTotal = nLvOne+nLvTwo; --µÈ¼¶Ö®ºÍ
		for i=1,getn(tSanbaAward) do
			if nLvTotal < tSanbaAward[i][3] then
				nTempType = i;
				break
			end
		end
							
		local nExpOne = floor(tSanbaAward[nTempType][nSexOne][2]*nLvOne^3/80^3);
		local nExpTwo = floor(tSanbaAward[nTempType][nSexTwo][2]*nLvTwo^3/80^3);
		local nNumOne,nNumTwo = 1,1;
		if nType == 1 then
			if DelItem(2,1,573,2) == 1 then
				nExpOne = nExpOne*3;
				nExpTwo = nExpTwo*3;
				nNumOne = nNumOne*3;
				nNumTwo = nNumTwo*3;
			end
		end
		local nRandExp = random(1,100);
		if nRandExp >= 99 then
			nExpOne = nExpOne*3;
			nExpTwo = nExpTwo*3;
			nNumOne = nNumOne*3;
			nNumTwo = nNumTwo*3;
			Msg2Global("Chóc mõng "..sNameOne.."Trong ho¹t ®éng mõng 8-3 nhËn ®­îc phÇn th­ëng kinh nghiÖm gÊp 3 lÇn");
			Msg2Global("Chóc mõng "..sNameTwo.."Trong ho¹t ®éng mõng 8-3 nhËn ®­îc phÇn th­ëng kinh nghiÖm gÊp 3 lÇn");
		elseif nRandExp >= 96 then
			nExpOne = nExpOne*2;
			nExpTwo = nExpTwo*2;
			nNumOne = nNumOne*2;
			nNumTwo = nNumTwo*2;
			Msg2Global("Chóc mõng "..sNameOne.."Trong ho¹t ®éng mõng 8-3 nhËn ®­îc phÇn th­ëng kinh nghiÖm gÊp 2 lÇn!");
			Msg2Global("Chóc mõng "..sNameTwo.."Trong ho¹t ®éng mõng 8-3 nhËn ®­îc phÇn th­ëng kinh nghiÖm gÊp 2 lÇn!");			
		end		
		if nLvOne ~= 99 then		
			ModifyExp(nExpOne);
			Msg2Player("Chóc mõng b¹n nhËn ®­îc "..nExpOne.."Kinh nghiÖm");
		else
			for i=1,nNumOne do
				local nRand = random(1,6);
				lspf_AddLingShiInBottle(nRand,1);
				Msg2Player("Chóc mõng b¹n nhËn ®­îc "..nRand.." (cÊp) Linh th¹ch 1 viªn");
			end
		end
		SetTask(TASK_SANBA_AWARD,nDate);
		SetTask(TASK_SANBA_MAPID,nPos);
		SetTask(TASK_SANBA_TIME,GetTime());
		SetTask(TASK_SANBA_PIG,nTempType);
		SetTask(TASK_SANBA_PETTIME,GetTime());
		if nType == 1 then
			SetTask(TASK_SANBA_TONGXIN,1);
		end
		AddItem(tSanbaAward[nTempType][4],tSanbaAward[nTempType][5],tSanbaAward[nTempType][6],1);
		Talk(1,"","TÆng cho c¸c ng­¬i kinh nghiÖm phong phó vµ lîn con dÔ th­¬ng@^_^@Sau nöa tiÕng n÷a ®Õn chç ta! ( cã thÓ ®Õn tr­íc mét m×nh) cßn rÊt nhiÒu phÇn th­ëng. Nhí r»ng ta lµ B¸ch Hoa sø gi¶ cña thµnh nµy, ®i sai thµnh sÏ kh«ng nhËn ®­îc quµ.");
		if PlayerIndex == GetTeamMember(1) then
			PlayerIndex = GetTeamMember(2);
		elseif PlayerIndex == GetTeamMember(2) then
			PlayerIndex = GetTeamMember(1);
		end		
		if nLvTwo ~= 99 then
			ModifyExp(nExpTwo);
			Msg2Player("Chóc mõng b¹n nhËn ®­îc "..nExpTwo.."Kinh nghiÖm");
		else
			for i=1,nNumTwo do
				local nRand = random(1,6);
				lspf_AddLingShiInBottle(nRand,1);
				Msg2Player("Chóc mõng b¹n nhËn ®­îc "..nRand.." (cÊp) Linh th¹ch 1 viªn");
			end
		end
		SetTask(TASK_SANBA_AWARD,nDate);
		SetTask(TASK_SANBA_MAPID,nPos);
		SetTask(TASK_SANBA_TIME,GetTime());
		SetTask(TASK_SANBA_PIG,nTempType);
		SetTask(TASK_SANBA_PETTIME,GetTime());
		if nType == 1 then
			SetTask(TASK_SANBA_TONGXIN,1);
		end		
		AddItem(tSanbaAward[nTempType][4],tSanbaAward[nTempType][5],tSanbaAward[nTempType][6],1);	
		Talk(1,"","TÆng cho c¸c ng­¬i kinh nghiÖm phong phó vµ lîn con dÔ th­¬ng@^_^@Sau nöa tiÕng n÷a ®Õn chç ta! ( cã thÓ ®Õn tr­íc mét m×nh) cßn rÊt nhiÒu phÇn th­ëng. Nhí r»ng ta lµ B¸ch Hoa sø gi¶ cña thµnh nµy, ®i sai thµnh sÏ kh«ng nhËn ®­îc quµ.");
		PlayerIndex = nOldIndex;
	end		
end

function give_him_award()
	Say("Muèn lÊy quµ mét m×nh sao? DÉn b¹n kh¸c giíi ®Õn sÏ cã nhiÒu c¬ héi h¬n.",
		2,
		"Ta muèn nhËn /#ask_use_tongxin(2)",
		"Ta ®i t×m mét b»ng h÷u ®·!/nothing")
end

function confirm_sanba_award(nType)
	local nDate = tonumber(date("%Y%m%d"));
	local nLv = GetLevel();
	local nPos = GetWorldPos();
	local nSex = GetSex();
	local sName = GetName();
	
	if nLv < 11 then
		Talk(1,"","Ng­¬i cÇn ph¶i rÌn luyÖn giang hå l¹i mét phen.");
		return
	end		
	if GetTask(TASK_SANBA_AWARD) >= nDate then
		Talk(1,"","ThËt tiÕc, ta ®· tÆng quµ cho ng­¬i råi, mçi ngµy chØ ®uîc nhËn 1 lÇn th«i.");
		return
	end		
	
	--Ò»¸öÈËÁìÄ¬ÈÏÎª½±ÀøÎªµÚÒ»ÖÖ£¬¼´120¼¶ÒÔÏÂ
	local nExp = floor(tSanbaAward[1][nSex][2]*nLv^3/80^3);
	local nLingshiNum = 1;
	if nType == 1 then
		if GetItemCount(2,1,573) < 1 then
			Talk(1,"","Ng­¬i quªn mang theo §ång T©m Hoµn råi chø g×?");
			return
		end
		if DelItem(2,1,573,1) == 1 then
			nExp = nExp*3;
			nLingshiNum = nLingshiNum*3;
			SetTask(TASK_SANBA_TONGXIN,1);
		end
	end
	local nRandExp = random(1,100);
	if nRandExp >= 99 then
		nExp = nExp*3;
		nLingshiNum = nLingshiNum*3;
		Msg2Global("Chóc mõng "..sName.."Trong ho¹t ®éng mõng 8-3 nhËn ®­îc phÇn th­ëng kinh nghiÖm gÊp 3 lÇn");
	elseif nRandExp >= 96 then
		nExp = nExp*2;
		nLingshiNum = nLingshiNum*2;
		Msg2Global("Chóc mõng "..sName.."Trong ho¹t ®éng mõng 8-3 nhËn ®­îc phÇn th­ëng kinh nghiÖm gÊp 2 lÇn!");	
	end	
	if nLv ~= 99 then
		ModifyExp(nExp);
		Msg2Player("Chóc mõng b¹n nhËn ®­îc "..nExp.."Kinh nghiÖm");
	else
		for i=1,nLingshiNum do
			local nRand = random(1,6);
			lspf_AddLingShiInBottle(nRand,1);
			Msg2Player("Chóc mõng b¹n nhËn ®­îc "..nRand.." (cÊp) Linh th¹ch 1 viªn");
		end
	end
	SetTask(TASK_SANBA_AWARD,nDate);
	SetTask(TASK_SANBA_MAPID,nPos);
	SetTask(TASK_SANBA_TIME,GetTime());
	SetTask(TASK_SANBA_PIG,1);
	SetTask(TASK_SANBA_PETTIME,GetTime());
	AddItem(tSanbaAward[1][4],tSanbaAward[1][5],tSanbaAward[1][6],1);
	Talk(1,"","TÆng cho c¸c ng­¬i kinh nghiÖm phong phó vµ lîn con dÔ th­¬ng@^_^@Sau nöa tiÕng n÷a ®Õn chç ta! ( cã thÓ ®Õn tr­íc mét m×nh) cßn rÊt nhiÒu phÇn th­ëng. Nhí r»ng ta lµ B¸ch Hoa sø gi¶ cña thµnh nµy, ®i sai thµnh sÏ kh«ng nhËn ®­îc quµ.");	
end

function get_sanba_two()
	local nDate = tonumber(date("%Y%m%d"));
	local nPos = GetWorldPos();
	local nLv = GetLevel();
	local nSex = GetSex();
	local sName = GetName();
	local nType = GetTask(TASK_SANBA_PIG);
	local nTongxin = GetTask(TASK_SANBA_TONGXIN);
	
	if GetTask(TASK_SANBA_AWARD) >= nDate and GetTask(TASK_SANBA_TWO) >= nDate then
		Talk(1,"","Ng­¬i ®· nhËn tÊt c¶ phÇn th­ëng cña ngµy h«m nay råi.");
		return
	end
	if GetTask(TASK_SANBA_AWARD) < nDate then
		Talk(1,"get_sanba_one","LÊy quµ tr­íc råi h·y tíi ®©y.");
		return
	end
	if nPos ~= GetTask(TASK_SANBA_MAPID) then
		Talk(1,"","Ch¼ng ph¶i ng­¬i ®· lÊy quµ t¹i bæn thµnh råi sao?");
		return
	end
	if GetTime() - GetTask(TASK_SANBA_TIME) < SANBA_AWARD_TIME then
		Talk(1,"","§õng gÊp g¸p, dÉn tiÓu tr­ ®i ch¬i ®i!");
		return
	end  
	local nExp = floor(tSanbaAward[nType][nSex][3]*nLv^3/80^3);
	local nLingshiNum = 1;
	if nTongxin == 1 then
		nExp = nExp*3;
		nLingshiNum = nLingshiNum*3;
	end
	local nRandExp = random(1,100);
	if nRandExp >= 99 then
		nExp = nExp*3;
		nLingshiNum = nLingshiNum*3;
		Msg2Global("Chóc mõng "..sName.."Trong ho¹t ®éng mõng 8-3 nhËn ®­îc phÇn th­ëng kinh nghiÖm gÊp 3 lÇn");
	elseif nRandExp >= 96 then
		nExp = nExp*2;
		nLingshiNum = nLingshiNum*2;
		Msg2Global("Chóc mõng "..sName.."Trong ho¹t ®éng mõng 8-3 nhËn ®­îc phÇn th­ëng kinh nghiÖm gÊp 2 lÇn!");	
	end		
	if nLv ~= 99 then
		ModifyExp(nExp);
		Msg2Player("Chóc mõng b¹n nhËn ®­îc "..nExp.."Kinh nghiÖm");
		Talk(1,"","Chóc mõng nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm!");
	else
		for i=1,nLingshiNum do
			local nRand = random(1,6);
			lspf_AddLingShiInBottle(nRand,1);
			Msg2Player("Chóc mõng b¹n nhËn ®­îc "..nRand.." (cÊp) Linh th¹ch 1 viªn");
		end
	end
	SetTask(TASK_SANBA_TWO,nDate);
	SetTask(TASK_SANBA_TONGXIN,0);		
end

function sanba_deteil()
	Talk(1,"sanba_deteil2","§Ó chóc mõng lÔ 8-3, ta cã chót quµ män cho toµn bé nam n÷ giµ trÎ trong thµnh, vµo lóc 08:00—22:30 giê ngµy 8 vµ ngµy 9 th¸ng 3, cã thÓ ®Õn chç ta lÊy kinh nghiÖm vµ tiÓu tr­ thó nu«i. Tæ ®éi kh¸c giíi cã cÊp bËc cao cã thÓ nhËn ®­îc phÇn th­ëng cµng cao. Nöa tiÕng sau ®Õn chç B¸ch Hoa sø gi¶ lÊy phÇn th­ëng lÇn thø 1, phÇn th­ëng nhËn ®­îc cµng phong phó. PhÇn th­ëng trong ngµy cÇn hoµn tÊt l·nh trong ngµy. NÕu tÆng cho B¸ch Hoa sø gi¶ 1 viªn §ång T©m Hoµn, sÏ cã sù ng¹c nhiªn gÊp 3 lÇn. §ång thêi cßn cã c¬ héi nhËn ®­îc kinh nghiÖm gÊp 2 hoÆc gÊp 3 lÇn. ")
end

function sanba_deteil2()
	Talk(1,"","§¼ng cÊp nam + n÷ < cÊp 120, hai ng­êi nhËn ®­îc 1 thó nu«i tiÓu h¾c tr­.\n120<= ®¼ng cÊp nam + n÷ < cÊp 180, hai ng­êi nhËn ®­îc 1 thó nu«i tiÓu b¹ch tr­.\n§¼ng cÊp nam + n÷>= cÊp 180, hai ng­êi nhËn ®­îc 1 tiÓu kim tr­ thó nu«i.\n1 ng­êi chØ nhËn ®­îc tiÓu h¾c tr­, ng­êi ch¬i cÊp 99 nhËn ®­îc Linh th¹ch cÊp 1-6 ngÉu nhiªn.")
end

function about_shuangbei()
------------------³õÊ¼»¯Â¶Ë®Ğ§¹û------------------------
	local tItemInfo =
	{
		{2, 1, 1012, 7200, 150, "Bång Lai Tiªn Thñy",1},
		{2, 0, 109, 7200, 200, "Bång Lai Tiªn Lé",1.5},
		{2, 1, 1013, 7200, 300, "Bång Lai Tiªn §¬n",2},
		{2, 1, 1052, 7200, 120, "Bång Lai Lé Thñy",0},
	}
	for index, value in tItemInfo do
		InitXclSpeed(index, value[5])
	end
----------------------------------------------------------	
	local nTime = tonumber(date("%H"));
	if nTime < 12 or nTime >= 23 then
		Talk(1,"","<color=green>B¸ch Hoa sø gi¶<color>: Vµo lóc 12:00 tr­a-23:00 tèi ®Õn nhËn.");
		return
	end
	local strtab = {
		"Ta muèn nhËn /get_shuangbei",
		"T¹m thêi kh«ng nhËn/nothing"
		}
	Say("<color=green>B¸ch Hoa sø gi¶<color>:<color=yellow>14/6-15/6<color> mçi ng­êi mçi ngµy cã thÓ ®Õn chç ta nhËn <color=yellow>4h nh©n ®«i kinh nghiÖm vµ nh©n ®«i ®é cèng hiÕn s­ m«n nguyªn ngµy<color>,<color=red> chó ı, cã thÓ sÏ chuyÓn hiÖu qu¶ thêi gian nh©n ®«i cÊp cao hiÖn t¹i cña ng­¬i.<color>",
		getn(strtab),
		strtab)
end

function get_shuangbei()
	local nDate = tonumber(date("%Y%m%d"))
	if GetTask(542) >= nDate then
		Talk(1,"","<color=green>B¸ch Hoa sø gi¶<color>: Ng­¬i ®· nhËn phÇn th­ëng nh©n ®«i cña ngµy h«m nay, mçi ng­êi mçi ngµy chØ cã thÓ nhËn 1 lÇn.");
		return
	end
	local nType, nTime, nSpeed = GetExistXclInfo();
	if nTime > 0 then
		if nSpeed > 200 then
			Talk(1,"","<color=green>B¸ch Hoa sø gi¶<color>: HiÖn nay ng­¬i cã hiÖu qu¶ kinh nghiÖm m¹nh, kh«ng thÓ nhËn ®­îc.");
			return
		end
	end
	if GetTask(85) == nDate and GetTask(86) == 3 then
		Talk(1,"","<color=green>B¸ch Hoa sø gi¶<color>: HiÖn nay ng­¬i cã hiÖu qu¶ ®é cèng hiÕn s­ m«n m¹nh, kh«ng thÓ nhËn ®­îc. ");
		return
	end
	SetTask(542,nDate);
	local nRet = EatXcl(2,14400)
	if nRet == 1 then
		Msg2Player("B¹n nhËn ®­îc hiÖu qu¶ nh©n ®«i kinh nghiÖm");
	end	
	SetTask(85,nDate);
	SetTask(86,2);
	Msg2Player("Trong h«m nay ®é cèng hiÕn s­ m«n b¹n nhËn ®­îc t¨ng 2 lÇn");
end