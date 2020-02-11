-- Created by TuanNA5
-- 31/05/2010
-- Tµi nguyªn chiÕn

Include("\\script\\newbattles\\newresourcebattle\\newres_head.lua");

szNpcName = "<color=green>Hoµng Trİ th­¬ng nh©n<color>: "

function main()
	local tSay = {
		"Mua dông cô cao cÊp (15 xu vËt phÈm/c¸i)/buy_item_special",
		format("Mua dông cô phå th«ng (10 b¹c%sc¸i)/buy_item_normal","/"),
		"Mua 1 §Êu Hån (gi¸ 35 Xu VËt PhÈm)/#buy_item(5)",
		"Ta kh«ng cÇn thø g×!/do_nothing",	
	}
	Say(szNpcName.."ThiÕu dông cô thu thËp? Ta chuyªn bu«n b¸n c¸c lo¹i dông cô thu thËp tµi nguyªn, gi¸ rÎ bÊt ngê! Ha ha...",getn(tSay),tSay)	
end
function buy_item_special()
	local tSay = {
		"Mua 1 Cuèc Céng C«ng/#buy_item(6)",
		"Mua 1 Bµn Cæ Phñ/#buy_item(7)",
		"Mua 1 L«i ThÇn §ao/#buy_item(8)",
		"Mua 1 Cuèc ThÇn N«ng/#buy_item(9)",
		"Ta kh«ng cÇn thø g×!/do_nothing",	
	}
	Say(szNpcName.."ThiÕu dông cô thu thËp? Ta chuyªn bu«n b¸n c¸c lo¹i dông cô thu thËp tµi nguyªn cao cÊp, gi¸ 15 Xu vËt phÈm 1 c¸i.",getn(tSay),tSay)	
end
function buy_item_normal()
	local tSay = {
		"Mua 1 Cuèc Chim (gi¸ 10 b¹c)/buy_item1",
		"Mua 1 ThiÕt Phñ (gi¸ 10 b¹c)/buy_item2",
		"Mua 1 ChÕ B× §ao (gi¸ 10 b¹c)/buy_item3",
		"Mua 1 Cuèc Thuèc (gi¸ 10 b¹c)/buy_item4",
		"Ta kh«ng cÇn thø g×!/do_nothing",	
	}
	Say(szNpcName.."ThiÕu dông cô thu thËp? Ta chuyªn bu«n b¸n c¸c lo¹i dông cô thu thËp tµi nguyªn, gi¸ rÎ bÊt ngê! Ha ha....",getn(tSay),tSay)	
end
function buy_item(nChoice)
	if nChoice == 5 then
		if GetItemCount(2,1,30230) < 35 then
			Talk(1,"",szNpcName.."Xem ra c¸c h¹ kh«ng cã ®ñ 35 Xu VËt PhÈm!")
			return
		end
		if DelItem(2,1,30230,35) == 1 then
			gf_AddItemEx2(tItem[nChoice][2], "§Êu Hån", "TL TNChien", "Mua tõ Hoµng Trİ th­¬ng nh©n", 3 * 24 * 3600)	
		end	
		WriteLogEx("LOG XU VAT PHAM","Mua ®Êu hån trong TNC")
	end
--	if nChoice  == 1 or nChoice == 2 or nChoice == 3 or nChoice == 4 then
--		if GetCash() < 1000 then
--			Talk(1,"",szNpcName.."Xem ra c¸c h¹ kh«ng cã ®ñ 10 b¹c!")
--			return
--		end
--		if gf_JudgeRoomWeight(1,10,szNpcName) == 0 then
--			return
--		end
--		if Pay(1000) == 1 then
--			gf_AddItemEx(tItem[nChoice][2],tItem[nChoice][1])		
--			WriteLogEx("TL TNChien","Mua tõ Hoµng Trİ th­¬ng nh©n",1,tItem[nChoice][1])
--		end	
--	end
	if nChoice  == 6 or nChoice == 7 or nChoice == 8 or nChoice == 9 then
		if GetItemCount(2,1,30230) < 15 then
			Talk(1,"",szNpcName.."Xem ra c¸c h¹ kh«ng cã ®ñ 15 Xu VËt PhÈm!")
			return
		end
		if gf_JudgeRoomWeight(1,10,szNpcName) == 0 then
			return
		end
		if DelItem(2,1,30230,15) == 1 then
			gf_AddItemEx(tItem[nChoice][2],tItem[nChoice][1])		
			WriteLogEx("TL TNChien","Mua tõ Hoµng Trİ th­¬ng nh©n",1,tItem[nChoice][1])
			WriteLogEx("LOG XU VAT PHAM","Mua "..tItem[nChoice][1].." trong TNC")
		end
	end
	
