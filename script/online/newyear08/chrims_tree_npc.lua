--08ĞÂÄêĞ¡Ê¥µ®Ê÷npc½Å±¾
--by vivi
--2007/11/12

Include("\\script\\online\\newyear08\\newyear08_head.lua");
Include("\\script\\lib\\lingshi_head.lua");

function main()
	local npcTreeIndex = GetTargetNpc();
	if GetTime()-GetTask(TASK_PLANT_TIME) > PLANT_LIFE_TIME or GetTask(TASK_PLANT_TIME) == 0 or npcTreeIndex ~= GetTask(TASK_CHRIMS_TREE_IDX) then
		Msg2Player("§©y kh«ng ph¶i c©y th«ng cña ng­¬i");
		return
	end
	local nDate = tonumber(date("%Y%m%d"));
	if GetTask(TASK_FINAL_AWARD) >= nDate then --·ÀÖ¹¿ç·şÁìÁË×îÖÕ½±Àø»¹ÄÜÔÙÁì
		return
	end
	local strtab = {
		"Trang trİ c©y th«ng/strew_chrims_tree",
		"NhËn phÇn th­ëng trang trİ c©y th«ng./get_chrims_award",
		"NhËn quµ gi¸ng sinh/get_final_award",
		"NhËn c©y th«ng/take_chrims_tree",
		"Xin ®îi gi©y l¸t råi ®Õn xem thö/nothing"
		};
	Say("C©y th«ng nµy rÊt ®Ñp, b¹n muèn?",
		getn(strtab),
		strtab);
end

function strew_chrims_tree()
	if GetTask(TASK_TREE_NUM) >= STREW_TREE_TOTAL then
		Talk(1,"main","C©y th«ng nµy ®Ñp råi kh«ng cÇn trang trİ.");
		return
	end
	local strtab1 = {
		"NhËn nhiÖm vô trang trİ c©y th«ng/get_chrims_task",
		"Quay ®Çu xem thö/nothing"
		};
	local strtab2 = {
		"Ta muèn trang trİ c©y th«ng/finish_chrims_task",
		"Ta thö t×m l¹i/nothing"
		};	
	local nNum = GetTask(TASK_TREE_NUM); --µÚ¼¸´ÎÈÎÎñ
	local nRand = GetTask(TASK_TABLE_IDX);
	if GetTask(TASK_IS_STREW) == 0 then
		if nNum ~= 0 and GetBit(GetTask(TASK_STEP_AWARD),nNum) == 0 then  --ÉÏÒ»´Î×°ÊÎÈÎÎñÎ´ÁìÈ¡½±Àø²»¸ø½ÓĞÂµÄÈÎÎñ
			Talk(1,"","B¹n thÊy ®­îc trªn c©y th«ng cã 1 «ng giµ c­êi víi b¹n, chØ vµo hép quµ trªn c©y, nh­ muèn b¹n sau khi nhËn <color=yellow>phÇn th­ëng trang trİ c©y th«ng<color> ®Õn xem thö");
		else 
			Say("B¹n thÊy c©y th«ng ch­a hoµn mü, muèn trang trİ l¹i. Muèn xem l¹i? B¹n ®· trang trİ xong<color=yellow>"..nNum.."<color> lÇn c©y th«ng, cã thÓ trang trİ l¹i <color=yellow>"..(STREW_TREE_TOTAL-nNum).."<color> lÇn.",
				getn(strtab1),
				strtab1);
		end
	else
		Say("B¹n muèn dïng <color=yellow>"..tStrewTask[nRand][1].."c¸i"..tStrewTask[nRand][2].." <color> ®Ó trang trİ c©y th«ng? Lo¹i nµy chØ cã ë <color=yellow>"..tStrewTask[nRand][6].."<color>-<color=yellow>"..tStrewTask[nRand][7].." <color>. B¹n ®· trang trİ xong <color=yellow>"..nNum.."<color> lÇn c©y th«ng, cã thÓ trang trİ l¹i <color=yellow>"..(STREW_TREE_TOTAL-nNum).."<color> lÇn.",
			getn(strtab2),
			strtab2);	
	end
end

