Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua");
Include("\\script\\task\\killer_hall\\killer_hall_head.lua");

szNpcName = "<color=green>§­êng Minh §øc:<color> "

function main()
	local tSay = {}
	local szHeader = szNpcName.."Ta nghe nãi S¸t Thñ §­êng cã rÊt nhiÒu kú tr©n dŞ b¶o do bän Lı §¹i Chñy c­íp ®­îc. Ta rÊt muèn ®i mét chuyÕn ®Ó më mang tÇm m¾t. NÕu ng­¬i  ®em cho ta <color=yellow>1 MÆt n¹ S¸t Thñ §­êng<color> vµ <color=yellow>c¸c lo¹i b¶o r­¬ng<color> trong ®ã th× ta sÏ cho ng­¬i c¸c lo¹i tr¸i c©y quı hiÕm. Ca ca cña ta lµ <color=green>§­êng Minh Thµnh ë TuyÒn Ch©u<color> ®ang cÇn mua nh÷ng tr¸i c©y nµy!"
	
	tinsert(tSay, "Ta ®ång ı!/accept_quest")
	tinsert(tSay, "Sö dông mÆt n¹ S¸t Thñ ®Ó l·nh th­ëng/done_quest")
	tinsert(tSay, "Sö dông 3 mÆt n¹ S¸t Thñ vµ 99 Xu vËt phÈm ®Ó l·nh th­ëng/done_quest1")
	tinsert(tSay, "S¸t Thñ §­êng nguy hiÓm trïng trïng, hÑn khi kh¸c vËy!/do_nothing")
	
	Say(szHeader, getn(tSay), tSay)
end

function accept_quest()
	if GetLevel() < 75 then
		Talk(1, "", szNpcName.."§¼ng cÊp 75 trë lªn míi cã thÓ nhËn nhiÖm vô nµy!")
		return
	end
	if CheckSkill() == 0 then
		Talk(1, "", szNpcName.."Ph¶i häc ®Çy ®ñ vâ c«ng cÊp 55 míi cã thÓ nhËn nhiÖm vô nµy!")
		return
	end
	local nStatus = floor(mod(GetTask(KH_QUEST_TSK), 100)/10)
	if nStatus >= 1 then
		Talk(1, "", szNpcName.."C¸c h¹ ®ang thùc hiÖn nhiÖm vô nªn kh«ng thÓ nhËn thªm nhiÖm vô míi!")
		return
	end

	SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) + 10)
	Msg2Player("§· nhËn nhiÖm vô më r­¬ng!")
	Talk(1, "", szNpcName.."§· nhËn nhiÖm vô më r­¬ng thµnh c«ng, khi nµo thùc hiÖn xong c¸c h¹ h·y t×m ta ®Ó tr¶ nhiÖm vô!")

end

function done_quest()
	local nCount = mod(GetTask(KH_QUEST_TSK), 10)
	local nStatus = floor(mod(GetTask(KH_QUEST_TSK), 100)/10)
	if GetItemCount(2,1,1087) < 1 then
		Talk(1, "", szNpcName.."C¸c h¹ kh«ng mang theo MÆt n¹ S¸t Thñ §­êng nªn kh«ng thÓ tr¶ nhiÖm vô!")
		return
	end
	if nCount >= 4 then
		Talk(1, "", szNpcName.."Mçi ®ît S¸t Thñ §­êng chØ cho phĞp hoµn thµnh nhiÖm vô më r­¬ng 4 lÇn, c¸c h¹ xin vui lßng trë l¹i sau!")
		return
	end
	if nStatus < 2 then
		Talk(1, "", szNpcName.."C¸c h¹ ch­a hoµn thµnh nhiÖm vô sao l¹i ®Õn t×m ta ®ßi phÇn th­ëng!")
		return
	end
	if gf_JudgeRoomWeight(4,100,szNpcName) == 0 then
		return
	end	
	local tExpAward =
	{
		[7] = 5000000,
		[8] = 7500000,
		[9] = 10000000,
	}
		
