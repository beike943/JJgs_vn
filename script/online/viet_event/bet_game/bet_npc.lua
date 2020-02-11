-- C¸ ®é BHTA lÇn 3
-- Created by TuanNA5

Include("\\script\\online\\viet_event\\bet_game\\bet_head.lua")

function bet_select()
	if GetLevel() < 73 then
		Say(szNpcName.."§¼ng cÊp 73 trë lªn míi cã thÓ tham gia ho¹t ®éng!",0)
		return
	end
	local tSay = {
--		"\nTham gia dù ®o¸n kÕt qu¶ Bang Héi Tinh Anh lÇn 3/bet_join",
		"\nNhËn th­ëng dù ®o¸n kÕt qu¶ Bang Héi Tinh Anh lÇn 3/bet_prize",
		"\nNhËn TiÒn LÎ ®· tróng th­ëng (tèi ®a 1000 TiÒn LÎ 1 lÇn)/get_silver_win",
		"\nTa biÕt råi/gf_DoNothing",
	}
	Say(szNpcName.."Nh©n dÞp <color=yellow>Bang Héi Tinh Anh lÇn 3<color>, ta tæ chøc cuéc thi dù ®o¸n kÕt qu¶ cho c¸c b»ng h÷u gÇn xa tham dù. C¸c b»ng h÷u cã thÓ ®Æt nhiÒu nhÊt <color=yellow>100 TiÒn LÎ<color> cho mçi kÕt qu¶ dù ®o¸n. Sau b¶o tr× thø t­ hµng tuÇn c¸c b»ng h÷u cã thÓ ®Õn chç ta nhËn th­ëng nÕu dù ®o¸n ®óng kÕt qu¶. <color=red>L­u ý: mçi kÕt qu¶ chØ ®­îc phÐp dù ®o¸n 1 lÇn duy nhÊt.<color> ",getn(tSay),tSay)
end

function bet_join()
	local tSay = {
		"\nDù ®o¸n c¸c trËn ngµy Thø B¶y 03-04 (thêi h¹n dù ®o¸n 24 giê Thø S¸u 02-04)/bet_select_1",
		"\nDù ®o¸n c¸c trËn ngµy Chñ NhËt 04-04 (thêi h¹n dù ®o¸n 24 giê Thø B¶y 03-04)/bet_select_2",
		"\nDù ®o¸n c¸c trËn ngµy Thø B¶y 10-04 (thêi h¹n dù ®o¸n 24 giê Thø S¸u 09-04)/bet_select_3",
		"\nDù ®o¸n c¸c trËn vßng Chung KÕt (thêi h¹n dù ®o¸n 24 giê Thø S¸u 16-04)/bet_select_4",
		"\n§Ó ta suy nghÜ/gf_DoNothing",
	}
	Say(szNpcName.."B»ng h÷u cã thÓ ®Æt nhiÒu nhÊt <color=yellow>100 TiÒn LÎ<color> cho mçi kÕt qu¶ dù ®o¸n.",getn(tSay),tSay)
end

function bet_prize()
	local nDate = tonumber(date("%Y%m%d%H"))
	if nDate > 2010050724 then
		Talk(1,"bet_select",szNpcName.."Thêi h¹n nhËn th­ëng ®· hÕt!")
		return
	end
	local tSay = {	}
	if nDate >= 2010040708 then
		tinsert(tSay,"\nNhËn th­ëng c¸c trËn ngµy Thø B¶y 03-04 (thêi h¹n nhËn th­ëng 24 giê Thø S¸u 07-05)/#bet_prize_select(1)")
		tinsert(tSay,"\nNhËn th­ëng c¸c trËn ngµy Chñ NhËt 04-04 (thêi h¹n nhËn th­ëng 24 giê Thø S¸u 07-05)/#bet_prize_select(2)")
	end
	if nDate >= 2010041408 then
		tinsert(tSay,"\nNhËn th­ëng c¸c trËn ngµy Thø B¶y 10-04 (thêi h¹n nhËn th­ëng 24 giê Thø S¸u 07-05)/#bet_prize_select(3)")
	end
	if nDate >= 2010041500 then
		tinsert(tSay,"\nNhËn l¹i TiÒn LÎ dù ®o¸n c¸c trËn Chung KÕt (thêi h¹n nhËn th­ëng 24 giê Thø S¸u 07-05)/#bet_prize_select(4)")
	end
	tinsert(tSay,"\n§Ó ta suy nghÜ/gf_DoNothing")
	Say(szNpcName.."B»ng h÷u nhËn th­ëng dù ®o¸n nµo?",getn(tSay),tSay)
