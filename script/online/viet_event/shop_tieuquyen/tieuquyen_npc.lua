-- Created by TuanNA5
-- 17-03-2010
-- Shop ti“n lŒ

Include("\\script\\online\\viet_event\\shop_tieuquyen\\shop_head.lua");

function talk_exchange()
	local tSay ={
		"DÔng Ng©n Phi’u cÒa D∑ T»u ÆÊi 20 Ti“n LŒ/#exchange_sliver(1)",
		"DÔng ßπi Ng©n Phi’u ÆÊi 105 Ti“n LŒ/#exchange_sliver(2)",
		"DÔng Ti“n LŒ ÆÊi Æi”m kinh nghi÷m/silver_2_exp",
--		"DÔng Ti“n LŒ ÆÊi vÀt ph»m/silver_2_item",
		"Ta chÿ gh– qua!/gf_DoNothing",	
	}
	Say("C∏c hπ c„ th” dÔng <color=yellow>Ti“n LŒ<color> Æ” ÆÊi c∏c vÀt ph»m c«n thi’t tπi Æ©y. <color=yellow>Ti“n LŒ<color> c„ th” ÆÊi bªng <color=yellow>ßπi Ng©n Phi’u, Ng©n Phi’u cÒa D∑ T»u mua tı Ng˘ C∏c<color>.",getn(tSay),tSay)
end
	
function silver_2_item()
	local tSay ={
		"ßÊi 5 Ti“n LŒ l y 1 Th∏i H≠ ßa MÀt Qu∂/#get_sliver_item(2)",
--		"ßÊi 5 Ti“n LŒ l y 1 Tµng Ki’m Anh HÔng Thi’p/#get_sliver_item(3)",
		"ßÊi 20 Ti“n LŒ l y 1 V®n C»m Hπp/#get_sliver_item(4)",
		"ßÊi 40 Ti“n LŒ l y 1 Thi™n Thπch Tinh Thπch/#get_sliver_item(1)",
		"ßÊi 160 Ti“n LŒ l y 1 Qu©n C´ng Huy Hoµng/#get_sliver_item(5)",
		"Ta chÿ gh– qua!/gf_DoNothing",	
	}	
	if IsTitleExist(51, 1) > 0 or IsTitleExist(51, 2) > 0 or IsTitleExist(51, 5) > 0 or IsTitleExist(51, 6) > 0 or IsTitleExist(51, 9) > 0 or IsTitleExist(51, 10) > 0 then
		tinsert(tSay,1,	"ßÊi 40 Ti“n LŒ l y 1 Hoµng Kim ßπi HÂng Bao (trËng)/#get_sliver_item(7)")
		tinsert(tSay,1,"ßÊi 15 Ti“n LŒ l y 1 Tˆ Kim HÂng Bao (trËng)/#get_sliver_item(6)")
	end	
	Say("C∏c hπ c„ th” dÔng <color=yellow>Ti“n LŒ<color> Æ” ÆÊi c∏c vÀt ph»m c«n thi’t tπi Æ©y. <color=yellow>Ti“n LŒ<color> c„ th” ÆÊi bªng <color=yellow>ßπi Ng©n Phi’u, Ng©n Phi’u cÒa D∑ T»u mua tı Ng˘ C∏c<color>.",getn(tSay),tSay)
end

function silver_2_exp()
	local tSay ={
		"ßÊi 1 Ti“n LŒ l y 240.000 kinh nghi÷m/#get_sliver_exp(1)",
		"ßÊi 5 Ti“n LŒ l y 1.200.000 kinh nghi÷m/#get_sliver_exp(2)",
		"ßÊi 25 Ti“n LŒ l y 6.000.000 kinh nghi÷m/#get_sliver_exp(3)",
		"ßÊi 125 Ti“n LŒ l y 30.000.000 kinh nghi÷m/#get_sliver_exp(4)",
		"ßÊi 250 Ti“n LŒ l y 62.500.000 kinh nghi÷m/#get_sliver_exp(5)",
		"ßÊi 500 Ti“n LŒ l y 125.000.000 kinh nghi÷m/#get_sliver_exp(6)",
		"ßÊi 1000 Ti“n LŒ l y 250.000.000 kinh nghi÷m/#get_sliver_exp(7)",
		"ßÊi 2000 Ti“n LŒ l y 500.000.000 kinh nghi÷m/#get_sliver_exp(8)",
		"Ta chÿ gh– qua!/gf_DoNothing",	
	}
	Say("C∏c hπ c„ th” dÔng <color=yellow>Ti“n LŒ<color> Æ” ÆÊi Æi”m kinh nghi÷m. Chÿ c„ th” ÆÊi Æ≠Óc nhi“u nh t <color=yellow>500.000.000 Æi”m kinh nghi÷m<color>.",getn(tSay),tSay)
end


function get_sliver_exp(nSelect)
	if nSelect == 0 then return end	
	local nCurExp = GetTask(TSK_SILVER_2_EXP)
	if nCurExp == 500000 then
		Talk(1,"","Bπn Æ∑ ÆÊi tËi Æa 500000000 Æi”m kinh nghi÷m!")
		return
	end
	if nCurExp + tSilver_Exp[nSelect][2] <= 500000 then
		if Check_Silver(tSilver_Exp[nSelect][1]) ~= 1 then
			Talk(1,"","Kh´ng ÆÒ Ti“n LŒ Æ” ÆÊi vÀt ph»m!")
			return
		end
		if DelItem(2,1,198,tSilver_Exp[nSelect][1]) == 1 then
			SetTask(TSK_SILVER_2_EXP,nCurExp + tSilver_Exp[nSelect][2])
			gf_EventGiveCustomAward(1,tSilver_Exp[nSelect][2] * 1000,1,"Shop Tien Le","ÆÊi")			
		end	
	else	
		Talk(1,"","ßi”m kinh nghi÷m t›ch lÚy v≠Ót qu∏ 500000000 Æi”m, h∑y ÆÊi m¯c th p h¨n!")
	end