--	3 lo¹i r­¬ng
	local nType1 = floor(mod(GetTask(KH_QUEST_TSK), 1000)/100)
	local nType2 = floor(mod(GetTask(KH_QUEST_TSK), 10000)/1000)
	local nType3 = floor(mod(GetTask(KH_QUEST_TSK), 100000)/10000)
	
	local nLevel = floor(GetLevel()/10)
	if DelItem(2,1,1087,1) == 1 then
		gf_WriteLogEx("Nhiem vu STD", "nhËn thµnh c«ng", 1, "Tiªu hao 1 mÆt n¹")
		if nType1 ~= 0 then
			SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) - 100)
			--gf_AddItemEx2({2,1,30170,1}, "D©u", "Nhiem vu STD", "nhËn")
			ModifyExp(tExpAward[7])
			Msg2Player("NhËn ®­îc "..tExpAward[7].." ®iÓm kinh nghiÖm!")
			gf_WriteLogEx("Nhiem vu STD", "nhËn "..tExpAward[7].." ®iÓm kinh nghiÖm")
			gf_AddItemEx2({2,1,30164+mod(random(1,1000),20),3}, "Tr¸i c©y", "Nhiem vu STD", "nhËn")
			gf_AddItemEx2({2,1,30498,1}, "Hu©n ch­¬ng dòng sÜ", "Nhiem vu STD", "nhËn")
		--- §iÓm VËn May
--			local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
--			local nExpVM = (nPointVM - 100)/100*tExpAward[7]
--			ModifyExp(nExpVM)
--			if nExpVM > 0 then
--				Msg2Player("B¹n nhËn thªm ".. nExpVM.." ®iÓm kinh nghiÖm tõ vËn may!")
--			else
--				Msg2Player("B¹n bŞ tæn thÊt ".. nExpVM.." ®iÓm kinh nghiÖm do kh«ng may m¾n. H·y ®i gi¶i vËn xui ë ThÇy Bãi Siªu H¹ng!")
--			end
			---------					
		end
		if nType2 ~= 0 then
			SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) - 1000)
			ModifyExp(tExpAward[8])
			Msg2Player("NhËn ®­îc "..tExpAward[8].." ®iÓm kinh nghiÖm!")
			gf_WriteLogEx("Nhiem vu STD", "nhËn "..tExpAward[8].." ®iÓm kinh nghiÖm")
			gf_AddItemEx2({2,1,30164+mod(random(1,1000),20),4}, "Tr¸i c©y", "Nhiem vu STD", "nhËn")
			gf_AddItemEx2({2,1,30498,1}, "Hu©n ch­¬ng dòng sÜ", "Nhiem vu STD", "nhËn")
		--- §iÓm VËn May
--			local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
--			local nExpVM = (nPointVM - 100)/100*tExpAward[8]
--			ModifyExp(nExpVM)
--			if nExpVM > 0 then
--				Msg2Player("B¹n nhËn thªm ".. nExpVM.." ®iÓm kinh nghiÖm tõ vËn may!")
--			else
--				Msg2Player("B¹n bŞ tæn thÊt ".. nExpVM.." ®iÓm kinh nghiÖm do kh«ng may m¾n. H·y ®i gi¶i vËn xui ë ThÇy Bãi Siªu H¹ng!")
--			end
			---------					
		end
		if nType3 ~= 0 then
			SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) - 10000)
			ModifyExp(tExpAward[9])
			Msg2Player("NhËn ®­îc "..tExpAward[9].." ®iÓm kinh nghiÖm!")
			gf_WriteLogEx("Nhiem vu STD", "nhËn "..tExpAward[9].." ®iÓm kinh nghiÖm")
			gf_AddItemEx2({2,1,30164+mod(random(1,1000),20),5}, "Tr¸i c©y", "Nhiem vu STD", "nhËn")
			gf_AddItemEx2({2,1,30498,2}, "Hu©n ch­¬ng dòng sÜ", "Nhiem vu STD", "nhËn")
		--- §iÓm VËn May