end

function bet_select_1()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate > 20100402 then
		Talk(1,"bet_select",szNpcName.."Thêi h¹n dù ®o¸n ®· hÕt. Mêi b»ng h÷u chän dù ®o¸n kÕt qu¶ kh¸c!")
		return
	end
	local tSay = {
		"Tªn 16 ®éi lät vµo 1-16 (tû lÖ 1 tróng 96)/#bet_select_confirm(1)",
		"Tªn 2 ®éi chiÕn th¾ng ë b¶ng A ngµy Thø B¶y 03-04 (tû lÖ 1 tróng 2)/#bet_select_confirm(2)",
		"Tªn 2 ®éi chiÕn th¾ng ë b¶ng B ngµy Thø B¶y 03-04 (tû lÖ 1 tróng 2)/#bet_select_confirm(3)",
		"Tªn 2 ®éi chiÕn th¾ng ë b¶ng C ngµy Thø B¶y 03-04 (tû lÖ 1 tróng 2)/#bet_select_confirm(4)",
		"Tªn 2 ®éi chiÕn th¾ng ë b¶ng D ngµy Thø B¶y 03-04 (tû lÖ 1 tróng 2)/#bet_select_confirm(5)",
		"Tªn 2 ®éi chiÕn th¾ng ë b¶ng E ngµy Thø B¶y 03-04 (tû lÖ 1 tróng 2)/#bet_select_confirm(6)",
		"Tªn 2 ®éi chiÕn th¾ng ë b¶ng F ngµy Thø B¶y 03-04 (tû lÖ 1 tróng 2)/#bet_select_confirm(7)",
		"Tªn 2 ®éi chiÕn th¾ng ë b¶ng G ngµy Thø B¶y 03-04 (tû lÖ 1 tróng 2)/#bet_select_confirm(8)",
		"Tªn 2 ®éi chiÕn th¾ng ë b¶ng H ngµy Thø B¶y 03-04 (tû lÖ 1 tróng 2)/#bet_select_confirm(9)",
		"§Ó ta suy nghÜ/gf_DoNothing",
	}
	Say(szNpcName.."B»ng h÷u dù ®o¸n kÕt qu¶ nµo?",getn(tSay),tSay)
end

function bet_select_2()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate > 20100403 then
		Talk(1,"bet_select",szNpcName.."Thêi h¹n dù ®o¸n ®· hÕt. Mêi b»ng h÷u chän dù ®o¸n kÕt qu¶ kh¸c!")
		return
	end
	local tSay = {
		"Tªn 8 ®éi lät vµo vßng 1-8 (tû lÖ 1 tróng 32)/#bet_select_confirm(10)",
		"Tªn 2 ®éi chiÕn th¾ng ë b¶ng A ngµy Chñ NhËt 04-04 (tû lÖ 1 tróng 2)/#bet_select_confirm(11)",
		"Tªn 2 ®éi chiÕn th¾ng ë b¶ng B ngµy Chñ NhËt 04-04 (tû lÖ 1 tróng 2)/#bet_select_confirm(12)",
		"Tªn 2 ®éi chiÕn th¾ng ë b¶ng C ngµy Chñ NhËt 04-04 (tû lÖ 1 tróng 2)/#bet_select_confirm(13)",
		"Tªn 2 ®éi chiÕn th¾ng ë b¶ng D ngµy Chñ NhËt 04-04 (tû lÖ 1 tróng 2)/#bet_select_confirm(14)",
		"Tªn 2 ®éi chiÕn th¾ng ë b¶ng E ngµy Chñ NhËt 04-04 (tû lÖ 1 tróng 2)/#bet_select_confirm(15)",
		"Tªn 2 ®éi chiÕn th¾ng ë b¶ng F ngµy Chñ NhËt 04-04 (tû lÖ 1 tróng 2)/#bet_select_confirm(16)",
		"Tªn 2 ®éi chiÕn th¾ng ë b¶ng G ngµy Chñ NhËt 04-04 (tû lÖ 1 tróng 2)/#bet_select_confirm(17)",	
		"Tªn 2 ®éi chiÕn th¾ng ë b¶ng H ngµy Chñ NhËt 04-04 (tû lÖ 1 tróng 2)/#bet_select_confirm(18)",
		"§Ó ta suy nghÜ/gf_DoNothing",
	}
	Say(szNpcName.."B»ng h÷u dù ®o¸n kÕt qu¶ nµo?",getn(tSay),tSay)