function get_chrims_task()
	local nNum = GetTask(TASK_TREE_NUM);
	local nRand = random(1,getn(tStrewTask));
	SetTask(TASK_IS_STREW,1);
	SetTask(TASK_TABLE_IDX,nRand);
	Talk(1,"","B¹n chÊp nhËn nhiÖm vô trang trİ c©y th«ng, cÇn dïng <color=yellow>"..tStrewTask[nRand][1].."c¸i"..tStrewTask[nRand][2].." <color> ®Ó trang trİ, lo¹i nµy chØ cã ë chØ cã ë <color=yellow> "..tStrewTask[nRand][6].."<color>-<color=yellow>"..tStrewTask[nRand][7].." <color>. B¹n ®· trang trİ xong <color=yellow>"..nNum.."<color> lÇn c©y th«ng, cã thÓ trang trİ l¹i <color=yellow>"..(STREW_TREE_TOTAL-nNum).."<color> lÇn.");
end

function finish_chrims_task()
	local nNum = GetTask(TASK_TREE_NUM);
	local nRand = GetTask(TASK_TABLE_IDX);
	local nIdx = GetTask(TASK_CHRIMS_TREE_IDX);
	local MapID,MapX,MapY = GetWorldPos();
	if GetItemCount(tStrewTask[nRand][3],tStrewTask[nRand][4],tStrewTask[nRand][5]) < tStrewTask[nRand][1] then
		Talk(1,"","B¹n kh«ng cã <color=yellow>"..tStrewTask[nRand][1].."c¸i"..tStrewTask[nRand][2].."<color>, lo¹i nµy chØ cã ë <color=yellow>"..tStrewTask[nRand][6].."<color>-<color=yellow>"..tStrewTask[nRand][7].." <color>, nhanh chãng ®i t×m thö. B¹n ®· trang trİ xong <color=yellow>"..nNum.."<color> lÇn c©y th«ng, cã thÓ trang trİ l¹i <color=yellow>"..(STREW_TREE_TOTAL-nNum).."<color> lÇn.");
	else
		if DelItem(tStrewTask[nRand][3],tStrewTask[nRand][4],tStrewTask[nRand][5],tStrewTask[nRand][1]) == 1 then
			SetTask(TASK_TREE_NUM,GetTask(TASK_TREE_NUM)+1);
			SetTask(TASK_IS_STREW,0);
			SetTask(TASK_TABLE_IDX,0);
			SetNpcLifeTime(nIdx,0);
			SetNpcScript(nIdx,"");
			local nSharpIdx = random(1,4);
			SetTask(TASK_SHARP_IDX,nSharpIdx)
			local npcTreeIndex = CreateNpc(tTreeNpc[nNum+1][nSharpIdx][1],GetName().."-"..tTreeNpc[nNum+1][nSharpIdx][2],MapID,MapX,MapY);
			if npcTreeIndex == 0 then
				WriteLog("[C©y th«ng n¨m míi 08 bŞ lçi]:"..GetName().."Khi ®Æt c©y th«ng vµo, CreateNpc trŞ hµm sè quay l¹i lµ 0, trong hµm sè CreateNpc tham sè nhËp vµo lµ:"..tTreeNpc[nNum+1][nSharpIdx][1]..","..GetName().."-"..tTreeNpc[nNum+1][nSharpIdx][2]..","..MapID..","..MapX..","..MapY);
			end;
			SetNpcLifeTime(npcTreeIndex,PLANT_LIFE_TIME);
			SetTask(TASK_CHRIMS_TREE_IDX,npcTreeIndex);
			SetNpcScript(npcTreeIndex,"\\script\\online\\newyear08\\chrims_tree_npc.lua");			
			Talk(1,"","Sau khi <color=yellow>"..tStrewTask[nRand][2].."<color> trang trİ xong, qu¶ lµ tuyÖt ®Ñp. B¹n ®· trang trİ xong <color=yellow>"..(nNum+1).."<color> lÇn c©y th«ng, cã thÓ trang trİ l¹i <color=yellow>"..(STREW_TREE_TOTAL-nNum-1).."<color> lÇn.");
		end
	end
end