--			local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
--			local nExpVM = (nPointVM - 100)/100*tExpAward[9]
--			ModifyExp(nExpVM)
--			if nExpVM > 0 then
--				Msg2Player("B¹n nhËn thªm ".. nExpVM.." ®iÓm kinh nghiÖm tõ vËn may!")
--			else
--				Msg2Player("B¹n bŞ tæn thÊt ".. nExpVM.." ®iÓm kinh nghiÖm do kh«ng may m¾n. H·y ®i gi¶i vËn xui ë ThÇy Bãi Siªu H¹ng!")
--			end
			---------					
		end
		SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) - 20)
		SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) + 1)
	end	
end


function done_quest1()
	local nCount = mod(GetTask(KH_QUEST_TSK), 10)
	local nStatus = floor(mod(GetTask(KH_QUEST_TSK), 100)/10)
	if GetItemCount(2,1,1087) < 3 then
		Talk(1, "", szNpcName.."Tr¶ nhiÖm vô nµy cÇn cã <color=yellow>3<color> mÆt n¹ S¸t Thñ §­êng. C¸c h¹ h·y chuÈn bŞ ®Çy ®ñ!")
		return
	end
	if GetItemCount(2,1,30230) < 99 then
		Talk(1, "", szNpcName.."C¸c h¹ kh«ng mang theo ®ñ Xu vËt phÈm nªn kh«ng thÓ tr¶ nhiÖm vô!")
		return
	end
	if nCount >= 4 then
		Talk(1, "", szNpcName.."Mçi ®ît S¸t Thñ §­êng chØ cho phĞp hoµn thµnh nhiÖm vô më r­¬ng 4 lÇn, c¸c h¹ xin vui lßng trë l¹i sau!")
		return
	end
	if nStatus < 2 then
		Talk(1, "", szNpcName.."C¸c h¹ ch­a hoµn thµnh nhiÖm vô sao l¹i ®Õn t×m ta ®ßi phÇn th­ëng!")
		return
	end
	if gf_JudgeRoomWeight(4,100,szNpcName) == 0 then
		return
	end
	local tExpAward =
	{
		[7] = 10000000,
		[8] = 15000000,
		[9] = 20000000,
	}
		
--	3 lo¹i r­¬ng
	local nType1 = floor(mod(GetTask(KH_QUEST_TSK), 1000)/100)
	local nType2 = floor(mod(GetTask(KH_QUEST_TSK), 10000)/1000)
	local nType3 = floor(mod(GetTask(KH_QUEST_TSK), 100000)/10000)
	
	local nLevel = floor(GetLevel()/10)
	if DelItem(2,1,1087,3) == 1 and  DelItem(2,1,30230,99) == 1 then
		gf_WriteLogEx("Nhiem vu STD", "nhËn thµnh c«ng", 1, "Tiªu hao 3 mÆt n¹ vµ 99 xu")
		if nType1 ~= 0 then
			SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) - 100)
			ModifyExp(tExpAward[7])
			Msg2Player("NhËn ®­îc "..tExpAward[7].." ®iÓm kinh nghiÖm!")
			gf_WriteLogEx("Nhiem vu STD", "nhËn "..tExpAward[7].." ®iÓm kinh nghiÖm")
			gf_AddItemEx2({2,1,30164+mod(random(1,1000),20),6}, "Tr¸i c©y", "Nhiem vu STD", "nhËn")
		--- §iÓm VËn May