end

function bet_select_3()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate > 20100409 then
		Talk(1,"bet_select",szNpcName.."Thêi h¹n dù ®o¸n ®· hÕt. Mêi b»ng h÷u chän dù ®o¸n kÕt qu¶ kh¸c!")
		return
	end
	local tSay = {
		"Tªn 4 ®éi lät vµo Chung kÕt Cao CÊp (tû lÖ 1 tróng 12)/#bet_select_confirm(19)",	
		"Tªn 4 ®éi lät vµo Chung KÕt Siªu CÊp (tû lÖ 1 tróng 12)/#bet_select_confirm(20)",
		"Tªn 2 ®éi chiÕn th¾ng ë §Êu Tr­êng 1 ngµy Thø B¶y 10-04  (tû lÖ 1 tróng 2)/#bet_select_confirm(21)",
		"Tªn 2 ®éi chiÕn th¾ng ë §Êu Tr­êng 2 ngµy Thø B¶y 10-04 (tû lÖ 1 tróng 2)/#bet_select_confirm(22)",
		"Tªn 2 ®éi chiÕn th¾ng ë §Êu Tr­êng 3 ngµy Thø B¶y 10-04 (tû lÖ 1 tróng 2)/#bet_select_confirm(23)",
		"Tªn 2 ®éi chiÕn th¾ng ë §Êu Tr­êng 4 ngµy Thø B¶y 10-04 (tû lÖ 1 tróng 2)/#bet_select_confirm(24)",
		"§Ó ta suy nghÜ/gf_DoNothing",
	}
	Say(szNpcName.."B»ng h÷u dù ®o¸n kÕt qu¶ nµo?",getn(tSay),tSay)
end

function bet_select_4()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate > 20100416 then
		Talk(1,"bet_select",szNpcName.."Thêi h¹n dù ®o¸n ®· hÕt. Mêi b»ng h÷u chän dù ®o¸n kÕt qu¶ kh¸c!")
		return
	end
	local tSay = {
		"Tªn 2 ®éi tranh nhÊt - nh× Cao CÊp	(tû lÖ 1 tróng 4)/#bet_select_confirm(25)",	
		"Tªn 2 ®éi ®¹t h¹ng ba - t­ Cao CÊp (tû lÖ 1 tróng 4)/#bet_select_confirm(26)",	
		"Tªn 2 ®éi tranh nhÊt - nh× Siªu CÊp (tû lÖ 1 tróng 4)/#bet_select_confirm(27)",	
		"Tªn 2 ®éi ®¹t h¹ng ba - t­ Siªu CÊp (tû lÖ 1 tróng 4)/#bet_select_confirm(28)",	
		"Tªn ®éi v« ®Þch Cao CÊp Bang Héi Tinh Anh lÇn 3 (tû lÖ 1 tróng 8)/#bet_select_confirm(29)",	
		"Tªn ®éi v« ®Þch Siªu CÊp Bang Héi Tinh Anh lÇn 3 (tû lÖ 1 tróng 8)/#bet_select_confirm(30)",	
		"§Ó ta suy nghÜ/gf_DoNothing",
	}
	Say(szNpcName.."B»ng h÷u dù ®o¸n kÕt qu¶ nµo?",getn(tSay),tSay)
end