function get_chrims_award()
	local nLv = GetLevel();
	local nNum = GetTask(TASK_TREE_NUM);
	if nNum == 0 then
		Talk(1,"","B¹n vÉn ch­a trang trİ c©y th«ng?");
		return
	end
	local nExp = floor((tChrimsExp[nNum]*nLv^3)/(80^3));	
	if GetBit(GetTask(TASK_STEP_AWARD),nNum) ~= 0 then
		Talk(1,"","B¹n ®· nhËn quµ trang trİ lÇn nµy. 1");
	else
		--99¼¶¸ÄÎªÒ»Ñù¸øÓè¾­Ñé
		if nLv ~= 999 then
			SetBit(GetTask(TASK_STEP_AWARD),nNum,1);
			SetTask(TASK_STEP_AWARD,SetBit(GetTask(TASK_STEP_AWARD),nNum,1));
			ModifyExp(nExp);
			Msg2Player("B¹n nhËn ®­îc "..nExp.."Kinh nghiÖm");
		else
			if Zgc_pub_goods_add_chk(tChrimsLingshi[nNum][3],tChrimsLingshi[nNum][3]) ~= 1 then
				return
			end
			SetBit(GetTask(TASK_STEP_AWARD),nNum,1);
			SetTask(TASK_STEP_AWARD,SetBit(GetTask(TASK_STEP_AWARD),nNum,1));			
			for i = 1,tChrimsLingshi[nNum][3] do
				local nRand = random(tChrimsLingshi[nNum][1],tChrimsLingshi[nNum][2]);
				lspf_AddLingShiInBottle(nRand,1);
				Msg2Player("Chóc mõng b¹n nhËn ®­îc "..nRand.." (cÊp) Linh th¹ch, ®· ®­îc cho vµo Tô Linh §Ønh.");
			end
		end
	end
end

function take_chrims_tree()
	local nIdx = GetTask(TASK_CHRIMS_TREE_IDX);
	SetTask(TASK_IS_PLANT,0);
	SetTask(TASK_PLANT_TIME,0);
	SetNpcLifeTime(nIdx,0);
	SetNpcScript(nIdx,"");
	Talk(1,"","B¹n ®· nhËn c©y th«ng, cã thÓ trang trİ hoÆc nhËn quµ bÊt cø lóc nµo.");
end

function get_final_award()
	local nNum = GetTask(TASK_TREE_NUM);
	local nLv = GetLevel();
	local nExp = floor((tChrimsExp[11]*nLv^3)/(80^3));
	if nNum == 0 then
		if nLv >= 70 then
			Say("B¹n ch­a trang trİ c©y th«ng, quµ ngÉu nhiªn nhËn ®­îc lµ"..tChrimsLingshi[11][1].."-"..tChrimsLingshi[11][2].." (cÊp) Linh Th¹ch"..tChrimsLingshi[11][3].." , c©y th«ng sÏ biÕn mÊt. B¹n chÊp nhËn?",
				2,
				"§ång ı/confirm_get_award",
				"Ta chän sai råi!/main");
		else
			Talk(1,"","B¹n ch­a trang trİ c©y th«ng, ®¼ng cÊp kh«ng ®ñ cÊp 70, kh«ng cã quµ quµ gi¸ng sinh.");
			return
		end			
	elseif nNum < STREW_TREE_TOTAL then
		if nLv ~= 999 then
			Say("B¹n vÉn ch­a trang trİ xong c©y th«ng, quµ gi¸ng sinh nhËn ®­îc lµ <color=yellow>"..floor(nExp*nNum/STREW_TREE_TOTAL).." <color> kinh nghiÖm, c©y th«ng sÏ biÕn mÊt. B¹n chÊp nhËn quµ cuèi cïng?",
				2,
				"§ång ı/get_middle_award",
				"Ta chän sai råi!/main");
		else
			Say("B¹n vÉn ch­a trang trİ xong c©y th«ng, quµ ngÉu nhiªn nhËn ®­îc lµ"..tChrimsLingshi[11][1].."-"..tChrimsLingshi[11][2].." (cÊp) Linh Th¹ch"..tChrimsLingshi[11][3].." , c©y th«ng sÏ biÕn mÊt. B¹n chÊp nhËn?",
				2,
				"§ång ı/confirm_get_award",
				"Ta chän sai råi!/main");
		end			
	elseif nNum >= STREW_TREE_TOTAL then
		if nLv == 999 then
			Say("C©y th«ng nµy rÊt hoµn mü, quµ gi¸ng sinh ngÉu nhiªn nhËn ®­îc lµ"..tChrimsLingshi[13][1].."-"..tChrimsLingshi[13][2].." (cÊp) Linh Th¹ch"..tChrimsLingshi[13][3].." , 1 tuÇn léc gi¸ng sinh, 1 ngo¹i trang vµ Vâ L©m B¶o §iÓn, nhËn xong c©y th«ng sÏ biÕn mÊt. Sao h¶?",
				2,
				"§ång ı/get_last_award",
				"Ta chän sai råi!/main");
		else  --Ãâ·ÑÇøÎª¾­Ñé
			Say("C©y th«ng nµy ®· hoµn mü, quµ gi¸ng sinh nhËn ®­îc <color=yellow>"..nExp.." <color>kinh nghiÖm, "..tChrimsLingshi[13][1].."-"..tChrimsLingshi[13][2].." (cÊp) Linh Th¹ch"..tChrimsLingshi[13][3].." ngÉu nhiªn, 1 tuÇn léc gi¸ng sinh, 1 ngo¹i trang Vâ L©m B¶o §iÓn, sau khi nhËn c©y th«ng sÏ biÕn mÊt. B¹n chÊp nhËn mãn quµ cuèi cïng nµy?",
				2,
				"§ång ı/get_last_award",
				"Ta chän sai råi!/main");
		end			
	end		