--			local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
--			local nExpVM = (nPointVM - 100)/100*tExpAward[7]
--			ModifyExp(nExpVM)
--			if nExpVM > 0 then
--				Msg2Player("B¹n nhËn thªm ".. nExpVM.." ®iÓm kinh nghiÖm tõ vËn may!")
--			else
--				Msg2Player("B¹n bŞ tæn thÊt ".. nExpVM.." ®iÓm kinh nghiÖm do kh«ng may m¾n. H·y ®i gi¶i vËn xui ë ThÇy Bãi Siªu H¹ng!")
--			end
			---------					
		end
		if nType2 ~= 0 then
			SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) - 1000)
			ModifyExp(tExpAward[8])
			Msg2Player("NhËn ®­îc "..tExpAward[8].." ®iÓm kinh nghiÖm!")
			gf_WriteLogEx("Nhiem vu STD", "nhËn "..tExpAward[8].." ®iÓm kinh nghiÖm")
			gf_AddItemEx2({2,1,30164+mod(random(1,1000),20),8}, "Tr¸i c©y", "Nhiem vu STD", "nhËn")
			gf_AddItemEx2({2,1,30499,1}, "Hu©n ch­¬ng anh hïng", "Nhiem vu STD", "nhËn")
		--- §iÓm VËn May
--			local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
--			local nExpVM = (nPointVM - 100)/100*tExpAward[8]
--			ModifyExp(nExpVM)
--			if nExpVM > 0 then
--				Msg2Player("B¹n nhËn thªm ".. nExpVM.." ®iÓm kinh nghiÖm tõ vËn may!")
--			else
--				Msg2Player("B¹n bŞ tæn thÊt ".. nExpVM.." ®iÓm kinh nghiÖm do kh«ng may m¾n. H·y ®i gi¶i vËn xui ë ThÇy Bãi Siªu H¹ng!")
--			end
			---------					
		end
		if nType3 ~= 0 then
			SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) - 10000)
			ModifyExp(tExpAward[9])
			Msg2Player("NhËn ®­îc "..tExpAward[9].." ®iÓm kinh nghiÖm!")
			gf_WriteLogEx("Nhiem vu STD", "nhËn "..tExpAward[9].." ®iÓm kinh nghiÖm")
			gf_AddItemEx2({2,1,30164+mod(random(1,1000),20),10}, "Tr¸i c©y", "Nhiem vu STD", "nhËn")
			gf_AddItemEx2({2,1,30499,1}, "Hu©n ch­¬ng anh hïng", "Nhiem vu STD", "nhËn")	
		--- §iÓm VËn May
--			local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
--			local nExpVM = (nPointVM - 100)/100*tExpAward[9]
--			ModifyExp(nExpVM)
--			if nExpVM > 0 then
--				Msg2Player("B¹n nhËn thªm ".. nExpVM.." ®iÓm kinh nghiÖm tõ vËn may!")
--			else
--				Msg2Player("B¹n bŞ tæn thÊt ".. nExpVM.." ®iÓm kinh nghiÖm do kh«ng may m¾n. H·y ®i gi¶i vËn xui ë ThÇy Bãi Siªu H¹ng!")
--			end
			---------					
		end
		SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) - 20)
		SetTask(KH_QUEST_TSK, GetTask(KH_QUEST_TSK) + 1)
	end	
end

function do_nothing()

end

function CheckSkill()
	local tRouteSkillInfo =
	{
				[0] = 0,
				[1] = 0,
				[2] = 31,
				[3] = 56,
				[4] = 43,
				[5] = 0,
				[6] = 73,
				[7] = 0,
				[8] = 88,
				[9] = 101,
				[10] = 0,
				[11] = 112,
				[12] = 123,
				[13] = 0,
				[14] = 145,
				[15] = 158,
				[16] = 0,
				[17] = 731,
				[18] = 744,
				[19] = 0,
				[20] = 377,
				[21] = 363,
				[23] = 1030,
				[29] = 1176,
				[30] = 1229,
}
	local nRoute = GetPlayerRoute();
	local nSkillID = tRouteSkillInfo[nRoute];
	if nSkillID == 0 then
		return 0
	else
		if GetSkillLevel(nSkillID) >= 7 then
			return 1
		else
			return 0
		end
	end
end