function bet_select_confirm(nType)
	if gf_GetTaskBit(TSK_SELECT_TYPE,nType) == 1 then
		Say(szNpcName.."B»ng h÷u ®· tham gia dù ®o¸n kÕt qu¶ nµy råi!",2,format("Xem kÕt qu¶ ®· chän/#view_selected(%d)",nType),"Ta biÕt råi!/gf_DoNothing")
		return
	end
	SetTaskTemp(TSK_TEAM_LIST_1,0)
	SetTaskTemp(TSK_TEAM_LIST_2,0)
	SetTaskTemp(TSK_TMP_SELECT_COUNT,0)
	SetTaskTemp(TSK_TMP_CHOICE,nType)
	get_team(1,6,nType)
end

function get_team(nPage,nStep,nType)
	local tSay = {}
	local nCount = GetTaskTemp(TSK_TMP_SELECT_COUNT)
	local nMaxRow = getn(tServerName)
	local nNextPage = nPage + nStep
	
	if nNextPage > nMaxRow then
		nNextPage = nMaxRow
	end
	
	if nNextPage < 1 then
		nNextPage = 1
	end
	
	if nStep <= 0 then
		local nTemp = nPage
		nPage = nNextPage
		nNextPage = nTemp
	end
	
	for i=nPage,nNextPage do
		tinsert(tSay,format("%s/#select_team(%d,%d,%d)",tServerName[i][2],tServerName[i][1],nType,nPage))
	end
	
	if nNextPage < nMaxRow then
		tinsert(tSay,format("Xem trang sau/#get_team(%d,%d,%d)",nNextPage + 1,6,nType))
	end
	if nPage > 1 then
		tinsert(tSay,format("Xem trang tr­íc/#get_team(%d,%d,%d)",nPage - 1,-6,nType))
	end
	
	tinsert(tSay,"T¹i h¹ chØ ghÐ ngang!/gf_DoNothing")
	
	if nCount == tTaskByteBet[nType][4] then
		bet_select_confirm_final(tTaskByteBet[nType][4])	
		return
	end
	
	nCount = nCount + 1
	Say(szNpcName.."Chän ®éi thø <color=yellow>"..nCount.."<color>",getn(tSay),tSay)	
end

function select_team(nTeamBit,nType,nPage)
	local nTeamTask = TSK_TEAM_LIST_1
	if nTeamBit > 31 then -- L­u ®­îc tèi ®a 31 bit, bit 32 l­u trÞ sè ©m
		nTeamBit = nTeamBit - 31
		nTeamTask = TSK_TEAM_LIST_2
	end	
	if gf_GetTaskTempBit(nTeamTask,nTeamBit) == 1 then
		Say(szNpcName.."B»ng h÷u ®· chän ®éi nµy råi!",1,format("§Ó ta chän l¹i/#get_team(1,6,%d)",nType))
		return
	end	
	SetTaskTemp(TSK_TMP_SELECT_COUNT,GetTaskTemp(TSK_TMP_SELECT_COUNT) + 1)
	gf_SetTaskTempBit(nTeamTask,nTeamBit,1)	
	get_team(nPage,6,nType)
end

function bet_select_confirm_final(nLimitedCount)
	if GetTaskTemp(TSK_TMP_SELECT_COUNT) ~= nLimitedCount then
		return
	end
	
	local nType = GetTaskTemp(TSK_TMP_CHOICE)
	if gf_GetTaskBit(TSK_SELECT_TYPE,nType) == 1 then
		Talk(1,"bet_join",szNpcName.."B»ng h÷u ®· tham gia dù ®o¸n kÕt qu¶ nµy råi!")
		return
	end
	
	local strTeamList = ""
	for i=1,31 do
		if gf_GetTaskTempBit(TSK_TEAM_LIST_1,i) == 1 then
			strTeamList = strTeamList..tServerName[i][2]..","
		end
	end	
	for i=32,48 do
		if gf_GetTaskTempBit(TSK_TEAM_LIST_2,i-31) == 1 then
			strTeamList = strTeamList..tServerName[i][2]..","
		end
	end
	
	Say(szNpcName.."B»ng h÷u ®· chän "..nLimitedCount.." ®éi <color=yellow>"..strTeamList.."<color>. §ång ý chø?",2,"Ta ®ång ý!/bet_select_confirm_final_put","Ta muèn chän l¹i/bet_join")