end

function confirm_get_award()
	local nIdx = GetTask(TASK_CHRIMS_TREE_IDX);
	local nLv = GetLevel();
	local nDate = tonumber(date("%Y%m%d")); 
	if GetTask(TASK_FINAL_AWARD) >= nDate then --·ÀÖ¹¿ç·şÁìÁË×îÖÕ½±Àø»¹ÄÜÔÙÁì
		return
	end	
	if DelItem(2,0,574,1) == 1 then
		SetTask(TASK_IS_PLANT,0);
		SetTask(TASK_PLANT_TIME,0);
		SetTask(TASK_CHRIMS_TREE_IDX,0);
		SetTask(TASK_IS_STREW,0);
		SetTask(TASK_TREE_NUM,0);
		SetTask(TASK_TABLE_IDX,0);
		SetTask(TASK_STEP_AWARD,0);
		local nPlantNum = floor(GetTask(TASK_PLANT_NUM)/100);  
		if nPlantNum < nDate then    
			SetTask(TASK_PLANT_NUM,nDate*100+1);    --³õÊ¼»¯TASK_PLANT_NUM±äÁ¿¸ñÊ½
		else
			SetTask(TASK_PLANT_NUM,GetTask(TASK_PLANT_NUM)+1);  --½ñÌìÖÖµÚ2¿Ã
		end
		local nTodayNum = mod(GetTask(TASK_PLANT_NUM),100); --»ñÈ¡½ñÌìÖÖÁËµÚ¼¸¿ÃÊ÷
		if nTodayNum >= PLANT_TREE_NUM then
			SetTask(TASK_FINAL_AWARD,nDate);
		end
		SetNpcLifeTime(nIdx,0);
		SetNpcScript(nIdx,"");
		if nLv ~= 999 then	
			for i = 1,tChrimsLingshi[11][3] do
				local nRand = random(tChrimsLingshi[11][1],tChrimsLingshi[11][2]);
				lspf_AddLingShiInBottle(nRand,1);
				Msg2Player("Chóc mõng b¹n nhËn ®­îc "..nRand.." (cÊp) Linh th¹ch, ®· ®­îc cho vµo Tô Linh §Ønh.");
			end
		else
			for i = 1,tChrimsLingshi[12][3] do
				local nRand = random(tChrimsLingshi[12][1],tChrimsLingshi[12][2]);
				lspf_AddLingShiInBottle(nRand,1);
				Msg2Player("Chóc mõng b¹n nhËn ®­îc "..nRand.." (cÊp) Linh th¹ch, ®· ®­îc cho vµo Tô Linh §Ønh.");
			end
		end			
	else
		Talk(1,"","B¹n kh«ng cã c©y th«ng.");
	end