end
function buy_item1()
	AskClientForNumber("confirm_buy_item1", 1, 50, "Sè l­îng (1-50)")
end
function buy_item2()
	AskClientForNumber("confirm_buy_item2", 1, 50, "Sè l­îng (1-50)")
end
function buy_item3()
	AskClientForNumber("confirm_buy_item3", 1, 50, "Sè l­îng (1-50)")
end
function buy_item4()
	AskClientForNumber("confirm_buy_item4", 1, 50, "Sè l­îng (1-50)")
end
function confirm_buy_item1(nCount)
	local nCash = check_cash(nCount)
	if nCash == 1 then
		Talk(1,"",szNpcName.."Xem ra c¸c h¹ kh«ng cã ®ñ b¹c ®Ó mua "..nCount.." ®¹o cô")
		return
	end
	if gf_JudgeRoomWeight(nCount,nCount*5,szNpcName) == 0 then
		return
	end
	if Pay(nCount*1000) == 1 then
		gf_AddItemEx({0,200,11,nCount},"Cuèc Chim")		
		WriteLogEx("TL TNChien","Mua tõ Hoµng Trİ th­¬ng nh©n",1,"Cuèc Chim")
	end	
end
function confirm_buy_item2(nCount)
	local nCash = check_cash(nCount)
	if nCash == 1 then
		Talk(1,"",szNpcName.."Xem ra c¸c h¹ kh«ng cã ®ñ b¹c ®Ó mua "..nCount.." ®¹o cô")
		return
	end
	if gf_JudgeRoomWeight(nCount,nCount*5,szNpcName) == 0 then
		return
	end
	if Pay(nCount*1000) == 1 then
		gf_AddItemEx({0,200,14,nCount},"ThiÕt Phñ")		
		WriteLogEx("TL TNChien","Mua tõ Hoµng Trİ th­¬ng nh©n",1,"ThiÕt Phñ")
	end	
end
function confirm_buy_item3(nCount)
	local nCash = check_cash(nCount)
	if nCash == 1 then
		Talk(1,"",szNpcName.."Xem ra c¸c h¹ kh«ng cã ®ñ b¹c ®Ó mua "..nCount.." ®¹o cô")
		return
	end
	if gf_JudgeRoomWeight(nCount,nCount*5,szNpcName) == 0 then
		return
	end
	if Pay(nCount*1000) == 1 then
		gf_AddItemEx({0,200,12,nCount},"ChÕ B× §ao")		
		WriteLogEx("TL TNChien","Mua tõ Hoµng Trİ th­¬ng nh©n",1,"ChÕ B× §ao")
	end	
end
function confirm_buy_item4(nCount)
	local nCash = check_cash(nCount)
	if nCash == 1 then
		Talk(1,"",szNpcName.."Xem ra c¸c h¹ kh«ng cã ®ñ b¹c ®Ó mua "..nCount.." ®¹o cô")
		return
	end
	if gf_JudgeRoomWeight(nCount,nCount*5,szNpcName) == 0 then
		return
	end
	if Pay(nCount*1000) == 1 then
		gf_AddItemEx({0,200,16,nCount},"Cuèc Thuèc")		
		WriteLogEx("TL TNChien","Mua tõ Hoµng Trİ th­¬ng nh©n",1,"Cuèc Thuèc")
	end	
end
function check_cash(nCount)
	if GetCash() < nCount*1000 then
		return 1
	end
	return 0
end

function do_nothing()

end