end

function bet_select_confirm_final_put()
	AskClientForNumber("bet_select_confirm_final_ok",1,100,"NhËp sè TiÒn LÎ")
end

function bet_select_confirm_final_ok(nSilver)	
	local nType = GetTaskTemp(TSK_TMP_CHOICE)
	if gf_GetTaskBit(TSK_SELECT_TYPE,nType) == 1 then
		Talk(1,"bet_join",szNpcName.."B»ng h÷u ®· tham gia dù ®o¸n kÕt qu¶ nµy råi!")
		return
	end
	if nSilver > 100 then
		return
	end
	if GetItemCount(2,1,198) < nSilver then
		Talk(1,"bet_join",szNpcName.."H×nh nh­ b»ng h÷u kh«ng mang ®ñ TiÒn LÎ?")
		return
	end
	if  DelItem(2,1,198,nSilver) == 1 then
		if nType == 1 or nType == 10 then
			SetTask(tTaskByteControl[nType][1],GetTaskTemp(TSK_TEAM_LIST_1))
			WriteLogEx("Vui Cung BHTA","Dù ®o¸n Type "..nType,GetTask(tTaskByteControl[nType][1]))
			SetTask(tTaskByteControl[nType][2],GetTaskTemp(TSK_TEAM_LIST_2))
			WriteLogEx("Vui Cung BHTA","Dù ®o¸n Type "..nType,GetTask(tTaskByteControl[nType][2]),nSilver)
		else
			local nCountValue = 0
			for i=1,31 do
				if gf_GetTaskTempBit(TSK_TEAM_LIST_1,i) == 1 then
					if gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][2]) == 0 then
						gf_SetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][2],i)						
						nCountValue = nCountValue + 1
						WriteLogEx("Vui Cung BHTA","Dù ®o¸n Type "..nType,gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][2]),nSilver)
						if nType == 29 or nType == 30 then
							break
						end
					elseif gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][3]) == 0 then
						gf_SetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][3],i)						
						nCountValue = nCountValue + 1
						WriteLogEx("Vui Cung BHTA","Dù ®o¸n Type "..nType,gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][3]),nSilver)
					else
						if nType == 19 or nType == 20 then
							if gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][4]) == 0 then
								gf_SetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][4],i)								
								nCountValue = nCountValue + 1
								WriteLogEx("Vui Cung BHTA","Dù ®o¸n Type "..nType,gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][4]),nSilver)
							elseif gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][5]) == 0 then
								gf_SetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][5],i)								
								nCountValue = nCountValue + 1
								WriteLogEx("Vui Cung BHTA","Dù ®o¸n Type "..nType,gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][5]),nSilver)
							end
						end
					end
				end
			end
			if nCountValue < 4 then
				for i=32,48 do
					if gf_GetTaskTempBit(TSK_TEAM_LIST_2,i-31) == 1 then
						if gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][2]) == 0 then
							gf_SetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][2],i)
							WriteLogEx("Vui Cung BHTA","Dù ®o¸n Type "..nType,gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][2]),nSilver)
							if nType == 29 or nType == 30 then
								break
							end						
						elseif gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][3]) == 0 then
							gf_SetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][3],i)
							WriteLogEx("Vui Cung BHTA","Dù ®o¸n Type "..nType,gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][3]),nSilver)	
						else
							if nType == 19 or nType == 20 then
								if gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][4]) == 0 then
									gf_SetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][4],i)	
									WriteLogEx("Vui Cung BHTA","Dù ®o¸n Type "..nType,gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][4]),nSilver)	
								elseif gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][5]) == 0 then
									gf_SetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][5],i)									
									WriteLogEx("Vui Cung BHTA","Dù ®o¸n Type "..nType,gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][5]),nSilver)	
								end
							end						
						end
					end
				end
			end
		end		
		SetTaskTemp(TSK_TMP_SELECT_COUNT,0)		
		SetTaskTemp(TSK_TEAM_LIST_1,0)
		SetTaskTemp(TSK_TEAM_LIST_2,0)
		gf_SetTaskBit(TSK_SELECT_TYPE,nType,1)
		gf_SetTaskByte(tTaskByteBet[nType][1],tTaskByteBet[nType][2],nSilver)	
		Talk(1,"",szNpcName.."B»ng h÷u ®· ®Æt c­îc thµnh c«ng. Chóc b»ng h÷u may m¾n!") 
	end