end	

function get_last_award()
	local nIdx = GetTask(TASK_CHRIMS_TREE_IDX);
	local nLv = GetLevel();
	local nBody = GetBody();
	local nDate = tonumber(date("%Y%m%d")); 
	if GetTask(TASK_FINAL_AWARD) >= nDate then --·ÀÖ¹¿ç·şÁìÁË×îÖÕ½±Àø»¹ÄÜÔÙÁì
		return
	end	
	if Zgc_pub_goods_add_chk(4,4) ~= 1 then
		return
	end	
	local nExp = floor((tChrimsExp[11]*nLv^3)/(80^3));
	local nLsNum = tChrimsLingshi[13][3];
	local nRandom = random(1,100);
	if nRandom <= 5 then
		nExp = nExp*2;
		nLsNum = nLsNum*2;
	end
	if nLv ~= 999 then
		if DelItem(2,0,574,1) == 1 then
			SetTask(TASK_IS_PLANT,0);
			SetTask(TASK_PLANT_TIME,0);
			SetTask(TASK_CHRIMS_TREE_IDX,0);
			SetTask(TASK_IS_STREW,0);
			SetTask(TASK_TREE_NUM,0);
			SetTask(TASK_TABLE_IDX,0);
			SetTask(TASK_STEP_AWARD,0);
			local nPlantNum = floor(GetTask(TASK_PLANT_NUM)/100);  
			if nPlantNum < nDate then    
				SetTask(TASK_PLANT_NUM,nDate*100+1);    --³õÊ¼»¯TASK_PLANT_NUM±äÁ¿¸ñÊ½
			else
				SetTask(TASK_PLANT_NUM,GetTask(TASK_PLANT_NUM)+1);  --½ñÌìÖÖµÚ2¿Ã
			end
			local nTodayNum = mod(GetTask(TASK_PLANT_NUM),100); --»ñÈ¡½ñÌìÖÖÁËµÚ¼¸¿ÃÊ÷
			if nTodayNum >= PLANT_TREE_NUM then
				SetTask(TASK_FINAL_AWARD,nDate);
			end
			SetNpcLifeTime(nIdx,0);
			SetNpcScript(nIdx,"");
			ModifyExp(nExp);
			Msg2Player("Chóc mõng b¹n nhËn ®­îc "..nExp.." ®iÓm kinh nghiÖm!");
			for i = 1,nLsNum do
				local nRand = random(1,1000);
				local nLsLv = 0;
				if nRand <= 895 then
					nLsLv = 5;
				elseif nRand <= 995 then
					nLsLv = 6;
				else
					nLsLv = 7;
				end
				lspf_AddLingShiInBottle(nLsLv,1);
				Msg2Player("Chóc mõng b¹n nhËn ®­îc "..nLsLv.." (cÊp) Linh th¹ch, ®· ®­îc cho vµo Tô Linh §Ønh.");
			end				
			if nRandom <= 5 then
				Msg2Global("Ng­êi ch¬i"..GetName().."Chóc mõng b¹n ®· nhËn ®­îc X­ng hiÖu ng«i sao gi¸ng sinh"..nExp.." ®iÓm kinh nghiÖm vµ 4 Linh th¹ch cÊp 1-7!");
			end
			local add_flag,add_idx = AddItem(0,105,35,1,1,-1,-1,-1,-1,-1,-1); --Ê¥µ®Â¹
			if add_flag == 1 then
				SetItemExpireTime(add_idx,86400); --ÉèÖÃÎïÆ·´æÔÚÊ±¼ä£¬µ¥Î»£ºs
				Msg2Player("Chóc mõng b¹n nhËn ®­îc 1tuÇn léc gi¸ng sinh ");
			else
				WriteLog("07 Ho¹t ®éng Gi¸ng sinh: Ng­êi ch¬i "..GetName().."NhËn tuÇn léc gi¸ng sinh thÊt b¹i, vŞ trİ thÊt b¹i:"..add_flag);
			end
			local nRandCloth = random(1,100);
			if nRandCloth <= tNewCloth[nBody][1][5] then
				AddItem(tNewCloth[nBody][1][2],tNewCloth[nBody][1][3],tNewCloth[nBody][1][4],1);
				Msg2Player("Chóc mõng b¹n nhËn ®­îc "..tNewCloth[nBody][1][1]);
			end
			local nRandClothTwo = random(1,100);
			if nRandClothTwo == tNewCloth[nBody][2][5] then
				AddItem(tNewCloth[nBody][2][2],tNewCloth[nBody][2][3],tNewCloth[nBody][2][4],1);
				Msg2Player("Chóc mõng b¹n nhËn ®­îc "..tNewCloth[nBody][2][1]);
			end
			local nRandThree = random(1,1000);
			if nRandThree <= 5 then
				local add_flag2 = AddItem(2,1,3206,1);
				if add_flag2 == 1 then
					Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Vâ L©m B¶o §iÓn");
					Msg2Global("Ng­êi ch¬i"..GetName().."Trong ho¹t ®éng gi¸ng sinh, trang trİ c©y th«ng tuyÖt ®Ñp. NhËn ®­îc 1 Vâ L©m B¶o §iÓn. Xin chóc mõng!");
				else		
					WriteLog("07 Ho¹t ®éng Gi¸ng sinh: Ng­êi ch¬i "..GetName().."NhËn Vâ L©m B¶o §iÓn thÊt b¹i, vŞ trİ thÊt b¹i:"..add_flag2);
				end
			end				
		else
			Talk(1,"","B¹n kh«ng cã c©y th«ng.");
		end
	else
		if Zgc_pub_goods_add_chk(4,4) ~= 1 then
			return
		end		
		if DelItem(2,0,574,1) == 1 then
			SetTask(TASK_IS_PLANT,0);
			SetTask(TASK_PLANT_TIME,0);
			SetTask(TASK_CHRIMS_TREE_IDX,0);
			SetTask(TASK_IS_STREW,0);
			SetTask(TASK_TREE_NUM,0);
			SetTask(TASK_TABLE_IDX,0);
			SetTask(TASK_STEP_AWARD,0);
			local nPlantNum = floor(GetTask(TASK_PLANT_NUM)/100);  
			if nPlantNum < nDate then    
				SetTask(TASK_PLANT_NUM,nDate*100+1);    --³õÊ¼»¯TASK_PLANT_NUM±äÁ¿¸ñÊ½
			else
				SetTask(TASK_PLANT_NUM,GetTask(TASK_PLANT_NUM)+1);  --½ñÌìÖÖµÚ2¿Ã
			end
			local nTodayNum = mod(GetTask(TASK_PLANT_NUM),100); --»ñÈ¡½ñÌìÖÖÁËµÚ¼¸¿ÃÊ÷
			if nTodayNum >= PLANT_TREE_NUM then
				SetTask(TASK_FINAL_AWARD,nDate);
			end
			SetNpcLifeTime(nIdx,0);
			SetNpcScript(nIdx,"");
			for i = 1,nLsNum do
				local nRand = random(tChrimsLingshi[13][1],tChrimsLingshi[13][2]);
				lspf_AddLingShiInBottle(nRand,1);
				Msg2Player("Chóc mõng b¹n nhËn ®­îc "..nRand.." (cÊp) Linh th¹ch, ®· ®­îc cho vµo Tô Linh §Ønh.");
			end					
			if nRandom <= 5 then
				Msg2Global("Ng­êi ch¬i"..GetName().."Trang søc c©y gi¸ng sinh ®Ñp qu¸, chóc mõng anh ta nhËn ®­îc danh hiÖu Ng«i sao gi¸ng sinh vµ 4 viªn Linh th¹ch cÊp 5-7!");
			end	
			local add_flag,add_idx = AddItem(0,105,35,1,1,-1,-1,-1,-1,-1,-1); --Ê¥µ®Â¹
			if add_flag == 1 then
				SetItemExpireTime(add_idx,86400); --ÉèÖÃÎïÆ·´æÔÚÊ±¼ä£¬µ¥Î»£ºs
				Msg2Player("Chóc mõng b¹n nhËn ®­îc 1tuÇn léc gi¸ng sinh ");
			else
				WriteLog("07 Ho¹t ®éng Gi¸ng sinh: Ng­êi ch¬i "..GetName().."NhËn tuÇn léc gi¸ng sinh thÊt b¹i, vŞ trİ thÊt b¹i:"..add_flag);
			end
			local nRandCloth = random(1,100);
			if nRandCloth <= tNewCloth[nBody][1][5] then
				AddItem(tNewCloth[nBody][1][2],tNewCloth[nBody][1][3],tNewCloth[nBody][1][4],1);
				Msg2Player("Chóc mõng b¹n nhËn ®­îc "..tNewCloth[nBody][1][1]);
			end
			local nRandClothTwo = random(1,100);
			if nRandClothTwo == tNewCloth[nBody][2][5] then
				AddItem(tNewCloth[nBody][2][2],tNewCloth[nBody][2][3],tNewCloth[nBody][2][4],1);
				Msg2Player("Chóc mõng b¹n nhËn ®­îc "..tNewCloth[nBody][2][1]);
			end
			local nRandThree = random(1,1000);
			if nRandThree <= 5 then
				local add_flag2 = AddItem(2,1,3206,1);
				if add_flag2 == 1 then
					Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Vâ L©m B¶o §iÓn");
					Msg2Global("Ng­êi ch¬i"..GetName().."Trong ho¹t ®éng gi¸ng sinh, trang trİ c©y th«ng tuyÖt ®Ñp. NhËn ®­îc 1 Vâ L©m B¶o §iÓn. Xin chóc mõng!");
				else		
					WriteLog("07 Ho¹t ®éng Gi¸ng sinh: Ng­êi ch¬i "..GetName().."NhËn Vâ L©m B¶o §iÓn thÊt b¹i, vŞ trİ thÊt b¹i:"..add_flag2);
				end
			end	
		else
			Talk(1,"","B¹n kh«ng cã c©y th«ng.");
		end
	end	