end

function get_sliver_item(nSelect)
	if nSelect == 0 then return end	
	local nDay = tonumber(date("%d"))
	if gf_GetTaskByte(TASK_LIMIT_JUNGONG,1) ~= nDay then
		gf_SetTaskByte(TASK_LIMIT_JUNGONG,1,nDay)
		gf_SetTaskByte(TASK_LIMIT_JUNGONG,2,0)
	end
	if gf_GetTaskByte(TSK_EXCHANGE_HONGBAO,BYTE_EXCHANGE_HONGBAO_DATE) ~= nDay then
		gf_SetTaskByte(TSK_EXCHANGE_HONGBAO,BYTE_EXCHANGE_HONGBAO_DATE,nDay)
		gf_SetTaskByte(TSK_EXCHANGE_HONGBAO,BYTE_EXCHANGE_HONGBAO_SMALL,0)
		gf_SetTaskByte(TSK_EXCHANGE_HONGBAO,BYTE_EXCHANGE_HONGBAO_BIG,0)		
	end
	if Check_Silver(tSliver_Exchange[nSelect][1]) ~= 1 then
		Talk(1,"","Kh´ng ÆÒ Ti“n LŒ Æ” ÆÊi vÀt ph»m!")
		return
	end
	if gf_JudgeRoomWeight(2,100," ") == 0 then
		return
	end
	if nSelect == 5 then
		if gf_GetTaskByte(TASK_LIMIT_JUNGONG,2) >= 2 then
			Talk(1,"","H´m nay c∏c hπ Æ∑ ÆÊi Qu©n C´ng Huy Hoµng 2 l«n rÂi! Ngµy mai ÆÊi ti’p nh–!")
			return
		end
	elseif nSelect == 6 or nSelect == 7 then
		local nSmallCount = gf_GetTaskByte(TSK_EXCHANGE_HONGBAO,BYTE_EXCHANGE_HONGBAO_SMALL)
		local nBigCount = gf_GetTaskByte(TSK_EXCHANGE_HONGBAO,BYTE_EXCHANGE_HONGBAO_BIG)
		if nSmallCount >= 10 and nSelect == 6  then
			Talk(1,"","H´m nay c∏c hπ Æ∑ ÆÊi 10 l«n rÂi! Ngµy mai ÆÊi ti’p nh–!")
			return
		end
		if nBigCount >= 10 and nSelect == 7  then
			Talk(1,"","H´m nay c∏c hπ Æ∑ ÆÊi 10 l«n rÂi! Ngµy mai ÆÊi ti’p nh–!")
			return
		end		
	end
	if DelItem(2,1,198,tSliver_Exchange[nSelect][1]) == 1 then
		if nSelect == 5 then
			gf_SetTaskByte(TASK_LIMIT_JUNGONG,2,gf_GetTaskByte(TASK_LIMIT_JUNGONG,2) + 1)
		elseif nSelect == 6 then
			gf_SetTaskByte(TSK_EXCHANGE_HONGBAO,BYTE_EXCHANGE_HONGBAO_SMALL,gf_GetTaskByte(TSK_EXCHANGE_HONGBAO,BYTE_EXCHANGE_HONGBAO_SMALL) + 1)
		elseif nSelect == 7 then
			gf_SetTaskByte(TSK_EXCHANGE_HONGBAO,BYTE_EXCHANGE_HONGBAO_BIG,gf_GetTaskByte(TSK_EXCHANGE_HONGBAO,BYTE_EXCHANGE_HONGBAO_BIG) + 1)		
		end
		gf_AddItemEx2(tSliver_Exchange[nSelect][3],tSliver_Exchange[nSelect][2],"Shop Tien Le","ÆÊi",tSliver_Exchange[nSelect][4])	
	end
end


function exchange_sliver(nSelect)
	if nSelect == 0 then return end	
	if gf_JudgeRoomWeight(2,100," ") == 0 then
		return
	end
	if nSelect == 1 then
		if GetItemCount(2,0,1) < 1 then
			Talk(1,"","H◊nh nh≠ c∏c hπ kh´ng mang theo Ng©n Phi’u cÒa D∑ T»u trong ng≠Íi!")
			return
		end
		if DelItem(2,0,1,1) ==1 then
			gf_AddItemEx2({2,1,198,EXCHANGE_RATE},"Ti“n LŒ","Shop Tien Le","ÆÊi")
		end	
	elseif nSelect == 2 then
		if GetItemCount(2,1,199) < 1 then
			Talk(1,"","H◊nh nh≠ c∏c hπ kh´ng mang theo ßπi Ng©n Phi’u trong ng≠Íi!")
			return
		end
		if DelItem(2,1,199,1) ==1 then
			gf_AddItemEx2({2,1,198,BIG_EXCHANGE_RATE},"Ti“n LŒ","Shop Tien Le","ÆÊi")
		end	
	else
		return
	end
end