end

function bet_prize_select(nPrizeType)	
	local nWinTotal = 0
	local tPrize = {
							{1,9},
							{10,18},
							{19,24},
							{25,30},				
						}
	for k=tPrize[nPrizeType][1],tPrize[nPrizeType][2] do
		if tWinner[k][1] ~= -1 then		
			if gf_GetTaskBit(TSK_SELECT_TYPE,k) == 1 then
				local nSilverCount = gf_GetTaskByte(tTaskByteBet[k][1],tTaskByteBet[k][2])
				local nMatchResult = 1
				if k == 1 or k == 10 then
					for i=1, 31 do
						if gf_GetTaskBit(tTaskByteControl[k][1],i) ==1 then
							if check_win(tWinner[k],i) == 0 then
								nMatchResult = 0
								break;
							end				
						end
					end
					for i=32,48 do
						if gf_GetTaskBit(tTaskByteControl[k][2],i-31) == 1 then
							if check_win(tWinner[k],i) == 0 then
								nMatchResult = 0
								break;
							end	
						end
					end		
					if nMatchResult == 1 then
						nWinTotal = nWinTotal + nSilverCount * tTaskByteBet[k][3]
						gf_SetTaskByte(tTaskByteBet[k][1],tTaskByteBet[k][2],0)
						SetTask(tTaskByteControl[k][1],0)
						SetTask(tTaskByteControl[k][2],0)
						SetTask(TSK_SILVER_WIN,GetTask(TSK_SILVER_WIN) + nSilverCount *  tTaskByteBet[k][3])
						WriteLogEx("Vui Cung BHTA","Tróng Type "..k,nSilverCount *  tTaskByteBet[k][3])	
					end
				else								
					if k == 19 or k == 20 then
						if check_win(tWinner[k],gf_GetTaskByte(tTaskByteControl[k][1],tTaskByteControl[k][2])) == 0 or check_win(tWinner[k],gf_GetTaskByte(tTaskByteControl[k][1],tTaskByteControl[k][3]))  == 0  or check_win(tWinner[k],gf_GetTaskByte(tTaskByteControl[k][1],tTaskByteControl[k][4])) == 0 or check_win(tWinner[k],gf_GetTaskByte(tTaskByteControl[k][1],tTaskByteControl[k][5]))  == 0  then
							nMatchResult = 0
						end	
					elseif k == 29 or k== 30 then
						if check_win(tWinner[k],gf_GetTaskByte(tTaskByteControl[k][1],tTaskByteControl[k][2])) == 0  then
							nMatchResult = 0
						end
					else
						if check_win(tWinner[k],gf_GetTaskByte(tTaskByteControl[k][1],tTaskByteControl[k][2])) == 0 or check_win(tWinner[k],gf_GetTaskByte(tTaskByteControl[k][1],tTaskByteControl[k][3]))  == 0  then
							nMatchResult = 0
						end				
					end
					if nMatchResult == 1 then
						nWinTotal = nWinTotal + nSilverCount * tTaskByteBet[k][3]
						gf_SetTaskByte(tTaskByteBet[k][1],tTaskByteBet[k][2],0)
						gf_SetTaskByte(tTaskByteControl[k][1],tTaskByteControl[k][2],0)
						if nType ~= 29 and nType ~= 30 then
							gf_SetTaskByte(tTaskByteControl[k][1],tTaskByteControl[k][3],0)		
						end
						if k == 19 or k == 20 then					
							gf_SetTaskByte(tTaskByteControl[k][1],tTaskByteControl[k][4],0)
							gf_SetTaskByte(tTaskByteControl[k][1],tTaskByteControl[k][5],0)		
						end			
						SetTask(TSK_SILVER_WIN,GetTask(TSK_SILVER_WIN) + nSilverCount *  tTaskByteBet[k][3])
						WriteLogEx("Vui Cung BHTA","Tróng Type "..k,nSilverCount *  tTaskByteBet[k][3])	
					end			
				end
			end
		end
	end
		
	if nWinTotal > 0 then
		Say(szNpcName.."Chóc mõng b»ng h÷u nhËn ®­îc <color=yellow>"..nWinTotal.." TiÒn LÎ<color>! B»ng h÷u cã <color=yellow>"..GetTask(TSK_SILVER_WIN).." TiÒn LÎ<color> ch­a rót ra!",0)
	else
		Say(szNpcName.."B»ng h÷u kh«ng dù ®o¸n ®óng kÕt qu¶ nµo hoÆc ch­a cã kÕt qu¶ thi ®Êu hoÆc ®· nhËn th­ëng råi!",0)
	end