end
function get_middle_award()
  local nIdx = GetTask(TASK_CHRIMS_TREE_IDX);
	local nNum = GetTask(TASK_TREE_NUM);
	local nLv = GetLevel();
	local nExp = floor((tChrimsExp[11]*nLv^3)/(80^3));
	local nGiveExp = floor(nExp*nNum/STREW_TREE_TOTAL);
	local nDate = tonumber(date("%Y%m%d")); 
	if GetTask(TASK_FINAL_AWARD) >= nDate then --·ÀÖ¹¿ç·şÁìÁË×îÖÕ½±Àø»¹ÄÜÔÙÁì
		return
	end	
	if DelItem(2,0,574,1) == 1 then
		SetTask(TASK_IS_PLANT,0);
		SetTask(TASK_PLANT_TIME,0);
		SetTask(TASK_CHRIMS_TREE_IDX,0);
		SetTask(TASK_IS_STREW,0);
		SetTask(TASK_TREE_NUM,0);
		SetTask(TASK_TABLE_IDX,0);
		SetTask(TASK_STEP_AWARD,0);
		local nPlantNum = floor(GetTask(TASK_PLANT_NUM)/100);  
		if nPlantNum < nDate then    
			SetTask(TASK_PLANT_NUM,nDate*100+1);    --³õÊ¼»¯TASK_PLANT_NUM±äÁ¿¸ñÊ½
		else
			SetTask(TASK_PLANT_NUM,GetTask(TASK_PLANT_NUM)+1);  --½ñÌìÖÖµÚ2¿Ã
		end
		local nTodayNum = mod(GetTask(TASK_PLANT_NUM),100); --»ñÈ¡½ñÌìÖÖÁËµÚ¼¸¿ÃÊ÷
		if nTodayNum >= PLANT_TREE_NUM then
			SetTask(TASK_FINAL_AWARD,nDate);
		end
		SetNpcLifeTime(nIdx,0);
		SetNpcScript(nIdx,"");
		ModifyExp(nGiveExp);
		Msg2Player("Chóc mõng b¹n nhËn ®­îc "..nGiveExp.."Kinh nghiÖm");	
	else
		Talk(1,"","B¹n kh«ng cã c©y th«ng.");
	end					
end