end

function check_win(tResult, nTeam)	
	for i=1,getn(tResult) do
		if tResult[i] == nTeam then
			return 1
		end
	end
	return 0
end

function get_silver_win()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate > 20100507 then
		Talk(1,"bet_select",szNpcName.."Thêi h¹n nhËn th­ëng ®· hÕt!")
		SetTask(TSK_SILVER_WIN,0)
		return
	end
	local nSilverWin = GetTask(TSK_SILVER_WIN)
	Say(szNpcName.."B»ng h÷u hiÖn cã <color=yellow>"..nSilverWin.." TiÒn LÎ<color> ë chç ta. Cã muèn rót ra kh«ng?",2,"Ta muèn lÊy/get_silver_won_confirm","§Ó ta suy nghÜ/gf_DoNothing")
end

function get_silver_won_confirm()
	AskClientForNumber("get_silver_won_confirm_ok",1,1000,"NhËp sè TiÒn LÎ")	
end

function get_silver_won_confirm_ok(nNumber)
	local nSilverWin = GetTask(TSK_SILVER_WIN)
	if nNumber > nSilverWin then
		Say(szNpcName.."B»ng h÷u cã nhÇm lÉn kh«ng? H×nh nh­ sè TiÒn LÎ muèn rót lín h¬n sè ta gi÷!",0)
		return
	end
	local nCanTake = 0
	if nSilverWin > 0 then
		if nNumber < 1000 then
			nCanTake = nNumber
		else
			nCanTake = 1000
		end
		local nRoomNeeded = floor(nCanTake/100)
		if gf_Judge_Room_Weight(nRoomNeeded + 2,150*nRoomNeeded,szNpcName) == 0 then
			return
		end		
		SetTask(TSK_SILVER_WIN, GetTask(TSK_SILVER_WIN) - nCanTake)
		gf_AddItemEx2({2,1,198,nCanTake},"TiÒn LÎ","Vui Cung BHTA","rót ra")	
	else
		Say(szNpcName.."B»ng h÷u cã nhÇm lÉn kh«ng? Ta kh«ng gi÷ mãn g× cña b»ng h÷u c¶!",0)
	end
end

function view_selected(nType)
	local szTeamList = ""	
	if nType == 1 or nType == 10 then
		for i=1, 31 do
			if gf_GetTaskBit(tTaskByteControl[nType][1],i) ==1 then
				szTeamList = szTeamList..tServerName[i][2]..","
			end
		end
		for i=32,48 do
			if gf_GetTaskBit(tTaskByteControl[nType][2],i-31) == 1 then
				szTeamList = szTeamList..tServerName[i][2]..","
			end
		end
	else
		if gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][2]) > 0 then
			szTeamList = szTeamList..tServerName[gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][2])][2]..","
		end
		if nType ~= 29 and nType ~= 30 then
			if gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][3]) > 0 then
				szTeamList = szTeamList..tServerName[gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][3])][2]..","
			end
		end
		if nType == 19 or nType == 20 then
			if gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][4]) > 0 then
				szTeamList = szTeamList..tServerName[gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][4])][2]..","
			end
			if gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][5]) > 0 then
				szTeamList = szTeamList..tServerName[gf_GetTaskByte(tTaskByteControl[nType][1],tTaskByteControl[nType][5])][2]..","
			end
		end	
	end
	Talk(1,"",szNpcName.."B»ng h÷u ®· chän c¸c ®éi sau:<color=yellow>"..szTeamList.."<color>")
end